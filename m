Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392DCC021B6
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB32B10E7C0;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y9l7XQvU";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95AC10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:52 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43998deed24so4105705e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897451; x=1740502251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0nJy5HuWFFyyAGmuSamRzFZldeSzXtOO2GSkBZSHSA=;
 b=Y9l7XQvUJHRvqZnmqpA+C7PUDXxQwGoFx5r+hV4d5JCpncJcAmWexOlGxCLrvrAyML
 ay9uHxFdIhYErvNtTrpc4495JPIgnbal2ZgA/3XXCsd86aQu7BW/9pLCRf1kfaivj59W
 yYADRCZyrekQ6wbIlx5LB5T/vks8CiEyJI2Z1nBDpa35XYIv+mblRhzUNgq0dqqqjwDB
 EobKjN60iDtC1xAqduKuJl1Sq/CDnUBVhuqbl65GWNDNsB4k+BxcA3W2l8E0aMuBCx8b
 eXBYn8h89cD+BkdRZrXP4Srehd81Kq2uRHTr1icj+kDMwqpGmaerluHdFEd1J8NLqyXs
 2cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897451; x=1740502251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0nJy5HuWFFyyAGmuSamRzFZldeSzXtOO2GSkBZSHSA=;
 b=k+nqG3UaxxhAjT7nIXDi/gjXWC1er3i1kqTKd6stcVbypIAKtT5u6MqoMxI2Fwv8nj
 kedNBzNEYmR3Fa869mW4I94QcSzGb2/UbSUdLAzOLyVCwtbM4dncvAY0zpfY41WeuhNv
 TXGOhMjIAl3m0aKP99IBKSW2KHTvfCISgZzIL4stvOsZ9rJhXB6QpQyLOvAAvqJKcXlZ
 DwFm/myVkbhD7yCp7weXgyBfUW9jZ6jz1VksSZHqIPRlTBxGZMyJfcqqfTBPPJdSifap
 lgH7nwHEEwJSWpgAA1tesAsOV1IilCl0q+zBQds+peXLk8YIFMpChHP2rW0XOcZcyvuj
 D0fg==
X-Gm-Message-State: AOJu0Yy0jtYritAFvUSYCT9KV6LDNOSRDh6ZxRmIb/WvWMs0UeDFIg5Z
 wUCymsip9p+beOlCWcihxGdaWbFpvg03SvBWJbRadd5Dm3m4tnFHiPkewekj
X-Gm-Gg: ASbGncu99OVYO88rADm0ZHcpaK9EQCFj8XX9zmfdrZp1fMZdYQVciXOtdiQqh8SJGFk
 HviRUB4bXx4UYqp5JyE07KAONqeumvatJ5uqt/O0O9aERt6wiiEU+bW4aDw76qBuHA3MFNbG9wP
 x5nXMz9Z4qs/4cP3Rx+hBJM9kc/DtKG2Mw3z07HQGMCUUsyFjXA2bBdqI5RLUGpXzW3+qhYRf4P
 IIf0zcEEGBwzDxvfjkvTtHhVKjtPn4+LLPkMb/Vn0EYSdeeTloPO/pfXlzljTWvMxiyJQqMpcSh
 M6aJ9yGlSnQAIB/A/w==
X-Google-Smtp-Source: AGHT+IEAmzdFN+YdMjNaVpS3iSp6C5sKRNz88q3kgLtvwqaaqYrM7N//XdlgXq9Fd5yZtUkhsbQW3g==
X-Received: by 2002:a05:600c:46ca:b0:439:92ca:f01b with SMTP id
 5b1f17b1804b1-43992caf984mr36623995e9.13.1739897450915; 
 Tue, 18 Feb 2025 08:50:50 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:50 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 39/39] tests/vkms_configfs: Test connector hot-plug
Date: Tue, 18 Feb 2025 17:50:11 +0100
Message-ID: <20250218165011.9123-40-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connectors can be
hot-plugged and hot-unplugged.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 47a6a81ff..16922b62b 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1738,6 +1738,89 @@ static void test_enabled_connector_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-connector-hot-plug
+ * Description: Test that, once a VKMS device is enabled, the connectors can be
+ *              hot-plugged and unplugged.
+ */
+
+static void test_enabled_connector_hot_plug(void)
+{
+	igt_vkms_t *dev;
+	drmModeConnection status;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0", .writeback = true },
+			{ .name = "crtc1", .writeback = true },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder0" },
+			},
+			{
+				.name = "connector1",
+				.status = DRM_MODE_DISCONNECTED,
+				.possible_encoders = { "encoder1" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Connect both connectors */
+	cfg.connectors[0].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_CONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_CONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_CONNECTED);
+	assert_device_config(&cfg);
+
+	/* Set one to unknown connection and disconnect the other one */
+	cfg.connectors[0].status = DRM_MODE_UNKNOWNCONNECTION;
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
+	status = igt_vkms_connector_get_status(dev, "connector0");
+	igt_assert_eq(status, DRM_MODE_UNKNOWNCONNECTION);
+	assert_device_config(&cfg);
+
+	cfg.connectors[1].status = DRM_MODE_DISCONNECTED;
+	igt_vkms_connector_set_status(dev, "connector1", DRM_MODE_DISCONNECTED);
+	status = igt_vkms_connector_get_status(dev, "connector1");
+	igt_assert_eq(status, DRM_MODE_DISCONNECTED);
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1779,6 +1862,7 @@ igt_main
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
+		{ "enabled-connector-hot-plug", test_enabled_connector_hot_plug },
 	};
 
 	igt_fixture {
-- 
2.48.1

