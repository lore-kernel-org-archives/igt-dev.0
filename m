Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6353AC021BC
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83C10E7B2;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ww5ZyGqB";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3F010E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so3390268f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897449; x=1740502249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjfEeZ3yhf5n2BRNiCiQ7jCVRiUH+3HuqI0s0EDeiHU=;
 b=Ww5ZyGqBQ9P1jsEC46/Mr6qz0OSRw59WzTbRj1Pxcy5w69vXS4/PUa/cy8zRhW3pEb
 E/UnYODJQcRe9XOeHrbhJLaw4tZCvCtiKwLd8rc2akVD4a1R/nX88N+MykroHN3ffwYt
 qbRQuBi8h11IDpKxm74TxVkQpJ495r8VAIOwNUC9ODSA3Ha0VPdR/uRMUlAUMYig2x6z
 pg+6K8R2RxVy029fbVtt5vH5EG+bKC7TO5ZJFznhzXRo+Ukznwl2mxPAUCYQxt50PVy2
 whYEJ4FmPp1ekJ7DfsUJW2khi5xNn8ObEbeK0Q30gT/VR9qAyFjOkLcTz+YYxdBhpXzC
 yuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897449; x=1740502249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjfEeZ3yhf5n2BRNiCiQ7jCVRiUH+3HuqI0s0EDeiHU=;
 b=NQon1L84u9tveHBUrswuj2ss1ko+8+1TBRIRvDGrLy+yLgps/8SXg7sUpBLIb5JEWV
 6R5GGxJyuLDEHEPqIG5eKB2F6wbo9dOalOj32EbPap/CoejRnZT2ZCOXUp8M9yKqoyDi
 0Gdfl0s7d8kTvjB5WLo7lqXMBTVuSO4lUBcSgBVx1h2RchWmLcye946c9qTllnIqEyzb
 YXSvEaBu1p28oJykaOKKtb0AQzGFnIi72sBKVQVkXmvjumXEWIRrkVIA9073ohs91sR/
 y3p+bkIJsgLfkfCSiNN09iU0xnZITbOpPzcHusG+yKGa0QhVtXJdcLmek19oUattOv8n
 aTVw==
X-Gm-Message-State: AOJu0YzmwlOm//j/C74Oh96E81hr/jtle4AiB7aumDXYrqBAZbbm1rd1
 i2VUD51XpVlhVZtT4TbHjCBJaXUkJG6yB/PUFMZB4F2kHc1r5ywH3T7GKGoK
X-Gm-Gg: ASbGncuBcWRfXzUE6aYGWmIocrYWfQuI/C/BnkE8nAm+KKT1ab5IWlKA3gP76hVEjLo
 SNe/oLhag+tZtsWn4U7tQm2wzrZuwd8iBMNmz624EkXRFSsBpj4Ov/8Do8EOejFvSfj+p0e7KSq
 UXTTbybT1UBIvyqnInRWEraFpoVDhofZzPytrVesnVZZjc+kxX/iw4rh74zfV7kVzLpXr4IUCh/
 ByU+c9QaNR2vvNYTHmQDg/7M03oahPZY002uLYPPl6Nz96+cvuKf17XbQ2gspU45PPJCeLBpEuC
 jC5Atrc0kViZXC8Plg==
X-Google-Smtp-Source: AGHT+IGBEk75XGjXnpvAiK7bbRtBz7WeLzo6fqfsk++RCX5MvCkRYZShRO6pSXgxcabvWPa17kZ72A==
X-Received: by 2002:a5d:480f:0:b0:38f:2efb:b829 with SMTP id
 ffacd0b85a97d-38f587f18demr76220f8f.50.1739897449143; 
 Tue, 18 Feb 2025 08:50:49 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:48 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 37/39] lib/vkms: Test changing enabled device encoders
Date: Tue, 18 Feb 2025 17:50:09 +0100
Message-ID: <20250218165011.9123-38-jose.exposito89@gmail.com>
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
index 58c71ca08..95fbf5773 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -648,6 +648,18 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
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
index e1f63d809..b82282a11 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -88,6 +88,7 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_encoder(igt_vkms_t *dev, const char *name);
 bool igt_vkms_encoder_attach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d8ae1f073..be311e77e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1614,6 +1614,67 @@ static void test_enabled_crtc_cannot_change(void)
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
@@ -1653,6 +1714,7 @@ igt_main
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
+		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

