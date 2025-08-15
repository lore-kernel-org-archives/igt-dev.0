Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6170ECA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1935410EA1A;
	Fri, 15 Aug 2025 04:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0cQnt97x";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848C10EA1A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3813pbFBBh6DsClV4GuBsqaIiwmCF17IF7UqRkF/ho24Dp6BMiCDZL5cicd/d6ryWa+X9gqP88Dj1bYvZQ+W9EKLf+EEsjVOPG3SHpatTtpN9btktk06Np4scf+5O/R9RH5PsCDOqPC84PEDc54TZylnxVwgCGV8IXzWEWrrW9mb2ax5jPjUMbwjl1cB0qsymTDpVELB63tbrnKFCVizl6+tJQiG7x4DMQ3T6psjxY8VhBQlx/Ud9AIuy1M3+59IJRo/W3f1mnAD3U/wbcE/AN2j17gLY+urt0rWAkVPNhyYj9mOAVrnOqvBZFXGtrOXjp6Ua7f6Mk0tBaWGDvlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jyG/3DqLcueWJU62ezQKxjgs6KOXzP1sAnvYb/AiSI=;
 b=KoA5RvfEYH2n41AmT+DW6UmDMxtYenoMW2+9TeEYR3kCeV7i4fT7hEuAG7Sns3ucEjlu6ZDP+nzwH6ZjaNFaG9FdAxj9KX3ME8ZRfDFMN7ZxHSHQU6IudC47LuyFYekmyy1wPzNqBgGr3il5PgSFO1hpTDSuNms3ikQ1UEW14FcKsou9wDj/W1waNfdgSOh/52ZOtFJ/3c56dz9nX1jGrIr5YT91s7r06Iz5ejXlIaiUihFGkYcjJB9g2tA8n1cNP6WCJoN41OwBQO4iT0nnYDEAAs5YXHXho43VvJeqaeVvSnEiKIeJQ0bwr96+9P97vERUwwqVJLUu1dnDZ4D73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jyG/3DqLcueWJU62ezQKxjgs6KOXzP1sAnvYb/AiSI=;
 b=0cQnt97xhJmDSUVIIpwB5wcDpfKwYSjbQeiihB+I6EZxjQowBxZ3wHqFvKbKPgkg4yDh8TRroQmkHT6gGEBo4cYDyUk+l309SxqkqV1U8rNXdB+G5A90hlQn82M9fVea5H+RlyuFhuQUIEGKoQZ4aLAa8XfML1q55jKGD2yvL08=
Received: from BY5PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:180::23)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 15 Aug
 2025 04:11:39 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::6b) by BY5PR13CA0010.outlook.office365.com
 (2603:10b6:a03:180::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 04:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:11:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:11:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 22/30] tests/kms_colorop: Add TF BT2020/BT709 tests
