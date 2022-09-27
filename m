Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3A210E0FA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:12:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a2so17117933lfb.6
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 12:12:24 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 22:11:40 +0300
Message-Id: <20220927191143.22040-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
References: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_cursor_crc: wait for cursor
 only when needed
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

moved cursor vblank waits out from sw tests and wait only when
disabling cursor. With this need to wait few frames less than
currently, this seems to shave off around 1s per subtest.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7c1f74be5..f9a1f8689 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -72,6 +72,7 @@ typedef struct {
 	cairo_surface_t *surface;
 	uint32_t devid;
 	double alpha;
+	int vblank_wait_count; /* because of msm */
 } data_t;
 
 #define TEST_DPMS (1<<0)
@@ -124,6 +125,12 @@ static void cursor_disable(data_t *data)
 {
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_plane_set_position(data->cursor, 0, 0);
+	igt_display_commit(&data->display);
+
+	/* do this wait here so it will not need to be added everywhere */
+	igt_wait_for_vblank_count(data->drm_fd,
+				  data->display.pipes[data->pipe].crtc_offset,
+				  data->vblank_wait_count);
 }
 
 static bool chv_cursor_broken(data_t *data, int x)
@@ -185,7 +192,6 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
 	igt_crc_t crc;
 	int ret = 0, swbufidx;
-	int vblank_wait_count = is_msm_device(data->drm_fd) ? 2 : 1;
 
 	igt_print_activity();
 
@@ -204,7 +210,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 
 		/* Extra vblank wait is because nonblocking cursor ioctl */
 		igt_wait_for_vblank_count(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset, vblank_wait_count);
+					  display->pipes[data->pipe].crtc_offset,
+					  data->vblank_wait_count);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
 
@@ -242,11 +249,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 
 		restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
 		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
-
 		igt_display_commit(display);
-		igt_wait_for_vblank_count(data->drm_fd,
-				display->pipes[data->pipe].crtc_offset, vblank_wait_count);
-
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 		igt_assert_crc_equal(&crc, hwcrc);
 	}
@@ -264,9 +267,7 @@ static void do_fail_test(data_t *data, int x, int y, int expect)
 	igt_plane_set_position(data->cursor, x, y);
 	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
 
-	igt_plane_set_position(data->cursor, 0, 0);
 	cursor_disable(data);
-	igt_display_commit(display);
 
 	igt_assert_eq(ret, expect);
 }
@@ -895,6 +896,8 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_pipe_crc(data.drm_fd);
+
+		data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.37.3
