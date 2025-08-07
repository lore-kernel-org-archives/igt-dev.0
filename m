Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC44C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971310E7F7;
	Thu,  7 Aug 2025 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wm6EJbSl";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A010E80F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso540670f8f.1
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552799; x=1755157599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwLgTVZS0Mt+rEwPWDj3CiJDTE/+hOpALe0M4komC+M=;
 b=Wm6EJbSlliig+h+muiqHnlquIobO3h/zJuva3xjk02XuAGwmSqhE4tbPQt85kkomrt
 uaB1rG4TjHpn8LYfegmpiyJ/XjovGqiio6+pPP+O9wJIe9gi4TTYleXN+RR+cQhEjprx
 au/ajxLv4/8ckxBLbnr7m/MzOjY6gMaD4mR2IEPTwfCQ42V0mt/rm2G5I1+Jy82CEPc5
 F0Sf6L1LrF6ZKN5MSfikhbahbz6AIswZkWVSiR7gCyNlhRwG7rIsE4KsU63XXLRFhA4U
 0MwWGdJWixTa3IyIGry2eUO01r92zpE2Ku9AY/nU/LLvGt+UEt5vrdpK2Fp/htyPUqyX
 FemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552799; x=1755157599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwLgTVZS0Mt+rEwPWDj3CiJDTE/+hOpALe0M4komC+M=;
 b=Ro+42JeUQcjK5P89Li6JRXeIKQ2uihXxz+yZKB8OSNL5Z8Zobbdnr8ctI+rRxDH/ke
 KsctCfAQt3n5rKpdW+Kzh/mYbdaOPIoFCUp9Kf2DqvP9PdqAIHaY+ZOQdGiKMPhye9qJ
 mwgIE8Lbt+/dSX+WanONcc1bA99J8srmxulidjeVfAHnsRPg6u7UJfS2qFrPJdwftphG
 fTnyZmMidYak/18m7Os4u4qXLVrzZzIy1WaXBCkJKQXS9VtWk2Kl27HqemEEl/kPMi7+
 rg1n40cOEVSzlztNnWXyhUD4gcT59Bqfiw67haogRv5rhxxpLkhpYnFqwKw7Iv2OdkWk
 MuGg==
X-Gm-Message-State: AOJu0YwpJAHtUfcl72/f8zN8f8CygIvRTuHB/QhqFANFtCzFxC9amGVX
 PT1njpQrUk8jSeODInSd9puoMikmUg1k9J/Y3WXJ66atOIUIFl/1mmcpOv7x3Z6M
X-Gm-Gg: ASbGnctFiL4GkEor3ySyR+ob1f65hrbMdukszgC3yss7X5TUQyzNaLwR2JP/yYqLMJE
 /dQzSltVbHWGqMBFFUg3X8jNu6L1UxZJfmgweAh093dJVkK11gvqFLFUqD4eGzq0ha1HOmnwe5M
 0Krt7ySZamFjW58lTP6ZKbJY45/KiEYWNJHrDTZWiSStDkJWPwFh4F3Hp5aDcQh/1rXYZkULEo9
 afAQR7m/iqWzKWQ+HZ7/L5X+uXu0LFTX6TXRDMxHq1YT2RlB/wLCfvFALdYFW+7fqDhFHJcpaEH
 gonX9Jb+neJdxeYrYPLDV1jXmV+pEyK/urVAr/YgHZMzS2jVBERyzOmYuvM2I0co5X1QZM6wI2P
 8/mXeycdH2ygjPnDp+JE=
X-Google-Smtp-Source: AGHT+IGBscYfWPUVv9RdOC3coi1up/+CKOx4YwHssIAYME7BhuMCQQCNJy/3HvAOskBw4voinAUa+A==
X-Received: by 2002:a05:6000:3111:b0:3b7:882c:778 with SMTP id
 ffacd0b85a97d-3b8f97e1b4fmr2053397f8f.17.1754552799316; 
 Thu, 07 Aug 2025 00:46:39 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 34/41] tests/vkms_configfs: Test adding a CRTC
 without encoders
Date: Thu,  7 Aug 2025 09:45:43 +0200
Message-ID: <20250807074550.6543-35-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a CRTC without encoders and test that
it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8444b5509..0b6d395cb 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1353,6 +1353,56 @@ static void test_enable_encoder_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-crtc-no-encoder
+ * Description: Try to enable a VKMS device with a CRTC without encoders and
+ *              test that it fails.
+ */
+
+static void test_enable_crtc_no_encoder(void)
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
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0", "encoder1" },
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
@@ -1390,6 +1440,7 @@ igt_main
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
+		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 	};
 
 	igt_fixture {
-- 
2.50.1

