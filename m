Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FC2C87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB98E10E80A;
	Thu,  7 Aug 2025 07:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZFktMdXh";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3373810E808
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so4041355e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552804; x=1755157604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqJBzeNjaAUHyXcGZsnXaMonbxjIdXIgTGvXmT/msNE=;
 b=ZFktMdXhdPI6dXoaDdkxH4lLVXu1/qTZpmfyL0Si609oSqixHTYtPfxRC+71I/pAFx
 r36bKYPvbLDOQYM3pfhaLBupInGwrPtD9vkgKNg49ZF1BBUejqwmswsWc1R6icDBsty2
 68Dfk+xpDpMntZGyzm8RuV4abmQ6p71KR5sIEObmmfsqzKiCdGi/PaJxORZ02VIpW95g
 0C+CSdS1O3oGpyJSoz9G8r14BzXDCzkIUFCCzfhrXb3QOZE8AdoSbCUx5TdWKyqR1n1i
 3kyzxyQEaIoNgj3RMSUiVnUWIrzQ5wFlGl77wfiySDEVJUxWXQlanar2lBzoWF9uGLUR
 mzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552804; x=1755157604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqJBzeNjaAUHyXcGZsnXaMonbxjIdXIgTGvXmT/msNE=;
 b=WbF+uH13TdE72w3FDVVMNBEKTdqDvbtcOKLBLCjHk6hTXSxtL5QWK9VDXDXvfLWo47
 PLiTh3uOQzkTvpw+0lp2srM0eH6K3YpgjRZpcaiIqgSgCy5KMf2D1hUYk2iBtd0dyp0c
 lyPTQ5+QhSaeJbBd9w/GyOfBj3G8LuvU7r76vawneEZBXBblJ5P4TalU6KZUh6vERcQf
 b38JgnxP6SH5jlwWyeayaEDQ41+O03v662l8Ckil2bSh4rLQ3PyvAMYyxa2jTcuxhsXF
 qYTLt4ozjRcHtrd4qSPC3hpBmMZMQ75kvBg0akOWiohx6OUkI38CYQ40R8Q6v8Qka1S0
 949g==
X-Gm-Message-State: AOJu0YwUhw+2T7e/cVFohygV4dA/IgATL2Oan8seGcP2vbQH+PaCHwLy
 oS/dnZ66UdRiy5tcMQ517NLZdpHSRCGz/VLK4kXc0bm1vY+Rd410RkE8C1w/2ORA
X-Gm-Gg: ASbGncs5zj/1TiGssmqLslfQxoqy31jdDaN+YXhQDTrngE5Ybv+GxW0GcORO45TgwLA
 jAo/f8vIJHHCItbh+HAoPXlZREDGKLklQt1vD5f+nkWhz2l7O3KJIZLfDrtOcyXDymOBI9jIXeW
 of21NMAc7bQGURXbZnpWUIeYnao1OazljHP2dnbmvjkqZJdjTHJA0SOgLCjWYyO9Ewgwxt937L+
 Mil27Hmj7QzQzEl8/9w14HuYNZRY1ngpJY2MMaPmZRm11dqpNeoeuhJxVJUpWtdAp1q6/1mN1E9
 37S0a5dRZ0mfuDY1VwAM/8i4yPJKVL5pL/LI5S6qNuAZcZO+JHfBpHGG9/G+qnpf4dcGIq5xK4G
 2gtZPeSqrBa9AFjp2CtM=
X-Google-Smtp-Source: AGHT+IGQpf8Ea8svaoVWoTmBDGscge8x3mOiFI2UM6K1FRGoF69ZX9IQi6gE+HgaTIy96XfAzzAvBw==
X-Received: by 2002:a05:600c:4f06:b0:459:d451:3364 with SMTP id
 5b1f17b1804b1-459eb99cf40mr30026595e9.24.1754552804218; 
 Thu, 07 Aug 2025 00:46:44 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 40/41] lib/vkms: Test changing enabled device
 connectors
Date: Thu,  7 Aug 2025 09:45:49 +0200
Message-ID: <20250807074550.6543-41-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the connector values, with
the exception of status, can't change and that deleting it or the
attached encoders doesn't change the VKMS device.

Connector hot-plug/unplug is not covered by this test.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 64 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index e37d92b78..97f988405 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -916,6 +916,18 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
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
index cc03f9ef3..4761c7dcb 100644
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
index 194624c17..0f498a630 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1749,6 +1749,69 @@ static void test_enabled_encoder_cannot_change(void)
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
@@ -1792,6 +1855,7 @@ igt_main
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
+		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.1

