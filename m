Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECD110E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:17 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:28 +0800
Message-ID: <20230621065733.840316-3-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 3/8] tests/amdgpu/amd_freesync_video_mode:
 Fix wrong resolution setting during the test
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
Some monitors may have different resolution for non-Freesync video mode and it may
cause the IGT test set to a wrong resolution during the test.

[How]
Check the resolution and use the same one during select the video mode.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 8d809015f..a7b10886d 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -420,10 +420,11 @@ static drmModeModeInfo* select_mode(
 	case FSV_NON_FREESYNC_VIDEO_MODE:
 		for (i = 0; i < data->count_modes; i++) {
 			mode = &data->modes[i];
-			if (mode->vrefresh == refresh_rate &&
-				!is_freesync_video_mode(data, mode)) {
-				break;
-			}
+			if (mode->hdisplay == data->hdisplay &&
+				mode->vdisplay == data->vdisplay &&
+				mode->vrefresh == refresh_rate &&
+				!is_freesync_video_mode(data, mode))
+					break;
 		}
 		if (i >= data->count_modes)
 			mode = NULL;
-- 
2.34.1
