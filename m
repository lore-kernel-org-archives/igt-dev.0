Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC2910E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 11:32:43 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z42so6039984ljq.13
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 03:32:43 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Feb 2023 13:32:26 +0200
Message-Id: <20230227113227.19671-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_flip_event_leak: no need to
 clear black with black
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

created framebuffers were uselessly painted black which just wasted
time from ci.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip_event_leak.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 56ff2af28..b1cdd5ea3 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -55,10 +55,10 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	mode = igt_output_get_mode(output);
 
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
-			    0.0, 0.0, 0.0, &fb[0]);
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR,
+		      &fb[0]);
 
 	igt_plane_set_fb(primary, &fb[0]);
 	igt_display_commit2(&data->display, COMMIT_LEGACY);
@@ -69,10 +69,10 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_device_set_master(fd);
 
-	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
-			    0.0, 0.0, 0.0, &fb[1]);
+	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR,
+		      &fb[1]);
 	ret = drmModePageFlip(fd, output->config.crtc->crtc_id,
 			      fb[1].fb_id, DRM_MODE_PAGE_FLIP_EVENT,
 			      data);
-- 
2.39.0
