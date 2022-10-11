Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A5A10E66C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 18:55:15 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 11 Oct 2022 12:53:54 -0600
Message-ID: <20221011185354.2268148-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH][V4] tests/kms_plane_multiple: turn off pipe if
 all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: michel.daenzer@mailbox.org, lakshminarayana.vudum@intel.com,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

amdgpu rejects when crtc is on + all planes are off, and it
is necessary to turn off crtc when all planes are off in the
subtest "tiling-none".

This is revised from https://patchwork.freedesktop.org/series/80904/

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane_multiple.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index e958fc78..637d63f0 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
@@ -326,16 +327,12 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-		/* Intel devices need it here, timing sensitive on few devices */
-		if (is_i915_device(data->drm_fd))
-			igt_pipe_crc_start(data->pipe_crc);
 
 		/* randomize planes and set up the holes */
 		prepare_planes(data, pipe, &blue, modifier, c, output);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		if (!is_i915_device(data->drm_fd))
-			igt_pipe_crc_start(data->pipe_crc);
+		igt_pipe_crc_start(data->pipe_crc);
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
 		igt_assert_crc_equal(&data->ref_crc, &crc);
@@ -344,6 +341,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-- 
2.34.1
