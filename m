Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61826E221
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 09:12:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p16so13689601lfa.2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 02:12:49 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 20 Oct 2021 12:12:38 +0300
Message-Id: <20211020091238.28554-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Use same modifier
 for reference crc as for test crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

Create reference crc with same modifier as is used for testing. This
will reduce non test related anomalies.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_multiple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index ece00097e..30e4bcc0d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -111,10 +111,13 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
+			    modifier,
 			    color->red, color->green, color->blue,
 			    &data->fb[primary->index]);
 
+	igt_skip_on(!igt_plane_has_format_mod(data->plane[primary->index],
+		    DRM_FORMAT_XRGB8888, modifier));
+
 	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.28.0
