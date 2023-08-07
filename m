Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D5E10E2DB
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 16:36:39 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-686daaa5f1fso3151623b3a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 09:36:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 09:36:33 -0700
Message-ID: <20230807163634.205167-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] tests/kms_plane: Handle hw without legacy
 gamma support
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

v2: igt_require(lut_size > 0) instead

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 67cff61d6cd1..2df1d2f0aeee 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -463,19 +463,22 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
 	drmModeCrtc *crtc;
 	uint16_t *lut;
-	int i, lut_size;
+	int i, lut_size, ret;
 
 	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
 
+	igt_require(lut_size > 0);
+
 	lut = malloc(sizeof(uint16_t) * lut_size);
 
 	for (i = 0; i < lut_size; i++)
 		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
 
-	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
-					  lut_size, lut, lut, lut), 0);
+	ret = drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
+				  lut_size, lut, lut, lut);
+	igt_assert_eq(ret, 0);
 
 	free(lut);
 }
-- 
2.41.0
