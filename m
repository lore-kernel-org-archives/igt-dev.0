Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C736E109
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 09:24:34 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id n24so750189plp.13
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 02:24:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 17 Apr 2020 12:24:24 +0300
Message-Id: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to surivive
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
Allow modesets on atomic commits so commits will not produce error.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_big_fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index eb144da9..8ea7b5d1 100644
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
@@ -318,8 +319,11 @@ static bool test_plane(data_t *data)
 		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
 			     small_fb->width, small_fb->height);
 
-		igt_display_commit2(&data->display, data->display.is_atomic ?
-				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
+		if (data->display.is_atomic) {
+			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		} else {
+			igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
+		}
 
 
 		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
