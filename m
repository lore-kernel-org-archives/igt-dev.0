Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38410E029
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:12:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id b6so11961875ljr.10
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 12:12:31 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 22:11:43 +0300
Message-Id: <20220927191143.22040-5-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
References: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_rotation_crc: try to simplify
 multiplane rotation tests
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

As is multiplane rotation tests are far from readable, here attempt
to break it to bit more readable form. No functional change on test
itself.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 297 +++++++++++++++++++++++----------------
 1 file changed, 178 insertions(+), 119 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 53f1f6ec1..755da20e7 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -60,6 +60,24 @@ enum rectangle_type {
 	num_rectangle_types /* must be last */
 };
 
+/*
+ * These are those modes which are tested on multiplane test.
+ * For testing feel interesting case with modifier are 2BPP, 4BPP, NV12 and
+ * one P0xx format.
+ */
+const uint32_t multiplaneformatlist[] = { DRM_FORMAT_RGB565,
+					  DRM_FORMAT_XRGB8888,
+					  DRM_FORMAT_NV12,
+					  DRM_FORMAT_P010 };
+
+typedef struct {
+	igt_rotation_t rotation;
+	float_t width;
+	float_t height;
+	uint64_t modifier;
+	struct igt_fb fbs[ARRAY_SIZE(multiplaneformatlist)][2];
+} planeconfigs_t;
+
 typedef struct {
 	int gfx_fd;
 	igt_display_t display;
@@ -76,7 +94,6 @@ typedef struct {
 	uint64_t override_modifier;
 	int devid;
 
-	struct p_struct *multiplaneoldview;
 	struct p_point planepos[MAXMULTIPLANESAMOUNT];
 
 	bool use_native_resolution;
@@ -571,33 +588,46 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 }
 
 typedef struct {
-	int32_t x1, y1;
-	uint64_t width, height, modifier, format;
+	int32_t x1, y1, formatindex;
 	igt_plane_t *plane;
 	igt_rotation_t rotation_sw, rotation_hw;
+	planeconfigs_t *fbinfo;
 } planeinfos;
 
-static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
-			     struct igt_fb *fbleft,  struct igt_fb *fbright)
+static bool setup_multiplane(data_t *data, planeinfos planeinfo[2], drmModeModeInfo *mode,
+			     int hwround)
 {
 	uint32_t w, h;
-	struct igt_fb *planes[2] = {fbleft, fbright};
+	struct igt_fb *planes[2] = {&planeinfo[0].fbinfo->fbs[planeinfo[0].formatindex][hwround],
+				    &planeinfo[1].fbinfo->fbs[planeinfo[1].formatindex][hwround]};
 	int c;
 
+	if (hwround == MULTIPLANE_REFERENCE) {
+		planeinfo[0].rotation_sw = planeinfo[0].fbinfo->rotation;
+		planeinfo[1].rotation_sw = planeinfo[1].fbinfo->rotation;
+		planeinfo[0].rotation_hw = IGT_ROTATION_0;
+		planeinfo[1].rotation_hw = IGT_ROTATION_0;
+	} else {
+		planeinfo[0].rotation_sw = IGT_ROTATION_0;
+		planeinfo[1].rotation_sw = IGT_ROTATION_0;
+		planeinfo[0].rotation_hw = planeinfo[0].fbinfo->rotation;
+		planeinfo[1].rotation_hw = planeinfo[1].fbinfo->rotation;
+	}
+
 	for (c = 0; c < ARRAY_SIZE(planes); c++) {
 		/*
 		 * make plane and fb width and height always divisible by 4
 		 * due to NV12 support and Intel hw workarounds.
 		 */
-		w = planeinfo[c].width & ~3;
-		h = planeinfo[c].height & ~3;
+		w = (uint64_t)(planeinfo[c].fbinfo->width * TEST_WIDTH(mode)) & ~3;
+		h = (uint64_t)(planeinfo[c].fbinfo->height * TEST_HEIGHT(mode)) & ~3;
 
 		if (igt_rotation_90_or_270(planeinfo[c].rotation_sw))
 			igt_swap(w, h);
 
 		if (!igt_plane_has_format_mod(planeinfo[c].plane,
-					      planeinfo[c].format,
-					      planeinfo[c].modifier))
+					      multiplaneformatlist[planeinfo[c].formatindex],
+					      planeinfo[c].fbinfo->modifier))
 			return false;
 
 		/*
@@ -605,8 +635,9 @@ static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
 		 * new fb?
 		 */
 		if (planes[c]->fb_id == 0) {
-			igt_create_fb(data->gfx_fd, w, h, planeinfo[c].format,
-				      planeinfo[c].modifier, planes[c]);
+			igt_create_fb(data->gfx_fd, w, h,
+				      multiplaneformatlist[planeinfo[c].formatindex],
+				      planeinfo[c].fbinfo->modifier, planes[c]);
 
 			paint_squares(data, planeinfo[c].rotation_sw,
 				      planes[c], 1.0f);
@@ -625,7 +656,7 @@ static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
 	return true;
 }
 
