Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D70C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E610E793;
	Wed, 26 Mar 2025 23:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4R7DZBkN";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AEA10E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIqBcsJaqOoiKKsw3JdMj294sKd27qw+JwCrt0pH2h88Aipd7w/2lB3cY42IHA4gas0oQN1F16DqRFAeQti7NdkOGyEFcRgwzecctpu6zS6ezrk52ITGeTUmFgZOpHglXWdrDdlunaDtkojb3WpwwvVSLdGGBgIs8v3mzkBHzFuHDIejinya8+1WMZ2loaxZVWbxOVMIJPsY+wDB3HAYkD0qzAnkvm4XitbjgdsTPYUKZ4AC9wz8xRFiFMWNn3jyruzu7TlKeCBEjyfjAr1mKNXOEx/CVpr0tujpuoVJmKKQexDB2gLzzAz7H9OccdxtWPstIoXlxmDSeztJTGKC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vnyi0718K6wVOSB5BHpH0cBEuI3NOvLFp7jQtbcAFF4=;
 b=GlgNLhwpXHDZ9wh8MQjllM0DqDdYwJo44N3vEuHWhe0VZsr3+dF1CuR92PzuI59MmjDjC22mbr5f0X+jhywmhms39zak25+QudfelnJpJ0QPHFNrAjtmfpbdklZ56o8BKDvr6CSdaJew6x7/Xf9MKVLrFJD5/q/3dS8zOowXO0rG8CnARz1h9A9O8vmGwOqGdfSzLL7At9fOFpbOW8SEyPntxmCKmv4yZjuGoaLVdW+/6lwxvi5gFeLsj8yM0xe42b2Vt6CizkFJdAtSOos25DkV1Zl3vcCoagYycUDZ3dN5gccQJyYSQMs2cyR4BSbZWoV5HBiZNMZzEJUtcYhQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnyi0718K6wVOSB5BHpH0cBEuI3NOvLFp7jQtbcAFF4=;
 b=4R7DZBkNnid4ePDN8yyuqJLtvOToDMYqzlj3TTI8T08rTYF5j6QI05/sAlGc1OpUrTB3hJ7BytWMlVkcQR6vXCZ9agYRyHvC6ndcQm2BNhDp/uBZA0RlAhM+3uoEdX7M9eBUw18BYAWMQPmWiqCC5VrnH5YmzrGENo9lSsuoj9k=
Received: from BL1P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::17)
 by IA1PR12MB8262.namprd12.prod.outlook.com (2603:10b6:208:3f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:44:33 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::ff) by BL1P222CA0012.outlook.office365.com
 (2603:10b6:208:2c7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:44:32 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:44:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 25/37] tests/kms_colorop: Add tests for PQ variants
