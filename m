Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115E810E306
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 21:50:13 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so1920605b3a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Jan 2024 13:50:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2] tests/kms_bw: Add 2160x1440p mode
Date: Mon,  8 Jan 2024 13:50:06 -0800
Message-ID: <20240108215006.170234-1-robdclark@gmail.com>
In-Reply-To: <20240105213603.109149-2-robdclark@gmail.com>
References: <20240105213603.109149-2-robdclark@gmail.com>
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

Add an additional mode so that we can get more kms_bw coverage on
sc7180.

v2: Add missing comment listing subtest name

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_bw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index f1d2a1b64577..96b19199d4d6 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -47,6 +47,7 @@
  * @1920x1080p:       1920x1080 resolution
  * @2560x1440p:       2560x1440 resolution
  * @3840x2160p:       3840x2160 resolution
+ * @2160x1440p:       2160x1440 resolution
  */
 
 /* Common test data. */
@@ -91,6 +92,15 @@ static drmModeModeInfo test_mode[] = {
 	"3840x2160p\0",
 	}, /* test_mode_3 */
 
+	{ 207800,
+	2160, 2208, 2240, 2340, 0,
+	1440, 1443, 1449, 1480, 0,
+	60,
+	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
+	0x48,
+	"2160x1440p\0",
+	}, /* test_mode_4 */
+
 };
 
 static void test_init(data_t *data)
-- 
2.43.0
