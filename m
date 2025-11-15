Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEC1CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393F710EBF9;
	Sat, 15 Nov 2025 00:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jB7ubZSX";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA5310EBF9
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch0xNkTT0moXFav3fBEl+mPbbzsWu6vbHRwyHaiszvmZtWW9V/XeW3eD4k0u7qpap9+obfwkGVMzU/MTOKF/Db7pzUlh+zfad4J+UxqhtKhSs7t4FyWJeokZ9B4BBcVWipyoLhn0rUZju1OXvCjnkL/RLb04NtfaE6EQjOsBFoa6vYyrx/a3tRIZB/4MVxFqDdPvERO3trL9COBUIXspHx3eiN7ok+bEQPBRYQXGA2vJMU1eQiconvPsLmMueBw84o73Xcq6m+q+pTWiE8ou3fYrDcDtnpIUUfyKIA7oPTqqkO0ZHVDjhxbRdg8+jdOOp+ghuGlpY3W1Zn7c1fdBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsphYpZ5p2uMWb38nDIqltaSR4UP+UKb70x5gvyFs9M=;
 b=B4he1T8uMU62qWuPMeW5Ee6LeNA6ODoPIqeOR3gGfabHhTR+UOwjdYpBqujjZKGPMbgVkVyLtVizJaA6fXZXRX6ud5oGbAszrJK2I/O/724Dk0AClb3k9YFIV2ALRZLBFXFMR6cYNHGu9lIG/WSxjBWTFLtP/z49PLEQdcl6JsqW4Jz/IqRVK2Q3iY3sKtEcmzw97SjqvJWnM8ejPxjcQPsDFp5jG4yMpLZzgigC/zuMR4EVsMFD+eR1OzkfaZ38QwM52pfw9YiFqlGigDAAUHu/KWFdHaBuRAR1VQWNC7rZUm+KQ4WSsQA+Ru4TzE6IS+PL95wTzWiUUIUlaCgoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsphYpZ5p2uMWb38nDIqltaSR4UP+UKb70x5gvyFs9M=;
 b=jB7ubZSXiP7JI/CiYVQQi0bvj9FBZ6WWQ6E1arQdQOeOnTUZAlY7LRkDUkg2YiPHH1a6Uo7WOsqawno2nWdJcUXflBCtW10qDL8HXCtsQn+y5BQ3IRtmNYsR/Ccmb9Pu0dy3C0vw2Llp68MjexFTW68BQmZ34gktPNxY+jskmC8=
Received: from MN0P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::12)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:21:41 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::bc) by MN0P221CA0006.outlook.office365.com
 (2603:10b6:208:52a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:21:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:21:40 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 14/32] tests/kms_colorop: Add 3x4 CTM tests
