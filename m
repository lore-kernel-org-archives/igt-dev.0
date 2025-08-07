Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16390CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563D10E7FB;
	Thu,  7 Aug 2025 07:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I16YfVrc";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351C10E7F9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-459ddada9b1so6315505e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552767; x=1755157567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fK5F8fa2OU8CfbeAABrzhwZepBbc7UAInALtIW43/aY=;
 b=I16YfVrc0Qx53PvCxqPS8dbgWkD5qclGumDxMD+l40q/x4hgaWvzPM4gLt5PyBBovK
 /9116Z56IWbWIHinvdejDmwQXsx5+hbjc5LSur2HrP14nXWidg023g2U1EQYHhAnadkh
 wZXGNWKNOhKFgQ94qGScGkya7H8/BmGYI3cZtB/sc7lyAnFLz3rm93zwH0nS33qL7OAB
 tN+LkHa3qo7zmz46lu9ArhesnPoE3fe6Q26IzaB4kC8dVM2eR2stRmmtFKuJmlw1sJ8n
 +dveOF9bSpsv1GE6rOVxMcamPFOlBotwkRkoXqfPkxCJI3sCoMcjTyQqIXbEhjqkl7R7
 esVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552767; x=1755157567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fK5F8fa2OU8CfbeAABrzhwZepBbc7UAInALtIW43/aY=;
 b=Je7fsAMWrCw+FJj+p5Nkjdb/C06I2Kf/tvQLl8bQkJFSnjILwWCtun4+UlctJFzG58
 efxMckJ9qVz5Si/9759ZKXuR/5UXzadN+daM8ouEHpK8pEAvEjacFV94Y6KZ+ZndoiNM
 FZ/0FbFyb7RJu+4sHPVnCyJpn1PO45u1KRxBfOCTlxjXFN04I0px8WB39hqC7veTet9e
 KATOVUDzrlTsByrcKcoI4ZuqDBD4f+tvjH49BZD2zq1fBIcQaUZQTSyTtKcl1yFCpTFL
 FxmL0SdnvYa5dFarrZ2Hs0d6Ey34BHuByvL1kbTJtox9ojrsQ4Vx9baBj+WF3iJZPwOM
 B/LA==
X-Gm-Message-State: AOJu0YztmYVdkRweMbXTtM1HH85wnbGtVgV5JRccknSkoqROBwF+BkOC
 W6G5vXsR27vvkYOMSRkdSY9kqSEXOJQ+O4nf7p2ArgbaPtr/5RC4e8Ow5OFgCfA8
X-Gm-Gg: ASbGnct8MFlGRBoDRLrpah1TB/pVQl63vOy5j/qEeC/7ioAnA4YOYra6GFDK5kbbH3z
 hE1+qDq6Hwj/TwmKG77A2TzmH3UX6bRit8nOOLThfdzTDJGHtHuRR2XDBUp9q2+QeGDsbHSwvwF
 qpkOfDkcD7In/Et154K8s89SkChTpDspqhNgqo4vvRcYczwLXB5ui2ILdKAXyrRTBCK8fanjEp+
 1Wfft+mCM2YiFDw8OA9Hhs7mokGFrBu4BF410ToZzZaQVnSSG8tb3slnZQjvmNSqV+dcfczFIbd
 NQALGJb2Bwi8rzed5uZucK+KK50Nz6gunv4rdeEn7+Fvv/7SzY+FxTXr9VMxVhSqzvRyAR6Wj9w
 tPae2A8vUkg6XSIB3bzo=
X-Google-Smtp-Source: AGHT+IFrLBGx5C1ZBdMDyqdwhBNdE7R63B/KiArmkNi+msxOQbiTfJnuqeGPZ12AWcglZcjewprGVQ==
X-Received: by 2002:a05:600c:5254:b0:453:81a:2f3f with SMTP id
 5b1f17b1804b1-459e74bc7a7mr55052685e9.30.1754552766792; 
 Thu, 07 Aug 2025 00:46:06 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:06 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 03/41] lib/vkms: Allow to enable/disable VKMS devices
Date: Thu,  7 Aug 2025 09:45:12 +0200
Message-ID: <20250807074550.6543-4-jose.exposito89@gmail.com>
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

Add helper to enable, disable and check the enabled status of a VKMS
device and add a test to ensure that the default value is correctly set.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 98 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  7 +++
 tests/vkms/vkms_configfs.c | 18 +++++++
 3 files changed, 123 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 03931d2e4..7d3575ca0 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -7,15 +7,21 @@
 
 #include <dirent.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <ftw.h>
 #include <limits.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/stat.h>
+#include <unistd.h>
 
 #include "igt.h"
 #include "igt_vkms.h"
 
 #define VKMS_ROOT_DIR_NAME		"vkms"
+#define VKMS_FILE_ENABLED		"enabled"
 
 /**
  * SECTION:igt_vkms
@@ -46,6 +52,50 @@ static const char *mount_vkms_configfs(void)
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
@@ -64,6 +114,22 @@ void igt_require_vkms_configfs(void)
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
@@ -166,6 +232,8 @@ void igt_vkms_device_destroy(igt_vkms_t *dev)
 
 	igt_assert(dev);
 
+	igt_vkms_device_set_enabled(dev, false);
+
 	ret = remove_device_dir(dev);
 	igt_assert_f(ret == 0,
 		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
@@ -204,3 +272,33 @@ void igt_vkms_destroy_all_devices(void)
 
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
index 95d7a53cd..8b3595b00 100644
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
index f659a7a22..0ed6a63a6 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -102,6 +102,23 @@ static void test_device_default_files(void)
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
@@ -109,6 +126,7 @@ igt_main
 		void (*fn)(void);
 	} tests[] = {
 		{ "device-default-files", test_device_default_files },
+		{ "device-default-values", test_device_default_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

