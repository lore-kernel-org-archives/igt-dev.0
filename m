Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05610E664
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 21:36:11 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d9ac5bd128so51195b3a.0
 for <igt-dev@lists.freedesktop.org>; Fri, 05 Jan 2024 13:36:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/kms_bw: Add 2160x1440p mode
Date: Fri,  5 Jan 2024 13:36:03 -0800
Message-ID: <20240105213603.109149-2-robdclark@gmail.com>
In-Reply-To: <20240105213603.109149-1-robdclark@gmail.com>
References: <20240105213603.109149-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_bw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index f1d2a1b64577..425dd067e243 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -91,6 +91,15 @@ static drmModeModeInfo test_mode[] = {
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
