Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498CAD2D8DA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19F088735;
	Tue, 27 Jan 2026 09:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJv8p5Lq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B922310E500
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507200; x=1801043200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VnxDstIOpc0/ucAftDEaaksVH1EQwXOeP+vm/gTe4IY=;
 b=iJv8p5LqVWC+peSKV+ah3zQ+Q2Tagc8nj4q9xd6clbJ0TJtN0d+jxdyU
 0aVPl1Kputs3J3St4aYHSXsf7Tv4E0Q8VBXUXKoqjdg4Rgb1OxYc8wIEm
 HKK/FqkOLmMVqSMdQt9T+kokkZi+I5NfnpkTFKLX+pKrBlOB0Ue4hITbP
 mZAxrIyc8OLU3WcDHMAJSTGpCYTpaPInzBaO3vKIVP8ABDBQI1wdSxc7P
 DZOLUWGq/uiN7sG/Hofs5IRBkFNhzvsSnPVZWHlq+ynnYdRImEzDzI5GO
 66mNGZuvdHjVYQUgpd6c71b28NKJn6Xh0hMxlxKGNTKJlqrOJl16YliHE A==;
X-CSE-ConnectionGUID: fMRCbTsLRVeAGEdGsHu2PA==
X-CSE-MsgGUID: n5lY7HdDS0+xCeofZjncww==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420927"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:38 -0800
X-CSE-ConnectionGUID: I9t9Us1uRpWEVK4otYa01g==
X-CSE-MsgGUID: FDpn7SAMSxuYH/gsHCTRJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172672"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:36 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 04/11] tools/intel_hdcp: Add helper to set HDCP
 properties
Date: Tue, 27 Jan 2026 15:12:50 +0530
Message-Id: <20260127094257.572736-5-santhosh.reddy.guddati@intel.com>
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

Add set_hdcp_prop() helper function to set content protection property
and content type on a given connector. This helper handles both enabling
and disabling HDCP, and supports HDCP 1.4 and HDCP 2.2 (Type 0 and Type 1).

v2: Refactor to use get_hdcp_output to avoid code duplication in
getting HDCP capable output. (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 2b38c8cf2..e9f160045 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -57,6 +57,44 @@ static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id, bool *
 	return output;
 }
 
+static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
+{
+	igt_output_t *output;
+	bool is_valid;
+
+	output = get_hdcp_output(data, connector_id, &is_valid);
+	if (!output || !is_valid) {
+		fprintf(stderr, "Invalid output or connector\n");
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
+			return;
+		}
+		break;
+	default:
+		fprintf(stderr, "Invalid property value\n");
+		return;
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
 static const char *get_hdcp_version(int fd, char *connector_name)
 {
 	char buf[MAX_HDCP_BUF_LEN];
-- 
2.34.1

