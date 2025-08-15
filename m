Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B7CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBB10E9FD;
	Fri, 15 Aug 2025 04:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oXweNqsR";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB210E9FD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEtOJ1TmhPvpxk0iLJ/GOGNlTooM9T3P+hloOxC5JebmNi1EX9S/pR+r1LVtOgJAafEZR95iAO9RQHBEf1uM/YcKTKQahjJ3sQ9EBjKXU6jOnOtTHd8DKOBKwJayacl0HALKsHycQp0x9nmCWNOQjYyISj3FjkVkDQ4JFz57Lg2UB9j8TvgLHqNn4JMrA4H3xScZWzipsC4IH7PH4XzcO1r6oPpkkfcQBx0DQLnP4Z7FwArUdtfsLId/JK6X/RIMUZL0nAweKjN/bzrg74Zj/9Jj1ajiEp71J6mxqgqB3v1XU5XQPxkPn/ukO0bdT5En+MBoxAm3P2W9izBrrWEzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLVakHe+HaF8M3m0ZnA3tQteMYYhvTELnC4b5PEK7uU=;
 b=bOLhNL6HU2jxwpcgLP+YJLACxSrDUcUe0ZRe54O4YOjOa/qDuwzhzi4ob0vXfEgF8oBpV7/ZGDmavU9OC5y8LMoj7uMqCsvnpYdbbfT7tonK+8+vhIzsaXnBwingTGI9CrulG8qJ+/bM7Plzd7KJF3PgYURrhCfcgl/egHzc4yjn0QaTcZD6EIlcikv2IHI044hjEcJeH+y9+uXMjJrrH3L7AuAZ/HVxhYKqvwurjioCxCy5BrJv5J51jV3tUaG4ytTfV7v5AtW0CpqWpZHhXd/z4gd9360IXChhizm8usruvo5ZhZjnSncVQR2qJ65ZfD3G3Zs0ihR3f3PLKXL/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLVakHe+HaF8M3m0ZnA3tQteMYYhvTELnC4b5PEK7uU=;
 b=oXweNqsRq9hEt53KarfBVu7mCMnXkCSpjSLXarOIZRPAyKnArJhuJA00JHe+46sx5r4IbjV7/bfLUh0QCrWkmsJIMN7OWcxl9Ghld2IMr+FNpjde0TD6AjjfqJ3jShHJuCAkRGCyDadPoHNy4GJ6i+tUEdaAjFYQLu0sJJYIDIE=
Received: from BY3PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:217::23)
 by CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:11:04 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::40) by BY3PR04CA0018.outlook.office365.com
 (2603:10b6:a03:217::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:11:03 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:11:02 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 19/30] tests/kms_colorop: Add tests for PQ variants
Date: Thu, 14 Aug 2025 22:06:48 -0600
Message-ID: <20250815040659.3321102-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 1374e6d2-20f9-4b9a-7664-08dddbb1c05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g676uDViE1vXrUo+G1NAcszjKIqpXinbe2wvI8YCjfccX3/YBf2IbU9LTuwc?=
 =?us-ascii?Q?lncOPswvaYyeov0ElmNl7iBeMHmm4usVJPjrgDjnQn2sLGHilPfN762BbQeU?=
 =?us-ascii?Q?Zw9SC+afd7JJMrBNWVgz33ebfPoQlwvZ/5lPsHSLClkD+BrlSs+quXJdalxm?=
 =?us-ascii?Q?M0iqu+QGeTPDPRKF4j5RsUFwM9LzIgkxfqMBs19SyQBs7tAw50+K8ofOkNSU?=
 =?us-ascii?Q?AH7gStacMfH3Npyr8E3NlFOuJ2P1onz/iCdGiutlnp1j5L5zYp3Sb92gFVPy?=
 =?us-ascii?Q?66XzN07dkUNmPatAgFQkbdJkdODUvBi8t6aJZfwt+WYdPYGg3lRh3+YsgVUv?=
 =?us-ascii?Q?JWOvS4uHT1LLz9mTOW5w6xVpfqLtxp7mojwQGU0hrPWQjRdEsofFd+60LZZg?=
 =?us-ascii?Q?QbRUahH3/Ll3869F5RYdR5auzKCFdR5RoG8QuW32jnpPhl7yPiOafgiQA2Dt?=
 =?us-ascii?Q?ckZa/B2oI9rNmvkgZ5uuHK/PvdCFA0EDUQZTmCWR5rNqhnAhrwVnKjO4qKck?=
 =?us-ascii?Q?pwZ9euoQJ7zKn9ugxRxlK3+eFMwtnSSTYo4UDDVw3/jgzcDDrhzEAVqpUOFk?=
 =?us-ascii?Q?cdRIdJAI0JYG5QxfLlGYecTjNxJoj2aOtm8M56w13aiK87Gcs7uF++XXnXgp?=
 =?us-ascii?Q?0resiBmYLoY5sQ6JfiJhuzoqphViT9T69UDE4sDwp/gtBRrlbvr6r3rSDbsu?=
 =?us-ascii?Q?LJt+k+/p7nykcTkS/TPzJEIflUqb6UI+GReMOrAp0w5stF8rTgjSLT85Xuno?=
 =?us-ascii?Q?suMDSbOg63VlCXFtlWd451gFDIlsYr6IAK4MKTMHui8uw/Lh7pxc+h2qiQGS?=
 =?us-ascii?Q?4o4D17SVaRJWvkYUQr4V2JguKTbkvwpitsflcG7UG/ek+RWlbnXBFzEdbyor?=
 =?us-ascii?Q?dRvKc1i1mhh7ynDaiDneWi4fXBO+RpadXT1Dpu+JuELVHELExVUphEL8re83?=
 =?us-ascii?Q?3laPtjMhCwGoIxytwBiovEe5QnLG169zXeomRs9pQ5FurrzPJcRak6QGze4q?=
 =?us-ascii?Q?kb8Hu2O82xQlglml5LjkRGfD6UF4ttMiyiOfu0Wz5+MFD2WKqHnSAwzGVid2?=
 =?us-ascii?Q?LriaLgBkwqErDZjFo4OaBr0ykqdiacoDuvjIW3TUY8lbcUOPa/ZwLCbrgBCz?=
 =?us-ascii?Q?p+dUv1J82vNtmc40A3u9AcvjRhdpV9CiwZqHwQkp+QrZL5f1g4M+dOb3edMS?=
 =?us-ascii?Q?VNDMpx1uZSY0HgTdJEEqMq5eDMT9Ai2xPKMNIQATqC+mZOWTqkP6aGmWKhy5?=
 =?us-ascii?Q?fiuzxe95W0faXhcN4t8UHnVKeD4LmO9vOExttRrSmGO5qCPH/UY2DSERCYKE?=
 =?us-ascii?Q?BmonYysxeWhERC9EtEWIRBGP3h5T1NqWKKUyUGQs/QKGN+C6GCAvuGbi1Mbl?=
 =?us-ascii?Q?r1+L9ERMToSzLLnSSYtafrKHNK1/80rYeB/Dx4jJrBWH/eS0XpZru4DrAVWs?=
 =?us-ascii?Q?6dpnz7+RHNtvjRjDjasHUpVqd2soyJaqoQGTyzQ0nDoKJaIgQsvtdiVsTBB+?=
 =?us-ascii?Q?mDrqexnberzqsZFqEQgkgHnmtmnft2vQbxbJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:11:03.7976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1374e6d2-20f9-4b9a-7664-08dddbb1c05a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339
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

