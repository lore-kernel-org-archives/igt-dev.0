Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BB010EA96
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 11:08:42 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 16:40:00 +0530
Message-Id: <20220908111000.15929-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic: Test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Removed unnecessary newlines and comments.
Converted subtests to dynamic subtests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 346 ++++++++++++++++++++++-----------------------
 1 file changed, 166 insertions(+), 180 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 253829f2b..0d8f1fb60 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -27,10 +27,6 @@
  *    Pekka Paalanen <pekka.paalanen@collabora.co.uk>
  */
 
-/*
- * Testcase: testing atomic modesetting API
- */
-
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -54,7 +50,7 @@
 #define DRM_CAP_CURSOR_HEIGHT 0x9
 #endif
 
-IGT_TEST_DESCRIPTION("Test atomic modesetting API");
+IGT_TEST_DESCRIPTION("Test atomic modesetting API.");
 
 enum kms_atomic_check_relax {
 	ATOMIC_RELAX_NONE = 0,
@@ -72,7 +68,6 @@ static inline int damage_rect_height(struct drm_mode_rect *r)
 	return r->y2 - r->y1;
 }
 
-
 static bool plane_filter(enum igt_atomic_plane_properties prop)
 {
 	if ((1 << prop) & IGT_PLANE_COORD_CHANGED_MASK)
@@ -84,7 +79,7 @@ static bool plane_filter(enum igt_atomic_plane_properties prop)
 	if (prop == IGT_PLANE_IN_FENCE_FD)
 		return false;
 
-	/* Don't care about other properties */
+	/* don't care about other properties */
 	return true;
 }
 
@@ -119,7 +114,7 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
 
 	plane_get_current_state(plane, current_values);
 
-	/* Legacy cursor ioctls create their own, unknowable, internal
+	/* legacy cursor ioctls create their own, unknowable, internal
 	 * framebuffer which we can't reason about. */
 	if (relax & PLANE_RELAX_FB)
 		current_values[IGT_PLANE_FB_ID] = values[IGT_PLANE_FB_ID];
@@ -145,9 +140,7 @@ static void plane_commit_atomic_err(igt_plane_t *plane,
 	uint64_t current_values[IGT_NUM_PLANE_PROPS];
 
 	plane_get_current_state(plane, current_values);
-
 	igt_assert_eq(-err, igt_display_try_commit2(plane->pipe->display, COMMIT_ATOMIC));
-
 	plane_check_current_state(plane, current_values, relax);
 }
 
@@ -186,7 +179,6 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 	if (pipe_values[IGT_CRTC_MODE_ID]) {
 		mode_prop = drmModeGetPropertyBlob(pipe->display->drm_fd,
 						   pipe_values[IGT_CRTC_MODE_ID]);
-
 		igt_assert(mode_prop);
 
 		igt_assert_eq(mode_prop->length,
@@ -218,7 +210,7 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 
 	crtc_get_current_state(pipe, current_pipe_values);
 
-	/* Optionally relax the check for MODE_ID: using the legacy SetCrtc
+	/* optionally relax the check for MODE_ID: using the legacy SetCrtc
 	 * API can potentially change MODE_ID even if the mode itself remains
 	 * unchanged. */
 	if (relax & CRTC_RELAX_MODE && mode && current_pipe_values[IGT_CRTC_MODE_ID] &&
@@ -226,7 +218,6 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 		drmModePropertyBlobRes *cur_prop =
 			drmModeGetPropertyBlob(pipe->display->drm_fd,
 					       current_pipe_values[IGT_CRTC_MODE_ID]);
-
 		igt_assert(cur_prop);
 		igt_assert_eq(cur_prop->length, sizeof(struct drm_mode_modeinfo));
 
@@ -296,11 +287,11 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	cairo_t *cr;
 
-	/* for primary */
+	/* for primary plane */
 	uint32_t w = mode->hdisplay;
 	uint32_t h = mode->vdisplay;
 
-	/* for overlay */
+	/* for overlay plane */
 	uint32_t w_overlay = mode->hdisplay / 2;
 	uint32_t h_overlay = mode->vdisplay / 2;
 
@@ -313,7 +304,7 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 				    format_overlay, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb_overlay);
 
-	/* Draw a hole in the overlay */
+	/* draw a hole in the overlay */
 	cr = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_overlay);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, w_overlay / 4, h_overlay / 4,
@@ -347,7 +338,7 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 1);
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 0);
 
