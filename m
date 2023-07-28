Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAF510E134
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 20:17:28 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bbc64f9a91so20263245ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 13:17:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 13:17:23 -0700
Message-ID: <20230728201723.130308-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_plane: Handle hw without legacy gamma
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Skip the tests which require legacy gamma, instead of failing, if the hw
does not support legacy gamma.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 67cff61d6cd1..9f72a5bceae9 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -463,7 +463,7 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
 	drmModeCrtc *crtc;
 	uint16_t *lut;
-	int i, lut_size;
+	int i, lut_size, ret;
 
 	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
 	lut_size = crtc->gamma_size;
@@ -474,8 +474,10 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	for (i = 0; i < lut_size; i++)
 		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
 
-	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
-					  lut_size, lut, lut, lut), 0);
+	ret = drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
+				  lut_size, lut, lut, lut);
+	igt_require(ret != -ENOSYS);
+	igt_assert_eq(ret, 0);
 
 	free(lut);
 }
-- 
2.41.0
