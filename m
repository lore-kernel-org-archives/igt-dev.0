Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBF9CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B463710E8BB;
	Thu, 30 Oct 2025 04:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="urcRuPwF";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA2310E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIxHnREv7d1x8eo3r+TQ6gQVY0PosYRTQXJfEif7Vum6ibBeIf4tjrtmtPzuhuMeSXyo2FAgu3AuJwNaJTOW8J8qO8krfXKWfi+QSHTlR4tNFDuKSKcsyAcz1wLGxGG9j61Bw2gOKjXKxx8HCOvJ+HKohDfqWwaWEec+yv88FJ6WtJfzg2Z1QeF9vCAG6JO3tVex1PiQw8XtJ092OmdKLVsdoiwQAb/yIA8I394b8ngUVf3dm3tg3ct/oVQFkOmjU+o1pqDJNhBYGqDU8zL5PQgOTglXgysqlDr79wk2jgFeBm+ItVuPTXeV7kHWIvfpr62YlhiJszYovgatERf97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7azViAsFm8wfRpWSUIsVbfznz+519sAhZnvp1kx59c=;
 b=XrcBUmu6hnyADFRFwJYhqV06g3vG+zttaXQvef9Y7wn2rWWZ//eLYlZeFphjtPqcavYsP3voRcIA9eIVUaImhl1qezqdoPA7OULkcOPUXChaPp9IlnMwn6czzBo1ypSWHOohfg/ffMy5ekou/8Bj/PboeI6S7OvjgvEZVR/OpWU/SGmYzkg9U66747jXTGtvOLPF2ZsXcqEwGEfJ3+c0ADbeoLv32iMquY7SukJjhkYGfN0+dQXMWqJBAkL0TTCwZq0wtUYMMgCTVFlxbbmFeWxcd/AQkOpoG1R89S2u15nlW2EZAc/4AyswaCpGs295R99bq7XyNbsF7p0TcTJnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7azViAsFm8wfRpWSUIsVbfznz+519sAhZnvp1kx59c=;
 b=urcRuPwF6MCd5hzvgNnqy1mjnnDupZbIC2z78QG88GYf097d7wozeb4Cn9FmR1H8pL/rUpa66dCwIZnr7H0CMApLoImL1RUz1kW6ASCnkbq/ulnWAV+545Sn6Rmc7Bj4BHSiXf+KaHpbu6fwwajesQgSw1/6SUU4mRAGNMS7l7E=
Received: from PH5P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::11)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 04:33:05 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::43) by PH5P220CA0011.outlook.office365.com
 (2603:10b6:510:34a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:33:04 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:33:03 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 21/32] tests/kms_colorop: Add tests for PQ variants
