Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4656C3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490110E682;
	Wed, 30 Apr 2025 01:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="raPLL9nV";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D017C10E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADbjn35RCNG0S/Pla8far2BJnCjbE5OSXTKvsTsCAPVyZt7/7BOQ7Jo3IpPIAesEoCYxTCiI0lBBRLbsuHm9fHa3UFlSqE+ySC/ljataM3Lx/z6I6SFr5AVB3liNlsXZnbksKAMrkaDVUP9NsAnUuPjtPxiVJngUWnyWkxxCYYeOyA1fs9HHfqtbPsZV40cAhCv0xs8h1PQZ2iK3+XFpW79c+DxbxfT/CEIQVvpQnJI/Gy7tk2Zh1oD6ggCLwqLsBRP8CrzQAI1W4r2V/MnzilrSS6joLgF7aTdMty1yR5VuOdxjKHp73iZnLvxyMLMkgCV9sSmK5Jm9/1mV1D0ayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq9jblIMtpUyYG2xu9WXoaTj0d317XQSLd8I7BQDHxw=;
 b=HDhskwLQEOA8iBZDJJpoE8o+acN6QDm5pNcaYBywAk7zZ8jD067UkpqDl5Rg/KyQGWKxdLVOEsmNe7OT8n7sDfBBXKoo7XGuULsCMh6wDsGiWStONto8UWpJ7wNBSqt+kowACRPPCWcBmkujNGWl24T3w+D9run3Qrgh2em3xnV7Ttj8CuM+23Makpo2jRrsBN13m6N8iWw2M1/D+3AlCIZ4evMtpK/Zm1V6cJbKJjoe2h2A91cO++lHNq733PUpitVAAqfQ8jOJElu96IL+dvFeC+l1bBiDADbpoVC9HlXCMcF1CcG7ogFxferCfpYDlNP9RO9nib16sps3qLWSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq9jblIMtpUyYG2xu9WXoaTj0d317XQSLd8I7BQDHxw=;
 b=raPLL9nV0x1STsDii0USfjADbZniWBBFCOG4+/eJ3OHtGltpb172b910xsDMC/eGUyhhnAWGPauFMRoobTxnSGMEYZ00POyMQAsQQWzmc6bqNK4kxsMd35jI0D9cYKZZo45WAt7zhjh2/AVOS+OEGKmd9EVR9Txnn0HIzINSvJI=
Received: from SJ0PR13CA0095.namprd13.prod.outlook.com (2603:10b6:a03:2c5::10)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:38:37 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5) by SJ0PR13CA0095.outlook.office365.com
 (2603:10b6:a03:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.18 via Frontend Transport; Wed,
 30 Apr 2025 01:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:38:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:38:35 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 16/36] tests/kms_colorop: Add 3x4 CTM tests
