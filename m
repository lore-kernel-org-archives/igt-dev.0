Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E64C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 11:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F310E85B;
	Thu, 22 Aug 2024 11:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eOEF6F3N";
	dkim-atps=neutral
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10BC10E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:19:23 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7cd9e4f550dso164486a12.0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724325563; x=1724930363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ueyP5Qj6Rd5vdX7yHWigG/wauCfMERkSmp60/5j7STA=;
 b=eOEF6F3NaH5i3nXR/mzNkJ6WoGU2izALt8IItOSPJaporrISkHP39Rc1OHRw/SwU9a
 Tca1mwLYGdt+lmCsxg2cnZcRwSdAedHG/kJUjW7KfKYWcA5lisHkoNnaLNW6G1Biwi2K
 TVlGN4bWDAvR6mvjWgm3FYmsZvHwSb7ivIuHMaMUlDiLQ0PA6AhkrGQoU4iI3FTE9ppX
 1UgR1dUYr1PYD9o4GiaSC7b1vBgTWI3HNCgRnAZc+p3PmBFw1x3OGtoehzytjWZDdLxN
 pmBa2DKIofXFviTlsuMhbAIu0ShGfl5DaJgz5WJ19gds1UvDfJ61uoqIjSB2Ww+KuP9R
 mBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724325563; x=1724930363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ueyP5Qj6Rd5vdX7yHWigG/wauCfMERkSmp60/5j7STA=;
 b=ctWVdp+7BbWR1ktmLh7qOO/beSTARYLAwpxZrBJQLv4aYm3jKnhjfBoboFzEhYUocQ
 B+pupoQInQeSods30c1eCuYmQoDlkVtfECAfX3eFExaq2LYRuRhBvZOaHCVlRLWugk67
 MMJpwSWxWxmpApQ3TwXbdOZlg3AAfARso4GIhwuMewAu8QT0825fK36Tj38d08ohn2or
 FA+z/w8neADMLNVIsGdGqs7Xy0XKEKdnv1bv1+XcjOVI+zcRJ9Qki/lldLmecxFamoT0
 amdCEXuCw8uKDmd4G6VoH+3vMG2JHcEEXtdTHYLxlCNVrgoj9jgGvpLnNlWDQUyc2AAs
 D4+Q==
X-Gm-Message-State: AOJu0YwkpqeK0an0r3Qshnws5+8GisXpwdJ1M8S3dEM7m4JTqc8pZuqC
 uXejUNHhzr9C0ZSJbZ0l5HivaOGxDx8HiH/aH5yghoDLVYaiY2umiYBNRRXfz/M=
X-Google-Smtp-Source: AGHT+IF4Qa7UW4EL2ySoy3n8bvCGBWTuxGQi+K/DtLqGpdsbcqKBkE5aS7om/WbiIMy+luuUcxnQZA==
X-Received: by 2002:a05:6a21:9786:b0:1c3:ea28:3c0e with SMTP id
 adf61e73a8af0-1cada15dfc1mr5911230637.33.1724325562892; 
 Thu, 22 Aug 2024 04:19:22 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855811fcsm10475135ad.103.2024.08.22.04.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 04:19:22 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_ccs: Add testing for Xe2 ccs
 modifiers
Date: Thu, 22 Aug 2024 14:22:52 +0300
Message-ID: <20240822112252.4148114-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
References: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

