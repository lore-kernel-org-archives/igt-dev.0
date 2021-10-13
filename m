Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656916EA60
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 12:59:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:44 +0300
Message-Id: <20211013125949.19373-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] tests/i915/kms_frontbuffer_tracking:
 Get rid of the funny mode_copy
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For some reason we make a copy of the mode into 'mode_copy', and
then point the 'mode' pointer at that copy. Get rid of the pointer
and just use the struct directly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 69 +++++++++++++--------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 4ae5286661bb..d8f08c147861 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -264,7 +264,7 @@ struct {
 struct modeset_params {
 	enum pipe pipe;
 	igt_output_t *output;
-	drmModeModeInfo mode_copy, *mode;
+	drmModeModeInfo mode;
 
 	struct fb_region primary;
 	struct fb_region cursor;
@@ -357,8 +357,7 @@ static void init_mode_params(struct modeset_params *params,
 
 	params->pipe = pipe;
 	params->output = output;
-	params->mode_copy = *mode;
-	params->mode = &params->mode_copy;
+	params->mode = *mode;
 
 	params->primary.plane = igt_pipe_get_plane_type(&drm.display.pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
 	params->primary.fb = NULL;
@@ -617,12 +616,12 @@ static void create_shared_fb(enum pixel_format format, enum tiling_type tiling)
 	int prim_w, prim_h, scnd_w, scnd_h, offs_w, offs_h, big_w, big_h;
 	struct screen_fbs *s = &fbs[format];
 
-	prim_w = prim_mode_params.mode->hdisplay;
-	prim_h = prim_mode_params.mode->vdisplay;
+	prim_w = prim_mode_params.mode.hdisplay;
+	prim_h = prim_mode_params.mode.vdisplay;
 
 	if (scnd_mode_params.output) {
-		scnd_w = scnd_mode_params.mode->hdisplay;
-		scnd_h = scnd_mode_params.mode->vdisplay;
+		scnd_w = scnd_mode_params.mode.hdisplay;
+		scnd_h = scnd_mode_params.mode.vdisplay;
 	} else {
 		scnd_w = 0;
 		scnd_h = 0;
@@ -670,8 +669,8 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 
 	s->initialized = true;
 
-	create_fb(format, prim_mode_params.mode->hdisplay,
-		  prim_mode_params.mode->vdisplay, tiling, PLANE_PRI,
+	create_fb(format, prim_mode_params.mode.hdisplay,
+		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
 		  &s->prim_pri);
 	create_fb(format, prim_mode_params.cursor.w,
 		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_LINEAR,
@@ -687,8 +686,8 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 	if (!scnd_mode_params.output)
 		return;
 
-	create_fb(format, scnd_mode_params.mode->hdisplay,
-		  scnd_mode_params.mode->vdisplay, tiling, PLANE_PRI,
+	create_fb(format, scnd_mode_params.mode.hdisplay,
+		  scnd_mode_params.mode.vdisplay, tiling, PLANE_PRI,
 		  &s->scnd_pri);
 	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
 		  DRM_FORMAT_MOD_LINEAR, PLANE_CUR, &s->scnd_cur);
@@ -700,16 +699,16 @@ static void __set_prim_plane_for_params(struct modeset_params *params)
 {
 	igt_plane_set_fb(params->primary.plane, params->primary.fb);
 	igt_plane_set_position(params->primary.plane, 0, 0);
-	igt_plane_set_size(params->primary.plane, params->mode->hdisplay, params->mode->vdisplay);
+	igt_plane_set_size(params->primary.plane, params->mode.hdisplay, params->mode.vdisplay);
 	igt_fb_set_position(params->primary.fb, params->primary.plane,
 			    params->primary.x, params->primary.y);
 	igt_fb_set_size(params->primary.fb, params->primary.plane,
-			params->mode->hdisplay, params->mode->vdisplay);
+			params->mode.hdisplay, params->mode.vdisplay);
 }
 
 static void __set_mode_for_params(struct modeset_params *params)
 {
-	igt_output_override_mode(params->output, params->mode);
+	igt_output_override_mode(params->output, &params->mode);
 	igt_output_set_pipe(params->output, params->pipe);
 
 	__set_prim_plane_for_params(params);
@@ -1212,14 +1211,14 @@ static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
 	if (blue_crcs[format].initialized)
 		return;
 
-	create_fb(format, prim_mode_params.mode->hdisplay,
-		  prim_mode_params.mode->vdisplay, tiling, PLANE_PRI,
+	create_fb(format, prim_mode_params.mode.hdisplay,
+		  prim_mode_params.mode.vdisplay, tiling, PLANE_PRI,
 		  &blue);
 
 	fill_fb(&blue, COLOR_PRIM_BG);
 
 	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-	igt_output_override_mode(prim_mode_params.output, prim_mode_params.mode);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
 	igt_plane_set_fb(prim_mode_params.primary.plane, &blue);
 	igt_display_commit(&drm.display);
 
@@ -1252,8 +1251,8 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 				       sizeof(*(pattern->crcs[format])));
 
 	for (r = 0; r < pattern->n_rects; r++)
-		create_fb(format, prim_mode_params.mode->hdisplay,
-			  prim_mode_params.mode->vdisplay, tiling,
+		create_fb(format, prim_mode_params.mode.hdisplay,
+			  prim_mode_params.mode.vdisplay, tiling,
 			  PLANE_PRI, &tmp_fbs[r]);
 
 	for (r = 0; r < pattern->n_rects; r++)
@@ -1271,7 +1270,7 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 	}
 
 	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
-	igt_output_override_mode(prim_mode_params.output, prim_mode_params.mode);
+	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
 	for (r = 0; r < pattern->n_rects; r++) {
 		igt_plane_set_fb(prim_mode_params.primary.plane, &tmp_fbs[r]);
 		igt_display_commit(&drm.display);
@@ -1705,15 +1704,13 @@ static void update_modeset_cached_params(void)
 	found = igt_override_all_active_output_modes_to_fit_bw(&drm.display);
 	igt_require_f(found, "No valid mode combo found.\n");
 
-	prim_mode_params.mode_copy = *igt_output_get_mode(prim_mode_params.output);
-	prim_mode_params.mode = &prim_mode_params.mode_copy;
-	prim_mode_params.primary.w = prim_mode_params.mode->hdisplay;
-	prim_mode_params.primary.h = prim_mode_params.mode->vdisplay;
+	prim_mode_params.mode = *igt_output_get_mode(prim_mode_params.output);
+	prim_mode_params.primary.w = prim_mode_params.mode.hdisplay;
+	prim_mode_params.primary.h = prim_mode_params.mode.vdisplay;
 
-	scnd_mode_params.mode_copy = *igt_output_get_mode(scnd_mode_params.output);
-	scnd_mode_params.mode = &scnd_mode_params.mode_copy;
-	scnd_mode_params.primary.w = scnd_mode_params.mode->hdisplay;
-	scnd_mode_params.primary.h = scnd_mode_params.mode->vdisplay;
+	scnd_mode_params.mode = *igt_output_get_mode(scnd_mode_params.output);
+	scnd_mode_params.primary.w = scnd_mode_params.mode.hdisplay;
+	scnd_mode_params.primary.h = scnd_mode_params.mode.vdisplay;
 
 	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
 	fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
@@ -2689,7 +2686,7 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	igt_plane_set_fb(reg->plane, &new_fb);
 	igt_fb_set_position(&new_fb, reg->plane, reg->x, reg->y);
 	igt_fb_set_size(&new_fb, reg->plane, reg->w, reg->h);
-	igt_plane_set_size(reg->plane, params->mode->hdisplay, params->mode->vdisplay);
+	igt_plane_set_size(reg->plane, params->mode.hdisplay, params->mode.vdisplay);
 	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
 	do_assertions(DONT_ASSERT_CRC);
 
@@ -2701,11 +2698,11 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	/* Destination doesn't fill the entire CRTC, no scaling. */
 	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
 	igt_plane_set_position(reg->plane,
-			       params->mode->hdisplay / 4,
-			       params->mode->vdisplay / 4);
+			       params->mode.hdisplay / 4,
+			       params->mode.vdisplay / 4);
 	igt_plane_set_size(reg->plane,
-			   params->mode->hdisplay / 2,
-			   params->mode->vdisplay / 2);
+			   params->mode.hdisplay / 2,
+			   params->mode.vdisplay / 2);
 	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
 	do_assertions(DONT_ASSERT_CRC);
 
@@ -2731,7 +2728,7 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	/* Back to the good and old blue fb. */
 	igt_plane_set_fb(reg->plane, old_fb);
 	igt_plane_set_position(params->primary.plane, 0, 0);
-	igt_plane_set_size(reg->plane, params->mode->hdisplay, params->mode->vdisplay);
+	igt_plane_set_size(reg->plane, params->mode.hdisplay, params->mode.vdisplay);
 	igt_fb_set_position(reg->fb, reg->plane, reg->x, reg->y);
 	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
 	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
@@ -2868,14 +2865,14 @@ static void farfromfence_subtest(const struct test_mode *t)
 	prepare_subtest(t, pattern);
 	target = pick_target(t, params);
 
-	create_fb(t->format, params->mode->hdisplay, max_height, t->tiling,
+	create_fb(t->format, params->mode.hdisplay, max_height, t->tiling,
 		  t->plane, &tall_fb);
 
 	fill_fb(&tall_fb, COLOR_PRIM_BG);
 
 	params->primary.fb = &tall_fb;
 	params->primary.x = 0;
-	params->primary.y = max_height - params->mode->vdisplay;
+	params->primary.y = max_height - params->mode.vdisplay;
 	set_mode_for_params(params);
 	do_assertions(assertions);
 
-- 
2.32.0
