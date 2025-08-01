Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8559BC87FDB
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 06:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F87010E819;
	Fri,  1 Aug 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWNe7tLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC23510E3C0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 06:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754030936; x=1785566936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k39p7UblZ1bGMEfpn14SNDA5y2m38mbpgjWIOF1rgVg=;
 b=HWNe7tLfmqDsHpUoJV/c2wx+BlYsrV4Vzb1wA2qKwwGrBDo7kxSNOiNf
 J9e63sguTKYNymuEY7SlXdjdNEV8esNkW37MENNXpa+OHkYxTuorHe08y
 bfrRMd76jyZksciJHFQPrSoyIxKbU3VGyh7pZ2KB0EmHowYGjN8mrGi3a
 GwPeOk3V1/p6JAXhd19hIXY7ZfUYKHk4e7sFDR4MqR3M8sKkg694yXaZV
 KD5iWIOcQvKKIHtU+C6VpHAl8ODnyqo+PyKsJF1DI74Js8nP2OfU1E9Pw
 UHAqqYA09K+8WtqSlsGVW9aWJPq4RlLODbbONZ+C9kakGnuvdMMsD1chO g==;
X-CSE-ConnectionGUID: 5LVS14dTRdCRb0fQuGye4w==
X-CSE-MsgGUID: uQy3XhQXRd+DRf2IOaZi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60014048"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="60014048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:56 -0700
X-CSE-ConnectionGUID: hnWGOg0XQm2IiKqWJ+sPtQ==
X-CSE-MsgGUID: N87HRjzrRnGly1sZOxdptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168766702"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 23:48:54 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, mohammed.thasleem@intel.com,
 ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 3/3] tools/intel_hdcp: Display hdcp status in
 connector info
Date: Fri,  1 Aug 2025 12:17:01 +0530
Message-Id: <20250801064701.911143-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
References: <20250801064701.911143-1-santhosh.reddy.guddati@intel.com>
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

Add new function to read the current hdcp status for a given connector.
Improve formatting of the connector in the info for better readability.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index d9496050a..65895fbed 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -98,6 +98,41 @@ static void set_hdcp(data_t *data, int connector_id, bool enable)
 	igt_output_set_hdcp(data, output, enable);
 }
 
+static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
+{
+	igt_output_t *output;
+	drmModeConnector connector, *drm_connector;
+	uint64_t prop_value;
+
+	connector.connector_id = connector_id;
+	output = igt_output_from_connector(&data->display, &connector);
+	if (!output)
+		return "Unknown";
+
+	drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
+	if (!drm_connector || drm_connector->connection != DRM_MODE_CONNECTED ||
+	    drm_connector->encoder_id == 0) {
+		if (drm_connector)
+			drmModeFreeConnector(drm_connector);
+		return "N/A";
+	}
+
+	drmModeFreeConnector(drm_connector);
+
+	prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+
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
@@ -136,7 +171,10 @@ static void get_hdcp_info(data_t *data)
 	}
 
 	fprintf(stderr, "Connectors:\n");
-	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
+	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s\n",
+		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP Status");
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
+
 	for (int i = 0; i < res->count_connectors; i++) {
 		drmModeConnector *connector;
 
@@ -149,12 +187,14 @@ static void get_hdcp_info(data_t *data)
 			 kmstest_connector_type_str(connector->connector_type),
 			 connector->connector_type_id);
 
-		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
+		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s\n",
 			connector->connector_id, connector->encoder_id,
 			kmstest_connector_status_str(connector->connection),
 			kmstest_connector_type_str(connector->connector_type),
-			get_hdcp_version(data->fd, output_name));
+			get_hdcp_version(data->fd, output_name),
+			get_hdcp_status(data, connector->connector_id));
 
+		free(output_name);
 		drmModeFreeConnector(connector);
 	}
 
-- 
2.34.1

