Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6CF10E2F8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 16:54:15 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-687087d8ddaso4571836b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 09:54:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 09:54:11 -0700
Message-ID: <20230807165411.206456-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3] tests/kms_plane: Handle hw without legacy
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
v3: simplify patch

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 67cff61d6cd1..44cad2bf2491 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -469,6 +469,8 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	lut_size = crtc->gamma_size;
 	drmModeFreeCrtc(crtc);
 
+	igt_require(lut_size > 0);
+
 	lut = malloc(sizeof(uint16_t) * lut_size);
 
 	for (i = 0; i < lut_size; i++)
-- 
2.41.0
