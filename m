Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DACE7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7CF10E4E5;
	Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JIh8Zn2p";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3386810E4EC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1CA5E4E423C3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E68A560767;
 Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC6BB119A88F9; Mon,  2 Feb 2026 15:32:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j1alb5a5cE+hweroMCXPSCQXkeBd1K6Nzx6qakPb38Q=;
 b=JIh8Zn2pIzP7KZ7AMwr1OLFoAK6oRxJW2vEWBisPJ3WqFQQnFLvwVN5YBennPQ6Rq1jbaC
 Yjr37JXAMrPzeLkm4Jn5Ktz3dvJ64w2WyoHsETQZq5qEW8UTnsio3hEQ/G7ip5FyBfq2Yl
 oMCanPi70YIoxKpfyQg66JDA85Qrv4q/OfvgHXo9qI5LRGh7FlQZ5YN1hQibmBMoQpGWyl
 wHDPV6sGPr3qDrVozNXVW8CLjvwfZxqAIAeYYofmWjjft2Y7xx0jID3EgelKXCP9KwfkFy
 9TXpvc1TPfm3lX7VTNNexqJx0JIRAdvSsTK+QgGAMtT3y3MgoI0ZFTiGuLSa5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:49 +0100
Subject: [PATCH i-g-t v6 10/48] lib/igt_debugfs: Move debugfs helpers to
 the proper location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-10-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7622;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ggyvcOKrphC2Ua1e/DEsMZ34A7BTvmUpMAR+IGBeqb4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPhkbtZat+7hJ6oFR2LDIfe4jJ7CAbMCPwm
 tb7dg3MeWSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL3cBAAoDhFXkBNBi4EMJF9vapQVGPjXdS3jba
 CGx7CpxawDtvwdc4QisDmxA+kcqswidTvjUBV8/25fxTevFnBj5I0MH0wwiMYhbGRlY0KRxr/0i
 aXWDkQXkcP9x/IxV+ZDrzf0vrkxqx1W14FPY5AIISRaOGEK24+Kn3gckws6VmnZUo+52dLScsjP
 RKfGsaPHJfYrkhSqMJceHMvBUnv8QKc+K+JsaD6GjkEOxMMc+hxTn5kEXvKWw214pkF0YmbvveL
 9lnHrQBJkTKHHhe2mjg3EOKoE7IgfWUgxLxyQEIajj45hX2IykyL40D5444knpHERuMwJwxOqUF
 zPKAWwyczWhtnL1VKOnfGVUIVNKkOoGv7qfUja0LgrlaUT6APldhGp5cmfR+5zo49hQnpUpaWhf
 XmEVXAFw2hoRrnNi1uW6FghhxNsoFMNOy5mozbYdEGwvI4fC7yMZflsNzr1xbIwyu08A9xatX+L
 6+xQRsHV21N2iOF28BQkprhBCOkB8pQnY4/saSskkdZuqIG6iio1k8qdpR6ek6V19y0jFiaNhhG
 IirZyb3wqeZpUO1Adf2yYedc8ZXAidrVMWXCW01XIiblU5+GXAXVrRtPN5v/UdTdoP3laB3gDpG
 JroqxZ6whDNDceXWY1fuoN5ML+Z4vDqnJkkYq+YEmW6YdOk2Snr8=
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
index 11f5ee9984ee..6072d7d68025 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -43,6 +43,7 @@
 #include "igt_aux.h"
 #include "igt_kms.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 
 /**
@@ -776,3 +777,96 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
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
index 2c546f299a43..49fbadd2a74c 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -28,6 +28,7 @@
 #include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
+#include <xf86drmMode.h>
 
 const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
@@ -176,4 +177,16 @@ int igt_get_stable_obj_count(int driver);
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
index 84423b36cd7d..2754b3bc0c91 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1755,38 +1755,6 @@ static bool connector_attr_set_sysfs(int drm_fd,
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
 /**
  * dump_connector_attrs: Display on debug log all the connector attributes
  */
@@ -7494,67 +7462,6 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
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
2.52.0

