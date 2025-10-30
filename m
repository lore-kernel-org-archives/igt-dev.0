Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30871CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BC810E8C6;
	Thu, 30 Oct 2025 04:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JdTLlV8+";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013070.outbound.protection.outlook.com
 [40.93.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0432110E8C6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnufPMQH7j7Qrv9R1srJwHOZuw6JXjz4N9j1/tkQcZ9aCEctMcHEVVkEbo6zKfn/HbUmi8kYlwgH3q8/xwAvwHJcmiBa+LczAUd+dOGFeEaXOEzhdQAvDVCDcKCcJEwrNJs+9GuyKPqYb2wO9oUWuXKX1fKQjwQB6eV/EpJTkBYB5mtIv5Vg9XsEixMPAk7N0kCPUB0X1gA7dopVxTkMDJSvUtOQxWK0FP4WzN/SnEbbKWgdQaNGp7opAx++738kS0ZNEBp7QGBcbV28tj+M/8I0aDw/heltKCGJ4vAY4fRA7Ru2qxJjAh45ZVgIS4jOouGOX+2KM3mCa6V7LKoItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnCuH8AidiOpW5G8M6OdddYa5nnpep9K+6NCuwSmHWw=;
 b=u7ffhsrDSikO73ZH1cbrh5CLc9RNIXcdFT7w3GJCkv60Jq+xOzgWk1tUxvsik72IrCxH6ocodh4+mWiGbC7Zr8c0MTgwR9ujDbUzaWFXFnfftbpYZtIFHF766EB8sYHv3KqpTkMi1rwdsbwOxm15isFbKON17KKpjw0AwR/xPR3x8N0UHD5oBG31P/rDWhuTf7Z5kQHHj3wIkTTyGycPFbu8ncUJENV1mMt8oNOVV079lFJU1DpGl93BoJ2rWyX/TUkX9Dv7JIooFIseJc1Av9s4os8uqMdPiPFjookUFcP5Hz38iNBZmw6xD3N7xk7W3pjXrvdpkpWlbJcSd0rhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnCuH8AidiOpW5G8M6OdddYa5nnpep9K+6NCuwSmHWw=;
 b=JdTLlV8+wMw1G3A+woGn0FN8IoCa4b8WgxdP7ZnmBme7AJa8AlZdUFbrrNucUsPFVEN37TiCzmEzgORJA8grnKNgdCD5wIvkrgMyrH97m22YNgzzQyYutQetsci4578ZK+aLZCruPg7NiuwZRE1SpyfKrGc4FONoUg8byJhc2m8=
Received: from PH2PEPF00003852.namprd17.prod.outlook.com (2603:10b6:518:1::77)
 by CH1PPF9C964DBFE.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:35:22 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH2PEPF00003852.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:35:21 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:35:18 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 32/32] tests/kms_colorop: Add Gamma 2.2 tests for 1D Curves
