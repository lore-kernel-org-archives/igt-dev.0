Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97A4C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548C10E793;
	Wed, 26 Mar 2025 23:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rOwipezN";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE1510E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlgBJW25KIxecKHMp5I4zreVszwUH/EQZ+OrhZ/SniFiLeTrCHeskWEgGEWpj+ppew3seCrJrq2yN/nFZmJG8Axhm/pVW/z5CqdTxZuhn2fIImCH6Se3A9QBuO5oOmctDGOulBA+Vdg9g2NKvPW/tHs3tkLGifyFgeQY1b5XuPtzunYxhThJvb/Nymi5ZLVv5ndv1hrjyjyR7eLKxXITdr/P2JLYra9eXEgEuQ5oR9qRqpqR33NeiraXLxDD9rtNqlStshP1G29shDGinVrlAdAwej2Gu9uk9PPwq8Jk7bgddu1GAT+J/vzOMy4DEHBbKr/Q4/MyZvHnlfY+x1Mx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6oMbKBzak/2N08xHzeET6VZEbDXOhBCVJQahDKUblA=;
 b=CnHLWOcWUslelhULJYUxzEwBj/TmEsm7qxVxcKj+RiBarlHU0APYspgBPiuiCkB7eYMFKzb2sIaVd8+pnVoMv3EaBBStGD44mV4fFn/NdC08YblAfJ+bORz4xjUXREyalEwtNhaROXHuCN61x1/5DgFn4F6Zf/HKHX9T7fvwAdkiXxITRyHuqGlrCeWgxJyVc8dyvuKsoSc6v01XV607T9b2A2bxRvttluHiAXyGtGTFhyOr+dwstXX7LEEl+39/QcFQ2zD6LdBtJB+Zsk2zUg4JjvZ4MXE+oO4AV8qsAz1gHMGGr2We8ljXRq/Sr/gXveFhLi0zSOrGYTqUnAV7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6oMbKBzak/2N08xHzeET6VZEbDXOhBCVJQahDKUblA=;
 b=rOwipezNDf00l4s57B13qq5Si8a6wHQuH0FZ9XLWmTgvxK5NSDU/9KhbTlh1tTdU/Efj1iub+1fscSZxEIcBV4W8EVsXHWv1BNXKRwVqO32qc9DyMP54ElAVHpzE9xgLNwtiQWU89PeFeTI2ckzLIeHeBU5YYe3K3HstwvlVhvg=
Received: from BN9P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::25)
 by DS0PR12MB8767.namprd12.prod.outlook.com (2603:10b6:8:14f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:42:33 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::aa) by BN9P222CA0020.outlook.office365.com
 (2603:10b6:408:10c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:42:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:42:32 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:42:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 15/37] tests/kms_colorop: Add 3x4 CTM tests
