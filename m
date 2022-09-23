Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860E410E16D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Sep 2022 01:28:48 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Sep 2022 19:28:19 -0600
Message-ID: <20220923012819.4174059-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_plane_cursor: update pipe to output for
 each test
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

Pipe/pipe_id changes during test executions, and it
needs updating in test_cursor.

Resolved input/output error when reading CRC:

Test assertion failure function igt_pipe_crc_start ...
Failed assertion: pipe_crc->crc_fd != -1
Last errno: 5, Input/output error

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane_cursor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 6b7e5cef..d29dc327 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -87,8 +87,6 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
-	igt_output_set_pipe(data->output, data->pipe_id);
-
 	/* Overlay rectangle for a rect in the center of the screen */
 	data->or.x = data->mode->hdisplay / 4;
 	data->or.y = data->mode->vdisplay / 4;
@@ -244,6 +242,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 			    1.0, 0.0, 1.0, &data->cfb);
 
 	igt_plane_set_fb(data->primary, &data->pfb);
+	igt_output_set_pipe(data->output, data->pipe_id);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	test_cursor_spots(data, size, flags);
-- 
2.34.1
