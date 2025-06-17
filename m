Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFAC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F410E540;
	Tue, 17 Jun 2025 04:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yXzpUiR9";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EF410E540
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKhNtBTqI+7UoF4JlZpVTqVG29Cp4uOQjBax0/CpnFtMSEgMjo7c52kEfN4X8WKuJwrVGr/bL1D9djfautgJ++bNbPJEodT3CpmyfgOjbXA6eQDAqlSjb3Adz4TJ2QG5TCqFIm1ViUXYnqIJNUT9NqOIhU1UnXXx8r+LckasOTimfi6Qu2VZhE0C2DNfMuzYMp9Z39HnS0SA06L/HusPjjRTQP/CcxrxUQHGBdFq+PG4xhe4vhhwzuX6tZ9fccoJ8MVe6d7DKpeBUMAagA4xKaCYiWy6+zXAW0/po0X/BfK0DYZVQmJD62mEOv9ZddYcLvnEfCZx/847UbuYwg0VCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgOfKGkX8NHOSsLj3m23oGpiywtRXT1MK+qWhgkR6rE=;
 b=aDT3YCp8IoQmLh6XHNUSt2aomimeyRq8hSehba03cpPjVaHzM36fo5HpmL734ef64T0DGoKz5GgohBY+8QBLfw3tSwbHkmlCOyoMHQJ+Rj5nHTYcYCfdN5BJJXObBox7U9ITpRguFQ8R+bnwwgjDm++uoNOxJACpXlGkn0sL8SeHOTVtqlQqIelRrMrs78xQjFKKmpFCefhtSsxXCf50VazQupWNtAx0BqoGRMbR8SAo/78sxoXrvQa0KNoI6DPf5UtCbMbl01gpT25UGCJrTBsq/rkOWHO0Qbqe7ktJPLJ9Z0JSm2kc6UOOdkBjpsgLV7sM0W1J4Li9zqRjfMWrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgOfKGkX8NHOSsLj3m23oGpiywtRXT1MK+qWhgkR6rE=;
 b=yXzpUiR9jd+8+X+sxaODhr2EyEN1uaygSQcrT6NUCM6dQ7NP1TCNQjnd0esknmA6Ni+lj9DHM/dB6BNHsJPqZNhQ2XWXtANygoBzNXZ4N4z1ok9zM8QkChVXW/U4yuw7L1dILi8h+IlToE96k2wNTiFUIXuIMRhCbBUMPb1O7Z8=
Received: from CH0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:610:32::29)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 17 Jun
 2025 04:42:09 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:32:cafe::4b) by CH0PR07CA0024.outlook.office365.com
 (2603:10b6:610:32::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:42:09 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:42:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 27/36] tests/kms_colorop: Add tests for BT2020/BT709 TFs
