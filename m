Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97355C83F2E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E00310E5B3;
	Tue, 15 Jul 2025 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hqmi/Jwu";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E857E10E5AF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so17376405e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575154; x=1753179954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0mhEKiTgPA3amIKUuUigrSA4ovO4Xyr6l3MIsR9754=;
 b=hqmi/JwuOxy2y6t/5tYn+OmkO2se9hO1W/nn427U3g57rky3FvxSWcQZPwSjKoaTc+
 41r7mhTWQzCiTM2ZX996bSCnVQlondVDVO3VYzLeT/dcNVFMbzi0GX97kufXnR+KftsQ
 stKX/5aDn7L/7EE0Ct28kmzFQuC1yiDeB5jFwX4ToIGqlhT26TCpCC7Uj4Qz6uOsOZY+
 xqFpOqrNjFku2EyjEUU+oUEPjoo8mj4PnJxkngW3QrFdrX73bWdrS8Hu4S0cZ2G+xaSw
 fvjhXp+Nj7odbrmzPQpQlDstrFDIHSJAfl6aoWHHkqh1/rvdLlwkTsLyRudNa1qrXk2B
 fDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575154; x=1753179954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0mhEKiTgPA3amIKUuUigrSA4ovO4Xyr6l3MIsR9754=;
 b=UGxjrVX+xb/EhGLKi76tr5JNv8UGtH9CJ4aiG/C/qQkI6pWRL/RGZlnHj7sXBx7aow
 nyp7bUQX6sRmItrHw5TcFGUxPSXTBqOslFYEybE7pIYLYzBQcaHsEdUnzbwkvCmMzmrW
 TL4LDDgRWZDUrYnOm0eCVgaYWsbMhnQHtn3f4nNHoLk+oKw4NkbQa3FqgTEGi7iVze/6
 JWhXzpIirSRLAb+AOLMB1MeMlRDn2eBOJS08YoGv+Tdq4I7xv35wMXjVDy5fZAlkcaM2
 +A3GsPQOPeBIlW3C/FsO32cKK3fJ0EoWgpyBBysOF/nP296LIpKr8BJuv1m193KiSj9I
 K5ug==
X-Gm-Message-State: AOJu0YwB+3CfemraEFz15O9VC2xHMkBFugAPQL+bpMEmhTa8IouiUySn
 uEPJqW4t/0gDk+efN5bzDACdMmT7f8aaYF4O8VZWBRSZS7OPziNnRITa88rtUw==
X-Gm-Gg: ASbGncsEKmxaH4Zhe3eQkm+AikcYlSDvpJR5sC/Tnj7ufLCD4ZU9Enoj2fcm7dYktyt
 BXlfRgkKmtsB4x9zLU+oGzFzBZ4DrSvGTGwwR7WlaclZJYuxDE5cb+idumTjasCe5/Zb5Fm4DC8
 Da62Nr1+hlgy+UHW0vkKXkK8OCvJzkowAIvgJA5UboKvlhE1Cl3Lzr2qAqtadTUSn1Voi50U/6B
 asemddAsVcAxJmd7HoO3VCL8fN42RUrF1RBN9JEQenPTCXFc0/VYr/oJIIZCUfGShVS+lgNG+ez
 1ult6hbnFMs94TWLUgR+dAIjKJNgLAiYZJKFTsjnosNufHgoMk50XqhAkMc0ioE8eGUCiyiAAEe
 Ry8tkf/hre6oa8XsKjQ==
X-Google-Smtp-Source: AGHT+IGdz3FGtjvohoLHKknPJpc0ech5rN80yKeW038MPwaslgMYA83OBhlg4i6Zqz1LT5Up11qQcg==
X-Received: by 2002:a05:600c:444d:b0:456:15c7:ce90 with SMTP id
 5b1f17b1804b1-456288a55c4mr16494925e9.12.1752575153886; 
 Tue, 15 Jul 2025 03:25:53 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 39/41] lib/vkms: Test changing enabled device encoders
Date: Tue, 15 Jul 2025 12:25:11 +0200
Message-ID: <20250715102513.5636-40-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the encoder values can't
change and that deleting it or the attached CRTCs doesn't change the
VKMS device.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 ++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 5923e8527..c42b96b11 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -862,6 +862,18 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
 
+/**
+ * igt_vkms_device_remove_encoder:
+ * @dev: Device to remove the encoder from
+ * @name: Encoder name
+ *
+ * Remove an existing encoder from the VKMS device.
+ */
+bool igt_vkms_device_remove_encoder(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
+}
+
 /**
  * igt_vkms_encoder_attach_crtc:
  * @dev: Target device
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 9785a64e9..3081addad 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -111,6 +111,7 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_encoder(igt_vkms_t *dev, const char *name);
 bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 62dfb99be..747b057fe 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1689,6 +1689,67 @@ static void test_enabled_crtc_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-encoder-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the encoder values
+ *              can't change and that deleting it or the attached CRTCs doesn't
+ *              change the VKMS device.
+ */
+
+static void test_enabled_encoder_cannot_change(void)
+{
+	igt_vkms_t *dev;
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
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
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
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Try to change values */
+	igt_assert(!igt_vkms_encoder_attach_crtc(dev, "encoder0", "crtc1"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_encoder_detach_crtc(dev, "encoder0", "crtc0"));
+	igt_assert(igt_vkms_connector_detach_encoder(dev, "connector0",
+						     "encoder0"));
+	igt_assert(igt_vkms_device_remove_encoder(dev, "encoder0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1731,6 +1792,7 @@ igt_main
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
+		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.0

