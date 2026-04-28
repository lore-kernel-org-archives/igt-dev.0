Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005ACFF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04C810E2C4;
	Tue, 28 Apr 2026 04:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/AWy8vY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1907110E0EB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351627; x=1808887627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IkAS9WHxDx4eQXOZ6SDJ/RI3XbdEQM9eJyHIK0Eir+Q=;
 b=n/AWy8vYtevuh1unX32H1PRr+TrTceLziWh0R1fEjoaSFCO6me7w1Yc1
 54HY+2rTcFssCrm0PA+kuvyhEbcrhSdEJA0zcQd8BBcvZo3429QY71i2b
 mAd7q2BS9983stIpKjwMgqrXKc/dRUgU6N5rtIS1Gv9l3pgFfwBJY7xUV
 9q6UVO2k/o1kb90Hp7/F1O7DcdwVGr1GroMlhqQ6yqXy4LuDtTMTAMp/N
 YTRTO827jzIdE6bHqhBByH0gbND6UsM12bWWXcvuNsU0Wvrpfm3SbeBsB
 AOI7ZZegKd3tpuU6E76JT0iMIT9aOFYrdG1eeau1f+plIwjiFP0/OkE9t w==;
X-CSE-ConnectionGUID: +yEyFrvaRU6W6ybHmQ/abQ==
X-CSE-MsgGUID: ObV4r862QOycN6SADw/cUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167793"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:07 -0700
X-CSE-ConnectionGUID: gJVly6bxRAulfCkKRzcuEA==
X-CSE-MsgGUID: kJ3+SUoERLqvJZO5d+D9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706570"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:05 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH i-g-t v1 04/25] lib/igt_kms: Add helper to obtain a connector
 by its name or MST path
Date: Tue, 28 Apr 2026 10:16:13 +0530
Message-ID: <20260428044644.257001-5-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

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
 lib/igt_kms.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   3 ++
 2 files changed, 111 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2ae283e93..aa086e96c 100644
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
 
@@ -8318,3 +8322,107 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
 
 	return connected_count;
 }
+
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
+		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i],timeout);
+
+		if (connector) {
+			/* We have to generate the connector name on our own */
+			len = snprintf(name, ARRAY_SIZE(name), "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+			name[len] = 0;
+
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
index 71d77a3c2..bc921f4ff 100644
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
2.48.1