Date: Wed, 26 Mar 2025 17:35:57 -0600
Message-ID: <20250326233609.2980110-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA1PR12MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dceff3-62ae-4a3e-50e1-08dd6cc028c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i9Jw4J0OXB+MV8ZSsa8TcvnUDj9vjuGq7qom9zOlYbYPKW43K7CpvlX3lQrZ?=
 =?us-ascii?Q?rVWXOLlUWY9EopuIJ482SUc8fm61iMHN7ZOwLj3tKoyCpqTsYeblfIB0GKs9?=
 =?us-ascii?Q?ikHpEhErw0LZttGc9ndw6tcYFUqUfnkvbVg5ei3mnI1TKQIuq4tU2uvFokdp?=
 =?us-ascii?Q?7AW76nd4zQORbaSkynlKpcCDs/8vGfQxu44sux3U1jD2IIy2msHh4f7Ue8Op?=
 =?us-ascii?Q?de8FAQr/5pN9HxVlRbRMTvMD2lVBoZDp09zDMB0vmuF/S+0jWURRJVh3oOVc?=
 =?us-ascii?Q?JDupxwoRXtIhWGXrWzymeEfmxiyQV3PWNdffCyUohJljyJGO0btWriTiSSzv?=
 =?us-ascii?Q?BMu2MKszyT8aSAxV7O6IGaLXc5c+6cZMc42ZC/++OV3fuPM5TFYmoGUqKBhy?=
 =?us-ascii?Q?Sqz4ZckhV0HEQqlSb1YEhXtPWdrcZ1FbDrRzNkIqmHXeGXeQZhVqytEN9osm?=
 =?us-ascii?Q?5VYNX72r2+2GxZ3OxEBaQDbbROgoqAJxJeq0yQn9GidjJI2qNbfrL73sicz6?=
 =?us-ascii?Q?rTGh4mYK7FAV820Pmod4637aOOyONs962uZOxujto7Sxpi9uSBDjdTCUzuaN?=
 =?us-ascii?Q?80WX+gABBMfzWuWpgmfUqUHim4tr6iNkLA3SXtWOBKm2xZFD+DBaOwd0pfDa?=
 =?us-ascii?Q?6P5UL/9cDRu7xQKbExkQVvSlh4tK9/G5X6DC+v4FaS/Jbd03IyYFhvcYQmOG?=
 =?us-ascii?Q?Qo2mchiTS8sImSL7mjS/vLOBn/ABMky3NQNjrrb3eL3YZJMq1Bq4UiAPKEi4?=
 =?us-ascii?Q?tGChJmlnzSQbjcMkvBPr1KgNh3WuQ3rEFhsG6IwHN937sRRw4N/fNFz9yVDJ?=
 =?us-ascii?Q?ZhGMIj77HDzgX+CGCuWzOQQzmms9TbVnIGAX+r2/et7hmiEWrNU1aw2l2Yet?=
 =?us-ascii?Q?8xcsHpZlyvD/kKDg2bsrUMGAP4bUZxuG4GRaAXinuXWtUST6HdTI3MEmZ2Wm?=
 =?us-ascii?Q?KfPiKfIK2XoyQo1WRxJc7TplfTNmu4hspYAYiBcMuxuQIYjeZbDW5SeAInw2?=
 =?us-ascii?Q?8EQDbpd5OfIaj7UMOqa2Prsw8XEPMPXUBCSGNzbagvs02GjE46uXeSSyo2QC?=
 =?us-ascii?Q?DxaXamHwbjtowe8teV6XkwAjZtudv5a51cuQgJBTcesVn1Gz6nsg71Jea1i0?=
 =?us-ascii?Q?Ui9i104+GO4nVxShCIk7DhUb7X+aGXmsbZbry0pHrCXqjJnX8rqj3CRLGJt/?=
 =?us-ascii?Q?yw9ciQyL/s2meMctu3QGWdJ9qpCbkroRTMzsvsOEImSp+ukqEMh/u2v4RwuI?=
 =?us-ascii?Q?vJk3ToEE2/ACLLTJzLAB149cBP/NZyl2P0ZlgEjf2sWySKXyuBiXNqSntfvE?=
 =?us-ascii?Q?n2TQc9lvhZpUbzmolx2eiWeYWucDxWbCH89/T/tQjX9moRlleK94/HLnBpRz?=
 =?us-ascii?Q?T6862JOPorHgaUwt2BJuYekdc5RuLL176uliE3fHZNIj2qADjE3zIgv0oXJo?=
 =?us-ascii?Q?q/hDuW2tpA7dS6p/017sB9HphqbEj3b2Br3vrnL8EeycScncPJ0CvoAJoPeJ?=
 =?us-ascii?Q?AoGr//9ro+U6fJc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:44:32.9641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dceff3-62ae-4a3e-50e1-08dd6cc028c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8262
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 32 ++++++++++++++-----------
 tests/kms_colorop.h | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 659fe63a5..538c527f6 100644
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
 	/* TODO set to desired value from kms_colorop_t */
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
@@ -490,6 +489,13 @@ igt_main
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
index 30278ca4e..3188e6db4 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -44,8 +44,20 @@ typedef enum kms_colorop_lut1d_tf {
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
@@ -85,6 +97,51 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

