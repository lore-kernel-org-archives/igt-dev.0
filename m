Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908B010E06A
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 19:52:13 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id gt4so8213268pjb.1
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 11:52:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 11:52:13 -0800
Message-Id: <20221211195213.120336-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/kms_color: Gamma tests should require
 hw support
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

Some qcom devices support CTM but not gamma/degamma LUT.

Note, the remaining failures on msm are due to CTM being supported on
one CRTC but not the other.  But the property is exposed on both.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d016cefb..cf9c27fe 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -230,6 +230,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	legacy_lut_size = kms_crtc->gamma_size;
 	drmModeFreeCrtc(kms_crtc);
 
+	igt_require(legacy_lut_size > 0);
+
 	red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	green_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	blue_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
-- 
2.38.1
