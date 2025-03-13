Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C9C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3ADB10E905;
	Thu, 13 Mar 2025 17:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WFkjQhY3";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258DE10E900
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so1066211f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887242; x=1742492042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZeNvHTPM4ZjhNmBIHaTnWDaZjkShOop3XfPmTjQTqM=;
 b=WFkjQhY3+eehKYcF9sAV2OM7fllNpFcq4aCeVcRkaoTyO8k6syCdfJvGCt6mMNDSBL
 dD7h3w09a0Ix37mAEp8kcccrNotfVfxC3FZ8o+pOmavWXh77lpWT5elxAKoAbXdJxaBl
 pCvS20pUCF3Fi0ZWvLpBSObENePqfcgzX2/Oy2FBP1Rf7rqLTRK5LD1DkVy2UA/cAa+m
 4TQXSjJFpr5hUPffO5Z/XPIxCizT3Nkoj6yAG2pw37V79gextjZhF6A52YV+/bAuP9Fb
 mQoiCZUt1aG7ZC9XyTMbZcVJaBUB83YGh/mfHVbR53EF0KT83dCb9q7FqSpa8Z0jDUK1
 DyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887242; x=1742492042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZeNvHTPM4ZjhNmBIHaTnWDaZjkShOop3XfPmTjQTqM=;
 b=c76bs7a7ZugIh4xOFMKH+057GKbJA3eyFlAO9irPLJbQt5zjN9S0gU64FTXnQzqJcI
 gIElnQrV1wjYzFv7rAJk/7BdOcMx8Z6bb6ITftbJMiZZNPB5FyiKeVSSZSxc7CVUoQM3
 athNSXoLiTuNReKL5Ty0AsAnzppqIFIotBhads/At45EJUrSaCieNN3t8RAIGjkDGZdK
 dwsR7O7s1iR0Or/moAL03/s6hPOcEx/MBwF3FN1zrnP3a7NlSxmeY2MTP9YO3+46Z4lm
 A9m6M1Yriso0iL8fwggXh/exflYvF7URPHHpr772OsE7YFiNDJNCWHyLDff0wtdzMiGz
 bgzA==
X-Gm-Message-State: AOJu0YwWbZpGXtDPHOu4/dVKurcO5vjXz9e88y/pHXVHHlybjXOck/lV
 B7Catml6XyF/gRI98ytU8jhG3RKyWfPRXkfm6Z162gdj40xSnkcy1OI+G22I
X-Gm-Gg: ASbGncvNW8iG7wFiyM8utb0ldKRM0mWBES59w03TYwHxuXOKNf8+nJciLtiEg7LXjgV
 0bjUQKHOpikovukGfRqVNBQI0IH+h6lT5Hq4IaP230bA3U5jdsSCiALYh/loLtEufXm0LEtn6hU
 zEulhLgScGWv32yuPxOG35pY2K4Jz0wp0eJBXViIUHf8rSXviouUY5FYfg+E29P53ALhBRf4hNk
 HPCiMWnfdoD4E81B3/wrG11UxDp+u0dMmZXJ6Sk1FkhV11G688X6n01LkD4mmyDbRnvfKvOSbOh
 BZFI499PJEMBka3YzmTV5BR+oDbbW2vB/Xf3wAK8s4c7
X-Google-Smtp-Source: AGHT+IFrgG0xLpUK3+NmFwMtm3KBxxbxAjuOXcaLhJ8El3J+TWofOQTxHgXmRJmxHsW3zEquPeOtTw==
X-Received: by 2002:a05:6000:1fa6:b0:390:d990:823 with SMTP id
 ffacd0b85a97d-396c1c26290mr509889f8f.13.1741887242168; 
 Thu, 13 Mar 2025 10:34:02 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:34:01 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 42/43] lib/vkms: Test changing enabled device
 connectors
Date: Thu, 13 Mar 2025 18:33:17 +0100
Message-ID: <20250313173318.5818-43-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connector values, with
the exception of status, can't change and that deleting it or the
attached encoders doesn't change the VKMS device.

Connector hot-plug/unplug is not covered by this test.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 64 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index c42b96b11..5133a44a7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -917,6 +917,18 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
 }
 
+/**
+ * igt_vkms_device_remove_connector:
+ * @dev: Device to remove the connector from
+ * @name: Connector name
+ *
+ * Remove an existing connector from the VKMS device.
+ */
+bool igt_vkms_device_remove_connector(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
+}
+
 /**
  * igt_vkms_connector_get_status:
  * @dev: Device the connector belongs to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 3081addad..787da601b 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -118,6 +118,7 @@ bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 				   int status);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 747b057fe..71f2f9694 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1750,6 +1750,69 @@ static void test_enabled_encoder_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-connector-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the connector values,
+ *              with the exception of status, can't change and that deleting it
+ *              or the attached encoders doesn't change the VKMS device.
+ *              Connector hot-plug/unplug is not covered by this test.
+ */
+
+static void test_enabled_connector_cannot_change(void)
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
+				.status = DRM_MODE_CONNECTED,
+				.possible_encoders = { "encoder0" },
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
+	igt_assert(!igt_vkms_connector_attach_encoder(dev, "connector0",
+						      "encoder1"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_connector_detach_encoder(dev, "connector0",
+						     "encoder0"));
+	igt_assert(igt_vkms_device_remove_connector(dev, "connector0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1793,6 +1856,7 @@ igt_main
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
+		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

