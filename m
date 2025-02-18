Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD02C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF1E10E7A1;
	Wed, 19 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aiq6dqxn";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D29410E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f1e8efef5so3166042f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897426; x=1740502226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bK5W7tsiARuIDpGEiob9w8oqt7VHZxUt05J1uaLCOXk=;
 b=aiq6dqxnYjskCWxbKUhT39GIzBfU/SuKg8H+Zwz3fNP//TJWKrPmd0IHlbn4s8Cs6Q
 cEq+nWvxRrib/5TqIYx+uZxxVV7IOuApo2dVC34X+ExG0rw8fB3xSexDj4yFXOYrVN9u
 ZClpK82MzlMFojTIfPVWG5v24G6rzQGZa6DDNO+e2HL0yFjrmloR+rqiJ8HCTMiD9yXH
 p54shzV6vWjUY69OCkbIX/A08qbqx63g7iDpTA1ux3M08jS388mv85WWagslhftWTcSq
 oAgG++0M1/Meplgz3Fo2uZzjiEBgGlXUyQqMwITFyt41aJjlj/Cvlc+sVjCsC8vCqy/v
 I/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897426; x=1740502226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bK5W7tsiARuIDpGEiob9w8oqt7VHZxUt05J1uaLCOXk=;
 b=PR8Z9/83AU1zArzIkqrRb677nhtOs92rOSBuqyGYBtZ4Sf4f5xMRXQa5Cq6KSURInu
 Du3UDAOu2B0D3xAQLpvIyzaUJjpWUJgL+N7uRcm8cQ6MM1Ha8W/GGg98rxDmouSuW1qj
 U+1e91IFPmQr3lfqh6HAx5axU85/bGu/EQ/zh610L0i7omqwdBX5B49kUNjcbXDiN8DJ
 01tbYvv0bUU0vCigWK7zitjDuLJgoVwsZogLPojIvzP3XByqTmAC4kRADH1flYQ48PdP
 zXZgII5/Ee1z/LAzX3PHrxNeVwxCu9eepwCu+eI3HVqYUwpwILyFJH810NYKDBI0KQCS
 c7+A==
X-Gm-Message-State: AOJu0YzY7Dsw6ClPGYuaAI0JLj9FL3+l7INRDlfUZDihu/DDxo45zmjQ
 oVjCtfup4YZXym38nf3u4AMfxzqpstmGC6I90B8tYF37gUneEQdddY3dE4cc
X-Gm-Gg: ASbGncugqIFi2araEh+8PuK8Rl+Z/fMNz1msjxQgSPqL+FEv9fB7fCr0jnGO3RUm3ZT
 iJnvUCuSTQDsYoo2L5SyITtjxNi/UMD8UGgtbufXlSKplLiiI2cW+iONiPHv2YO0x+I4MRTgdug
 Uno26p8BXCNxIq2M++CBF5qBnd6W4W6+FPdUCMz+UUM2DGttyHZqZ/8h9iD5CaZr8LU6j+w8wNm
 /jH7pAwkp7C2jmKwph7CheMDJUciygEjHJsttMQZnxPSJODNklOlJeFVfLiVQfSTppBXyEbfEEE
 iWnC4zlOzOHjqQc42A==
X-Google-Smtp-Source: AGHT+IGxLp7hVos6fXNxTmy0DY+1RTnW8fyDGBxhsvMZkoDW/YeLRBwHxeV1xBwIeVivzs1xvpMWFA==
X-Received: by 2002:a05:6000:eca:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38f33f357cemr12192672f8f.33.1739897426335; 
 Tue, 18 Feb 2025 08:50:26 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:25 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 13/39] lib/vkms: Test encoder default files
Date: Tue, 18 Feb 2025 17:49:45 +0100
Message-ID: <20250218165011.9123-14-jose.exposito89@gmail.com>
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

Add a helper to create a encoder and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 ++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index d881a2417..299891377 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -416,3 +416,15 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
 	write_bool(path, writeback);
 }
+
+/**
+ * igt_vkms_device_add_encoder:
+ * @dev: Device to add the encoder to
+ * @name: Encoder name
+ *
+ * Add a new encoder to the VKMS device.
+ */
+void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_ENCODER, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index cb0278544..b4b048c6d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -38,4 +38,6 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
 
+void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index af42e364d..753ea2d85 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -345,6 +345,34 @@ static void test_crtc_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: encoder-default-files
+ * Description: Test that creating a encoder creates the default files and
+ *              directories.
+ */
+
+static void test_encoder_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	const char *dirs[] = {
+		"possible_crtcs",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_encoder(dev, "encoder0");
+
+	snprintf(path, sizeof(path), "%s/encoders/encoder0", dev->path);
+	assert_default_files(path,
+			     NULL, 0,
+			     dirs, ARRAY_SIZE(dirs));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -360,6 +388,7 @@ igt_main
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
+		{ "encoder-default-files", test_encoder_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

