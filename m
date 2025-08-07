Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B6CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17A710E7FE;
	Thu,  7 Aug 2025 07:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efrSviEb";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C510E7FE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so468714f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552769; x=1755157569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryrWkHPrZKs9iXaQ0omK9StJd4qg4+hXCc2y+ZdfjUc=;
 b=efrSviEb4s9qczQRgTgEzYIuJvsRnm+QB3MsYhdNCfYJ4QaYDWW8eEBX+NIZJ8wJYe
 oRGcnjldWs7KC+7TTV4zgd+xRmviPNunai9lpw0tuDxqwcAbZJ7lmo7pE1t7psatNJOq
 X+/uyjGblVlKjirwr411vDNfPshBwxKJOQqUhbdwuQbyhjI2qNcKmof79OSK2m2lwgkM
 ajuI4UA+RAxTs5SAuLzA+jkNe/iOwjImGi3nSAqfLYmGg0BR4f+4KOUrprkVzpySXelX
 G48yTOKo//hXG2MIkENKlCFks4GJ+CC5OsFJRjhy7L5efVk1tGzDgH4clW8XiktXSLSN
 t4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552769; x=1755157569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryrWkHPrZKs9iXaQ0omK9StJd4qg4+hXCc2y+ZdfjUc=;
 b=oXgM0upVEGt3Tgsa+ph5uO/pr4VdoTJAlA4+y0IzJkHUPhSOF1CZ32nUggq2yAdvD6
 n6fT1wQgLhcNULs7dNEAymJT5YXVZURTb+bHRWSD+HlPaEqRBZGh9rIXxKGHIQ2qiIIR
 LgD68S4UIrZmNFcz8APYawC9GR5CEJeLHjNTosCVIbhvcCynGl5kvMS2HHg1TVhJss0g
 tscy0DNWeRjSKysBrkpTr5cGVTI6hrnJBJMmg5fJ19M8s3NYsdXGKVLQI786psAMRTug
 rrj6mSToVvIv0iaOHZmwZnJ4YbQqI+ORO5sWJJGCoCXjnIk1JiLcqW+rOxoJ0STIiRIU
 ZywQ==
X-Gm-Message-State: AOJu0YxNrJ8I0WUxaM5LnCPwmeC7ZPfQK+/XkyKu98Jnoh2QRikR0rtP
 dvL4A5CapgaEhcINcYK1d3mLXgkHhhYBCo6rdxfiybart4V2KixfCv4RXybDcDFE
X-Gm-Gg: ASbGnctZb+JA+mM4b6OcGX64HSZxYrYirtYE7e8OgspWHsY13arqAxiA0thg1c8Y5rj
 chsW5CtPibgMtDUhAclnINfCHVxEDoNeLUwqknCWtoWthWQuNlbKgiaHeromYbntZb7lr0SzbGW
 UetYU2VXPU5nhu2YZHxpZAaRHmzrfzzGZtr8AuAqrX+pHuTBI8xu7jHh+mm7L3wcyGDRqXhb85T
 5J5wBdfJGy0GDZ0HIVPPsn4s3kP5qCOlvKSVgr7a+0+YBZYPw+uj+Tlzhc1dkqHjQHtgRoH9pgx
 uwYOcZBJGtdPoFI0qKxIfinR5tO/mtYGxRaxfpEJDdhj3zVVVpkFN3NUdRGqNLdqrDRmGh9AnMg
 w2OlzwfIIeO8d/+3AEpc=
X-Google-Smtp-Source: AGHT+IG6MJZljvp/twfLeyUJI+HJxy5hdu/ldgM2gBJEI4lse0PRFGDQIXXkON6uf0rygOR8MW7KJg==
X-Received: by 2002:a05:6000:438a:b0:3b7:925b:571d with SMTP id
 ffacd0b85a97d-3b8f48f9c7cmr4496605f8f.26.1754552769243; 
 Thu, 07 Aug 2025 00:46:09 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:08 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 05/41] lib/vkms: Test plane default files
