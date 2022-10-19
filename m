Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77AD10E082
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 19:55:18 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 19 Oct 2022 15:55:14 -0400
Message-ID: <20221019195514.3676771-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_plane_cursor: Change API for
 collecting the CRC for AMDGPU
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

On AMD hw, igt_pipe_crc_get_current() alone does not work correctly, but
igt_pipe_crc_collect_crc() does. The latter is more robust and reports
the expected crc.

This is because cursor updates are not synchronized to
the frame in the same atomic commit and can get deferred to the next.
Until cursor updates are synchronized with the frame, use
igt_pipe_crc_collect_crc() for the side effect of skipping 2 frames
within the driver thereby giving expected CRC values

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
--

Changes in V3
-------------

* Fix a copy paste error
---
 tests/kms_plane_cursor.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index e9abfd78..1caa822e 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -150,8 +150,12 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
-	igt_pipe_crc_start(data->pipe_crc);
-	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_pipe_crc_start(data->pipe_crc);
+		igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
+	} else {
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+	}
 
 	draw_color(pfb, 1.0, 1.0, 1.0);
 
@@ -169,8 +173,12 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_plane_set_position(data->cursor, x, y);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
-	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
-	igt_pipe_crc_stop(data->pipe_crc);
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
+		igt_pipe_crc_stop(data->pipe_crc);
+	} else {
+		igt_pipe_crc_collect_crc(data->pipe_crc, &test_crc);
+	}
 
 	igt_assert_crc_equal(&ref_crc, &test_crc);
 }
-- 
2.38.0
