Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E0A10E1A3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Oct 2023 07:11:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  2 Oct 2023 10:11:03 +0300
Message-ID: <20231002071103.11569-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Remove
 badstride subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The FBC hardware doesn't have any weird stride limitations
since gen4. We had some leftover code in the kernel that thought
otherwise. That code is now gone so any stride the plane
accepts FBC will also now accept. Remove the badstride subtests
as they can no longer do anything sensible.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 127 -------------------------
 1 file changed, 127 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 215ecdeef58d..6526e1c3cffa 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4410,127 +4410,6 @@ static void farfromfence_subtest(const struct test_mode *t)
 	igt_remove_fb(drm.fd, &tall_fb);
 }
 
-static void try_invalid_strides(void)
-{
-	uint32_t gem_handle;
-	int rc;
-
-	/* Sizes that the Kernel shouldn't even allow for tiled */
-	gem_handle = gem_create(drm.fd, 2048);
-
-	/* Smaller than 512, yet still 64-byte aligned. */
-	rc = __gem_set_tiling(drm.fd, gem_handle, I915_TILING_X, 448);
-	igt_assert_eq(rc, -EINVAL);
-
-	/* Bigger than 512, but not 64-byte aligned. */
-	rc = __gem_set_tiling(drm.fd, gem_handle, I915_TILING_X, 1022);
-	igt_assert_eq(rc, -EINVAL);
-
-	/* Just make sure something actually works. */
-	rc = __gem_set_tiling(drm.fd, gem_handle, I915_TILING_X, 1024);
-	igt_assert_eq(rc, 0);
-
-	gem_close(drm.fd, gem_handle);
-}
-
-/**
- * SUBTEST: fbc-badstride
- * Description: Try to use buffers with strides that are not supported
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcdrrs-badstride
- * Description: Try to use buffers with strides that are not supported
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsr-badstride
- * Description: Try to use buffers with strides that are not supported
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- *
- * SUBTEST: fbcpsrdrrs-badstride
- * Description: Try to use buffers with strides that are not supported
- * Driver requirement: i915, xe
- * Functionality: drrs, fbc, fbt, psr
- * Mega feature: General Display Features
- * Test category: functionality test
- */
-
-/**
- * badstride - try to use buffers with strides that are not supported
- *
- * METHOD
- *   First we try to create buffers with strides that are not allowed for tiled
- *   surfaces and assert the Kernel rejects them. Then we create buffers with
- *   strides that are allowed by the Kernel, but that are incompatible with FBC
- *   and we assert that FBC stays disabled after we set a mode on those buffers.
- *
- * EXPECTED RESULTS
- *   The invalid strides are rejected, and the valid strides that are
- *   incompatible with FBC result in FBC disabled.
- *
- * FAILURES
- *   There are two possible places where the Kernel can be broken: either the
- *   code that checks valid strides for tiled buffers or the code that checks
- *   the valid strides for FBC.
- */
-static void badstride_subtest(const struct test_mode *t)
-{
-	struct igt_fb wide_fb, *old_fb;
-	struct modeset_params *params = pick_params(t);
-	int rc;
-
-	if (gem_available_fences(drm.fd))
-		try_invalid_strides();
-
-	prepare_subtest(t, NULL);
-
-	old_fb = params->primary.fb;
-
-	create_fb(t->format, params->primary.fb->width + 4096, params->primary.fb->height,
-		  t->tiling, t->plane, &wide_fb);
-	igt_assert(wide_fb.strides[0] > 16384);
-
-	fill_fb(&wide_fb, COLOR_PRIM_BG);
-
-	/* Try a simple modeset with the new fb. */
-	params->primary.fb = &wide_fb;
-	set_mode_for_params(params);
-	do_assertions(ASSERT_FBC_DISABLED);
-
-	/* Go back to the old fb so FBC works again. */
-	params->primary.fb = old_fb;
-	set_mode_for_params(params);
-	do_assertions(0);
-
-	/* We're doing the equivalent of a modeset, but with the planes API. */
-	params->primary.fb = &wide_fb;
-	set_prim_plane_for_params(params);
-	do_assertions(ASSERT_FBC_DISABLED);
-
-	params->primary.fb = old_fb;
-	set_mode_for_params(params);
-	do_assertions(0);
-
-	/*
-	 * We previously couldn't use the page flip IOCTL to flip to a buffer
-	 * with a different stride. With the atomic page flip helper we can,
-	 * so allow page flip to fail and succeed.
-	 */
-	rc = drmModePageFlip(drm.fd, drm.display.pipes[params->pipe].crtc_id, wide_fb.fb_id, 0, NULL);
-	igt_assert(rc == -EINVAL || rc == 0);
-	do_assertions(rc == 0 ? ASSERT_FBC_DISABLED : 0);
-
-	igt_remove_fb(drm.fd, &wide_fb);
-}
-
 /**
  * SUBTEST: fbc-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
@@ -5255,12 +5134,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 
 		if (t.feature & FEATURE_FBC) {
-			igt_subtest_f("%s-badstride", feature_str(t.feature))
-			{
-				igt_require(igt_draw_supports_method(drm.fd, t.method));
-				badstride_subtest(&t);
-			}
-
 			igt_subtest_f("%s-stridechange", feature_str(t.feature))
 			{
 				igt_require(igt_draw_supports_method(drm.fd, t.method));
-- 
2.41.0
