Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED5610ECB4
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 20:07:06 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 29 Sep 2022 14:06:44 -0600
Message-ID: <20220929200644.4160588-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH][V3] tests/kms_plane_multiple: turn off pipe if
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
is necessary to turn off crtc when all planes are off in the
subtest "tiling-none".

This is revised from https://patchwork.freedesktop.org/series/80904/

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V2 - remove second is_amdgpu_device() before setting PIPE_NONE

V3 - remove both is_amdgpu_device() before setting PIPE_NONE

 tests/kms_plane_multiple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index cbe8c189..6c0bc36d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
@@ -344,6 +345,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-- 
2.34.1
