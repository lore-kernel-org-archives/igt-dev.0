Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8825FC021B2
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F4810E7BB;
	Wed, 19 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d3WdDY+s";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4748710E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso35782585e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897450; x=1740502250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EAizPDnT70cuQQz6KHc8xd9Efd8vSTUzezK5/5p3pQ=;
 b=d3WdDY+sPaiDXCo34wdxf6pbv73WFivqkS0DGWr9UfzRvSfhGtf8OHsWcMFOxick6/
 PW6hu+kUVLNYJlUbDkWyAvGUftDuD52AUXNas1JBSAHww52M7zFefEVTh//ciraAPa27
 h/g58zAQ+F37gGBkZdScTcsQq2Flz2vFqCqTpWLYG9rOpWP7v0iBYu9Dts1rBVXUke73
 Lp3SC0dgcbD166PtryRvDCASmIMMPO4iDcDtVGa8ztsg+pxzA7Jet2eTcvmPupGSWos+
 8lsM9qbGeAzXfXSoAGEh+/zFNdPe9wZrBSh7Xk8IYBbCCkDUJGsAidWjBZq2uKmCVvQg
 V0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897450; x=1740502250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1EAizPDnT70cuQQz6KHc8xd9Efd8vSTUzezK5/5p3pQ=;
 b=SHu8BpfZ4d+I6fVpzrQBWFnoceKx44LKmcmrp2VuVxjrkoS/6+DuP5HzPZvXwLH82Z
 o5kB9sIdmbl2yE44j6vPxElPi7L3UcG96YuCjwoZ/Gq4zE+YCRCHQnmN0iXwiRy1GtgF
 u7PxlmZDG4gwnOQ4mpaPs45fzmiQUPBPQsgTJptDPimlNo+neJr4Pd1DtJfIODpRc9oI
 VvTyxEUwtXIeb1sJ3haGBrPY9ddV86exY6P6z1zaVV4+yLb2HcNDV2PMNF3l6847rTbG
 hcJpd/DM1nCCM76doAPGeGsZepJ+6YAu+srZP75UdTQOrJuIadGX784iArFSNWUd6eFI
 bbDw==
X-Gm-Message-State: AOJu0Yx9zRss2q7ZhSdt4CUZ5EFqCvqPdB1W66YjHbZQVu39emIIrxMs
 lRNzr3IgHhwFQmrr5fyRfGF+AZHNAgKz7CioXzpgBrLhaTxOA1eUsfB6dkpG
X-Gm-Gg: ASbGnctIT5q20P982oUG358afajT2NmKTzrDNGUyp7EcSoHHDOL7QPbkucLFj7rRLLb
 FD6g83YPImhROpjfBvLkmCKkn0tcCDCP3Jid8SAIx2nPwGelOP2nexBGdkPnYsxZgM3Qr6xEKVy
 kL9SiZMSCbf3ezqBkM7nfkjaQKbjSQuOVD2D1A3DR7Toyzc8EVn1rL7i7EWshFdQ031epxH1tAU
 4O+wRPw46HA7qpBdO5CXhvUeo+ZwkfOwy+Zc/KKjiwB6UdPPfffYiGrfa7oIpz9+ItcdJnMFXTU
 LP8OVeNiCHVsScojGg==
X-Google-Smtp-Source: AGHT+IGQ+czyT8Ju9KX5G7hCKu3gUwQm7HqLT3jWdrrJjQQ2jrq6tQcHnR7CxTH+LWcNrccLtI9pWg==
X-Received: by 2002:a05:600c:3501:b0:439:955d:7ad9 with SMTP id
 5b1f17b1804b1-43999da89c7mr4437235e9.14.1739897450189; 
 Tue, 18 Feb 2025 08:50:50 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:49 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 38/39] lib/vkms: Test changing enabled device connectors
Date: Tue, 18 Feb 2025 17:50:10 +0100
Message-ID: <20250218165011.9123-39-jose.exposito89@gmail.com>
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
index 95fbf5773..af9197b23 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -703,6 +703,18 @@ void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
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
index b82282a11..f2233b91a 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -95,6 +95,7 @@ bool igt_vkms_encoder_detach_crtc(igt_vkms_t *dev, const char *encoder_name,
 				  const char *crtc_name);
 
 void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_connector(igt_vkms_t *dev, const char *name);
 int igt_vkms_connector_get_status(igt_vkms_t *dev, const char *name);
 void igt_vkms_connector_set_status(igt_vkms_t *dev, const char *name,
 				   int status);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index be311e77e..47a6a81ff 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1675,6 +1675,69 @@ static void test_enabled_encoder_cannot_change(void)
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
@@ -1715,6 +1778,7 @@ igt_main
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
 		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 		{ "enabled-encoder-cannot-change", test_enabled_encoder_cannot_change },
+		{ "enabled-connector-cannot-change", test_enabled_connector_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

