Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02389CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A374510E8C1;
	Thu, 30 Oct 2025 04:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VkRuCrF3";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8DC10E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:33:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn98zWs82DxBg1rZiZ/Zrcol4vZ8yREKANg0RyksnafEABavZrLueutmdl4E3A24xnPDDDz+ooXgF2Lakl2Iu7xIvhke1Yf6FAI5DhBumGzPOZg7PnKCZfaSo+RTQoTBe5elxTNldEhNBsdagvsKFzRvntXi/IfkDja/4AfLBo0lvkEYLaSoFvzWPYfuQTWQxoH/r9qduvqZwLc8zOpo/vHToQZi/hek9ZeuQcH9oC4OShcQCK9WxPZiiiE9G4dK6gtWGtLOxkoNO9TIIb4VOyOZpR47XPddWB3w+5rElTh/Lq+hUt6/IPnR+5gTSmhBPSQ+nPIctlNu9wRpp9Ks+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GpU35aSovf+BJhwrl5VxeJB8uh19mkYBfY9gIBEc6s=;
 b=tVTWmb/ze3F1X0XqdNmK+uwHAzzf6Y3bd1Pswd2SEOl33UnpKKCl0XFvmrtz1ra7Ja2cvt2iCFYfxzjurM2UzFngPj3AyTdaSaHy4jUoh/gShdChbsX1p9fm/H0QqH9c9vFm9mxMofbIEy5RRGoM4y0dFT0XNadpouKFxzgDgDJtU29UKjaCzLxgaVICJEuhAVKrizs0GOdBL3asjUd9xKV435K2Xe9ygXCNLm6PqCu3UW21s+pMCB8FKSbjQXI0p9UpfCvrICzCjG6x3KUmBwpefiJy5M99S+2iBj1pNTzrk5PcYEibSPhXBccydHFzzM56iWoaDzRoR0rFnUGNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GpU35aSovf+BJhwrl5VxeJB8uh19mkYBfY9gIBEc6s=;
 b=VkRuCrF36q5SkNhPzQGB/R7hxFBd9tFg5MT+1Ui5QDQWPId46pVHEKQdMr8O6sijMbxA7CTW4bQUFtcevKF0Wdnc/KjHPg3CNEcwFuCZTFg/l8/8FkSUrPWrxWq65CQRFQxDk0IUyAclCcI8AGjWCdAUzsnll5vyfV8Zgb/X7dA=
