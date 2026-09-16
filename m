Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA72C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B6810E043;
	Wed, 16 Sep 2026 11:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvXVJyv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6A610E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557104; x=1821093104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJZOZ2c9ELuq0iorvON/UP+TuoY6znoSOdvHpHMibLo=;
 b=VvXVJyv93MR9znQjpBLAWTUgNMSBii+/+8YjZ+VtmoXOOKw0+QSXeQPo
 FdXwvPi0fvJ6JPIRtf8EAOTYrBCZD+LVVT/ZSn+3GqDsKC1SzZa4kwu+D
 hX9qJoocTEG/uAgOkNuiGCItRE/1NAlvZeD20Qi+fjy0D7W9l8ZAQDOpW
 W43YCsPaCwUYTMKUkDorCyF5cq4OG/2LDexClOITYIzTSsdPg6XB7YAV2
 FuMe8+6VdqExLzNl9FatrWvRxhRfxo3tI3JhI45VBK3WfhQi+lokDHnfW
 iPzcQMLgT7aTk/FatMkIrbLksS6OlDqroSjkpgDmByliRDd5ep7GsRsSf g==;
X-CSE-ConnectionGUID: K4PVUysjSn2QSXFWTKDE+A==
X-CSE-MsgGUID: x+Fpk3QXQrG68cgB06VCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440535"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:44 -0700
X-CSE-ConnectionGUID: LuCyZfHQRhmSM+MjhExwZA==
X-CSE-MsgGUID: uUVIohjnRJG0fqf/p+oJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800818"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:41 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 06/16] tools/intel_hdcp: Don't read Content
 Protection from every connector
Date: Wed, 16 Sep 2026 16:36:59 +0530
Message-ID: <20260916110718.596603-7-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

Some connectors do not expose Content Protection or HDCP Content Type.
Check for these properties before reading them and report "N/A" when
they are absent.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index c15891c777..d561a50947 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -237,6 +237,10 @@ static const char *get_hdcp_content_type(data_t *data, uint32_t connector_id)
 	if (!output || !is_valid)
 		return "N/A";
 
+	if (!igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION) ||
+	    !igt_output_has_prop(output, IGT_CONNECTOR_HDCP_CONTENT_TYPE))
+		return "N/A";
+
 	status = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
 	if (status != CP_ENABLED)
 		return "N/A";
@@ -262,6 +266,9 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 	if (!output || !is_valid)
 		return "N/A";
 
+	if (!igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
+		return "N/A";
+
 	prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
 	switch (prop_value) {
 	case CP_UNDESIRED:
-- 
2.43.0

