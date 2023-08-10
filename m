Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4E10E5F5
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 20:24:04 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 13:23:40 -0700
Message-ID: <20230810202340.2388-3-quic_abhinavk@quicinc.com>
In-Reply-To: <20230810202340.2388-1-quic_abhinavk@quicinc.com>
References: <20230810202340.2388-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_writeback: allow writeback
 to output custom format
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

In some display pipelines, such as MSM, the writeback block is
capable of writing in an output format other than DRM_FORMAT_XRGB8888
such as DRM_FORMAT_NV12.

To allow validation of these formats, allow kms_writeback to
take a command line argument which supports passing the writeback's
output fb format to something other than DRM_FORMAT_XRGB8888.

The DRM_FORMAT_XRGB8888 checks have been relaxed to allow YUV formats
as those are the ones verified while adding support for this feature
with MSM boards.

This option is supported only along with the --dump option because
the CRC validation API needs to be extended to handle
non-DRM_FORMAT_XRGB8888 formats to make that possible.

changes in v2:
	- removed an unnecessary new line

changes in v3:
	- renamed wb_yuv_fmt to wb_fmt to allow all formats
	- restrict the custom format usage to --dump option

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 tests/kms_writeback.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index db1f0884fcd0..de1267ec9194 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -45,6 +45,8 @@ typedef struct {
 	bool custom_mode;
 	bool list_modes;
 	bool dump_check;
+	bool wb_fmt;
+	uint32_t format;
 	int mode_index;
 	drmModeModeInfo user_mode;
 } data_t;
@@ -404,8 +406,10 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 
 	path_name = getenv("IGT_FRAME_DUMP_PATH");
 	file_name = getenv("FRAME_PNG_FILE_NAME");
-	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				igt_fb_mod_to_tiling(0), &output_fb);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      data.wb_fmt ? data.format : DRM_FORMAT_XRGB8888,
+			      igt_fb_mod_to_tiling(0), &output_fb);
 	igt_require(fb_id > 0);
 
 	do_single_commit(output, plane, input_fb, &output_fb);
@@ -454,6 +458,11 @@ static int opt_handler(int option, int option_index, void *_data)
 	case 'd':
 		data.dump_check = true;
 		break;
+	case 'f':
+		data.wb_fmt = true;
+		data.format = igt_drm_format_str_to_format(optarg);
+		igt_info("writeback format = %s\n", igt_format_str(data.format));
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -462,6 +471,8 @@ static int opt_handler(int option, int option_index, void *_data)
 
 const char *help_str =
 	" --list-modes | -l List of writeback connector modes\n"
+	" --writeback-format | -f Test yuv output format for writeback with dump option\n"
+	" <name of the fourcc format as documented in the format_desc of igt_fb>\n"
 	" --built-in | -b Commits a built-in mode\n"
 	" --custom | -c Commits a custom mode inputted by user"
 	" <clock MHz>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,"
@@ -475,10 +486,11 @@ static const struct option long_options[] = {
 	{ .name = "built-in", .has_arg = true, .val = 'b', },
 	{ .name = "custom", .has_arg = true, .val = 'c', },
 	{ .name = "dump", .has_arg = false, .val = 'd', },
+	{ .name = "writeback-format", .has_arg = true, .val = 'f', },
 	{}
 };
 
-igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
+igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 {
 	igt_display_t display;
 	igt_output_t *output;
-- 
2.40.1
