Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43C26FBB1
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:26 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:07 +0530
Message-Id: <20200131173109.12527-8-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] tests/i915_pm_rpm: use device coherent
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Since on new discrete GPUs we dont have the mappable aperture, if that
is acceptable for the test purpose, we should use GEM_MMAP_OFFSET.
Hence using gem_mmap_device_coherent() which wraps the mmap options in
the order of gem_mmap_offset / gem_mmap / mmap_gtt

Incase of fencing/gtt related tests, we mandate the existance of the
mmap_gtt.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/i915_pm_rpm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index f5f813c3d952..9524d7d3a4dd 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1392,8 +1392,8 @@ static void gem_evict_pwrite_subtest(void)
 
 	for (n = 0; n < num_trash_bos; n++) {
 		trash_bos[n].handle = gem_create(drm_fd, 1024*1024);
-		trash_bos[n].ptr = gem_mmap__gtt(drm_fd, trash_bos[n].handle,
-						 1024*1024, PROT_WRITE);
+		trash_bos[n].ptr = gem_mmap__device_coherent(drm_fd, trash_bos[n].handle,
+							     0, 1024*1024, PROT_WRITE);
 		*trash_bos[n].ptr = 0;
 	}
 
@@ -1535,7 +1535,7 @@ static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
 	int i;
 	uint32_t *ptr;
 
-	ptr = gem_mmap__gtt(drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
+	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
 	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
 		ptr[i] = color;
 	igt_assert(munmap(ptr, fb->size) == 0);
@@ -1827,8 +1827,8 @@ static void pm_test_tiling(void)
 		for (j = 0, k = 1 << off_bit;
 		     k <= gtt_obj_max_size; k <<= 1, j++) {
 			handles[j] = gem_create(drm_fd, k);
-			gem_bufs[j] = gem_mmap__gtt(drm_fd, handles[j],
-						    k, PROT_WRITE);
+			gem_bufs[j] = gem_mmap__device_coherent(drm_fd, handles[j],
+								0, k, PROT_WRITE);
 			memset(gem_bufs[j], 0x0, k);
 		}
 
@@ -1872,7 +1872,7 @@ static void pm_test_caching(void)
 
 	handle = gem_create(drm_fd, gtt_obj_max_size);
 	default_cache_level = gem_get_caching(drm_fd, handle);
-	gem_buf = gem_mmap__gtt(drm_fd, handle, gtt_obj_max_size, PROT_WRITE);
+	gem_buf = gem_mmap__device_coherent(drm_fd, handle, 0, gtt_obj_max_size, PROT_WRITE);
 
 	for (i = 0; i < ARRAY_SIZE(cache_levels); i++) {
 		igt_assert(wait_for_suspended());
@@ -2016,8 +2016,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	/* GEM */
 	igt_subtest("gem-mmap-cpu")
 		gem_mmap_subtest(false);
-	igt_subtest("gem-mmap-gtt")
+	igt_subtest("gem-mmap-gtt") {
+		gem_require_mappable_ggtt(drm_fd);
 		gem_mmap_subtest(true);
+	}
 	igt_subtest("gem-pread")
 		gem_pread_subtest();
 	igt_subtest("gem-execbuf")
@@ -2058,10 +2060,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
