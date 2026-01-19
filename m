Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72647CCF2F6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8210E430;
	Mon, 19 Jan 2026 12:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6e2U5h8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325A610E430
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826116; x=1800362116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y8T42PdAvMArDhpeNHXxzqxNoOpG6zmgJP+aRKUfp6g=;
 b=A6e2U5h8pD4bR2mdaN5ImfAjbDeWpZuj+tdwo+w4XCvtvYMkVk/YIU01
 mYh1Xe7oOxMAMxxPwuf82uzLmRglYoU+i4v32/bWf1cLwFPbGen5iS7iN
 Gp5EOeGClaxwjDChSC4td1W/P3eIwZUzytVuJGC9lnf1K65XfvzeQV6JT
 3pYkouUplsdfn2TD95wStEjvZfOzAm1sXkJpVOnf7pPMo9nm9oOZvWHhn
 scKf6LKs2sDgt+szpTSF7L1XpvuX/Yra26FqnBEMtiTdh+yh65MGEFbQ4
 7V/K3UcP8aThWL+jgmjMFkxPOzCLe9cZSzVfcEWHGXNy/dFic7UwuxIPF g==;
X-CSE-ConnectionGUID: Nd3sd1mIQiy8FmpUhQQa4g==
X-CSE-MsgGUID: K75bFU4WQiK+UpOEKf331A==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769791"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:16 -0800
X-CSE-ConnectionGUID: vEaoex72SlGZYLzI42Wrtg==
X-CSE-MsgGUID: Q36cZqjGQVech/EuDe/fxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211466"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:13 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 06/10] tools/intel_hdcp: Display HDCP details for
 connectors.
Date: Mon, 19 Jan 2026 18:01:38 +0530
Message-Id: <20260119123142.504623-7-santhosh.reddy.guddati@intel.com>
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

Display detailed HDCP information for connectors

Add support for displaying  HDCP information for all
connectors in a formatted table:

- Add get_hdcp_status() to read Content Protection property state
  (Disabled/Desired/Enabled)
- Add get_hdcp_content_type() to read HDCP Content Type property
  (Type 0/Type 1)
- Add get_hdcp_version() to read HDCP capabilities from debugfs
  (HDCP1.4/HDCP2.2)
- Display connector information in a formatted table with columns:
  ID, Encoder, Status, Type, HDCP Support, HDCP Status, Content Type
- Show 'N/A' for disconnected connectors or when properties are not
  applicable

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index dbedc60c8..b96fc570f 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -191,7 +191,10 @@ static void get_hdcp_info(data_t *data)
 	}
 
 	fprintf(stderr, "Connectors:\n");
-	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
+	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s %-12s\n",
+		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP Status", "Content Type");
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
+
 	for (int i = 0; i < res->count_connectors; i++) {
 		drmModeConnector *connector;
 
@@ -204,14 +207,18 @@ static void get_hdcp_info(data_t *data)
 			 kmstest_connector_type_str(connector->connector_type),
 			 connector->connector_type_id);
 
-		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
+		fprintf(stderr, "%-4d %-8d %-12s %-8s %-20s %-12s %-12s\n",
 			connector->connector_id, connector->encoder_id,
 			kmstest_connector_status_str(connector->connection),
 			kmstest_connector_type_str(connector->connector_type),
-			get_hdcp_version(data->fd, output_name));
+			get_hdcp_version(data->fd, output_name),
+			get_hdcp_status(data, connector->connector_id),
+			get_hdcp_content_type(data, connector->connector_id));
 
+		free(output_name);
 		drmModeFreeConnector(connector);
 	}
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
 
 	drmModeFreeResources(res);
 }
-- 
2.34.1

