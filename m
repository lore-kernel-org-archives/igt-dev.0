Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14285D2D8D8
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B610210E500;
	Tue, 27 Jan 2026 09:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM7T/fA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DA788735
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507199; x=1801043199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9H/RU8B8Eew098TC3ACyXDtTzQ+m+BrHgL8rkXdaqmI=;
 b=bM7T/fA85GosywaCCQd4iAWGwwgYY6CZJ688kl1hhH/1kLIW9ie/5wq9
 nmy0yZmTL6ZxqJS7AP43vBuNNLworTzLfjWqAzzWg2N5beQ+2Y44u+kex
 wN8CE3HlEiQr+ckeHI+/7MSvNwUIj6e6lZoqkVqwj0qou8yAvdBGT1GJl
 AsxTkRy2eAK1n+TT2Sx2u3+8vIbK9RHF50vSfBXL6WPdr36/J7HaBUe71
 qmPVIJ1viSC/1qNBRhPlXyQ9mFt+CN9yf21fcMIAOeV1/OyhJGNb7yML+
 q00u5l3Wo3aGLcNtVC5MS4+nhGtf8lKTuYJllO0C/d0NdRLbbTXgpvkEg g==;
X-CSE-ConnectionGUID: NKV1BgjTQh2LOmzoWhCeUg==
X-CSE-MsgGUID: tpxtjfMkSjaPtIK2zPS2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420916"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:33 -0800
X-CSE-ConnectionGUID: e5U1HmwASzCXPRDwDPNnPw==
X-CSE-MsgGUID: LMmAA1sCTpybxID+nzmqlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172660"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:31 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 02/11] tools/intel_hdcp: Rename variable c to
 connector
Date: Tue, 27 Jan 2026 15:12:48 +0530
Message-Id: <20260127094257.572736-3-santhosh.reddy.guddati@intel.com>
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

Replace variable name c with 'connector' in get_hdcp_info() to improve
code readability.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index ae2520b03..6ca067b41 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -71,24 +71,24 @@ static void get_hdcp_info(data_t *data)
 	fprintf(stderr, "Connectors:\n");
 	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
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
 
 		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
-			c->connector_id, c->encoder_id,
-			kmstest_connector_status_str(c->connection),
-			kmstest_connector_type_str(c->connector_type),
+			connector->connector_id, connector->encoder_id,
+			kmstest_connector_status_str(connector->connection),
+			kmstest_connector_type_str(connector->connector_type),
 			get_hdcp_version(data->fd, output_name));
 
-		drmModeFreeConnector(c);
+		drmModeFreeConnector(connector);
 	}
 
 	drmModeFreeResources(res);
-- 
2.34.1

