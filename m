Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0E10E011
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 18:49:48 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Oct 2022 14:49:42 -0400
Message-ID: <20221014184942.205868-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Change API for
 collecting the CRC
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

On AMD hw, igt_pipe_crc_get_current() does not work correctly, but
igt_pipe_crc_collect_crc() does. The latter is more robust and reports
the expected crc. This is due to a delay of 2 frames in the hardware for
crc capture.

The following diff is an alternate fix instead of changing the API:

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index fa1e3b69..dfcb2638 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -1061,6 +1061,10 @@ igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
 {
        unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;

+       /* AMD hw has an additional frame delay */
+       if (is_amdgpu_device(drm_fd))
+               vblank += 1;
+
        return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
 }

Since the above solution adds device specific code into core IGT lib,
changing the API is a preferable solution.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_plane_cursor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index e9abfd78..e2a9e97b 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -150,8 +150,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
-	igt_pipe_crc_start(data->pipe_crc);
-	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
 	draw_color(pfb, 1.0, 1.0, 1.0);
 
@@ -169,8 +168,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_plane_set_position(data->cursor, x, y);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
-	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
-	igt_pipe_crc_stop(data->pipe_crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &test_crc);
 
 	igt_assert_crc_equal(&ref_crc, &test_crc);
 }
-- 
2.38.0
