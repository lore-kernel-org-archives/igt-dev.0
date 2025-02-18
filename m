Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0F8C021B9
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0171D10E7AC;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmR9tp2k";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6CE10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:45 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38f22fe889aso4553492f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897443; x=1740502243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1JYipLr3l9eAGr9hrZcY2LpPvWmyYkbM/tn8nJDlz0=;
 b=VmR9tp2ksHv8vAVtSC86G9bhLY8CgW1gR3PsguyA9bJi8fuf8tGJMPVa1gL9H7mG7y
 pAJYPY/YQ6MRkyFXvYCicN9eR+yJuLwk9V6EhJ9ADhFa+GKi59ZxOEOR7jNt5o7gm8f0
 8cZOf3iGyvmWNS1wZfn5zGM8JoHI6fTmDxf5xvdLF6IEiVTH8EbWyai7DD75lwvRdSOt
 MB2OYnHhsR7iFTP47SyNYTmiKe7etCRknvywSOx3uaqvbLKLkFriiS/WNCix3v0Sf2JF
 aCAbKxnBda9nSPQrSO8aWtooh0TU5itbyCIcUlRJo1noDu6iHKJHv7oTi8mKwUs3IMXp
 r/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897443; x=1740502243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1JYipLr3l9eAGr9hrZcY2LpPvWmyYkbM/tn8nJDlz0=;
 b=ffSF0/IG90mx3RIiF/ZGtrBf09vXY+Q1DNWK97F3SotIIaSoh12iH8KcpGgps8Wf8w
 HZ040nGkESigPxUlJhB4RTOhPOcM/zzcLMTWDu0Gcwf2MIaK4oPTtUL6I65MN4Cds2GU
 9cSdG5HXEmupyH8US8MMBP0qmyBxQ/I5/nHG0sUYw8+ESeku9kIH7FMWVb6ZTJ81HUhV
 8dspqdLSRE/+zteER9kKVrSdrzqMJ746YB/K7NldW0+xX6hPhwV0aGTudM+pGrrpokwG
 eC+Pgqk0WCamcH5ahyp7cvA5r/4PVWc4UyJZRN8+k/9ooZ+bNetp/VrqxpOOk+UCttor
 dtxQ==
X-Gm-Message-State: AOJu0Yzrc0Pe0cfSgtFlfnwEePOdG2OI1Qu1Y/9oxF3sy+QPs2urIrQ9
 gnqSHkz581wOTZl59J3X2qT/BcAztiqAwyq8b1tb2mSXL3EUjub3t+GOi2yO
X-Gm-Gg: ASbGncvyWGc8yuqNR2Ij+CO+LiX8n9PjQc1nD3ndnUxxNsz5eJcZWqP2emQsgmrXdNo
 GBsrFIoDrMr6uJZUvtAjFG3m1EURwryC0Q3RuV8r1n7fRynkzEbJcwIXuwLCbg0m/Rpu05aAajt
 dguMsJf7hPFA6W9/8zXPl6PddJf6YR61gNz5wioo+oxvANRN1dy1yyRpyohtPqGQ3B6BuuGtk9u
 IXWmlPaLzzr2xWvS3rE5E+AKadiw2fBsom9iF3ZgD/uyiqvAzrkDTumqG8TPC4BHX6SVkZ6wQKb
 i6qoUs+2C32y9zERzQ==
X-Google-Smtp-Source: AGHT+IF/DMiwz6vtFd2XMpp0cqyY6FrkFDxfrkZtQDoMnTPjaUCoTUlF8FpLhM1vELurziR8rrSqfA==
X-Received: by 2002:a05:6000:1568:b0:38f:43c8:f766 with SMTP id
 ffacd0b85a97d-38f43c8fb55mr10445859f8f.31.1739897443363; 
 Tue, 18 Feb 2025 08:50:43 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:42 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 31/39] tests/vkms_configfs: Test adding an encoder
 without possible CRTCs
Date: Tue, 18 Feb 2025 17:50:03 +0100
Message-ID: <20250218165011.9123-32-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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

Try to enable a VKMS device with an encoder without possible CRTCs and
test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8f1f46f90..11ed6dbcb 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1235,6 +1235,49 @@ static void test_enable_too_many_encoders(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-encoder-no-crtcs
+ * Description: Try to enable a VKMS device with an encoder without possible
+ *              CRTCs and test that it fails.
+ */
+
+static void test_enable_encoder_no_crtcs(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = {} },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1268,6 +1311,7 @@ igt_main
 		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
+		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

