Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666DEC021B8
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99A10E7AA;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BEzj7KZM";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DF810E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso42243515e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897427; x=1740502227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBdW55YBSV+JBEWln6R9bmw+GlO/TgR+xpeb7FgAIQQ=;
 b=BEzj7KZMVVeMLZ8cUECbDwTaD2CIbHap4vfndm8wAllQwJqYSme1fC/hk4HQjaD/NK
 yBUoWuPQXPFuSEOKhLsBt2bHZ/9MRe5U4Hb86EGugFUoU8qwrvwgxWwOLU1ihwAmYX99
 RHm1SU3PswtBBUqjiZiBiBjQAP+ppRZUNw4hIEvVKtOHoc7+sweF4i6h7ys7dNiQgD5M
 OnxEgmWXC7rxbhdu9n9NI1Mfh7sCKLlazJSXODXMkUNOHCnM0eqnsgeplBsphR9HSrCS
 b7Z5JfW5pJHoDsZFLj/ubnMzTlYD+MQexUnQw5EyMsaN12iz8JYuRdEZYJwKRLBFqT0H
 +P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897427; x=1740502227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBdW55YBSV+JBEWln6R9bmw+GlO/TgR+xpeb7FgAIQQ=;
 b=mlwf3gprN39neyzf+Yq79bMpS18uOXhiIUQpclnUD4egjJ7blY5qqF3oVeIlqb9c6U
 gMJaKhHJctna8UqeRqjhbjbodxPMztH0i8bjerhbOLm/Adqa7nTlBl+oolwlE34hxKbe
 1ohyU2gryRPaJuchE4BxvgiHUaFo4wFQ4G1LfJMTpmewITw1hU5kVCYP+fcRE9ciIfAF
 QvDen3ZSD/YbQIgOfzLCsAN+DG+9U+eqOflaVjhQUorkoYvh4JmT3moEz6zAwZICoPvy
 Tj5ekx7tCcNfeY25q0YzvdT4v7iCT1qtuK1dVePC8YNJWHhinRQElYfmoYHhN/2rF+sC
 p9Zg==
X-Gm-Message-State: AOJu0YwXLKq6XC+yhvGD1qVehz8oRwPZ62RvftbyhcYlIUsVuofaddXl
 BwWMFQ2GV7TFXLLttDe9tqToyx0a79IJpNNmVjFystIGwcL/A449sJrYzYAf
X-Gm-Gg: ASbGncuvFuCwSGcdSFFztqMMW4PezvA4r0r1yAk9QfY1B/+PKN3QzPGgPcvIxiCDK3Y
 3SsxfxwO27blqtulQ5i8FPe3to9Z5DXPxoJQ6EqzRCWoR61DbUd84JpUN4wrDHy7Glixix1TKHf
 rz4IvmbL8eERQFV6nuPuDA6FlSJ9AgxlUxfkYh6Cgs9sofEgaGuJvjKvge2upBqz1d1LF0vC5+O
 JdcyEEzp8M82lbgR1PgkDBm83ozVzS2jm0BiaTQ9W7k4Hx+VHEfXlCUYhMAAp0HLC3JRndRl3g+
 cMWahQJum4+lbBXCWg==
X-Google-Smtp-Source: AGHT+IEQVdT/Ws+05kOi0y30M69TvLac8307c7ntOLVq80C5g7V6KrOfHtrLXfIT9nxVRt7VPmIxpA==
X-Received: by 2002:a05:600c:3b9c:b0:439:967b:46fc with SMTP id
 5b1f17b1804b1-43999d8f506mr3815735e9.8.1739897427387; 
 Tue, 18 Feb 2025 08:50:27 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:26 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 14/39] lib/vkms: Test connector default files
Date: Tue, 18 Feb 2025 17:49:46 +0100
Message-ID: <20250218165011.9123-15-jose.exposito89@gmail.com>
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

Add a helper to create a connector and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 ++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 299891377..e9475bba7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -428,3 +428,15 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
 }
+
+/**
+ * igt_vkms_device_add_connector:
+ * @dev: Device to add the connector to
+ * @name: Connector name
+ *
+ * Add a new connector to the VKMS device.
+ */
+void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index b4b048c6d..d065a2acb 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -40,4 +40,6 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
+void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 753ea2d85..f6b32a9f7 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -373,6 +373,38 @@ static void test_encoder_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-default-files
+ * Description: Test that creating a connector creates the default files and
+ *              directories.
+ */
+
+static void test_connector_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	const char *files[] = {
+		"status",
+	};
+
+	const char *dirs[] = {
+		"possible_encoders",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+
+	snprintf(path, sizeof(path), "%s/connectors/connector0", dev->path);
+	assert_default_files(path,
+			     files, ARRAY_SIZE(files),
+			     dirs, ARRAY_SIZE(dirs));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -389,6 +421,7 @@ igt_main
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "encoder-default-files", test_encoder_default_files },
+		{ "connector-default-files", test_connector_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