Date: Thu, 14 Aug 2025 22:06:51 -0600
Message-ID: <20250815040659.3321102-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 43dc08ea-8d2c-4239-8b34-08dddbb1d5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dP/VnCQnpxIRVaWaecJtXh4aM2kvgjbNlnTx6ERwQDLr6pZEK7kkD9Knaa+Q?=
 =?us-ascii?Q?M9jVIGkPognGMqBb1DdrveAgGDN+ldNEVql+y/GRTCMN9v5yG5ksmo62Rh35?=
 =?us-ascii?Q?rdIMSPqcOYwJZj9lgKxQzLdGZPlcecstMd6QoOoTdKxymsSYNiD0vVr+VIYm?=
 =?us-ascii?Q?P1/rLGGFs5pHu6Qdlk8ESX6UGZK4c/Sd44dT3o2wmxawYEfzCyyr/56BUwb+?=
 =?us-ascii?Q?aRuYLZPaT2kMmgel0uWIq6QZimsXm69JbB4Fsp2fLNdHOBT4Z1ZRs1oDli3l?=
 =?us-ascii?Q?gBD8QGC/mNSle4bHeAT/gcTfTjPc5kHxgqpKUzOLsDkiEJB//qVMwDQ0KQzZ?=
 =?us-ascii?Q?XaAmiEpF8lOE2kqVQ6M++Psqxo99hFV8s3V+JJUTg9Q9i1sZuLlIhPE12jl0?=
 =?us-ascii?Q?bkC5BrS7uPq6LjKVuOT+HMt6zIaqtngrnYBKNlxFIIshKHxCoA4FYeXBVPVd?=
 =?us-ascii?Q?oKt18CbWHGP02GrnfCHEbXUz+VfRQ0zETE7SxTYX0w/ES683mveDwmytX2yQ?=
 =?us-ascii?Q?JkQRCY7HTLBSJdvVJ7zTSdljeK6VSpcQ/tgwucM0iA7dRhNODgCdV+gOco0i?=
 =?us-ascii?Q?prZDGQoqYynsBW72x3FJtnk/lARJpAtrIFPAmM8vo6hox+UEdK2Df8qmtWLW?=
 =?us-ascii?Q?hIkP+Gs6O0BwXYoIMd9gOn92evrANCVgOhsdrwTFdT1DR2TE53NySGySKpUH?=
 =?us-ascii?Q?V72UybY32NeURAEEWfOHbC/Sjwm4Y8syIsr0nNKXwSIcJ+WorUpgqFTbRmsi?=
 =?us-ascii?Q?PubWoePF2GNEfqz1t0R+uZqjoJEWYp/TkwPoYJUbWWKjneVFm56sWRZfFNxH?=
 =?us-ascii?Q?fV2Nj6YkMGxh20oOLTVQbJkWFZ5HKYp9kPhfntVrgDj4c2bsdCS5VQTJyZJe?=
 =?us-ascii?Q?zLUD3fo1GhdJDcpUt0g9CLkf/ejlboZH8jmnXWOj2Zc217kR41DujPb6CfD7?=
 =?us-ascii?Q?LpG9MOK9BPIdM5r1xhjzRSLY6XQcvy94j96ShY71TTVp3kiY0ubieSMi/Tq5?=
 =?us-ascii?Q?TbfCMvQXxoE5+X+mWpHRjp/aCF91/7D2Z4XG1TS0oJEV1pJigZwj2MZKzBRZ?=
 =?us-ascii?Q?fa1gTfhp1eUSZwpeo0SKfoB6Zi2g5xMu/WaegvAEHZjMVecxu/V2fmEXUGB0?=
 =?us-ascii?Q?heKndUARH18fOIO+dU4t0mv0Uhx3yQQIxiLTm39Mvk3aQDc65hGlLc1jY1iZ?=
 =?us-ascii?Q?uy15wKNurm8/Oxybwh0Sts5VNi5ewcYwmuVopFdTShpdW1LXQNfFxYx3RU2O?=
 =?us-ascii?Q?6rh2u4i+4jYWKAALvahbE1PZdwzcEvcYa3uLLHcoLeVAUN5K+RDihxcvjffW?=
 =?us-ascii?Q?0CaJjmVOhTjAjiUuVwcru5bTCN+QBRB5PIjC12sYSCPocQheIcR+BzZG7TXz?=
 =?us-ascii?Q?EjUJjYA8atFrBwwHD0cBXaE06HGWPACCjiz0J9myAZxM8Ik2qQOdAlSE7tDo?=
 =?us-ascii?Q?wWGVd49Lwx3GXjKUgViF8JCAhUsfHFR9mzM6N3QkAaUdtmgBMge2yMMST/P3?=
 =?us-ascii?Q?bY70c4ZuTuifGK7GTkI/uc0xD4d7MFrAXIuK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:11:39.4914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dc08ea-8d2c-4239-8b34-08dddbb1d5a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
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
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 98e78f8c9..ab2771d37 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,9 @@
  * @srgb_inv_eotf:			sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @bt2020_oetf:			BT.2020 OETF
+ * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
  * @pq_eotf:				PQ EOTF
  * @pq_inv_eotf:			PQ Inverse EOTF
  * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
@@ -481,6 +484,9 @@ igt_main
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
index 494fd7d5d..50df2b26a 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -43,6 +43,8 @@ typedef enum kms_colorop_type {
 typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_EOTF,
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
@@ -53,6 +55,8 @@ typedef enum kms_colorop_lut1d_tf {
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
 	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
 	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
@@ -107,6 +111,24 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

