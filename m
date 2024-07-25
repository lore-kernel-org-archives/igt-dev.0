Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9629C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 18:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAAF10E8B7;
	Thu, 25 Jul 2024 18:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYLvWtmh";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5C10E8B7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 18:13:24 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fc569440e1so11445475ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 11:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721931204; x=1722536004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vd1VEIqxVwuMKf7RqS6ukFCXDvI+aVR4tAZVJj0Owts=;
 b=FYLvWtmh450U98L1cfGQR+IN3lbKsQCRfQtcwfit8jTgMCWT6z/J/9Th79TuLE5Fj+
 sV1TUlsCfHAtplbbLXE2VrFYosi5kfxlLEmh4bDFQxFY7dX9PAbR+J7O2FVF/35reTbF
 iqtQQUMczFtotlcb/L92D3pbn6iZ7rj75csWm/ktoLl5ATsXRVWVluQDjb5HLwurB1Zm
 ffgPnfXyRMDKtO9+iagiz2WnjJU6HADvVjAG+mXy4IZpGFDz/q7iKfzPdPxe/gxaRQVN
 nyAP2cFsJv5ugNNZHYErJGvblIVUjZwmjnouaONXegp+tnzFetmL9vdgvaJb8tiPMKqx
 IdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721931204; x=1722536004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vd1VEIqxVwuMKf7RqS6ukFCXDvI+aVR4tAZVJj0Owts=;
 b=aQWi1/p015ExDPa8IBylCSLWoF+DwMDSmNMAX89Y6zD6GfhlfS0kN0+/q4YLCNU4Z/
 OTG7aukMeaamVOWEGXZPFXFNaGh5vs1LK96m4csHMhg9IUTxHdmNM+q1ujdcZp2/R2+c
 44okaCIfzwXhuujToOFUAEi1+ZNLhwHiaw+68YDyi0OY9ee78pmD30QCh85ahLEShQq9
 YDtIbT/bWjQaxU0qYYjMvDBTvrM08pi26M1CH7GE0xWW0o+tsbTLIgPbOKelwATJenkC
 fyyoY959t9lPOZn6yeYBHVCzqDzsH5i5I9lBbUvkzyfWh3p9qYzvd9yTsmokbrKGF4/O
 ab2g==
X-Gm-Message-State: AOJu0Yzu2kZbwFIGx95l5wKejzuS/9M2XBEiy+Wna+ciz1+mlZgmUs7I
 XtDVwcK74rB1BiyvOPIZo0TKgfjDg68Y5F940duvCAJnKrPwsoW2bQ87iqQwtIo=
X-Google-Smtp-Source: AGHT+IH44in3RXxsdC6eaAccGd+JEo4txPsLGiXl8AmnNR46/PUJ1xTeo20jux9EERCGlMG85UcehQ==
X-Received: by 2002:a17:902:f60d:b0:1fd:89c1:49d6 with SMTP id
 d9443c01a7336-1fed3aed2cbmr43228205ad.44.1721931203655; 
 Thu, 25 Jul 2024 11:13:23 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7c7ffecsm17408605ad.40.2024.07.25.11.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:13:23 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_ccs: Add testing for
 I915_FORMAT_MOD_4_TILED_XE2_CCS
Date: Thu, 25 Jul 2024 21:16:22 +0300
Message-ID: <20240725181622.3457403-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
References: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
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
used I915_FORMAT_MOD_4_TILED_XE2_CCS instead.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index c91370a9a..d64e9ef46 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -219,7 +219,7 @@ static const struct {
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
 	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
-	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
+	{I915_FORMAT_MOD_4_TILED_XE2_CCS, "4-tiled-xe2-ccs"},
 };
 
 static bool check_ccs_planes;
@@ -759,7 +759,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
 		} else {
-			if (modifier == I915_FORMAT_MOD_4_TILED) {
+			if (modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS) {
 				struct igt_fb temp_fb;
 				/* tile4 is used as ccs modifier
 				 * on Xe2 where compression is handled
@@ -971,14 +971,14 @@ static void test_output(data_t *data, const int testnum)
 		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
 		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
 		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
-		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED))
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS))
 			continue;
 
 		data->ccs_modifier = ccs_modifiers[i].modifier;
 
 		igt_describe(tests[testnum].description);
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
-			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
+			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS) {
 				igt_require_f(AT_LEAST_GEN(dev_id, 20),
 					      "Xe2 platform needed.\n");
 			} else {
-- 
2.43.2

