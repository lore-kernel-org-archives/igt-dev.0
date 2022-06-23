Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF0C10E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 16:05:54 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jun 2022 21:32:21 +0530
Message-Id: <20220623160221.17205-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Create dynamic
 subtests
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

Convert the existing subtests to dynamic subtests at pipe level.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 591 +++++++++++++++++++++------------------
 1 file changed, 316 insertions(+), 275 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08..ae925844 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -454,13 +454,13 @@ static bool test_format(data_t *data,
 	return true;
 }
 
-static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
+static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format, int pipe,
+				igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
-	igt_output_t *output;
-	enum pipe pipe;
-	int pipe_count = 0, connected_outputs = 0;
+	igt_plane_t *plane;
+	int i, j, c;
 
 	if (is_amdgpu_device(data->gfx_fd))
 		igt_require(plane_type != DRM_PLANE_TYPE_OVERLAY &&
@@ -471,105 +471,90 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 	igt_display_require_output(display);
 
-	for_each_connected_output(&data->display, output)
-		connected_outputs++;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		igt_plane_t *plane;
-		int i, j, c;
-
-		mode = igt_output_get_mode(output);
-
-		/*
-		 * Find mode which is in use in connector. If this is mode
-		 * which was not run on earlier we'll end up on zeroed
-		 * struct crc_rect and recalculate reference crcs.
-		 */
-		for (data->output_crc_in_use = 0;
-		     data->output_crc_in_use < data->max_crc_in_use &&
-		     data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay;
-		     data->output_crc_in_use++)
-			;
+	mode = igt_output_get_mode(output);
 
-		/*
-		 * This is if there was different mode on different connector
-		 * and this mode was not run on before.
-		 */
-		if (data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay) {
-			data->crc_rect[data->output_crc_in_use][0].mode = mode->vdisplay;
-			data->max_crc_in_use++;
+	/*
+	 * Find mode which is in use in connector. If this is mode
+	 * which was not run on earlier we'll end up on zeroed
+	 * struct crc_rect and recalculate reference crcs.
+	 */
+	for (data->output_crc_in_use = 0;
+	     data->output_crc_in_use < data->max_crc_in_use &&
+	     data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay;
+	     data->output_crc_in_use++)
+		;
 
+	/*
+	 * This is if there was different mode on different connector
+	 * and this mode was not run on before.
+	 */
+	if (data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay) {
+		data->crc_rect[data->output_crc_in_use][0].mode = mode->vdisplay;
+		data->max_crc_in_use++;
 			if (data->max_crc_in_use >= MAX_TESTED_MODES)
 				data->max_crc_in_use = MAX_TESTED_MODES - 1;
-		}
-
-		for (c = 0; c < num_rectangle_types; c++)
-			data->crc_rect[data->output_crc_in_use][c].valid = false;
-
-		/* restricting the execution to 2 pipes to reduce execution time*/
-		if (pipe_count == 2 * connected_outputs && !data->extended)
-			break;
-		pipe_count++;
-
-		igt_output_set_pipe(output, pipe);
+	}
 
-		plane = igt_output_get_plane_type(output, plane_type);
-		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
-		igt_require(igt_plane_has_rotation(plane, data->rotation));
-		/* CHV can't rotate and reflect simultaneously */
-		igt_require(!is_i915_device(data->gfx_fd) ||
-			    !IS_CHERRYVIEW(data->devid) ||
-			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
+	for (c = 0; c < num_rectangle_types; c++)
+		data->crc_rect[data->output_crc_in_use][c].valid = false;
 
-		prepare_crtc(data, output, pipe, plane, true);
+	igt_output_set_pipe(output, pipe);
 
-		for (i = 0; i < num_rectangle_types; i++) {
-			/* Unsupported on i915 */
-			if (plane_type == DRM_PLANE_TYPE_CURSOR &&
-			    i != square)
+	plane = igt_output_get_plane_type(output, plane_type);
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+	igt_require(igt_plane_has_rotation(plane, data->rotation));
+	/* CHV can't rotate and reflect simultaneously */
+	igt_require(!is_i915_device(data->gfx_fd) ||
+		    !IS_CHERRYVIEW(data->devid) ||
+		    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
+
+	prepare_crtc(data, output, pipe, plane, true);
+
+	for (i = 0; i < num_rectangle_types; i++) {
+		/* Unsupported on i915 */
+		if (plane_type == DRM_PLANE_TYPE_CURSOR &&
+		    i != square)
+			continue;
+
+		/* Only support partial covering primary plane on gen9+ */
+		if (is_amdgpu_device(data->gfx_fd) ||
+			(plane_type == DRM_PLANE_TYPE_PRIMARY &&
+			 is_i915_device(data->gfx_fd) &&
+			 intel_display_ver(
+				 intel_get_drm_devid(data->gfx_fd)) < 9)) {
+			if (i != rectangle)
 				continue;
+			else
+				data->use_native_resolution = true;
+		} else {
+			data->use_native_resolution = false;
+		}
 
-			/* Only support partial covering primary plane on gen9+ */
-			if (is_amdgpu_device(data->gfx_fd) ||
-				(plane_type == DRM_PLANE_TYPE_PRIMARY &&
-				 is_i915_device(data->gfx_fd) &&
-				 intel_display_ver(
-					 intel_get_drm_devid(data->gfx_fd)) < 9)) {
-				if (i != rectangle)
-					continue;
-				else
-					data->use_native_resolution = true;
-			} else {
-				data->use_native_resolution = false;
-			}
-
-			if (!data->override_fmt) {
-				struct igt_vec tested_formats;
-
-				igt_vec_init(&tested_formats, sizeof(uint32_t));
+		if (!data->override_fmt) {
+			struct igt_vec tested_formats;
 
-				for (j = 0; j < plane->drm_plane->count_formats; j++) {
-					uint32_t format = plane->drm_plane->formats[j];
+			igt_vec_init(&tested_formats, sizeof(uint32_t));
 
-					if (!test_format(data, &tested_formats, format))
-						continue;
+			for (j = 0; j < plane->drm_plane->count_formats; j++) {
+				uint32_t format = plane->drm_plane->formats[j];
 
-					test_single_case(data, pipe, output, plane, i,
-							 format, test_bad_format);
-				}
-
-				igt_vec_fini(&tested_formats);
-			} else {
+				if (!test_format(data, &tested_formats, format))
+					continue;
 				test_single_case(data, pipe, output, plane, i,
-						 data->override_fmt, test_bad_format);
+						 format, test_bad_format);
 			}
+				igt_vec_fini(&tested_formats);
+		} else {
+			test_single_case(data, pipe, output, plane, i,
+					 data->override_fmt, test_bad_format);
 		}
-		if (is_i915_device(data->gfx_fd)) {
-			igt_pipe_crc_stop(data->pipe_crc);
-		}
+	}
+	if (is_i915_device(data->gfx_fd)) {
+		igt_pipe_crc_stop(data->pipe_crc);
 	}
 }
 
+
 typedef struct {
 	int32_t x1, y1;
 	uint64_t width, height, modifier, format;
@@ -665,10 +650,9 @@ static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
  * It is left here if this test ever was wanted to be run on
  * different pipes.
  */
-static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
+static void test_multi_plane_rotation(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
 	int used_w, used_h, lastroundirotation = 0, lastroundjrotation = 0,
@@ -706,182 +690,189 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
 
-	for_each_valid_output_on_pipe(display, pipe, output) {
-		int i, j, k, l, flipsw, fliphw;
-		igt_output_set_pipe(output, pipe);
-		mode = igt_output_get_mode(output);
-		igt_display_require_output(display);
-		igt_display_commit2(display, COMMIT_ATOMIC);
-
-		used_w = TEST_WIDTH(mode);
-		used_h = TEST_HEIGHT(mode);
-
-		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
-
-		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
-						  INTEL_PIPE_CRC_SOURCE_AUTO);
-		igt_pipe_crc_start(data->pipe_crc);
-
-		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
-			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
-			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
-			p[0].modifier = planeconfigs[i].modifier;
-			pointlocation(data, (planeinfos *)&p, mode, 0);
-
-			for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
-				p[0].format = formatlist[k];
+	int i, j, k, l, flipsw, fliphw;
 
-				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
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
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	igt_display_require_output(display);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	used_w = TEST_WIDTH(mode);
+	used_h = TEST_HEIGHT(mode);
+
+	p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
+
+	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
+					  INTEL_PIPE_CRC_SOURCE_AUTO);
+	igt_pipe_crc_start(data->pipe_crc);
+
+	for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
+		p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
+		p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
+		p[0].modifier = planeconfigs[i].modifier;
+		pointlocation(data, (planeinfos *)&p, mode, 0);
+
+		for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
+			p[0].format = formatlist[k];
+
+			for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
+				p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
+				p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
+				p[1].modifier = planeconfigs[j].modifier;
+				pointlocation(data, (planeinfos *)&p,
+					      mode, 1);
+
+				for (l = 0; l < ARRAY_SIZE(formatlist); l++) {
+					p[1].format = formatlist[l];
+					/*
+					 * RGB565 90/270 degrees rotation is supported
+					 * from gen11 onwards.
+					 */
+					if (p[0].format == DRM_FORMAT_RGB565 &&
+					     igt_rotation_90_or_270(planeconfigs[i].rotation)
+					     && intel_display_ver(data->devid) < 11)
+						continue;
 
-						if (p[1].format == DRM_FORMAT_RGB565 &&
-						     igt_rotation_90_or_270(planeconfigs[j].rotation)
-						     && intel_display_ver(data->devid) < 11)
-							continue;
+					if (p[1].format == DRM_FORMAT_RGB565 &&
+					     igt_rotation_90_or_270(planeconfigs[j].rotation)
+					     && intel_display_ver(data->devid) < 11)
+						continue;
 
-						if (!igt_plane_has_rotation(p[0].plane,
-									    planeconfigs[i].rotation))
-							continue;
+					if (!igt_plane_has_rotation(p[0].plane,
+								    planeconfigs[i].rotation))
+						continue;
 
-						if (!igt_plane_has_rotation(p[1].plane,
-									    planeconfigs[j].rotation))
-							continue;
+					if (!igt_plane_has_rotation(p[1].plane,
+								    planeconfigs[j].rotation))
+						continue;
 
+					/*
+					 * if using packed formats crc's will be
+					 * same and can store them so there's
+					 * no need to redo comparison image and
+					 * just use stored crc.
+					 */
+					if (!igt_format_is_yuv_semiplanar(p[0].format) &&
+					    !igt_format_is_yuv_semiplanar(p[1].format) &&
+					    crclog[ctz(planeconfigs[i].rotation) |
+					    (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
+						retcrc_sw = crclog[ctz(planeconfigs[i].rotation) |
+							    (ctz(planeconfigs[j].rotation) << 2)];
+						have_crc = true;
+					} else if ((p[0].format == DRM_FORMAT_NV12 ||
+						  p[0].format == DRM_FORMAT_P010) &&
+						  p[1].format != DRM_FORMAT_NV12 &&
+						  p[1].format != DRM_FORMAT_P010 &&
+						  lastroundjformat != DRM_FORMAT_NV12 &&
+						  lastroundjformat != DRM_FORMAT_P010 &&
+						  planeconfigs[i].rotation == lastroundirotation &&
+						  planeconfigs[j].rotation == lastroundjrotation) {
 						/*
-						 * if using packed formats crc's will be
-						 * same and can store them so there's
-						 * no need to redo comparison image and
-						 * just use stored crc.
+						 * With NV12 can benefit from
+						 * previous crc if rotations
+						 * stay same. If both planes
+						 * have NV12 in use we need to
+						 * skip that case.
+						 * If last round right plane
+						 * had NV12 need to skip this.
 						 */
-						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
-						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
-							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
-							have_crc = true;
-						} else if((p[0].format == DRM_FORMAT_NV12 || p[0].format == DRM_FORMAT_P010) &&
-							   p[1].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_P010 &&
-							   lastroundjformat != DRM_FORMAT_NV12 && lastroundjformat != DRM_FORMAT_P010 &&
-							   planeconfigs[i].rotation == lastroundirotation &&
-							   planeconfigs[j].rotation == lastroundjrotation) {
-							/*
-							 * With NV12 can benefit from
-							 * previous crc if rotations
-							 * stay same. If both planes
-							 * have NV12 in use we need to
-							 * skip that case.
-							 * If last round right plane
-							 * had NV12 need to skip this.
-							 */
-							have_crc = true;
-						} else {
-							/*
-							 * here will be created
-							 * comparison image and get crc
-							 * if didn't have stored crc
-							 * or planar format is in use.
-							 * have_crc flag will control
-							 * crc comparison part.
-							 */
-							p[0].rotation_sw = planeconfigs[i].rotation;
-							p[0].rotation_hw = IGT_ROTATION_0;
-							p[1].rotation_sw = planeconfigs[j].rotation;
-							p[1].rotation_hw = IGT_ROTATION_0;
-							if (!setup_multiplane(data,
-									(planeinfos *)&p,
-									&planeconfigs[i].fbs[k][MULTIPLANE_REFERENCE],
-									&planeconfigs[j].fbs[l][MULTIPLANE_REFERENCE]))
-								continue;
-							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-							flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
-							have_crc = false;
-						}
-
+						have_crc = true;
+					} else {
 						/*
-						 * create hw rotated image and
-						 * get vblank where interesting
-						 * crc will be at, grab crc bit later
+						 * here will be created
+						 * comparison image and get crc
+						 * if didn't have stored crc
+						 * or planar format is in use.
+						 * have_crc flag will control
+						 * crc comparison part.
 						 */
-						p[0].rotation_sw = IGT_ROTATION_0;
-						p[0].rotation_hw = planeconfigs[i].rotation;
-						p[1].rotation_sw = IGT_ROTATION_0;
-						p[1].rotation_hw = planeconfigs[j].rotation;
-
+						p[0].rotation_sw = planeconfigs[i].rotation;
+						p[0].rotation_hw = IGT_ROTATION_0;
+						p[1].rotation_sw = planeconfigs[j].rotation;
+						p[1].rotation_hw = IGT_ROTATION_0;
 						if (!setup_multiplane(data,
-								      (planeinfos *)&p,
-								      &planeconfigs[i].fbs[k][MULTIPLANE_ROTATED],
-								      &planeconfigs[j].fbs[l][MULTIPLANE_ROTATED]))
+						    (planeinfos *)&p,
+						    &planeconfigs[i].fbs[k][MULTIPLANE_REFERENCE],
+						    &planeconfigs[j].fbs[l][MULTIPLANE_REFERENCE]))
 							continue;
+						igt_display_commit_atomic(display,
+									  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+						flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+						have_crc = false;
+					}
 
-						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-						fliphw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+					/*
+					 * create hw rotated image and
+					 * get vblank where interesting
+					 * crc will be at, grab crc bit later
+					 */
+					p[0].rotation_sw = IGT_ROTATION_0;
+					p[0].rotation_hw = planeconfigs[i].rotation;
+					p[1].rotation_sw = IGT_ROTATION_0;
+					p[1].rotation_hw = planeconfigs[j].rotation;
+
+					if (!setup_multiplane(data,
+							      (planeinfos *)&p,
+							      &planeconfigs[i].fbs[k][MULTIPLANE_ROTATED],
+							      &planeconfigs[j].fbs[l][MULTIPLANE_ROTATED]))
+						continue;
 
-						if (!have_crc) {
-							igt_pipe_crc_get_for_frame(data->gfx_fd,
-										   data->pipe_crc,
-										   flipsw,
-										   &retcrc_sw);
+					igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+					fliphw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
 
-							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
-								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
-								= retcrc_sw;
-						}
-						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
+					if (!have_crc) {
+						igt_pipe_crc_get_for_frame(data->gfx_fd,
+									   data->pipe_crc,
+									   flipsw,
+									   &retcrc_sw);
 
-						str1 = igt_crc_to_string(&retcrc_sw);
-						str2 = igt_crc_to_string(&retcrc_hw);
+						if (!igt_format_is_yuv_semiplanar(p[0].format) &&
+						    !igt_format_is_yuv_semiplanar(p[1].format))
+							crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
+							= retcrc_sw;
+					}
+					igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
 
-						igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
-							str1, str2,
-							(char *) &p[0].format, (char *) &p[1].format,
-							have_crc?"yes":" no",
-							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[i].rotation)],
-							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[j].rotation)]);
+					str1 = igt_crc_to_string(&retcrc_sw);
+					str2 = igt_crc_to_string(&retcrc_hw);
 
