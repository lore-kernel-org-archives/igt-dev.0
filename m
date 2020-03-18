Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A3189F6F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 20:16:40 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j15so21574800lfk.6
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 13:16:40 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 18 Mar 2020 22:16:31 +0200
Message-Id: <20200318201631.14580-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Avoid CRC buffer
 overflows
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
List-ID: <igt-dev@lists.freedesktop.org>

Change test initialization so CRC buffer will not become full
on slower machines.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_multiple.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 255cd34a..78769933 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -121,8 +121,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	igt_skip_on(ret != 0);
 
-	igt_pipe_crc_start(data->pipe_crc);
-	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
 }
 
 static void
@@ -257,6 +256,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 
 		igt_plane_set_position(data->plane[i], x[i], y[i]);
 		igt_plane_set_fb(data->plane[i], &data->fb[i]);
+		igt_pipe_crc_drain(data->pipe_crc);
 	}
 
 	/* primary plane */
@@ -330,6 +330,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		 igt_output_name(output), kmstest_pipe_name(pipe), c,
 		 info, opt.seed);
 
+	igt_pipe_crc_start(data->pipe_crc);
+
 	i = 0;
 	while (i < iterations || loop_forever) {
 		/* randomize planes and set up the holes */
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
