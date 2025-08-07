Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48528C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CB310E7FF;
	Thu,  7 Aug 2025 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Im2cFkzY";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D2210E7FF
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so4261915e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552771; x=1755157571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Rtqu7Kcp/ZNJnLlvRvh2wYSXZt5E9iJfZo1yaEYV/M=;
 b=Im2cFkzY6URILrqeU2UjkRdUPO0TKqUq2BKPIffQ56jiW1PDjYHh+sK1ZnxC6JDZwQ
 5rVqwTjMFzZG/dWwxMs9nD7d1gaeJREqZXxdjnzzHJB/BsN5O0jlQzzcfCxK15UfLSD5
 traZJTEr7KtzpEW6Kve+6g2P2frByttLGeEhprNORAQPiFcZbaCyuOEdN97RO7Fkmu3X
 oIrIe2FAAbpDsb+H8QrE0nxfMS2S662c6ITAF1aG8zOdtlJIssXlTiaBK4QS+zWsGnnh
 dBDDDUhzxWyV7Gt51uNBk3S+tSmZDZhv6DFH1imDJW2ETcgTHrCpIONag9p/9w+S0kFP
 eVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552771; x=1755157571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Rtqu7Kcp/ZNJnLlvRvh2wYSXZt5E9iJfZo1yaEYV/M=;
 b=d9ngVYClESbLfbc644QZu4L+ANIjnTfXAqgj7ATxxDn6yTT6fv/wmjKnRIm68te9rj
 BE9B5VtTkZJTw+H3++zDmJNFWVe0IxK0ZfRVGphLz7QUGQCXtlh/iUDDsWEP61n0NYM7
 Eig3PVA8V/l3NFiqYdwaoAO4gzeIUC2A6oHrqe6cjdSnzr3v/WH+0S50hOwXcM2zSUs8
 NQieHjMBk/ouKLCPgIJ9BNZScaKNz2XI9/QXo43khRiZkpqrrGffon9lcbSiKy9dWNlf
 kuoMrofdgi8coNoxIBpsu1KpV0niWqRzrBR/Rd5zMfz+BlXiylOsDY1WWoNoADC6f7cp
 tCXA==
X-Gm-Message-State: AOJu0YyNEei91tpjHqb3Nk7PzFb08cVV4OzRbQowOg4vfrb2QFAOfmRE
 bdSDgCUbo/YxDCjVcazgdHt18whAaycHsIJ5NlcFLJgbzacsOYeWwwDLx/aYmlq2
X-Gm-Gg: ASbGncuQ09XXga4Y6Jr13RNzkYBzMALgql0MBu9JFBPe6PirUZwiOFg6IAQ9fenGvpV
 1Cu1oSkHsDTQRSUxoV0cSTP+Yg6+DMxyhfh4yZpVM9pyhbi42QIadTzj87IH7LF6A+1MzMIQuZ4
 ysB4p1hUpvohM1t8Iv7QE47q7Qa1Y27wu8qGoaF3QdIBdwbJg1YFejoB4nA47gphcCc6YhRqaUw
 v7X8inbGkSAG4pY7Y/w149LFR+s8/36vSFyrjsml8qVwTBhP4o0WMrG7ju+Vsv0JmmDZV75syRc
 mFSzK0P/7Q9CcKpwYhQlUMqTjPwYLkEZQUUCpq05a5XxXOMEPf1WirA44KWBfV38venCoiLd8jn
 F6EzMhnQMknL0vGf9Xjg=
X-Google-Smtp-Source: AGHT+IG6uvexIs6L3p3/4bWqSxksZ8qZc7StjD7j4AqdNJsMPV6VQz6ycAa59DwjO+13Bc6Q+gdwKg==
X-Received: by 2002:a05:600c:474b:b0:459:dde3:1a37 with SMTP id
 5b1f17b1804b1-459e7103474mr46276845e9.25.1754552770434; 
 Thu, 07 Aug 2025 00:46:10 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:09 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 06/41] lib/vkms: Test plane default values
Date: Thu,  7 Aug 2025 09:45:15 +0200
Message-ID: <20250807074550.6543-7-jose.exposito89@gmail.com>
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
index 7c789ea0d..9a9fbde3f 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -22,6 +22,7 @@
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
 #define VKMS_FILE_ENABLED		"enabled"
+#define VKMS_FILE_PLANE_TYPE		"type"
 
 enum vkms_pipeline_item {
 	VKMS_PIPELINE_ITEM_PLANE,
@@ -131,6 +132,20 @@ static void get_pipeline_item_path(igt_vkms_t *dev,
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
@@ -194,6 +209,22 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
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
@@ -378,3 +409,19 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name)
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
index 3bda3196d..0e5cf35ce 100644
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
index fa429d28f..69fb7ca64 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -210,6 +210,26 @@ static void test_plane_default_files(void)
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
@@ -220,6 +240,7 @@ igt_main
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
 		{ "plane-default-files", test_plane_default_files },
+		{ "plane-default-values", test_plane_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