-						free(str1);
-						free(str2);
+					igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
+						str1, str2,
+						(char *) &p[0].format, (char *) &p[1].format,
+						have_crc?"yes":" no",
+						(int[]) {0, 90, 180, 270} [ctz(planeconfigs[i].rotation)],
+						(int[]) {0, 90, 180, 270} [ctz(planeconfigs[j].rotation)]);
 
+					free(str1);
+					free(str2);
 
-						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
 
-						lastroundjformat = p[1].format;
-						lastroundirotation = planeconfigs[i].rotation;
-						lastroundjrotation = planeconfigs[j].rotation;
-					}
+					igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
+
+					lastroundjformat = p[1].format;
+					lastroundirotation = planeconfigs[i].rotation;
+					lastroundjrotation = planeconfigs[j].rotation;
 				}
 			}
 		}
-		igt_pipe_crc_stop(data->pipe_crc);
-		igt_pipe_crc_free(data->pipe_crc);
+	}
+	igt_pipe_crc_stop(data->pipe_crc);
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_plane_set_fb(p[0].plane, NULL);
+	igt_plane_set_fb(p[1].plane, NULL);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-		igt_plane_set_fb(p[0].plane, NULL);
-		igt_plane_set_fb(p[1].plane, NULL);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	for (i = 0; i < ARRAY_SIZE(crclog); i++)
+		crclog[i].frame = 0;
 
