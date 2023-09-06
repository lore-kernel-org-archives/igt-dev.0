Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B91710E1E1
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 22:39:22 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Sep 2023 16:37:30 -0600
Message-ID: <20230906223730.3979103-4-alex.hung@amd.com>
In-Reply-To: <20230906223730.3979103-1-alex.hung@amd.com>
References: <20230906223730.3979103-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/3][i-g-t][V2] tests/kms_writeback: support
 DRM_FORMAT_XRGB2101010 for writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: brian.starkey@arm.com, maxime@cerno.tech
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new subtests for DRM_FORMAT_XRGB2101010 when it is supported.
The change also checks supported color formats and runs or skips
accordingly.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_writeback.c | 140 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 113 insertions(+), 27 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index fce6554ce..110139547 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -40,6 +40,14 @@
  *              writeback; it validates bad and good combination, check color
  *              format, and check the output result by using CRC.
  *
+ * SUBTEST: writeback-check-output-XRGB2101010
+ * Description: Check XRGB2101010 writeback output with CRC validation
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
  * SUBTEST: writeback-check-output
  * Description: Check writeback output with CRC validation
  * Driver requirement: i915, xe
@@ -48,6 +56,14 @@
  * Run type: FULL
  * Test category: functionality test
  *
+ * SUBTEST: writeback-fb-id-XRGB2101010
+ * Description: Validate WRITEBACK_FB_ID with valid and invalid options
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
  * SUBTEST: writeback-fb-id
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
  * Driver requirement: i915, xe
@@ -89,12 +105,23 @@ typedef struct {
 	bool dump_check;
 	bool wb_fmt;
 	uint32_t format;
+	uint64_t supported_colors;
 	int mode_index;
 	drmModeModeInfo user_mode;
 } data_t;
 
 static data_t data;
 
+static const uint32_t fourcc[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB2101010,
+};
+
+enum {
+	XRGB8888 = 1 << 0,
+	XRGB2101010 = 1 << 1,
+};
+
 static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
 {
 	drmModePropertyBlobRes *blob = NULL;
@@ -119,32 +146,38 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
-	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	uint16_t i;
 
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
-	igt_assert(ret >= 0);
+	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
 
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    writeback_format, modifier, &output_fb);
-	igt_assert(ret >= 0);
+		ret = igt_create_fb(display->drm_fd, width, height,
+				    fourcc[i], modifier, &input_fb);
+		igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+		ret = igt_create_fb(display->drm_fd, width, height,
+				    fourcc[i], modifier, &output_fb);
+		igt_assert(ret >= 0);
 
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_plane_set_fb(plane, NULL);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, &input_fb);
+		igt_output_set_writeback_fb(output, &output_fb);
+
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_plane_set_fb(plane, NULL);
+		igt_remove_fb(display->drm_fd, &input_fb);
+		igt_remove_fb(display->drm_fd, &output_fb);
+
+		if (!ret)
+			data.supported_colors |= 1 << i;
+	}
 
 	return !ret;
 }
@@ -310,7 +343,7 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -335,14 +368,21 @@ static void get_and_wait_out_fence(igt_output_t *output)
 }
 
 static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
-				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
+			       igt_fb_t *in_fb, igt_fb_t *out_fbs[],
+			       int n_commits, uint32_t fourcc_color)
 {
 	int i = 0;
-	uint32_t in_fb_colors[2] = { 0x42ff0000, 0x4200ff00 };
+	uint32_t *in_fb_colors;
+	uint32_t in_fb_colors_8bits[2] = { 0x42ff0000, 0x4200ff00 };
+	uint32_t in_fb_colors_10bits[2] = { 0x3ff00000, 0x000ffc00 };
 	uint32_t clear_color = 0xffffffff;
-
 	igt_crc_t cleared_crc, out_expected;
 
+	if (fourcc_color == DRM_FORMAT_XRGB2101010)
+		in_fb_colors = in_fb_colors_10bits;
+	else
+		in_fb_colors = in_fb_colors_8bits;
+
 	for (i = 0; i < n_commits; i++) {
 		/* Change the input color each time */
 		fill_fb(in_fb, in_fb_colors[i % 2]);
@@ -390,32 +430,33 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 }
 
 static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
-				   igt_fb_t *input_fb, igt_fb_t *output_fb)
+				   igt_fb_t *input_fb, igt_fb_t *output_fb,
+				   uint32_t fourcc_color)
 {
 	igt_fb_t *out_fbs[2] = { 0 };
 	igt_fb_t second_out_fb;
 	unsigned int fb_id;
 
 	/* One commit, with a writeback. */
-	writeback_sequence(output, plane, input_fb, &output_fb, 1);
+	writeback_sequence(output, plane, input_fb, &output_fb, 1, fourcc_color);
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	fb_id = igt_create_fb(output_fb->fd, output_fb->width, output_fb->height,
-			      DRM_FORMAT_XRGB8888,
+			      fourcc_color,
 			      igt_fb_mod_to_tiling(0),
 			      &second_out_fb);
 	igt_require(fb_id > 0);
 
 	/* Two commits, with different writeback buffers */
 	out_fbs[1] = &second_out_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	igt_remove_fb(output_fb->fd, &second_out_fb);
 }
@@ -537,7 +578,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane;
-	igt_fb_t input_fb;
+	igt_fb_t input_fb, input_fb_10bit;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 
@@ -570,6 +611,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      DRM_FORMAT_MOD_LINEAR,
 				      &input_fb);
 		igt_assert(fb_id >= 0);
+
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+				      mode.vdisplay,
+				      DRM_FORMAT_XRGB2101010,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &input_fb_10bit);
+		igt_assert(fb_id >= 0);
+
 		igt_plane_set_fb(plane, &input_fb);
 
 		if (data.list_modes)
@@ -629,6 +678,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_fb_t output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB8888),"%.4s is unsupported\n", (char*) &fourcc[0]);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
@@ -640,18 +690,53 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
+	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
+	igt_subtest("writeback-fb-id-XRGB2101010") {
+		igt_fb_t output_fb;
+
+		igt_skip_on(data.dump_check || data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "%.4s is unsupported\n", (char*) &fourcc[1]);
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB2101010,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &output_fb);
+		igt_require(fb_id > 0);
+
+		writeback_fb_id(output, &input_fb_10bit, &output_fb);
+
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
 	igt_describe("Check writeback output with CRC validation");
 	igt_subtest("writeback-check-output") {
 		igt_fb_t output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB8888), "%.4s is unsupported\n", (char*) &fourcc[0]);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
 				      &output_fb);
 		igt_require(fb_id > 0);
 
-		writeback_check_output(output, plane, &input_fb, &output_fb);
+		writeback_check_output(output, plane, &input_fb, &output_fb, fourcc[0]);
+
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
+	igt_describe("Check XRGB2101010 writeback output with CRC validation");
+	igt_subtest("writeback-check-output-XRGB2101010") {
+		igt_fb_t output_fb;
+
+		igt_skip_on(data.dump_check || data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "%.4s is unsupported\n", (char*) &fourcc[1]);
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB2101010,
+				      igt_fb_mod_to_tiling(0),
+				      &output_fb);
+		igt_require(fb_id > 0);
+
+		writeback_check_output(output, plane, &input_fb_10bit, &output_fb, fourcc[1]);
 
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
@@ -659,6 +744,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_fixture {
 		detach_crtc(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
+		igt_remove_fb(display.drm_fd, &input_fb_10bit);
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.42.0
