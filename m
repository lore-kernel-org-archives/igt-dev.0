Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD5D6B6A0
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 16:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BF910E7D7;
	Wed, 30 Oct 2024 16:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGsMWPs0";
	dkim-atps=neutral
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7647310E008
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 16:02:48 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71e6cec7227so5572794b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730304168; x=1730908968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QFB6135M6WiHKWbW0pVgt6UindiOkrWN2Po7oJi5Hvk=;
 b=AGsMWPs0bPRzK7PX6Rg0OJHs8tt9I+Z/3OXAp8asMImfN79AIqq1rE4YTWq9fE4Gkl
 xWRxxpQkWBfkqfe3Xb00Xn2/5KYOTZvzS54V1b5mi2d3ueQ/3B/bSA3vWDUCT3yR1GQg
 v0kRvIV2fwEBV+MDKYv2NZhkq0UgPN2nduQr+lbgdQnNsmYI9XY4Ro+FrXY8QO96llHP
 uCQwhTqpZfheMQxjvszPiWV0JFauHehv6lBl1vrwzX5CZo2GeHaCWJXtt9XfceVNWzlq
 Ib8dyapluK9KRHe1SS7lwJ74TSv8+gZipgkhFoMgBmirIdc2HwuUNAvkyVMAFf+6acgJ
 1ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730304168; x=1730908968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QFB6135M6WiHKWbW0pVgt6UindiOkrWN2Po7oJi5Hvk=;
 b=EcRV8H9fCeoO/boOuLiika4/rg5/qEqt+ESdQqko3+RvhVfUxYhsQJkV4RNyU5ky0s
 22IKUKzCUox2Hnu+5ATILL6WblX23/bfuFQy3MFVzDRAkrwOTnhp+NA5lyAZL85EO8eG
 egC3Z/WKozGtSG0gfw1ZvX8IsNZ9ixdA2ylRBvaCbJJUYMwPFTbuRGUglJd4bPKheVtF
 k93dKSWrrerWC5S0ol5z82CDiGP2mXG9LeyKzhkK0o7B7b7UAZlAFzUgg3Kv/2UyllOU
 pLPc0ZwJmUIla0oJo7W+HRqPOuuTfmd3ToXkH/PIwoLSg1L4hCCnTZoOnf0MArj/uG5f
 4FJA==
X-Gm-Message-State: AOJu0YwSfFCax8Y/JdX7V0nm8JRiWnpdfnCFwmQbpk7JMp4cZJULHyKW
 +bzmlEEZo6AA4BbKwhr9skkARd+kDtUtDL5NtE8VfYG477/anAcNexueNe3mO3A=
X-Google-Smtp-Source: AGHT+IFv6FeVpfwpTMx+pgRFn3gRES+kTBzVtzR5FgB92nlm++0JoQxEdjTioW/oQmEbFuCabTRsyQ==
X-Received: by 2002:a05:6a21:6f01:b0:1d7:8a9:63c with SMTP id
 adf61e73a8af0-1d9a850b59amr19173108637.49.1730304167411; 
 Wed, 30 Oct 2024 09:02:47 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057921601sm9441654b3a.41.2024.10.30.09.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:02:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/kms_ccs: add suspend tests
Date: Wed, 30 Oct 2024 18:06:18 +0200
Message-ID: <20241030160618.175847-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Add testing for suspend/resume while compressed framebuffer is on screen.
Test use only XR24 and P016 formats for testing.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index a5d3ff5e6..c785244f4 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -96,6 +96,7 @@
  * arg[1]:
  *
  * @crc-primary-basic:           Primary plane CRC compatibility
+ * @crc-primary-suspend:         Primary plane CRC after suspend
  * @crc-sprite-planes-basic:     Sprite plane CRC compatability
  * @random-ccs-data:             Random CCS data
  *
@@ -159,6 +160,7 @@ enum test_flags {
 	TEST_BAD_AUX_STRIDE		= 1 << 7,
 	TEST_RANDOM			= 1 << 8,
 	TEST_ALL_PLANES			= 1 << 9,
+	TEST_SUSPEND			= 1 << 10,
 };
 
 #define TEST_BAD_CCS_PLANE	(TEST_NO_AUX_BUFFER | TEST_BAD_CCS_HANDLE | \
@@ -252,6 +254,7 @@ static const struct {
 	{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
 	{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
 	{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
+	{TEST_CRC | TEST_SUSPEND, "crc-primary-suspend", "Test primary plane CRC with suspend on XR24 and P016 formats"},
 };
 
 /*
@@ -817,8 +820,13 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	ret = igt_display_try_commit2(display, data->commit);
 
-	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc)
+	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
+		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED)
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+						      SUSPEND_TEST_NONE);
+
 		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+	}
 
 	igt_debug_wait_for_keypress("ccs");
 
@@ -846,6 +854,11 @@ static int test_ccs(data_t *data)
 	igt_crc_t crc, ref_crc;
 	enum test_fb_flags fb_flags = 0;
 
+	if (data->flags & TEST_SUSPEND &&
+	    !(data->format == DRM_FORMAT_XRGB8888 ||
+	      data->format == DRM_FORMAT_P016))
+	      return 0;
+
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT "\n",
 		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
 
-- 
2.45.2

