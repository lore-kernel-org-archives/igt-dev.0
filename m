Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97C10E123
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:12:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i26so17105490lfp.11
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 12:12:26 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 22:11:41 +0300
Message-Id: <20220927191143.22040-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
References: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_rotation_crc: add
 I915_FORMAT_MOD_4_TILED to multiplane rotation tests
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

Add I915_FORMAT_MOD_4_TILED to list for multiplane rotation tests so
they will be tested on dg2.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08a..53f1f6ec1 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -696,12 +696,14 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_4_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_4_TILED },
 	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
-- 
2.37.3
