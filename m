Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8D89CB3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Feb 2021 20:12:09 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u4so17969676ljh.6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Feb 2021 12:12:09 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 17 Feb 2021 22:12:01 +0200
Message-Id: <20210217201202.24145-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: reduce
 executions time on multiplane tests
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

Reduce repetitive work and wait less. Buffer created fbs. Log counted crcs.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 224 +++++++++++++++++++++++++++------------
 1 file changed, 155 insertions(+), 69 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 6d4e87ed9..eb3ec3372 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -31,6 +31,8 @@
 #define TEST_MAX_WIDTH 640
 #define TEST_MAX_HEIGHT 480
 #define MAX_TESTED_MODES 8
+#define MULTIPLANE_REFERENCE 0
+#define MULTIPLANE_ROTATED 1
 
 struct p_struct {
 	igt_plane_t *plane;
@@ -522,26 +524,19 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 typedef struct {
 	int32_t x1, y1;
-	uint64_t width, height, tiling, planetype, format;
+	uint64_t width, height, tiling, format;
+	igt_plane_t *plane;
 	igt_rotation_t rotation_sw, rotation_hw;
 } planeinfos;
 
-static bool get_multiplane_crc(data_t *data, igt_output_t *output,
-			       igt_crc_t *crc_output, planeinfos *planeinfo,
-			       int numplanes)
+static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
+			     struct igt_fb *fbleft,  struct igt_fb *fbright)
 {
 	uint32_t w, h;
-	igt_display_t *display = &data->display;
-	struct p_struct *planes, *oldplanes;
-	int c, ret;
-
-	oldplanes = data->multiplaneoldview;
-	planes = calloc(sizeof(*planes), numplanes);
-
-	for (c = 0; c < numplanes; c++) {
-		planes[c].plane = igt_output_get_plane_type(output,
-							    planeinfo[c].planetype);
+	struct igt_fb *planes[2] = {fbleft, fbright};
+	int c;
 
+	for (c = 0; c < ARRAY_SIZE(planes); c++) {
 		/*
 		 * make plane and fb width and height always divisible by 4
 		 * due to NV12 support and Intel hw workarounds.
@@ -552,34 +547,33 @@ static bool get_multiplane_crc(data_t *data, igt_output_t *output,
 		if (planeinfo[c].rotation_sw & (IGT_ROTATION_90 | IGT_ROTATION_270))
 			igt_swap(w, h);
 
-		if (!igt_plane_has_format_mod(planes[c].plane,
+		if (!igt_plane_has_format_mod(planeinfo[c].plane,
 					      planeinfo[c].format,
 					      planeinfo[c].tiling))
 			return false;
 
-		igt_create_fb(data->gfx_fd, w, h, planeinfo[c].format,
-			      planeinfo[c].tiling, &planes[c].fb);
+		/*
+		 * was this hw/sw rotation ran already or need to create
+		 * new fb?
+		 */
+		if (planes[c]->fb_id == 0) {
+			igt_create_fb(data->gfx_fd, w, h, planeinfo[c].format,
+				      planeinfo[c].tiling, planes[c]);
 
-		paint_squares(data, planeinfo[c].rotation_sw, &planes[c].fb, 1.0f);
-		igt_plane_set_fb(planes[c].plane, &planes[c].fb);
+			paint_squares(data, planeinfo[c].rotation_sw,
+				      planes[c], 1.0f);
+		}
+		igt_plane_set_fb(planeinfo[c].plane, planes[c]);
 
 		if (planeinfo[c].rotation_hw & (IGT_ROTATION_90 | IGT_ROTATION_270))
-			igt_plane_set_size(planes[c].plane, h, w);
-
-		igt_plane_set_position(planes[c].plane, planeinfo[c].x1, planeinfo[c].y1);
-		igt_plane_set_rotation(planes[c].plane, planeinfo[c].rotation_hw);
-	}
-
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_assert_eq(ret, 0);
-
-	igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, crc_output);
+			igt_plane_set_size(planeinfo[c].plane, h, w);
 
-	for (c = 0; c < numplanes && oldplanes; c++)
-		igt_remove_fb(data->gfx_fd, &oldplanes[c].fb);
+		igt_plane_set_position(planeinfo[c].plane, planeinfo[c].x1,
+				       planeinfo[c].y1);
 
-	free(oldplanes);
-	data->multiplaneoldview = (void*)planes;
+		igt_plane_set_rotation(planeinfo[c].plane,
+				       planeinfo[c].rotation_hw);
+	}
 	return true;
 }
 
