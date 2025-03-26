Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65ECC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5631E10E79E;
	Wed, 26 Mar 2025 23:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NePyxpSc";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D8410E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgOyQUbSFJhLimGhEvOSbN2QlquUVo0/3s5dEvOyoM2q/EGGeZpyphL7+4xLd0OFBn97q+PPjhdfBls2VRU7V6dGZZDoN6bxkFLB9CxM7Cpo04Yqkmml8gK6Oq6hrn9K7yIEzZPeOuHZKpeyJg1/sRZUmzou+pqarYYfBPOxcJe03cIVDoG8N7wVBJG2pgX669IQhyQ604KLkMt7gCwQIgvq8Yl9bCeKebTUG4PrqIUuVgwtqkLgqHhQmz0EVbfQg5GH9lAjfbMrn3z6tCRx0Bb7R6LgaOrct+mNBTGIwRMCvyAu82RI6W9daKb7wQRUbBKFL+WYdw5YgwGLe0cjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yydtV3HIGCQEUQpLOs28hRrSiGt9PnXydde/Ekeicuc=;
 b=kOYHksa3gX+NcwQlEuHGBIr9Hj7Hix4pbHVIdxNLjlYsXTyhRRJuLLxnAIhkrO9yytcV43/OxLKK0QsM0iP2XtXGU67Rt4YzEjd0U11kjor9KNhu4m9z9TBiuJE8W+vs/Fj7MccPN8jiPwzrtI9ciuMjuNeuW2SmSs8wzeA3vv+P/DbJ0AlFLoVbN/zPu3GP6hF/kFHtvX8fL03QRGoeb0w2m85SSyFAMnZNy6skI0YVi3swAmzigQCeC6EjESKOcG1iJDl9kLGdrfeAAaVkKEQIVzL17YNLGevFiy0OCpMQ4nFX2YJCQwK57PMQNjMr3DfvkVwDSUVNRXlHlHibuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yydtV3HIGCQEUQpLOs28hRrSiGt9PnXydde/Ekeicuc=;
 b=NePyxpScQgKjXpnv+ca6/J4AL0VtOgcTj4+NoodJv1hdiocXTnIvXJk/fLg5Hl65Ddyir3jTStNOWhbXvu0BIjPS8rU0yDgvKfvcKiH5c6arYoWTywMNInT89sfgrBGFBIugWqdaioeZ6sD0/JJKRvH+6jzDLNgl2NZ6LhFsiLM=
Received: from DM6PR06CA0069.namprd06.prod.outlook.com (2603:10b6:5:54::46) by
 CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 23:45:59 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:54:cafe::b3) by DM6PR06CA0069.outlook.office365.com
 (2603:10b6:5:54::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 26 Mar 2025 23:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:45:58 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:45:55 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 32/37] tests/kms_colorop: Add multiplier tests