Add tests exercising the PQ EOTF and its inverse, both
for the [0.0, 1.0] variant as well as the [0.0, 125.0]
scaled variant.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 32 ++++++++++++++-----------
 tests/kms_colorop.h | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 1528da2f1..c650ea59e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,13 @@
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
+ * @pq_eotf:                    PQ EOTF
+ * @pq_inv_eotf:                PQ Inverse EOTF
+ * @pq_eotf-pq_inv_eotf:        PQ EOTF -> PQ Inverse EOTF
+ * @pq_125_eotf:                PQ EOTF for [0.0, 125.0] optical range
+ * @pq_125_inv_eotf:            PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf: PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
  * @ctm_3x4_50_desat:		3x4 matrix doing a 50% desaturation
  * @ctm_3x4_overdrive:		3x4 matrix overdring all values by 50%
  * @ctm_3x4_oversaturate:	3x4 matrix oversaturating values
@@ -213,7 +220,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 {
 	switch (desired->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
+			return true;
+		return false;
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
@@ -293,18 +303,7 @@ static void set_colorop(igt_display_t *display,
 	/* Set to desired value from kms_colorop_t */
 	switch (colorop->type) {
 	case KMS_COLOROP_ENUMERATED_LUT1D:
-		switch (colorop->enumerated_lut1d_info.tf) {
-		case KMS_COLOROP_LUT1D_SRGB_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_PQ_EOTF:
-		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
-		default:
-			igt_fail(IGT_EXIT_FAILURE);
-		}
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
 		break;
 	case KMS_COLOROP_CTM_3X4:
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
@@ -480,6 +479,13 @@ igt_main
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
+		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, NULL }, "pq_125_eotf" },
+		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
 		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
 		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
 		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 8f0c29cba..0f56361df 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -45,8 +45,20 @@ typedef enum kms_colorop_lut1d_tf {
 	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
 	KMS_COLOROP_LUT1D_PQ_EOTF,
 	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_NUM_ENUMS
 } kms_colorop_lut1d_tf_t;
 
+const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
+	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
+	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
+	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+};
+
 typedef struct kms_colorop_enumerated_lut1d_info {
 	kms_colorop_lut1d_tf_t tf;
 } kms_colorop_enumerated_lut1d_info_t;
@@ -86,6 +98,51 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_pq_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_EOTF
+	},
+	.name = "pq_eotf",
+	.transform = &igt_color_pq_eotf
+};
+
+kms_colorop_t kms_colorop_pq_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_INV_EOTF
+	},
+	.name = "pq_inv_eotf",
+	.transform = &igt_color_pq_inv_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_eotf_2 = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_EOTF
+	},
+	.name = "pq_125_eotf",
+	.transform = &igt_color_pq_125_eotf
+};
+
+kms_colorop_t kms_colorop_pq_125_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_PQ_125_INV_EOTF
+	},
+	.name = "pq_125_inv_eotf",
+	.transform = &igt_color_pq_125_inv_eotf
+};
+
 kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
 	.type = KMS_COLOROP_CTM_3X4,
 	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-- 
2.43.0

