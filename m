Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F527CCF2F7
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8AC10E42E;
	Mon, 19 Jan 2026 12:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVX79GdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9080310E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826107; x=1800362107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RpaG5uZxfgwnGTHUzY9O9UjmSTXowDGPQNLiQwSuK8w=;
 b=JVX79GdRc7qRjGrUnNBYH3Y9FkHLFj4JH8ZLa1R9p2AivPKPGXxhGsEO
 SwDDNRdDDO2qlLLCm6u4e01jUqt1SKEaMKNrzxyphIUS6Y9IrYuo8g2cC
 vZ6h6WFnSTJbpFopHCMgbcRyUgNJYwQjVhZQZ2X2H39nm4g+eQ6n9gDtY
 +O3owuoqZUjtmjPrbLK2xfalH9hbRboJkHjs1dJnaZLMTi6NH8q6Myyaw
 Uuxs+Jfuvfahwwv/bEFMnp8zA5HB5Uvzrs+LxD4TcTAqMrG70fLs3mJjM
 ktSuy1hL8sazEHTUNcmVlOar0mGp2XFFkYlkGvE3VC+gY6Jho1p9LehBd Q==;
X-CSE-ConnectionGUID: vMPyui6RR463mfhgcHkMSg==
X-CSE-MsgGUID: /a/BPXxlRkGvQGQrcGwiCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769779"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:06 -0800
X-CSE-ConnectionGUID: 5b29SA4LS2eOdAh2wbpHRg==
X-CSE-MsgGUID: fszQQBr7TVKOrWEbvw4AOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211434"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:04 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 02/10] tools/intel_hdcp: Rename variable c to
 connector
Date: Mon, 19 Jan 2026 18:01:34 +0530
Message-Id: <20260119123142.504623-3-santhosh.reddy.guddati@intel.com>
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

Replace variable name c with 'connector' in get_hdcp_info() to improve
code readability.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
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

