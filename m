Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B8ECCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3F110E3BF;
	Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LjPNXkTP";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C6E10E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7B27E1A19A7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4A67B606F5;
 Mon, 10 Nov 2025 13:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50AEA10371901; Mon, 10 Nov 2025 14:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CRAAwzGZ6wj9VwENxlVFHlImzithoLMiAH/VlfCFVyo=;
 b=LjPNXkTPio/LeJB8w8bAhRluly07x4bi51FhHtiA/X9EcAvMqbbdYvn+Yajawy+7s0oT+U
 356WBOe6fk6jQoZ56iW5VhasSIRIYbUF4WHg4AyLmIi8K4jDDPBo2JKi5UdRVKf52l7qhH
 8/XU1+OVMe4UnT8miw6HySukofLxh9JHAa2XA0N2E2WqG5DHrwe9O0Q+b+TvL1sux0+EQW
 7PuzccCGuzFgmaKifhVq/cSM1x1Ckon6F2Ljx65ZQzXO+vPnv3IZbQYCj0Bq/+IfA4pBUG
 OUewVEXk8ARWL/FmocMm1Sm0AUAAJyKZkz8WyOYuhHq4p8JQRM1nchkX8xG5nQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:12 +0000
Subject: [PATCH i-g-t v4 10/46] lib/igt_debugfs: Move debugfs helpers to
 the proper location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-10-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7503;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aPq3zo4fwcFXTKBOTgZSaxMqI6qTenTsOlfqHLgYFTc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesNTSFkW41tVrUBu7GCN0FTyByL6ihpKqrLe
 3mh742wM1mJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDQAKCRAgrS7GWxAs
 4rDeEACL61y/d0MgUKy/F9aJtuWwVSd6dK0JyROBc4MSXF9EVU52UhCZE9RHtS+Y7eMoZXhL4Pm
 LziNd43rsE7HMDDIOCIimKSPX9HtVPkkP/AdY7h34igGckPImnSxRHDLJmzKalBWkbyrzhJ3x/4
 4+YVMXj4gOToSV10NjNbb9p9MxmPtkjM5wdeoAbiiO/AJjcW+cT7+BJBSt+13YPq/PSxBjesMbw
 /5IvW0raAlO86T9KlopopPCg7gQSnKmmzrbdVn1z6WXM1+lPB7X8CPko2GFLy/Zys6OHmuvJgkO
 xHcp0mSgMlU9Yo/4RnL3CRb1nnDpiUMQzpmxm7tRCdCVPhgl29J77LxN7U0v5pJxY6uqnXvSub7
 f00AdGBIYT68sUK6TfeNR2IUf3ImoQsGCaXV8J4S66i8W5wU8BgsPhIf8d0lgTcnvjzsVaMi1u7
 KghzJRL1Cn815p3xGosWPJ3N5YBGINK3RLS6YX13aZd9d2r9k1gAS61zduIHrTJ4+OFzyiniHEi
 6j2HD13OL4QFqYvVqaMf0SREwfeMlggRr96DIMN5Nwx4SWTPd3eXCsfjZgHwFhhxV1sPlCjoZTt
 0YpIjr3slP7+v8IMguD9mSfRy8z4ytL0j90xotrbaHKtpOkvoD5e382FDay1ZGG587xYtLeyRL4
 4Gkkbu8ZdC10e7A==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

igt_debugfs_read_connector_file and igt_debugfs_write_connector_file are
debugfs related helpers. To avoid mixing everything in igt_kms, move them
to igt_debugfs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_debugfs.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_debugfs.h | 13 ++++++++
 lib/igt_kms.c     | 93 ------------------------------------------------------
 3 files changed, 107 insertions(+), 93 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 210a9cea0d1e..e73db25835eb 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -43,6 +43,7 @@
 #include "igt_aux.h"
 #include "igt_kms.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 
 /**
@@ -745,3 +746,96 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
 	igt_log(IGT_LOG_DOMAIN, level, "%s:\n%s\n", filename, contents);
 	free(contents);
 }
+
+/**
+ * igt_debugfs_read_connector_file:
+ * @drm_fd: A drm file descriptor
+ * @conn_name: Name of the output connector
+ * @filename: The file to read from in the connector's directory
+ * @buf: Buffer to store the read content
+ * @buf_size: Size of the buffer
+ *
+ * Reads from a specific file in the connector's debugfs directory.
+ *
+ * Returns: 0 on success, -1 on failure.
+ */
+int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+				    const char *filename, char *buf,
+				    size_t buf_size)
+{
+	int dir, res;
+
+	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n", conn_name);
+
+	res = igt_debugfs_simple_read(dir, filename, buf, buf_size);
+	close(dir);
+
+	if (res < 0)
+		return -1;
+
+	return 0;
+}
+
+/**
+ * igt_debugfs_write_connector_file:
+ * @drm_fd: A drm file descriptor
+ * @conn_name: Name of the output connector
+ * @filename: The file to write to in the connector's directory
+ * @data: Data to write to the file
+ * @data_size: Size of the data to write
+ *
+ * Writes to a specific file in the connector's debugfs directory.
+ *
+ * Returns: 0 on success, -1 on failure.
+ */
+int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+				     const char *filename, const char *data,
+				     size_t data_size)
+{
+	int dir, res;
+
+	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+		     conn_name);
+
+	res = igt_sysfs_write(dir, filename, data, data_size);
+	close(dir);
+
+	if (res < 0)
+		return -1;
+
+	return 0;
+}
+
+bool connector_attr_set_debugfs(int drm_fd,
+				drmModeConnector *connector,
+				const char *attr, const char *value,
+				const char *reset_value,
+				bool force_reset)
+{
+	char name[80];
+	int idx, dir;
+
+	idx = igt_device_get_card_index(drm_fd);
+	if (idx < 0 || idx > 63)
+		return false;
+
+	snprintf(name, sizeof(name), "%s-%d",
+		 kmstest_connector_type_str(connector->connector_type),
+		 connector->connector_type_id);
+
+	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
+	if (dir < 0)
+		return false;
+
+	if (!connector_attr_set(idx, connector, dir,
+				igt_sysfs_set, attr,
+				value, reset_value,
+				force_reset))
+		return false;
+
+	igt_info("Connector %s/%s is now %s\n", name, attr, value);
+
+	return true;
+}
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index f4044d5458ab..c33908054da7 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -28,6 +28,7 @@
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
+#include <xf86drmMode.h>
 
 enum pipe;
 
