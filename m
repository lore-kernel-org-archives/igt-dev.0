Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C189CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3EF10E8C1;
	Thu, 30 Oct 2025 04:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VDgvleku";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E80510E8C1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwyACou+CArMWAD0Yvtzr+o07LQqEQXCUkpO+SNy6w4LoUHZ76wy7mQVE24jNp9oVyALbtKgnu9e4aimaV9676GzJuDpp7smBheO5pjBorM8UCJCwq17ZNib01ZEY4rksg2lD5BmeUMQeD1IstQL2VdEUbZd+cMGw4s13R1kuqgjYpECtQAkvKuEM/is3GPPZX5OSNZsbCs/gYuh7FyaXzUrvDzOcLuT/PC2Z8fcrbPHjQQQjaEAViIo1sGmEQpzN/hoI/rclJ3Fm5c3sE6W6Ntc7hyhaVkBRiYw70EdgjQmbcBJnOOC3y0Nyr5p+zY0PmTNctSLW6f6yxd8TQwweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yzaNQp6Jvhji5bnTQ29J8wJ7M5hdWn6SNBF7mri6nU=;
 b=iew5XqJ2KLIWAuq5BE4syAVW8jSn8uwR/C4VqV3FQoGMBsm17DjpTvoSCPnzwuCCkRHiyNr4eYNmX//tdxnnh+NAtrBLXk9Yv8ibRnYQMCQGdK1Q42CQXIvqPGPabg7wYZe5+wkKBp34R890nXm6idn7HmpTbkuavlNeEb2gqsXW+TTS6HWHFJzYYW8KKh2UsFwVEJ9NIxGRcznMkH6LlbaZ3EZ+2Pr5plkAeNfjbI11wLJ2crrgZMHev1yARlP/HwrRWb0E4ZOM/wl818HaBKyjlXI0AmbtekhhQZTzSlw27f8peone1Eqnhxie/ewakVQ2qmw0rMkkEtgiWySx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yzaNQp6Jvhji5bnTQ29J8wJ7M5hdWn6SNBF7mri6nU=;
 b=VDgvlekuV6t9nGfqz2NS6lC3bPCAhc/h10v7TE3oCLpJNxZQ+MsHFPef1GMYlevDPTCmo6BxXfx0IHJ0DjA8dOEH6fKgTEMNZAsbUVOmnig7P0URgBYajFSk9Y2QxLnbwRsaGLAjbQGquNaMck7hpG/etml7Aty3KWztFISYj4A=
Received: from PH8PR02CA0001.namprd02.prod.outlook.com (2603:10b6:510:2d0::19)
 by SJ0PR12MB7084.namprd12.prod.outlook.com (2603:10b6:a03:4ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:34:18 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::67) by PH8PR02CA0001.outlook.office365.com
 (2603:10b6:510:2d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:34:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:34:16 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 27/32] tests/kms_colorop: Add multiplier tests
