Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E328410E361
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 17:04:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Oct 2022 22:34:40 +0530
Message-Id: <20221012170441.1061-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_atomic: Test cleanup
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

Removed unnecessary newlines and comments.
Sanitize the system state before starting the subtest.

v2: -As thumb rule, all comments should start from uppercase.
    -Corrected multiline comments
v3: -Split patch into 2 patches
    -Avoid skips inside test
    -Cleanup after subtest executes

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 334 +++++++++++++++++++++++++--------------------
 1 file changed, 184 insertions(+), 150 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 253829f2..b352169d 100644
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
@@ -119,8 +114,10 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
 
 	plane_get_current_state(plane, current_values);
 
-	/* Legacy cursor ioctls create their own, unknowable, internal
-	 * framebuffer which we can't reason about. */
+	/*
+	 * Legacy cursor ioctls create their own, unknowable, internal
+	 * framebuffer which we can't reason about.
+	 */
 	if (relax & PLANE_RELAX_FB)
 		current_values[IGT_PLANE_FB_ID] = values[IGT_PLANE_FB_ID];
 
@@ -145,9 +142,7 @@ static void plane_commit_atomic_err(igt_plane_t *plane,
 	uint64_t current_values[IGT_NUM_PLANE_PROPS];
 
 	plane_get_current_state(plane, current_values);
-
 	igt_assert_eq(-err, igt_display_try_commit2(plane->pipe->display, COMMIT_ATOMIC));
-
 	plane_check_current_state(plane, current_values, relax);
 }
 
@@ -186,7 +181,6 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 	if (pipe_values[IGT_CRTC_MODE_ID]) {
 		mode_prop = drmModeGetPropertyBlob(pipe->display->drm_fd,
 						   pipe_values[IGT_CRTC_MODE_ID]);
-
 		igt_assert(mode_prop);
 
 		igt_assert_eq(mode_prop->length,
@@ -218,15 +212,16 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 
 	crtc_get_current_state(pipe, current_pipe_values);
 
-	/* Optionally relax the check for MODE_ID: using the legacy SetCrtc
+	/*
+	 * Optionally relax the check for MODE_ID: using the legacy SetCrtc
 	 * API can potentially change MODE_ID even if the mode itself remains
-	 * unchanged. */
+	 * unchanged.
+	 */
 	if (relax & CRTC_RELAX_MODE && mode && current_pipe_values[IGT_CRTC_MODE_ID] &&
 	    current_pipe_values[IGT_CRTC_MODE_ID] != pipe_values[IGT_CRTC_MODE_ID]) {
 		drmModePropertyBlobRes *cur_prop =
 			drmModeGetPropertyBlob(pipe->display->drm_fd,
 					       current_pipe_values[IGT_CRTC_MODE_ID]);
-
 		igt_assert(cur_prop);
 		igt_assert_eq(cur_prop->length, sizeof(struct drm_mode_modeinfo));
 
@@ -296,11 +291,11 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	cairo_t *cr;
 
-	/* for primary */
+	/* For primary plane */
 	uint32_t w = mode->hdisplay;
 	uint32_t h = mode->vdisplay;
 
-	/* for overlay */
+	/* For overlay plane */
 	uint32_t w_overlay = mode->hdisplay / 2;
 	uint32_t h_overlay = mode->vdisplay / 2;
 
@@ -360,7 +355,7 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 		 "which the underlay should be seen\n");
 	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* reset it back to initial state */
+	/* Reset it back to initial state */
 	igt_plane_set_prop_value(primary, IGT_PLANE_ZPOS, 0);
 	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
 	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
@@ -371,33 +366,28 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
 
 static void
 plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
-		     igt_output_t *output)
+		     igt_output_t *output, igt_plane_t *primary, int n_planes)
 {
 	cairo_t *cr;
 	struct igt_fb fb_ref;
-	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
 	int fb_id_lower, fb_id_upper;
-	int n_planes = pipe->n_planes;
 	igt_plane_t *plane_ptr[n_planes];
 	struct igt_fb fb_lower, fb_upper;
 	uint32_t w_lower, h_lower, w_upper, h_upper;
 
 	memset(plane_ptr, 0, n_planes * sizeof(igt_plane_t *));
 
-	igt_require(n_planes >= 2);
 	igt_require_pipe_crc(display->drm_fd);
-
 	mode = igt_output_get_mode(output);
-	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
-	/* for lower plane */
+	/* For lower plane */
 	w_lower = mode->hdisplay;
 	h_lower = mode->vdisplay;
 
-	/* for upper plane */
+	/* For upper plane */
 	w_upper = 64;
 	h_upper = 64;
 
@@ -407,7 +397,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 			    I915_TILING_NONE,
 			    0.0, 0.0, 0.0, &fb_ref);
 