-static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
+static void pointlocation(data_t *data, planeinfos p[2], drmModeModeInfo *mode,
 			  int c)
 {
 	if (data->planepos[c].origo & p_right) {
@@ -655,11 +686,88 @@ static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
 	}
 }
 
+static bool multiplaneskiproundcheck(data_t *data, planeinfos p[2])
+{
+	/*
+	 * RGB565 90/270 degrees rotation is supported
+	 * from gen11 onwards.
+	 */
+	if (multiplaneformatlist[p[0].formatindex] == DRM_FORMAT_RGB565 &&
+	    igt_rotation_90_or_270(p[0].fbinfo->rotation)
+	    && intel_display_ver(data->devid) < 11)
+		return false;
+
+	if (multiplaneformatlist[p[1].formatindex] == DRM_FORMAT_RGB565 &&
+	    igt_rotation_90_or_270(p[1].fbinfo->rotation)
+	    && intel_display_ver(data->devid) < 11)
+		return false;
+
+	if (!igt_plane_has_rotation(p[0].plane, p[0].fbinfo->rotation))
+		return false;
+
+	if (!igt_plane_has_rotation(p[1].plane, p[1].fbinfo->rotation))
+		return false;
+
+	return true;
+}
+
 /*
  * count trailing zeroes
  */
 #define ctz __builtin_ctz
 
