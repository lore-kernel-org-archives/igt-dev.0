Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD8B10E1F2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:53:42 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 13:24:06 +0530
Message-Id: <20230918075411.247122-2-swati2.sharma@intel.com>
In-Reply-To: <20230918075411.247122-1-swati2.sharma@intel.com>
References: <20230918075411.247122-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] tests/kms_atomic: cosmetic changes
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

Removed unnecessary newlines. Corrected multi-line comments.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 101 +++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 44 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index d1511716a..951014685 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -74,7 +74,6 @@ static inline int damage_rect_height(struct drm_mode_rect *r)
 	return r->y2 - r->y1;
 }
 
-
 static bool plane_filter(enum igt_atomic_plane_properties prop)
 {
 	if ((1 << prop) & IGT_PLANE_COORD_CHANGED_MASK)
@@ -121,8 +120,10 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
 
 	plane_get_current_state(plane, current_values);
 
-	/* Legacy cursor ioctls create their own, unknowable, internal
-	 * framebuffer which we can't reason about. */
+	/*
+	 * Legacy cursor ioctls create their own, unknowable, internal
+	 * framebuffer which we can't reason about.
+	 */
 	if (relax & PLANE_RELAX_FB)
 		current_values[IGT_PLANE_FB_ID] = values[IGT_PLANE_FB_ID];
 
@@ -188,7 +189,6 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 	if (pipe_values[IGT_CRTC_MODE_ID]) {
 		mode_prop = drmModeGetPropertyBlob(pipe->display->drm_fd,
 						   pipe_values[IGT_CRTC_MODE_ID]);
-
 		igt_assert(mode_prop);
 
 		igt_assert_eq(mode_prop->length,
@@ -220,9 +220,11 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 
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
@@ -475,8 +477,8 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	igt_assert(fb_id_upper);
 
 	/*
-	 * checking only pairs of plane in increasing fashion
-	 * to avoid combinatorial explosion
+	 * Checking only pairs of plane in increasing fashion
+	 * to avoid combinatorial explosion.
 	 */
 	for (int i = 0; i < n_planes - 1; i++) {
 		igt_plane_t *plane_lower, *plane_upper;
@@ -555,8 +557,10 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
 	igt_plane_set_fb(plane, &fb);
 	igt_plane_set_position(plane, w/2, h/2);
 
-	/* Enable the overlay plane using the atomic API, and double-check
-	 * state is what we think it should be. */
+	/*
+	 * Enable the overlay plane using the atomic API, and double-check
+	 * state is what we think it should be.
+	 */
 	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* Disable the plane and check the state matches the old. */
@@ -564,14 +568,18 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
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
@@ -588,8 +596,10 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
 				    fb->drm_format, DRM_FORMAT_MOD_LINEAR,
 				    0.2, 0.2, 0.2, &fb2);
 
-	/* Flip the primary plane using the atomic API, and double-check
-	 * state is what we think it should be. */
+	/*
+	 * Flip the primary plane using the atomic API, and double-check
+	 * state is what we think it should be.
+	 */
 	igt_plane_set_fb(plane, &fb2);
 	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
@@ -597,18 +607,24 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
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
@@ -623,7 +639,8 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
  * Test category: functionality test
  */
 
-/* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
+/*
+ * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
  * free-standing state objects and nothing else.
  */
 static void test_only(igt_pipe_t *pipe_obj,
@@ -703,8 +720,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
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
@@ -714,8 +733,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
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
@@ -724,8 +745,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
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
@@ -1004,8 +1027,10 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
  * Test category: functionality test
  */
 
-/* Abuse the atomic ioctl directly in order to test various invalid conditions,
- * which the libdrm wrapper won't allow us to create. */
+/*
+ * Abuse the atomic ioctl directly in order to test various invalid conditions,
+ * which the libdrm wrapper won't allow us to create.
+ */
 static void atomic_invalid_params(igt_pipe_t *pipe,
 				  igt_plane_t *plane,
 				  igt_output_t *output,
@@ -1088,7 +1113,6 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Valid property, valid value. */
-
 	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
 		props_raw[i] = pipe->props[IGT_CRTC_MODE_ID];
 		values_raw[i] = pipe->values[IGT_CRTC_MODE_ID];
@@ -1227,7 +1251,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 	 * NOTE: This will result in no update on plane as damage is outside, so
 	 * will see no change on the screen.
 	 */
-	/* Reszie fb_1 to be bigger than plane */
+	/* Resize fb_1 to be bigger than plane */
 	igt_remove_fb(pipe->display->drm_fd, &fb_1);
 	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
 			    fb->drm_format, DRM_FORMAT_MOD_LINEAR, 0.2, 0.2, 0.2,
@@ -1390,9 +1414,7 @@ igt_main
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
-
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&display, display.drm_fd);
 		igt_require(display.is_atomic);
 		igt_display_require_output(&display);
@@ -1424,7 +1446,6 @@ igt_main
 	igt_subtest("plane-overlay-legacy") {
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-
 		igt_require(overlay);
 
 		atomic_setup(&display, pipe, output, primary, &fb);
@@ -1435,7 +1456,6 @@ igt_main
 		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-primary-legacy") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_primary(pipe_obj, primary, &fb);
 	}
 
@@ -1491,7 +1511,6 @@ igt_main
 	igt_subtest("plane-cursor-legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
-
 		igt_require(cursor);
 
 		atomic_setup(&display, pipe, output, primary, &fb);
@@ -1501,28 +1520,24 @@ igt_main
 	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest("plane-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
 	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest("plane-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		plane_invalid_params_fence(pipe_obj, output, primary);
 	}
 
 	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest("crtc-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		crtc_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
 	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest("crtc-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
 	}
 
@@ -1531,7 +1546,6 @@ igt_main
 		     "allow us to create.");
 	igt_subtest("atomic-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		atomic_invalid_params(pipe_obj, primary, output, &fb);
 	}
 
@@ -1540,7 +1554,6 @@ igt_main
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
 
 		atomic_setup(&display, pipe, output, primary, &fb);
-
 		atomic_plane_damage(pipe_obj, primary, &fb);
 	}
 
-- 
2.25.1
