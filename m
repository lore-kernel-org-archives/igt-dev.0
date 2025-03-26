Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD651C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889A810E78E;
	Wed, 26 Mar 2025 23:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZP4/pqaS";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932110E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DB+QaSMILNXo2UXngJ5fr47CHS3OOs12mhE6uN+ffPUmNCxJcNo+2iR30Sv/Cfdaa0kfd9wxro42gKQIgGAZ6eQ2hnkCpqKF5Po4qOo40mfC/nU41mxVJ7HWvkWaONLzkl7nOgtzNA36Km3dCJySps9yxY7GRfdC2xP+Hr2oLS0vE/LhHm4EiYYSRURHAKRn0lXvOIepBDVcnqRXV8+zeqihoelwe0ZrXOLGMISv8j0JiJESasxjVS8vm+cJ15IFME5VZo1yC6eCLGIeOLwrd/n8i0g1xaYxYUZPo8x7iVXAXSIxv9Nll2K+uAOCdVdSq728V1hwGzlBGAQP+JetrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELJNXMOg7Z6BVe04I1zSjW2aMdT5cBnZ2BSy4+HtZFI=;
 b=dQCRtyIIANOcDP5fbMAgEBj6wF/0h3ZT65LS0DRzdgrShEQfYvPCmR8lhDZNjYecRW/trxmyweSh2MUmee19mWDrY/gVo6SgN3gWKKBdFv8of5ngLCWfG0It29n1cx30uP6NUt8YlE6t8GcA4OAUa7Jtr8ZJeY2cW7IDQtVL4o0tP7NeSUqPM5M+hW8E3awvrf+u3VPkHXkn4U9PvkuaaC6L18M1cZDdLHzafK7YP7dAmGMgaCkw5xZ5X7UrfqSwQKZo2qoEhfsp6GNUfVJecquZfYp0e0FWupPCd6qy2AmrAHopJxc9zAFUg6iWiT1gJcd+zHqJsbrj0SOzRM50uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELJNXMOg7Z6BVe04I1zSjW2aMdT5cBnZ2BSy4+HtZFI=;
 b=ZP4/pqaSvDJJ1NY5B6kSmjxFcylBPLpRXQ0SZHD1dMdx4oeGZ4sLru7GARBT+KUpqebJ/E7ILSpwNIcVwWDYqGHiruU2n9SbsZ8k2q8h9mnmm4HAFw//tvEDhnU51uMEPZmLgfFinOO5Nuv1h/e6EVioyy2MYJ8pJu9TU06x9sw=
Received: from SJ0PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:33f::19)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:40:09 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::d5) by SJ0PR05CA0044.outlook.office365.com
 (2603:10b6:a03:33f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:40:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:40:07 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 03/37] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Wed, 26 Mar 2025 17:35:35 -0600
