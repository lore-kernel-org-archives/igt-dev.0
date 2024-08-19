Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03314C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE1C10E488;
	Mon, 19 Aug 2024 20:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2/P8b1FL";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA4C10E482
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFXk+NE2rUH/BVXyriGad2VbEHWy8nXO5hmAeXMWTog8oci3HuV3Nt6E7s/mS0y3JeVzEIbuevwhVq2axor0tOBOEDkQ6Cq51luPFu4OFWnHQZs5V6d6Sz1oxKUzmfnKGVNVBpDwyepmR0NYI2w3AA8gns1mmcISyq/LabKz0gXbke0FrlmyPbiB1/4a1kNe/9gcCobuT0jlTmpWaLgCDlu8YftTbEmQPnPx9rpqsv1kxm5x/npPZjjdn4tmUVsPcPK1MtcuZ/r0PVvy/q6rg0vMvKynRuFnjm0GxTtv5SY/+lEZc7WqUne9St3YT7P/5FcARtx2WpqzORjleshdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B38spb9W7D9oYwJz9xpqGL9fmtyxnAOoAL4jv/MtX3M=;
 b=MRyyPJ22WSiW8U2nUiVHb6sPvr96MNrZJ5BJwfwaXayNfhHTeDADiv58r8wtC5BAMUxcgA3aSKzRUD2GNpP7sGUufGSsv89qIEZcLB91IJXmIkcnaDRLLZtkRni/n8kZTFkFkAlpd4AKBbwHwh5dVhMOcxERBgU4e73UXKLsP+Rlrt2zsjD2TCkzJeKT6HdfQUFRF9GRStld/THeb5gvD+RlsrrrLFLPojc6nKGhaUAlQE+PneVSAbD8uvqjcqHmXudecjOhVg5Q2XO6FFokF/cbQq4uZgHWYCniZ+fDq1i5FsV0ZtntKtdp83Eaf5w3oxZqizGPI78EHihbVvPGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B38spb9W7D9oYwJz9xpqGL9fmtyxnAOoAL4jv/MtX3M=;
 b=2/P8b1FLHvr/o1EQLmipvzt2AV+i5qUZwfoIxyrkkMVB1RIpGGSWsEGXHefWkIg/667k+/e1vC5budhqmo50ypuOTAX8gijnwv2nYsVaDOB0yBt4ZdefgJi3hUapjUx9NsmrjYHyA3S/gYjXXm01IXy4wMGMs05pr5cOWn1rgh4=
Received: from BN0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:408:e5::23)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 19 Aug
 2024 20:58:40 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::f3) by BN0PR02CA0048.outlook.office365.com
 (2603:10b6:408:e5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 27/37] tests/kms_colorop: Add a sRGB test for EOTF ->
 Inverse EOTF -> EOTF
