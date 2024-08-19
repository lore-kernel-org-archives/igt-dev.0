Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB2C54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7949110E478;
	Mon, 19 Aug 2024 20:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q+korYLV";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2F710E478
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hw+65pAOnwMX3eb4BsdltXo16o3mPVSV5YRO0TeL5AAMMFC7PqSMGLf5KgWs05z97TdwjlSazaPPPo57BxiXhyPFZ/BJAIodM3coz3FWWbuTXfBKQY+UPHSCUmhkU1aU4FG1DCq9Zp9GZf4O7WuIB03qLv/kVv/qNbjyMII14y2j6MChNVLJP1qQnRRdklrn27Q71X/MvglSg5qn26UwVKwbmglQ6dffy0XnNxAYXTEse4086M/GzkNo1ZmcCLyTpeReoWz4ph9PKmBOdKWnPSk2Duc4oRasgB+vC1Q2yxUcx7oUXrqt7fIGqNqoeS6CkxWeosnSWfRaHPYcmj4lkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZyCcd94zcdOWCI7hLiYLIVqQ2PnlrcQ2hs7YqXbPMc=;
 b=XbpQdFIIdNUL1dQOLsnxaF9H7bMgqGpm1DMQPslbTcF27RhNmnXg5t2D8vXm9nAztHCbV0G5LOQEc10SioSE0LHETscPnQIKOAHP11C4kQ8H+RqRvrJfclxmiIYPxQ+fjMxMMTabhxgFhfqrM+y/ZPeuRb1HKDJnCwXgyXT9iKr3hJgOKb88onYeiPHX3YcTdJZ2RspdK10egWlejw8884hJ0VPMnEODyRP51uzUcbPy2lAztmsP6kojH1JkaEJQiyjI6zUq29nyvuRSq2KWlSh7L0zqLmLlBtAQZckonkrs+QheM6g8kJcoEF00CZworrkA2t/5CrRjUb5R0HIfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZyCcd94zcdOWCI7hLiYLIVqQ2PnlrcQ2hs7YqXbPMc=;
 b=q+korYLVAJFneTzsCVMmLxnbDVktS4p2bWtQf1wVJ542sMdWnKWYJ+cVdFoywt3MGzZQSPZPOi2oOK47JR5kmt51ZU+lotqcbNvVKuCBTPzeuHMN/D4tkmkxv9vonpdyIXpofhX2GtKd3QWl5J334L0Nkr7VmoDm46gylFSiNU0=
Received: from BN0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:408:e5::21)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:41 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::90) by BN0PR02CA0046.outlook.office365.com
 (2603:10b6:408:e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:40 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 29/37] tests/kms_colorop: Add tests for BT2020/BT709 TFs
