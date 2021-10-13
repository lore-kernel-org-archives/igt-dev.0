Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79016E0E1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 17:08:56 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 13 Oct 2021 22:40:51 +0530
Message-Id: <20211013171051.26287-4-jeevan.b@intel.com>
In-Reply-To: <20211013171051.26287-1-jeevan.b@intel.com>
References: <20211013171051.26287-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/kms_atomic: Add a new test
 case for FB_DAMAGE_CLIPS plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, jose.souza@intel.com, daniel@ffwll.ch, Deepak Rawat <drawat@vmware.com>, Jeevan B <jeevan.b@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Deepak Rawat <drawat@vmware.com>

Some simple test cases to use FB_DAMAGE_CLIPS plane property.

Signed-off-by: Deepak Rawat <drawat@vmware.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_atomic.c | 232 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 3a0f76d9..08baf8f0 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -62,6 +62,25 @@ enum kms_atomic_check_relax {
 	PLANE_RELAX_FB = (1 << 1)
 };
 
+/* signed32 drm_mode_rect declared here for use with drm damage for page-flip */
+struct damage_rect {
+	int x1;
+	int y1;
+	int x2;
+	int y2;
+};
+
+static inline int damage_rect_width(struct damage_rect *r)
+{
+	return r->x2 - r->x1;
+}
+
+static inline int damage_rect_height(struct damage_rect *r)
+{
+	return r->y2 - r->y1;
+}
+
+
 static bool plane_filter(enum igt_atomic_plane_properties prop)
 {
 	if ((1 << prop) & IGT_PLANE_COORD_CHANGED_MASK)
@@ -1060,6 +1079,210 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
 }
 
