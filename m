Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC7CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA61C10EBA9;
	Sat, 15 Nov 2025 00:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UdYsLbcG";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93D10EBA9
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qg1AnOaycMIlHuwrd6y6+r2h7kvJxGWw2b2HlE9N1bOjK6Gk0Ezbe8LYiL9I/0wtnrEJpURx1lrExlBgip4x0q7iC3eTBsZA/qaNL/Fmjl17KE2uqGkmCEPQJFBQooUM7Z4PeqQgGv4dQLUVWEcjpDQ8PlsU1TaefoSluHB0hcYkCM9axjcRL5zkmNq0rjqPPxo9VslfA2ZUpCqmTdAUrPor7hjQyeJhltz6LzMIxrnLQRDTU7Nny9plPlHrOQm3pvDtWnKU2BVZ2wtbv0oOQstseFMXmlV+acaSpejckkMDuEs8Lt3YHLj/mq5jIWI7zFspE74/XICuAvb2FIjNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31HeinJEeb48H1d30tgTMqEdnH5mVY4FxGyLtUIWBHg=;
 b=QTytom1Qe/UlvcPvhAkxhCvPxVHs2a9Ap6k2jCh1EGSCcPd+bY5xyrMR+TxFHLgUe4OumwfLYMXAwU4FJTHA/zi7KYljju7ivsNewghVsFMUEyOPVvD8ydUREopqaflcxzL5ffZ42qTpHtCU/vvcsCuwHs4IkmvJyLwiYgG083c5MC1mkFhs6zheSWKPZmRdOs75ulZnUHTZ6hu0OwSc7j22NcNTL7cdsciq1TT6fcKYa0ycWVVsPYp5y/eQBlZjm1goEZqcLKMBZ5in3kj5KbGojfQxDZT57i0lWQqpZXGPCc9RGLGK1678N8YTzxiC1kUNpxSgmc4Fc5jTB52AiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31HeinJEeb48H1d30tgTMqEdnH5mVY4FxGyLtUIWBHg=;
 b=UdYsLbcGeXLNqXoZh9Zrkhnfno02scdEmoiJFpjvqEWfzMl7CtfCdLLBw2VUn9fh2d8ytCotaLBjx6WPmZp+ZRiC8A/0vDFtlkozxGGAqZlV0TGiY6Nf/yD9J0Z/waYJ2ffqtNdPtTr9vGkOCmmNX/GugzMwkpacosVFuHBMbR0=
Received: from MN0P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::8)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:23:41 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::71) by MN0P221CA0011.outlook.office365.com
 (2603:10b6:208:52a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:23:40 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:23:39 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 24/32] tests/kms_colorop: Add TF BT2020/BT709 tests
