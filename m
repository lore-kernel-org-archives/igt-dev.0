Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2F76EA51
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 11:05:28 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu,  2 Apr 2020 16:40:49 +0530
Message-Id: <20200402111049.12762-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6] tests/kms_atomic: Add test to validate
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

Added a new sub-test to validate immutable zpos. Test validates
the reported zpos property of plane by making sure only higher
zpos plane covers the lower zpos one (lower plane covers full screen,
upper plane is 64x64).

Only two planes at a time are tested in increasing fashion to avoid
combinatorial explosion. By transitive property,
if (p1, z1) < (p2, z2) and (p2, z2) < (p3, z3) then (p1, z1) < (p3, z3)

where p and z denotes planes and zpos

v2: -Removed intel only checks [Martin]
    -Used XRGB8888 pixel format as used in other IGTs
    -Added documentation [Martin]
    -Removed skip, instead continue if plane doesn't support zpos [Martin]
    -Sorted planes in increasing order of zpos [Martin]
v3: -Fix description [Martin]
    -Avoid sorting [Ankit]
v4: -Change in commit message [Ankit]
    -Few minor changes [Ankit]
v5: -Use igt_assert_lt() and not plain assert [Petri]
    -Changed upper plane to 64x64 [Ville]
    -Removed no-use break condition [Ville]
    -Enabled cursor test testing too, changed pixel format
     to ARGB8888 from XRGB8888 [Ville]
    -New FBs at every iteration is pointless, removed [Martin, Ville]
v6: -Version 5 brought regression to legacy platforms, changed pixel format
     to XRGB8888 and skipped cursor plane validation as of now

TODO: Enable cursor plane validation

Issue: https://gitlab.freedesktop.org/drm/intel/issues/404
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Martin Peres <martin.peres@linux.intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_atomic.c | 161 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 151 insertions(+), 10 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 8462d128..71d01d4c 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
 }
 
 static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
-                                enum kms_atomic_check_relax relax)
+			 enum kms_atomic_check_relax relax)
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
+				   igt_plane_t *primary, igt_plane_t *overlay,
+				   uint32_t format_primary, uint32_t format_overlay)
 {
 	struct igt_fb fb_primary, fb_overlay;
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -320,7 +320,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
 
 	igt_info("Committing with overlay on top, it has a hole "\
-		  "through which the primary should be seen\n");
+		 "through which the primary should be seen\n");
 	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 0);
@@ -346,7 +346,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	igt_put_cairo_ctx(pipe->display->drm_fd, &fb_primary, cr);
 
 	igt_info("Committing with a hole in the primary through "\
-		  "which the underlay should be seen\n");
+		 "which the underlay should be seen\n");
 	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* reset it back to initial state */
@@ -358,6 +358,137 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
 	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
 }
 
