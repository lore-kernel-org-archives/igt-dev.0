Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2505C77B7C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 18:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAFB10E14F;
	Mon, 23 Jun 2025 18:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qVXaLeJb";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2710E013
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 18:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDAYiAAYBvxfLSHTCufPsweBo8ShypHm2YYXrvbiW+jTRZYCqmd2YseFypQw/kst0//NYqbEQcQ37M8MVE67WCqDMzTAICXfOnvM7hL/h8QQrsUrxhZyltN6oef06ynzoqhsWz3b35VeyfWQs1qsQrrAxrcll47pppKrLZ16DzATGYL271Y0ICT+p+RlukyEAkimJoCf9/BF2rt5aHLls7PabKPRX/QsMiIs+ILzWd86jRILdQC6IG45G0Oew0BY8KhooOBs+Fpj8iGKkNjIMYhYiJF0FEcC4xdvzybWDacHEIEgNC6SH7MhKPgAq7dj4NgtMhU7VsNfOe64FkhreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngneEZIHQFZqcmo3dMFM3/J3pkJd5/nRlyAJlNwuKLg=;
 b=DNU0gv2FdYuy9flLxRGcs1sljAsbCEZZ9iGlIogee0qGOhQj4Soecx9pCgHf+vl0u2ly5GIo48A7HI8y5sgC92J84sgWmXaXi4BpZoTHlBEQdCo9PoMkLvSYNnDJqEVWTZVMhB4SWtDl+Ljm/5FRzGMvIMgqC7digrsvUAizgfhwEDc6IWCO4ZNPXecvLuJ/feoiNbaFML9T1mPhGI0/Qhkwbw2Di+oLeiMFM7fofFFq+xthDbOQKwuWLkdezEHr9Niox19E51n0Nb/Tt16T74YKtxA4Pg4MT0J5gD3w9B8u+y48aicUtuAAJefZ/CiPk259uvezMN3aB3emWE3+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngneEZIHQFZqcmo3dMFM3/J3pkJd5/nRlyAJlNwuKLg=;
 b=qVXaLeJbGfJzpl7Jh/vJI9RHFFRkV1r+rcL1WrxP/zdtwS8TY5iML0r1NqmvmW+eaBDuQ059mHVbAU+3h5rhTaLQ7qdqE1911IbnF8kUmSMayrg1IgSV+cJf9f6P1Nx0He3PIykr2ostVXHm6cMIYnG+NubYPasjBIyzoletlv8=
Received: from BN9PR03CA0679.namprd03.prod.outlook.com (2603:10b6:408:10e::24)
 by BN7PPF9507C739C.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6da) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 23 Jun
 2025 18:14:55 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::e) by BN9PR03CA0679.outlook.office365.com
 (2603:10b6:408:10e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 18:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 18:14:55 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 13:14:54 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <harry.wentland@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH][V2] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Mon, 23 Jun 2025 12:14:40 -0600
