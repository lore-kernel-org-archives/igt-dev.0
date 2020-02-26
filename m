Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5003D6E968
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 13:58:49 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 26 Feb 2020 19:15:08 +0530
Message-Id: <20200226134508.3374-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic: add test to validate
 immutable zpos
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

i915 implements immutable zpos property whereas the existing test
case is written to validate mutable zpos.

Added new test case to validate immutable zpos and skip existing
test case if i915 driver is not detected.

Issue: https://gitlab.freedesktop.org/drm/intel/issues/404
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 120 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 8 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 8462d128..7a5edc8e 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
 }
 
 static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
-                                enum kms_atomic_check_relax relax)
+                         enum kms_atomic_check_relax relax)
 {
 	igt_display_commit2(plane->pipe->display, s);
 	plane_check_current_state(plane, plane->values, relax);
@@ -277,9 +277,9 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
 }
 
 static void
-plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
-			   igt_plane_t *primary, igt_plane_t *overlay,
-			   uint32_t format_primary, uint32_t format_overlay)
+plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
+			           igt_plane_t *primary, igt_plane_t *overlay,
+			           uint32_t format_primary, uint32_t format_overlay)
 {
 	struct igt_fb fb_primary, fb_overlay;
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -358,6 +358,97 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
 }
 
+static void
+plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
+		     igt_output_t *output)
+{
+	cairo_t *cr;
+	int n_planes;
+	uint32_t format;
+	struct igt_fb fb_ref;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, new_crc;
+	igt_plane_t *plane_lower, *plane_upper;
+	uint32_t w_lower, h_lower, w_upper, h_upper;
+
+	n_planes = pipe->n_planes;
+	mode = igt_output_get_mode(output);
+	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	/* for lower plane */
+	w_lower = mode->hdisplay;
+	h_lower = mode->vdisplay;
+
+	/* for upper plane */
+	w_upper = mode->hdisplay / 2;
+	h_upper = mode->vdisplay / 2;
+
+	if (intel_gen(display->drm_fd) == 3)
+		format = DRM_FORMAT_RGB565;
+	else
+		format = DRM_FORMAT_ARGB8888;
+
+	igt_create_color_fb(display->drm_fd,
+			    w_lower, h_lower,
+			    format, I915_TILING_NONE,
+			    0.0, 0.0, 0.0, &fb_ref);
+
+	cr = igt_get_cairo_ctx(display->drm_fd, &fb_ref);
+	igt_assert(cairo_status(cr) == 0);
+	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
+	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.0, 0.0);
+	igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);
+	igt_plane_set_fb(primary, &fb_ref);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* create the pipe_crc object for this pipe */
+	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
+				    INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	/* get reference crc */
+	igt_pipe_crc_start(pipe_crc);
+        igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
+
+	igt_plane_set_fb(primary, NULL);
+
+	for (int i = 0; i < n_planes - 1; i++) {
+		struct igt_fb fb[2];
+		plane_lower = &display->pipes[pipe->pipe].planes[i];
+		plane_upper = &display->pipes[pipe->pipe].planes[i + 1];
+
+		igt_require(igt_plane_has_prop(plane_lower, IGT_PLANE_ZPOS));
+		igt_require(igt_plane_has_prop(plane_upper, IGT_PLANE_ZPOS));
+
+		if ((plane_lower->type == DRM_PLANE_TYPE_CURSOR) ||
+				(plane_upper->type == DRM_PLANE_TYPE_CURSOR))
+			continue;
+
+		igt_create_color_fb(display->drm_fd, w_lower, h_lower,
+				    format, I915_TILING_NONE,
+				    0.0, 0.0, 1.0, &fb[0]);
+
+		igt_create_color_fb(display->drm_fd, w_upper, h_upper,
+				    format, I915_TILING_NONE,
+				    1.0, 1.0, 0.0, &fb[1]);
+
+		igt_plane_set_position(plane_lower, 0, 0);
+		igt_plane_set_fb(plane_lower, &fb[0]);
+
+		igt_plane_set_position(plane_upper, w_upper / 2, h_upper / 2);
+		igt_plane_set_fb(plane_upper, &fb[1]);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_get_current(pipe->display->drm_fd, pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		igt_plane_set_fb(plane_lower, NULL);
+		igt_plane_set_fb(plane_upper, NULL);
+	}
+}
+
 static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -987,14 +1078,20 @@ igt_main
 		plane_primary(pipe_obj, primary, &fb);
 	}
 
-	igt_subtest("plane_primary_overlay_zpos") {
+	igt_subtest("plane_primary_overlay_mutable_zpos") {
+		/*
+		 * Since i915 driver doesn't support mutable zpos;
+		 * skipping.
+		 */
+		igt_require(!is_i915_device(display.drm_fd));
+
 		uint32_t format_primary = DRM_FORMAT_ARGB8888;
 		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
 
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-
 		igt_require(overlay);
+
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
 		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
 
@@ -1002,8 +1099,14 @@ igt_main
 		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
 
 		igt_output_set_pipe(output, pipe);
-		plane_primary_overlay_zpos(pipe_obj, output, primary, overlay,
-					   format_primary, format_overlay);
+		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
+						   format_primary, format_overlay);
+	}
+
+	igt_subtest("plane_immutable_zpos") {
+		igt_require(is_i915_device(display.drm_fd));
+		igt_output_set_pipe(output, pipe);
+		plane_immutable_zpos(&display, pipe_obj, output);
 	}
 
 	igt_subtest("test_only") {
@@ -1011,6 +1114,7 @@ igt_main
 
 		test_only(pipe_obj, primary, output);
 	}
+
 	igt_subtest("plane_cursor_legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
