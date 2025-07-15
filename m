Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F537C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D2810E593;
	Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmuLQIkJ";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03E110E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso3005104f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575127; x=1753179927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AuIlvAPBosLRJEcZI1vtL85+aksnZqCF/WpNFL0z4RE=;
 b=SmuLQIkJYQn3QQRlCi1FS+0NkodEI7efyksoD1qVRJaeTdYUw7F5wHlqfXriCGcVAH
 V3tCOyXoibO94FvMl9hjNth0XiFQW6hXKGtkR8FZC61ANyzt1wmnz8fW0OBC/otusyOm
 Wu4ry8tpDM++au9EQOlM6YDgRie26fj695Q8Tegz04BU6QE3yH8km1PVeBRBu4I/2EVx
 42o4bJUc90B0fOSEkUyI/62OaAs4F/jvzjSDTG7ykcn+/voUwF6Y52Q9L/s7E+5exVSp
 E1o/Y6XZDlqYuMbdZxHwheb/RcSnlZAHppAciqKjZJyRq6nUzA7q/RTiyVbeX0R0E8a2
 LXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575127; x=1753179927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AuIlvAPBosLRJEcZI1vtL85+aksnZqCF/WpNFL0z4RE=;
 b=rTD4xD9TBdCZHewoTsdAuAd6M8thqiqlm08cLrtwwvn/tR9h1GxjFjkM4xYzkBzcIl
 e5CLDxbm2XKgcZUzGy2R99+FFXZPk9FPRB1nluipSkYOjo6l5a9w8Hm1GeQ7wiMZ40+o
 Pj6tsEjL2erGx4/JFX4NIC7LU/1LnlGTfz0TAplaaM1iPZOcFUlpGBJiyKU1nkWcdsGL
 VJkbS7gOBrxpYSfu6HOkvoYa3cZYOZCLX0CA8NYJQzYDCCH+p9k7kcPrDzjaprZGFxbR
 vFIvg6dRdqgB82XE2nlFWu+Otyopwj4zg31W6MPNcfZI9CsZIAvi4fGpGys+tTJpE3++
 0FTA==
X-Gm-Message-State: AOJu0Yw9aGi+4s68vImD3+7VXEllnr6t4Ro3ojSvXXdzUJIQx0bTr9CK
 HJDN6Be3A9hoKntuYCCgmzHTtYU8RwrkMkGJjJn8SfQFlWiorRpArMNij4Ni0Q==
X-Gm-Gg: ASbGncu4X1WEXkutlX7DlwHHh5BqYYKmIDbGbtaH/GN7UCNPEllvqWsWTPmpBV0uJQo
 qlbxr1E/+zmoxzd9U3EQDgsW5CgpSscBOly6uONVexmg4z3eE8sswo6nopjfzWRmrMheJrLn/wz
 2bPTWriezEa7D6pUzvsn0qxvL18X1SdqgxQrHGt+Dof6OZ8k56f7ESVjl6sbAEuWrY5dGGd6y94
 i7dU+jgdD9ZgjApUeQQaus6LBiQWlwyM2r6FuRX7qzKCtBIkYam/9+DaRgLMhWYmbiWkVF55UwO
 CzGs90iYM1o8mBYMvMxtmOWCbWvbrLNCcGMR85xd8L0yFTxSLton8C09Nl3+kFLl/FzjPQn2wZ8
 +M+Y6Bq4c43ywQBR1vw==
X-Google-Smtp-Source: AGHT+IHYgFsN850EWxcuWCxqWtvF7vyru/GDS39CcfpW7QG9jEVaOrZqQPSYF4x8WFEnbSD8u3wPHw==
X-Received: by 2002:a5d:6f01:0:b0:3b6:463:d85d with SMTP id
 ffacd0b85a97d-3b60463d8eemr5842223f8f.11.1752575126777; 
 Tue, 15 Jul 2025 03:25:26 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:26 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 06/41] lib/vkms: Test plane default values
Date: Tue, 15 Jul 2025 12:24:38 +0200
Message-ID: <20250715102513.5636-7-jose.exposito89@gmail.com>
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

Add a helper to get the plane type and test that the default type is set
when a new plane is created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 47 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  3 +++
 tests/vkms/vkms_configfs.c | 21 +++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 1f90e1569..6cc9b8afb 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -23,6 +23,7 @@
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
+#define VKMS_FILE_PLANE_TYPE		"type"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -132,6 +133,20 @@ static void get_pipeline_item_path(igt_vkms_t *dev,
 	igt_assert(ret >= 0 && ret < len);
 }
 
+static void get_pipeline_item_file_path(igt_vkms_t *dev,
+					enum vkms_pipeline_item item,
+					const char *name, const char *filename,
+					char *path, size_t len)
+{
+	char item_path[PATH_MAX];
+	int ret;
+
+	get_pipeline_item_path(dev, item, name, item_path, sizeof(item_path));
+
+	ret = snprintf(path, len, "%s/%s", item_path, filename);
+	igt_assert(ret >= 0 && ret < len);
+}
+
 static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
 			      const char *name)
 {
@@ -195,6 +210,22 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
 }
 
+/**
+ * igt_vkms_get_plane_type_path:
+ * @dev: Device containing the plane
+ * @name: Plane name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane "type" file path.
+ */
+void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
+				  size_t len)
+{
+	get_pipeline_item_file_path(dev, VKMS_PIPELINE_ITEM_PLANE, name,
+				    VKMS_FILE_PLANE_TYPE, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -379,3 +410,19 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
 {
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
 }
+
+/**
+ * igt_vkms_plane_get_type:
+ * @dev: Device the plane belongs to
+ * @name: Plane name
+ *
+ * Return the plane type.
+ */
+int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_plane_type_path(dev, name, path, sizeof(path));
+
+	return read_int(path);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 9062cc42f..cea0c7242 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -25,6 +25,8 @@ void igt_require_vkms_configfs(void);
 void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
 void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 			     size_t len);
+void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
+				  size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -34,5 +36,6 @@ bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
 void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1ac85d8f9..5aafe39ae 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -211,6 +211,26 @@ static void test_plane_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-default-values
+ * Description: Check that the default values for the plane are correct.
+ */
+
+static void test_plane_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+
+	igt_assert_eq(igt_vkms_plane_get_type(dev, "plane0"),
+		      DRM_PLANE_TYPE_OVERLAY);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -221,6 +241,7 @@ igt_main
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
+		{ "plane-default-values", test_plane_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

