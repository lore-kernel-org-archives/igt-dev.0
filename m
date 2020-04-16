Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF006E83F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 17:29:43 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id x26so1936375pgc.10
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 10:29:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 16 Apr 2020 20:29:33 +0300
Message-Id: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to survive
 change of cdclk
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

When testing 64bpp formats there will come modeset to change cdclk.
Allow modesets on commits so commits will not produce error.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_big_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index eb144da9..dabd16f3 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -294,6 +294,7 @@ static bool test_plane(data_t *data)
 		 */
 		if (i == 0 && data->display.is_atomic &&
 		    igt_display_try_commit_atomic(&data->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET |
 						  DRM_MODE_ATOMIC_TEST_ONLY,
 						  NULL) != 0) {
 			if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
@@ -318,8 +319,8 @@ static bool test_plane(data_t *data)
 		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
 			     small_fb->width, small_fb->height);
 
-		igt_display_commit2(&data->display, data->display.is_atomic ?
-				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
+		igt_display_commit2(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
+				    data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
 
 		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