Received: from PH2PEPF00003858.namprd17.prod.outlook.com (2603:10b6:518:1::7a)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:33:18 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH2PEPF00003858.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:33:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:33:15 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 22/32] tests/kms_colorop: Add a TF sRGB test
Date: Wed, 29 Oct 2025 22:27:51 -0600
Message-ID: <20251030042801.2315866-23-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a533452-f3ad-4122-a007-08de176d727f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ksSF4x9GbgEWnfbNTk0mZwEEb3u1kvjtH5YF1bnT945zD/0VBY1EXGUz2JJi?=
 =?us-ascii?Q?zOyCtGYkaeHkDPxdwYGVBziELv6vTyoIT45qKKekrBsXoqAHrHUET6D2OqoA?=
 =?us-ascii?Q?/LzqYcRgN3SwSnMqtvrYK01O3X1iTmNeH+cu9p1/B8WkQ7L9dp3U4616ntBk?=
 =?us-ascii?Q?GTocd/VGQYIJEG/3XMmi5sMtveoCZlRca7jEGCbONbmiChalrpXHVEyNvJtG?=
 =?us-ascii?Q?sCuBZcAmq9RWQ/HrEjMEmD3mP1+nwhs+5T7Msd4IsBFzZbpmZxsxy+F8Ghqv?=
 =?us-ascii?Q?fuVM01Ri9gvm0/8yPE+P62nCxMNP6TJRT9aVcVxWy2uf2jZAyNCEwGxbJl1+?=
 =?us-ascii?Q?m250/NYFeOzpCzFOvY4tClQqT6DNgVoM0HdlAbKaVOPSboV3TndR4Rnr8vm1?=
 =?us-ascii?Q?diEodQHG6SFLve5xF5rrHhu25toAWs5521Xrh5F9UJa1hp+o31bMuVPlN/Eo?=
 =?us-ascii?Q?8uBaIeHZGB2mmWSZHGk00yvwSTequVg//yk0P4uPNQxUuHwkrenOQlAMw+TQ?=
 =?us-ascii?Q?c8z76b4DlqFzKdxgPZCG6mD41wgCxzCdu3iJy2jLXJF1xlPM5/oh1eYYCXjz?=
 =?us-ascii?Q?1ePg5iRC+246l7RL1w8kyur5RYJ5AvEyEVd51lTSoqZDuZagVRX9g6fo5MHo?=
 =?us-ascii?Q?Z1tHDCqg5L/2lBssIP5GAJo6FxKwbVAugGmHDKQUp7DLt4kubl9FMylVU27H?=
 =?us-ascii?Q?UFV7AUKN2ggb/Fua7dE4siM+06G32P+agTRLWmo7PRa/O/SzCb9nYfxNzgQq?=
 =?us-ascii?Q?unfLmecqh5t1kbmhWgSuk0gb9gJyUC2eJx4Uwfy/i0L8Hh+cEheBkv3RGKmX?=
 =?us-ascii?Q?Mq/ue3fcDH6FHmquiq9srM1/AJOeDOhPPD7NDTJ4k8E+yPUTcusLrhiE6d9B?=
 =?us-ascii?Q?CDblwrpdlESqESIQiPUC/hCy2ZyYCFLo/MY3zQQn3QaHuiwWE41cJXpRi1b1?=
 =?us-ascii?Q?ktOck11JEU+xyVQAPBTy8KnoH9TVKEA9xWvsIGVHWuVi4EP2jMMqNc1GoctP?=
 =?us-ascii?Q?Pz6JSdkFlUYha9oFafPsUhOpngkDb2gXBo6TYm4U8wB23KDG2sVDiAMNrL7u?=
 =?us-ascii?Q?67M5MUUjo3ntHah0pnnN4OXanI52RfP/EOFzByOfmDK8MewD7Zbc0Rp5JClg?=
 =?us-ascii?Q?Vcdnnn2EKDlZ6DiEX9Jh4XaM8binSeQJK11IxyBh8L09gvFqL4vrHZzY1ZIH?=
 =?us-ascii?Q?BEztywco5gi0DTlgvbc/AXV452AMWpbrEfZi0CFSv0ug0xCjG1lUUAeeFQxL?=
 =?us-ascii?Q?QqjCP1dk3+w0l/oYlrRWu8sS4j+sE5eHhWopmKem2nvNLwnO4BMRYnILUZ3x?=
 =?us-ascii?Q?LWvg94mJa2qhJIYVuS/+Rps/YTL4gX/9pHaFyDlMWhBAue1lgaKfVdxwoxOV?=
 =?us-ascii?Q?ggfikmLd6wANjFIB/F2vIzKRLN8O8XhcAnP7RWvbXSeX3hL/BwRCHcokCqXH?=
 =?us-ascii?Q?AnXuw49LnBsbVM6SSKqpbWsozQZvV7rFT9q6KBP6IGJZKfv0lHGDm/UGJD39?=
 =?us-ascii?Q?akZo8nKfJmu+jKHDVQJM42tECDx0gQWmNYATmK9bbswALjXlQr66Jctn1KnE?=
 =?us-ascii?Q?Y6n6gdOUDJ7un49vQkw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:33:17.2303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a533452-f3ad-4122-a007-08de176d727f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
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

Add test for EOTF -> Inverse EOTF -> EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++-------------------
 tests/kms_colorop.h |  9 +++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6c62ebe01..6aaa38fde 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -22,29 +22,30 @@
  *
  * arg[1]:
  *
- * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:			XRGB2101010 framebuffer and writeback buffer
+ * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
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
+ * @srgb_eotf:				sRGB EOTF
+ * @srgb_inv_eotf:			sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @pq_eotf:				PQ EOTF
+ * @pq_inv_eotf:			PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:			PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
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
 
@@ -439,6 +440,7 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
 		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
 		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
 		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index ec25722fd..d5656d813 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -71,6 +71,15 @@ kms_colorop_t kms_colorop_srgb_eotf = {
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
2.43.0