Date: Wed, 29 Oct 2025 22:27:50 -0600
Message-ID: <20251030042801.2315866-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b64504d-afda-4e39-bd01-08de176d6b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hHI5JVwUSsSOrupDSGICEhvFjCsOXN7n/uiPhXemer2RRCVUz1rxZ/GSiLO/?=
 =?us-ascii?Q?jzN4neUU7C59wwgUJI1cc+I3Y8oYu8Y1w14FTEw7b7UdswvLZLoURa9yGhOt?=
 =?us-ascii?Q?02iISCOKnV1CneM+6c27F4sdsy1uZ+tm20PC9w5dNRO9fKpVPE+axvD+YlpS?=
 =?us-ascii?Q?Bwrlkh2x/tUpNszRbArGmPbCAIXYT2Byqep6QX4laSOV+NTBQPGtBEEp1Io3?=
 =?us-ascii?Q?uhzTz/a4Mad6wj6k00HzmufEYsLRciRe9BmPT7bbX0XjWRwxLvGUEXreZvtT?=
 =?us-ascii?Q?v1ClLTJ4skbJijnZ4BQCTy/qcFcKOW3zKMp/+HFEtqrgdvLpFPyE7qWX92LT?=
 =?us-ascii?Q?YUGzdxkd7YZL/FVBGOpw6KHoT1QKr2SW/KLVToj5WXJ69OpYGFP2QeAMo/e/?=
 =?us-ascii?Q?7peaBtdYyBbC0FRDbHzPvvGRoEC0p1hpp6F02EjCcdO0iyKbMcWySMcimLfe?=
 =?us-ascii?Q?dw+YdJfg9jZeqITEbEIDsEtb8WlC/c9ROLRlJyvxMDWWToyGkWoqqxasZp16?=
 =?us-ascii?Q?IFNM306cNjeLEGrNr6QrM+USPPrdijeG2PUvnejS23ZWpi6l23v4QGIaJXcZ?=
 =?us-ascii?Q?lfNTzdlLocSBsLCihh64DXB21tTMxoptTj7iKJeKj2+mJVWtH/qa3lIFv/3/?=
 =?us-ascii?Q?0Ln9pL/dkpm1uSngQTZbBXaFyEb1vbIGnHDPiXJU/cN08vbKgtdNQooYgk5n?=
 =?us-ascii?Q?kD9MqWhPK1rPUxv5tLqGKy6Fe+7F1QdlIZldU5dIJWXn37+UanUSPdC48rsm?=
 =?us-ascii?Q?HE3eMH0XblIRJmS9utoCDU16OFq4mhZuzga2ObHg+a3nba5HdiGjBnPu5qLY?=
 =?us-ascii?Q?bJOQEDj6UvaSDefuX0IkdZUQAxfjwyeDsLLgu+KP5Xi53fSRly/TFSzRY7pl?=
 =?us-ascii?Q?Qt+Yu7WVV4mRpE7MJ0l+WgJWIvXe7rsZTNqV/Dgts5X8FhbzWDADIjNYjIV2?=
 =?us-ascii?Q?/N4OwPrLc8WkTuB7Y8we9Hu8ipF0IaWcEHPmFJoG5d/Zwpe6AGNLox9w7Pog?=
 =?us-ascii?Q?VHCZfCQgju91lY2qSOyA1mFL9if3WNtVU2HLZvf4EHfuhH5Dsl6iGrzSiimj?=
 =?us-ascii?Q?OwoYXL05cfiuEDVvWzMBO8sqz3mu6U7KL8BplXo3H/PymTamdkb6gMR9Oon7?=
 =?us-ascii?Q?aFZVxX3ER4UTRrWSzBam4KLk+Z4CXra81F0HxD8mRb5xZqrdfLnw1ADctK9U?=
 =?us-ascii?Q?9qVE7STManjup2w588n1EGa4VwdiprfFEqtu3EllblXQNU11e8TDtEsKAOy9?=
 =?us-ascii?Q?hzuAPCU+5hcXXUoqEkL35ZpeWBrBN/mm2odxJ9o2wLWSk/ClwpglSeB8qqB3?=
 =?us-ascii?Q?0OH+SNVuH9SWjw936/DLw0Lk5JQRZTdOat1/wVGGbUnCQU/gUosAe+KyVtUp?=
 =?us-ascii?Q?/wnH0IZHjj9du6ubbQ1397bXuofaC+WNrKXuEvWvtW3kKA/y8pJIj/WYqkbW?=
 =?us-ascii?Q?u9JT90zZTp3vUih7s08mAUYktTwbvMmirkeZ38rHs0yOJLrnrGIoTmMRPSN+?=
 =?us-ascii?Q?a6MEiSpTguWIeFTHR6+5ZpbMB9PHm20ypp47znqlsxpmUhO6oUd0+fevC/It?=
 =?us-ascii?Q?uPXhvoZB5yRfqi8dGVc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:33:04.9883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b64504d-afda-4e39-bd01-08de176d6b33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336
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
index 80d1f87e6..6c62ebe01 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -31,6 +31,13 @@
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
@@ -154,7 +161,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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
@@ -234,18 +244,7 @@ static void set_colorop(igt_display_t *display,
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
@@ -440,6 +439,13 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
index db62196f6..ec25722fd 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -27,8 +27,20 @@ typedef enum kms_colorop_lut1d_tf {
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
@@ -68,6 +80,51 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