Date: Mon, 19 Aug 2024 16:58:15 -0400
Message-ID: <20240819205823.316656-30-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: f14d75b0-8753-4ef3-bc3d-08dcc091b46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bSkxZj0ZuA2wOOnAhqwqvTmzwU1ovSVFzVOt3pYJ9igE40+4NiUlGZfkjtns?=
 =?us-ascii?Q?Iwxw1KpBmNXmzrP8aivsM4Dx7YT964D6aPrOPzZjlwMgPq5yEA5i9FWtsVDn?=
 =?us-ascii?Q?/5OKbcBIiiNbFS08Nw0EKHex5McxL+aniQaDqE4cTKJXg924yU0f7DRtWOOz?=
 =?us-ascii?Q?zAVz0BXNADaSHY2uq3V5aP6V6Ec8If7PFHxqADWzTlUtmYbCyVsMBo6njDGi?=
 =?us-ascii?Q?YlzcJCavnCCY+au47zhJBLW4hqqxh2Be4JEhu77Lwif4PY7IFp64AF3zk217?=
 =?us-ascii?Q?EKQflupZz/Ie9EaLK8r4Pv85wY7zQnZADmgcpIjLsKiC4wW8ekQuDRcFBAtD?=
 =?us-ascii?Q?Vq0jYgUXyxHZIgxt2UPjUuoar/HODXv/tlkKHhLDKms+HMMT1JCzUZv1/LSr?=
 =?us-ascii?Q?rtD57R/5agUTmJfnpEtZ5Okk5CfSeUEj9mquQ2x8glk5pWspKmlyE6qkyu+v?=
 =?us-ascii?Q?s9SBIWvlg2nmytTg36ZFTxxUtNPBzpg2PDG2TwGz2PCeZ1O3yZEQebGiy8E6?=
 =?us-ascii?Q?iKGWM5PF80KqdlO7yFzMDSqQRK7EgF+1kzyqXQJwMiqq/94kUORiMvVYki50?=
 =?us-ascii?Q?UpYQULKSwW1b1EpKi6mCXzEa0TJyUp2b/vEs0zoGAf7kguYMo2ck869cXqQP?=
 =?us-ascii?Q?FKOrRTJIp44Y39gCCtLZe3PVLZaPqoJ7hm5ieg4xmhRoB+HrC8KsISw+7F/V?=
 =?us-ascii?Q?GTpV0ibAF4ivKem+uvI2Wi7VFwnddW5cqkuQLG71qCUzqIfyceVft+wXn2N+?=
 =?us-ascii?Q?RYbYP2jBRf3dQu7diEOs5pNsJShut5gLETSjzzLa+5aP5xafskKWB/85HZij?=
 =?us-ascii?Q?2XYoBhceSoJVZQPpWdKbMkFpVR85bDmMZ4Yx6BPP8bVxFxtzhFTdEzP6Wx7/?=
 =?us-ascii?Q?PztTat+dZ9KIUVoMJwwGsKZXbqlpJBiMjZ8FKK/7eo/FRcw18nRNoyY+FwPq?=
 =?us-ascii?Q?tfM59fPqGl0GroLDdsjx7jRWb/uo2f+ZjWUN4rvDcSuSHgwuaWM9yUmd+/al?=
 =?us-ascii?Q?1q1NVDNmkPhZ0uc+V4ysrmmwkGLTXhjLuyajnvB2W51FJsZOdo3d8lTrf2nm?=
 =?us-ascii?Q?Ij2VeKvAzouwAZ4vu6JSPp5f9QMcm+pArK2KxsMh2+kjLz0SmHccwLk7hhz9?=
 =?us-ascii?Q?YqxwIzkN3Gm4zSnPlNGIGYUDhxfmY7pf84s8wddmLhj2uXY1f+ovEqRrAFxc?=
 =?us-ascii?Q?xZjOGA/uwa4P0RFhHEDqaVSNo3oby+t846xjtqXcUlUkpgpvkcnZIiE3zXHb?=
 =?us-ascii?Q?+ajOqD1OVtDX60/SM3XrFvRj7dEPb9Q4iTJuS2Q8jkqI/2/6/jr43OzAVit5?=
 =?us-ascii?Q?TUGthcyEhmR/MdltDle1Ek1onl3MRiRIACPdFtHTBvuMvCkimF6cAj7lqR8V?=
 =?us-ascii?Q?tylooXIO3T3zYpmZKq3smfPUDOtmXNYSnkfucZZt1k4XMAsygkZz+xBimkg/?=
 =?us-ascii?Q?yAgGIY0b+DgWA8KZs+mA0sej1R6xLhYc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:40.8958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14d75b0-8753-4ef3-bc3d-08dcc091b46c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e86115372a3a..f6738cdcfdf2 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,9 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @bt2020_oetf:			BT.2020 OETF
+ * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
  * @pq_eotf:                    	PQ EOTF
  * @pq_inv_eotf:                	PQ Inverse EOTF
  * @pq_eotf-pq_inv_eotf:        	PQ EOTF -> PQ Inverse EOTF
@@ -491,6 +494,9 @@ igt_main
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
+		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
+		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7d5cb4bd1669..7b98198f6430 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -42,6 +42,8 @@ typedef enum kms_colorop_type {
 typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_EOTF,
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
@@ -52,6 +54,8 @@ typedef enum kms_colorop_lut1d_tf {
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
 	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
 	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
@@ -106,6 +110,24 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_bt2020_inv_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_BT2020_INV_OETF
+	},
+	.name = "bt2020_inv_oetf",
+	.transform = &igt_color_bt2020_inv_oetf
+};
+
+kms_colorop_t kms_colorop_bt2020_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_BT2020_OETF
+	},
+	.name = "bt2020_oetf",
+	.transform = &igt_color_bt2020_oetf
+};
+
 kms_colorop_t kms_colorop_pq_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.46.0

