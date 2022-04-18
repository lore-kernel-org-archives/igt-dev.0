Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440F910E172
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 12:51:24 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Apr 2022 18:20:48 +0530
Message-Id: <20220418125048.7969-10-anshuman.gupta@intel.com>
In-Reply-To: <20220418125048.7969-1-anshuman.gupta@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 9/9] i915_pm_rpm: Extend gem-mmap-type test
 with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added d3cold dynamic subtest to gem-mmap-type with device class
memory region. It test both D3Cold-{VRAM_SR, Off} by using
d3cold_sr_lmem_threshold i915_params debugfs.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 414797bc8..2ef8e53a8 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1123,11 +1123,12 @@ static struct pci_device *setup_d3cold_and_get_root_port(void)
 }
 
 static void gem_mmap_args(const struct mmap_offset *t,
-			  struct drm_i915_gem_memory_class_instance *mem_regions)
+			  struct drm_i915_gem_memory_class_instance *mem_regions, bool d3cold)
 {
 	int i;
 	uint32_t handle;
 	int buf_size = 8192;
+	struct pci_device *root;
 	uint8_t *gem_buf;
 
 	/* Create, map and set data while the device is active. */
@@ -1145,16 +1146,25 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
+	if (d3cold)
+		root = setup_d3cold_and_get_root_port();
+
 	/* Now suspend, read and modify. */
 	disable_all_screens_and_wait(&ms_data);
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 	igt_assert(wait_for_suspended());
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	for (i = 0; i < buf_size; i++)
 		gem_buf[i] = (~i & 0xFF);
 	igt_assert(wait_for_suspended());
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	/* Now resume and see if it's still there. */
 	enable_one_screen_and_wait(&ms_data);
@@ -1166,12 +1176,16 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	/* Now the opposite: suspend, and try to create the mmap while
 	 * suspended. */
 	disable_all_screens_and_wait(&ms_data);
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
 	igt_require(gem_buf);
 
 	igt_assert(wait_for_suspended());
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	for (i = 0; i < buf_size; i++)
 		gem_buf[i] = i & 0xFF;
@@ -1180,6 +1194,8 @@ static void gem_mmap_args(const struct mmap_offset *t,
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	igt_assert(wait_for_suspended());
+	if (d3cold)
+		igt_assert(wait_for_d3cold(root));
 
 	/* Resume and check if it's still there. */
 	enable_one_screen_and_wait(&ms_data);
@@ -2173,7 +2189,18 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		for_each_mmap_offset_type(drm_fd, t) {
 			for_each_memory_region(r, drm_fd) {
 				igt_dynamic_f("%s-%s", t->name, r->name)
-				gem_mmap_args(t, &r->ci);
+				gem_mmap_args(t, &r->ci, false);
+				if (r->ci.memory_class == I915_MEMORY_CLASS_SYSTEM)
+					continue;
+				igt_dynamic_f("%s-%s-%s", t->name, "d3cold", r->name) {
+					int lmem_threshold;
+
+					lmem_threshold = get_d3cold_sr_lmem_threshold(debugfs);
+					gem_mmap_args(t, &r->ci, true);
+					set_d3cold_sr_lmem_threshold(debugfs, 0);
+					gem_mmap_args(t, &r->ci, true);
+					set_d3cold_sr_lmem_threshold(debugfs, lmem_threshold);
+				}
 			}
 		}
 	}
-- 
2.26.2
