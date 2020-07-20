Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6516E6E37F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 11:49:18 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon, 20 Jul 2020 17:18:56 +0530
Message-Id: <20200720114856.31432-12-mohammed.khajapasha@intel.com>
In-Reply-To: <20200720114856.31432-1-mohammed.khajapasha@intel.com>
References: <20200720114856.31432-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/11] tests/kms: Use crtc offset to read
 vblank event for a pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Pass crtc_offset parameter to read a vblank event for a pipe
to vblank helper functions.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_cursor_crc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7e6b24cc..88265fd9 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -199,7 +199,8 @@ static void do_single_test(data_t *data, int x, int y)
 	igt_display_commit(display);
 
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 
 	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
@@ -238,7 +239,8 @@ static void do_single_test(data_t *data, int x, int y)
 	igt_display_commit(display);
 	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
@@ -496,7 +498,8 @@ static void test_cursor_alpha(data_t *data, double a)
 	/*Hardware Test*/
 	cursor_enable(data);
 	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 	cursor_disable(data);
 	igt_remove_fb(data->drm_fd, &data->fb);
@@ -507,7 +510,8 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_put_cairo_ctx(cr);
 
 	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
 
@@ -612,7 +616,8 @@ static void test_cursor_size(data_t *data)
 		igt_plane_set_size(data->cursor, size, size);
 		igt_fb_set_size(&data->fb, data->cursor, size, size);
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd, data->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
 	}
 	cursor_disable(data);
@@ -626,7 +631,8 @@ static void test_cursor_size(data_t *data)
 		igt_put_cairo_ctx(cr);
 
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd, data->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 		/* Clear screen afterwards */
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
