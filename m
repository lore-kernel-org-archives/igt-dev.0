Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0886C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C4D10E900;
	Thu, 13 Mar 2025 17:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HgbDr99Z";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018CF10E923
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:03 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39130ee05b0so1257439f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887241; x=1742492041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1noa05r4g7E276Gz4r2fh3CUM5odUAAPTyoZnPscl/o=;
 b=HgbDr99ZfzDzgnWI/y6OZqhUf+ZNZwIkIsQO4ClBukabbC1T41SiVCFNtAvS70avmi
 LEgG4x3aLVKzuX6jpOvD1UTKOMG+Voem3L4O/bkh5XNyzwrp/+XdyAKDqmY39Ilp5mMY
 ia8cVJaWkwiq2LCLHGzk8BzA1NRO6qpACzlwJiYVW6Lk5cp0SdhnaRUui6OBTbx5f3Wp
 tQfTwVzDiZXOqViMW5kJOr/LDVpdJEW5WCJ2E9pXjIxemchfo3ixzSrbF8U7X04SGJ85
 1bmD5/IXLX/WxFxIMvtA3QWEtUZR03VMas2vuzopFhG83zuIZYTiLMDQRsXAPpuOX6h6
 ivoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887241; x=1742492041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1noa05r4g7E276Gz4r2fh3CUM5odUAAPTyoZnPscl/o=;
 b=pkTc4oZeB6Uejp6RVG2DQc6WTBVSKN1Ufkxk5kCFig8jfHP8JEAvlHFGGWwmFxyuVZ
 /sh/NbC51y1Q+DXmScPuUtBo10LgqpTLW68jB32tEuHAV+NQ0n+EpWdraSHPiXAhAsjk
 HOz5Ct4AMGFdOY7JR+7gB+HSSZoYphRLson0dxJzUWiiHkviCJVRdSPYHhwb71+XNF4O
 3z+vQvSul3R7U3GXj1NNdmORtOGcCpQp6CfZecmdPO6w9IrAKM4kDsSi+Vrk6+LXenYr
 5yh1fYH8Jmf0fhgJdPHV9YdcPt+SytMS6vx99QXBPdsbn1T+cdvXbuYzA0kPsGQ1V1pL
 47dA==
X-Gm-Message-State: AOJu0Yy3HIa0897q+TD6X/4XWd0HmuzOPxiHGGpunyV1jvxwzgTDVcTN
 t/63qIO+KMUiGwxIe0/wN53dWo/GLQQR/j7nlKGGcN9G+hgIKKuJIKoYrQ3q
X-Gm-Gg: ASbGncudxxtC/KiSZVU6DLnEgY///CW4WaPcOlS0EOY/2FzZIYjBgUovvjMTVmqF1SN
 cYTVntTYPI0VqYBI4C1y/bxn8x56/VqaRD2htbQ3c0XZOaqELUPPh75Hu8gB/n0VUwlEaCnhufF
 Tii9y6tqty9v6OCeCpEu1cYtLGeTbdsQO7eUtFU6P55KC4QYR+a/XftN5H+ZeSuQGdWyLUjMp6N
 uvJyF1MDNkGBqkrleDh6Yin32RuOTJI4wK+YIXxsSxvRTZb1CKgHO6f1SbFCsqEeFhK9JjmBDzY
 myf5TscF6D/NHZBxJcUQ0nc4Ylb2wVa/DSdaqLbrKbDK
X-Google-Smtp-Source: AGHT+IEv2K23WEJaY7X697s8XLjjvqOJjnNQchCl32Td7cr81jg2JTBuMRW4FAVClm70epMHoDzyoA==
X-Received: by 2002:a05:6000:2ac:b0:391:13d6:c9f0 with SMTP id
 ffacd0b85a97d-396c3d20f2fmr455757f8f.47.1741887241201; 
 Thu, 13 Mar 2025 10:34:01 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:34:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 41/43] lib/vkms: Test changing enabled device encoders
Date: Thu, 13 Mar 2025 18:33:16 +0100
Message-ID: <20250313173318.5818-42-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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
2.48.1

