Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C83E7DEF4
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9EC10E4DF;
	Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NUbXF1RZ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E79D10E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 62EADC237F3;
 Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 949DB60767;
 Mon,  2 Feb 2026 14:32:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 576D2119A88F9; Mon,  2 Feb 2026 15:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OBz8Pyn/eCIXh1oyqajC4KtQrwjg1TRTS2S0Ci6Mdjk=;
 b=NUbXF1RZNKVkdEoKkvIhk/BBGpBWgOhP6YEd5pkpqxQU9ctTJWZyPu+aldf7wq0BNS5Mt5
 y8xA1arzPRsol1IGis/tUorETaDZHEnt/hsC+pBWKh/i9bJ3Khmh8Dt0sJi0U017jvxIbi
 uKJY7UAvObpMnXJHY/f7HUPJGTpVksK/IsJT5HWQmzxG1zahN2pvh7j9T32fgLErtcr7Vh
 RWTdRmugrKXg7yaqI20L5/sMlR7gRvir8TfcZT8D4+s/3AnMpa4iL0Aq6EP/fPY9yXXoXa
 l+OHgkSc/N+MvhUygB1wsWTYdvl8vmi/xYxyh749hWkyEmhPemGI+1g17F7ZVw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:43 +0100
Subject: [PATCH i-g-t v6 04/48] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-4-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4783;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9dj+dYpDyqB2s+e5wCXJaraCjVPnKidYl5kwUvxpw+o=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWOClqp6I6Khg53mxdosl3ZhuYIXBos5FfzX
 32isOPdmGCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKsZQ//arePi2CBH81v77tKAXkFUXLOQftOts4
 AS23UFlPFnjcS1utVsetdl5OVRd83r/hVm3wHeBoVG8T3qH2fJOCFAPy+R1LrAmu86ARs3zkYU2
 WmsZm1Zbh5ZkIttCEXttennpjrXtZvP5k09Qf4H44K3RwpKLKD2ylo1CPenq/2T7XEDUHAmJ+Lq
 86s+w7JicmtHyolnqUzIrwg8LGtZvALIGwcxVOg9Klp8PsyKWrN67nTTCHLZQGbqXJR4trBNc+/
 fkXfBud5AqEzDNsP6AKyNhz3BVbJNo30jS3pD1KVCVys7epfsWJSNKF8dSFVZXSHQ/vEuKhbCyO
 dwr+MJiqFqagqnrY54PJceYoFFB/cbhcpLfrRlizfvhPyIUcDG8imEb5s3vP9/Q9OAqYcbX2s4h
 /aZQYGY8qzcWQXshyKpC2yh27ofwQHkvHWVWoWNyrVcZ7FobZR1+kcQUK2h1DwgMCpS2qCbBOu6
 lqgmTNUqSmS04WFDDHG6arkCzxjnMi3mTBtXOvBfWvVj28xKivZVAa+hcii7m/0X9EPdB1zCcQu
 cg/ICbJF/RO3AgWUdS7xNNM1pioPGAEBeD1fJH/mu+JqgqlJ7yCXkBiQiJEINdGXXIhwTtTEfA+
 +T753lZP04e8ee2exjV+Q6jaLlYLSZvp4o+Rwy7GLoTm6lhor57g=
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
---
 lib/igt_kms.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 111 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d8910a01c17c..2d39f1cafc2c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -95,6 +95,10 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
 #define MAX_NUM_COLOROPS 256
+/**
+ * define IGT_KMS_CONNECTOR_NAME_SIZE - Size used when a connector name is needed
+ */
+#define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -8121,3 +8125,107 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
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
index e6b09c08d1cc..16324e5dfbc8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1319,5 +1319,8 @@ double igt_default_display_detect_timeout(void);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

