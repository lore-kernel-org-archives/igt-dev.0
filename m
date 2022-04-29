Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48D10F664
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 08:54:54 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 29 Apr 2022 14:24:24 +0530
Message-Id: <20220429085425.24568-8-anshuman.gupta@intel.com>
In-Reply-To: <20220429085425.24568-1-anshuman.gupta@intel.com>
References: <20220429085425.24568-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/8] i915_pm_rpm: Extend gem_execbuf test
 with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added d3cold dynamic subtest to gem_execbuf with device class
memory region. It test both D3Cold-{VRAM_SR, Off} by using
d3cold_sr_lmem_threshold i915_params debugfs.

v2:
- Two different subtest d3cold-off and d3cold-vrsr. [Rodrigo]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 1ef76f562..97a84359b 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1342,10 +1342,11 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
 }
 
 /* Make sure we can submit a batch buffer and verify its result. */
-static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions)
+static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_regions, bool d3cold)
 {
 	int x, y;
 	uint32_t handle;
+	struct pci_device *root;
 	int bpp = 4;
 	int pitch = 128 * bpp;
 	int dst_size = 128 * 128 * bpp; /* 128x128 square */
@@ -1367,6 +1368,9 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	memset(cpu_buf, 0, dst_size);
 	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
 
+	if (d3cold)
+		root = setup_d3cold_and_get_root_port();
+
 	/* Now suspend and try it. */
 	disable_all_screens_and_wait(&ms_data);
 
@@ -1375,8 +1379,15 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 		       &presumed_offset);
 	igt_assert(wait_for_suspended());
 
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
+
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
 	igt_assert(wait_for_suspended());
+
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
+
 	for (y = 0; y < 128; y++) {
 		for (x = 0; x < 128; x++) {
 			uint32_t px = cpu_buf[y * 128 + x];
@@ -1415,6 +1426,9 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 
 	disable_all_screens_and_wait(&ms_data);
 
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
+
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
 	for (y = 0; y < 128; y++) {
@@ -2169,9 +2183,27 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("gem-pread")
 		gem_pread_subtest();
 	igt_subtest_with_dynamic("gem-execbuf") {
+		int lmem_threshold;
+
 		for_each_memory_region(r, drm_fd) {
 			igt_dynamic_f("%s", r->name)
-				gem_execbuf_subtest(&r->ci);
+				gem_execbuf_subtest(&r->ci, false);
+
+			if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
+				continue;
+
+			lmem_threshold = get_d3cold_sr_lmem_threshold(debugfs);
+			igt_dynamic_f("%s-%s", "d3cold-off", r->name) {
+				set_d3cold_sr_lmem_threshold(debugfs, 300);
+				gem_execbuf_subtest(&r->ci, true);
+				set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
+			}
+
+			igt_dynamic_f("%s-%s", "d3cold-vrsr", r->name) {
+				set_d3cold_sr_lmem_threshold(debugfs, 0);
+				gem_execbuf_subtest(&r->ci, true);
+				set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
+			}
 		}
 	}
 	igt_subtest("gem-idle")
-- 
2.26.2
