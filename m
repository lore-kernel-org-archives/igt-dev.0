Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0A6F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707AD10E5B4;
	Mon, 16 Mar 2026 16:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xJWKTyQx";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4B10E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 99FFA4E4260B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 70D805FC4A;
 Mon, 16 Mar 2026 16:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C6B81037220C; Mon, 16 Mar 2026 17:23:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=STczcMVk0JCqbGgtFjZji1Rze5+NL+qkw6bbV45a03Y=;
 b=xJWKTyQxYc1Ntdtd1urowwnQNubHZ4G8xRnhX7RMmFapnOC5VRYQO53TSriSMToZKgIQPi
 H8MMzVXALJKXyZ2rybJ6twn0foGnj9uALaaCryADUV9a3QSkWaBx2+X0zOZSABOOOAMxDS
 66zsEOdFZ26LhP1qnEUcIvrMSsNzsi7iPeBudCEPF4jmkFAkwE28F2IF43+fkIEyu/VSIt
 0o6irhQySKn79xLyRyrM3q7GStml3JgZ4SgzVsfs6XxWbLCM6p7OPypABE/2ZVa3Si+/GL
 q51B/HgO2HhSyjui2PXswEGPm8DUtD/RgWWidFHWDTjue710MOOBfyOEdOXCow==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:25 +0100
Subject: [PATCH i-g-t v9 04/49] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-4-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4853;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rf2J+XcjbZ5kIHDejR76RZXeKXK6Z9SZnxTwhy893qs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6JROOoUsJmfOZv/9RwBaZYgwsN0q8LoS03Z
 qJbgi507rmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguiRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKltQ//dQ48IeGhWBBavz9OnXV+HbCziBeDD2j
 vtDPBzcDeFKerLAgyRToFOT8iIqLJjcI/isN7tn/Cgh8HrFbAn35okUkAIW3x+d+kSDCo93M+9q
 9WtmL8Qq9G3tCC0YvNEMAxqGR7joNAi6AirmbfNtUL7DUDH1YOHqa4DQRsyg9oMxVLhdOZvcG/W
 pwhHEQHcUtWj7Jku85GyhJjShmprrHmeuJg9Eb4p7vZvZOp6z7pG/S+xZ5PyOk6R573U1IideT6
 3GErfNBomEYh/pmVrRBO0Sv3KAgquYA9UkvVfSr5kAZKy0kHv325tGIFqwA7Kkwh/ZjszNipie4
 Tl5fpFh3KJxC3VIRmVlh/5HUVYaW6NcK67scRifimYzZSRTx4fhngeNpiA68Vb6K4DK01/Q2ZDS
 GPfbhonh7IfSTA6Qc4mYI5TE4SULshOQNpZWrLjQeWMy6V1Dvn4Y4RDvOaPbT5pxdxXGPqEh5ZF
 gjHFb9gCjiFC6mlw/qHUyHlYEGqj8hy8RtaAjEqxfqAWGFA/Onz8Rq1VlbroY5TvvPMVo9gc60R
 ywPChZB3tf/n5TTh1grH00c5OTZzT+MUSSC71aLSyQZs9TOnVbCO2KW5TAKrydFQ/d+CH5iVMx5
 neyirrKqD++IcZYc/8OUblFhe7TjhTfHA5wuzINn6hQb2lKIxoB8=
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
index 72a38334f921..f0f27ccda9d8 100644
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
 
@@ -8214,3 +8218,107 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
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
index 4efd40a3ad08..0095d9610e42 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1304,5 +1304,8 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
+uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

