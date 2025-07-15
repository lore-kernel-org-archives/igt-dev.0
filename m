Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17692C83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047810E597;
	Tue, 15 Jul 2025 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d/nUkRLd";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E6C10E36D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so37362255e9.1
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575125; x=1753179925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l3GnS8QP/u7/XAfWRZuhggMTucdIEnoh/kxdBGhCsuw=;
 b=d/nUkRLdzoZrjgw+nOT6ljb3rP6Gr72JnM/aT049zUf5Cm1jD7bSREzl0UV19t/Jm+
 9W6plsYpM2ZUdP23xyP4t9+qviBdt8zcD7un+Ar8plFGG5LSbz17Sw9aMF3P4AIrc7z2
 92WjWygSV0elcNLEMf9zWxmqUZ4Z+A35CfPvLC4VflhkGb6YfXvHpnmMYAODmVSsg2tG
 woQ3ROopAsFjonPQrEj2Qup6A5GXSyF00YWHJj2PCR/qMdrPovOjVk2CrJviv93mX89d
 PazyScfqre6jOQjn52bOYPA3y0vD+Ot6ShJ/Fwcpaw1ULvp+1uwwyVRYqUteNueWkZu0
 ysDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575125; x=1753179925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l3GnS8QP/u7/XAfWRZuhggMTucdIEnoh/kxdBGhCsuw=;
 b=REKLw4qaFbKAIvVSZ93/aTvfX0ao5MAsHyBX/3JCjSKUi4wI90M6cnqjxPJpyQ+FeU
 wX4yJqpuulzCndk0/gslFEpvbL1lJsTuuDvbE0AY5qDb0jsE/AnqgJgpnvF1InEvQ7AL
 AzB0bEjVcdn9YfjZ4HhG0iE+Cstux3Sh2YC3CFuhV8jVlrnSoEVY13xjPWL4j2ZWobD2
 wUS/e32zS+Zy4no1iOXLwQXyPOG348tKvrsbBPlxPuWkA4x03c7rbTkv7v5BIOZhh2Of
 orZxVHTen9g1CGRNj8xstaByqsfX/c7H7COzw/YOuroGiE9/jwHE3dTZvMNIww9Y2KiP
 zflA==
X-Gm-Message-State: AOJu0YxJCDBhegdrGAdciBRq5crAWFibGSGTi4E7lCsAuot+ILz8USUZ
 zkMKyrvQFHOY6bZpED3GBCErSX8GcslYaSguNeGAY1nNZgAs3TrfIBXjTZPcrw==
X-Gm-Gg: ASbGncubEiZ90/dVYjAPWYm7qc5bqPVl/iYnnBq/WrC2rta2TikIy7VRmhKpM7k3bS2
 Pbhvzx3oidiBpENubrqTMsmZ6l8uogehsTtDtpN39Ne+c+0Qw1a4oJxnmODbBUgizdMQE0+t+c5
 9gWLP6BRGDMWG3UpIXaZozG3C4c2J09sNlym3ZsoHAlCFJXO9QQ/cIg5pKUNiq7RodewoUzWMFL
 mZ44VzOMd+ccyusvHBcAFJUN1La+6S7f/RYJZNWLCbjMeEqMLsgK8OgA/7w5pExYsFnWkYyT5uM
 +QqywHXrY7SFONqd30cesYezwYyVlCtvY07r39ti3GvfAfiFD4PdE9jzLUplqS5XfpR9uWary5e
 rYDcTKLd/MArcgxRuPg==
X-Google-Smtp-Source: AGHT+IHH2Wz9ZEvMoPCXepYlZLBEKw0oDvTuJbepB1z70lHp+Gvpj54R4zxVHr1e/4Y8lpRQpwI7tA==
X-Received: by 2002:adf:e191:0:b0:3a4:cfbf:51a0 with SMTP id
 ffacd0b85a97d-3b5f35317a3mr12879631f8f.21.1752575124724; 
 Tue, 15 Jul 2025 03:25:24 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 03/41] lib/vkms: Allow to enable/disable VKMS devices
Date: Tue, 15 Jul 2025 12:24:35 +0200
Message-ID: <20250715102513.5636-4-jose.exposito89@gmail.com>
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

