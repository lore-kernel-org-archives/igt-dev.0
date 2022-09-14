Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621EA10E00F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 22:58:29 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 14 Sep 2022 15:58:00 -0700
Message-ID: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_crc: Wait extra vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Wait an extra vblank for legacy cursor ioctl to finish.

Extra vblank wait is needed for both HW and SW test as the legacy cursor
ioctl is called in both cases.

Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

[1] https://patchwork.freedesktop.org/series/105999/
---
 tests/kms_cursor_crc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 53f18f4f1add..272dcb7fa0a4 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		igt_display_commit(display);
 
 		/* Extra vblank wait is because nonblocking cursor ioctl */
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset);
+		igt_wait_for_vblank_count(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset, 2);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
 
@@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
 
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset);
+		igt_wait_for_vblank_count(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset, 2);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 		igt_assert_crc_equal(&crc, hwcrc);
-- 
2.31.0