-		for (i = 0; i < ARRAY_SIZE(crclog); i++)
-			crclog[i].frame = 0;
+	lastroundjformat = 0;
+	lastroundirotation = 0;
+	lastroundjrotation = 0;
 
-		lastroundjformat = 0;
-		lastroundirotation = 0;
-		lastroundjrotation = 0;
 
+	igt_output_set_pipe(output, PIPE_NONE);
 
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
 	data->pipe_crc = NULL;
 
 	for (c = 0; c < ARRAY_SIZE(planeconfigs); c++) {
@@ -1049,6 +1040,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	};
 
 	int gen = 0;
+	enum pipe pipe;
+	igt_output_t *output;
 
 	igt_fixture {
 		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1066,67 +1059,96 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_describe("Rotation test with 90/270 degree for primary and sprite planes of gen9+");
-	for (subtest = subtests; subtest->rot; subtest++) {
-		igt_subtest_f("%s-rotation-%s",
-			      plane_test_str(subtest->plane),
-			      rot_test_str(subtest->rot)) {
-			if (is_amdgpu_device(data.gfx_fd)) {
-				data.override_fmt = DRM_FORMAT_XRGB8888;
-				if (igt_rotation_90_or_270(subtest->rot))
-					data.override_modifier = AMD_FMT_MOD |
-						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
-						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
-				else
-					data.override_modifier = DRM_FORMAT_MOD_LINEAR;
+	igt_subtest_with_dynamic("rotation") {
+		for (subtest = subtests; subtest->rot; subtest++) {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-rotation-%s-%s-pipe-%s",
+						      plane_test_str(subtest->plane),
+						      rot_test_str(subtest->rot),
+						      output->name, kmstest_pipe_name(pipe)) {
+						if (is_amdgpu_device(data.gfx_fd)) {
+							data.override_fmt = DRM_FORMAT_XRGB8888;
+							if (igt_rotation_90_or_270(subtest->rot))
+								data.override_modifier = AMD_FMT_MOD |
+								AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
+								AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
+							else
+								data.override_modifier = DRM_FORMAT_MOD_LINEAR;
+						}
+					data.rotation = subtest->rot;
+					test_plane_rotation(&data, subtest->plane, false, pipe, output);
+					}
+				}
 			}
-			data.rotation = subtest->rot;
-			test_plane_rotation(&data, subtest->plane, false);
 		}
 	}
 
 	igt_describe("Rotation test with 90 degree for a plane of gen9+ with given position");
-	igt_subtest_f("sprite-rotation-90-pos-100-0") {
+	igt_subtest_with_dynamic("sprite-rotation-90-pos-100-0") {
 		data.rotation = IGT_ROTATION_90;
 		data.pos_x = 100,
 		data.pos_y = 0;
-		test_plane_rotation(&data, DRM_PLANE_TYPE_OVERLAY, false);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+					test_plane_rotation(&data, DRM_PLANE_TYPE_OVERLAY, false, pipe, output);
+			}
+		}
 	}
 	data.pos_x = 0,
 	data.pos_y = 0;
 
 	igt_describe("Checking unsupported pixel format for gen9+ with 90 degree of rotation");
