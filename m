Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1714CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD0E10EC14;
	Sat, 15 Nov 2025 00:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lScVofWb";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012058.outbound.protection.outlook.com [40.107.209.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B33310EC14
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY2G7qqmsM5M7gGvxi2sm4RnGG/M3iDogc4o/wcyFLCWNk9ahMdLrMGbtixoNBgt5zVhwkYJCScjssjXIvaxRJZHcD2zeTb+ZaURO2FMrlVVkfCa9uetwyaDtKX/mE9OogWNDTYRyWXL1lG9SyNHtWa3nNVgnStEm+xzMdXDyyGMa4Y7edAT4fF/5XaZnMpn/604PUY+KAzEDoalVeo3Q2tmiTPs4ibmXD/80V72I7LxQIxJdwg4qHPExd3Iiq8SLyBrfUSyVB9fEM/bNeQZep7KUay8VVy0RDkbdRVdmmMtWCJ+B0hjdjBxopj/cAeeD4D0hLrV+VS0zFQHZOjZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dcx/EU8DCOhcRdUvRCotsP2fNBlXLXwYhPTzrwbOb1A=;
 b=nsQplpxqRzhXlK2FdTkc5/zAQ/n7Lkrbnub1pPvXLI0niz1n5MmFKZj0OdBbpFYE1nBCGpy4FGpsG56tCrfbnZgD+8tT8+UFixwCNi/2ktm2Hgpho4T4AnGMGWruqIPEEVybN9sbDKUSs/Yul7iCYCIX+jysvyPOMuvCYus2f6J9e063ISz6AsNgswccXJN5UNKJIl4WZe2ZjLIYeAlnbjQ0PcCY/0ekqHjfh7sw5QWmZyKLnc/SaI34SEvmATZx+RJD4h/IUo7B70Jh7pC+j9I7hF+8apo9gRww1/J8sLk1CQa4D3yIg3iLeMaDwniKFrPi8SOWZpJvJoBlAq3JzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dcx/EU8DCOhcRdUvRCotsP2fNBlXLXwYhPTzrwbOb1A=;
 b=lScVofWbhr+1cHOTwuo1XsuEm4lZJV9c7YEU3Jmyz+36ATASAc3bKWUS76NwNiU9IuhEXsFploAfLJL3hGs0t56EsUTXlmeJSLEZSqSpUdMOupIfCTJTXTFcYiZPzV4PhyNqb8NkQkdJ1Y/qyCkWZwgJ03C7eC9AUODKw63GhrI=
Received: from DS7PR06CA0017.namprd06.prod.outlook.com (2603:10b6:8:2a::24) by
 MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:25:17 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::65) by DS7PR06CA0017.outlook.office365.com
 (2603:10b6:8:2a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:25:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:25:16 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 32/32] tests/kms_colorop: Add Gamma 2.2 tests for 1D Curves
