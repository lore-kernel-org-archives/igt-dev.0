Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B49510EB78
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 05:47:32 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 11:11:59 +0530
Message-Id: <20220930054159.9900-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220930054159.9900-1-nidhi1.gupta@intel.com>
References: <20220930054159.9900-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v1: move igt_skip_on(data.dump_check || data.list_modes)
    to igt_fixture as it is common for all subtests.
    (Bhanu)
v2: replaced hard coded mode with default mode.
    (Bhanu)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_writeback.c | 52 +++++++++++++------------------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9d134585..8846d6d8 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -107,46 +107,27 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 {
-	int i;
 	enum pipe pipe;
+	igt_output_t *output;
 
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
-
-	for (i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
+	drmModeModeInfo override_mode;
 
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_output_set_pipe(output, pipe);
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for_each_pipe(display, pipe) {
-			igt_output_set_pipe(output, pipe);
+		override_mode = *igt_output_get_mode(output);
 
-			if (data.custom_mode)
-				override_mode = data.user_mode;
-			if (data.builtin_mode)
-				override_mode = output->config.connector->modes[data.mode_index];
-
-			if (check_writeback_config(display, output, override_mode)) {
-				igt_debug("Using connector %u:%s on pipe %d\n",
-					  output->config.connector->connector_id,
-					  output->name, pipe);
+		if (data.custom_mode)
+			override_mode = data.user_mode;
+		if (data.builtin_mode)
+			override_mode = output->config.connector->modes[data.mode_index];
+		if (check_writeback_config(display, output, override_mode)) {
+			igt_debug("Using connector %u:%s on pipe %d\n",
+				   output->config.connector->connector_id,
+				   output->name, pipe);
 				return output;
-			}
 		}
 
 		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
@@ -155,7 +136,6 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 		/* Restore any connectors we don't use, so we don't trip on them later */
 		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
 	}
-
 	return NULL;
 }
 
@@ -498,6 +478,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		igt_require(display.is_atomic);
 
+		igt_skip_on(data.dump_check || data.list_modes);
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 
@@ -533,7 +515,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 		drmModePropertyBlobRes *formats_blob;
 		const char *valid_chars;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		formats_blob = get_writeback_formats_blob(output);
 		valid_chars = "01234568 ABCGNRUVXY";
 
@@ -556,7 +537,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
 				      DRM_FORMAT_XRGB8888,
@@ -573,7 +553,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-fb-id") {
 		igt_fb_t output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
@@ -589,7 +568,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 	igt_subtest("writeback-check-output") {
 		igt_fb_t output_fb;
 
-		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
-- 
2.36.0