-	/* Draw a hole in the primary exactly on top of the overlay plane */
+	/* draw a hole in the primary exactly on top of the overlay plane */
 	cr = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_primary);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, w_overlay / 2, h_overlay / 2,
@@ -455,9 +446,8 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 					  1.0, 1.0, 0.0, &fb_upper);
 	igt_assert(fb_id_upper);
 
-	/*
-	 * checking only pairs of plane in increasing fashion
-	 * to avoid combinatorial explosion
+	/* checking only pairs of plane in increasing fashion
+	 * to avoid combinatorial explosion.
 	 */
 	for (int i = 0; i < n_planes - 1; i++) {
 		igt_plane_t *plane_lower, *plane_upper;
@@ -521,22 +511,22 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
 	igt_plane_set_fb(plane, &fb);
 	igt_plane_set_position(plane, w/2, h/2);
 
-	/* Enable the overlay plane using the atomic API, and double-check
+	/* enable the overlay plane using the atomic API, and double-check
 	 * state is what we think it should be. */
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Disable the plane and check the state matches the old. */
+	/* disable the plane and check the state matches the old */
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Re-enable the plane through the legacy plane API, and verify through
+	/* re-enable the plane through the legacy plane API, and verify through
 	 * atomic. */
 	igt_plane_set_fb(plane, &fb);
 	igt_plane_set_position(plane, w/2, h/2);
 	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
 
-	/* Restore the plane to its original settings through the legacy plane
+	/* restore the plane to its original settings through the legacy plane
 	 * API, and verify through atomic. */
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
@@ -554,34 +544,31 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
 				    fb->drm_format, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb2);
 
-	/* Flip the primary plane using the atomic API, and double-check
+	/* flip the primary plane using the atomic API, and double-check
 	 * state is what we think it should be. */
 	igt_plane_set_fb(plane, &fb2);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Restore the primary plane and check the state matches the old. */
+	/* restore the primary plane and check the state matches the old. */
 	igt_plane_set_fb(plane, fb);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Set the plane through the legacy CRTC/primary-plane API, and
+	/* set the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic. */
 	igt_plane_set_fb(plane, &fb2);
 	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
-	/* Restore the plane to its original settings through the legacy CRTC
+	/* restore the plane to its original settings through the legacy CRTC
 	 * API, and verify through atomic. */
 	igt_plane_set_fb(plane, fb);
 	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
-	/* Set the plane through the universal setplane API, and
+	/* set the plane through the universal setplane API, and
 	 * verify through atomic. */
 	igt_plane_set_fb(plane, &fb2);
 	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
 }
 
-/* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
- * free-standing state objects and nothing else.
- */
 static void test_only(igt_pipe_t *pipe_obj,
 		      igt_plane_t *primary,
 		      igt_output_t *output)