Date: Fri, 14 Nov 2025 17:18:23 -0700
Message-ID: <20251115001841.3563993-15-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cc0347-ed05-454f-4c27-08de23dcf335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?umeouQYKkCMUrgvfrDLu51o9P91c9ri2MQ+RfjxFpxZ7RgS72xkUTMXLz322?=
 =?us-ascii?Q?NgUbRhDRurQo23bFhOKlex9zfC44adHwNzF0+NFMsoYb8JpBLh1cot+0G6bh?=
 =?us-ascii?Q?xyefhD0JGjUiav9SZ5WZPn13dkyAZEfMQItZX85KwyTysz277qFQaZos6oi0?=
 =?us-ascii?Q?aDxseBer7Tc91/JAk5Wruo8e90qsnlFglv0vW6tT1V/4hFamQ5DXO+576VVP?=
 =?us-ascii?Q?hM6QGl3bPMs5UFMd072Jnx9PQvR+ZHRgI/i/Oc/ghnr5gxQ4OgzJvyK54b6K?=
 =?us-ascii?Q?0gOyDiPnP6dBTd86SG9kYfjmVx71NCyPuW5j33sotQQ1bMxELN1wdxOP+Up9?=
 =?us-ascii?Q?xWnp93tEtdLrT99PDmLpY3KjPmbE5LwCPlVHNCpLOp7pQ/5MGoSxTtoWXPMY?=
 =?us-ascii?Q?oP/DwKdc9p9Iu+xh6w/gUaM3t8a6YFyKY4XQ2w10NhnZLXEU98vzYb5vCcgE?=
 =?us-ascii?Q?rsI9W4UZFszJGAIwuAsken1QU+V0/Cd95yNBW36kXkpEglFASmScpLStANd4?=
 =?us-ascii?Q?/CL6NGQcpBGdyLrJVAT8BRFNSf3iOoSxOpXGvOWHqOv2Bv18W7O4eVb5wcW1?=
 =?us-ascii?Q?lY1vBJamw9wtTtD6u3CndEcNwKCixaJrD+BC4ajsZY2SY1DCfPeOeiBTmYpQ?=
 =?us-ascii?Q?oUd5Aehk40T+/chNQNuTvAooM9kTizZgrTIXZnxsT0vSTBEjrkMyLeDiWIeN?=
 =?us-ascii?Q?FPwjut0pxIHQSOe4GvJyLbzu85RN49SJ+gh9u+j5XR0aexbEoi62+A5c8Cob?=
 =?us-ascii?Q?wiGK7t2bweUXIdIOtRTZMWBy3YXOPQ0m0A6czBrwl08sXf/xA/AKO3ZKSPpW?=
 =?us-ascii?Q?alYgQsCmsc8Uo09DnAgiEqQcPkqxOTDBc40U2585pPQlHjIu8kKgo+yhv7Sh?=
 =?us-ascii?Q?w00OybNf5LhsMRPT4aSZ5kFNyG8ipzhBFCtk6xJE/TE0DvshrWfWzNSpIsLH?=
 =?us-ascii?Q?WooWNI+t8LgtQmOkCZ1i0k5Z88pfneLuDVj0YDJXwdNkkHKwaKuhIRnMnn5W?=
 =?us-ascii?Q?Ce5phYtix1a+fs+W6nb1KXf0eLmTwwJNI10lohGJW8zUl+pFcIUCZ+OnXM78?=
 =?us-ascii?Q?Y4ZcP19ED9EFPI/KTmm6vLAcJ+TPPdaoeax2mq2fLceOGvxCdPjTS+qMijsL?=
 =?us-ascii?Q?KqcxLT9Osx1Ae7XeM/Ioh1WiV53UjtblbKhMHL7yawv01ZzI5np9njivNFxo?=
 =?us-ascii?Q?WcfvzDe/vGg5dGr0EJRK3oEFFZxv5kGQdAqyQJgR/vUlX5g/Wra68ITBOX2A?=
 =?us-ascii?Q?PiVBtaI/LQO1ZW8x8edXEDU48yiIW/zZ1m7HN4lRTY/MsGscc+/JCzFkF0NV?=
 =?us-ascii?Q?zFG8rmtGW4j1vFJCI3F8/9AhdqrHmQuX2RnrFs6cTNhL0ROFCML+rpTF0QYQ?=
 =?us-ascii?Q?nnUz4NlwrZ5dFQ8yPUL6p98b1yxBWh9UUKQ7TeDHcLfXkIQYKH/fWtb0DT4+?=
 =?us-ascii?Q?qAZB/5iLD6OA15ay5P3Rh9YFCRdKhSDqGXXrUFMIBuLJFJJa+tbVbTmVwQE8?=
 =?us-ascii?Q?aQrzqhNqEBN6X3yj3J6IxU7YfUftCrRMqyO+el6KF533GJgMyQ6yZ2Orb4BB?=
 =?us-ascii?Q?Ba2c2tqrjwEVFo3CoxE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:21:41.2882 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cc0347-ed05-454f-4c27-08de23dcf335
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

