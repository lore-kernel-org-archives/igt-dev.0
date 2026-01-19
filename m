Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B409CCCF2F7
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6715810E42F;
	Mon, 19 Jan 2026 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTuJPV9a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D0510E42F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826114; x=1800362114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5OUb5zsFy4yzUzJDvJpOQQjgMMMsZ/N0NBg62Nusfso=;
 b=GTuJPV9allPCVjSibyHqAb8bLpjwAGQOXVv02ihFYQvWJ/BnPST5y5Yr
 3E2DawO7Jr+IRSIbeLbD6HRszwlzfDrXGfksjg5HWiw1Kt94nlwhPm8XG
 iCAyaOyxv074bRMnvdyqNql/6ur+Xr0i5StVCB+49pywvQQTiab+fij05
 iY2x4umeFtsM7UL8RdPCzrxeaeuoZfXBnYJ5ohoe8IsKIF8blLZQbRYZa
 maFNvnxw7EkXK0d4DC8583zwxuUA5W2/jzgWmQman2FrA43Ca/0ExAEFS
 Cc7BeasIwYXxzAWJ4og99VUDlgftoy3QXI1BtigiZbduYvK8WHn+nqqVO w==;
X-CSE-ConnectionGUID: Ua6uQWszShiwBxD8zq0NEQ==
X-CSE-MsgGUID: cQqfW9vtR66pLd7HMVufSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769788"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769788"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:13 -0800
X-CSE-ConnectionGUID: a2ag1FM/R2mgofA32wMZDQ==
X-CSE-MsgGUID: wtQDTY7kRAu2xcnoPjI3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211459"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:11 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 05/10] tools/intel_hdcp: Add helper to get HDCP
 content type
Date: Mon, 19 Jan 2026 18:01:37 +0530
Message-Id: <20260119123142.504623-6-santhosh.reddy.guddati@intel.com>
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

Add get_hdcp_content_type() to read current content type property
This displays Type 0 or Type 1 or N/A status for connector.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index fcb746b6e..dbedc60c8 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -79,6 +79,44 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 	drmModeFreeConnector(drm_connector);
 }
 
+static const char *get_hdcp_content_type(data_t *data, uint32_t connector_id)
+{
+	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
+	igt_output_t *output;
+	uint64_t status, content_type;
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
+	/* Only show content type for connected connectors */
+	if (drm_connector->connection != DRM_MODE_CONNECTED || drm_connector->encoder_id == 0) {
+		drmModeFreeConnector(drm_connector);
+		return "N/A";
+	}
+
+	drmModeFreeConnector(drm_connector);
+
+	status = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+	if (status != CP_ENABLED)
+		return "N/A";
+
+	content_type = igt_output_get_prop(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE);
+	switch (content_type) {
+	case 0:
+		return "Type 0";
+	case 1:
+		return "Type 1";
+	default:
+		return "Unknown";
+	}
+}
+
 static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 {
 	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
-- 
2.34.1

