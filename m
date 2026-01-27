Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F2ED2D8DF
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00F710E503;
	Tue, 27 Jan 2026 09:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mG1wKy3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66A388735
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507203; x=1801043203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHV8i+H7/vkuK21xjajiSJ/e3XOBsvY/2N9VWrSmdmU=;
 b=mG1wKy3+QlT537hp13pb6leR30gRKmNmn0KGgINk155UJYBsQP05yO3K
 HoNpWG4P3khKMgKiaaEaP4LGA4cSJrB01rvrzWhap1tSS6cM1pBqqYVMO
 6tWVhme8KGe83jaWhYrU1kHJTc9mPznR8eYcxYDas8aO6b4XHHWzpccet
 wqech3Gh2as3+N2tHCnh1RlOBDKidJ+dFEbT71ifd+wI1FwhZZYw1kZ1+
 8Ez3yQXc8TTsQ5ixDR35QyhnspT4/bMxwpDUttqDtQ075BpmWEklr0SQF
 TeMO2vJuYMMyi8BNtu//1Dc/uLxbM5CCHWZ7adO5Kfy9uCsYjBHfD4HLJ A==;
X-CSE-ConnectionGUID: Aocz562XQCipuEiq+uRlTA==
X-CSE-MsgGUID: KXbags7RTdy1WCwYGCh1KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420936"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:43 -0800
X-CSE-ConnectionGUID: UYnSuDMaRaWSUgCoQ1qjSQ==
X-CSE-MsgGUID: 65BvBDu8SquVVx9q4GYBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172685"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:41 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 06/11] tools/intel_hdcp: Add helper to get HDCP
 content type
Date: Tue, 27 Jan 2026 15:12:52 +0530
Message-Id: <20260127094257.572736-7-santhosh.reddy.guddati@intel.com>
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

Add get_hdcp_content_type() to read current content type property
This displays Type 0 or Type 1 or N/A status for connector.

Refactor to use get_hdcp_output to avoid code duplication in
getting HDCP capable output. (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index b69ce6c45..db97ea0c5 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -95,6 +95,31 @@ static void set_hdcp_prop(data_t *data, int property, int type, int connector_id
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static const char *get_hdcp_content_type(data_t *data, uint32_t connector_id)
+{
+	igt_output_t *output;
+	bool is_valid;
+	uint64_t status, content_type;
+
+	output = get_hdcp_output(data, connector_id, &is_valid);
+	if (!output || !is_valid)
+		return "N/A";
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
 	igt_output_t *output;
-- 
2.34.1

