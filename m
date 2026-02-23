Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C215AEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6950C10E383;
	Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OJuyMs6Q";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413DA10E377
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 34B041A1170;
 Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0BEC85FD43;
 Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C755110368F7F; Mon, 23 Feb 2026 13:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/JtPW2vQ8RspjWfmyP+ukU5WZ/rbKeHsLWwwoBPru3o=;
 b=OJuyMs6QY+eMgTctUPkBgdh710mf+bptVJTXBXRWE78c2/cTfUvoy6FrdizFSPTH8zr8kb
 lAorrBRszM2u1Jv+cidWgXJcCzdBdIVl9whPAmCv1hc4k6kwjFVFRtX5G1h1YG3SeP5FNi
 MDCyIO1gTrv7q/1z6VpcR6tMWhH+oNb5qBs9Q3kIe8VEv3kfa6RrUAS5Fly7z8yn3gVF8Q
 w/RXHUQ9UIzLmKq6FOXCMAF2ToVXZ0Yh0rFVrjoK+Ecm2wMPNnXKPaPNIq6HAbBFESgawH
 WnJ0OWf4yUhv+zV0WtKkPH4RyVB0r+AviKZU4ZDdoDlZ7xJ2eoWdQMew8IgvFQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:11 +0100
Subject: [PATCH i-g-t v7 04/48] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-4-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4853;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NDB8bP3o5nhhYIjuNhD9QbcXnttt5R81lsuRWp8U43I=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENmvAcuasr6UMjUrPJHlc5oHTG+nvzlrNC6d
 IiPUjQLNvmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI5Ug/9Hsl7Ul3M7Kvw4eyAyaQFAgsCK8pb5TH
 aM2HW9YaQNrJA869AnkBT+lwaRKqSQGLs5R9ND60a0/xx0G4Ss+vRrEBg+dZGiEGxwLLVz2fSsB
 hP1TifNvxPF6Q6BuqvMioYprwF+eyaMqgpv+SbJrlfBE5umspFLByNGOepbiuj/J4hjSUW0FwQ7
 d2PZO7CwRGWCVcW1t0c4mBgYGd0jQ8QzG19TM1FNeA4Ro5QWOhWUYJNDxNqpsyb37ABhG5d7tBS
 4XRAN8KfRpAnzbh1KimP2EWDrtdA5mOgQpKfPUZFFl2QsmWb2J7a7GnCqDzIOvx37vIyjOhL9eG
 hXdwt04J5Cyuo1jd5xCZnpeQ/1E0xeG037VYgAq31vJfqg0wLV0hJTYNT0i1DQolsQMQqEkySNS
 oPNTCwpcrpi693YCoFz7KGnoWuNRco37Qblcf9n5hIaX/A+gQlmXREUjwhO+8gdsEq/cphOvOXk
 FsFZMoRX3IHTgzTY4wvp1WJ8Muw9JiVwfVQ0IwyT8zUMo7F95ofl5Y+vMnYkDUjd0D/GK83G7np
 lwXcTNVlIlwrNLhsomDxs40Zf0nVlZ+zn3bq786xstgsUNX8YARy3IoT0vdvL6WiO8xmR29EYqE
 GFwP4u+0AYrVB/iyzUPUdHLQ5Jl4ODV6bwOU2lWnKupk+l0Jphh0=
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
index 1f9f30f7d8b1..8876ee8a11f7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -95,6 +95,10 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 #define MAX_NUM_COLOROPS 256
+/**
+ * IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -8062,3 +8066,107 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
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
index 86e0235728c4..52b62252683b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1322,5 +1322,8 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