@@ -610,13 +597,12 @@ static void test_only(igt_pipe_t *pipe_obj,
 	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Enable the plane through the legacy CRTC/primary-plane API, and
+	/* enable the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic.
 	 */
 	crtc_commit(pipe_obj, primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
-	/* Same for disable.. */
+	/* same for disable.. */
 	plane_get_current_state(primary, old_plane_values);
 	crtc_get_current_state(pipe_obj, old_crtc_values);
 
@@ -633,7 +619,7 @@ static void test_only(igt_pipe_t *pipe_obj,
 	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
 
-	/* And disable the pipe and remove fb, test complete */
+	/* and disable the pipe and remove fb, test complete */
 	crtc_commit(pipe_obj, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 	igt_remove_fb(pipe_obj->display->drm_fd, &fb);
 }
@@ -648,7 +634,7 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 	int x = mode->hdisplay / 2;
 	int y = mode->vdisplay / 2;
 
-	/* Any kernel new enough for atomic, also has the cursor size caps. */
+	/* any kernel new enough for atomic, also has the cursor size caps. */
 	do_or_die(drmGetCap(pipe_obj->display->drm_fd,
 	                    DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(pipe_obj->display->drm_fd,
@@ -659,28 +645,28 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb);
 
-	/* Flip the cursor plane using the atomic API, and double-check
+	/* flip the cursor plane using the atomic API, and double-check
 	 * state is what we think it should be. */
 	igt_plane_set_fb(cursor, &fb);
 	igt_plane_set_position(cursor, x, y);
 	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Restore the cursor plane and check the state matches the old. */
+	/* restore the cursor plane and check the state matches the old. */
 	igt_plane_set_fb(cursor, NULL);
 	igt_plane_set_position(cursor, 0, 0);
 	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Re-enable the plane through the legacy cursor API, and verify
+	/* re-enable the plane through the legacy cursor API, and verify
 	 * through atomic. */
 	igt_plane_set_fb(cursor, &fb);
 	igt_plane_set_position(cursor, x, y);
 	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
 
-	/* Wiggle. */
+	/* wiggle. */
 	igt_plane_set_position(cursor, x - 16, y - 16);
 	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
 
-	/* Restore the plane to its original settings through the legacy cursor
+	/* restore the plane to its original settings through the legacy cursor
 	 * API, and verify through atomic. */
 	igt_plane_set_fb(cursor, NULL);
 	igt_plane_set_position(cursor, 0, 0);
@@ -694,7 +680,7 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 {
 	struct igt_fb fb2;
 
-	/* Pass a series of invalid object IDs for the FB ID. */
+	/* pass a series of invalid object IDs for the FB ID */
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, plane->drm_plane->plane_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -707,14 +693,14 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, pipe->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Valid, but invalid because CRTC_ID is set. */
+	/* valid, but invalid because CRTC_ID is set */
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Pass a series of invalid object IDs for the CRTC ID. */
+	/* pass a series of invalid object IDs for the CRTC ID */
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, plane->drm_plane->plane_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -727,14 +713,14 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, pipe->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Valid, but invalid because FB_ID is set. */
+	/* valid, but invalid because FB_ID is set */
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Create a framebuffer too small for the plane configuration. */
+	/* create a framebuffer too small for the plane configuration */
 	igt_create_pattern_fb(pipe->display->drm_fd,
 			      fb->width - 1, fb->height - 1,
 			      fb->drm_format, I915_TILING_NONE, &fb2);
@@ -742,7 +728,7 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, fb2.fb_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, ENOSPC);
 
-	/* Restore the primary plane and check the state matches the old. */
+	/* restore the primary plane and check the state matches the old */
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
@@ -761,7 +747,7 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
 	igt_plane_set_fence_fd(plane, pipe->display->drm_fd);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Valid fence_fd but invalid CRTC */
+	/* valid fence_fd but invalid CRTC */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, ~0);
@@ -784,7 +770,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 	uint64_t old_mode_id = pipe->values[IGT_CRTC_MODE_ID];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
-	/* Pass a series of invalid object IDs for the mode ID. */
+	/* pass a series of invalid object IDs for the mode ID */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, plane->drm_plane->plane_id);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -797,7 +783,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Can we restore mode? */
+	/* can we restore mode? */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, old_mode_id);
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
 
@@ -810,7 +796,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 				     DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Create a blob which is the wrong size to be a valid mode. */
+	/* create a blob which is the wrong size to be a valid mode */
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) - 1);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -818,7 +804,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
 
-	/* Restore the CRTC and check the state matches the old. */
+	/* restore the CRTC and check the state matches the old */
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
@@ -882,11 +868,11 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 1);
 
-	/* Configuration should be valid again */
+	/* configuration should be valid again */
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
 
-	/* Set invalid prop */
+	/* set invalid prop */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
 
 	/* valid out fence but invalid prop on crtc */
@@ -923,8 +909,6 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	igt_assert(pipe->out_fence_fd != -1);
 }
 