+static void
+plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
+		     igt_output_t *output)
+{
+	cairo_t *cr;
+	struct igt_fb fb_ref;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, new_crc;
+	int fb_id_lower, fb_id_upper;
+	int n_planes = pipe->n_planes;
+	igt_plane_t *plane_ptr[n_planes];
+	struct igt_fb fb_lower, fb_upper;
+	uint32_t w_lower, h_lower, w_upper, h_upper;
+
+	igt_require(n_planes >= 2);
+
+	mode = igt_output_get_mode(output);
+	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	/* for lower plane */
+	w_lower = mode->hdisplay;
+	h_lower = mode->vdisplay;
+
+	/* for upper plane */
+	w_upper = 64;
+	h_upper = 64;
+
+	igt_create_color_fb(display->drm_fd,
+			    w_lower, h_lower,
+			    DRM_FORMAT_XRGB8888,
+			    I915_TILING_NONE,
+			    0.0, 0.0, 0.0, &fb_ref);
+
+	/* create reference image */
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
+	igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
+
+	igt_plane_set_fb(primary, NULL);
+
+	for (int k = 0; k < n_planes; k++) {
+		int zpos;
+		igt_plane_t *temp;
+
+		temp = &display->pipes[pipe->pipe].planes[k];
+
+		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
+			continue;
+
+		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
+		igt_assert_lt(zpos, n_planes);
+
+		plane_ptr[zpos] = temp;
+	}
+
+	fb_id_lower = igt_create_color_fb(display->drm_fd,
+					  w_lower, h_lower,
+					  DRM_FORMAT_XRGB8888,
+					  I915_TILING_NONE,
+					  0.0, 0.0, 1.0, &fb_lower);
+	igt_assert(fb_id_lower);
+
+	fb_id_upper = igt_create_color_fb(display->drm_fd,
+					  w_upper, h_upper,
+					  DRM_FORMAT_XRGB8888,
+					  I915_TILING_NONE,
+					  1.0, 1.0, 0.0, &fb_upper);
+	igt_assert(fb_id_upper);
+
+	/*
+	 * checking only pairs of plane in increasing fashion
+	 * to avoid combinatorial explosion
+	 */
+	for (int i = 0; i < n_planes - 1; i++) {
+		igt_plane_t *plane_lower, *plane_upper;
+
+		if (plane_ptr[i] != NULL)
+			plane_lower = plane_ptr[i];
+		else
+			continue;
+
+		while (i  < (n_planes - 1)) {
+			if (plane_ptr[i + 1] != NULL) {
+				plane_upper = plane_ptr[i + 1];
+				break;
+			} else {
+				i++;
+				continue;
+			}
+		}
+
+		if ((plane_upper->type == DRM_PLANE_TYPE_CURSOR) ||
+			(plane_lower->type == DRM_PLANE_TYPE_CURSOR))
+				continue;
+
+		igt_plane_set_position(plane_lower, 0, 0);
+		igt_plane_set_fb(plane_lower, &fb_lower);
+
+		igt_plane_set_position(plane_upper, w_upper / 2, h_upper / 2);
+		igt_plane_set_fb(plane_upper, &fb_upper);
+
+		igt_info("Committing with the plane[%d] underneath "\
+			 "plane[%d]\n", i, (i + 1));
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_get_current(pipe->display->drm_fd, pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		igt_plane_set_fb(plane_lower, NULL);
+		igt_plane_set_fb(plane_upper, NULL);
+	}
+
+	igt_remove_fb(display->drm_fd, &fb_ref);
+	igt_remove_fb(display->drm_fd, &fb_lower);
+	igt_remove_fb(display->drm_fd, &fb_upper);
+}
+
 static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -987,14 +1118,16 @@ igt_main
 		plane_primary(pipe_obj, primary, &fb);
 	}
 
-	igt_subtest("plane_primary_overlay_zpos") {
+	igt_describe("Verify that the overlay plane can cover the primary one (and "\
+		     "vice versa) by changing their zpos property.");
+	igt_subtest("plane_primary_overlay_mutable_zpos") {
 		uint32_t format_primary = DRM_FORMAT_ARGB8888;
 		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
 
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
-
 		igt_require(overlay);
+
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
 		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
 
@@ -1002,8 +1135,15 @@ igt_main
 		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
 
 		igt_output_set_pipe(output, pipe);
-		plane_primary_overlay_zpos(pipe_obj, output, primary, overlay,
-					   format_primary, format_overlay);
+		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
+						   format_primary, format_overlay);
+	}
+
+	igt_describe("Verify the reported zpos property of planes by making sure "\
+		     "only higher zpos planes cover the lower zpos ones.");
+	igt_subtest("plane_immutable_zpos") {
+		igt_output_set_pipe(output, pipe);
+		plane_immutable_zpos(&display, pipe_obj, output);
 	}
 
 	igt_subtest("test_only") {
@@ -1011,6 +1151,7 @@ igt_main
 
 		test_only(pipe_obj, primary, output);
 	}
+
 	igt_subtest("plane_cursor_legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