-	/* create reference image */
+	/* Create reference image */
 	cr = igt_get_cairo_ctx(display->drm_fd, &fb_ref);
 	igt_assert(cairo_status(cr) == 0);
 	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
@@ -416,11 +406,11 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	igt_plane_set_fb(primary, &fb_ref);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	/* create the pipe_crc object for this pipe */
+	/* Create the pipe_crc object for this pipe */
 	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
 				    INTEL_PIPE_CRC_SOURCE_AUTO);
 
-	/* get reference crc */
+	/* Get reference crc */
 	igt_pipe_crc_start(pipe_crc);
 	igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
 
@@ -456,8 +446,8 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	igt_assert(fb_id_upper);
 
 	/*
-	 * checking only pairs of plane in increasing fashion
-	 * to avoid combinatorial explosion
+	 * Checking only pairs of plane in increasing fashion
+	 * to avoid combinatorial explosion.
 	 */
 	for (int i = 0; i < n_planes - 1; i++) {
 		igt_plane_t *plane_lower, *plane_upper;
@@ -521,23 +511,29 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
 	igt_plane_set_fb(plane, &fb);
 	igt_plane_set_position(plane, w/2, h/2);
 
-	/* Enable the overlay plane using the atomic API, and double-check
-	 * state is what we think it should be. */
+	/*
+	 * Enable the overlay plane using the atomic API, and double-check
+	 * state is what we think it should be.
+	 */
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Disable the plane and check the state matches the old. */
+	/* Disable the plane and check the state matches the old */
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Re-enable the plane through the legacy plane API, and verify through
-	 * atomic. */
+	/*
+	 * Re-enable the plane through the legacy plane API, and verify through
+	 * atomic.
+	 */
 	igt_plane_set_fb(plane, &fb);
 	igt_plane_set_position(plane, w/2, h/2);
 	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
 
-	/* Restore the plane to its original settings through the legacy plane
-	 * API, and verify through atomic. */
+	/*
+	 * Restore the plane to its original settings through the legacy plane
+	 * API, and verify through atomic.
+	 */
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
 	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
@@ -554,8 +550,10 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
 				    fb->drm_format, I915_TILING_NONE,
 				    0.2, 0.2, 0.2, &fb2);
 
-	/* Flip the primary plane using the atomic API, and double-check
-	 * state is what we think it should be. */
+	/*
+	 * Flip the primary plane using the atomic API, and double-check
+	 * state is what we think it should be.
+	 */
 	igt_plane_set_fb(plane, &fb2);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
@@ -563,36 +561,35 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
 	igt_plane_set_fb(plane, fb);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Set the plane through the legacy CRTC/primary-plane API, and
-	 * verify through atomic. */
+	/*
+	 * Set the plane through the legacy CRTC/primary-plane API, and
+	 * verify through atomic.
+	 */
 	igt_plane_set_fb(plane, &fb2);
 	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
-	/* Restore the plane to its original settings through the legacy CRTC
-	 * API, and verify through atomic. */
+	/*
+	 * Restore the plane to its original settings through the legacy CRTC
+	 * API, and verify through atomic.
+	 */
 	igt_plane_set_fb(plane, fb);
 	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
-	/* Set the plane through the universal setplane API, and
-	 * verify through atomic. */
+	/*
+	 * Set the plane through the universal setplane API, and
+	 * verify through atomic.
+	 */
 	igt_plane_set_fb(plane, &fb2);
 	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
 }
 
-/* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
- * free-standing state objects and nothing else.
- */
-static void test_only(igt_pipe_t *pipe_obj,
-		      igt_plane_t *primary,
-		      igt_output_t *output)
+static void test_only(igt_pipe_t *pipe_obj, igt_plane_t *primary,
+		      igt_output_t *output, uint32_t format)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
-	uint32_t format = plane_get_igt_format(primary);
 	struct igt_fb fb;
 	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
 
