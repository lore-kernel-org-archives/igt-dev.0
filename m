Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C427CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDDB10EB94;
	Sat, 15 Nov 2025 00:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n3ciO7gx";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421DF10EB94
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQTZOBHYWbaVUvd9QDykar3WKwFSHMYrW/DAXVtINS7uoLwnih5rVr0DfAjJmomCjbbt/luR1jj2ARvFQyXijsN8qkaIsw/N8vN2lP29nrPxD2em//LidmI0a1Td6Ukkf24nYkPdA9/LUsZQHSLyyZzR4K7ubLdEMrC9qgT2NMQmlxPdonTdGz3HCNa38A9rcRcJfiw0r2HvdCOdcIM4+SgOHTfUZLNbzPDyeVll7laQMdf6lttqRfTuCgwcSaB8wW7zWg2NnoPO+KVf8KG7W9jSZqls3PeX7lBhavMDem0NIV1SFN9AyTqz373O1daqCv2/z8FSAYWw0dGDJdYWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/QTfnr+iRFevEEeQRqYRmCRkgBPFyx0cdbnBiPsNS0=;
 b=qAnR0r9pQ24L3x3mW7tthMvZGGgq9h9gueVYvps9ufTwB8GCpHFWbnuY0z5xJ2gMr30tEcmRBVDRwxwTgLSeL9D1doJ7Qogbho39g6aeM5wq6qde//VfdHuoSeMMpYAnWIAncnje/XlUnWB6Wf/0swyPGJjsq2SDALcUrSl6LKXgNG9sN2eYWp6KziWN8kSrDVPTODeIlVI1GN3I4CrxYxvP3mOUuits57CxFw6JGsNwTU7I59m1qlYa2qVyegDMbRY3vqeMg190b+s4+N1sbjyt2uzSJorRRwc8jKutBmT5yLtcR0R9BDjepk736Xp9L+xTeQLKIFHLOFEV7DAPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/QTfnr+iRFevEEeQRqYRmCRkgBPFyx0cdbnBiPsNS0=;
 b=n3ciO7gxWtkQX5cRlXZ3ksi0fQ0iHvdDMHZRUkASwmmi8tXHJPx/vPdmRm+bO9Rf+hPJ4zLWe0Ke115WlEURpwTlNpVDc3PFgHkJuCr4qPxZbii4fXH9xjjx6M0U4wd9fobq/Rz1qkcsmMSIiPa37cCL15QOpp9QaklwG5FYGVM=
Received: from MN2PR18CA0005.namprd18.prod.outlook.com (2603:10b6:208:23c::10)
 by SJ0PR12MB8615.namprd12.prod.outlook.com (2603:10b6:a03:484::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:23:05 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::f1) by MN2PR18CA0005.outlook.office365.com
 (2603:10b6:208:23c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:23:04 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:23:04 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 21/32] tests/kms_colorop: Add tests for PQ variants
