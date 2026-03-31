Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB910F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BD610EC46;
	Tue, 31 Mar 2026 17:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zD4H9V9/";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600910EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EC91B1A30B3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BDAA56029D;
 Tue, 31 Mar 2026 17:10:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9929F10450340; 
 Tue, 31 Mar 2026 19:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GnAb5vEd9X4ctlg2xc8736BirSaZdeo6S+Bh4pPKc+4=;
 b=zD4H9V9/NpZzwifTNeMg1fNud0QwQ5+Z4MVvL9mIs6IBuAMt9yhvV0OsJBroG0LKNxXP0g
 3qicIncQMXxZFX8igLn5N0CnytJfqZKmAYyCmXtSLxINnzgzfpxrFUjCH6ZcGD6pZSispQ
 +H1/TVwJQ/F6sezEGg/2rpSr94tQaLjp6F3+Fmmq1Sz6KTzIRdbTkQiOKc8dqL90RfPivn
 EBdAKQMCkvRBLJLvE8Y5fETGBrpfc6oAR/r9/p8HhDC8X2DfvLn9U8i0fEwJdpS7BASGSt
 K+ZUvM/F0OO9YW2NKDrOIYSjUjqMuQWpymv3CtRRaRD/MzPNNw4XZDLjVAzucg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:28 +0200
Subject: [PATCH i-g-t v10 11/49] lib/igt_debugfs: Move debugfs helpers to
 the proper location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-11-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7734;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HqbpN5CjmUWgEjOly24SN9NaI6/tiuUSLvFMGEV/+Ek=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8+2IaPhtrdby9+05oV3Cf1YM1SBzQ93niT
 6PT/54lmxaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLvjxAAgta0RxmN7pgI0mDvvB1D3Slw2VEatZj
 AYjSNFoNYQsjZR7joVk58YTZ6k9Qu47xlQAWWw21P3hZznm8NwU7Frj+yFbMOTD/peER5C3CwXD
 /lq5VYFtRqP384PGS17lCLM9Z5IdBmj443ttvorRcOxLH4vzGuAIpZMG/8oCyF0kXaqHDLUw4Ua
 wSs0DeWtA/z0BtZFVLQUNOdR9DFS4zHnXlEfYTCDAXXc5185rbukBXmIC6GN5zjMLodZXZHadHH
 QQnSwunshFKjy8k9z5WVVwZvYlrRkRSK7evkcUSZiKI2dYtwUzgodFVJrjCocWSl8IQijr+2Ae2
 NuN2fAusB8OGdyjgtZW3lFZlbpG2UonOG26O2WZuviezF0WXfUJstGDcCChgmYHhpblnbcIsI9j
 lfFuPiJKAR9mfKgJQS0BhG90KhND/Rwuwbhob9/f5JN3vPSGIaS+1XFOHamAQKkS7Gi1Bi9/1rz
 jReSTc8ktw11yjubin5PLcM4NoWvmN6dYj78ICKKda+ELa4hnLIAyhVmPNmwLGwmLwwmqUT+Pz/
 niJnydUhhwKxLbuWcsur5TluKXG6Zb1cbQXuwFw6yxse7UaO9IDmWKU1SDnvX7m0kD/w1AKHKAs
 pDn4Xp8/YBhcJfDs8A1x6t4H3GBMUTlpROLaOG1Wb6sBgLsIXLb0=
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
index a184843c9acc..0b74afe3374f 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -43,6 +43,7 @@
 #include "igt_aux.h"
 #include "igt_kms.h"
 #include "igt_debugfs.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 
 /**
@@ -775,3 +776,96 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
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
index 30d4b0ff92ba..eb2a0b70c28b 100644
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
index f78acd2c1f3b..f3166d0ef402 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1758,38 +1758,6 @@ static bool connector_attr_set_sysfs(int drm_fd,
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
@@ -7556,67 +7524,6 @@ static int igt_parse_marked_value(const char *buf, char marked_char, int *result
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

