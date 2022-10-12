Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACC110E136
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 23:57:40 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 12 Oct 2022 17:57:06 -0600
Message-ID: <20221012235706.75569-2-alex.hung@amd.com>
In-Reply-To: <20221012235706.75569-1-alex.hung@amd.com>
References: <20221012235706.75569-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/kms_universal_plane: skip when pipe and
 primary plane cannot be off
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

amdgpu rejects when crtc is on + primary plane is off. As a result,
skipping these scenario when they cannot be turned off together, i.e.
crtc cannot be off when reading crc values.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_universal_plane.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 468f7a4e..8d51f288 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -197,9 +197,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
 
 	/* Step 5: Universal API's, disable primary plane (CRC 5) */
-	igt_plane_set_fb(primary, NULL);
-	igt_display_commit2(display, COMMIT_UNIVERSAL);
-	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(display, COMMIT_UNIVERSAL);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
+	}
 
 	/* Step 6: Universal API's, re-enable primary with blue (CRC 6) */
 	igt_plane_set_fb(primary, &test.blue_fb);
@@ -271,9 +273,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Step 15: Explicitly disable primary after it's already been
 	 * implicitly disabled (CRC 10).
 	 */
-	igt_plane_set_fb(primary, NULL);
-	igt_display_commit2(display, COMMIT_UNIVERSAL);
-	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit2(display, COMMIT_UNIVERSAL);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
+	}
 
 	/* Step 16: Legacy API's, blue primary, red sprite */
 	igt_plane_set_fb(primary, &test.blue_fb);
@@ -284,7 +288,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_assert_crc_equal(&test.crc_2, &test.crc_4);
 
 	/* Disabling primary plane should be same as black primary */
-	igt_assert_crc_equal(&test.crc_1, &test.crc_5);
+	if (!is_amdgpu_device(data->drm_fd))
+		igt_assert_crc_equal(&test.crc_1, &test.crc_5);
 
 	/* Re-enabling primary should return to blue properly */
 	igt_assert_crc_equal(&test.crc_2, &test.crc_6);
@@ -306,8 +311,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * and have it disable successfully. Skip on amdgpu since crc_9 was
 	 * skipped with offscreen planes previously.
 	 */
-	if (!is_amdgpu_device(data->drm_fd))
-		igt_assert_crc_equal(&test.crc_5, &test.crc_9);
+	igt_assert_crc_equal(&test.crc_5, &test.crc_9);
 
 	/*
 	 * We should be able to explicitly disable an already
-- 
2.38.0
