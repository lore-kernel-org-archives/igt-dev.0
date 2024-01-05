Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA8210E07A
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 21:36:10 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28c23a0df1eso45847a91.0
 for <igt-dev@lists.freedesktop.org>; Fri, 05 Jan 2024 13:36:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] tests/kms_bw: Use reduced blanking mode 1920x1080p timings
Date: Fri,  5 Jan 2024 13:36:02 -0800
Message-ID: <20240105213603.109149-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The previous timings don't work with the ti-sn65dsi86 bridge that is
used with some of the sc7180 qcom devices in drm/ci.  Let's switch the
timings so that we can get some kms_bw test coverage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_bw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index dd10d640dc13..f1d2a1b64577 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -64,12 +64,12 @@ typedef struct data {
 } data_t;
 
 static drmModeModeInfo test_mode[] = {
-	{ 173000,
-	1920, 2048, 2248, 2576, 0,
-	1080, 1083, 1088, 1120, 0,
+	{ 147840,
+	1920, 1968, 2000, 2200, 0,
+	1080, 1083, 1089, 1120, 0,
 	60,
-	DRM_MODE_FLAG_NHSYNC,
-	0x40,
+	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
+	0x48,
 	"1920x1080p\0",
 	}, /* test_mode_1 */
 
-- 
2.43.0