-	igt_require(format != 0);
-
 	plane_get_current_state(primary, old_plane_values);
 	crtc_get_current_state(pipe_obj, old_crtc_values);
 
@@ -606,7 +603,7 @@ static void test_only(igt_pipe_t *pipe_obj,
 
 	igt_display_commit_atomic(pipe_obj->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	/* check the state, should still be old state */
+	/* Check the state, should still be old state */
 	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
 
@@ -625,11 +622,11 @@ static void test_only(igt_pipe_t *pipe_obj,
 
 	igt_display_commit_atomic(pipe_obj->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	/* for extra stress, go through dpms off/on cycle */
+	/* For extra stress, go through dpms off/on cycle */
 	kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_OFF);
 	kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
 
-	/* check the state, should still be old state */
+	/* Check the state, should still be old state */
 	crtc_check_current_state(pipe_obj, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(primary, old_plane_values, ATOMIC_RELAX_NONE);
 
@@ -659,8 +656,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb);
 
-	/* Flip the cursor plane using the atomic API, and double-check
-	 * state is what we think it should be. */
+	/*
+	 * Flip the cursor plane using the atomic API, and double-check
+	 * state is what we think it should be.
+	 */
 	igt_plane_set_fb(cursor, &fb);
 	igt_plane_set_position(cursor, x, y);
 	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
@@ -670,8 +669,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 	igt_plane_set_position(cursor, 0, 0);
 	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Re-enable the plane through the legacy cursor API, and verify
-	 * through atomic. */
+	/*
+	 * Re-enable the plane through the legacy cursor API, and verify
+	 * through atomic.
+	 */
 	igt_plane_set_fb(cursor, &fb);
 	igt_plane_set_position(cursor, x, y);
 	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
@@ -680,8 +681,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 	igt_plane_set_position(cursor, x - 16, y - 16);
 	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
 
-	/* Restore the plane to its original settings through the legacy cursor
-	 * API, and verify through atomic. */
+	/*
+	 * Restore the plane to its original settings through the legacy cursor
+	 * API, and verify through atomic.
+	 */
 	igt_plane_set_fb(cursor, NULL);
 	igt_plane_set_position(cursor, 0, 0);
 	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
@@ -694,7 +697,7 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 {
 	struct igt_fb fb2;
 
-	/* Pass a series of invalid object IDs for the FB ID. */
+	/* Pass a series of invalid object IDs for the FB ID */
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, plane->drm_plane->plane_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -707,14 +710,14 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, pipe->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Valid, but invalid because CRTC_ID is set. */
+	/* Valid, but invalid because CRTC_ID is set */
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Pass a series of invalid object IDs for the CRTC ID. */
+	/* Pass a series of invalid object IDs for the CRTC ID */
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, plane->drm_plane->plane_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -727,14 +730,14 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, pipe->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Valid, but invalid because FB_ID is set. */
+	/* Valid, but invalid because FB_ID is set */
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* Create a framebuffer too small for the plane configuration. */
+	/* Create a framebuffer too small for the plane configuration */
 	igt_create_pattern_fb(pipe->display->drm_fd,
 			      fb->width - 1, fb->height - 1,
 			      fb->drm_format, I915_TILING_NONE, &fb2);
@@ -742,7 +745,7 @@ static void plane_invalid_params(igt_pipe_t *pipe,
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, fb2.fb_id);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, ENOSPC);
 
-	/* Restore the primary plane and check the state matches the old. */
+	/* Restore the primary plane and check the state matches the old */
 	igt_plane_set_fb(plane, fb);
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
@@ -757,7 +760,7 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
 
 	timeline = sw_sync_timeline_create();
 
-	/* invalid fence fd */
+	/* Invalid fence fd */
 	igt_plane_set_fence_fd(plane, pipe->display->drm_fd);
 	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -784,7 +787,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 	uint64_t old_mode_id = pipe->values[IGT_CRTC_MODE_ID];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
-	/* Pass a series of invalid object IDs for the mode ID. */
+	/* Pass a series of invalid object IDs for the mode ID */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, plane->drm_plane->plane_id);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -810,7 +813,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 				     DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* Create a blob which is the wrong size to be a valid mode. */
+	/* Create a blob which is the wrong size to be a valid mode */
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) - 1);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
@@ -818,7 +821,7 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
 
 
-	/* Restore the CRTC and check the state matches the old. */
+	/* Restore the CRTC and check the state matches the old */
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
@@ -837,7 +840,7 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 
 	timeline = sw_sync_timeline_create();
 