Date: Wed, 26 Mar 2025 17:35:47 -0600
Message-ID: <20250326233609.2980110-16-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS0PR12MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dfcca6-cdce-4be9-590e-08dd6cbfe125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4/a75RCFwp4q1wojoK89F/wvePOkNYLE5HMNUqN85VD+PZ/9FeqhXOqvWgLe?=
 =?us-ascii?Q?TsiivyMiwHy4Eqp9HUVl8F7hmswiWezghgdAgW230nuEpUkv5hmfvLjpDFec?=
 =?us-ascii?Q?j5hTg0HjevDMIOxj1a3CWtlvK0tK6eZbss8zeoXxZkkSkUlgApKsr4Ad+YoX?=
 =?us-ascii?Q?uf/OLhtHinJnehFwPZ2zFdoUrFBvxo2y9dzyiQPM3Qjb/2ejgt/B1WT2AmVJ?=
 =?us-ascii?Q?v+jw+sOwF6m1f+p6MBE5WwD0bSW1OIA5xmihMyjzKKRgnVwW2xrGKs4L6ser?=
 =?us-ascii?Q?z9C+M25SSH5DQzq9M7qa2XSD6981w+BqP99dDvBRnWvt5HjT2NbMcDDWArxZ?=
 =?us-ascii?Q?2gzpKHrnYU+Ws618wvqCYx7Uz2avMONkatdI32qt/NmSHN805AsGkkY1RrQC?=
 =?us-ascii?Q?dRoq0fHbp+4cHlqJtq7iLRF5ug49AhY2i2BqnnhQJGV3vlQ7DRGw/eIDM7/g?=
 =?us-ascii?Q?BGkbN6xSdz0GdH9ZRIz5kNwZFvgaJyPe4ijkDn37IBkmzH5U2XlMLR+GCrId?=
 =?us-ascii?Q?WsYSdLfoMaaWL9+lDHQI17W72ENgAwoKAletAhvlbofudgMJewR3f6MToa0q?=
 =?us-ascii?Q?K2srLg0OUOlBxIRWSbHAqO3n7Mhrz8azfmce4K92D5ClBCeh8ee1uB1ZCdJ/?=
 =?us-ascii?Q?zOeQOi6fe/N0FFggvNio/4LrvZ8T7ClJ8+txXJUPErcU+d8Y+Pd6gKzSHoA1?=
 =?us-ascii?Q?H24lLwHtuXOGYk6M9WQq5Z4WQdihJ1PFQOQWyOQtluuALfFwyEDgc+ckG14n?=
 =?us-ascii?Q?uGBXh90h+9oUZYcpmQUPkoeV3RJ2KJFhxCHAOlgWdu8JInJk81xr84ummeyD?=
 =?us-ascii?Q?20w0PIToSl8Yjt701tjgrKtkvVNxa5/0N4wdO0SWwoijR98vwDtXFPlbHSVd?=
 =?us-ascii?Q?OfVrIh8h5YNSP2zKUUhIfhfa4kHrdy3chATTMJ2Gq1nBwPVIISxgYzZalaqi?=
 =?us-ascii?Q?HKp/sUON8jvx8Tg1S7aIKLcCtF7Ho338GcoVgHyPJFPGeiBOaFStEpvXZQTL?=
 =?us-ascii?Q?iSwkJIYSQ+Ktgn820RIl0KJtrd5nail0lgMGG9+wB4ot9i7J5+DGggYvS/4f?=
 =?us-ascii?Q?cIJ0HZwIVlNnks4r9dEXqci5JSMXmjMy292XVkSeonJ9Wr06vxKliJNZHzEi?=
 =?us-ascii?Q?/zgyKkAbA7xte9DDPDmuPrawaDfXnwcRyC6xZ/iFNz7bTEAjgeV0RPMwKeEa?=
 =?us-ascii?Q?DnS2CLfrQ9VF7R+ZM4//HIXsceXOU3qJCHPmGAlWwrGKHpJwzH7yYZpHYKKW?=
 =?us-ascii?Q?yvLvtWT5SJc0SKd18T+s5TNBRmO+eHO/65vxV2EZCAgRl1zBRepgYVcW+tEP?=
 =?us-ascii?Q?e7ao1lbUQCM+P/T6prGDt+44MHlQLLIm/ym2EeruHwRq1wEkjRW1jFeBFf9C?=
 =?us-ascii?Q?wlY3BWqcDM1PRTFkXLwOYgmKzlDFXEgfsEUyuUqWhIHdliAevlfjFB0JVWq9?=
 =?us-ascii?Q?R8pXfAVJ/N3w3H7YJfV2uZvvGLmgZC1SXxiYlvfCqQY/mzkH5c6oiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:42:32.7884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dfcca6-cdce-4be9-590e-08dd6cbfe125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8767
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
index b9009a498..e782f7598 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,9 +40,16 @@
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
 
@@ -181,11 +188,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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
@@ -205,13 +211,15 @@ static bool map_to_pipeline(igt_display_t *display,
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
@@ -273,8 +281,10 @@ static void set_colorop(igt_display_t *display,
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
@@ -331,9 +341,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define DUMP_FBS 1
 
-#define MAX_COLOROPS 3
-#define NUM_COLOROP_TESTS 3
-#define MAX_NAME_SIZE 256
+#define MAX_COLOROPS 5
 
 static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
 {
@@ -481,7 +489,14 @@ igt_main
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

