Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA4310E62A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 17:01:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id e13so13231366ljn.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jan 2023 09:01:42 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Jan 2023 19:01:32 +0200
Message-Id: <20230110170132.13192-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: stop crc
 generation before asserting
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

Stop crc generation on basic alpha test before asserting to avoid messages
about crc buffer overflow.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_alpha_blend.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index ccf1d6579..38272ccb3 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -263,19 +263,23 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
 		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, i | (i << 8));
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-		igt_assert_crc_equal(&ref_crc, &crc);
+		if (!igt_check_crc_equal(&ref_crc, &crc) && !igt_skip_crc_compare) {
+			igt_pipe_crc_stop(data->pipe_crc);
+
+			igt_assert_f(false, "crc mismatch with plane alpha value %d\n",
+				     i | (i << 8));
+		}
 	}
 
 	/* And test alpha = 0, should give same CRC, but doesn't on some i915 platforms. */
 	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
-
 	igt_pipe_crc_stop(data->pipe_crc);
+	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
 static void argb_opaque(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
-- 
2.39.0