-	/* invalid out_fence_ptr */
+	/* Invalid out_fence_ptr */
 	map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
@@ -845,7 +848,7 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
-	/* invalid out_fence_ptr */
+	/* Invalid out_fence_ptr */
 	map = mmap(NULL, PAGE_SIZE, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
@@ -853,7 +856,7 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
-	/* invalid out_fence_ptr */
+	/* Invalid out_fence_ptr */
 	map = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
@@ -861,7 +864,7 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
 	munmap(map, PAGE_SIZE);
 
-	/* valid in fence but not allowed prop on crtc */
+	/* Valid in fence but not allowed prop on crtc */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
 	igt_plane_set_fence_fd(plane, fence_fd);
 
@@ -870,12 +873,12 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 
 	crtc_commit_atomic_flags_err(pipe, plane, 0, ATOMIC_RELAX_NONE, EINVAL);
 
-	/* valid out fence ptr and flip event but not allowed prop on crtc */
+	/* Valid out fence ptr and flip event but not allowed prop on crtc */
 	igt_pipe_request_out_fence(pipe);
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* valid flip event but not allowed prop on crtc */
+	/* Valid flip event but not allowed prop on crtc */
 	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
@@ -889,20 +892,20 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	/* Set invalid prop */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
 
-	/* valid out fence but invalid prop on crtc */
+	/* Valid out fence but invalid prop on crtc */
 	igt_pipe_request_out_fence(pipe);
 	crtc_commit_atomic_flags_err(pipe, plane, 0,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* valid out fence ptr and flip event but invalid prop on crtc */
+	/* Valid out fence ptr and flip event but invalid prop on crtc */
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* valid page flip event but invalid prop on crtc */
+	/* Valid page flip event but invalid prop on crtc */
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	/* successful TEST_ONLY with fences set */
+	/* Successful TEST_ONLY with fences set */
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, old_mode_id);
 	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
@@ -910,21 +913,19 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	close(fence_fd);
 	close(timeline);
 
-	/* reset fences */
+	/* Reset fences */
 	igt_plane_set_fence_fd(plane, -1);
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
 	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
-	/* out fence ptr but not page flip event */
+	/* Out fence ptr but not page flip event */
 	igt_pipe_request_out_fence(pipe);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	igt_assert(pipe->out_fence_fd != -1);
 }
 
