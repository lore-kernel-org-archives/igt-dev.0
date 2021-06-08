Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0226EB56
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 09:14:20 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  8 Jun 2021 14:35:06 +0530
Message-Id: <1623143106-8423-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
References: <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Use
 igt_pipe_crc_get_current instead of igt_pipe_crc_collect_crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

CRC mismatch is seen between big and small CRC on
Gen11 systems for subtest y-tiled-32bpp-rotate-0.
Patch changes igt_pipe_crc_collect_crc to igt_pipe_crc_get_current
for collecting CRC for big and small fb to compare.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: Ie913127f149f577ab0a034dcbbd4314af17cad52
---
 tests/kms_big_fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index b35727a09bd0..ea12a34157f2 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -331,14 +331,13 @@ static bool test_plane(data_t *data)
 		 * rendering pipeline introduces slight differences into
 		 * the result if we try that, and so the crc will not match.
 		 */
+		igt_pipe_crc_start(data->pipe_crc);
 		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
 			     small_fb->width, small_fb->height);
 
 		igt_display_commit2(&data->display, data->display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
-
-
-		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
+		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &small_crc);
 
 		igt_plane_set_fb(plane, big_fb);
 		igt_fb_set_position(big_fb, plane, x, y);
@@ -347,11 +346,12 @@ static bool test_plane(data_t *data)
 		igt_display_commit2(&data->display, data->display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
-		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
+		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &big_crc);
 
 		igt_plane_set_fb(plane, NULL);
 
 		igt_assert_crc_equal(&big_crc, &small_crc);
+		igt_pipe_crc_stop(data->pipe_crc);
 	}
 
 	return true;
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
