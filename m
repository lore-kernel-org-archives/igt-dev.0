Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125410EC60
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 18:37:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b21so11171579lfb.5
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Apr 2022 11:37:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 21:37:32 +0300
Message-Id: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_big_fb: move start of
 crc calculation past first commit
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

First commit may cause modeset on two pipes which can on some machines
take enough time to fill up crc buffer on one pipe causing crc buffer
overflow messages. Moved crc calculation start past first commit
to avoid these messages.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 8724d6069..b7bcc3401 100644
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
-- 
2.28.0
