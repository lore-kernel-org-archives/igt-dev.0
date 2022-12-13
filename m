Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBE10E192
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 23:44:04 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 13 Dec 2022 16:43:31 -0700
Message-ID: <20221213234332.364224-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] tests/kms_bw: Test outputs with fb of the
 same resolutions
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

The hardcoded fb resolution (1920x1080) is replaced by the output
resolution.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_bw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 2a8df5b3..27100587 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -167,8 +167,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 		force_output_mode(data, output, mode);
 
-		igt_create_color_fb(display->drm_fd, test_mode[0].hdisplay,
-				    test_mode[0].vdisplay, DRM_FORMAT_XRGB8888,
+		igt_create_color_fb(display->drm_fd, mode->hdisplay,
+				    mode->vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
 				    &buffer[i]);
 
-- 
2.38.1
