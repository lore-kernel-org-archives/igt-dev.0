Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0639C89C9D
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Jan 2021 14:40:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a9so9695285wrt.5
 for <igt-dev@lists.freedesktop.org>; Sun, 24 Jan 2021 06:40:08 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sun, 24 Jan 2021 16:40:02 +0200
Message-Id: <20210124144002.5741-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled_crc: try to set mode
 to 1080p during test
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

Different default resolutions will affect test execution, try to normalize
situation by always going to 1080p resolution. If this test will run on
connector which doesn't have 1080p resolution, default resolution will be
used. On gen<11 will be used 480p

v2 (Stan): Use igt functions for modesetting. Change igt_warn to igt_debug
because there's one ICL in intel CI with eDP that would show up warnings
randomly depending which machine run which test.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip_scaled_crc.c | 85 ++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index 93d8031f7..f77484063 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -35,6 +35,8 @@ typedef struct {
 	struct igt_fb small_fb;
 	struct igt_fb big_fb;
 	igt_pipe_crc_t *pipe_crc;
+	uint32_t attemptmodewidth;
+	uint32_t attemptmodeheight;
 } data_t;
 
 const struct {
@@ -133,8 +135,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 {
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
-
-	drmModeModeInfo *mode;
+	drmModeModeInfoPtr modetoset = NULL;
 	struct drm_event_vblank ev;
 	int ret;
 
@@ -142,41 +143,24 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 
 	igt_debug("running on output %s pipe %s\n", output->name,
 		  kmstest_pipe_name(pipe));
+
 	if (data->big_fb.fb_id == 0) {
-		mode = igt_output_get_mode(output);
-
-		// big fb will be 4k unless running on older than ICL
-		if (data->gen < 11) {
-			setup_fb(data, &data->small_fb,
-				 min(mode->hdisplay, 640),
-				 min(mode->vdisplay, 480),
-				 flip_scenario_test[index].firstformat,
-				 flip_scenario_test[index].firstmodifier);
-
-			setup_fb(data, &data->big_fb,
-				 1280, 960,
-				 flip_scenario_test[index].secondformat,
-				 flip_scenario_test[index].secondmodifier);
-			igt_debug("small fb %dx%d\n", data->small_fb.width,
-			          data->small_fb.height);
-			igt_debug("big fb %dx%d\n", data->big_fb.width,
-			          data->big_fb.height);
-		} else {
-			setup_fb(data, &data->small_fb,
-				 min(mode->hdisplay, 1920),
-				 min(mode->vdisplay, 1080),
-				 flip_scenario_test[index].firstformat,
-				 flip_scenario_test[index].firstmodifier);
-
-			setup_fb(data, &data->big_fb,
-				 3840, 2160,
-				 flip_scenario_test[index].secondformat,
-				 flip_scenario_test[index].secondmodifier);
-			igt_debug("small fb %dx%d\n", data->small_fb.width,
-			          data->small_fb.height);
-			igt_debug("big fb %dx%d\n", data->big_fb.width,
-			          data->big_fb.height);
-		}
+		setup_fb(data, &data->small_fb,
+				data->attemptmodewidth,
+				data->attemptmodeheight,
+				flip_scenario_test[index].firstformat,
+				flip_scenario_test[index].firstmodifier);
+
+		setup_fb(data, &data->big_fb,
+				data->attemptmodewidth * 2,
+				data->attemptmodeheight * 2,
+				flip_scenario_test[index].secondformat,
+				flip_scenario_test[index].secondmodifier);
+
+		igt_debug("small fb %dx%d\n", data->small_fb.width,
+				data->small_fb.height);
+		igt_debug("big fb %dx%d\n", data->big_fb.width,
+				data->big_fb.height);
 	}
 
 	igt_output_set_pipe(output, pipe);
@@ -186,13 +170,26 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 				  NULL);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
-	igt_pipe_crc_start(data->pipe_crc);
+
+	for (int i = 0; i < output->config.connector->count_modes; i++) {
+		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
+		   output->config.connector->modes[i].vdisplay == data->attemptmodeheight) {
+			modetoset = &output->config.connector->modes[i];
+			break;
+		   }
+	}
+
+	if (!modetoset)
+		igt_debug("%dp mode was not found from connector, will continue with default. This may cause cdclk to fail this test.\n",
+			  data->attemptmodeheight);
+	else
+		igt_output_override_mode(output, modetoset);
 
 	igt_plane_set_position(primary, 0, 0);
 	igt_plane_set_fb(primary, &data->small_fb);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	igt_display_commit_atomic(&data->display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_pipe_crc_start(data->pipe_crc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &small_crc);
 
 	igt_plane_set_fb(primary, &data->big_fb);
@@ -203,7 +200,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
 
 	igt_require_f(ret != -ERANGE,
-		      "Platform scaling limits exceeded, skipping.");
+		      "Platform scaling limits exceeded, skipping.\n");
 	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
@@ -230,6 +227,14 @@ igt_main
 		igt_require(data.display.is_atomic);
 		igt_require_pipe_crc(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
+
+		if (data.gen < 11) {
+			data.attemptmodewidth = 640;
+			data.attemptmodeheight = 480;
+		} else {
+			data.attemptmodewidth = 1920;
+			data.attemptmodeheight = 1080;
+		}
 	}
 
 	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
