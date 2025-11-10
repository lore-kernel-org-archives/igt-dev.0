Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1082ACD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35C910E3BB;
	Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QpmFPvve";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35F10E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 527D71A19AB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 282FB606F5;
 Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A29D1037188A; Mon, 10 Nov 2025 14:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qN9KaJFLBJHpWLOFpypdCITxpDCHYCd6n84rx6lP3Dk=;
 b=QpmFPvvedHoCNIwO/csNhSfRYiZoWyuFge7osQGzhbkyqfjXnjC3x8xDSHBu+XLDUJ7g3i
 +narxMaCBvWHWoqL7rZG04jC4283WfkR0e1IGewxsqoxNstTuhRiq5r91NFrFDqAptuoYV
 /c/by1uQU1NtJZjrD+s3Z6S8pMaEWPVLvWtCU3n5BpFIIUDyafjEw4hMjkg8a3kqzAIonq
 PtNruziHfVktBVX/En1ayeOHIcp/KZMG5TCR7OjfVRVzdupxIdi2SbrqHTyaIBpTyNzuqH
 MF3/i5HGBrgirs4XHpC6ZLwTg5VoF12s2ajDHs83ewWZZnvhnGSkjVLuFLs5zg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:06 +0000
Subject: [PATCH i-g-t v4 04/46] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-4-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4720;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Xkd11tUe7NrGAfvJH42ie1GLdNUOYlWoe6Phm1Ow+xY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesMO74Wt/Xq+wR96/tBYRfTRy32ASXyIkifj
 xjY9HHsHeGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4hPREACDgQNUI+wP0LYj7AeQGifvaKGDVa1RshNHUEMEqHrd8ji2BW7WD1uW5Vt0k7iTO3lyTk6
 eG3lJXwslwFm99+gKUdH4rgwsIfgZMvfs9Bl98Gb7j2PgpyDpRqqa+ilVtifIoWvIx9rz38X8Hr
 Bq2KpAAURpEJYszTeHdTSnJqZu5HXuyXBBPjvnVsXo/uElhubmm6Ker7SOeS5NrbR9aqOri5NA3
 JMQJ5AmesBWffQdJqYY8IO2AdDo75SxlDY5Pg6hYRGuvHm4jQmIoe0NKm8XrLfbvYkCdGXcS+A5
 SzRiikoVNHDaimp08ghFCuy7+Y1otePAeVQcCkLPDmqoW/Fc95cb5oPBcCu+GiPomAt0uuLcjKB
 MMc6wRlCEY17Vei/UoRV7jDWXRFRwwYCx3iF7TreAHGVcslyEux6BmRr3++HcmYj62vk4a6AS3o
 f6DWPUvXcSnUrSEVjrBOIaz/rqbwUtx2btqIFQj41IIL0zAZfAj8CIuwvhXMHg3EWrInO9bMl1c
 kbqxWLT/uewZ9xUV6IhBVVjlgMFrfyqLeTNYYFkPZ3J4DQLUM/DZHF0u4oFFwgASdgUB4bqjegm
 VgrC5MMizZ790T1a0nVABJkgepcK17AKr2o3gD1hXhhQpKreP6EltcbFy3Xs0WRdz/hTCtm/zR/
 DD5puptHAoSPc0g==
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
---
 lib/igt_kms.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 110 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6392999bb341..6f2a8abbaf7d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,10 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+/**
+ * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -7726,3 +7730,106 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
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
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	double timeout = igt_default_display_detect_timeout();
+	int i, len;
+
+	if (!res)
+		return NULL;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[IGT_KMS_CONNECTOR_NAME_SIZE];
+
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i],
+								       timeout);
+
+		if (connector) {
+			/* We have to generate the connector name on our own */
+			len = snprintf(name, ARRAY_SIZE(name), "%s-%u",
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
index c520f3b80e6a..9b8095376f98 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1305,5 +1305,8 @@ double igt_default_display_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.51.0

