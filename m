Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5C4D2D8DE
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7E88735;
	Tue, 27 Jan 2026 09:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbBYUPNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552D610E503
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507205; x=1801043205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6GBstvo0nKtdT7CaskqLkwG92UH/cIRkeEmFlV4kNN0=;
 b=UbBYUPNP4QRMHR4ymdqh34v8MwdFcRBuPGf6+LuxmyZjsn6U8XEpqmlw
 dLZChYUkpRBZ+D9ctmsGz+cRtv1vwsWmNlcuVSNt6cRqqXYwN93sBeWsG
 fxkcFWe7hpRBL8W4P7E1mHc9NIEgIQH3WFHA5dYP8fMtCyRXTdPlBM1L9
 6i8sYlKD8b8AJppKyhVHNLBKJ9FPEOE/aiOnvcAxD+xcpHbBBmnVdn/Hv
 REivnj90LOL+f+9CVgeMof+XcBLH7nevobj6f2Itj4rC54T4aJoJ6EuMx
 Lbc0iVZKaKRpreR4jOeYjtaHJJ0ww6Y62y66RFV/VfugQrlNbtrG2dhd2 Q==;
X-CSE-ConnectionGUID: JvhTDoCQTwOEW0ENIpeW/g==
X-CSE-MsgGUID: pTzocb4pQgyCIAYtMEm0Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420946"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420946"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:45 -0800
X-CSE-ConnectionGUID: LcJKNYDIQ66XOM4FphVVYA==
X-CSE-MsgGUID: fQHSPKF5SGSZmMhNGS2DHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172690"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:43 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 07/11] tools/intel_hdcp: Display HDCP details for
 connectors.
Date: Tue, 27 Jan 2026 15:12:53 +0530
Message-Id: <20260127094257.572736-8-santhosh.reddy.guddati@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index db97ea0c5..c12a1b6d6 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -181,7 +181,10 @@ static void get_hdcp_info(data_t *data)
 	}
 
 	fprintf(stderr, "Connectors:\n");
-	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
+	fprintf(stderr, "%-4s %-8s %-12s %-8s %-20s %-12s %-12s\n",
+		"ID", "Encoder", "Status", "Type", "HDCP Support", "HDCP Status", "Content Type");
+	fprintf(stderr, "---- -------- ------------ -------- -------------------- ------------\n");
+
 	for (int i = 0; i < res->count_connectors; i++) {
 		drmModeConnector *connector;
 
@@ -194,14 +197,18 @@ static void get_hdcp_info(data_t *data)
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

