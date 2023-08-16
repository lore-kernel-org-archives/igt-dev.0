Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC610E3BF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 20:54:19 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 14:53:16 -0600
Message-ID: <20230816205316.867195-3-alex.hung@amd.com>
In-Reply-To: <20230816205316.867195-1-alex.hung@amd.com>
References: <20230816205316.867195-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/3] tests/kms_writeback: support
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

Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
available.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_writeback.c | 67 ++++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index de1267ec9..3b83fed70 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -77,32 +77,47 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
-	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	uint16_t i;
+
+	const uint32_t writeback_formats[] = {
+		DRM_FORMAT_XRGB8888,
+		DRM_FORMAT_XRGB2101010,
+	};
+
+	data.format = DRM_FORMAT_XRGB8888;
 
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
-	igt_assert(ret >= 0);
+	for (i = 0; i < sizeof(writeback_formats) / sizeof(u32); i++) {
 
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    writeback_format, modifier, &output_fb);
-	igt_assert(ret >= 0);
+		ret = igt_create_fb(display->drm_fd, width, height,
+				    writeback_formats[i], modifier, &input_fb);
+		igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+		ret = igt_create_fb(display->drm_fd, width, height,
+				    writeback_formats[i], modifier, &output_fb);
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
+		if (!data.wb_fmt && !ret) {
+			data.format = writeback_formats[i];
+			break;
+		}
+	}
 
 	return !ret;
 }
@@ -268,7 +283,7 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888 || fb->drm_format == DRM_FORMAT_XRGB2101010);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -296,11 +311,17 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
 {
 	int i = 0;
-	uint32_t in_fb_colors[2] = { 0x42ff0000, 0x4200ff00 };
+	uint32_t *in_fb_colors;
+	uint32_t in_fb_colors_8bits[2] = { 0x3ff00000, 0x000ffc00 };
+	uint32_t in_fb_colors_10bits[2] = { 0x42ff0000, 0x4200ff00 };
 	uint32_t clear_color = 0xffffffff;
-
 	igt_crc_t cleared_crc, out_expected;
 
+	if (data.format == DRM_FORMAT_XRGB2101010)
+		in_fb_colors = in_fb_colors_10bits;
+	else
+		in_fb_colors = in_fb_colors_8bits;
+
 	for (i = 0; i < n_commits; i++) {
 		/* Change the input color each time */
 		fill_fb(in_fb, in_fb_colors[i % 2]);
@@ -366,7 +387,7 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 	writeback_sequence(output, plane, input_fb, out_fbs, 2);
 
 	fb_id = igt_create_fb(output_fb->fd, output_fb->width, output_fb->height,
-			      DRM_FORMAT_XRGB8888,
+			      data.format,
 			      igt_fb_mod_to_tiling(0),
 			      &second_out_fb);
 	igt_require(fb_id > 0);
@@ -524,7 +545,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
 				      mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data.format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &input_fb);
 		igt_assert(fb_id >= 0);
@@ -572,7 +593,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      data.format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
@@ -588,7 +609,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data.format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &output_fb);
 		igt_require(fb_id > 0);
@@ -604,7 +625,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data.format,
 				      igt_fb_mod_to_tiling(0),
 				      &output_fb);
 		igt_require(fb_id > 0);
-- 
2.34.1