Date: Tue, 29 Apr 2025 19:34:34 -0600
Message-ID: <20250430013454.226910-17-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV2PR12MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d01790b-8d6b-4f5e-13ba-08dd8787ba7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r7rLwOnh07KKF3YfqdiQU9S+nkgu81lMFnk3ti31Xhp7kJZ63AwpfkgYg71o?=
 =?us-ascii?Q?oWURncNYocsw90aI2Rk9yJuURYz+KrzXz3xCL21IGApyz3kVwAMPpDLxgO1w?=
 =?us-ascii?Q?mpISg0BFUscvBFj34GLraoKlrKEw1MaK45ysUiV9Ylc1W9s/YbhcVz4Cl2C2?=
 =?us-ascii?Q?fUDrck3wJ/sKLCzj7CM3qME0vv5dOaW/JJVSBsufpbDjDVdkoKVRpfdveWmN?=
 =?us-ascii?Q?W1FkCK4qniWl5eq0VQ/TwVC7wPqEJVj+/sfGVPiiFxQnFtFOCYLcgAt3balX?=
 =?us-ascii?Q?6BFlgWrwhU3eG/Cp2JfXVLgF/Ow8sdkcpT6brhsda3hXsxl1Xph/VlNHBZoe?=
 =?us-ascii?Q?x9ofAaZUZWfMWL2ER3vT/Gyn8wIV3A5boqBSokZZfijHJ2aQeNN7HPx5a2yl?=
 =?us-ascii?Q?b14mfgGk9w0yT7/PCIVPuBcjMmLLicLv1/n1K66BxxW2K06/dBxXZU1j6DO8?=
 =?us-ascii?Q?IjSppy/ubH5e3416JDViEfY1TM41SEv4BJ4XCnmTvR/3aJ5kAcWrGfxbT5jY?=
 =?us-ascii?Q?v+v5boTMwUEPjcmBUFQLQv4hm9Ka0zhTSASJzFnXezJyBaLM8sD1LjerB+8J?=
 =?us-ascii?Q?1IaStAsNaostgVJXoiRw5Pv4PR3Br26d2TbGFa5w0LU8YM8dlcgeMCougZa9?=
 =?us-ascii?Q?1sIXjodc6d5cUaXoM3R9HXlhFIfP862kEDrF1YLWvC/HIvnxxWn2VeIiKmxW?=
 =?us-ascii?Q?XbsUe7Gn8Sqz4y8I3vIGzxixMjz86LUWE9c8YqahBYl32RnEMJQex0WW4Od4?=
 =?us-ascii?Q?UsnFyy87BuMe4tOGFuwjMf7ymvpgb/kwwO56k21KxPRG46z7YTuJ/XzAigYJ?=
 =?us-ascii?Q?QFxoHgv6G9083D50p7EpgRAQDaN5cy2i6DQ1mlNxwQfMi2lid2OS7ZyaxUuj?=
 =?us-ascii?Q?Xpxo8JnJKBoizi9WNGFcr/DG2MjpLusMTizOz5euamiYPBT/9kUL3qffOS7D?=
 =?us-ascii?Q?l5i80ECtljSl4geyAXb7ZMRFgGNIwig+yewxjCgLEEqCjCrrGLNwYhARTzeb?=
 =?us-ascii?Q?fFyKUFSD4DGQqZRKSC/hx30wB1n3kz/9d1GrUU5JZaIhIcFRZ/etZs6yFqha?=
 =?us-ascii?Q?H2M436goJFxXZpJbY3c8WU37tODM5Lcfw6L43HpABAUtMVp1eybsK0n9/qRv?=
 =?us-ascii?Q?RJwZniMoMuf68MxWCrXPBiRI0q+Az9lQ/89+aE2FV2iFzdmicB77Rc2KRQEk?=
 =?us-ascii?Q?R/e3pEYJI9zNoP8e9kROpX9xTxtQq0MsO43Ogq7vezbZnxQ5+xoOIvt6OTna?=
 =?us-ascii?Q?d8Q3DHutKKqP7PCP23rOE3lm5o7jTGbrq3wcSueV8ugpHilG8E50yyeQMizH?=
 =?us-ascii?Q?PUrx8jyW7DgZE3qibrHhK+qLaGKjYNSxKqEDKoSTT0z7zLPrwdSxggOh3STS?=
 =?us-ascii?Q?U5gXEH3AkMT+6bGQeDZemcVAmv8ysABcEVLbqqb5IHiOPoQrTosrG/sEhyic?=
 =?us-ascii?Q?GbLc+ykoClRc2YUFxmwBXJ1ZxCggIM1j2tQ9KiWZqNegLQVDnHRlNr72iVeN?=
 =?us-ascii?Q?W9BIk2byKoGaFLTiBGFtj3HqzH0qN/QtraTZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:38:37.4152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d01790b-8d6b-4f5e-13ba-08dd8787ba7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821
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

v4:
 - Remove unused defines

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 43 +++++++++++++++++++++++++++++--------------
 tests/kms_colorop.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e770c6b2e..95ccf2c47 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -39,9 +39,16 @@
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
 
@@ -180,11 +187,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE) {
-			return true;
-		}
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_CTM:
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -204,13 +210,15 @@ static bool map_to_pipeline(igt_display_t *display,
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
@@ -272,8 +280,10 @@ static void set_colorop(igt_display_t *display,
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
@@ -330,9 +340,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define DUMP_FBS 1
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -480,7 +488,14 @@ igt_main
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
index 8102d25b1..30278ca4e 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -35,7 +35,7 @@ typedef int (*transform_pixel)(igt_pixel_t *pixel);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
-	KMS_COLOROP_CTM,
+	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -55,6 +55,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
 	const char *name;
@@ -84,4 +85,40 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