-/* Abuse the atomic ioctl directly in order to test various invalid conditions,
- * which the libdrm wrapper won't allow us to create. */
 static void atomic_invalid_params(igt_pipe_t *pipe,
 				  igt_plane_t *plane,
 				  igt_output_t *output,
@@ -932,15 +933,15 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 {
 	igt_display_t *display = pipe->display;
 	struct drm_mode_atomic ioc;
-	uint32_t obj_raw[16]; /* array of objects (sized by count_objs) */
-	uint32_t num_props_raw[16]; /* array of num props per obj (ditto) */
-	uint32_t props_raw[256]; /* array of props (sum of count_props) */
-	uint64_t values_raw[256]; /* array of values for properties (ditto) */
+	uint32_t obj_raw[16]; /* Array of objects (sized by count_objs) */
+	uint32_t num_props_raw[16]; /* Array of num props per obj (ditto) */
+	uint32_t props_raw[256]; /* Array of props (sum of count_props) */
+	uint64_t values_raw[256]; /* Array of values for properties (ditto) */
 	int i;
 
 	memset(&ioc, 0, sizeof(ioc));
 
-	/* An empty request should do nothing. */
+	/* An empty request should do nothing */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
@@ -957,44 +958,44 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	ioc.props_ptr = (uintptr_t) props_raw;
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
 
-	/* Valid pointers, but still should copy nothing. */
+	/* Valid pointers, but still should copy nothing */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Valid noop, but with event set should fail. */
+	/* Valid noop, but with event set should fail */
 	ioc.flags = DRM_MODE_PAGE_FLIP_EVENT;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
-	/* Nonsense flags. */
+	/* Nonsense flags */
 	ioc.flags = 0xdeadbeef;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 
 	ioc.flags = 0;
-	/* Safety check that flags is reset properly. */
+	/* Safety check that flags is reset properly */
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Reserved/MBZ. */
+	/* Reserved/MBZ */
 	ioc.reserved = 1;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
 	ioc.reserved = 0;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Zero is not a valid object ID. */
+	/* Zero is not a valid object ID */
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Invalid object type (not a thing we can set properties on). */
+	/* Invalid object type (not a thing we can set properties on) */
 	ioc.count_objs = 1;
 	obj_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	obj_raw[0] = fb->fb_id;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Filled object but with no properties; no-op. */
+	/* Filled object but with no properties; no-op */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		obj_raw[i] = pipe->crtc_id;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Pass in all sorts of things other than the property ID. */
+	/* Pass in all sorts of things other than the property ID */
 	num_props_raw[0] = 1;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	props_raw[0] = pipe->crtc_id;
@@ -1006,22 +1007,21 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	props_raw[0] = pipe->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
-	/* Valid property, valid value. */
-
+	/* Valid property, valid value */
 	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
 		props_raw[i] = pipe->props[IGT_CRTC_MODE_ID];
 		values_raw[i] = pipe->values[IGT_CRTC_MODE_ID];
 	}
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Setting the same thing multiple times is OK. */
+	/* Setting the same thing multiple times is OK */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
 		num_props_raw[i] = ARRAY_SIZE(props_raw) / ARRAY_SIZE(obj_raw);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 	ioc.count_objs = ARRAY_SIZE(obj_raw);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Pass a series of outlandish addresses. */
+	/* Pass a series of outlandish addresses */
 	ioc.objs_ptr = 0;
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 
@@ -1040,7 +1040,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	ioc.prop_values_ptr = (uintptr_t) values_raw;
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
-	/* Attempt to overflow and/or trip various boundary conditions. */
+	/* Attempt to overflow and/or trip various boundary conditions */
 	ioc.count_objs = UINT32_MAX / sizeof(uint32_t);
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
@@ -1079,10 +1079,10 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 			fb->height/2, 1.0, 1.0, 1.0);
 	igt_put_cairo_ctx(cr_1);
 
-	/*
-	 * Flip the primary plane to new color fb using atomic API and check the
-	 * state.
-	 */
+	 /*
+	  * Flip the primary plane to new color fb using atomic API and check the
+	  * state.
+	  */
 	igt_plane_set_fb(plane, &fb_1);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
@@ -1138,7 +1138,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 * NOTE: This will result in no update on plane as damage is outside, so
 	 * will see no change on the screen.
 	 */
-	/* Reszie fb_1 to be bigger than plane */
+	/* Resize fb_1 to be bigger than plane */
 	igt_remove_fb(pipe->display->drm_fd, &fb_1);
 	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
 			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
@@ -1263,15 +1263,18 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	igt_remove_fb(pipe->display->drm_fd, &fb_2);
 }
 
-static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
+static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+			 igt_plane_t *primary, struct igt_fb *fb)
 {
+	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 	igt_plane_set_fb(primary, fb);
 
 	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
 
-static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *primary, igt_output_t *output)
+static void atomic_clear(igt_display_t *display, enum pipe pipe,
+			 igt_plane_t *primary, igt_output_t *output)
 {
 	igt_plane_t *plane;
 
@@ -1284,6 +1287,28 @@ static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *pr
 	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 }
 
+/* Returns true if plane supports zpos property. */
+static bool has_zpos(igt_plane_t *plane)
+{
+	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
+}
+
+static void do_cleanup_display(igt_display_t *dpy)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	igt_plane_t *plane;
+
+	for_each_pipe(dpy, pipe)
+		for_each_plane_on_pipe(dpy, pipe, plane)
+			igt_plane_set_fb(plane, NULL);
+
+	for_each_connected_output(dpy, output)
+		igt_output_set_pipe(output, PIPE_NONE);
+
+	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
 igt_main
 {
 	igt_display_t display;
@@ -1296,9 +1321,7 @@ igt_main
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
-
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&display, display.drm_fd);
 		igt_require(display.is_atomic);
 		igt_display_require_output(&display);
