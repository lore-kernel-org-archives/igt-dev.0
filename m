Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C7F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2487A10E25E;
	Mon, 16 Mar 2026 10:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dBzUswDR";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7881E10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D80C7C415A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B0195FC4A;
 Mon, 16 Mar 2026 10:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05E4910369F12; Mon, 16 Mar 2026 11:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z5ajQaRUsIJiJU87/cVFtKJLdfKUzq20jkt1ca81vMk=;
 b=dBzUswDRhLZvhmOPDl+IEzYv1iNfNmkthFrZhFsBc+CYVD+3MV4uI+qjsUUbK0o9jz9bkV
 +9poRG049pcqzYF5WEnzPfjGDgSiNWlIZJOK3ijQeJ9mONeK5tOszwMjLQ8Vv8JWACYV3w
 0at2x3vubNYJbCWsPsmJA3pCsdcOM/wtTbwnp+gb2Y8Dmn0Hml9CrCxIRG4mUrHTCBMBcS
 XgncVr1SU3e8eG+dUqqKczs6o0uvGY6nDlOR+3o9My6Cb2zoZAy5i0nM660JGFYouh29jR
 Jd/RycEeuTPR6cRpADKL9sgxSYCBBxR7lXa39//aDCvjQMt2Z4hzAJvinRe7+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:19 +0100
Subject: [PATCH i-g-t v8 11/49] lib/igt_debugfs: Move debugfs helpers to
 the proper location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-11-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7734;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=x4DNomkQbGDgBRiaaDNXCV0OQ2u4JYv7MCZEGaGU3NY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pPBno/nVP/SBmWQMrThReAlakC5CX5/wo8z
 64x1ziwh2uJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLrkxAAyXW+/yr9tilp5xQRIJ1kzln2MdHgY5d
 UZMCbnq2HjoeuG7BoAE4rMExJjVwuFhVtjp1WRE/2BFj3GIJaqwdyUrxLIt0qldwPPDozIpca5g
 NsPdwULHBEgAbV+dB4ngIQZPiaFd/F/uKnJIUvyTiNcWkAvJfYZZ1Y6ClcLMJawDKK9phAC1xqI
 puXrTR84bGsCbSxVltNDToBxdkLdhK1iDpQDK6CD4/qjKMqbqRWczT/sCqfXRtQTxEnF8Dz4yI/
 VC+RJIaUvAL/Jh6KouRTkxXVtEbpCsiiwspW6LkeqVAhEeU0uhbcr5TN3FMQVH5tYmMPXBMP29j
 BEiz7gGj6meBNwdISPGeRvMPwmgceGMvTVBRJgh8eT6+7UcBl8b/uPtAgrqfY8+FqXErvNPp6TT
 9wgX79xoCWG+hkb6XU8OY68iheUMUB5jW0BE0lqm2zobYlRMjoITbAdbpj6z7M+RgsQ8zS4LNmr
 al8riDnnPL/z0rLQbdzNDX+yDdz9rzI6lXQbF+CDtbmqEEreGRSCnX+SDN+oeh5QuF1D6WYKIC+
 z8+9MTkdSR2hBzHvFd8ofcGza8sx6e9G7GFpKwh+ah+5XJ+TQB+e/Pd54VT9W2OCVLI83lppsTa
 bNmeNJXSqTQzH0gViPYFtpP8ACp54FcGqXJI/dRYsd3O9cJOJO54=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
index ce9f70f31f64..97292c5c3dfa 100644
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
@@ -7516,67 +7484,6 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
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

