Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323D10E004
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:53:40 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bc8045e09dso5975985ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 07:53:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 07:53:33 -0700
Message-ID: <20230808145334.24277-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/kms_plane: Handle hw without legacy
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

Skip the legacy gamma on hw that doesn't support it, instead of failing.
The legacy LUT support was used to drop the precision down to 6 bits, to
paper over errors introduced y RGB<->YCbCr conversion, but this isn't
necessarily needed on all hw.

v2: igt_require(lut_size > 0) instead
v3: simplify patch

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 67cff61d6cd1..a444cdca23e2 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -469,6 +469,10 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
 
+	/* Skip if legacy LUT is not supported: */
+	if (!lut_size)
+		return;
+
 	lut = malloc(sizeof(uint16_t) * lut_size);
 
 	for (i = 0; i < lut_size; i++)
-- 
2.41.0