@@ -177,4 +178,16 @@ int igt_get_stable_obj_count(int driver);
 void __igt_debugfs_dump(int device, const char *filename, int level);
 #define igt_debugfs_dump(d, f) __igt_debugfs_dump(d, f, IGT_LOG_DEBUG)
 
+int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+				    const char *filename, char *buf,
+				    size_t buf_size);
+int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+				     const char *filename, const char *data,
+				     size_t data_size);
+bool connector_attr_set_debugfs(int drm_fd,
+				drmModeConnector *connector,
+				const char *attr, const char *value,
+				const char *reset_value,
+				bool force_reset);
+
 #endif /* __IGT_DEBUGFS_H__ */
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4f6a07c06e9d..27c0947bcb7b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1648,38 +1648,6 @@ static bool connector_attr_set_sysfs(int drm_fd,
 	return true;
 }
 
-static bool connector_attr_set_debugfs(int drm_fd,
-				       drmModeConnector *connector,
-				       const char *attr, const char *value,
-				       const char *reset_value,
-				       bool force_reset)
-{
-	char name[80];
-	int idx, dir;
-
-	idx = igt_device_get_card_index(drm_fd);
-	if (idx < 0 || idx > 63)
-		return false;
-
-	snprintf(name, sizeof(name), "%s-%d",
-		 kmstest_connector_type_str(connector->connector_type),
-		 connector->connector_type_id);
-
-	dir = igt_debugfs_connector_dir(drm_fd, name, O_DIRECTORY);
-	if (dir < 0)
-		return false;
-
-	if (!connector_attr_set(idx, connector, dir,
-				igt_sysfs_set, attr,
-				value, reset_value,
-				force_reset))
-		return false;
-
-	igt_info("Connector %s/%s is now %s\n", name, attr, value);
-
-	return true;
-}
-
 void dump_connector_attrs(void)
 {
 	char name[80];
@@ -7118,67 +7086,6 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
 	return -1;
 }
 
-/**
- * igt_debugfs_read_connector_file:
- * @drm_fd: A drm file descriptor
- * @conn_name: Name of the output connector
- * @filename: The file to read from in the connector's directory
- * @buf: Buffer to store the read content
- * @buf_size: Size of the buffer
- *
- * Reads from a specific file in the connector's debugfs directory.
- *
- * Returns: 0 on success, -1 on failure.
- */
-static int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
-				    const char *filename, char *buf,
-				    size_t buf_size)
-{
-	int dir, res;
-
-	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
-	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n", conn_name);
-
-	res = igt_debugfs_simple_read(dir, filename, buf, buf_size);
-	close(dir);
-
-	if (res < 0)
-		return -1;
-
-	return 0;
-}
-
-/**
- * igt_debugfs_write_connector_file:
- * @drm_fd: A drm file descriptor
- * @conn_name: Name of the output connector
- * @filename: The file to write to in the connector's directory
- * @data: Data to write to the file
- * @data_size: Size of the data to write
- *
- * Writes to a specific file in the connector's debugfs directory.
- *
- * Returns: 0 on success, -1 on failure.
- */
-static int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
-				     const char *filename, const char *data,
-				     size_t data_size)
-{
-	int dir, res;
-
-	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
-	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
-		     conn_name);
-
-	res = igt_sysfs_write(dir, filename, data, data_size);
-	close(dir);
-
-	if (res < 0)
-		return -1;
-
-	return 0;
-}
-
 /**
  * igt_get_current_link_rate:
  * @drm_fd: A drm file descriptor

-- 
2.51.0