Date: Fri, 14 Nov 2025 17:18:33 -0700
Message-ID: <20251115001841.3563993-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 719e278c-455b-49d9-7e99-08de23dd3a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KpufmZBIRpzqnUh3iZN7+NR5mVMNy5zcXs1C50fMKr3Wb/qsglYE9GtS8lHC?=
 =?us-ascii?Q?2D8D9q0EZnWEFuPxaSOaaNz/MlsLqPrGQLnCYiUJsgJDcSZqZDmqJN046Zi4?=
 =?us-ascii?Q?++qIwTAhlY0mmC2aHr4ctzISLZ4jdfIYP0nJfaH7eElSZo+yZvxVQaxNhskK?=
 =?us-ascii?Q?IP0z97S2kX2AT1N9i8WC0X68v89owiLmUwGD/LSen9S1gcvFaw/qN+eKcKKQ?=
 =?us-ascii?Q?lHyz/wfa+AzTWJYB/YCyg8OQ0fRvkj5IVSfoxzeg8cj9DET9qtXTBfByLjYn?=
 =?us-ascii?Q?s/6VsCV7At9QXi+Na+kTM9Gqi1VyiF1FW6kfjILwnu2n9wevAjXK/cPXu6Wd?=
 =?us-ascii?Q?Res3COx2mMSY4Nfgb2Ve3OaPGWqTfBkxNs8xwMr264EysXM1OHbW06NuGY8Q?=
 =?us-ascii?Q?FGZ9l8bJ55Oh+oLLtLJPmmCungrkXlYTSy+PUqPd1AqblZtF6PDrrKL5yzR+?=
 =?us-ascii?Q?pjDzB6SR73AI+ogAbsZBLhuK245zbjMjw0qvz550CpaBSfZLjV9eXNvLaSWk?=
 =?us-ascii?Q?HZ6TFTfVQuGumZyLhXajg92I8NIcMfMYGTD0RKPcUuC7cq80LMPd6gyp+JSy?=
 =?us-ascii?Q?NXqdLzTLfStYpzmn2wwlZD63nuHFxo2VRJgDgIaCDNCLkxgpYWgw10Luk99A?=
 =?us-ascii?Q?0zpBM5/fxpELgDj7BBtzwXvhvJY8er+WkDr/6xSi5hM5w65zlli5ifQx9Gr2?=
 =?us-ascii?Q?uAtiWuFUyeu9myDhpMIBRRayfZRAkj2K4kpSHC08+pli/QmeWYA5Lqbwqdkl?=
 =?us-ascii?Q?S7X8NNqqi9WT0Ph6nJi6ivUq/HEGviCFNCFmcZtkvInE4+WIPducXeAA2/Bh?=
 =?us-ascii?Q?r2OyihZDWXv/LNnbok2T2n7GCbZe/4A0b0y6Lx8mI9bzWESR4I8wYiLBFGi8?=
 =?us-ascii?Q?IPtx3ZvrCbvxBTrRRVwFRhliX/luVbjDqToq320KCkZbzCimsQQi489RFC/2?=
 =?us-ascii?Q?SXuJDdeRhb+979o0H6uZtBEpktxKJMclyanI+KYRqTk2lU1n/H9+g4AI2Sym?=
 =?us-ascii?Q?ZuDSRDHRCvPmLJlN6mTrrPPxj7CPiOF8CZ8xz+rhjTXV5Ba1wKn6bhEpmUwW?=
 =?us-ascii?Q?ZYDXTlFMZGP0L6Dy/iUDScKLSaBuNMEt8/3thvSzJh3Yp3+xqCpCfZZH4nnR?=
 =?us-ascii?Q?yPfPV3HTkgmxFKMzmSo90mZEaxfua1+NvfVNtl31sj5Rp4X1Zrvzf7VOZwRI?=
 =?us-ascii?Q?JYNEttaaPkEPadSLWSv+0YY4q+pLdZFIgriXj43CZyqMWA3kmZTpeSC/luRy?=
 =?us-ascii?Q?yApzeHFy84MPtsRaKY+IuS4lFYalW69SJhHwXjpR9fdFWuOhe2uyYIYghn+7?=
 =?us-ascii?Q?PCh5+7Z3h3qX9c2c0dUvgC4syjowsmCVJxWaHDQSIFi7va4evwckHhp1OD1N?=
 =?us-ascii?Q?h4omTXYW6sqvfqPljnovjWjIoedMtvJdJioAG2lH+v+UbV/+yeCr4SBGaDb3?=
 =?us-ascii?Q?sjwS+X8AAUJC88dvcPdYXnekm4uJT024PB7f7oBfUxJ6xhAJIm68BJ2oC8h6?=
 =?us-ascii?Q?ZvWyz1gP40SBP8gxebGmYrhOLmAxb4VdaWSopcbepRmhpiRZyUckZN3cIqbf?=
 =?us-ascii?Q?ByWf9491BUuONGUMX3M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:23:40.9000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719e278c-455b-49d9-7e99-08de23dd3a80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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

Add tests for OETF, Inverse OEFT and INVERSE OETF -> OETF.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6aaa38fde..e098c0ffc 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -32,6 +32,9 @@
  * @srgb_inv_eotf:			sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @bt2020_oetf:			BT.2020 OETF
+ * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
  * @pq_eotf:				PQ EOTF
  * @pq_inv_eotf:			PQ Inverse EOTF
  * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
@@ -441,6 +444,9 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
index d5656d813..bfa1030e0 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -25,6 +25,8 @@ typedef enum kms_colorop_type {
 typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_EOTF,
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
@@ -35,6 +37,8 @@ typedef enum kms_colorop_lut1d_tf {
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
 	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
 	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
@@ -89,6 +93,24 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

