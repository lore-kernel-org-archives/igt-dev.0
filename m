Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB810E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:13 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:27 +0800
Message-ID: <20230621065733.840316-2-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/8] tests/amdgpu/amd_freesync_video_mode:
 Fix memory leak and corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
There are some memory leak and corruption during the test.

[How]
1. Memory allocated for cicle_sprite.data is too small for drawing the circle.
   Adjust the circle radius from 50 to 48 to fit the cicle_sprite.data size.
2. Pointer preferred_mode does not point to a correct location.
   Use the data->hdisplay and data->vdisplay instead of it.
3. Fix some code for boundary issues.
4. Add some error check for potential memory allocate failed.
5. Free some allocated memory and resources before exit test.
6. Use memcpy() to copy the data->modes data.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 64 +++++++++++++++++---------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index fdcf1375f..8d809015f 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -327,8 +327,8 @@ static void sprite_anim_init(void)
 	memset(&cicle_sprite, 0, sizeof(cicle_sprite));
 	sprite_init(&cicle_sprite, 100, 100);
 	sprite_draw_rect(&cicle_sprite, 0, 0, 100, 100, MK_COLOR(128, 128, 128));
-	/* draw filled circle with center (50, 50), radius 50. */
-	sprite_draw_circle(&cicle_sprite, 50, 50, 50, MK_COLOR(0, 0, 255));
+	/* draw filled circle with center (50, 50), radius 48. */
+	sprite_draw_circle(&cicle_sprite, 50, 50, 48, MK_COLOR(0, 0, 255));
 }
 
 static void sprite_anim(data_t *data, uint32_t *addr)
@@ -413,7 +413,7 @@ static drmModeModeInfo* select_mode(
 				break;
 				}
 			}
-		if (i == data->count_modes)
+		if (i >= data->count_modes)
 			mode = NULL;
 		break;
 
@@ -425,7 +425,7 @@ static drmModeModeInfo* select_mode(
 				break;
 			}
 		}
-		if (i == data->count_modes)
+		if (i >= data->count_modes)
 			mode = NULL;
 		break;
 
@@ -506,7 +506,7 @@ static uint64_t nsec_per_frame(uint64_t refresh)
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
 {
-	char buf[256];
+	char buf[256] = {0};
 	char *start_loc;
 	int fd, res;
 	range_t range;
@@ -557,19 +557,27 @@ static void prepare_test(
 
 	/* Prepare resources */
 	if (!data->fb_initialized) {
-		igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
+		int fb_id;
+
+		fb_id = igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
+		igt_assert(fb_id);
+
+		fb_id = igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[1]);
+		igt_assert(fb_id);
 
-		igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[1]);
 		data->fb_mem[0] = igt_fb_map_buffer(data->drm_fd, &data->fbs[0]);
 		data->fb_mem[1] = igt_fb_map_buffer(data->drm_fd, &data->fbs[1]);
+
+		fbmem_draw_smpte_pattern(data->fb_mem[0], 
+			data->hdisplay, data->vdisplay);
+		fbmem_draw_smpte_pattern(data->fb_mem[1], 
+			data->hdisplay, data->vdisplay);
+
 		data->fb_initialized = true;
 	}
 
-	fbmem_draw_smpte_pattern(data->fb_mem[0], data->hdisplay, data->vdisplay);
-	fbmem_draw_smpte_pattern(data->fb_mem[1], data->hdisplay, data->vdisplay);
-
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(data->primary, &data->fbs[0]);
@@ -676,21 +684,22 @@ flip_and_measure(
 
 static void init_data(data_t *data, igt_output_t *output) {
 	int i;
-	uint32_t pm_hdisplay, pm_vdisplay, max_clk = 0;
-	drmModeModeInfo *preferred_mode;
+	uint32_t max_clk = 0;
 	drmModeConnector *connector;
 
 	connector = data->connector = output->config.connector;
 	data->count_modes = connector->count_modes;
 	data->modes = (drmModeModeInfo *) malloc(sizeof(drmModeModeInfo) * data->count_modes);
+	igt_assert(data->modes);
+	memcpy(data->modes, connector->modes, 
+		sizeof(drmModeModeInfo) * data->count_modes);
 
-	for (i = 0; i < data->count_modes; i++) {
-		data->modes[i] = connector->modes[i];
 #ifdef FSV_DEBUG
+	for (i = 0; i < data->count_modes; i++) {
 		igt_info("mode %d:", i);
 		kmstest_dump_mode(&data->modes[i]);
-#endif
 	}
+#endif
 
 	/* searching the preferred mode */
 	for (i = 0; i < connector->count_modes; i++) {
@@ -699,8 +708,6 @@ static void init_data(data_t *data, igt_output_t *output) {
 			data->preferred_mode_index = i;
 			data->hdisplay = mode->hdisplay;
 			data->vdisplay = mode->vdisplay;
-			pm_hdisplay = preferred_mode->hdisplay;
-			pm_vdisplay = preferred_mode->vdisplay;
 			break;
 		}
 	}
@@ -708,7 +715,7 @@ static void init_data(data_t *data, igt_output_t *output) {
 	/* searching the base mode */
 	for (i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *mode = &connector->modes[i];
-		if (mode->hdisplay == pm_hdisplay && mode->vdisplay == pm_vdisplay) {
+		if (mode->hdisplay == data->hdisplay && mode->vdisplay == data->vdisplay) {
 			if (mode->clock > max_clk) {
 				max_clk = mode->clock;
 				data->base_mode_index = i;
@@ -738,11 +745,22 @@ static void finish_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_fb_unmap_buffer(&data->fbs[0], data->fb_mem[0]);
 	igt_remove_fb(data->drm_fd, &data->fbs[1]);
 	igt_remove_fb(data->drm_fd, &data->fbs[0]);
+
+	data->fb_initialized = false;
+	if(data->modes) {
+		free(data->modes);
+		data->modes = NULL;
+	}
+	if(cicle_sprite.data) {
+		free(cicle_sprite.data);
+		memset(&cicle_sprite, 0, sizeof(cicle_sprite));
+	}
 }
 
 static void
 mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t scene)
 {
+	int ret;
 	uint32_t result;
 	uint64_t interval;
 	drmModeModeInfo *mode_start = NULL, *mode_playback = NULL, mode_custom;
@@ -766,7 +784,8 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 		break;
 	case SCENE_BASE_MODE_TO_CUSTUM_MODE:
 		mode_start = select_mode(data, FSV_BASE_MODE, 0);
-		prepare_custom_mode(data, &mode_custom, 72);
+		ret = prepare_custom_mode(data, &mode_custom, 72);
+		igt_assert_eq(ret, 0);
 		mode_playback = &mode_custom;
 		break;
 	case SCENE_NON_FSV_MODE_TO_NON_FSV_MODE:
@@ -861,5 +880,8 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
+		if(data.modes)
+			free(data.modes);
 	}
 }
-- 
2.34.1