Message-ID: <20250623181440.462861-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BN7PPF9507C739C:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f211b8-acd1-492c-d39b-08ddb281db0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kTm9PSJ4+oP+H984OYZcAI3unmkMWKFSPvW4gGnbUMZsJdBeyJSwIATbHzQ9?=
 =?us-ascii?Q?L50bzda4FwmQAR90zehBvo8a/mGhL1QAi7ij1X6cYZUE+VgOCKM1A3wXGNR+?=
 =?us-ascii?Q?/OT3VjRMI5f1orMLZKQJppElG5ybwVyGgZtMWM3T9nNnt2c98TRyzZkI+ccu?=
 =?us-ascii?Q?fKNdcey60iAheEuB6GvQ6BnGsR/JPHeqlTvypoFuJyxlLvfbgjYONKoZaZWA?=
 =?us-ascii?Q?EON2N3BWiETTxKjA3S3oNjpLWFxrUSFOMQtN7JXBDqC/OGfpBkq+C7vZY7QN?=
 =?us-ascii?Q?2TCJ4yEzHwm1I0fHRSJ8M04PIPo5Gwvzo8IrauBrW2d8CeDfS6YbFsZy6f6C?=
 =?us-ascii?Q?b1SPd4xbngVUkyN5Cz30KG7XKPl0CHGRs1mfkXu6hrOMaGDT6B64oIGxPrEx?=
 =?us-ascii?Q?kmYaqF1yyaxh8nodpaQS/bq0xmUWWoAXJ08HWc9WirMzaC0FzD3t+Z154EYh?=
 =?us-ascii?Q?gyTQ3QmjSH2vGOTUyzlTNYb/s+GgkCWg86dU+kXpAqD6O+OdfZlZASkQU0qg?=
 =?us-ascii?Q?y4PxsGkxxLy8oC/FA28GsuvvshyVBgHclz8Cd1zNaqPdZ4ukXrq/0Z2i0KqK?=
 =?us-ascii?Q?Vmh0jo/Ob5H2qNyr/tXsOOrqR9UpZx9LimrifTB9GXvOtWqrRTrma6PR/NZH?=
 =?us-ascii?Q?LeyVW+sWyylMNFLuDDdviLEtkWMAB+n9bMi+PsGgZccPD3QDHv4MOqEe+YK1?=
 =?us-ascii?Q?cfVg9ZgzwVJyFikFfiPuXhbAiKg1motgk9KMYznw6L3/XWe3PfNMQ+Srj7Cl?=
 =?us-ascii?Q?6oMrCJwK4zsw9DJZar0Cw+DztUcfbD4KPi0zF7kQFOKOizNpcYDS9OZsR7lh?=
 =?us-ascii?Q?LImuGGrzoIfh2LM4wMU7ZEuU2/2YelXS9qtp9LNs1RPo7+1Mt7zzpSWJkr5F?=
 =?us-ascii?Q?PIJ0NFeQMfItvpoUYHBVcGSEFy5yBWuKr7V7PeJ7GdGSowLcgBKsKBqMRC2O?=
 =?us-ascii?Q?zIjKVu/Um8RfXG8grhen6w/DNRZ46KQjxJJT/GCG3BNNxVzyI3g4B3haPRbM?=
 =?us-ascii?Q?nDg9HLXlLI0DHwigncqUvnhyHAvySfgSON1gM7Yc5FcUteUtMOVbAxrWVhTp?=
 =?us-ascii?Q?O+F2aOutDJZWgSFhhNrOpBOtvtj8fKD3Q5O80oHA6yUAGFD0GDvL5Kw/OXRb?=
 =?us-ascii?Q?SioQfJOl+dWXz69iAKGvnH22XztUhz+srpL/37UEd5MabCLp6OoaMRlvc8wI?=
 =?us-ascii?Q?l0aGMqYVyGbtqFMeqB1do7qY8JN59A5ld4g/QdvzO1YLaNTaZAnDZfNFSHc9?=
 =?us-ascii?Q?W61Z9oAbhxBEdFO34DdMtJvKwW58us4AdrfwPffTFdMkLAW/vmXSuKEu9e/D?=
 =?us-ascii?Q?TLdUV5diYACF9/8VmDIDiO/jVLA9m5/QHbPHZlATf94IKCFMWe6jfOG5yuul?=
 =?us-ascii?Q?zRZlpWoPsN3OpWeAy/W8sRw5/Ams78SgIHf1OkJDW6vGF19KbAHDmh+otWcr?=
 =?us-ascii?Q?5htSH10AEHLYVaXLDRuD5bC0d4L+6/gmWVj25Dpidf1b7YiFaYlzJmPsl/D1?=
 =?us-ascii?Q?IXPUW0MXWdQQsYS9fNYz3QSNKP7yXDilBeA5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 18:14:55.1818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f211b8-acd1-492c-d39b-08ddb281db0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9507C739C
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

From: Harry Wentland <harry.wentland@amd.com>

This function can be used by other tests that need writeback. A prefix
"igt_" is also added to the function name.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c         | 25 +++++++++++++++++++++++++
 lib/igt_kms.h         |  2 ++
 tests/kms_writeback.c | 21 +--------------------
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870..085c3f430 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_get_writeback_formats_blob:
+ * @output: Target output
+ *
+ * get supported formats from the writeback connector
+ */
+drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
+{
+	drmModePropertyBlobRes *blob = NULL;
+	uint64_t blob_id;
+	int ret;
+
+	ret = kmstest_get_property(output->display->drm_fd,
+				   output->config.connector->connector_id,
+				   DRM_MODE_OBJECT_CONNECTOR,
+				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
+				   NULL, &blob_id, NULL);
+	if (ret)
+		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
+
+	igt_assert(blob);
+
+	return blob;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a85fee515..09d7d4414 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 8765fda34..86afed509 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -92,25 +92,6 @@ enum {
 	XRGB2101010 = 1 << 1,
 };
 
-static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
-{
-	drmModePropertyBlobRes *blob = NULL;
-	uint64_t blob_id;
-	int ret;
-
-	ret = kmstest_get_property(output->display->drm_fd,
-				   output->config.connector->connector_id,
-				   DRM_MODE_OBJECT_CONNECTOR,
-				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
-				   NULL, &blob_id, NULL);
-	if (ret)
-		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
-
-	igt_assert(blob);
-
-	return blob;
-}
-
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
 {
@@ -621,7 +602,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		const char *valid_chars;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		formats_blob = get_writeback_formats_blob(output);
+		formats_blob = igt_get_writeback_formats_blob(output);
 		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
-- 
2.43.0

