Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F35CA0FEC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8708810E199;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kwgyEsdD";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8EC10E18D
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 132FF1A0D6D;
 Sat, 23 Aug 2025 02:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF8D6606A7;
 Sat, 23 Aug 2025 02:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38C641C22D3E4; 
 Sat, 23 Aug 2025 04:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TYMpVtlFdaLAJ7GNzeVwQRXimc/qPAWcNcW3F9vKbYM=;
 b=kwgyEsdDjAXa7pCBxO3UV/i6kMAnAS20CNOJeWuq/NvWekHq6JzXtTLqoJqvM6yOPO1OqC
 sgXdLUTIn9A0Qf4Uh3EpAu8uK5P5EdhkmWnuTXiuQivnhdYm3gCRU63P3I17vmj5+Pd6kg
 NPIlWyavhKA0LnMZXrce4eJu30L3bsPYUEoD0jdyLneU6N6+rt70sWgu5PRmZ9CCM936i/
 DfYdLz2Q26uzJCq5ktfjHnDHpOGV4NweyZg5JaYQa1L9XsnXmwQxWu4DG2wy0DlNPqe7mb
 4NDm3d10wGHPZCFD/X/8DgTJPMNjOd2pbaJQw4krkT0rhalliqogRsKnjMstbw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:24 +0200
Subject: [PATCH i-g-t v3 04/29] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-4-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4832;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NDIdEMj+s5KWhGXscqSXDNR5UKzjVBn5lDXv/onZ7hs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNSy6kLbpMKod7fTGm9VrJK+ptv4ViSCOD74
 Mdr3FDSvUOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUgAKCRAgrS7GWxAs
 4o8KD/0YGXy1dOQrFiCQFs1o40W9fXKDd2gmbIhtYpnlD+F7fSSyrYDHfXX4h+25sUABFW0kle4
 C8YqkV4eo0FdOKCt4ZjauBrXRo03XrotZ8KOp0JDvnjwpoA5gZSQwzZ/moIYOBsuUPsRv1TsC0W
 Fhl01/abSLmg7s+KWnz5foKONG4ESMGZSuw2bicrNoVY447X3Tr3FPiDPytjQv2j1s5FFsbXUnR
 JEN6ITi7rthG82p/pULQ1W0FCl+98GooJmsDQHkhdzO+Xzo/e3Pph19vPhTTfBAcMoi39LyWYCn
 LDxC6gN8UfnoM/XLZ7grWpC7/NgZF6vRut0pcACYk+C/QxFipEv88HUNJE/tLdx6IHjRxdrpnFO
 OdzwD/F9c4V4EpQO1aUv1Ds587zlU1W+Ckzvm/QOBJi+vZ+N6o3lOPRKQBenRKk67nbC0hbSDyD
 15h2ZVkhdvxBE3U0kj0fQVLOtCi/z7/i+NkN4DMY/M2rNsLyJAjqguQAUMxDqYDI+JWRtHLN3zf
 uttzxp3vdGzH0vpXk2Qce1I3k9feyHjQpcyOyLNIg4eJRh/r+jzuQ89/3Mt/jyjdqzBf49dsXYg
 go3NhQ6lSZS63zOQvdNLHFgXLbbyeVxPr2kBQX3/+sMSnkb8tfEMocjlTdmUXPfNtEuzz09XoEq
 L/nM0KM2+155YLQ==
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
index 3109882461f2b5db83286503444cf06c907fd9e3..f560fa5d540c5d610fe59a89001f3373d0a6ae47 100644
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
 
@@ -7678,3 +7682,106 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
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
index 6609b6ea2a5707e198379818ffc12de852380c07..1d89061d80f07d11e5fb8d91265b8c38b27a0c2c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1302,5 +1302,8 @@ double igt_default_display_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.50.1

