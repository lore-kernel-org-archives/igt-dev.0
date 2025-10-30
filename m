Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF92ACCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7310E8B0;
	Thu, 30 Oct 2025 04:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pEiJ0Len";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583A510E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfSVMUu8pWKEzfgW3lw1SF2Hy8zcv+t6BJJJaoTJd6fH4XhJvYXFtamkbcQJSKGzGRRZiIUOlwRwr3R4B5A0NWkX5eUhtRa60iRPGKUtrsmXYg9t+wy8wmIfsBua/hGfnMmcARgeX1yLzgHrt+XBsfdKVEjZErCXGNpd1aQN1G+/kbwloLXy4vFfRrl4qhWS///lPtAEIx3Nzo9pKGawfHc3UV5TK/4ieOJYTxTK+43o8eQtKV8zkfJi3M79vL7xXK9CQGSPQkWRjD5rO6s/QMXI71M69jgl8pSToLqmKjbIujje0H7502RMAWQhCgK4V5qDaMiZ3fJJV8Tuaq+3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVhFR3hLQN1J3d1WyocWWQHtSe+qB7tQ2uq3GzZXkfY=;
 b=YmO0g4YlS8G3/rgRoikkzyOxOEekLLWIX1gv2urY6YwlzBC+1Gs1ij7CyjffmF3SfUEa+XR84sSW7sqI6OuEpzqLmpCzG8zRAc+8UyKXRCxgm3zy47bvLAQBNS2QNfg+cY8A/KIqEw+2/qT/Gkt4zlUU9q0dtvr4w5nHlQOJPkuRn6YMgFz5if0wyrzmT0yXwPPk+exdtDd0ysOoXc08GPAaEfqTu2V6ucdzqPE3WSWi0ioACcXClqIF0JT7qLFkntRTcrpQPmpNI+uK8fxon04QfEYk7EmJf0Ktiz0Z+DJORIf/LtRJg/vrljL7huUmiOyhlcyNrw/2E7r0M9QlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVhFR3hLQN1J3d1WyocWWQHtSe+qB7tQ2uq3GzZXkfY=;
 b=pEiJ0Len5oFQ/9Zjnjnbsxob2nXm/3VO094L+I1tN9Ny+hSfEnIk8WfcYUCToBKQa2eymuAkhWg5R9EZgmTaygZAfu7HHf/zZsKeyRGRhujgmvmmpPTXMLpCCPAs15mU/mbtDMzysD3jEIgaSgzkOo7xlQor4Ef9TOgts/I+23w=
Received: from SA1P222CA0090.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::22)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:31:09 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::d7) by SA1P222CA0090.outlook.office365.com
 (2603:10b6:806:35e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:31:09 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:31:07 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 14/32] tests/kms_colorop: Add 3x4 CTM tests
Date: Wed, 29 Oct 2025 22:27:43 -0600
Message-ID: <20251030042801.2315866-15-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SJ5PPFABE38415D:EE_
X-MS-Office365-Filtering-Correlation-Id: 27be401e-9f95-452e-c5ff-08de176d2627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bkp5b7grEuCi3TJlF76WVN2UGxBOG0Q7GAzwgOHRKwjwyu3ravLU3VF/EL0e?=
 =?us-ascii?Q?qgOarli5+GJbdUUI4+QqmCrx/O3GDBIcRazrIxDrszNWoZm3OUTvXHuIso2n?=
 =?us-ascii?Q?UjWVNByRbUB9WiAq/FGjEJvhinbJFSCUK/9bsj7bcNGex5uS+02kJjBZWkU8?=
 =?us-ascii?Q?zXMx3xqV3XqZff0mnyoHiOhwzGtOE+TxKk9qyr0cbUszQbtu7XkGF5J6reWy?=
 =?us-ascii?Q?8CvSleGP46P2u+Fa2AMS6I070CTgdb679gsAdQRrSektFuKihVjLaJQLfgoy?=
 =?us-ascii?Q?AszhTYd62qeY8i9E+pBuUknlrjZaj4r7y7p8SwMWbmWHxZuKCGRdBtyD60HR?=
 =?us-ascii?Q?E3lSPjQc8Pmf74/O+Uemhf8BiyuPga9TlIIZzm+MdZAXnssj1/XsVSd0ugdl?=
 =?us-ascii?Q?RhNr4zD37tcSoSoiYi+ZaunZ4SFo92pTEHQh8TmmesEkU4AQ9fDoS+iZsN7M?=
 =?us-ascii?Q?0J9SrhL1Ohl+SRQh+ogFdNb9PxIzLh/bPAlEeYwCC7b2C2Yx+UCMiUD23KTM?=
 =?us-ascii?Q?STP5MiD4HrNO90nhp+XjWc6IuyPLrjTzyZe4heZ7C3ga0zigAwtGG6nG2Pko?=
 =?us-ascii?Q?+rofYzxv42rgHW1aZnwvmrfdqTMWujEGK4nYjQZAWC9TExAxPSVRRW6M2lns?=
 =?us-ascii?Q?LRKF6LymCkLJkY8hAxJb1KGBe+7p/8T54COEwvxF9Ff4CzbL5+6bkgkzpE3x?=
 =?us-ascii?Q?5j63iWkg9eqNXAuID55wmwNdHT+i+yiYWfW/vLXTIy3E1MxhI3zHoAZ0ZpWo?=
 =?us-ascii?Q?MsAQJ7wgOX8JTawoTh6mJu8an3MF2BtxmVIbmXRGbj0QRbyvMu+O8Gx1l5NL?=
 =?us-ascii?Q?myXhwjQeG1DnA4w6c4J1jc7+NPOc1TgzMzFxjUUDGeefUK63lGjCOzpiW6NJ?=
 =?us-ascii?Q?SO5hKvR/rCIzKs63T8RSO+ZBk2T5RWGJYeXY5EEb8fmX+//3weZ6auIFH8AH?=
 =?us-ascii?Q?AlnzQVzDFrP0rKh/xtP1+MduDG4aIZblRQ++D/KvNAOLQlnJ7vDHZzDC2AFp?=
 =?us-ascii?Q?w/LyGhEDMkFqLmvxWFUK7lvAgx8HBwORW+Uuy43wxyfErtan1v2peJQW6q/H?=
 =?us-ascii?Q?QmxLcTU5PAV0N3QKLKLxw25RVLJueczelYG3hT5c/seT/Gwosm9PBFl2EoEs?=
 =?us-ascii?Q?BxX4gY+VpSp+I6GTjN1RGBEgELy+ooLF3UP1LJhHx16SObxrViKy8ju1/+/6?=
 =?us-ascii?Q?al1RKfgoiTjNksIZ1MwfqNdHxK4Zhr1xfbwLFU75BLBpyZ5G6T3Q//ZSczCJ?=
 =?us-ascii?Q?T54U8BgXjfS1H5a4oocP59EVu5uWO9MZ4LsA2VSlqHlu+fKfXjaB8fjHM97U?=
 =?us-ascii?Q?GqUyTgCPekH19tfei1POEIxcb3QhUbD5p4xRxGxhpdFQvmj+LeErNYAigv2P?=
 =?us-ascii?Q?XsRZr9GI3TCcYtxPSzo8ImkDmF3NKQaN4hYDFK7Ij4kXQOcA6UO/CiebISU5?=
 =?us-ascii?Q?dM31fhTRbrgdJGNEuwyzfDFxjcvn7E4gdP4QDeufDLp3bcV69SzVNurulJzA?=
 =?us-ascii?Q?Kd1gh3nOlB+kW5iFAgNrXgQTN/o7x9avmX1aLB85JH8Hi4P0KW6eqNwa0mUc?=
 =?us-ascii?Q?hfX0R66a7ZfpR5rap2w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:31:09.1486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27be401e-9f95-452e-c5ff-08de176d2627
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D
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