Date: Wed, 29 Oct 2025 22:28:01 -0600
Message-ID: <20251030042801.2315866-33-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CH1PPF9C964DBFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6737d7-d3a3-4103-f5b6-08de176dbc97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5kYAoNGDDnQ0I49kRS0T0zdNNh2Cp1AM1bMPTz3jabI/7B1U9nwMMUvAdD2o?=
 =?us-ascii?Q?n+8trTptfl1BQmQPz0MAxoMK0h24aJ9B3HOP4g9V56l1JeMZup9n4JKuRYu1?=
 =?us-ascii?Q?VY1xXPkZaHOjZK3WSZT+OfBgVZ85WNO3ycs3BJJp+1+yFlGWp6Rcsqqe9zt0?=
 =?us-ascii?Q?n8ldDNL/TM8yj/+veocwB0wj87qvnTbM/V1ClQkw7BihRiyQKdJzA+fkP6om?=
 =?us-ascii?Q?6iFp+b8JF35Cz30wBjHW57QQ7Hmu2arvxhTzkrTaks/MiwB8SHj7NTYgaQkd?=
 =?us-ascii?Q?yV/TP7CMNmutQpDRUJQJzYIJC9Elb9We+UMAVFYsLpJSOXVSE/T/UslpckTc?=
 =?us-ascii?Q?xN00/Rdpgy9haPAV1GTHsEx9EgtmFGJsxNMjExQEB6XM0XMJ/tYBh4r6Fp0/?=
 =?us-ascii?Q?T4G66fl4JL30DW2q+Bll6BpAC5RIylOKXVyCT6E+dNpP198nPfty7QhDxu3R?=
 =?us-ascii?Q?ZSALPpicIPX+oxdkfyyUi+vaLsjVzE+BWA0h9VtLpHBFU0lmz2G/+vIDeCZ5?=
 =?us-ascii?Q?uYSKakWRIJuF7A1gfat5Ckw3GlHrj2ZENgiR9TsizyBorCUeDhiHzfsy+BxO?=
 =?us-ascii?Q?3RAwV8OgqXu1Kl2ofFDO8GXpWkYEIV4Ol2qdWIe3cCiEue92o67C3pJS+twK?=
 =?us-ascii?Q?Xc0B8hhsSUn6fTPi5eB+FIJqA7rNxDCET/hq83D2W1hp6pZtsBFQelNQDNC4?=
 =?us-ascii?Q?16IvEvnbs/4hV+SuxoAu2pc3QlckZeAKEldTFqgvr0VQV5+aAC5U28jb7nL/?=
 =?us-ascii?Q?E+k0tVJ49ziAKNByM1yNaqcz5j3os8FuuI050rWH/s0FcsgepSwIUoNIQ/s6?=
 =?us-ascii?Q?IEnUtz/vY8F+FGMEMBW6za+7NIBkilvXopsjPmRROLmeVXEmN+ypV7u9cZpU?=
 =?us-ascii?Q?ZFmU0uibNIrt1gdRUVxor6j/NDx7Vef5427ONe1rMWjFkRQKonNdv0Rj/loV?=
 =?us-ascii?Q?mgeNsgEaqSZ34Eze2FTTqTERd1dOhQXPOTY8rQSgtBdOJbak5OaJAOXxvLZP?=
 =?us-ascii?Q?IAmlfC5+2KbtPrWGU4fzUQwRA016AndGeMmbP0qvhBfRTamGTpumd0O4XPow?=
 =?us-ascii?Q?woT0C11TMoXsWOQk/TKSF9aVNeSetfzLTMeisfUv8qYbde6quEhOMHSDW+Gg?=
 =?us-ascii?Q?IQC66Cs1o+kbe56A4DwjJENvcVL+O0q/AEymh2YwN/sPkgBa/U/FI1laAic5?=
 =?us-ascii?Q?pN11f6KsSCoXl1Zm13YuSVodg0JXrS+n347XOGeZi7VY4UMqoCB+yrEmp6oa?=
 =?us-ascii?Q?aO/bQISz+0LE4chWWcNYz5NFNxmigL+WYr6MPj7qhk7ZEV8KS4pDMc34NDoH?=
 =?us-ascii?Q?kcopMUoZnIRkPyS0AHO5K6WnDoshLfbBqruXECpMJvY+0NHfSlQV0ympruc1?=
 =?us-ascii?Q?gcYuKeO8/Sn+ALzuB5KpkOcgTvWbGPkOwILxumG8KncUO7G8R7qX6oD1D6A+?=
 =?us-ascii?Q?Uj45jmelakz0tTo5+Ymda9fMYY21piv8Kgrzvkm/NjimYRxqF6IgIXV9l0hu?=
 =?us-ascii?Q?5XLmNkdw94zYD89k/Bg11IRY1O6hqtxlkm6gIXAsEGu/cs5ownTTa+i5PEWi?=
 =?us-ascii?Q?+yB19f0AlK7R5+Wb6Cs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:35:21.5465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6737d7-d3a3-4103-f5b6-08de176dbc97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF9C964DBFE
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

Add subtests of gamma_2_2_inv, gamma_2_2_inv-gamma_2_2 and
gamma_2_2_inv-gamma_2_2-gamma_2_2_inv.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index da4710b07..f1d98976a 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,9 @@
  * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
+ * @gamma_2_2_inv:			Gamma 2.2 Inverse
+ * @gamma_2_2_inv-gamma_2_2:		Gamma 2.2 Inverse -> Gamma 2.2
+ * @gamma_2_2_inv-gamma_2_2-gamma_2_2_inv: Gamma 2.2 Inverse -> Gamma 2.2 -> Gamma 2.2 Inverse
  * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
@@ -576,6 +579,9 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
+		{ { &kms_colorop_gamma_22_inv, NULL }, "gamma_2_2_inv" },
+		{ { &kms_colorop_gamma_22_inv, &kms_colorop_gamma_22, NULL }, "gamma_2_2_inv-gamma_2_2" },
+		{ { &kms_colorop_gamma_22_inv, &kms_colorop_gamma_22, &kms_colorop_gamma_22_inv, NULL }, "gamma_2_2_inv-gamma_2_2-gamma_2_2_inv" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 32b772ce7..df5f88d4b 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -32,6 +32,8 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_GAMMA_2_2,
+	KMS_COLOROP_LUT1D_GAMMA_2_2_INV,
 	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
@@ -44,6 +46,8 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2] = "Gamma 2.2",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV] = "Gamma 2.2 Inverse",
 };
 
 typedef struct kms_colorop_enumerated_lut1d_info {
@@ -181,6 +185,24 @@ kms_colorop_t kms_colorop_pq_125_inv_eotf = {
 	.transform = &igt_color_pq_125_inv_eotf
 };
 
+kms_colorop_t kms_colorop_gamma_22 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2
+	},
+	.name = "gamma_2_2",
+	.transform = &igt_color_gamma_2_2_oetf
+};
+
+kms_colorop_t kms_colorop_gamma_22_inv = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_INV
+	},
+	.name = "gamma_2_2_inv",
+	.transform = &igt_color_gamma_2_2_inv_oetf
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-- 
2.43.0

