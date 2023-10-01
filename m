Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D39E10E031
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Oct 2023 16:28:36 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>
Date: Sun, 1 Oct 2023 12:28:28 -0400
Message-ID: <20231001162828.74566-2-hersenxs.wu@amd.com>
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] [i-g-t] tests/kms_cursor_crc: Fix test
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
 tests/kms_cursor_crc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index ba29ff65d..7450ded9d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -260,6 +260,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 							      SUSPEND_TEST_NONE);
 
 			igt_pipe_crc_start(pipe_crc);
+
+			/* Wait for two more vblanks since cursor updates may not
+			 * synchronized to the same frame on AMD HW
+			 */
+			if (is_amdgpu_device(data->drm_fd))
+				igt_wait_for_vblank_count(data->drm_fd,
+					display->pipes[data->pipe].crtc_offset,
+					data->vblank_wait_count);
+
 			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
 			igt_assert_crc_equal(hwcrc, &crc_after);
 		}
@@ -276,6 +285,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
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
@@ -1079,7 +1097,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
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
