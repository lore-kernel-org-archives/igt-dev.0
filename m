Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D972310E306
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Oct 2023 14:20:30 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <juhapekka.heikkila@gmail.com>,
 <rodrigo.siqueira@amd.com>, <aurabindo.pillai@amd.com>, <alex.hung@amd.com>,
 <hamza.mahfooz@amd.com>, <sunpeng.li@amd.com>
Date: Mon, 2 Oct 2023 10:20:23 -0400
Message-ID: <20231002142023.713415-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/kms_cursor_crc: Fix test
 intermittent failures on AMD gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Wait for two more vblanks before reading crc on AMD gpu.

Without waiting for two vblanks, AMD cursor updates may not
synchronized to the same frame of pipe, crc generated may
not be reliable.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/kms_cursor_crc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index ba29ff65d..e3259e147 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -276,6 +276,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
 		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
 		igt_display_commit(display);
+
+		/* Wait for two more vblanks since cursor updates may not
+		 * synchronized to the same frame on AMD HW
+		 */
+		if (is_amdgpu_device(data->drm_fd))
+			igt_wait_for_vblank_count(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset,
+				data->vblank_wait_count);
+
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 		igt_assert_crc_equal(&crc, hwcrc);
 	}
@@ -1079,7 +1088,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		igt_require_pipe_crc(data.drm_fd);
 
-		data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
+		/* Wait for two more vblanks since cursor updates may not
+		 * synchronized to the same frame on AMD HW
+		 */
+		data.vblank_wait_count =
+			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.25.1
