Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CFFC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4610E79F;
	Wed, 26 Mar 2025 23:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GTpzAazM";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3280C10E7A0
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgS1bWhWXY4Kfe3byVVnfdqCb+EppZxC0LkCyIoXrwXSp2x4qcGJ/ac2ChxwtcmrBa4WeDNsFwQJXjVrpXi5alGqzdIhJrXtJX8GQSDj6WJ+QxanjAkpIucgRGJbqCQ3vn8ywX86n3RxirwT05g+DNoQWwDyK6n8gkTNoFxSXhSNnCVZ/DnU/9qpMi/awgnx006TcuR5SP+7vGhKTNq9ToabI5k1KOqV9v6D+Ke5XJ6y0yKh+7/Amtaiu9+qv020zvO+rwi290TJDvtdZBzEoQVD6asAyqxayV54lsi/GYNSiCyc+w4+9oZYlqvT3VPj+qp5qmEQvEKt0TNp6Au54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL+3lUmcg9/uroqG9Fx+btoFu3ciShqziP1rUTlfCY8=;
 b=GGasFhVqaLRHFOjnC9AjTPlI1PAj/nzIEGomr3dgVhom3RTGa10XytPNEZhB3D962nRHvbmZn7p7UZDb6mbkfZuI+khbJMwE9CpPGLk2rKNicFa7X1RXCF6NEKxi2QRm2Q+6E42prdjsVN9+TWqvnJSbBUdkZ2TD04cVduqbfkbicLGjd6UmoISFpR2bTNxYM1gbtwUxrDroB99Dkr+qzCIB0VmIol34cOQ8DZuvIxcuvxUNlUB1rSSXv4Gpr3G+ZSPX1fXRa7+NB/sXb5vo8PodC0BbUboZtf4gcwfD471DuIkPVaONjOgSFJQF6ext6yPELtDEGVTM7Y/bnGwW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL+3lUmcg9/uroqG9Fx+btoFu3ciShqziP1rUTlfCY8=;
 b=GTpzAazMpUad3pKXb8TKaV3mwk2Lw3t7nQPp17noAKHO37buYjKaVtULGR2KNfdT/6Jd/UIvd33HkCg71YKTig+QbVY/IsUet3trmStH6FTvNG7aTC8KIDRQIhKtrUUfe0fe7DirzUVbO3lk4qAALLAtYsF+bkLlPABK443oRZ0=
Received: from MN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:208:530::30)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:45:20 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::cb) by MN0PR02CA0027.outlook.office365.com
 (2603:10b6:208:530::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:45:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:45:19 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 29/37] tests/kms_colorop: Add tests for BT2020/BT709 TFs
Date: Wed, 26 Mar 2025 17:36:01 -0600
Message-ID: <20250326233609.2980110-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a283f9c-945e-4250-1642-08dd6cc04547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gTRDe32gmM0pN/NBc3zdKAZ80GK7b0/6uTtdTaTIfhx9Qf2N6wostZMcmJOW?=
 =?us-ascii?Q?7YyGBg8nH4Qwi6m5995E73+gXjvvFEnfKOgoTHureNc0f6zI6wPAZTqBdZB3?=
 =?us-ascii?Q?vjarq5r8Uq8jYOlgm7uanSwbAxVVGNjXnn9wgfFvR7OF71XF5sOrsqISyv4O?=
 =?us-ascii?Q?bAsv1c8j240wz/MZuRKUOrIyprmHhPnJ1x4bQiR4S5AixzV/y2c51qSfNcut?=
 =?us-ascii?Q?WTu5l+/Q9KBxqKTpGq9GKVCv4ZpaqK3CoMg/7Za2ziDR+lzL7olBr5cNrTK4?=
 =?us-ascii?Q?Mrgzk5uhOiuFLjSowanJnFGrh/sr2d8zeznNhwOoEZ1NvShFuJ1O0YmrUrcM?=
 =?us-ascii?Q?jAG+0D/ILqJYsIRRioJYZVAkEWG+JRzVotoEF90tkkPf5Kax+oGAoCM4LXfU?=
 =?us-ascii?Q?xjupMaK6IY9UXYDy1aDQUgJnPtW/oL8vRP8xqNMJwT5CoFFtv37ciGu3qMO0?=
 =?us-ascii?Q?FrtnvnDpnqKWoSJQx46FZ45UUC9656vxC8Rf8Ht8DWx74E2dn3pVvxM0WwJU?=
 =?us-ascii?Q?v/vQdWaNroSjs3AvlTtB1K/2ItXk3U/8LczyDWwgHQBcjC4UxJjByKi3VkI1?=
 =?us-ascii?Q?WqKAn7ZxlsUvBXWzTdov/6quTC7c5FYkQ99XHVVi7mKG9Nz9aV7mhbBnbQmj?=
 =?us-ascii?Q?PY6jzygWcDwvGBTkp4h03Yyyu0twh+bXFp3llUKjNKsoGCSeMKO1k4obONVJ?=
 =?us-ascii?Q?J5hxBmhp3AICZw7zj6+GO9vtmEmreSe+C9isRoCUC4hqsSRYZv4CeldcbGpd?=
 =?us-ascii?Q?4luoNr06jzpRdUWS2KSNEWUQc17GArVoWo5I5BqdhwegKTAqllTiIDRhaXsa?=
 =?us-ascii?Q?DDNP/KzljmZprZhURL3Nr3UClrEFqzd0FUi2Z+x1ehSD5yX5gwTkxDWVQqEO?=
 =?us-ascii?Q?DS04yxPVm8xz9akvdZZAzo2ROjoyBNBPznPWJiVL89wyqMbxULQ0he0N2iug?=
 =?us-ascii?Q?gKNRtbIw8tiajPzMhmOyqAplrjCEINt8beW5ey+i1So2ziggq4SCAdMWXPpj?=
 =?us-ascii?Q?8jvcWAvm49P8q8vWwaBW3mCjlLRxAM+Vwj8MbzJzQ/sVCwSYucks6eLBzxc3?=
 =?us-ascii?Q?t4aNWMXgCCwEGh7rSANDw4NeBcyKjSIACVaOVS7QF8u2oFLIBflm6PxBhxTX?=
 =?us-ascii?Q?b3GSS/WdBJ73O3YTcfXZzhwFg/OUiJLszWRodhILzKl/N4ITZFbcrGMEivAi?=
 =?us-ascii?Q?R7x9NDufG+2jxnnxCPObSI2lUnymTn+zwSfur4Rv1HbzySs7/NAaJStXS8HT?=
 =?us-ascii?Q?gBSRqiNJ78U+LUkHVxDCYaq7ol//49hcTqjY6NX4gvgktf133T1h8+1JtBlh?=
 =?us-ascii?Q?uP7ulhRog4q11liQbPVMhvR2ITw9VE5nePs/YdEpLTEFXhuF1tAQxrv2CyE9?=
 =?us-ascii?Q?w5ua73o0Vim/uMMUYVM33KemoSUzFUOuiUXfYvLh8ETtRdAXrbOUOAOFWQa+?=
 =?us-ascii?Q?zPXsvkpY0+YMhsDeQvpTG6ePO5D3GBvqUAJA/ouSIKTcB5GdKPQyJuOreXLR?=
 =?us-ascii?Q?BGBUz6UP7lPvFs8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:45:20.7817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a283f9c-945e-4250-1642-08dd6cc04547
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
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
index e86115372..f6738cdcf 100644
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