Date: Mon, 16 Jun 2025 22:36:22 -0600
Message-ID: <20250617043631.2920587-28-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4593ab-5e80-4452-6e40-08ddad595203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MK6lfvUfVuS2EZh/gnU/u/cGDOugOdFQfSYXt1z0h2nwAQGmLwZSp3baFCOz?=
 =?us-ascii?Q?7vbHWGrZ1g/kHaKBO9Ao4bNBwyU6V/4PSVnNjI0Y412AiQYzsm+OaXfn8T3H?=
 =?us-ascii?Q?sVYLH5MCCguKxAyj61WYM9oomapJO674Xy/KrS0aaoVX2tr5cPZ3CbpB6WP9?=
 =?us-ascii?Q?2PV+HXor11yOJIBAJntPaaEe6cqwyYSxxq65z7wbHTnUR26ZstGvw5H0Ag1l?=
 =?us-ascii?Q?TARsgGh3J6XG/QrF9qTwuUyiVEG84l0RwhLb5trKU1A1nMrPMp/h+kJU95Ed?=
 =?us-ascii?Q?cR13+cuwQdOQxY1WXoc/Eiotho4ourOknyCONbsEklH0DyMSyH9XXl4M7kZR?=
 =?us-ascii?Q?S1NP9cJaWi6vq6jgHqSiH9N8KQbjfaH5BwZqk9IfPitcqd7gouHVg4fPtLGk?=
 =?us-ascii?Q?7Rkto8jO7F3i8ojdb3xP9U5cHPvClVtRjF3QSRkRmqhjNxmtOdb8olU7r2VF?=
 =?us-ascii?Q?cSAtae2Opxo5GD8WuqgOO6gPFbQvqjeXcrNYgy4GChTDFOq19I85SNVQ8/1+?=
 =?us-ascii?Q?Z02OaI9blX8VMzkoeGIS4kw3tGJ9eZkwJvf6wqojsRfuuF8lEmaijivHs78u?=
 =?us-ascii?Q?OFCyZm8bizTL99KqLksPeWKY0hxg3E5XMb5BpKM4GVM17aTItJV87Ayr6kyA?=
 =?us-ascii?Q?SLaDoQpIJJ//vHU0cCGZQnOIwR+Y+Wrxf2CtuX7YWr8FeDXECB5LdcbmyyPk?=
 =?us-ascii?Q?pQM8dTjwoAnIR/DZKUNQlLD5QgU1na/0bRFd2hswqmNvytpUXgfYH8ojebc/?=
 =?us-ascii?Q?mMIsl9dpXIdDyaPBTmwcx1QD9GFHRaiZCbZ3o/yO61RzpmjUdUpi4Z4mOMaX?=
 =?us-ascii?Q?w5WBuB1r58esGOg0eK4P179esSeW9iFw7BaOroMZVmer7ZrGOwY3X1xpzkMo?=
 =?us-ascii?Q?d/1+eMJ2/o8WKmpNmKvnvhu6ouI7Tc8sjnH0gBOzqM16e5zTYSieJBobtnBi?=
 =?us-ascii?Q?UZ4agj+mI1h3/xauUuqIZuNzYXkr+A1qm25UhM7lr8oqRfBis1iEdFjkEmuH?=
 =?us-ascii?Q?fGypx4oSA3qcXiGbJvB5YHFRm6IqDNePcoSvOZYQiR0OuqlBjgmJRmPa0fxi?=
 =?us-ascii?Q?9pmfxGB5CB09dR7N/aAvpEO3WUVmbHwqM290vQHZo8XQ2HQ5ocCD30PhOcmv?=
 =?us-ascii?Q?nn46R7oGscvygve9nMPdrmPL4545Vtgf9pde0rz1cGbFkrNB/8YvPiy9H04u?=
 =?us-ascii?Q?14Buzo/8H9V21LHmykmAv6UXnj6C0nzHcbkbFPYdEKltNx8AL3qvMK+yhqTj?=
 =?us-ascii?Q?a8mJHZ+sMvuhEY4B6zUrUsw1Tr0D7aRMpz5aqQ+lkP1vLOuweRVjB27FsjmQ?=
 =?us-ascii?Q?lk26i5/R3CVrqi+DkE+LvcOnupp68PW/JY/sBKnPPqtyqigYvMmFY/vCtLBV?=
 =?us-ascii?Q?HEfc+PCQ4Jx5Fq5EvIhrChQDfRWxGz6O5tfBncnPjT+KGZZoNcRwZGmsQa62?=
 =?us-ascii?Q?KJs9z4snRXL+Kmu2L2ESRhiStBSNi86x6jgoTjHdI5B/srrsKSpL28uUBlxC?=
 =?us-ascii?Q?39eR96GHttHmZY5Bk+MYZO7kwpJUnwK2PLsa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:42:09.5586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4593ab-5e80-4452-6e40-08ddad595203
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c146e85d9..0f2feb50f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,9 @@
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
index 7d5cb4bd1..7b98198f6 100644
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
2.43.0