Date: Wed, 29 Oct 2025 22:27:56 -0600
Message-ID: <20251030042801.2315866-28-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SJ0PR12MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d996b7-60ee-46e6-edf7-08de176d9694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jm1jtUBbke6qH2E+bvRkgeOR51O75HPyr6V1YeZtZAWLcKxz1zaw3qR4m1cS?=
 =?us-ascii?Q?KVTkhzk8vHgN3quE8QrOaN8as1kWmFY+orhVMJTsRwCJttNyNVVMOt4EVZvC?=
 =?us-ascii?Q?xs6bmSivnRBcng2Rj9x+RCCt8b+V5DjLZ6t44atAsREZwZPk6lX6dlltZsUY?=
 =?us-ascii?Q?IpvaLedEHa5XKl2n/Z51n5/Y7yqgOKP854U2IcyzbBZcXIb/XjVQt1kac7vG?=
 =?us-ascii?Q?/LZWqEt/UdNlmq56AUPBFNowmXH6TVfpnWtwX+yN7Bu2bJqIPviQTyMX1lBw?=
 =?us-ascii?Q?1HZl30o9fkvBjXf3M7AgMJRqdSj9r1aHklP6WnfHg+ILHv36Aowx2AgUtanB?=
 =?us-ascii?Q?xf+WDlOD/100iyftN9/L/IhK1HWr7HlUXzVygbeUEsdxJrJxhcdc0HTUIJCM?=
 =?us-ascii?Q?qii/20wD/oO63XcEKxozS5+mc+gbPBKZV0kq/FjfiOqMG+1ljTbhpBeGyPYc?=
 =?us-ascii?Q?sF1GiwPENLLuZGTLSj5eBOse5BYPBInxy+VAH+R6J1c5h/FK6AiygWiuvOF6?=
 =?us-ascii?Q?w98CUfXyW+zUQg2wZK5e3kx6vOp5W1KskAjxNZBcQl6JhP0ih8RO2J8bv7Oe?=
 =?us-ascii?Q?feih/ecGk+3HUK2gNqtk5mlTg/OmNjhDXszIZTO7382xN+TKy2Akm6DVbXXy?=
 =?us-ascii?Q?g4x9TkV+Q3hmZfUckagSAdivICNFn4wS7NDr7lgBg0rPqwSr2kXSjz9RHUBA?=
 =?us-ascii?Q?woAu7PakCUICsW/nLG4rY4dSZTkJk47biDydHPAN0O5yVigmX9rKlL05Nh0Y?=
 =?us-ascii?Q?rdn4fQFkfhQok7giOv38jlOlqqVn+uQZAQ5/Z+ITgQTGrDZz6e2OGewf1uah?=
 =?us-ascii?Q?umiInXElk7xabRuJV4HWYh7J+1zalHlBU8C7np4QTH5aMwdt0Y2bpYhd8W0Y?=
 =?us-ascii?Q?d+uKkTpwQ7VUq+qeDsD/Oy/2gVDQac/OylUhVDAyfGENMbkv7VLoMVhx0r9s?=
 =?us-ascii?Q?X6yK7vO7Bdud/pru3bKvWT6HA96qUekT0KGWejwY3oHOlAx/2WTk6X8QGy5A?=
 =?us-ascii?Q?r+4joI1PMxP0icIMrlRSNNSuEB6ILTMkR8CsJClBeftMsLgRJCJNQmJfY+nD?=
 =?us-ascii?Q?HiPGR8+8QPAPsxWHr1W87E9Fez4Tg2wpjSQ4VvOHdo67YJ0PeQlw3ZcaHmHK?=
 =?us-ascii?Q?Fu4Bnxs7INFk217h3sxzHHtkUMk9hbyz1jlxa8gxYutBCRtXRodylnqSPZZ4?=
 =?us-ascii?Q?Iy/VEoFagsN5o3ccvEqlqZy04KJhqulECRIF/PqCF6iAEk1qCvmxIxwb80pc?=
 =?us-ascii?Q?Y6Jcw6hZPat/kiC6+COnOXqODAdv3Tw4iTQrKXjDyUYurppheYyEVgkhvOHK?=
 =?us-ascii?Q?1e251jog516Kurfg2z/l9DmandsserqFovbBzSeuy7R47mJ6lJko+txvqEB9?=
 =?us-ascii?Q?nco+PUOXV7PH/tDbhrjbQmUmz8FWiGM1IDHJYIj+4bhh8S5llgTjZ+uNKix8?=
 =?us-ascii?Q?gpue6ZNhAuZydpC1mZ/89WFjtz7Wj0Za6bdFAyAzyeg8aCxccb9KyReEGlGe?=
 =?us-ascii?Q?sZdYnHrxUydu9xfRfmpOcSCuITBizy6SKpjWsJgtS5bk056UZz6ppCmea+kX?=
 =?us-ascii?Q?h46YEm3vxdAUUAg5VJM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:34:17.7732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d996b7-60ee-46e6-edf7-08de176d9694
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7084
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

This includes multiply_125 (125.0f) and multiply_inv_125 (1/125.0f).

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_color.c     | 10 ++++++++++
 lib/igt_color.h     |  3 +++
 lib/igt_kms.c       |  1 +
 lib/igt_kms.h       |  1 +
 tests/kms_colorop.c | 11 +++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 6 files changed, 41 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index f6ce69d9f..270e33432 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -203,6 +203,16 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+void igt_color_multiply_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_multiply_inv_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1 / 125.0f);
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 1a39ee734..230640b36 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -130,4 +130,7 @@ void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
+
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 #endif
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 041daa178..ed4d8aca1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -712,6 +712,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fbc0e66ef..9033e1873 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -376,6 +376,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c4e6550b5..f70d9c6a3 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -51,6 +51,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -177,6 +179,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -270,6 +274,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -287,6 +292,10 @@ static void set_colorop(igt_display_t *display,
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -496,6 +505,8 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7fee7f8a7..c57865111 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -19,6 +19,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -56,6 +57,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -206,5 +208,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
 	.transform = &igt_color_ctm_3x4_bt709_dec
 };
 
+kms_colorop_t kms_colorop_multiply_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 125.0f,
+	.name = "multiply_125",
+	.transform = &igt_color_multiply_125
+};
+
+kms_colorop_t kms_colorop_multiply_inv_125 = {
+	.type =	KMS_COLOROP_MULTIPLIER,
+	.multiplier = 1/125.0f,
+	.name = "multiply_inv_125",
+	.transform = &igt_color_multiply_inv_125
+};
 
 #endif /* __KMS_COLOROP_H__ */
-- 
2.43.0

