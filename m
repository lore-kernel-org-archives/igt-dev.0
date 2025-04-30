Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F2AC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD6E10E6B0;
	Wed, 30 Apr 2025 01:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UVtxA7k/";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915810E6B0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQwBIFbPDUkATB7xOIscbcJ7Vy37Cc8RWZXxEh9XHcOAJIcWY3eGpfmm7CX/e1YA9DAB8AFWtt57xjwjSMbsJU/n/IDIqjvxmene8nsH4XkDeOO7zEhxaRbvQkrVrJ95BEHY6ixMCWiYH4Ug1yR29+rycAw67O6hyknrh93zNFrHLo7RBuqxwF+wvcdU/kwoCZ0SAI8ugW7q9S6s+HHslyJFBE7xyS7o9PWUa7UPXmRu+PxQAlzX/Hj3SN8ogil+Pr+JmLGzPZ3x2bgg0PNsK5RP+zMm4NNS3p8/bcBW7AfTGMd4K4m96hJIjmEfmWMUB8il6UWR9vnfvSliSlUGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56677eJCtcFWfwKMD+48f4hf7/MaFo2ia5KyqQc9jBY=;
 b=H79cxhRhKB7flyDR2uHeRmmPniR0gW+NVKMf7cyXg551CQPq+8LLl1SSQ6yQ7KkCBTXeF8zTsJ+bDJtmyMoskZnIiijkmxHfI6ZbtG5Dy74HR/mJzZNQ88XME9MSvm/FCLDnTiEAH1R2Cb0CKqhIas2Ev79/4iNO7euGu1CidKuG1RThf2B5J3sAoPHVqPvBiFEzEK1nflnpKo2Dq/VaxVEPmpw84RYR7ujUIerS5H0moWTuADkGp9QP+Q5UU9cnoNN7YWfcxvHw8OBzWXFXYO6Q8pklmIXj9Xupsq4bZHleFzFRM65pQJQ3ioP+2Mmv9T2rmtJEunm3HNdqji/c9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56677eJCtcFWfwKMD+48f4hf7/MaFo2ia5KyqQc9jBY=;
 b=UVtxA7k/minnKJQnelcpWjHhUvUjIK4tK+Ll38Kva6D0hCsCppe3nAXn92lh4ofh4nLXSj50C/X5c7gmi4OM2TkZhnkaCULArS5bhLzowNa/QHcOGVXiG+elFMj38LKkI8bHzyZt36gDMdi4Rb+hbjg2tcBVWdqzt+h47ReS8vw=
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by DS2PR12MB9686.namprd12.prod.outlook.com (2603:10b6:8:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:41:27 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::9a) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Wed,
 30 Apr 2025 01:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:41:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:41:25 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 30/36] tests/kms_colorop: Add multiplier tests