-/* Abuse the atomic ioctl directly in order to test various invalid conditions,
- * which the libdrm wrapper won't allow us to create. */
 static void atomic_invalid_params(igt_pipe_t *pipe,
 				  igt_plane_t *plane,
 				  igt_output_t *output,
@@ -940,7 +924,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 
 	memset(&ioc, 0, sizeof(ioc));
 
-	/* An empty request should do nothing. */
+	/* an empty request should do nothing */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
@@ -957,44 +941,44 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	ioc.props_ptr = (uintptr_t) props_raw;
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
 
-	/* Valid pointers, but still should copy nothing. */
+	/* valid pointers, but still should copy nothing */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Valid noop, but with event set should fail. */
+	/* valid noop, but with event set should fail */
 	ioc.flags = DRM_MODE_PAGE_FLIP_EVENT;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
-	/* Nonsense flags. */
+	/* nonsense flags */
 	ioc.flags = 0xdeadbeef;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
 	ioc.flags = 0;
-	/* Safety check that flags is reset properly. */
+	/* safety check that flags is reset properly */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Reserved/MBZ. */
+	/* reserved/MBZ */
 	ioc.reserved = 1;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 	ioc.reserved = 0;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Zero is not a valid object ID. */
+	/* zero is not a valid object ID */
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Invalid object type (not a thing we can set properties on). */
+	/* invalid object type (not a thing we can set properties on) */
 	ioc.count_objs = 1;
 	obj_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	obj_raw[0] = fb->fb_id;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Filled object but with no properties; no-op. */
+	/* filled object but with no properties; no-op */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		obj_raw[i] = pipe->crtc_id;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Pass in all sorts of things other than the property ID. */
+	/* pass in all sorts of things other than the property ID */
 	num_props_raw[0] = 1;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	props_raw[0] = pipe->crtc_id;
@@ -1006,22 +990,21 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	props_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Valid property, valid value. */
-
+	/* valid property, valid value */
 	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
 		props_raw[i] = pipe->props[IGT_CRTC_MODE_ID];
 		values_raw[i] = pipe->values[IGT_CRTC_MODE_ID];
 	}
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Setting the same thing multiple times is OK. */
+	/* setting the same thing multiple times is OK */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		num_props_raw[i] = ARRAY_SIZE(props_raw) / ARRAY_SIZE(obj_raw);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Pass a series of outlandish addresses. */
+	/* pass a series of outlandish addresses */
 	ioc.objs_ptr = 0;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
@@ -1040,7 +1023,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Attempt to overflow and/or trip various boundary conditions. */
+	/* attempt to overflow and/or trip various boundary conditions */
 	ioc.count_objs = UINT32_MAX / sizeof(uint32_t);
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
@@ -1070,7 +1053,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	struct igt_fb fb_1, fb_2;
 	cairo_t *cr_1, *cr_2;
 
-	/* Color fb with white rect at center */
+	/* color fb with white rect at center */
 	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
 			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
 			    &fb_1);
@@ -1079,15 +1062,12 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			fb->height/2, 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr_1);
 
-	/*
-	 * Flip the primary plane to new color fb using atomic API and check the
-	 * state.
-	 */
+	 /* flip the primary plane to new color fb using atomic API and check the
+	  * state. */
 	igt_plane_set_fb(plane, &fb_1);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Change the color of top left clip from center and issue plane update
+	/* change the color of top left clip from center and issue plane update
 	 * with damage and verify the state.
 	 */
 	damage[0].x1 = 0;
@@ -1106,8 +1086,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Change the color of top left and bottom right clip from center and
+	/* change the color of top left and bottom right clip from center and
 	 * issue plane update with damage and verify the state.
 	 */
 	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
@@ -1133,12 +1112,11 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Issue plane update with damage with a clip outside of plane src.
+	/* issue plane update with damage with a clip outside of plane src.
 	 * NOTE: This will result in no update on plane as damage is outside, so
 	 * will see no change on the screen.
 	 */
-	/* Reszie fb_1 to be bigger than plane */
+	/* reszie fb_1 to be bigger than plane */
 	igt_remove_fb(pipe->display->drm_fd, &fb_1);
 	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
 			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
@@ -1166,8 +1144,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Issue a plane update with damage with a clip that overlap with plane
+	/* issue a plane update with damage with a clip that overlap with plane
 	 * src (Top right from center extending outside src in below case).
 	 * NOTE: Here drm core should take care of intersecting the clip to
 	 * plane src.
@@ -1190,8 +1167,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Issue a plane update with damage with two clips one inside plane src
+	/* issue a plane update with damage with two clips one inside plane src
 	 * and one outside
 	 * NOTE: This will result in plane update with clip inside plane src.
 	 */