-	igt_subtest_f("bad-pixel-format") {
+	igt_subtest_with_dynamic("bad-pixel-format") {
 		 /* gen11 enables RGB565 rotation for 90/270 degrees.
 		  * so apart from this, any other gen11+ pixel format
 		  * can be used which doesn't support 90/270 degree
 		  * rotation */
 		data.rotation = IGT_ROTATION_90;
 		data.override_fmt = gen < 11 ? DRM_FORMAT_RGB565 : DRM_FORMAT_Y212;
-		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+					test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true, pipe, output);
+			}
+		}
 	}
 	data.override_fmt = 0;
 
 	igt_describe("Checking unsupported tiling for gen9+ with 90 degree of rotation");
-	igt_subtest_f("bad-tiling") {
+	igt_subtest_with_dynamic("bad-tiling") {
 		data.rotation = IGT_ROTATION_90;
 		data.override_modifier = I915_FORMAT_MOD_X_TILED;
-		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+					test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true, pipe, output);
+			}
+		}
 	}
 	data.override_modifier = 0;
 
 	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
-	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
-		igt_subtest_f("primary-%s-reflect-x-%s",
-			      modifier_test_str(reflect_x->modifier),
-			      rot_test_str(reflect_x->rot)) {
-			data.rotation = (IGT_REFLECT_X | reflect_x->rot);
-			data.override_modifier = reflect_x->modifier;
-			test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, false);
+	igt_subtest_with_dynamic("reflect") {
+		for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("primary-%s-reflect-x-%s-%s-pipe-%s",
+						       modifier_test_str(reflect_x->modifier),
+						       rot_test_str(reflect_x->rot),
+						       output->name, kmstest_pipe_name(pipe)) {
+						data.rotation = (IGT_REFLECT_X | reflect_x->rot);
+						data.override_modifier = reflect_x->modifier;
+						test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, false, pipe, output);
+					}
+				}
+			}
 		}
 	}
 
 	igt_describe("Rotation test on both planes by making them fully visible");