Date: Fri, 14 Nov 2025 17:18:41 -0700
Message-ID: <20251115001841.3563993-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2a8d8b-1e93-480e-3c1d-08de23dd7417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p1ueRCRtZuLxyBB5k5vupwpeF3x1sayA9GGqKL0nUC2nL+DI8VEnIxbX+ZhA?=
 =?us-ascii?Q?XrwjjE7pIto2qiZWVGhn45SdqNwSAfEJEyTkXXO5uqvLxyoTJPE6mdZZEPg6?=
 =?us-ascii?Q?uC64zjVrNDcx3bi+JpT61y4wmgJQot2AV+nYViFudV6kbZt9nnt8UgsrPOdG?=
 =?us-ascii?Q?9Y4vYH74lTfxKvzZcxFmNecO7P0yj94CIhpFn98mmGvNAmIWquxYDX2weKuK?=
 =?us-ascii?Q?+qJmSu0wHQlH/I/FjPmwNm5MV6R8TVh6Jl1+ruU6cSJm7dlBOXjxbgicitNO?=
 =?us-ascii?Q?ph7jZEwuiH5Tj8dw2vGaUj0wt3k0xStZjPzxwiPexqnoWdStK5r2S3l3lB1Y?=
 =?us-ascii?Q?fLrhSzxIV+5QJf0eYcmcvx4fjgRMX7sFKXf2KTUiBaGorCGmK9hEbZeT/UjV?=
 =?us-ascii?Q?fwAswjth99B8Mu2nInMPH8MMwS3zThTPaniR72y8psMn1uTqgQkTmZVve1EY?=
 =?us-ascii?Q?Prie1cY+hESwQ8JwOtNFgFnR7ClIz6FhwzA4brtxP1KVJMImtjWfvT4sAwKF?=
 =?us-ascii?Q?giMtxQbXO7hvgMDrUee2gqnI/s51Z7fXZRAZhf6lZ/btSWewHOUYmsVT1ydm?=
 =?us-ascii?Q?ADX6WkWXZT3k21k0xthlu2Va3n4mZKiNpaDDFR6iEB3yVfToyuc9ABjtmUAE?=
 =?us-ascii?Q?mMljnm7ILS+Ge0Leafl1jLpy/EgBcTzm0uF8Cc8Y0oTtcX4hO/NKiHQ2rBMt?=
 =?us-ascii?Q?uBBTI5/FyG9cHCre/4nOtXfcytTkniRPTeMFrI8aVFBXkzabASk2GAQSp+mz?=
 =?us-ascii?Q?4Muzh1yQZrKl38KaDTnw54QccKuLiF1wrQ2xtWnajcZaQJmhURBQJHrsCql4?=
 =?us-ascii?Q?XNoXjkYS4kXpaPQvNDehuPM1obdFWc2E29vHgq9CfK2jxSgOwbinMu+Hj1aC?=
 =?us-ascii?Q?T5GTCW8CjuY8iVez7KTqI+SRzuecXgqSrkwttGXmX+ITLZJTN4tZZh1nUn1N?=
 =?us-ascii?Q?PEjPPyQcidr9omNQf2HOR5E3fa3pdBDJIEcbasL3q1jzCpbp0CDXOIMhAQsv?=
 =?us-ascii?Q?zIZJOSmADsr3dNupkVFuedvU3AGwhhPsLdCszEnb8CZv5bslkNQSZQf3SyqN?=
 =?us-ascii?Q?QNOYpVcVDM8CrSLCN2I+gdaaxEITTDIG5O71+5Ae9T4QpwwH+WetLTsGnOYm?=
 =?us-ascii?Q?/bfPsp3iVL4lroPm9iWr87xFSwSHzQdiSGNu9/yjDtorDzn6LvaBPEI3+0LG?=
 =?us-ascii?Q?JRrOF7K+FsHozIgwvx5wiMXERFSIcF3w1JInH6b0DS3DYfuOZRsATFyB+c68?=
 =?us-ascii?Q?g9SPY5QRtxFdK+jHjud0JWvStmq7GFgLFsgzPaaiPHVdYIGL0IJr/XEeg+f9?=
 =?us-ascii?Q?n6l0DdfGYmXOm2I8bDipXqXn9NMnX81t8YphQ6mXLmOb2jntcqqjiiPwRnCn?=
 =?us-ascii?Q?sRhiv/a3nS1qZxo1aIjw9VtYij4igW+DzFNOTtAV9wRo3WtPX9IoV8VR6CBs?=
 =?us-ascii?Q?lRCxjT+USq0q9eqxl7EEMm71NrD5hkYlk3Imq4+i5YZ+X3+QoMAv3keusiiq?=
 =?us-ascii?Q?NkmJVaWJmw2TG2NQvijYwFZZLvMxnkoQogzMadbDVaw8+ouxxx9aVbvLUaXI?=
 =?us-ascii?Q?NIaclparD92rtOCM7d8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:25:17.4811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2a8d8b-1e93-480e-3c1d-08de23dd7417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
v12:
 - Clarify gamma 2.2 names (Gamma 2.2 Inverse OETF and Gamma 2.2 OETF)

 tests/kms_colorop.c |  6 ++++++
 tests/kms_colorop.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index da4710b07..bd1ece9a9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,9 @@
  * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
+ * @gamma_2_2_inv_oetf:			Gamma 2.2 Inverse OETF
+ * @gamma_2_2_inv_oetf-gamma_2_2_oetf:	Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF
+ * @gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF
  * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
@@ -576,6 +579,9 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
 		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 32b772ce7..a1b2d5d76 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -32,6 +32,8 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_EOTF,
 	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_GAMMA_2_2_OETF,
+	KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF,
 	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
@@ -44,6 +46,8 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2 OETF",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse OETF",
 };
 
 typedef struct kms_colorop_enumerated_lut1d_info {
@@ -181,6 +185,24 @@ kms_colorop_t kms_colorop_pq_125_inv_eotf = {
 	.transform = &igt_color_pq_125_inv_eotf
 };
 
+kms_colorop_t kms_colorop_gamma_22_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_OETF
+	},
+	.name = "gamma_2_2_oetf",
+	.transform = &igt_color_gamma_2_2_oetf
+};
+
+kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF
+	},
+	.name = "gamma_2_2_inv_oetf",
+	.transform = &igt_color_gamma_2_2_inv_oetf
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-- 
2.43.0