@@ -1221,8 +1197,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage) * 2);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/*
-	 * Issue a plane update with overlapping damage clips. White rect in
+	/* issue a plane update with overlapping damage clips. White rect in
 	 * center overlap partially with top left red rect.
 	 * NOTE: Drm core does not error for overlapping damage clips so if any
 	 * driver does not support overlapping should have their own
@@ -1254,17 +1229,19 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 				    sizeof(*damage) * 2);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Restore the primary plane */
+	/* restore the primary plane */
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Remove the fb created for this test */
+	/* remove the fb created for this test */
 	igt_remove_fb(pipe->display->drm_fd, &fb_1);
 	igt_remove_fb(pipe->display->drm_fd, &fb_2);
 }
 
-static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
+static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+			 igt_plane_t *primary, struct igt_fb *fb)
 {
+	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 	igt_plane_set_fb(primary, fb);
 
@@ -1296,9 +1273,7 @@ igt_main
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
-
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&display, display.drm_fd);
 		igt_require(display.is_atomic);
 		igt_display_require_output(&display);
@@ -1308,133 +1283,144 @@ igt_main
 
 		pipe_obj = &display.pipes[pipe];
 		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-
 		mode = igt_output_get_mode(output);
-
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      plane_get_igt_format(primary),
 				      DRM_FORMAT_MOD_LINEAR, &fb);
 	}
 
-	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
-		     "the legacy and atomic interfaces.");
-	igt_subtest("plane-overlay-legacy") {
-		igt_plane_t *overlay =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-
-		igt_require(overlay);
+	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure "
+		     "coherency between the legacy and atomic interfaces.");
+	igt_subtest_with_dynamic("plane-overlay-legacy") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_plane_t *overlay =
+				igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
+			igt_require(overlay);
 
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_overlay(pipe_obj, output, overlay);
+			atomic_setup(&display, pipe, output, primary, &fb);
+			plane_overlay(pipe_obj, output, overlay);
+		}
 	}
 
-	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
-		     "the legacy and atomic interfaces.");
-	igt_subtest("plane-primary-legacy") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		plane_primary(pipe_obj, primary, &fb);
+	igt_describe("Test for KMS atomic modesetting on primary plane and ensure "
+		     "coherency between the legacy and atomic interfaces.");
+	igt_subtest_with_dynamic("plane-primary-legacy") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			plane_primary(pipe_obj, primary, &fb);
+		}
 	}
 
-	igt_describe("Verify that the overlay plane can cover the primary one (and "\
-		     "vice versa) by changing their zpos property.");
-	igt_subtest("plane-primary-overlay-mutable-zpos") {
-		uint32_t format_primary = DRM_FORMAT_ARGB8888;
-		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
+	igt_describe("Test to verify that the overlay plane can cover the primary "
+		     "plane (and vice versa) by changing their zpos property.");
+	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			uint32_t format_primary = DRM_FORMAT_ARGB8888;
+			uint32_t format_overlay = DRM_FORMAT_ARGB1555;
 
-		igt_plane_t *overlay =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-		igt_require(overlay);
+			igt_plane_t *overlay =
+				igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
+			igt_require(overlay);
 
-		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
-		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
+			igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
+			igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
 
-		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
-		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
+			igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
+			igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
 
-		igt_output_set_pipe(output, pipe);
-		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
-						   format_primary, format_overlay);
+			igt_display_reset(&display);
+			igt_output_set_pipe(output, pipe);
+			plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
+							   format_primary, format_overlay);
+		}
 	}
 
-	igt_describe("Verify the reported zpos property of planes by making sure "\
+	igt_describe("Test to verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
-	igt_subtest("plane-immutable-zpos") {
-		igt_output_set_pipe(output, pipe);
-		plane_immutable_zpos(&display, pipe_obj, output);
+	igt_subtest_with_dynamic("plane-immutable-zpos") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_display_reset(&display);
+			igt_output_set_pipe(output, pipe);
+			plane_immutable_zpos(&display, pipe_obj, output);
+		}
 	}
 
-	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
+	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY touches only "
 		     "the free-standing state objects and nothing else.");
