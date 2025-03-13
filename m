Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A9C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868B810E917;
	Thu, 13 Mar 2025 17:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R8NtwDNT";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707BD10E913
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so804251f8f.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887218; x=1742492018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMlLesKdgHPX3ntOyBd7LSD2We9tMrT3ERoNilK4/Y8=;
 b=R8NtwDNTXCKLSdkt6VSZ0pFobi/AunQTzDBDSdAXBriDbymGpfLEEruyM62eZIr/NY
 O97aLlzm/2g2/YUKbEm9ZZ7VixYgi0qKv3gakQMxpIAD8F8n9XjJIUFQNY4lgEqMc1JD
 VpE1qcqmYQ4XFrZjvHjRk/XcZh0joAbkBezF8WGQ32K05meU2N4YlB64t/xX8yoG3jQn
 f0ILNrOnDVzKHLw92RwKPQokMd8LE04RRYlcKjyxv9w+cH2RccAA5tE46+RJTfWjCVrJ
 pJlkRY1ysvOCajGZMvDYgD7kmkW1fD0bR5+9VU6DLvFSuGvIRfK4kBM67xuPxik4VGw0
 IYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887218; x=1742492018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMlLesKdgHPX3ntOyBd7LSD2We9tMrT3ERoNilK4/Y8=;
 b=ON9UlbiWQzFZGzD3BhF2Vj47tH7KTVycTMbExsdYFFoKUw7ZnA9PIdcyUsXL0f6sbh
 3nbptexXhBZInyOq4OsWvvGV+0oKU8us5+8ecacD9tEcSaG4L4IE40EQdFqRIStI8Cu9
 IZgRW+5/lYBwbEOiBMlLQCsrDXBXxbu8cLoFOeQQR+EWFP8H96JdNkGd5t/TiF1MwzTO
 dV5eeI4kJMfIYQbrBID71uCraLhaaccTSsk7rAPS/zjVUYg7qMWPVxNcgTPFWXWi2sed
 LJCSC1jfzhH2RggrLGpfZ02yGq121kDxyWvfUAYYhtaUhnoNXC0lDBCp4UJ4iSuNPDBk
 g2kw==
X-Gm-Message-State: AOJu0Yz3PEhdSM7Wp4ysEYN2fylzavsJIAWSClfIWBbjXDiuB3sIirlb
 fp7iBn8C37WyDnbhsXw+hzx/bdDKCdoGriuifQ1Cyzw06Shpho8bf9E5X5qK
X-Gm-Gg: ASbGncuo0RlVcxQsiBgkszokOaSPYwKpXsdvH34EyNzf40XIl9iNp4AQK8BKwjgL2Da
 Xhe96xpwOeaLbQR9NC7EsDx281yAAZrlVxn9OkhyQnTkuRc8Rxm2GeSPEltXlDCjy3U/Zbdqezy
 EuNFWluaujAQCAvmlNtRpZzl33mYcNKlvHLmJfRympdCkbpO3voYW43fY4flcJLcf3UhXvExTwc
 x5eIiu/YR8tBRDo8E4V/MHvjM0zHGkufRAi0Df9jAhCD7V5cgIN7twa+1v6AmTBRXZVSuZYosGM
 WkGDCXyVG44fHvAc6jTWQzId2PaGOW+08At0aOds8/0c
X-Google-Smtp-Source: AGHT+IFO7GfvAVtIgm2fZilWzzBCG9DgZxJcave3oef20eSN6oegJlwq+sWvVhNWsCPl7HL3ZmSSaA==
X-Received: by 2002:a05:6000:178a:b0:391:31c8:ba58 with SMTP id
 ffacd0b85a97d-396c1471af7mr531184f8f.10.1741887218077; 
 Thu, 13 Mar 2025 10:33:38 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 16/43] lib/vkms: Test connector default files
Date: Thu, 13 Mar 2025 18:32:51 +0100
Message-ID: <20250313173318.5818-17-jose.exposito89@gmail.com>
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

Add a helper to create a connector and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index ed28adf9b..eecad1977 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -273,6 +273,21 @@ void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_ENCODER, name, path, len);
 }
 
+/**
+ * igt_vkms_get_connector_path:
+ * @dev: Device containing the connector
+ * @name: Connector name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the connector path.
+ */
+void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
+				 size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CONNECTOR, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -554,3 +569,15 @@ void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name)
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
index aa6ff513d..6dd576b41 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -33,6 +33,8 @@ void igt_vkms_get_crtc_writeback_path(igt_vkms_t *dev, const char *name,
 				      char *path, size_t len);
 void igt_vkms_get_encoder_path(igt_vkms_t *dev, const char *name, char *path,
 			       size_t len);
+void igt_vkms_get_connector_path(igt_vkms_t *dev, const char *name, char *path,
+				 size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -52,4 +54,6 @@ void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 
 void igt_vkms_device_add_encoder(igt_vkms_t *dev, const char *name);
 
+void igt_vkms_device_add_connector(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8939ef611..595d258f6 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -434,6 +434,38 @@ static void test_encoder_default_files(void)
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
+	igt_vkms_get_connector_path(dev, "connector0", path, sizeof(path));
+
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
@@ -452,6 +484,7 @@ igt_main
 		{ "crtc-wrong-values", test_crtc_wrong_values },
 		{ "crtc-valid-values", test_crtc_valid_values },
 		{ "encoder-default-files", test_encoder_default_files },
+		{ "connector-default-files", test_connector_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

