Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DAF10E1E2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 19:11:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b17so5799489lfv.3
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Apr 2022 12:11:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Apr 2022 22:11:39 +0300
Message-Id: <20220406191139.31227-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: move start of crc
 calculation past first commit
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

First commit may cause modeset which can on some machines take enough
time to fill up crc buffer causing crc buffer overflow messages. Moved
crc calcualtion start past first commit to avoid these messages.

I changed small fb not to be cleared with green color, this seem
to take portion of execution time away.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 8724d6069..6c6d674cb 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -370,12 +370,12 @@ static bool test_plane(data_t *data)
 		 * rendering pipeline introduces slight differences into
 		 * the result if we try that, and so the crc will not match.
 		 */
-		igt_pipe_crc_start(data->pipe_crc);
 		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
 			     small_fb->width, small_fb->height);
 
 		igt_display_commit2(&data->display, data->display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
+		igt_pipe_crc_start(data->pipe_crc);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &small_crc);
 
 		igt_plane_set_fb(plane, big_fb);
@@ -420,9 +420,8 @@ static bool test_pipe(data_t *data)
 	if (igt_rotation_90_or_270(data->rotation))
 		igt_swap(width, height);
 
-	igt_create_color_fb(data->drm_fd, width, height,
-			    data->format, data->modifier,
-			    0, 1, 0, &data->small_fb);
+	igt_create_fb(data->drm_fd, width, height, data->format,
+		      data->modifier, &data->small_fb);
 
 	igt_output_set_pipe(data->output, data->pipe);
 
-- 
2.28.0
