Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DD510E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 11:32:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h9so6088345ljq.2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 03:32:44 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Feb 2023 13:32:27 +0200
Message-Id: <20230227113227.19671-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230227113227.19671-1-juhapekka.heikkila@gmail.com>
References: <20230227113227.19671-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_vblank: no need to clear
 black with black
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

created framebuffer was uselessly painted black which just wasted
time from ci.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_vblank.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 5bd3fefe1..b6c1c7c42 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -79,11 +79,10 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
-	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
-			    0.0, 0.0, 0.0,
-			    &data->primary_fb);
+	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR,
+		      &data->primary_fb);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data->primary_fb);
-- 
2.39.0