@@ -1308,9 +1331,7 @@ igt_main
 
 		pipe_obj = &display.pipes[pipe];
 		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-
 		mode = igt_output_get_mode(output);
-
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      plane_get_igt_format(primary),
@@ -1323,54 +1344,67 @@ igt_main
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
 
-		igt_require(overlay);
+		if (!overlay)
+			continue;
 
 		atomic_setup(&display, pipe, output, primary, &fb);
 		plane_overlay(pipe_obj, output, overlay);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
 	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
 		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-primary-legacy") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_primary(pipe_obj, primary, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Verify that the overlay plane can cover the primary one (and "\
+	igt_describe("Test to verify that the overlay plane can cover the primary one (and "\
 		     "vice versa) by changing their zpos property.");
 	igt_subtest("plane-primary-overlay-mutable-zpos") {
-		uint32_t format_primary = DRM_FORMAT_ARGB8888;
-		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
-
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-		igt_require(overlay);
 
-		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
-		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
+		if (!overlay)
+			continue;
 
-		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
-		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
+		if (!has_zpos(primary) || !has_zpos(overlay))
+			continue;
+
+		if (!igt_plane_has_format_mod(primary, DRM_FORMAT_ARGB8888, 0x0) ||
+		    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
+			continue;
 
 		igt_output_set_pipe(output, pipe);
 		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
-						   format_primary, format_overlay);
+						   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
+		do_cleanup_display(&display);
 	}
 
-	igt_describe("Verify the reported zpos property of planes by making sure "\
+	igt_describe("Test to verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
 	igt_subtest("plane-immutable-zpos") {
+		int n_planes = pipe_obj->n_planes;
+
+		if (n_planes < 2)
+			continue;
+
 		igt_output_set_pipe(output, pipe);
-		plane_immutable_zpos(&display, pipe_obj, output);
+		plane_immutable_zpos(&display, pipe_obj, output, primary, n_planes);
+		do_cleanup_display(&display);
 	}
 
 	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
 		     "the free-standing state objects and nothing else.");
 	igt_subtest("test-only") {
-		atomic_clear(&display, pipe, primary, output);
+		uint32_t format = plane_get_igt_format(primary);
+
+		if (!format)
+			continue;
 
-		test_only(pipe_obj, primary, output);
+		atomic_clear(&display, pipe, primary, output);
+		test_only(pipe_obj, primary, output, format);
 	}
 
 	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
@@ -1379,38 +1413,40 @@ igt_main
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
 
-		igt_require(cursor);
+		if (!cursor)
+			continue;
 
 		atomic_setup(&display, pipe, output, primary, &fb);
 		plane_cursor(pipe_obj, output, cursor);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Test error handling when invalid plane parameters are passed");
+	igt_describe("Test error handling when invalid plane parameters are passed.");
 	igt_subtest("plane-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_invalid_params(pipe_obj, output, primary, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Test error handling when invalid plane fence parameters are passed");
+	igt_describe("Test error handling when invalid plane fence parameters are passed.");
 	igt_subtest("plane-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_invalid_params_fence(pipe_obj, output, primary);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Test error handling when invalid crtc parameters are passed");
+	igt_describe("Test error handling when invalid crtc parameters are passed.");
 	igt_subtest("crtc-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		crtc_invalid_params(pipe_obj, output, primary, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Test error handling when invalid crtc fence parameters are passed");
+	igt_describe("Test error handling when invalid crtc fence parameters are passed.");
 	igt_subtest("crtc-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
 	igt_describe("Test abuse the atomic ioctl directly in order to test "
@@ -1418,23 +1454,21 @@ igt_main
 		     "allow us to create.");
 	igt_subtest("atomic-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		atomic_invalid_params(pipe_obj, primary, output, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
-	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
-	igt_subtest("atomic_plane_damage") {
-		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
+	igt_describe("Test case to use FB_DAMAGE_CLIPS plane property.");
+	igt_subtest("atomic-plane-damage") {
+		if (!igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS))
+			continue;
 
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		atomic_plane_damage(pipe_obj, primary, &fb);
+		atomic_clear(&display, pipe, primary, output);
 	}
 
 	igt_fixture {
-		atomic_clear(&display, pipe, primary, output);
-		igt_remove_fb(display.drm_fd, &fb);
-
 		igt_display_fini(&display);
 	}
 }
-- 
2.25.1