Date: Thu,  7 Aug 2025 09:45:14 +0200
Message-ID: <20250807074550.6543-6-jose.exposito89@gmail.com>
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

Add a helper to create a plane and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 76 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 7d3575ca0..7c789ea0d 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -23,6 +23,13 @@
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
 
+enum vkms_pipeline_item {
+	VKMS_PIPELINE_ITEM_PLANE,
+	VKMS_PIPELINE_ITEM_CRTC,
+	VKMS_PIPELINE_ITEM_ENCODER,
+	VKMS_PIPELINE_ITEM_CONNECTOR,
+};
+
 /**
  * SECTION:igt_vkms
  * @short_description: Helpers to create and configure VKMS devices
@@ -96,6 +103,48 @@ static void write_bool(const char *path, bool value)
 	write_int(path, value ? 1 : 0);
 }
 
+static const char *get_pipeline_item_dir_name(enum vkms_pipeline_item item)
+{
+	switch (item) {
+	case VKMS_PIPELINE_ITEM_PLANE:
+		return "planes";
+	case VKMS_PIPELINE_ITEM_CRTC:
+		return "crtcs";
+	case VKMS_PIPELINE_ITEM_ENCODER:
+		return "encoders";
+	case VKMS_PIPELINE_ITEM_CONNECTOR:
+		return "connectors";
+	}
+
+	igt_assert(!"Cannot be reached: Unknown VKMS pipeline item type");
+}
+
+static void get_pipeline_item_path(igt_vkms_t *dev,
+				   enum vkms_pipeline_item item,
+				   const char *name, char *path, size_t len)
+{
+	const char *item_dir_name;
+	int ret;
+
+	item_dir_name = get_pipeline_item_dir_name(item);
+	ret = snprintf(path, len, "%s/%s/%s", dev->path, item_dir_name, name);
+	igt_assert(ret >= 0 && ret < len);
+}
+
+static void add_pipeline_item(igt_vkms_t *dev, enum vkms_pipeline_item item,
+			      const char *name)
+{
+	char path[PATH_MAX];
+	int ret;
+
+	get_pipeline_item_path(dev, item, name, path, sizeof(path));
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret == 0,
+		     "Unable to mkdir directory '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
 /**
  * igt_require_vkms_configfs:
  *
@@ -130,6 +179,21 @@ void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
 	igt_assert(ret >= 0 && ret < len);
 }
 
+/**
+ * igt_vkms_get_plane_path:
+ * @dev: Device containing the plane
+ * @name: Plane name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane path.
+ */
+void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
+			     size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_PLANE, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -302,3 +366,15 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
 
 	write_bool(path, enabled);
 }
+
+/**
+ * igt_vkms_device_add_plane:
+ * @dev: Device to add the plane to
+ * @name: Plane name
+ *
+ * Add a new plane to the VKMS device.
+ */
+void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_PLANE, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 8b3595b00..3bda3196d 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -23,6 +23,8 @@ typedef struct igt_vkms {
 void igt_require_vkms_configfs(void);
 
 void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
+void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
+			     size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -31,4 +33,6 @@ void igt_vkms_destroy_all_devices(void);
 bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
 void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
 
+void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index d38791ccf..fa429d28f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -178,6 +178,38 @@ static void test_device_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: plane-default-files
+ * Description: Test that creating a plane creates the default files and
+ *              directories.
+ */
+
+static void test_plane_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	static const char *files[] = {
+		"type",
+	};
+
+	static const char *dirs[] = {
+		"possible_crtcs",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_plane(dev, "plane0");
+	igt_vkms_get_plane_path(dev, "plane0", path, sizeof(path));
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
@@ -187,6 +219,7 @@ igt_main
 		{ "device-default-files", test_device_default_files },
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
+		{ "plane-default-files", test_plane_default_files },
 	};
 
 	igt_fixture {
-- 
2.50.1