Date: Mon, 19 Aug 2024 16:58:13 -0400
Message-ID: <20240819205823.316656-28-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 52701a55-1839-4868-ea0b-08dcc091b3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+TYx1j4DLUYOKvlVtU/dcncYWF05jWJSO204FNrGQHAA6DYg/iv8eILResP?=
 =?us-ascii?Q?uXHlxoUzhs0SVGQ+aPkuhW6qZmwqhJDKSgVCFcvNAimIgomN3glIo+QhMchK?=
 =?us-ascii?Q?OI7icu1ruKTdYNNVvl7CvmXF2YyXlmeEpN03BtQaIcWK1yjyG0jl9YpkCzkm?=
 =?us-ascii?Q?f7E7lblM4Xe+qi8Fr83OaAr0Ph/mIoQNe438No8mfJqWYUwcImKuS2HjEfOR?=
 =?us-ascii?Q?7rz6Yav8B094R5Tx0YSqowh2xMWG+y5xLzLt1ATN12wC6vc+Ot18Tfde8M5L?=
 =?us-ascii?Q?5B5LeK3/sw8K42khmJHruHs++CT4DoGkOozUJYW1VDuJPVi2+Z1TV3X7OgAe?=
 =?us-ascii?Q?vqoVPRUeJLvctHQOAXJtk9Z/KkqYX5J/ULlkpmC7oxo77MC3H8aaV6ElXk3s?=
 =?us-ascii?Q?XrzErNvy1uaaayGkK32BZ5KAOCrENUVrWnIHSyBEq9A1Ul8yj8lWHzeKVBCF?=
 =?us-ascii?Q?SFNh9n7/eVQNDPNFEPdyZ1HPJ/mYhzrMprPUcI/1voIuYVjtmJ97GLt02xBp?=
 =?us-ascii?Q?wL059LI25UHxaVDVFNAoXwOQ3HQuYhVjOOX57rxLvG9BeyLIgEaQ2jj4edy4?=
 =?us-ascii?Q?z0OrAUTgrotnarNsMmXwCXViWzp2/5x6X4El1dGBRh7CDdy8DCAR/VfzrttU?=
 =?us-ascii?Q?ie5tqzzIeqwl5wPPHK1Ygh6xWfMYH8ycJc+Tl6EgE4POuWYnB+Ii+aYLKMUJ?=
 =?us-ascii?Q?Mq1E3tsjfC6IGsL2hicvY79NTvfeDQ1Y7EVxA/5aao/tGDPGuiOKjznzCxXM?=
 =?us-ascii?Q?ABgQg5YqEgOmudZ8VHrJAq5ULow8YIQK+OBf2Kxge3R+kkn+GWRLzXZPIlmR?=
 =?us-ascii?Q?7YrNP0FFBIjzj2hqMNEEYqrECAVsohy55TB2Sz2b/jkoODdgB8fr+jbfvgiI?=
 =?us-ascii?Q?Ht0Hcy3XXuHdPt228gGQ1HAvkzSi+ID6zsCrtXaJpdoBBkIqVHleN90670Tu?=
 =?us-ascii?Q?gakuDaCdYEB6y5mEWs9Q+E1VHmF6Rskrv3kjGWnWx4pgWmMhzgRMAqMNlMBN?=
 =?us-ascii?Q?Mev6i6bOE8iCo2cjtzZut/1DRsmGUyx/YQ56JX//NCGdpRqbinaz6WmnvokA?=
 =?us-ascii?Q?zjxrDQcKxjGhvqZJH74BEW9EiFVAgxWJRaM3ahWrO5Y1O+uaVcupvLTi6YR0?=
 =?us-ascii?Q?rWByQAekMhYvvrT/hLDZUZQrk80wpe94TCn0FzDHMCKOv/rVwtJveeeU3IaJ?=
 =?us-ascii?Q?BSqgf23YC8lKsD/J+fdb9HzW7u9UdH5uNgrDc8vgZoYg4hknwTBwN2pkLSDs?=
 =?us-ascii?Q?bbmxzhn9l86eVLJPWvIiAYC5sJKjxGDpZmz1iHgwgv1K7alIBGxiz5P6swT6?=
 =?us-ascii?Q?SDD9VkZ2+C1+mBGHL/ywVMzZpKXas16TN5wX7799RvVp6k+gv7zpP7cmiHlE?=
 =?us-ascii?Q?QP3GG/ua5eu7wBYTL3XNfhC3rrbWYgKKAx4msR0iXS/sb0PGo+zaoyWRhvkg?=
 =?us-ascii?Q?+9B5iMgNtpBavsipVgJ3iJ1JZNMoOQlA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:39.9114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52701a55-1839-4868-ea0b-08dcc091b3d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 538c527f6d5c..e86115372a3a 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,29 +40,30 @@
  *
  * arg[1]:
  *
- * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
+ * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:				XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
- * @bypass:			Bypass Color Pipeline
- * @srgb_eotf:                  sRGB EOTF
- * @srgb_inv_eotf:              sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
- * @pq_eotf:                    PQ EOTF
- * @pq_inv_eotf:                PQ Inverse EOTF
- * @pq_eotf-pq_inv_eotf:        PQ EOTF -> PQ Inverse EOTF
- * @pq_125_eotf:                PQ EOTF for [0.0, 125.0] optical range
- * @pq_125_inv_eotf:            PQ Inverse EOTF for [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf: PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @bypass:				Bypass Color Pipeline
+ * @srgb_eotf:                  	sRGB EOTF
+ * @srgb_inv_eotf:              	sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @pq_eotf:                    	PQ EOTF
+ * @pq_inv_eotf:                	PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:        	PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:                	PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:            	PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
  * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
- * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
- * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
- * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
- * @ctm_3x4_bt709_enc:		BT709 encoding matrix
- * @ctm_3x4_bt709_dec:		BT709 decoding matrix
- * @ctm_3x4_bt709_enc_dec:	BT709 encoding matrix, followed by decoding matrix
- * @ctm_3x4_bt709_dec_enc:	BT709 decoding matrix, followed by encoding matrix
+ * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
+ * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
+ * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
+ * @ctm_3x4_bt709_enc:			BT709 encoding matrix
+ * @ctm_3x4_bt709_dec:			BT709 decoding matrix
+ * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
+ * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
  *
  */
 
@@ -489,6 +490,7 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 3188e6db4300..7d5cb4bd1669 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -88,6 +88,15 @@ kms_colorop_t kms_colorop_srgb_eotf = {
 	.transform = &igt_color_srgb_eotf
 };
 
+kms_colorop_t kms_colorop_srgb_eotf_2 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
+	},
+	.name = "srgb_eotf",
+	.transform = &igt_color_srgb_eotf
+};
+
 kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.46.0

