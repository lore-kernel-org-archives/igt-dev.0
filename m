Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203E610E3CF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:22 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:32 +0800
Message-ID: <20230621065733.840316-7-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 7/8] tests/amdgpu/amd_freesync_video_mode:
 Fix wrong resolution setting for some panel
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
Some eDP panel VRR range only has 48-60Hz and it will cause some of the test failed.

[How]
Use the VRR range fps to select the mode for test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 27 +++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 000de4c84..be8ff3221 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -420,11 +420,18 @@ static drmModeModeInfo* select_mode(
 	case FSV_NON_FREESYNC_VIDEO_MODE:
 		for (i = 0; i < data->count_modes; i++) {
 			mode = &data->modes[i];
-			if (mode->hdisplay == data->hdisplay &&
-				mode->vdisplay == data->vdisplay &&
-				mode->vrefresh == refresh_rate &&
-				!is_freesync_video_mode(data, mode))
-					break;
+			if (refresh_rate > 0) {
+				if (mode->hdisplay == data->hdisplay &&
+					mode->vdisplay == data->vdisplay &&
+					mode->vrefresh == refresh_rate &&
+					!is_freesync_video_mode(data, mode))
+						break;
+			} else {
+				if (mode->hdisplay == data->hdisplay &&
+					mode->vdisplay == data->vdisplay &&
+					!is_freesync_video_mode(data, mode))
+						break;
+			}
 		}
 		if (i >= data->count_modes)
 			mode = NULL;
@@ -778,16 +785,18 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 		mode_playback  = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
 		break;
 	case SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE:
-		mode_start = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
-		mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 120);
+		mode_start = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 
+				data->vrr_range.min);
+		mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 
+				data->vrr_range.max);
 		break;
 	case SCENE_NON_FSV_MODE_TO_FSV_MODE:
-		mode_start = select_mode(data, FSV_NON_FREESYNC_VIDEO_MODE, 60);
+		mode_start = select_mode(data, FSV_NON_FREESYNC_VIDEO_MODE, 0);
 		mode_playback = select_mode(data, FSV_FREESYNC_VIDEO_MODE, 60);
 		break;
 	case SCENE_BASE_MODE_TO_CUSTUM_MODE:
 		mode_start = select_mode(data, FSV_BASE_MODE, 0);
-		ret = prepare_custom_mode(data, &mode_custom, 72);
+		ret = prepare_custom_mode(data, &mode_custom, data->vrr_range.min);
 		igt_assert_eq(ret, 0);
 		mode_playback = &mode_custom;
 		break;
-- 
2.34.1