Date: Fri, 14 Nov 2025 17:18:30 -0700
Message-ID: <20251115001841.3563993-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SJ0PR12MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4b42b3-070a-4df1-7061-08de23dd2519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cE35K8gxL6E9jtrcCWQeug5uIHvAHTxlqPsyKSdhF9txnSxEZHyQE7kUlZIc?=
 =?us-ascii?Q?x8eLHSc5s2CKJWVmJl4juRFzMjFxKj3dpQ0aUqvpBKMepx2JXovZuRJw+jOo?=
 =?us-ascii?Q?1cGHX0Vx/HqGDp8etp96bPuEucAjtVN1P+MdTRKg0QtPbUtHkHsjXZ7Hk2UZ?=
 =?us-ascii?Q?PO7j2BoK+izZq+S6XiJPqeWPa71lK63Dgj7QCvyESzN8tS/qSX+V9ZH9jC3I?=
 =?us-ascii?Q?dktg9S88YUwsZsnhw3TRWnnmUabKiLTCIYJRIZJvyqi/2RV/KZRWjGUV7wE5?=
 =?us-ascii?Q?iLwA6iOSJ+Cw8YKKWld9lS3FeVLsVPDAqw+02pQQ1tEyvXZQDk+1OM7LUCel?=
 =?us-ascii?Q?1m/CMpal/DotQeVYv25f6d8rvcawpq16lOw1KHcoemvs6GBmgvANfESTXj54?=
 =?us-ascii?Q?KLH2gBg6MNWsRyD+d6yjxkmZkJK+mqooDBo6UY0HYmyWIk9X2XU+0RH8MFy3?=
 =?us-ascii?Q?gwDHQGTMN3hOQOub3ZcdRadq2C2XOftN2DQ0tC7fy/iCoVQYHsjymfTqKoO4?=
 =?us-ascii?Q?YjhpifRdFdJFjKI2p5ZuFIPKG4eRK0/oIs+Znq10e7z00EfAJkGyj4iZOxyy?=
 =?us-ascii?Q?75AySOxyH4EzHb1vS9Ud/OiwVor8X9bgECg2fkmIB0E93pEFMotTAKfc4jTr?=
 =?us-ascii?Q?ULQKkGn78ag5tE5ZNXtFaoFeTfiGQZJu+otJI930cqoLFv9BZmKNtPk1VDuE?=
 =?us-ascii?Q?Kjt76BUsBNFTRVOebaz1gGdZJdGZhdqIrE28+kcOrlG4sMkg9pKjySOnPBKn?=
 =?us-ascii?Q?mFivnuaQqQqs7pyVz/OVcXLCboVRo7omRT+llXmisKhxx+L0bIFEkesalx32?=
 =?us-ascii?Q?iQe8n9eOaE5bKRXnfAulYWjjMT4yruEWJcUnfIrilb0qV0huz42e0W5/4fMR?=
 =?us-ascii?Q?v1tb3yJ/j/iiG0h05DgsDYUkTYVY5/dzXXIE2cmzaH6la/NxBM7YdEEG14Tt?=
 =?us-ascii?Q?0w4F8TzEQ42IEsROxAqCImmNcHcgEelDPDhociBlUgiutzLKOSvvG7H1+l8W?=
 =?us-ascii?Q?3ZYPNh19C1b4WkbD0s0QsognMhfcCX8CVso4rohD8H9030bKbxGQs4EYp8CX?=
 =?us-ascii?Q?+oQCqf0qu/P5pCA9JgyTY2osAdRodcXMXKa1ztHUfaHR2DOW1k61BjSJvBpa?=
 =?us-ascii?Q?eda8I23FA4RDqvMO4+mFYI59K5lWz0k9KIrBHeC4Z7N6+IxhnurnpwOjrNQb?=
 =?us-ascii?Q?xReIlh5PMRHmv8uDzOF3HfM3AeUpNt9Yp++WaeAvRKsX9tiCgKH6rzkwp48N?=
 =?us-ascii?Q?ZVRD4A/r9zhROfCaM9fW+CA6uBQd0fAp3gZuibP75critExOk4e6UZYGQK1/?=
 =?us-ascii?Q?3ygIaIagabwKQGSWQMxjtb59aV1edPwsHSGjWDPTALm3hSBpd1nAAnYhYenj?=
 =?us-ascii?Q?SGI5R6KMO8Iv6X8P2hTqM97ZJ7ncwNbOja8pmi/CDl9J20EzhH+tO7gkrAjd?=
 =?us-ascii?Q?MGbZCQ3oGBFZZlisMjUDm7goWP6ySo3VLVIbIkbHxsvYe1XIHbZH3or4ZGry?=
 =?us-ascii?Q?3rTv7u+U7iiq8lK1mzcrCajP9rDj0LKyjUl1GqDp6/eddGR68NEwRphCb4R9?=
 =?us-ascii?Q?XPT+0/HXv1IUcB2nLdQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:23:04.9923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4b42b3-070a-4df1-7061-08de23dd2519
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8615
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

