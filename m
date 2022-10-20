Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5015A10E09E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 21:09:04 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 20 Oct 2022 17:08:59 -0400
Message-ID: <20221020210859.446086-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Wait for an extra
 vblank on AMD hw
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

On AMD hardware, atomic cursor updates are not synchronized with the
same frame in the atomic code path, resulting in cursor programming
getting deferred to the next frame. Add a device specific quirk to
account for this delay.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_plane_cursor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index e9abfd78..5af390e0 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -169,6 +169,11 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_plane_set_position(data->cursor, x, y);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
+	/* Wait for one more vblank since cursor updates are not
+	 * synchronized to the same frame on AMD hw */
+	if(is_amdgpu_device(data->drm_fd))
+		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[data->pipe_id].crtc_offset, 1);
+
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
 	igt_pipe_crc_stop(data->pipe_crc);
 
-- 
2.38.0