Date: Tue, 29 Apr 2025 19:34:48 -0600
Message-ID: <20250430013454.226910-31-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS2PR12MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf64fed-4b25-4869-c681-08dd87881fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YlIIcSU7rn1Pgey5vwQqaM1N3w3UA1SOoJH/uSVgAAUBYyRczNUNjb0Slr+5?=
 =?us-ascii?Q?3+Dv5w+mJ5R2UTwPvMyL1BDPTBE5oTgjJVvJX/IHOBrJbVwK35jb4L1qSTpB?=
 =?us-ascii?Q?fYhXX06Sku9SCai0SIT1Bc7zmAutn1lioEZDOSvWUuiyv0QIYHllxuBNqiUU?=
 =?us-ascii?Q?q1ch50WUO1Ra3VhWAHqiAWySyrrM4gVnutHcPX/lpsvA7WzvLLVDRF11Rb80?=
 =?us-ascii?Q?QJ8jkf7mQJyx43Je2oiGs/S8DfhunldGPPwTlZVARuSwlTiVM1Ug5lyfwucE?=
 =?us-ascii?Q?Z0tEqBLRjDocnhha557adD4hVnwqjE0wh9uUXnOhiUmhXSXcfw2D8yiKjjna?=
 =?us-ascii?Q?qrox/w1pdfY7JVyRbp/j+XwHpVy2IBtrPjlqFlRfPi0/57v+O9iuW3Kog3j0?=
 =?us-ascii?Q?qrllHvtW2V6qPtyTUFgUmg0gqgfQqQJIuGX+/J2eufo6V7jL+KprmvyT/rDE?=
 =?us-ascii?Q?xf0q6faqiseE0D/bKLON0c+KyYhTU756+8gH7nBy2Fhtp5tumS5gYuZbDZIt?=
 =?us-ascii?Q?WCSN+8rYoD6qM9hnMScRwApe3PzlOTBuxzkb1IaqfPuKcGdKEtT8v5RWJH19?=
 =?us-ascii?Q?ELAS4e8wTRGWer10bJoIvMYXcr/7I49tUqr3qC4+MAZhC4goQ4PIsx9nwQRA?=
 =?us-ascii?Q?XXyhA5914EgBvifNsYBYwi7Nb5fvfBqvEJ/PJKBOwBlG/T90gn0joV9cvIAs?=
 =?us-ascii?Q?LoAG2FsqiStugOzOpxMki7lok+I6qL7oV3OIchIMKX5gZW8xlb89lFY70Dti?=
 =?us-ascii?Q?R2DEGwD+dlZbetEJpf4qsla8iFt+J5h6sFTyfJbDYtRysMazb1RtlvL4z5Ng?=
 =?us-ascii?Q?WNNYTY5fU7ch4cLAMrNDk0A5+7IN59JmRodrwRIr7w8OiBWlzUadcqw3EEv2?=
 =?us-ascii?Q?orPHW9CV6z7ab4a/v6usYl62qkC3n+wAFzMw7Wpx/rR5bufJ52sARsOuj0EV?=
 =?us-ascii?Q?f6dE2No+qiOoFBEQe6pjwfovQA7VVe3bXTObCRXPzeyPkVxfHoGWeIPginku?=
 =?us-ascii?Q?847UfsiFL61o9u5zuQCJK+BYnCE+mZwnoEL2Ix8zzhyfHLCIqI95CYqFD8hd?=
 =?us-ascii?Q?ysG/WvrIzDCUqWpg6I0oic166FsYbQWJq9E+BME6Uxcvq+qAzMD93M9s3FpL?=
 =?us-ascii?Q?Ua/YRtljSKsZ0vMgQ6dweIMItI/crCbxfd24xUDh7BJQ9lvltTomwsm/4Nt/?=
 =?us-ascii?Q?Yj6x2TO87xmzNDTpTE3N5z/+84WcwdJaHp1V5H4dQ7nz/RZaQ/L379CQhsgL?=
 =?us-ascii?Q?1shj9j88tG0j+0PKqdejCvi0zxgaaMNu7zyWkS36FgM2+mZgA12xa0mcGs4R?=
 =?us-ascii?Q?FyJjF5AWvS/vQ/sVsFb46Xy//xnygyAoAhBEMd21mDhk77P5G+srjXnGUsB1?=
 =?us-ascii?Q?OiDn6++ngXwdrRQMMoUNXmjAhwDTt4qscpqveJtESB20Nnh055HfypAVVmeC?=
 =?us-ascii?Q?hEHW+SQXXIxjZU4w7vm3SwHJp1fQ7XeyHunahM5ykiaP4VJ2m1GezHPBCwwQ?=
 =?us-ascii?Q?GOMCPo9bd2PribHQp55uiJ+O70W2FYWK0+I4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:41:27.1783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf64fed-4b25-4869-c681-08dd87881fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9686
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
index 0f75cd65c..d24a05a8d 100644
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
index 94470ecdb..79463f56f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -68,6 +68,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -235,6 +237,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -328,6 +332,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -345,6 +350,10 @@ static void set_colorop(igt_display_t *display,
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