Message-ID: <20250326233609.2980110-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 335e8c04-b879-49f1-fed1-08dd6cbf8b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G47HjncqSoMTsPgUCMJBamgQQx+gqnsOUGVKzGGctFcweE1lFGr6PXM5VjW3?=
 =?us-ascii?Q?xfG31I6Stm/PaNZHngfFHrCzbxVHJUYhdh6B78xLIos1kBiNptN4a9woMIdr?=
 =?us-ascii?Q?zcJKJ8FypTjGvZSkHCW1QosNCCu8LNpTkqQYznMUWZNahMeMQr3m4Sztkvfb?=
 =?us-ascii?Q?mTwf1wsMvxte+4A5usLMbMZK8cSNDrn4tTXOl8LoUChr2Z65T9hU1DOwT/Wr?=
 =?us-ascii?Q?CTHyYHocs5Ql/6nACstqScthDAeNlX64NgEgYDIWbwKrpwjbm5XuVLARookQ?=
 =?us-ascii?Q?Wi9F8Bg0uGkY4vBDFf13rrkMd/IbQYB67b3ceLz9oSWsyfBX+hBv41dFCHa7?=
 =?us-ascii?Q?Fq/BN0uZd63i8WyS/J+imnZKw8lD/t6PPsS1vrNMlfwRTXv4Sw2iXX9XwdwM?=
 =?us-ascii?Q?BeB2lb/jTPEc5DRDbUEGJdydSTDshO2XXxa9vBV/VIX0m9kYTk3wq5DyVC7q?=
 =?us-ascii?Q?DDR4HBHjQH6cNB4+ASgqlqx4E7UBMUvsW1z9HT/5ZVy7louxUWwDZB19dImg?=
 =?us-ascii?Q?1H0dGnqGa1lCFsKTp35wXAazuy7xhUtPmDen9cxUaEjqsee5D8rDwjqVR8zt?=
 =?us-ascii?Q?G7IQQsdmOQPyCurTHl7l6p+a1dBMLs3c54OLNVf5+v8QKkpMn2J7eW0L8BY+?=
 =?us-ascii?Q?0GTtvVzGOO735UgHdQZUudpHC8dvUG06ejHESZiJrCbWyCd4Uzstw8xeH7Vy?=
 =?us-ascii?Q?Lnknjx2W4qH/QI4TgnPFG0Q2IMdSwcBpCbp4TDZibL1FYnlP88p61Zu2THw4?=
 =?us-ascii?Q?CD/BG2rsJNR1tRbWmQ4cE4Ga2+SIE6BkQSCLAXFW0y6HsFXUGl8vZGs6a9y2?=
 =?us-ascii?Q?+3ZMQc2UuLTqKX8Bg+OHVI+9EV9M6OtjkJXEFUSOwLy8kzfNFSlineqA47Qi?=
 =?us-ascii?Q?ftXo7tLvVLyiI/RrmRaQ97S/CNRSitkYkvVSkWWoclCvD8qqPw4Y4Gmh4ME2?=
 =?us-ascii?Q?skDf8u15CKH5nvuy9GjnY+qb50pGOVAjx3b8wylnD0bPp6JYhHBSRWuxZPI/?=
 =?us-ascii?Q?5sBxX+PEz4B0pWrsAUplRb3cQK32wHjWFXqdOFUiLxFpDloAqsg2yrKznfcj?=
 =?us-ascii?Q?CTlIO3Dzal9D+GyJcKpGGGCVrftrhQz4441gw5xNGVfecGSLO+nh0iorqAWv?=
 =?us-ascii?Q?ufU5E18LnEXwGh/ovVmDzT8lu3pHaeq2uVPqWdGIPIbiQ67Dkody6PipVm38?=
 =?us-ascii?Q?7TWTQU/nHMHivcBEbaKbOgl/nUmePemr5PrhNmAJ6roW1+O4cy2OPEwEIVJv?=
 =?us-ascii?Q?gay/q40hPrGAr03oiN3r6FJVKyx/PWbhXZK+/JiUFccFUtYQyT7zdtvkB/Rm?=
 =?us-ascii?Q?G6E7GVDk4Z0lpjIOitVUnZehWEuXYknjbf3cC4/bdo/7X7qytXLJI8PgYONq?=
 =?us-ascii?Q?xyHjJRWLrbMjV985m2WOmGXYx4UJZ9PXWGTV6M0/af0YvZTMvF2dxHj/qXam?=
 =?us-ascii?Q?fkF1D/NgBka76vYXkGAo9rln7qep6MWvtNXRKpi8ccesf1vH/q9+hBTubv+D?=
 =?us-ascii?Q?pdQTB/zeg/50kgk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:40:08.9885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335e8c04-b879-49f1-fed1-08dd6cbf8b73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663
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

We'll need it in other tests

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c         | 19 +++++++++++++++++++
 lib/igt_kms.h         |  2 ++
 tests/kms_writeback.c | 19 -------------------
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99c8707c7..884d78749 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7434,3 +7434,22 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
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
index 0381c82ad..9b5a940f7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1280,4 +1280,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index e3671c59b..f733f3ce6 100644
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
-- 
2.43.0

