Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E556E875
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2020 05:45:19 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue, 10 Mar 2020 22:44:02 -0700
Message-Id: <b5b2e573ecc9e1c9acb0ee39684508ef1ca47e69.1583905340.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915_pm_rpm: use device coherent
 mapping instead of mmap_gtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Since on new discrete GPUs we dont have the mappable aperture, if that
is acceptable for the test purpose, we should use GEM_MMAP_OFFSET.
Hence using gem_mmap_device_coherent() which wraps the mmap options in
the order of gem_mmap_offset / gem_mmap / mmap_gtt

In case of fencing/gtt related tests, we mandate the existance of the
mmap_gtt.

v2:
  3 tests are skipped based on mappable aperture and tiling support

v3: check for fences before enabling tiling (Ashutosh)

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off--by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/i915_pm_rpm.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9118e8953..d05bf6ac2 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1559,7 +1559,7 @@ static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
 	int i;
 	uint32_t *ptr;
 
-	ptr = gem_mmap__gtt(drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
 	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
 		ptr[i] = color;
 	igt_assert(munmap(ptr, fb->size) == 0);
@@ -1629,7 +1629,9 @@ static void cursor_subtest(bool dpms)
 	 * hopefully it has some fences around it. */
 	rc = drmModeRmFB(drm_fd, cursor_fb3.fb_id);
 	igt_assert_eq(rc, 0);
-	gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false, cursor_fb3.strides[0]);
+	if (gem_available_fences(drm_fd))
+		gem_set_tiling(drm_fd, cursor_fb3.gem_handle, false,
+			       cursor_fb3.strides[0]);
 	igt_assert(wait_for_suspended());
 
 	rc = drmModeSetCursor(drm_fd, crtc_id, cursor_fb3.gem_handle,
@@ -2051,8 +2053,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_execbuf_subtest();
 	igt_subtest("gem-idle")
 		gem_idle_subtest();
-	igt_subtest("gem-evict-pwrite")
+	igt_subtest("gem-evict-pwrite") {
+		gem_require_mappable_ggtt(drm_fd);
 		gem_evict_pwrite_subtest();
+	}
 
 	/* Planes and cursors */
 	igt_subtest("cursor")
@@ -2085,10 +2089,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		dpms_mode_unset_subtest(SCREEN_TYPE_LPSP);
 	igt_subtest("dpms-mode-unset-non-lpsp")
 		dpms_mode_unset_subtest(SCREEN_TYPE_NON_LPSP);
-	igt_subtest("fences")
+	igt_subtest("fences") {
+		gem_require_mappable_ggtt(drm_fd);
 		fences_subtest(false);
-	igt_subtest("fences-dpms")
+	}
+	igt_subtest("fences-dpms") {
+		gem_require_mappable_ggtt(drm_fd);
 		fences_subtest(true);
+	}
 
 	/* Modeset stress */
 	igt_subtest("modeset-lpsp-stress")
@@ -2129,10 +2137,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA);
 
 	/* power-wake reference tests */
-	igt_subtest("pm-tiling")
+	igt_subtest("pm-tiling") {
+		gem_require_mappable_ggtt(drm_fd);
 		pm_test_tiling();
-	igt_subtest("pm-caching")
+	}
+	igt_subtest("pm-caching") {
+		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
+	}
 
 	igt_fixture
 		teardown_environment();
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
