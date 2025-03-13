Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F05C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B8510E905;
	Thu, 13 Mar 2025 17:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvA1GKJX";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122110E901
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394a823036so11786585e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887210; x=1742492010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNEb2tm/hHymq8gtJsZqPySwWY9TaE5FtzIGyf3b94g=;
 b=YvA1GKJXED11NVdWuv9jgAL0n9ceHiUYDE8pCrbSmVFFWxoNGQPql0O1MgkgalZG4v
 3Lu2fTNp5lvc4jxwIXuM19Vk6l6+UM5GEJTBGtDWYkZQgbQ1qAG9YIeEQMxOJQ0RVDVq
 jd8Wli86dhj2wtQbrYRziqS0Hv/6n+njj3uO+XDw3Rd1C9M8EHmyJJHa79Ru55kjuv1B
 R0e4PIDeKMm5UEmS3geRXpskofXIU8qUG7AhbAf2Nx5AGZI8L8ar/8+y526oDCVvuBKc
 VPpUgF5muAuL4ozaBqDtmxN4e7hfXYetM05wekhJlvig/N+FRQZW6/5aPdwnwOAg87Eh
 fBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887210; x=1742492010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNEb2tm/hHymq8gtJsZqPySwWY9TaE5FtzIGyf3b94g=;
 b=Ffg3qQ7NEJMbDmPvNxfpgg/pKF8/WCzM6BtcJFKTTfyQUn3HqDLX9pEAj/JAHUs5Q5
 0liRiFaqbXDI368z1IoxPuBsgsuGBo19RtLMOq3nKSMzdQYIq0C56LgD0JXo587Cxcnv
 5M5hMC+pKE7zkVTMjEOnHLWzHRIEnYKSPHnlQXo5aV9kkzFNuJ7jrGhPth3GQskBRlYF
 gvPHbn6h4GRUsfB2Yc5hTIbA/wOUAcCSdkgshZVtDx/Swo2eQIsrDCiLnILep2dy/iIu
 ZbnRb92x/5btiCA/8WdRVKgFoHODbSF6sqCzwxW7nZ0/l5WDfCGF8bwCGcBIELqhbh8C
 vDwA==
X-Gm-Message-State: AOJu0YwZz5L2uX5PNl6ttPcYisrYZbmy0dpzJ6qKZqZ8LCa3Rs/lKTLz
 xW/Mh7exXXXAZLx+UwJ116BgHmpH1nydazV6RgTzxCcL3WrA2/E5mhzRUqPH
X-Gm-Gg: ASbGncuVrSESb7r59/b59A3IB+XbL6pMhhSrspWuKfThzkOXHBl510c8y/bKrpfv2ml
 gFrdqYI6uwPRcuXrqSvCQ2MekBHvAkgtQzXNFMhdvCLrzSsgQxfQOE70swWwtPALCAgxcg+gtMA
 hie1mWgTZAFznJXg+cNV7WRSb2xPsHw8GVFeRN0NiMA/T7xUBhgaN9zzlm2/4M90L1tI4r/7qMV
 ar1MH1ldwBkd6mq3no1tih9BGUAfo9bflysocq/XsxCrYyJgcoBWgOHEc8vtDRfe2JX0YeICsaU
 ce5w+sCl5S/9U2vvfvRzztWxsFhWP/E6h0dAX9MCDNpJ
X-Google-Smtp-Source: AGHT+IH8pOGU1it9lDw39gkSbCFABYRtPEOT0+nK3ZBZrWqa3k4tU1538VgotTRcPBMA3egdt1vz2g==
X-Received: by 2002:a05:600c:45d3:b0:43c:f78d:82eb with SMTP id
 5b1f17b1804b1-43d01be665amr128637785e9.15.1741887209903; 
 Thu, 13 Mar 2025 10:33:29 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 07/43] lib/vkms: Test plane default files
Date: Thu, 13 Mar 2025 18:32:42 +0100
Message-ID: <20250313173318.5818-8-jose.exposito89@gmail.com>
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

Add a helper to create a plane and a test checking that the default
files and directories are created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 76 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++
 tests/vkms/vkms_configfs.c | 33 +++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 1fd00afd7..1f90e1569 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -24,6 +24,13 @@
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
@@ -97,6 +104,48 @@ static void write_bool(const char *path, bool value)
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
@@ -131,6 +180,21 @@ void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
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
@@ -303,3 +367,15 @@ void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
 
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
index d3741b6ee..9062cc42f 100644
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
index 16e5f6725..1ac85d8f9 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -179,6 +179,38 @@ static void test_device_wrong_values(void)
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
+	const char *files[] = {
+		"type",
+	};
+
+	const char *dirs[] = {
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
@@ -188,6 +220,7 @@ igt_main
 		{ "device-default-files", test_device_default_files },
 		{ "device-default-values", test_device_default_values },
 		{ "device-wrong-values", test_device_wrong_values },
+		{ "plane-default-files", test_plane_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

