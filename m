Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15B7B192B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 07:01:24 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 24 Aug 2022 19:22:06 -0600
Message-ID: <20220825012206.2747503-2-alex.hung@amd.com>
In-Reply-To: <20220825012206.2747503-1-alex.hung@amd.com>
References: <20220825012206.2747503-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/kms_universal_plane: Skip offscreen
 test for universal API
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

amdgpu driver intentionally rejects plane outside of the screen and thus
this test is skipped on AMD HW.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_universal_plane.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 9eab1a57..057a14f4 100644
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
@@ -291,7 +293,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * We should be able to move the primary plane completely offscreen
 	 * and have it disable successfully.
 	 */
-	igt_assert_crc_equal(&test.crc_5, &test.crc_9);
+	if (!is_amdgpu_device(data->drm_fd))
+		igt_assert_crc_equal(&test.crc_5, &test.crc_9);
 
 	/*
 	 * We should be able to explicitly disable an already
-- 
2.37.2
