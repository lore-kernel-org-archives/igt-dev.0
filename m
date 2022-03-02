Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1CE10F1A9
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:46:49 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Mar 2022 16:46:30 +0800
Message-ID: <20220302084631.10605-2-Wayne.Lin@amd.com>
In-Reply-To: <20220302084631.10605-1-Wayne.Lin@amd.com>
References: <20220302084631.10605-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu/amd_link_settings: Ignore
 CRC checking
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

[Why & How]
1. There is no need to check crc since what we're testing is link training.
Not test about driver selected BW is sufficient or not.
2. Current crc is created by "auto" which is the crc of crtc. This crc should
be constant when change link training setting which is meaningless to this
test.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 tests/amdgpu/amd_link_settings.c | 48 +++++---------------------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index a3d2b5b9..c8c45c88 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -29,33 +29,13 @@ typedef struct
         igt_display_t display;
         igt_plane_t *primary;
         igt_output_t *output;
-	igt_fb_t fb;
-	igt_pipe_crc_t *pipe_crc;
+        igt_fb_t fb;
 	igt_pipe_t *pipe;
         enum pipe pipe_id;
 	int connector_type;
 	int w, h;
-	igt_crc_t crc_640_480;
 } data_t;
 
-drmModeModeInfo mode_640_480 = {
-	.name		= "640x480",
-	.vrefresh	= 60,
-	.clock		= 25200,
-
-	.hdisplay	= 640,
-	.hsync_start	= 656,
-	.hsync_end	= 752,
-	.htotal		= 800,
-
-	.vdisplay	= 480,
-	.vsync_start	= 490,
-	.vsync_end	= 492,
-	.vtotal		= 525,
-
-	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
 const enum dc_lane_count lane_count_values[] =
 {
 	LANE_COUNT_ONE,
@@ -81,7 +61,6 @@ const enum dc_link_rate edp_link_rate_values[] =
 
 static void test_fini(data_t *data)
 {
-	igt_pipe_crc_free(data->pipe_crc);
 	igt_display_reset(&data->display);
 }
 
@@ -116,7 +95,6 @@ static void test_init(data_t *data, igt_output_t *output)
 	igt_require(data->pipe_id != PIPE_NONE);
 
 	data->pipe = &data->display.pipes[data->pipe_id];
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id, "auto");
 
 	igt_output_set_pipe(output, data->pipe_id);
 
@@ -130,7 +108,6 @@ static void run_link_training_config(data_t *data, igt_output_t *output)
 	const int current = 0;
 	const int verified = 1;
 	char *connector_name = output->name;
-	igt_crc_t crc;
 	const enum dc_link_rate *link_rate_values;
 	int num_link_rates;
 	if (data->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
@@ -168,22 +145,13 @@ static void run_link_training_config(data_t *data, igt_output_t *output)
 						    link_rate_values[j],
 						    LINK_TRAINING_DEFAULT);
 
-			/* Commit */
-			igt_create_pattern_fb(data->drm_fd, mode_640_480.hdisplay,
-					      mode_640_480.vdisplay, DRM_FORMAT_XRGB8888,
-					      0, &data->fb);
-			igt_plane_set_fb(data->primary, &data->fb);
-			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
 			/* Verify */
 			igt_amd_read_link_settings(data->drm_fd, connector_name,
 						   lane_count, link_rate,
 						   link_spread);
 
-			/* Collect CRC after writing settings */
-			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-			igt_assert_crc_equal(&crc, &data->crc_640_480);
-
+			igt_info("Trained lane count: %d; link rate: 0x%02x\n",
+				lane_count[current], link_rate[current]);
 			igt_assert(lane_count[current] == lane_count_values[i]);
 			igt_assert(link_rate[current] == link_rate_values[j]);
 
@@ -214,6 +182,7 @@ static void test_link_training_configs(data_t *data)
 
 		orig_mode = igt_output_get_mode(output);
 		igt_assert(orig_mode);
+		igt_output_override_mode(output, orig_mode);
 
 		/* Collect original mode's LC and LR */
 		igt_amd_read_link_settings(data->drm_fd, output->name, lane_count,
@@ -221,20 +190,17 @@ static void test_link_training_configs(data_t *data)
 		orig_lc = lane_count[current];
 		orig_lr = link_rate[current];
 
-		/* Collect 640x480 CRC */
-		igt_create_pattern_fb(data->drm_fd, mode_640_480.hdisplay,
-				      mode_640_480.vdisplay, DRM_FORMAT_XRGB8888,
+		/* Set display pattern */
+		igt_create_pattern_fb(data->drm_fd, orig_mode->hdisplay,
+				      orig_mode->vdisplay, DRM_FORMAT_XRGB8888,
 				      0, &data->fb);
 		igt_plane_set_fb(data->primary, &data->fb);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-		igt_pipe_crc_collect_crc(data->pipe_crc, &data->crc_640_480);
-
 		/* Change link settings. */
 		run_link_training_config(data, output);
 
 		/* Revert mode back. */
-		igt_output_override_mode(output, orig_mode);
 		igt_info("%s: Reverting to lane count: %d, link rate: 0x%02x\n", output->name, orig_lc, orig_lr);
 		igt_amd_write_link_settings(data->drm_fd, output->name, orig_lc, orig_lr,
 					    LINK_TRAINING_DEFAULT);
-- 
2.25.1
