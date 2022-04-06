Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3232310E167
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 13:01:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y32so3950981lfa.6
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Apr 2022 06:01:04 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Apr 2022 16:00:58 +0300
Message-Id: <20220406130058.25378-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: take out test only
 flag for try commit in inner loop
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

This will cause try commit to do modeset which could cause crc buffer
overflow in later commit. I changed small fb not to be cleared with
green color so there will be no unnecessary green flashes, this seem
to also take portion of execution time away.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 8724d6069..7c9bb5d2a 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -348,8 +348,7 @@ static bool test_plane(data_t *data)
 		 */
 		if (i == 0 && data->display.is_atomic &&
 		    igt_display_try_commit_atomic(&data->display,
-						  DRM_MODE_ATOMIC_ALLOW_MODESET |
-						  DRM_MODE_ATOMIC_TEST_ONLY,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
 						  NULL) != 0) {
 			if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
 				igt_plane_set_rotation(plane, IGT_ROTATION_0);
@@ -420,9 +419,8 @@ static bool test_pipe(data_t *data)
 	if (igt_rotation_90_or_270(data->rotation))
 		igt_swap(width, height);
 
-	igt_create_color_fb(data->drm_fd, width, height,
-			    data->format, data->modifier,
-			    0, 1, 0, &data->small_fb);
+	igt_create_fb(data->drm_fd, width, height,
+		      data->format, data->modifier, &data->small_fb);
 
 	igt_output_set_pipe(data->output, data->pipe);
 
-- 
2.28.0
