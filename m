Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57F610E030
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:36:14 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 13:35:12 -0600
Message-ID: <20220927193512.447146-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH][V2] tests/kms_plane_multiple: turn off pipe if
 all planes are off
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

amdgpu rejects when crtc is on + all planes are off, and it
is necessary to turn off crtc when all planes are off.

This is revised from https://patchwork.freedesktop.org/series/80904/

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane_multiple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index cbe8c189..e900dc7f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -311,6 +311,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		if (is_amdgpu_device(data->drm_fd))
+			igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
@@ -344,6 +346,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-- 
2.34.1