+/*
+ * this is to make below inner loops more readable.
+ * 1 = left plane has palar format
+ * 2 = right plane has planar format
+ * 3 = both planes has planar formats
+ */
+#define planarcheck (igt_format_is_yuv_semiplanar(multiplaneformatlist[p[0].formatindex]) | \
+		    (igt_format_is_yuv_semiplanar(multiplaneformatlist[p[1].formatindex]) << 1))
+
+/*
+ * used formats are packed formats and these rotation were already seen on
+ * screen so crc was already logged?
+ */
+static bool havepackedcrc(planeinfos p[2], igt_crc_t crclog[16])
+{
+	int logindex;
+
+	if (planarcheck != 0)
+		return false;
+
+	logindex = ctz(p[0].fbinfo->rotation);
+	logindex |= ctz(p[1].fbinfo->rotation) << 2;
+
+	if (crclog[logindex].frame == 0)
+		return false;
+
+	return true;
+}
+
+/*
+ * check left plane has planar format, right plane doesn't have planar format
+ * and rotations stay the same, if all these are true crc can be re-used from
+ * previous round.
+ */
+static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
+				  int lastroundp0rotation,
+				  int lastroundp1rotation)
+{
+	if (planarcheck != 1)
+		return false;
+
+	if (igt_format_is_yuv_semiplanar(lastroundp1format))
+		return false;
+
+	if (p[0].fbinfo->rotation != lastroundp0rotation)
+		return false;
+
+	if (p[1].fbinfo->rotation != lastroundp1rotation)
+		return false;
+
+	return true;
+}
 /*
  * Here is pipe parameter which is now used only for first pipe.
  * It is left here if this test ever was wanted to be run on
@@ -671,41 +779,29 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
-	int used_w, used_h, lastroundirotation = 0, lastroundjrotation = 0,
+	int lastroundirotation = 0, lastroundjrotation = 0,
 	    lastroundjformat = 0, c, d;
 	drmModeModeInfo *mode;
 	bool have_crc; // flag if can use previously logged crc for comparison
 	igt_crc_t crclog[16] = {}; //4 * 4 rotation crc storage for packed formats
 	char *str1, *str2; // for debug printouts
-
-	/*
-	 * These are those modes which are tested. For testing feel interesting
-	 * case with modifier are 2 bpp, 4 bpp and NV12.
-	 */
-	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
-		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
-
-	static struct {
-		igt_rotation_t rotation;
-		float_t width;
-		float_t height;
-		uint64_t modifier;
-		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
-	} planeconfigs[] = {
-	{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
-	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
-	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_4_TILED },
-	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
-	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
-	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_4_TILED },
-	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+	int logindex;
+
+	static planeconfigs_t planeconfigs[] = {
+		{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
+		{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
+		{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+		{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+		{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_4_TILED },
+		{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+		{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+		{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
+		{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
+		{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+		{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+		{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_4_TILED },
+		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
 
 	for_each_valid_output_on_pipe(display, pipe, output) {
@@ -715,9 +811,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_display_require_output(display);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
-		used_w = TEST_WIDTH(mode);
-		used_h = TEST_HEIGHT(mode);
-
 		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
@@ -726,88 +819,60 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_pipe_crc_start(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
-			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
-			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
-			p[0].modifier = planeconfigs[i].modifier;
-			pointlocation(data, (planeinfos *)&p, mode, 0);
+			p[0].fbinfo = &planeconfigs[i];
+			pointlocation(data, p, mode, 0);
 
-			for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
-				p[0].format = formatlist[k];
+			for (k = 0; k < ARRAY_SIZE(multiplaneformatlist); k++) {
+				p[0].formatindex = k;
 
 				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
-					p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
-					p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
-					p[1].modifier = planeconfigs[j].modifier;
-					pointlocation(data, (planeinfos *)&p,
-						      mode, 1);
-
-					for (l = 0; l < ARRAY_SIZE(formatlist); l++) {
-						p[1].format = formatlist[l];
-						/*
-						 * RGB565 90/270 degrees rotation is supported
-						 * from gen11 onwards.
-						 */
-						if (p[0].format == DRM_FORMAT_RGB565 &&
-						     igt_rotation_90_or_270(planeconfigs[i].rotation)
-						     && intel_display_ver(data->devid) < 11)
-							continue;
+					p[1].fbinfo = &planeconfigs[j];
+					pointlocation(data, p, mode, 1);
 
-						if (p[1].format == DRM_FORMAT_RGB565 &&
-						     igt_rotation_90_or_270(planeconfigs[j].rotation)
-						     && intel_display_ver(data->devid) < 11)
-							continue;
-
-						if (!igt_plane_has_rotation(p[0].plane,
-									    planeconfigs[i].rotation))
-							continue;
+					for (l = 0; l < ARRAY_SIZE(multiplaneformatlist); l++) {
+						p[1].formatindex = l;
 
-						if (!igt_plane_has_rotation(p[1].plane,
-									    planeconfigs[j].rotation))
+						if (!multiplaneskiproundcheck(data, p))
 							continue;
 
 						/*
 						 * if using packed formats crc's will be
 						 * same and can store them so there's
-						 * no need to redo comparison image and
+						 * no need to redo reference image and
 						 * just use stored crc.
 						 */
-						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
-						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
-							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
+						if (havepackedcrc(p, crclog)) {
+							logindex = ctz(p[0].fbinfo->rotation);
+							logindex |= ctz(p[1].fbinfo->rotation) << 2;
+
+							retcrc_sw = crclog[logindex];
 							have_crc = true;
-						} else if((p[0].format == DRM_FORMAT_NV12 || p[0].format == DRM_FORMAT_P010) &&
-							   p[1].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_P010 &&
-							   lastroundjformat != DRM_FORMAT_NV12 && lastroundjformat != DRM_FORMAT_P010 &&
-							   planeconfigs[i].rotation == lastroundirotation &&
-							   planeconfigs[j].rotation == lastroundjrotation) {
+						} else if(reusecrcfromlastround(p, lastroundjformat,
+										lastroundirotation,
+										lastroundjrotation)) {
 							/*
-							 * With NV12 can benefit from
-							 * previous crc if rotations
+							 * With planar formats can benefit
+							 * from previous crc if rotations
 							 * stay same. If both planes
-							 * have NV12 in use we need to
-							 * skip that case.
+							 * have planar format in use we
+							 * need to skip that case.
 							 * If last round right plane
-							 * had NV12 need to skip this.
+							 * had planar format need to skip
+							 * this.
 							 */
 							have_crc = true;
 						} else {
 							/*
 							 * here will be created
-							 * comparison image and get crc
+							 * reference image and get crc
 							 * if didn't have stored crc
 							 * or planar format is in use.
 							 * have_crc flag will control
 							 * crc comparison part.
 							 */
-							p[0].rotation_sw = planeconfigs[i].rotation;
-							p[0].rotation_hw = IGT_ROTATION_0;
-							p[1].rotation_sw = planeconfigs[j].rotation;
-							p[1].rotation_hw = IGT_ROTATION_0;
-							if (!setup_multiplane(data,
-									(planeinfos *)&p,
-									&planeconfigs[i].fbs[k][MULTIPLANE_REFERENCE],
-									&planeconfigs[j].fbs[l][MULTIPLANE_REFERENCE]))
+							if (!setup_multiplane(data, p, mode, MULTIPLANE_REFERENCE))
 								continue;
+
 							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 							flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
 							have_crc = false;
@@ -818,15 +883,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 * get vblank where interesting
 						 * crc will be at, grab crc bit later
 						 */
-						p[0].rotation_sw = IGT_ROTATION_0;
-						p[0].rotation_hw = planeconfigs[i].rotation;
-						p[1].rotation_sw = IGT_ROTATION_0;
-						p[1].rotation_hw = planeconfigs[j].rotation;
-
-						if (!setup_multiplane(data,
-								      (planeinfos *)&p,
-								      &planeconfigs[i].fbs[k][MULTIPLANE_ROTATED],
-								      &planeconfigs[j].fbs[l][MULTIPLANE_ROTATED]))
+						if (!setup_multiplane(data, p, mode, MULTIPLANE_ROTATED))
 							continue;
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -838,9 +895,12 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 										   flipsw,
 										   &retcrc_sw);
 
-							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
-								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
-								= retcrc_sw;
+							if (planarcheck == 0) {
+								logindex = ctz(p[0].fbinfo->rotation);
+								logindex |= ctz(p[1].fbinfo->rotation) << 2;
+
+								crclog[logindex] = retcrc_sw;
+							}
 						}
 						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
 
@@ -849,18 +909,18 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 
 						igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
 							str1, str2,
-							(char *) &p[0].format, (char *) &p[1].format,
-							have_crc?"yes":" no",
+							(char *) &multiplaneformatlist[p[0].formatindex],
+							(char *) &multiplaneformatlist[p[1].formatindex],
+							have_crc ? "yes" : " no",
 							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[i].rotation)],
 							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[j].rotation)]);
 
 						free(str1);
 						free(str2);
 
-
 						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
 
-						lastroundjformat = p[1].format;
+						lastroundjformat = multiplaneformatlist[p[1].formatindex];
 						lastroundirotation = planeconfigs[i].rotation;
 						lastroundjrotation = planeconfigs[j].rotation;
 					}
@@ -881,13 +941,12 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		lastroundirotation = 0;
 		lastroundjrotation = 0;
 
-
 		igt_output_set_pipe(output, PIPE_NONE);
 	}
 	data->pipe_crc = NULL;
 
 	for (c = 0; c < ARRAY_SIZE(planeconfigs); c++) {
-		for  (d = 0; d < ARRAY_SIZE(formatlist); d++) {
+		for  (d = 0; d < ARRAY_SIZE(multiplaneformatlist); d++) {
 			igt_remove_fb(data->gfx_fd, &planeconfigs[c].fbs[d][MULTIPLANE_REFERENCE]);
 			igt_remove_fb(data->gfx_fd, &planeconfigs[c].fbs[d][MULTIPLANE_ROTATED]);
 		}
-- 
2.37.3
