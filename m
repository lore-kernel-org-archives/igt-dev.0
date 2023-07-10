Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8767F10E213
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 07:58:28 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 10 Jul 2023 15:57:43 +0800
Message-ID: <20230710075749.2377896-4-chiahsuan.chung@amd.com>
In-Reply-To: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [i-g-t,
 v4 3/8] tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution
 setting during the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
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
 tests/amdgpu/amd_freesync_video_mode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index be1bf4944..29ba1f65c 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -421,10 +421,11 @@ static drmModeModeInfo *select_mode(
 	case FSV_NON_FREESYNC_VIDEO_MODE:
 		for (i = 0; i < data->count_modes; i++) {
 			mode = &data->modes[i];
-			if (mode->vrefresh == refresh_rate &&
-			    !is_freesync_video_mode(data, mode)) {
+			if (mode->hdisplay == data->hdisplay &&
+				mode->vdisplay == data->vdisplay &&
+				mode->vrefresh == refresh_rate &&
+				!is_freesync_video_mode(data, mode))
 				break;
-			}
 		}
 		if (i >= data->count_modes)
 			mode = NULL;
-- 
2.25.1
