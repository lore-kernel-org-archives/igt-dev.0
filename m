Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EA96E111
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 13:08:27 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f21so367821plr.5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 06:08:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 26 Oct 2020 15:08:11 +0200
Message-Id: <20201026130811.11136-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: fix pixel format
 (-clamping) tests
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

cdclk caused modesets mid test will mess up crc sequence
where two consecutive frames will get same crc. If there come
modeset restart round for given set as modeset will anyway
happen only on first color.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index e42c71cd9..4ce859fba 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -560,9 +560,11 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 	struct drm_event_vblank ev;
 	int i;
 
+restart_round:
 	for (i = 0; i < data->num_colors; i++) {
 		const color_t *c = &data->colors[i];
 		struct igt_fb old_fb = *fb;
+		int ret;
 
 		prepare_format_color(data, pipe, plane, format, modifier,
 				     width, height, encoding, range, c, fb);
@@ -593,10 +595,22 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 			 * to be prepared in parallel while the current fb
 			 * awaits to be latched.
 			 */
-			igt_display_commit_atomic(&data->display,
-						  DRM_MODE_ATOMIC_ALLOW_MODESET |
-						  DRM_MODE_ATOMIC_NONBLOCK |
-						  DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			ret = igt_display_try_commit_atomic(&data->display,
+							    DRM_MODE_ATOMIC_NONBLOCK |
+							    DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			if (ret) {
+				/*
+				 * there was needed modeset for pixel format.
+				 * modeset here happen only on first color of
+				 * given set so restart round as modeset will
+				 * mess up crc frame sequence.
+				 */
+				igt_display_commit_atomic(&data->display,
+							  DRM_MODE_ATOMIC_ALLOW_MODESET,
+							  NULL);
+				igt_remove_fb(data->drm_fd, &old_fb);
+				goto restart_round;
+			}
 		} else {
 			/*
 			 * Last moment to grab the previous crc
@@ -815,8 +829,10 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 		igt_plane_set_fb(plane, &test_fb);
 
-		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
-
+		ret = igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
 		if (!ret) {
 			width = test_fb.width;
 			height = test_fb.height;
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