+static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
+{
+	struct damage_rect *damage;
+	struct igt_fb fb_1, fb_2;
+	cairo_t *cr_1, *cr_2;
+
+	damage = malloc(sizeof(*damage) * 2);
+	igt_assert(damage);
+
+	/* Color fb with white rect at center */
+	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
+			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+			    &fb_1);
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	igt_paint_color(cr_1, fb->width/4, fb->height/4, fb->width/2,
+			fb->height/2, 1.0, 1.0, 1.0);
+	igt_put_cairo_ctx(cr_1);
+
+	/*
+	 * Flip the primary plane to new color fb using atomic API and check the
+	 * state.
+	 */
+	igt_plane_set_fb(plane, &fb_1);
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Change the color of top left clip from center and issue plane update
+	 * with damage and verify the state.
+	 */
+	damage[0].x1 = 0;
+	damage[0].y1 = 0;
+	damage[0].x2 = fb->width/2;
+	damage[0].y2 = fb->height/2;
+
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 1.0, 0, 0);
+	igt_put_cairo_ctx(cr_1);
+
+	igt_plane_set_fb(plane, &fb_1);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage));
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Change the color of top left and bottom right clip from center and
+	 * issue plane update with damage and verify the state.
+	 */
+	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
+			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+			    &fb_2);
+
+	damage[0].x1 = fb->width/2;
+	damage[0].y1 = 0;
+	damage[0].x2 = fb->width;
+	damage[0].y2 = fb->height/2;
+
+	cr_2 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_2);
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
+	cairo_paint(cr_2);
+	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 0, 1.0, 0);
+	igt_put_cairo_ctx(cr_1);
+	igt_put_cairo_ctx(cr_2);
+	igt_plane_set_fb(plane, &fb_2);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage));
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Issue plane update with damage with a clip outside of plane src.
+	 * NOTE: This will result in no update on plane as damage is outside, so
+	 * will see no change on the screen.
+	 */
+	/* Reszie fb_1 to be bigger than plane */
+	igt_remove_fb(pipe->display->drm_fd, &fb_1);
+	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
+			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
+			    &fb_1);
+
+	damage[0].x1 = fb->width;
+	damage[0].y1 = 0;
+	damage[0].x2 = fb->width + fb->width/2;
+	damage[0].y2 = fb->height/2;
+
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	cr_2 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_2);
+	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
+	cairo_paint(cr_1);
+	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 0, 1.0, 0);
+	igt_put_cairo_ctx(cr_2);
+	igt_put_cairo_ctx(cr_1);
+	igt_plane_set_fb(plane, &fb_1);
+	igt_plane_set_size(plane, fb->width, fb->height);
+	igt_fb_set_position(&fb_1, plane, 0, 0);
+	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage));
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Issue a plane update with damage with a clip that overlap with plane
+	 * src (Top right from center extending outside src in below case).
+	 * NOTE: Here drm core should take care of intersecting the clip to
+	 * plane src.
+	 */
+	damage[0].x1 = fb->width/2;
+	damage[0].y1 = 0;
+	damage[0].x2 = fb->width/2 + fb->width;
+	damage[0].y2 = fb->height/2;
+
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
+	igt_put_cairo_ctx(cr_1);
+	igt_plane_set_fb(plane, &fb_1);
+	igt_plane_set_size(plane, fb->width, fb->height);
+	igt_fb_set_position(&fb_1, plane, 0, 0);
+	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage));
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Issue a plane update with damage with two clips one inside plane src
+	 * and one outside
+	 * NOTE: This will result in plane update with clip inside plane src.
+	 */
+	damage[0].x1 = 0;
+	damage[0].y1 = fb->height/2;
+	damage[0].x2 = fb->width/2;
+	damage[0].y2 = fb->height;
+
+	damage[1].x1 = fb->width + fb->width/2;
+	damage[1].y1 = fb->height/2;
+	damage[1].x2 = fb->width * 2;
+	damage[1].y2 = fb->height;
+
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
+	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
+			damage_rect_width(&damage[1]),
+			damage_rect_height(&damage[1]), 0, 1.0, 0);
+	igt_put_cairo_ctx(cr_1);
+	igt_plane_set_fb(plane, &fb_1);
+	igt_plane_set_size(plane, fb->width, fb->height);
+	igt_fb_set_position(&fb_1, plane, 0, 0);
+	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage) * 2);
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/*
+	 * Issue a plane update with overlapping damage clips. White rect in
+	 * center overlap partially with top left red rect.
+	 * NOTE: Drm core does not error for overlapping damage clips so if any
+	 * driver does not support overlapping should have their own
+	 * validations.
+	 */
+	damage[0].x1 = 0;
+	damage[0].y1 = 0;
+	damage[0].x2 = fb->width/2;
+	damage[0].y2 = fb->height/2;
+
+	damage[1].x1 = fb->width/4;
+	damage[1].y1 = fb->height/4;
+	damage[1].x2 = fb->width/4 + fb->width/2;
+	damage[1].y2 = fb->height/4 + fb->height/2;
+
+	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
+	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
+			damage_rect_width(&damage[0]),
+			damage_rect_height(&damage[0]), 1.0, 0, 0);
+	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
+			damage_rect_width(&damage[1]),
+			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
+	igt_put_cairo_ctx(cr_1);
+	igt_plane_set_fb(plane, &fb_1);
+	igt_plane_set_size(plane, fb->width, fb->height);
+	igt_fb_set_position(&fb_1, plane, 0, 0);
+	igt_fb_set_size(&fb_1, plane, fb->width, fb->height);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
+				    sizeof(*damage) * 2);
+	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/* Restore the primary plane */
+	igt_plane_set_fb(plane, fb);
+	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+
+	/* Remove the fb created for this test */
+	igt_remove_fb(pipe->display->drm_fd, &fb_1);
+	igt_remove_fb(pipe->display->drm_fd, &fb_2);
+
+	free(damage);
+}
+
 static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
 {
 	igt_output_set_pipe(output, pipe);
@@ -1219,6 +1442,15 @@ igt_main
 		atomic_invalid_params(pipe_obj, primary, output, &fb);
 	}
 
+	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
+	igt_subtest("atomic_plane_damage") {
+		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
+
+		atomic_setup(&display, pipe, output, primary, &fb);
+
+		atomic_plane_damage(pipe_obj, primary, &fb);
+	}
+
 	igt_fixture {
 		atomic_clear(&display, pipe, primary, output);
 		igt_remove_fb(display.drm_fd, &fb);
-- 
2.19.1
