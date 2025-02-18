Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B77C021BE
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A19310E7AF;
	Wed, 19 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3sAj/8J";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7A610E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso2053902f8f.0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897419; x=1740502219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sm9k1m5G2WXZycEVY/kHu6x6FLuUR5iLuIXycZmA5Oc=;
 b=W3sAj/8Jse7+Ju9ghR7c93pYoLHIGr5GXgaSHzT0RzMlH2lLhqd0cPFAR8GBz8L51b
 Wk2fjF4PbWen6WkiwdHUWXo0xCzEvviHz/4BwcnnDNI3TIV2GJQlEWzRASSLCFnlmJd2
 yeJ4MwsCHLTBdJvKIz7fZYvDBSNao+5WhBBgJ/DgEDaxDPzrLG5ngZlYGCRbZ4G8jqZ9
 t+j9G1lYXSP1AfBGWmMOu5KodKWxGtZQ/GWUAu+taNNPLYwoHrt0GIMxFuLQNnPLu9jb
 3wV7sjDc72HxDWsp2lP4eFj6Kq5EMaEGKXFZfHViht2vKZGTW+BB+++azrg/OFK3JLCB
 /dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897419; x=1740502219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sm9k1m5G2WXZycEVY/kHu6x6FLuUR5iLuIXycZmA5Oc=;
 b=pEqID4YV6Z20O2JQQekavKkXJBGIcpGRIYxf8S8kj1xHBeQOJKHxNhTpS6vz/4+/wO
 jATzy7ipvGXo+Qnk/yGItcS++3bgaHmAesawIPpnc1SUF70bVL8ABzQ2hSwbSn4Y1PN3
 7Nwg5gc1VKzl37XU2QJTO/2YBKdUT+MOcDlTXQOGU65ZfGqg9WxAM6omQkFnrqm7P+Py
 qb8/YlnbPK+5KtdTZuyOJzHPYvd5aQEKIyKgJ7G2X4JmzpoCOrPLs+cvVsMm/8NB26vJ
 lNalmKMcnbX+k7F6rNn0xAgUn7DgBEZFvQ2/RCu3ou5MxEYYk/Q+vuf60ais09+kvA9h
 bfIA==
X-Gm-Message-State: AOJu0YzDZN5u8MBM4CprYZGizYEw39iLCVlPqBvTpa95aq3auZ51qiHU
 M+xF9s8BzQIU4D9TiMX8AjrRHrCghFJeAv/soAkOwzVRdLcUzSz+1Ant6WVE
X-Gm-Gg: ASbGnct2ifWU3jAnmGg76bcNtoOF+14X8qJ0ymZyjMMnzSh8JgU/QyKjD+0vT1Sa9e7
 T2XWFwW1nHLn1f1DFxQ4ZZsOmEpADniLLr4IUe+iPNeyuWvniWruxNU/V2HdRyfQeCJZ3N+J+Qi
 LPldFHZEE+gvTVoZ6a8mRrrOFx9aa49Sa6Ux6Q+Hy+7mNOQMadVNl3fBWXoCZ/Y+kwPFwQDdRHK
 rqpqB4t1qAMfedW/OluQRh9ehzkJTPv610XYdTwacNsDQ4QxbvhxMvXbE2M1jKtYNZYktuYzviD
 la57PKjkv6yrWniL2g==
X-Google-Smtp-Source: AGHT+IEB2itpZdxzUWVdTn/q6r+JVERA46hOVkqNrPcwc+Ial6GgcMb1WR1mlwX+yxFOsJj5qYnkXA==
X-Received: by 2002:a05:6000:178a:b0:38d:d8fb:e90f with SMTP id
 ffacd0b85a97d-38f58795868mr157155f8f.24.1739897418959; 
 Tue, 18 Feb 2025 08:50:18 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:18 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 05/39] lib/vkms: Allow to enable/disable VKMS devices
Date: Tue, 18 Feb 2025 17:49:37 +0100
Message-ID: <20250218165011.9123-6-jose.exposito89@gmail.com>
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

Add helper to enable, disable and check the enabled status of a VKMS
device and add a test to ensure that the default value is correctly set.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 80 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  5 +++
 tests/vkms/vkms_configfs.c | 18 +++++++++
 3 files changed, 103 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 8cea94901..1fdfb09f7 100644
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
@@ -45,6 +51,48 @@ static const char *mount_vkms_configfs(void)
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
+
+	file = fopen(path, "w");
+	igt_assert_f(file, "Error opening '%s'\n", path);
+
+	fprintf(file, "%d", value);
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
@@ -151,6 +199,8 @@ void igt_vkms_device_destroy(igt_vkms_t *dev)
 
 	igt_assert(dev);
 
+	igt_vkms_device_set_enabled(dev, false);
+
 	ret = remove_device_dir(dev);
 	igt_assert_f(ret == 0,
 		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
@@ -189,3 +239,33 @@ void igt_vkms_destroy_all_devices(void)
 
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
+	snprintf(path, sizeof(path), "%s/%s", dev->path, VKMS_FILE_ENABLED);
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
+	snprintf(path, sizeof(path), "%s/%s", dev->path, VKMS_FILE_ENABLED);
+
+	write_bool(path, enabled);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 48c48f296..dab51852a 100644
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
@@ -24,4 +26,7 @@ igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
 void igt_vkms_destroy_all_devices(void);
 
+bool igt_vkms_device_is_enabled(igt_vkms_t *dev);
+void igt_vkms_device_set_enabled(igt_vkms_t *dev, bool enabled);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 441c39a47..6c7d0310c 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -94,6 +94,23 @@ static void test_device_default_files(void)
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
@@ -101,6 +118,7 @@ igt_main
 		void (*fn)(void);
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
+		{ "device-default-values", test_device_default_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

