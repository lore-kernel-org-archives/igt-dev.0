Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA854CCF2F6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D8D10E430;
	Mon, 19 Jan 2026 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgOh60/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF70210E430
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826109; x=1800362109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NedXziX15/685OEZK8QNqcMrbLoYtWf9feEk3YI1iso=;
 b=EgOh60/8z0RFM6pu+IxELUcmZA9P9MsCnaxpW2Pkt7psocJSWn5hgVNU
 JrB+G1onoPDuByskISv0l3tIhHw4vVS3WgJfQOgQbha/z3ky98oM/EN8z
 OzgPH/WFY73xyiyuNXk7g7bhiynb3z9iLA3SFO6iXPTSsFuWqDMVA+ntD
 RbbZOWxXmyLG/T/ODx0molqahGYwPSjG4xZd/n/zMCvR8EPZenUvNYOlW
 29wt4w1Y+FYKOROahTSgJuPJQP3AEJ9XaHL8I+Xkru/ays0in/O0xQMFH
 j5DY3owxoerR9PgQmffe76dv0Ad3nPmq9Hk/phFXvmlL5CNCPglVM6pxz Q==;
X-CSE-ConnectionGUID: 1DDLBRxjQI6K7oBJeAkl8w==
X-CSE-MsgGUID: okpUzt/sTSCFPWFkReXRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769781"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:09 -0800
X-CSE-ConnectionGUID: +EbxCfEPTSehFNzGXOIgOA==
X-CSE-MsgGUID: eeUT1WAeRGCS+H2QxmlAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211446"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:06 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 03/10] tools/intel_hdcp: Add helper to set HDCP
 properties
Date: Mon, 19 Jan 2026 18:01:35 +0530
Message-Id: <20260119123142.504623-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
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

Add set_hdcp_prop() helper function to set content protection property
and content type on a given connector. This helper handles both enabling
and disabling HDCP, and supports HDCP 1.4 and HDCP 2.2 (Type 0 and Type 1).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 6ca067b41..082dd98f6 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -31,6 +31,54 @@ typedef struct data {
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
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
-- 
2.34.1