Date: Wed, 26 Mar 2025 17:36:04 -0600
Message-ID: <20250326233609.2980110-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a10489-d2d7-4bb5-41df-08dd6cc05b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fXUeeaFDmgOA7Gy3Yuowvn+CLu7zEoOR2HvXuHtM3BRVnnMSklcfFeIhWRBN?=
 =?us-ascii?Q?hx4fyUH8yVr/Khg97wVebo/ZMDb6vDLi/gSpj0fh7N+aZdk1XrqiDwNXFjz8?=
 =?us-ascii?Q?zkc23D8GTNgbr6l3sWjXrgc9yoH4uxUFB6bOSQtnfIiQXkq5OIg3H1BPLOPF?=
 =?us-ascii?Q?o0MPkc87N5SYpItYj+tIdC6NYy1gDnw0zDL0w4BUbgu2AdcC35zX/1VUPtRt?=
 =?us-ascii?Q?Z5otuYj6R2pXMyV9T9Rzx2MKnNe9UPqraylp71t1CCOtijmG2WgqnwdyTbH3?=
 =?us-ascii?Q?CnMFAkobqrCR2MI17gCNHkGpJx16i5deTpIf23rofTeS4m1qoJsz8rWtGFzb?=
 =?us-ascii?Q?Sr6tDyFsdNUYqy9o2b7uxYatDce68kTd/HA1JMaWuqa1VyjAXItKJov5G6HL?=
 =?us-ascii?Q?MVvxDa+4ZUX3axtTWmFX5uQPHrx2D/2QBgewzB8rRqUZ5I7LCnJ+JIzlxpZu?=
 =?us-ascii?Q?IVxXRsxMZUOofvI4Ukb4i4/roc2TMWt6he8W1PWqGlJShOjtewW8ytvb1mjN?=
 =?us-ascii?Q?DlDB0dzuJhwQ50OjtzJWW02/uquPGuKojbyoRmWONGhPmmTWvDKz56cua9Az?=
 =?us-ascii?Q?haA47f/Wg44eofTOJXYoEYcGd9d7GjIeCh98qQ2EA+IZbMKJhRDmEF9Odf0h?=
 =?us-ascii?Q?bEQnADzcv+K63bPQ44+0A5/Lmu93No9e6wLpWNg5P5b2SVtAsyDUEDzffce8?=
 =?us-ascii?Q?UamVNJKt1rcN31SmFdaL1uhzZ1JhpD8XcClkcNyBFD1OK/J3QgyzyvrOlLI3?=
 =?us-ascii?Q?P9WA/zwKQ+DJHYpET+sEYkMuWlAujTzQu1QpU3GC/mGByV1qQL57NgU1d7DI?=
 =?us-ascii?Q?7PPxgGw6Neqa/N56RD6Az3wmz4HoDyLVgBGlHMORj8vh9UcVklKOoyei460Q?=
 =?us-ascii?Q?AG7mwK6IUoUjnCVKb8zjJqkuGrK1Bzi4LtpjYQtV/sjiMfVdEmKdUdCkfXd3?=
 =?us-ascii?Q?3tLT/dTr4h/ba77ZJRxA0w8CRiFHC28GFXH8fmkr8Ec+9MLTP/dJlYrGnGrs?=
 =?us-ascii?Q?uFRWCxiqHPKQoxdENBGLSzfgPafiQBCotIHKuFt1cyIs56/LJg5NkAGzHYOk?=
 =?us-ascii?Q?RUN+/dxZXdJUZJtHZM3YXOuK4J6u1wOjJDByXXG5pQwdJcCTNOMB8S7NHc9q?=
 =?us-ascii?Q?M9ZsaAtrQgW5jL5saXRkmR7rmv4+jsoJlOYsBfmV2KJGop4FHdgXWvf8+zYS?=
 =?us-ascii?Q?RcXbHkSlRm9IUF9IS0IthlAMOaXN9OA8M/mollOuqwoFPuludijZMZkh1GgY?=
 =?us-ascii?Q?DeNI9dIx4hxgBQ7lMvzYb/0TuuRYMGPObH2ZKnicfYrnHsXmoi0Po5Lry/sp?=
 =?us-ascii?Q?JGTJtbuV+2RFNmUZVnHSz14MLOXZipQnZaS8undOVTX7+ONzo77rde3KG1gr?=
 =?us-ascii?Q?q6TcJF+sBmCGlmtKoXOkR4x4bI4NDtr62eq99B9qUf2f5xyx2knp0Oh1vfyz?=
 =?us-ascii?Q?uorY8kdRXdyKy6Vy7gt9xenipdE5sHl6gDyGYa5RlNoZMArGqId0Y7t4IdXo?=
 =?us-ascii?Q?EJUvNA4+zXwStac=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:45:58.1517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a10489-d2d7-4bb5-41df-08dd6cc05b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410
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
 include/drm-uapi/drm_mode.h |  1 +
 lib/igt_color.c             | 10 ++++++++++
 lib/igt_color.h             |  2 ++
 lib/igt_kms.c               |  1 +
 lib/igt_kms.h               |  1 +
 tests/kms_colorop.c         | 11 +++++++++++
 tests/kms_colorop.h         | 15 +++++++++++++++
 7 files changed, 41 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index fce45b5cf..2cf3b4307 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -878,6 +878,7 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
diff --git a/lib/igt_color.c b/lib/igt_color.c
index cc5ee3b0b..e6f435bf4 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -197,6 +197,16 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
+void igt_color_multiply_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 125.0f);
+}
+
+void igt_color_multiply_inv_125(igt_pixel_t *pixel)
+{
+	igt_color_multiply(pixel, 1/125.0f);
+}
+
 static void
 igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
 {
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 4a9f9b7a3..4cc34cab5 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -147,5 +147,7 @@ void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
 
+void igt_color_multiply_125(igt_pixel_t *pixel);
+void igt_color_multiply_inv_125(igt_pixel_t *pixel);
 
 #endif
\ No newline at end of file
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5e0d710c7..e2349118a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -711,6 +711,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 33bc8854c..0e8fd104b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -375,6 +375,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 436bd085f..90348a345 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -236,6 +238,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -329,6 +333,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -346,6 +351,10 @@ static void set_colorop(igt_display_t *display,
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
 		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -546,6 +555,8 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
 	};
 
 	struct {
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 13d15ea66..1def86bc3 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -36,6 +36,7 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
 } kms_colorop_type_t;
 
@@ -73,6 +74,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
 	};
 
 	const char *name;
@@ -223,5 +225,18 @@ kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
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

