Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF3C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 20:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D013D10E2A3;
	Mon, 12 Aug 2024 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eOfURvf4";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D9F10E2A3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 20:07:56 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2cf93dc11c6so3705603a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493276; x=1724098076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjgLggeAVLW03vtVkg1XJh/xw6jLvaOThI0MiGyPwoQ=;
 b=eOfURvf4trzquy/NUkxq7hS6h9JHa4Czx1/I1P0lJ9X/1GYMEQ/Qka/Iz/NPdmlgY7
 nW/aHrvRdC1POeDrCtVbpypT4xI8IAVN35C+lbloTq30P9gdFV/jfIedmKk5ZqeJmF19
 Al9BFNYT/5KbruQcWrRmyeT3y6BaP/eR786OzgNtJ3+aQtHuY/W1LE7w9+i8U76wEqv3
 wflEGU9DdzrE9/uEutoS67TjGu18E4dmWZWPRGe7ZkGHiYrF1FR859yoBvmnbmj7YpFs
 pUb6P1xXh7g59mAYEuW4rX+Kc4VAA4U7E3mkMtOV5pUIX7YnOurt0BEmCW0Bqd1rOOpk
 IJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493276; x=1724098076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjgLggeAVLW03vtVkg1XJh/xw6jLvaOThI0MiGyPwoQ=;
 b=W8jHM89t90Zi9+JFdLOK3pnSwpLkATkzLl2BX26CtDjw6vfVnbmkDtuTuDYbleDlWn
 Qg+tb7ansXL5X1o2XAGihEAi5STZ7s9rIHN6mLPpSlLC2Zs0x/klE5H8g05A6qE5uNC1
 bo/780rJfAMGRuT/Db1zr+KxMnkgWiUx7zmmQKaYXEN4yF2fFRG3Woz/xiZ01SKI4uZr
 17PbaLIM4OVrcT69IP9BlXt6UafAM+BQhpFPb4PyOmHywtNamm5rJfef/F/a0iwLcc8f
 9uCBqYjkAh1gQs60jlf5MqKm3+i4IvZF5pT6UYREFFaS6QKgdnXSJcXJc6ECcKlWx1yv
 WlVQ==
X-Gm-Message-State: AOJu0YyVRuCzs6f6BhJ6NSFuWxln5jc7TqUMCM0zcC26xQ0l+nPMn5wG
 TJxgdDJb5jci4MnHwRki+AuCHf7rOt0gkv+dafVNAAXVQAwrEkjxNnXQU3tsui4=
X-Google-Smtp-Source: AGHT+IGAZcmXdq5I9t2MYYHZYxh1HMxrdxCTyyr1ndldzSqW5rfPYbFUccG/Azn4jYi2hxwJvZtgQw==
X-Received: by 2002:a17:90a:2d83:b0:2cd:7d6f:31b0 with SMTP id
 98e67ed59e1d1-2d3926a9b7fmr1339715a91.43.1723493275915; 
 Mon, 12 Aug 2024 13:07:55 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1c9c9f03csm8854255a91.26.2024.08.12.13.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:07:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_ccs: Add testing for Xe2 ccs
 modifiers
Date: Mon, 12 Aug 2024 23:11:24 +0300
Message-ID: <20240812201124.2013652-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
References: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Earlier with Xe2 I915_FORMAT_MOD_4 was used as ccs modifier.
Now regular tile4 is not using compression and in test will be
used I915_FORMAT_MOD_4_TILED_BMG_CCS or
I915_FORMAT_MOD_4_TILED_LNL_CCS instead.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 6b66a06db..b1a9da8da 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -100,7 +100,8 @@
  *
  * arg[2]:
  *
- * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
+ * @4-tiled-bmg-ccs:           4 tiled xe2 pat controlled ccs
+ * @4-tiled-lnl-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
  * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
  * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
@@ -126,7 +127,8 @@
  *
  * arg[2]:
  *
- * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
+ * @4-tiled-bmg-ccs:           4 tiled xe2 pat controlled ccs
+ * @4-tiled-lnl-ccs:           4 tiled xe2 pat controlled ccs
  * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
  * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
  * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
@@ -219,7 +221,8 @@ static const struct {
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
-	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
+	{I915_FORMAT_MOD_4_TILED_BMG_CCS, "4-tiled-bmg-ccs"},
+	{I915_FORMAT_MOD_4_TILED_LNL_CCS, "4-tiled-lnl-ccs"},
 };
 
 static bool check_ccs_planes;
@@ -758,13 +761,9 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
 		} else {
-			if (modifier == I915_FORMAT_MOD_4_TILED) {
+			if (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+			    modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
 				struct igt_fb temp_fb;
-				/* tile4 is used as ccs modifier
-				 * on Xe2 where compression is handled
-				 * through PAT indexes.
-				 */
-
 				// non compressed temporary pattern image
 				if (do_solid_fill)
 					igt_create_color_fb(data->drm_fd, width, height,
@@ -969,14 +968,16 @@ static void test_output(data_t *data, const int testnum)
 		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
 		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
 		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED))
+		    (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS)))
 			continue;
 
 		data->ccs_modifier = ccs_modifiers[i].modifier;
 
 		igt_describe(tests[testnum].description);
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
-			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
+			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
 				igt_require_f(AT_LEAST_GEN(dev_id, 20),
 					      "Xe2 platform needed.\n");
 			} else {
-- 
2.45.2

