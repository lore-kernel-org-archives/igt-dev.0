Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2D110F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D15510EC85;
	Tue, 31 Mar 2026 17:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VbYKxNaF";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F1E10EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 507734E4288C;
 Tue, 31 Mar 2026 17:10:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 216566029D;
 Tue, 31 Mar 2026 17:10:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B134104503EC; 
 Tue, 31 Mar 2026 19:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YiBDFzvCfNPvXhoVLQ1Tcu3rMNa/XWmY2uUCFQVeBdc=;
 b=VbYKxNaFrGjvtZZRrDBobvZntxOZeIaOjExf8qAEV7125jzo034ky6ZCV6Z3SSFSuFmovy
 9Lf9LWFXzj9pIEdUNngKE1ySoZPZTl+1iABy+RUWJzv9BaqEvlHiloTBE1aIxxJH8YBJJ5
 1Ya7+mD/jSBYz6GRoiMrzcwPJI3V8lVAqvHl2oYTgW2U5HPiukaQNT8ikk7Pim4bzTARAs
 t8Y2HCl9cdCKtDyfNbEgyEEbsHrjY4A5ps6lAUr+45A8jwpcqXa04bx8uWuQAmih+/+jox
 uwTWB7oevnsnX2z++F5yKVpblgr3ae/2SZPJDaIiMzvsGRnxLy+70Q8+zliztw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:21 +0200
Subject: [PATCH i-g-t v10 04/49] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-4-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4853;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=U/RBbXucgv1YDgCCWpEJ1pzVj4tFdUL6Hwgmdipa6xE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA7txZtcp+Zm3s8qE9xY50O+Dxuo90g3RzEZ
 VwUknrrTISJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIP8Q//YvIuKBH2rJPyWKRjChnEKQoNbmVughJ
 LNcO0NLNeP5YUjAC7uNICn7PGkTucNdMT7LxznwHaL+6d4YscmxhOPS5Mr03ODV9vQKrKtiSAPB
 Mn3i9gd0TC+LkEa2WyUpdkCvaI4Np0l5G3R2VzgkcitDecnsZD9qvugO5CiwQtEuuH1iVeG5YEc
 GLeRX4dYBWckEv0w/wpBaGR8n8WP/Q0Um9SAPEA3s6X8znxbTU4KFcOEiQ51LP2sG1qLiJHpN5r
 kP8WxdOjw6M3bBbP7JHleptVaZPWa68HR5ZlFbj+EN9N819XJxoyd3T4VUng198lg5BwrcjvYW5
 okLZUkKDx1AM/GVv0lAjfDGAlMPbKMFBE4O6nqa5+X/l/2XY1I695yYO+wx7ozmCok71NbTJN38
 a6a8p0qmRpQHl1hByrJjQgStPaZb9rdXBz3blEfFo5JmdzukkDutxFIq3l2l+TDGQ+K7/oVT0De
 JhqRzQyuIXjCyqMcmycLl05llTsbX57h+fFVFQ+thGlXsNjEvI3IrAVyDMQE5quPzMsarzFN7WO
 C/Um0qjf64Sc/mL3ZQM+Lq3iqbSJKJVBUjyLAvnGQlETcX9eOnVkex1L9W562nRyTA+8dpcT9ck
 4sgPqaY/0GSaBEfRycg5tfu8QoxhNeT1zToa8ZAu7Cmr9fZ9M9Ps=
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

Introduce the functions igt_get_connector_from_name() and
igt_get_connector_id_from_mst_path(). These functions serve to retrieve
the connector object using a connector name and a connector ID from its
MST path, respectively.

Given that the connector id may not be consistent, especially with MST
connectors, these functions are essential to recognize each connector even
after system reboots and plug/unplug events.

The function igt_get_connector_id_from_name() is a convenient wrapper for
igt_get_connector_from_name() to streamline its usage when the caller only
requires the connector id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 111 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c542282eca34..6c41f021aad3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -97,6 +97,10 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 #define MAX_NUM_COLOROPS 256
+/**
+ * IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -8275,3 +8279,107 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
 	return connected_count;
 }
+
+/**
+ * igt_get_connector_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to search
+ *
+ * Returns: The connector if found, NULL otherwise. The pointer must
+ * be freed with drmModeFreeConnector()
+ */
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
+{
+	double timeout = igt_default_display_detect_timeout();
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	int i;
+
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
+		int len;
+
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i],
+								       timeout);
+
+		if (connector) {
+			/* We have to generate the connector name on our own */
+			len = snprintf(name, sizeof(name), "%s-%u",
+				       kmstest_connector_type_str(connector->connector_type),
+				       connector->connector_type_id);
+			name[len] = 0;
+
+			if (strcmp(port_name, name) == 0) {
+				drmModeFreeResources(res);
+
+				return connector;
+			}
+
+			drmModeFreeConnector(connector);
+		}
+	}
+
+	drmModeFreeResources(res);
+
+	return NULL;
+}
+
+/**
+ * igt_get_connector_id_from_name:
+ * @drm_fd: DRM file descriptor
+ * @port_name: Port name to find in the connector
+ *
+ * Returns: The connector id if the port is found, 0 if the port is not found
+ */
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
+{
+	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
+
+	if (connector) {
+		uint32_t connector_id = connector->connector_id;
+
+		drmModeFreeConnector(connector);
+
+		return connector_id;
+	}
+
+	return 0;
+}
+
+/**
+ * igt_get_connector_id_from_mst_path:
+ * @drm_fd: DRM file descriptor
+ * @mst_path: MST path to find in the connector
+ *
+ * Returns: 0 when no connector is found with the correct mst path
+ */
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		uint32_t connector_id = res->connectors[i];
+
+		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd, connector_id);
+
+		if (path_blob) {
+			if (memcmp(path_blob->data, mst_path, path_blob->length) == 0) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				return connector_id;
+			}
+
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+
+	drmModeFreeResources(res);
+
+	return 0;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b2e463f9be9d..6b3b9c96fab9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1296,5 +1296,8 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

