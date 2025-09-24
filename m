Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B10CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9F10E6AB;
	Wed, 24 Sep 2025 07:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9aPJHYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023AF10E6AB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699152; x=1790235152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhgZOSZ5e6jGyFPpzo26L+XdFnzR90qFF9gE4y5/4Qc=;
 b=V9aPJHYrBwizmfpx1+wFZXyu0KOxZWwyCC+B7Beue0ef0ZnZcjag1e7N
 wBZy4ogtf24nhLqzU9V3MlRXR0cAaS2Yqe+ctdSnmTD7JMuRietRyTuSi
 bCywkNPFN6W4xAgWufKHHLc1ZSupIzLQ+pcJ7sNKFDL92J/TUzaj+NeuU
 0Nrk4GopmhJV7O3e70qBjm0HRULmouhmHF4Lo8jhfCdQD9ZrX5EtNfPIo
 Gb0MwuuRF/xWSWucEWb2M/A9NVkejA/f6CuqWStSqxG7gjVPwJ/sp3GJq
 zzZ+lJEYJ0s/sElEBMsrmLh7xB+Y/AyXoseusS7TcSN99XAYJ0ST/JwtD g==;
X-CSE-ConnectionGUID: ls2uUx07RtiOfG408zgoUg==
X-CSE-MsgGUID: VmhfayuxT168l2XjPq2uwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432576"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:32 -0700
X-CSE-ConnectionGUID: AGboIU/fS2GmfYjkxRdGRA==
X-CSE-MsgGUID: Er1eat1RTB2DhrxYKqYGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092863"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:30 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 3/6] tools/intel_hdcp: Helpers to get/set HDCP and
 report info
Date: Wed, 24 Sep 2025 12:59:37 +0530
Message-Id: <20250924072940.413695-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
References: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
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
 tools/intel_hdcp.c | 118 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 14 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index fc3498e78..3c8099a4e 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -87,6 +87,90 @@ static void draw_menu(data_t *data, const char *status)
 	cairo_destroy(cr);
 }
 
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
@@ -125,27 +209,33 @@ static void get_hdcp_info(data_t *data)
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
-
-		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
-			c->connector_id, c->encoder_id,
-			kmstest_connector_status_str(c->connection),
-			kmstest_connector_type_str(c->connector_type),
-			get_hdcp_version(data->fd, output_name));
-
-		drmModeFreeConnector(c);
+			 kmstest_connector_type_str(connector->connector_type),
+			 connector->connector_type_id);
+
+		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s\n",
+			connector->connector_id, connector->encoder_id,
+			kmstest_connector_status_str(connector->connection),
+			kmstest_connector_type_str(connector->connector_type),
+			get_hdcp_version(data->fd, output_name),
+			get_hdcp_status(data, connector->connector_id));
+
+		free(output_name);
+		drmModeFreeConnector(connector);
 	}
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
 
 	drmModeFreeResources(res);
 }
-- 
2.34.1