@@ -613,6 +607,11 @@ static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
 	}
 }
 
+/*
+ * count trailing zeroes
+ */
+#define ctz __builtin_ctz
+
 /*
  * Here is pipe parameter which is now used only for first pipe.
  * It is left here if this test ever was wanted to be run on
@@ -624,15 +623,26 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
-	int c, used_w, used_h;
-	struct p_struct *oldplanes;
+	int used_w, used_h, lastroundirotation = 0, lastroundjrotation = 0,
+	    lastroundjformat = 0;
 	drmModeModeInfo *mode;
+	bool have_crc; // flag if can use previously logged crc for comparison
+	igt_crc_t crclog[16] = {}; //4 * 4 rotation crc storage for packed formats
+	char *str1, *str2; // for debug printouts
 
-	static const struct {
+	/*
+	* These are those modes which are tested. For testing feel interesting
+	* case with tiling are 2 bpp, 4 bpp and NV12.
+	*/
+	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
+
+	static struct {
 		igt_rotation_t rotation;
 		float_t width;
 		float_t height;
 		uint64_t tiling;
+		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
 	} planeconfigs[] = {
 	{IGT_ROTATION_0, .2f, .4f, LOCAL_DRM_FORMAT_MOD_NONE },
 	{IGT_ROTATION_0, .2f, .4f, LOCAL_I915_FORMAT_MOD_X_TILED },
@@ -648,15 +658,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	{IGT_ROTATION_270, .2f, .4f, LOCAL_I915_FORMAT_MOD_Yf_TILED },
 	};
 