Add helper to enable, disable and check the enabled status of a VKMS
device and add a test to ensure that the default value is correctly set.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 98 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  7 +++
 tests/vkms/vkms_configfs.c | 18 +++++++
 3 files changed, 123 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index fa41f741e..1fd00afd7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -7,7 +7,12 @@
 
 #include <dirent.h>
 #include <errno.h>
+#include <fcntl.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <unistd.h>
 
 #include <ftw.h>
 #include <linux/limits.h>
@@ -17,6 +22,7 @@
 #include "igt_vkms.h"
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
+#define VKMS_FILE_ENABLED		"enabled"
 
 /**
  * SECTION:igt_vkms
@@ -47,6 +53,50 @@ static const char *mount_vkms_configfs(void)
 	return vkms_root_path;
 }
 
+static int read_int(const char *path)
+{
+	FILE *file;
+	int value;
+	int ret;
+
+	file = fopen(path, "r");
+	igt_assert_f(file, "Error opening '%s'\n", path);
+
+	ret = fscanf(file, "%d", &value);
+	fclose(file);
+	igt_assert_f(ret == 1, "Error reading integer from '%s'\n", path);
+
+	return value;
+}
+
+static bool read_bool(const char *path)
+{
+	int ret;
+
+	ret = read_int(path);
+
+	return !!ret;
+}
+
+static void write_int(const char *path, int value)
+{
+	FILE *file;
+	int ret;
+
+	file = fopen(path, "w");
+	igt_assert_f(file, "Error opening '%s'\n", path);
+
+	ret = fprintf(file, "%d", value);
+	igt_assert_f(ret >= 0, "Error writing to '%s'\n", path);
+
+	fclose(file);
+}
+
+static void write_bool(const char *path, bool value)
+{
+	write_int(path, value ? 1 : 0);
+}
+
 /**
  * igt_require_vkms_configfs:
  *
@@ -65,6 +115,22 @@ void igt_require_vkms_configfs(void)
 		closedir(dir);
 }
 
+/**
+ * igt_vkms_get_device_enabled_path:
+ * @dev: Device to get the enabled path from
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the device "enabled" file path.
+ */
+void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len)
+{
+	int ret;
+
+	ret = snprintf(path, len, "%s/%s", dev->path, VKMS_FILE_ENABLED);
+	igt_assert(ret >= 0 && ret < len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -167,6 +233,8 @@ void igt_vkms_device_destroy(igt_vkms_t *dev)
 
 	igt_assert(dev);
 
+	igt_vkms_device_set_enabled(dev, false);
+
 	ret = remove_device_dir(dev);
 	igt_assert_f(ret == 0,
 		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
@@ -205,3 +273,33 @@ void igt_vkms_destroy_all_devices(void)
 
 	closedir(dir);
 }
+
+/**
+ * igt_vkms_device_is_enabled:
+ * @dev: The device to check
+ *
+ * Indicate whether a VKMS device is enabled or not.
+ */
+bool igt_vkms_device_is_enabled(igt_vkms_t *dev)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_device_enabled_path(dev, path, sizeof(path));
+
+	return read_bool(path);
+}
+
+/**
+ * igt_vkms_device_set_enabled:
+ * @dev: Device to enable or disable
+ *
+ * Enable or disable a VKMS device.
+ */
+void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_device_enabled_path(dev, path, sizeof(path));
+
+	write_bool(path, enabled);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 48c48f296..d3741b6ee 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -8,6 +8,8 @@
 #ifndef __IGT_VKMS_H__
 #define __IGT_VKMS_H__
 
+#include <stdbool.h>
+
 /**
  * igt_vkms_t:
  * @path: VKMS root directory inside configfs mounted directory
@@ -20,8 +22,13 @@ typedef struct igt_vkms {
 
 void igt_require_vkms_configfs(void);
 
+void igt_vkms_get_device_enabled_path(igt_vkms_t *dev, char *path, size_t len);
+
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
 void igt_vkms_destroy_all_devices(void);
 
+bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
+void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index b942cec64..aa7cd9e4e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -103,6 +103,23 @@ static void test_device_default_files(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: device-default-values
+ * Description: Check that the default values for the device are correct.
+ */
+
+static void test_device_default_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -110,6 +127,7 @@ igt_main
 		void (*fn)(void);
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
+		{ "device-default-values", test_device_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

