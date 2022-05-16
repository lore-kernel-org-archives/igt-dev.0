Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD9D10EDF0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 15:13:35 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 20:42:54 +0530
Message-Id: <20220516151255.13153-10-anshuman.gupta@intel.com>
In-Reply-To: <20220516151255.13153-1-anshuman.gupta@intel.com>
References: <20220516151255.13153-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 09/10] i915_pm_rpm: Extend gem_execbuf
 test with D3Cold
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
v3:
- Skip the d3cold-vram-sr test when lmem_threshold is not available.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index b16d616434..a062fde882 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1350,10 +1350,11 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
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
@@ -1375,6 +1376,9 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	memset(cpu_buf, 0, dst_size);
 	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
 
+	if (d3cold)
+		root = setup_d3cold_and_get_root_port();
+
 	/* Now suspend and try it. */
 	disable_all_screens_and_wait(&ms_data);
 
@@ -1383,8 +1387,15 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
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
@@ -1423,6 +1434,9 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 
 	disable_all_screens_and_wait(&ms_data);
 
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
+
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
 	for (y = 0; y < 128; y++) {
@@ -2182,7 +2196,23 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("gem-execbuf") {
 		for_each_memory_region(r, drm_fd) {
 			igt_dynamic_f("%s", r->name)
-				gem_execbuf_subtest(&r->ci);
+				gem_execbuf_subtest(&r->ci, false);
+
+			if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
+				continue;
+
+			igt_dynamic_f("%s-%s", "d3cold-off", r->name) {
+				if (lmem_threshold >= 0)
+					set_d3cold_sr_lmem_threshold(debugfs, 300);
+
+				gem_execbuf_subtest(&r->ci, true);
+			}
+
+			igt_dynamic_f("%s-%s", "d3cold-vrsr", r->name) {
+				igt_require(lmem_threshold >= 0);
+				set_d3cold_sr_lmem_threshold(debugfs, 0);
+				gem_execbuf_subtest(&r->ci, true);
+			}
 		}
 	}
 	igt_subtest("gem-idle")
-- 
2.26.2