-	igt_subtest("test-only") {
-		atomic_clear(&display, pipe, primary, output);
-
-		test_only(pipe_obj, primary, output);
+	igt_subtest_with_dynamic("test-only") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_clear(&display, pipe, primary, output);
+			test_only(pipe_obj, primary, output);
+		}
 	}
 
-	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
-		     "legacy and atomic interfaces.");
-	igt_subtest("plane-cursor-legacy") {
-		igt_plane_t *cursor =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
-
-		igt_require(cursor);
-
-		atomic_setup(&display, pipe, output, primary, &fb);
-		plane_cursor(pipe_obj, output, cursor);
+	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure "
+		     "coherency between legacy and atomic interfaces.");
+	igt_subtest_with_dynamic("plane-cursor-legacy") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_plane_t *cursor =
+				igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
+			igt_require(cursor);
+			atomic_setup(&display, pipe, output, primary, &fb);
+			plane_cursor(pipe_obj, output, cursor);
+		}
 	}
 
-	igt_describe("Test error handling when invalid plane parameters are passed");
-	igt_subtest("plane-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		plane_invalid_params(pipe_obj, output, primary, &fb);
+	igt_describe("Test error handling when invalid plane parameters are passed.");
+	igt_subtest_with_dynamic("plane-invalid-params") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			plane_invalid_params(pipe_obj, output, primary, &fb);
+		}
 	}
 
-	igt_describe("Test error handling when invalid plane fence parameters are passed");
-	igt_subtest("plane-invalid-params-fence") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		plane_invalid_params_fence(pipe_obj, output, primary);
+	igt_describe("Test error handling when invalid plane fence parameters are passed.");
+	igt_subtest_with_dynamic("plane-invalid-params-fence") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			plane_invalid_params_fence(pipe_obj, output, primary);
+		}
 	}
 
-	igt_describe("Test error handling when invalid crtc parameters are passed");
-	igt_subtest("crtc-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		crtc_invalid_params(pipe_obj, output, primary, &fb);
+	igt_describe("Test error handling when invalid crtc parameters are passed.");
+	igt_subtest_with_dynamic("crtc-invalid-params") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			crtc_invalid_params(pipe_obj, output, primary, &fb);
+		}
 	}
 
-	igt_describe("Test error handling when invalid crtc fence parameters are passed");
-	igt_subtest("crtc-invalid-params-fence") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
+	igt_describe("Test error handling when invalid crtc fence parameters are passed.");
+	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
+		}
 	}
 
-	igt_describe("Test abuse the atomic ioctl directly in order to test "
-		     "various invalid conditions which the libdrm wrapper won't "
+	igt_describe("Test abuses the atomic ioctl directly in order to test "
+		     "various invalid conditions which libdrm wrapper won't "
 		     "allow us to create.");
-	igt_subtest("atomic-invalid-params") {
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		atomic_invalid_params(pipe_obj, primary, output, &fb);
+	igt_subtest_with_dynamic("atomic-invalid-params") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			atomic_setup(&display, pipe, output, primary, &fb);
+			atomic_invalid_params(pipe_obj, primary, output, &fb);
+		}
 	}
 
-	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
-	igt_subtest("atomic_plane_damage") {
-		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
-
-		atomic_setup(&display, pipe, output, primary, &fb);
-
-		atomic_plane_damage(pipe_obj, primary, &fb);
+	igt_describe("Test case to use FB_DAMAGE_CLIPS plane property.");
+	igt_subtest_with_dynamic("atomic-plane-damage") {
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+			igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
+			atomic_setup(&display, pipe, output, primary, &fb);
+			atomic_plane_damage(pipe_obj, primary, &fb);
+		}
 	}
 
 	igt_fixture {
 		atomic_clear(&display, pipe, primary, output);
 		igt_remove_fb(display.drm_fd, &fb);
-
 		igt_display_fini(&display);
 	}
 }
-- 
2.25.1