-	/*
-	* These are those modes which are tested. For testing feel interesting
-	* case with tiling are 2 bpp, 4 bpp and NV12.
-	*/
-	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
-		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
-
 	for_each_valid_output_on_pipe(display, pipe, output) {
-		int i, j, k, l;
+		int i, j, k, l, flipsw, fliphw;
 		igt_output_set_pipe(output, pipe);
 		mode = igt_output_get_mode(output);
 		igt_display_require_output(display);
@@ -665,12 +668,14 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		used_w = min(TEST_MAX_WIDTH, mode->hdisplay);
 		used_h = min(TEST_MAX_HEIGHT, mode->vdisplay);
 
+		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
+
 		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
 						  INTEL_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
-			p[0].planetype = DRM_PLANE_TYPE_PRIMARY;
 			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
 			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
 			p[0].tiling = planeconfigs[i].tiling;
@@ -680,7 +685,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 				p[0].format = formatlist[k];
 
 				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
-					p[1].planetype = DRM_PLANE_TYPE_OVERLAY;
 					p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
 					p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
 					p[1].tiling = planeconfigs[j].tiling;
@@ -689,7 +693,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 
 					for (l = 0; l < ARRAY_SIZE(formatlist); l++) {
 						p[1].format = formatlist[l];
-
 						/*
 						 * RGB565 90/270 degrees rotation is supported
 						 * from gen11 onwards.
@@ -703,41 +706,124 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						     (planeconfigs[j].rotation & (IGT_ROTATION_90 | IGT_ROTATION_270))
 						     && intel_gen(data->devid) < 11)
 							continue;
+						/*
+						 * if using packed formats crc's will be
+						 * same and can store them so there's
+						 * no need to redo comparison image and
+						 * just use stored crc.
+						 */
+						if (p[0].format != DRM_FORMAT_NV12 &&
+						    p[1].format != DRM_FORMAT_NV12 &&
+						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
+							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
+							have_crc = true;
+						} else if (p[0].format == DRM_FORMAT_NV12 &&
+							   p[1].format != DRM_FORMAT_NV12 &&
+							   lastroundjformat != DRM_FORMAT_NV12 &&
+							   planeconfigs[i].rotation == lastroundirotation &&
+							   planeconfigs[j].rotation == lastroundjrotation) {
+							/*
+							 * With NV12 can benefit from
+							 * previous crc if rotations
+							 * stay same. If both planes
+							 * have NV12 in use we need to
+							 * skip that case.
+							 * If last round right plane
+							 * had NV12 need to skip this.
+							 */
+							have_crc = true;
+						} else {
+							/*
+							 * here will be created
+							 * comparison image and get crc
+							 * if didn't have stored crc
+							 * or planar format is in use.
+							 * have_crc flag will control
+							 * crc comparison part.
+							 */
+							p[0].rotation_sw = planeconfigs[i].rotation;
+							p[0].rotation_hw = IGT_ROTATION_0;
+							p[1].rotation_sw = planeconfigs[j].rotation;
+							p[1].rotation_hw = IGT_ROTATION_0;
+							if (!setup_multiplane(data,
+									(planeinfos *)&p,
+									&planeconfigs[i].fbs[k][MULTIPLANE_REFERENCE],
+									&planeconfigs[j].fbs[l][MULTIPLANE_REFERENCE]))
+								continue;
+							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+							flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+							have_crc = false;
+						}
 
-						p[0].rotation_sw = planeconfigs[i].rotation;
-						p[0].rotation_hw = IGT_ROTATION_0;
-						p[1].rotation_sw = planeconfigs[j].rotation;
-						p[1].rotation_hw = IGT_ROTATION_0;
-						if (!get_multiplane_crc(data, output, &retcrc_sw,
-								   (planeinfos *)&p, MAXMULTIPLANESAMOUNT))
+						/*
+						 * create hw rotated image and
+						 * get vblank where interesting
+						 * crc will be at, grab crc bit later
+						 */
+						p[0].rotation_sw = IGT_ROTATION_0;
+						p[0].rotation_hw = planeconfigs[i].rotation;
+						p[1].rotation_sw = IGT_ROTATION_0;
+						p[1].rotation_hw = planeconfigs[j].rotation;
+
+						if (!setup_multiplane(data,
+								      (planeinfos *)&p,
+								      &planeconfigs[i].fbs[k][MULTIPLANE_ROTATED],
+								      &planeconfigs[j].fbs[l][MULTIPLANE_ROTATED]))
 							continue;
 
-						igt_swap(p[0].rotation_sw, p[0].rotation_hw);
-						igt_swap(p[1].rotation_sw, p[1].rotation_hw);
-						if (!get_multiplane_crc(data, output, &retcrc_hw,
-								   (planeinfos *)&p, MAXMULTIPLANESAMOUNT))
-							continue;
+						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+						fliphw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+
+						if (!have_crc) {
+							igt_pipe_crc_get_for_frame(data->gfx_fd,
+										   data->pipe_crc,
+										   flipsw,
+										   &retcrc_sw);
+
+							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12 )
+								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
+								= retcrc_sw;
+						}
+						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
+
+						str1 = igt_crc_to_string(&retcrc_sw);
+						str2 = igt_crc_to_string(&retcrc_hw);
+
+						igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
+							str1, str2,
+							(char*) &p[0].format, (char*) &p[1].format,
+							have_crc?"yes":" no",
+							(int[]) {0, 90, 180, 270}[ctz(planeconfigs[i].rotation)],
+							(int[]) {0, 90, 180, 270}[ctz(planeconfigs[j].rotation)]);
+
+						free(str1);
+						free(str2);
+
 
 						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
+
+						lastroundjformat = p[1].format;
+						lastroundirotation = planeconfigs[i].rotation;
+						lastroundjrotation = planeconfigs[j].rotation;
 					}
 				}
 			}
 		}
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
-		igt_output_set_pipe(output, PIPE_ANY);
-	}
 
-	/*
-	* Old fbs are deleted only after new ones are set on planes.
-	* This is done to speed up the test
-	*/
-	oldplanes = data->multiplaneoldview;
-	for (c = 0; c < MAXMULTIPLANESAMOUNT && oldplanes; c++)
-		igt_remove_fb(data->gfx_fd, &oldplanes[c].fb);
+		igt_plane_set_fb(p[0].plane, NULL);
+		igt_plane_set_fb(p[1].plane, NULL);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	free(oldplanes);
-	data->multiplaneoldview = NULL;
+		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
+			for  (j = 0; j < ARRAY_SIZE(formatlist); j++) {
+				igt_remove_fb(data->gfx_fd, &planeconfigs[i].fbs[j][MULTIPLANE_REFERENCE]);
+				igt_remove_fb(data->gfx_fd, &planeconfigs[i].fbs[j][MULTIPLANE_ROTATED]);
+			}
+		}
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
 	data->pipe_crc = NULL;
 }
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
