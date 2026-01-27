Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163FDD2D8DE
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87E710E501;
	Tue, 27 Jan 2026 09:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7adrcwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999B010E500
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507201; x=1801043201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4w5y4vUd9auxZlcHojJz36BDA9c41NU7E1NowR2K2t8=;
 b=O7adrcwrYcNMO7VI9NFZ2xWbV2wXXHy/HpzzdzthbYqla4k6Z/Rl/Dc7
 i7xot2gFCx6UJk93ZWDn3N4Y6XXSmLyuXdpGH36/4P8NYRFnzRwrXtBha
 rWZPRymEHwrcNdYc/SLf+nMRC09OywAj2f9jLDUHIQYxGVij94XnDO0Lk
 aJke7FQhc+2sz43qndXTyINDwEdBjX36INe5M8+5u0PqIoaz2/7LynTPl
 4eD2Z1Cj+7keO/gffSGHK4K+Vw+BGPcASg7OGDgpjRupC/KHhLuU7oGE1
 ZJBqzrxyzDTMQ3PAMil1ZfXG76LLysvJASrrb0kXo6Q4Ckw5BgcMooajd A==;
X-CSE-ConnectionGUID: YXYoodO1RgG21DU0FwKNMg==
X-CSE-MsgGUID: Yl9QRa1aRfiWzIziukMYxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420932"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:40 -0800
X-CSE-ConnectionGUID: LEXI5bA5Qg6QR7FHJfxg2A==
X-CSE-MsgGUID: Nap8M/6iRFyleZEWhd84PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172679"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:38 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 05/11] tools/intel_hdcp: Add helper to get HDCP status
Date: Tue, 27 Jan 2026 15:12:51 +0530
Message-Id: <20260127094257.572736-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
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

Add get_hdcp_status() helper to retrieve the current HDCP status
(Disabled/Desired/Enabled) for a given connector.

Refactor to use get_hdcp_output to avoid code duplication in
getting HDCP capable output. (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index e9f160045..b69ce6c45 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -95,6 +95,29 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
+{
+	igt_output_t *output;
+	bool is_valid;
+	uint64_t prop_value;
+
+	output = get_hdcp_output(data, connector_id, &is_valid);
+	if (!output || !is_valid)
+		return "N/A";
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
-- 
2.34.1

