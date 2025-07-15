Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE28C83F2E
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0081E10E598;
	Tue, 15 Jul 2025 10:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j3L47aXZ";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3611E10E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45600581226so32407685e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575126; x=1753179926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhGWAA41mERDrkMKQBbc+AtO6fyA12bntl9d8aksDD4=;
 b=j3L47aXZdDKGXqEQdjdCNwEyLPLo1qFpmyQ2ViYVbd73IgQdTuCb9fQ//zR4vvIFPF
 wcGzGZ5yA5SOK6f9bEII4Yd383rALnZ3VXkUd5yv2g3sAkvgm7C/ssEMWG6xAZ2hc3jp
 Pnpg9yBKf1yseNunxZD3T8MybCQxM0jVz2A/jlgp5NKIhJJohGTNX+alMjDJH6X2Rdjr
 bFoyiiWXLEXOu+RYKtxgLpG09ZsYvksITd0ex+TBZdBfAGQYHNSrffRlKQAYraB3i2va
 Fr2yQsPQ8KPsSIryq6kflOJXNt26n9ufD2sT3cooZqe+gO6j8+MY7LM23CJimQCVeiXP
 Nucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575126; x=1753179926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XhGWAA41mERDrkMKQBbc+AtO6fyA12bntl9d8aksDD4=;
 b=VJIQx+91aqXD5nq5tHwjaMGZ4BIJHk/vL7t+nT9YvsMFL5RqfsfutOCRGdu89+j4Hp
 DN/sr08BRzIOJiEGZNwLEpqEHprA03MXacR9D5JEJBPD6LNCN6kjXRgNur65zm9P3c9I
 cAe1IfndH1EoZYniCYfx4fBFXmZJVG7TH5p/GgopT/ZQxea2ehMeP2EleJzVauE24epZ
 d1joKCcn9o1tTxvhdppgBf+lxr4If65InenYn0Fmd7voGOc4KQqR2YGLAzjlS6OeYUBf
 SzI4NMWPxoedadU9tFK7W8DxZbR/Ud+x7xYH9VBQ015G5hAfLpS7u7nKPxm0wdVLJliL
 r6Dw==
X-Gm-Message-State: AOJu0YwpHXNakMRmRziWqQQ1iw5S5sPgEgMoNcqxYdnbW5FGYLO1ez39
 lB5t6DHTUDPIycEyOIIFzMs+eu7Il0CrQsBTLPqoKQkDERgUcFls+C6YdZPUcQ==
X-Gm-Gg: ASbGncszOhDsM8qaRKudjMgZV/8aNyyyis2EHp7mvX6PX2tP/KR5Plx9OdDRyvVlDrR
 Wf1lYy87A1vf0rZKKmdiUsx6lF81zDZZWTb7I1iNWyrqqg39iqv3O/rXxdN+7n2KU/so3J1scsa
 J8Oja6i5OYVkUPLbqJaP6ZZFS7HlUoJKa3uclNX8aez/o1LTMxr4nIdHcqinps7ueYjoNpP716V
 lxKD60aGrNy3ckEwmh+8poKvUkMuB7hNpKBVXlleNNDGqmAJxWanoYCa2kVd9EyXcmHGsq7efmA
 iAKGEeIIpELQmavZOINvhTgHKQis6NLQMJLAMqQUTg+NS5pL3KBdl8yHdKAyYjXUyN5ANef2qBn
 zbiaTdAu3/0+YQPuRVA==
X-Google-Smtp-Source: AGHT+IFLXTi3vmxAPa8oJNiwhqS/c0X010OESeLe84cVscdgL0PMIZvzZNfV6Q/0h97N1UmkUCe+tg==
X-Received: by 2002:a05:600c:3b1b:b0:450:b240:aaab with SMTP id
 5b1f17b1804b1-456272e0e1bmr19491575e9.8.1752575126111; 
 Tue, 15 Jul 2025 03:25:26 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 05/41] lib/vkms: Test plane default files
Date: Tue, 15 Jul 2025 12:24:37 +0200
Message-ID: <20250715102513.5636-6-jose.exposito89@gmail.com>
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
2.50.0

