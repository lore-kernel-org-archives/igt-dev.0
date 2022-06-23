Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A6D10E06C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 00:45:44 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jun 2022 17:45:22 -0700
Message-ID: <20220623004522.23997-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Enhance
 kms_writeback for custom modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Enhance kms_writeback to add support for the below options:

- View all writeback modes
Usage: "./kms_writeback --list-modes"

- Test a standard mode from connector list
Usage: "./kms_writeback --standard <mode_index>"

- Test a custom mode from user input
Usage: "./kms_writeback --custom <mode_parameters>"
Refer to --help for exact syntax

- Dump the writeback output buffer to png file
Usage: "./kms_writeback --dump"

Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 tests/kms_writeback.c | 182 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 161 insertions(+), 21 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6efc72df..72040d44 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -26,11 +26,13 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+#include <limits.h>
 
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "sw_sync.h"
+#include "igt_chamelium.h"
 
 IGT_TEST_DESCRIPTION(
    "This test validates the expected behavior of the writeback connectors "
@@ -39,6 +41,17 @@ IGT_TEST_DESCRIPTION(
    "by using CRC."
 );
 
+typedef struct {
+	bool standard_mode;
+	bool custom_mode;
+	bool list_modes;
+	bool dump_check;
+	int mode_index;
+	drmModeModeInfo user_mode;
+} data_t;
+
+static data_t data;
+
 static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
 {
 	drmModePropertyBlobRes *blob = NULL;
@@ -58,29 +71,15 @@ static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
 	return blob;
 }
 
-static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
+static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+				drmModeModeInfo override_mode)
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
 	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
-	drmModeModeInfo override_mode = {
-		.clock = 25175,
-		.hdisplay = 640,
-		.hsync_start = 656,
-		.hsync_end = 752,
-		.htotal = 800,
-		.hskew = 0,
-		.vdisplay = 480,
-		.vsync_start = 490,
-		.vsync_end = 492,
-		.vtotal = 525,
-		.vscan = 0,
-		.vrefresh = 60,
-		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-		.name = {"640x480-60"},
-	};
+
 	igt_output_override_mode(output, &override_mode);
 
 	width = override_mode.hdisplay;