-	igt_subtest_f("multiplane-rotation") {
+	igt_subtest_with_dynamic("multiplane-rotation") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
@@ -1135,12 +1157,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.4f;
 		data.planepos[1].y = .1f;
-		test_multi_plane_rotation(&data, 0);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+					test_multi_plane_rotation(&data, pipe, output);
+				}
+			}
+		}
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
 			"right/top corner of sprite plane");
-	igt_subtest_f("multiplane-rotation-cropping-top") {
+	igt_subtest_with_dynamic("multiplane-rotation-cropping-top") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
@@ -1149,12 +1177,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.15f;
-		test_multi_plane_rotation(&data, 0);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+					test_multi_plane_rotation(&data, pipe, output);
+				}
+			}
+		}
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
 			"and right/bottom corner of sprite plane");
-	igt_subtest_f("multiplane-rotation-cropping-bottom") {
+	igt_subtest_with_dynamic("multiplane-rotation-cropping-bottom") {
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_bottom | p_left;
@@ -1163,7 +1197,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_bottom | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.20f;
-		test_multi_plane_rotation(&data, 0);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+					test_multi_plane_rotation(&data, pipe, output);
+				}
+			}
+		}
 	}
 
 	/*
@@ -1171,17 +1211,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 * the following subtests otherwise.
 	 */
 	igt_describe("This test intends to check for fence leaks exhaustively");
-	igt_subtest_f("exhaust-fences") {
-		enum pipe pipe;
-		igt_output_t *output;
+	igt_subtest_with_dynamic("exhaust-fences") {
 
 		igt_display_require_output(&data.display);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			igt_plane_t *primary = &data.display.pipes[pipe].planes[0];
+		for_each_pipe(&data.display, pipe) {
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+				igt_plane_t *primary = &data.display.pipes[pipe].planes[0];
+				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
 
-			test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
-			break;
+					test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
+				}
+			}
 		}
 	}
 
-- 
2.36.0
