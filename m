Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673B6FA3728
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 06:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E6810E055;
	Fri,  2 Jan 2026 06:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5LD2jw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80B10E055
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 06:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334236; x=1798870236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lq20ji7E5G3xH843JgsWq/9meXzw5QvMl2QlDckT4TM=;
 b=J5LD2jw3oRl7V4/cCgjgvXUIIaK+clEh+lAJ8yLHFJ0q2zx9ufQgLOG8
 AZrYrC5pDabZxFsXbqf27kTkOhw4u+/o+0E3uTszkMI+ys9kOpzJnOZSI
 kFUZNpF18JFtIp6I7Fw4/pJlaB3iNjNz9rzNb3Ah1Z0Dh863Y7Kqu+v3n
 cHXmR9Zv4th6gJsDDRqVHkv3oc42vEwCASQHgXFvJTlGTkMVF+BElOaXW
 B+PKUABDqGGxoc2i/QxfOiBBsL45gxLVhD4S3Uk/Z3Oq4qzq6neK1sJD+
 mJ6jk9MOposA+npFIYPZ9o6NSwWoCCGIM4SVaoa76gg2pbnBJuin+Ms6M g==;
X-CSE-ConnectionGUID: 9mO4mg+9R96SVfbn9z3v0A==
X-CSE-MsgGUID: +DfD6139QViA5s8CpzNV/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72684665"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72684665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:10:36 -0800
X-CSE-ConnectionGUID: +47loE8uTyexTqHO/5sJlQ==
X-CSE-MsgGUID: /H8I1msQQR+PX2NYLAoHVg==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 22:10:34 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 2/6] tools/intel_hdcp: Helpers to get/set HDCP and
 report info
Date: Fri,  2 Jan 2026 11:38:31 +0530
Message-Id: <20260102060835.89725-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
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

Add helpers to set content protection and content type and retrieve the
current HDCP status. Enhance HDCP info formatting to include HDCP status
along with version.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 114 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 12 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index ae2520b03..129968b7a 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -31,6 +31,90 @@ typedef struct data {
 	enum hdcp_type hdcp_type;
 } data_t;
 
+static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
+{
+	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
+	igt_output_t *output;
+
+	if (!drm_connector) {
+		fprintf(stderr, "Connector %d not found\n", connector_id);
+		return;
+	}
+
+	output = igt_output_from_connector(&data->display, drm_connector);
+	if (!output) {
+		fprintf(stderr, "No igt output for connector %d\n", connector_id);
+		drmModeFreeConnector(drm_connector);
+		return;
+	}
+
+	switch (property) {
+	case CP_UNDESIRED:
+		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
+		break;
+	case CP_DESIRED:
+		igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
+		switch (type) {
+		case HDCP_TYPE_1_4:
+		case HDCP_TYPE_2_2_TYPE_0:
+			igt_output_set_prop_value(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE, 0);
+			break;
+		case HDCP_TYPE_2_2_TYPE_1:
+			igt_output_set_prop_value(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE, 1);
+			break;
+		default:
+			fprintf(stderr, "Invalid HDCP type\n");
+			drmModeFreeConnector(drm_connector);
+			return;
+		}
+		break;
+	default:
+		fprintf(stderr, "Invalid property value\n");
+		drmModeFreeConnector(drm_connector);
+		return;
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	drmModeFreeConnector(drm_connector);
+}
+
+static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
+{
+	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
+	igt_output_t *output;
+	uint64_t prop_value;
+
+	if (!drm_connector)
+		return "N/A";
+
+	output = igt_output_from_connector(&data->display, drm_connector);
+	if (!output) {
+		drmModeFreeConnector(drm_connector);
+		return "Unknown";
+	}
+
+	/* Only treat disconnected connectors as N/A */
+	if (drm_connector->connection != DRM_MODE_CONNECTED || drm_connector->encoder_id == 0) {
+		drmModeFreeConnector(drm_connector);
+		return "N/A";
+	}
+
+	drmModeFreeConnector(drm_connector);
+
+	prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+	switch (prop_value) {
+	case CP_UNDESIRED:
+		return "Disabled";
+	case CP_DESIRED:
+		return "Desired";
+	case CP_ENABLED:
+		return "Enabled";
+	default:
+		return "Unknown";
+	}
+}
+
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
@@ -69,27 +153,33 @@ static void get_hdcp_info(data_t *data)
 	}
 
 	fprintf(stderr, "Connectors:\n");
-	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
+	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s\n",
+		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP Status");
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
+
 	for (int i = 0; i < res->count_connectors; i++) {
-		drmModeConnector *c;
+		drmModeConnector *connector;
 
-		c = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
+		connector = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
 
-		if (!c)
+		if (!connector)
 			continue;
 
 		asprintf(&output_name, "%s-%d",
-			 kmstest_connector_type_str(c->connector_type),
-			 c->connector_type_id);
+			 kmstest_connector_type_str(connector->connector_type),
+			 connector->connector_type_id);
 
-		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
-			c->connector_id, c->encoder_id,
-			kmstest_connector_status_str(c->connection),
-			kmstest_connector_type_str(c->connector_type),
-			get_hdcp_version(data->fd, output_name));
+		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s\n",
+			connector->connector_id, connector->encoder_id,
+			kmstest_connector_status_str(connector->connection),
+			kmstest_connector_type_str(connector->connector_type),
+			get_hdcp_version(data->fd, output_name),
+			get_hdcp_status(data, connector->connector_id));
 
-		drmModeFreeConnector(c);
+		free(output_name);
+		drmModeFreeConnector(connector);
 	}
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
 
 	drmModeFreeResources(res);
 }
-- 
2.34.1