Add 3x4 CTM test for color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 42 +++++++++++++++++++++++++++++-------------
 tests/kms_colorop.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index a5e4f19e9..108e9a0e5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -22,9 +22,16 @@
  *
  * arg[1]:
  *
- * @srgb_eotf:                   sRGB EOTF
- * @srgb_inv_eotf:               sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:     sRGB EOTF -> sRGB Inverse EOTF
+ * @srgb_eotf:                  sRGB EOTF
+ * @srgb_inv_eotf:              sRGB Inverse EOTF
+ * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
+ * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
+ * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
+ * @ctm_3x4_bt709_enc:		BT709 encoding matrix
+ * @ctm_3x4_bt709_dec:		BT709 decoding matrix
+ * @ctm_3x4_bt709_enc_dec:	BT709 encoding matrix, followed by decoding matrix
+ * @ctm_3x4_bt709_dec_enc:	BT709 decoding matrix, followed by encoding matrix
  *
  */
 
@@ -122,10 +129,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE)
-			return true;
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -145,13 +152,15 @@ static bool map_to_pipeline(igt_display_t *display,
 	int i = 0;
 	int prop_val = 0;
 
-	current_op = colorops[i++];
+	current_op = colorops[i];
+	i++;
 	igt_require(current_op);
 
 	while (next) {
 		if (can_use_colorop(display, next, current_op)) {
 			current_op->colorop = next;
-			current_op = colorops[i++];
+			current_op = colorops[i];
+			i++;
 			if (!current_op)
 				break;
 		}
@@ -213,8 +222,10 @@ static void set_colorop(igt_display_t *display,
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 		break;
+	case KMS_COLOROP_CTM_3X4:
+		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
+		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -270,9 +281,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 	return igt_cmp_fb_pixels(in, out, 0, 0);
 }
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -430,7 +439,14 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	} tests[] = {
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
-		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" }
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
+		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
+		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_enc" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
 	};
 
 	igt_display_t display;
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 3c161f30d..db62196f6 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -18,7 +18,7 @@ typedef int (*transform_pixel)(igt_pixel_t *pixel);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
-	KMS_COLOROP_CTM,
+	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -38,6 +38,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
 	const char *name;
@@ -67,4 +68,40 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_50_desat,
+	.name = "ctm_3x4_50_desat",
+	.transform = &igt_color_ctm_3x4_50_desat
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_overdrive = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_overdrive,
+	.name = "ctm_3x4_overdrive",
+	.transform = &igt_color_ctm_3x4_overdrive
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_oversaturate = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_oversaturate,
+	.name = "ctm_3x4_oversaturate",
+	.transform = &igt_color_ctm_3x4_oversaturate
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_enc = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_enc,
+	.name = "ctm_3x4_bt709_enc",
+	.transform = &igt_color_ctm_3x4_bt709_enc
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_dec,
+	.name = "ctm_3x4_bt709_dec",
+	.transform = &igt_color_ctm_3x4_bt709_dec
+};
+
+
 #endif /* __KMS_COLOROP_H__ */
-- 
2.43.0