@@ -109,9 +108,27 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
 
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 {
+	enum pipe pipe;
 	int i;
 	enum pipe pipe;
 
+	drmModeModeInfo override_mode = {
+		.clock = 25175,
+		.hdisplay = 640,
+		.hsync_start = 656,
+		.hsync_end = 752,
+		.htotal = 800,
+		.hskew = 0,
+		.vdisplay = 480,
+		.vsync_start = 490,
+		.vsync_end = 492,
+		.vtotal = 525,
+		.vscan = 0,
+		.vrefresh = 60,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.name = {"640x480-60"},
+	};
+
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
 
@@ -121,7 +138,12 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
 
-			if (check_writeback_config(display, output)) {
+			if (data.custom_mode)
+				override_mode = data.user_mode;
+			if (data.standard_mode)
+				override_mode = output->config.connector->modes[data.mode_index];
+
+			if (check_writeback_config(display, output, override_mode)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -347,7 +369,114 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 	igt_remove_fb(output_fb->fd, &second_out_fb);
 }
 
-igt_main
+static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t *in_fb,
+					igt_fb_t *out_fb)
+{
+	uint32_t in_fb_color = 0xffff0000;
+
+	fill_fb(in_fb, in_fb_color);
+
+	igt_plane_set_fb(plane, in_fb);
+	igt_output_set_writeback_fb(output, out_fb);
+
+	igt_display_commit_atomic(output->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (out_fb)
+		get_and_wait_out_fence(output);
+}
+
+static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
+					igt_fb_t *input_fb, drmModeModeInfo *mode)
+{
+	cairo_surface_t *fb_surface_out;
+	char filename_out[PATH_MAX];
+	cairo_status_t status;
+	char *id;
+	unsigned int fb_id;
+	igt_fb_t output_fb;
+
+	id = getenv("IGT_FRAME_DUMP_PATH");
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+				igt_fb_mod_to_tiling(0), &output_fb);
+	igt_require(fb_id > 0);
+
+	do_single_commit(output, plane, input_fb, &output_fb);
+
+	fb_surface_out = igt_get_cairo_surface(display->drm_fd, &output_fb);
+	snprintf(filename_out, PATH_MAX, "%s/%s.png", id, "frame-out");
+	status = cairo_surface_write_to_png(fb_surface_out, filename_out);
+	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
+
+	igt_remove_fb(display->drm_fd, &output_fb);
+}
+
+static igt_output_t *list_writeback_modes(igt_display_t *display)
+{
+	for (int i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK) {
+			for (int j = 0; j < output->config.connector->count_modes; j++) {
+				igt_info("[%d]", j);
+				kmstest_dump_mode(&output->config.connector->modes[j]);
+			}
+			break;
+		}
+	}
+	return NULL;
+}
+
+static int parse_mode_string(char *optarg)
+{
+	return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
+			&data.user_mode.hdisplay, &data.user_mode.hsync_start,
+			&data.user_mode.hsync_end, &data.user_mode.htotal,
+			&data.user_mode.hskew, &data.user_mode.vdisplay,
+			&data.user_mode.vsync_start, &data.user_mode.vsync_end,
+			&data.user_mode.vtotal, &data.user_mode.vscan,
+			&data.user_mode.vrefresh, &data.user_mode.type,
+			&data.user_mode.flags, &data.user_mode.name);
+}
+
+static int opt_handler(int option, int option_index, void *_data)
+{
+	switch (option) {
+	case 'l':
+		data.list_modes = true;
+		break;
+	case 's':
+		data.standard_mode = true;
+		data.mode_index = atoi(optarg);
+		break;
+	case 'c':
+		data.custom_mode = true;
+		igt_assert(parse_mode_string(optarg) > 0);
+		break;
+	case 'd':
+		data.dump_check = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	" --list-modes | -l List of writeback connector modes\n"
+	" --standard | -s Commits a standard mode\n"
+	" --custom | -c Commits a custom mode inputted by user <clock:hdisplay:hsyncstart:hsyncend:"
+	"htotal:hskew:vdisplay:vsyncstart:vsyncend:vtotal:vscan:vrefresh:flags:name>\n"
+	" --dump | -d Prints buffer to file - Use command: export IGT_FRAME_DUMP_PATH=\"<filepath>\""
+	" before running dump. Will skip all other tests.\n";
+
+static const struct option long_options[] = {
+	{ .name = "list-modes", .has_arg = false, .val = 'l', },
+	{ .name = "standard", .has_arg = true, .val = 's', },
+	{ .name = "custom", .has_arg = true, .val = 'c', },
+	{ .name = "dump", .has_arg = false, .val = 'd', },
+	{}
+};
+
+igt_main_args("s:c:dl", long_options, help_str, opt_handler, NULL)
 {
 	igt_display_t display;
 	igt_output_t *output;
@@ -386,15 +515,23 @@ igt_main
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 		igt_plane_set_fb(plane, &input_fb);
-	}
 
+		if (data.list_modes)
+			list_writeback_modes(&display);
+		if (data.dump_check)
+			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
+	}
+	 /*
+	  * When dump_check or list_modes flag is high, then the following subtests will be skipped
+	  * as we do not want to do CRC validation.
+	  */
 	igt_describe("Check the writeback format");
 	igt_subtest("writeback-pixel-formats") {
+		igt_skip_on(data.dump_check || data.list_modes);
 		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
 		const char *valid_chars = "01234568 ABCGNRUVXY";
 		unsigned int i;
 		char *c;
-
 		/*
 		 * We don't have a comprehensive list of formats, so just check
 		 * that the blob length is sensible and that it doesn't contain
@@ -412,6 +549,7 @@ igt_main
 		     "(output framebuffer and fence); this test goes through"
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
+		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t invalid_output_fb;
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
@@ -427,6 +565,7 @@ igt_main
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
 	igt_subtest("writeback-fb-id") {
+		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t output_fb;
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
@@ -441,6 +580,7 @@ igt_main
 
 	igt_describe("Check writeback output with CRC validation");
 	igt_subtest("writeback-check-output") {
+		igt_skip_on(data.dump_check || data.list_modes);
 		igt_fb_t output_fb;
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
-- 
2.17.1
