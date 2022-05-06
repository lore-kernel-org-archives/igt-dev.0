Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BAD10E0CA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 21:23:29 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 15:22:52 -0600
Message-ID: <20220506212253.1352246-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2 i-g-t] tests/kms_universal_plane: Skip off
 screen universal calls on AMD devices
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

amdgpu_dm intentionally blocks planes outside the screen in the function
"dm_plane_helper_check_state" and returns -EINVAL. As a results, this
piece of code should be skipped on AMD devices.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_universal_plane.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..3a3667e6 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -242,16 +242,18 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_commit2(display, COMMIT_LEGACY);
 
 	/* Step 14: Universal API, set primary completely offscreen (CRC 9) */
-	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
-				   output->config.crtc->crtc_id,
-				   test.blue_fb.fb_id, 0,
-				   9000, 9000,
-				   test.mode->hdisplay,
-				   test.mode->vdisplay,
-				   IGT_FIXED(0,0), IGT_FIXED(0,0),
-				   IGT_FIXED(test.mode->hdisplay,0),
-				   IGT_FIXED(test.mode->vdisplay,0)) == 0);
-	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+					   output->config.crtc->crtc_id,
+					   test.blue_fb.fb_id, 0,
+					   9000, 9000,
+					   test.mode->hdisplay,
+					   test.mode->vdisplay,
+					   IGT_FIXED(0,0), IGT_FIXED(0,0),
+					   IGT_FIXED(test.mode->hdisplay,0),
+					   IGT_FIXED(test.mode->vdisplay,0)) == 0);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
+	}
 
 	/*
 	 * Step 15: Explicitly disable primary after it's already been
-- 
2.25.1
