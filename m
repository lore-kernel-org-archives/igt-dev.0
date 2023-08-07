Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8ED10E391
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 22:48:59 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 7 Aug 2023 15:48:28 -0700
Message-ID: <20230807224828.27288-4-quic_abhinavk@quicinc.com>
In-Reply-To: <20230807224828.27288-1-quic_abhinavk@quicinc.com>
References: <20230807224828.27288-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_writeback: allow writeback to
 output custom format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In some display pipelines, such as MSM, the writeback block is
capable of writing in an output format other than DRM_FORMAT_XRGB8888
such as DRM_FORMAT_NV12.

To allow validation of these formats, allow kms_writeback to
take a command line argument which supports passing the writeback's
output fb format to something other than DRM_FORMAT_XRGB8888.

The DRM_FORMAT_XRGB8888 checks have been relaxed to allow YUV formats
as those are the ones verified while adding support for this feature
with MSM boards.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 tests/kms_writeback.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index db1f0884fcd0..a9359bbdbc4b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,6 +45,8 @@ typedef struct {
 	bool custom_mode;
 	bool list_modes;
 	bool dump_check;
+	bool wb_yuv_fmt;
+	uint32_t format;
 	int mode_index;
 	drmModeModeInfo user_mode;
 } data_t;
@@ -75,7 +77,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
-	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
 
@@ -89,7 +90,8 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    writeback_format, modifier, &output_fb);
+			    data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
+			    modifier, &output_fb);
 	igt_assert(ret >= 0);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -266,7 +268,8 @@ static void fill_fb(igt_fb_t *fb, uint32_t pixel)
 	uint32_t *ptr;
 	int64_t pixel_count, i;
 
-	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
+	igt_assert(igt_format_is_yuv(fb->drm_format) ||
+			fb->drm_format == DRM_FORMAT_XRGB8888);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
 	igt_assert(ptr);
@@ -364,7 +367,7 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 	writeback_sequence(output, plane, input_fb, out_fbs, 2);
 
 	fb_id = igt_create_fb(output_fb->fd, output_fb->width, output_fb->height,
-			      DRM_FORMAT_XRGB8888,
+			      data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
 			      igt_fb_mod_to_tiling(0),
 			      &second_out_fb);
 	igt_require(fb_id > 0);
@@ -404,8 +407,10 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
-	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				igt_fb_mod_to_tiling(0), &output_fb);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
+			      igt_fb_mod_to_tiling(0), &output_fb);
 	igt_require(fb_id > 0);
 
 	do_single_commit(output, plane, input_fb, &output_fb);
@@ -438,6 +443,7 @@ static igt_output_t *list_writeback_modes(igt_display_t *display)
 
 static int opt_handler(int option, int option_index, void *_data)
 {
+
 	switch (option) {
 	case 'l':
 		data.list_modes = true;
@@ -454,6 +460,11 @@ static int opt_handler(int option, int option_index, void *_data)
 	case 'd':
 		data.dump_check = true;
 		break;
+	case 'f':
+		data.wb_yuv_fmt = true;
+		data.format = igt_drm_format_str_to_format(optarg);
+		igt_info("writeback format = %s\n", igt_format_str(data.format));
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -462,6 +473,8 @@ static int opt_handler(int option, int option_index, void *_data)
 
 const char *help_str =
 	" --list-modes | -l List of writeback connector modes\n"
+	" --writeback-yuv-format | -f Test yuv output format for writeback\n"
+	" <name of the fourcc format as documented in the format_desc of igt_fb>\n"
 	" --built-in | -b Commits a built-in mode\n"
 	" --custom | -c Commits a custom mode inputted by user"
 	" <clock MHz>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,"
@@ -475,10 +488,11 @@ static const struct option long_options[] = {
 	{ .name = "built-in", .has_arg = true, .val = 'b', },
 	{ .name = "custom", .has_arg = true, .val = 'c', },
 	{ .name = "dump", .has_arg = false, .val = 'd', },
+	{ .name = "writeback-yuv-format", .has_arg = true, .val = 'f', },
 	{}
 };
 
-igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
+igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 {
 	igt_display_t display;
 	igt_output_t *output;
@@ -490,6 +504,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	memset(&display, 0, sizeof(display));
 
 	igt_fixture {
+		igt_info("entering igt_fixture\n");
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&display, display.drm_fd);
 
@@ -560,7 +575,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
@@ -576,7 +591,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &output_fb);
 		igt_require(fb_id > 0);
@@ -592,7 +607,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data.wb_yuv_fmt ? data.format : DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
 				      &output_fb);
 		igt_require(fb_id > 0);
-- 
2.40.1
