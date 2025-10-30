Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6099CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1CE10E8C1;
	Thu, 30 Oct 2025 04:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OV9iCmcX";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ECE10E8C1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:34:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTMLGl3XFEnqxiHuA5MFSgavEqYxCuD5Pf/aM0tqBeEhIpbIjR1F89yCcfcBjKutfSHb21JesxLJ5Maik25lasTKMMyLLN+U7CylOXSVCawhaiwyqoTXW0BYsRVc1M+QaRM8yGTR40hRW6rdxj6N26hfoFV3FH+BX+fAEM9YWtq9Zm/ovy/oQ712nAW+1mT42WEtcbKyug4E+etXE9nMhte4bS5wRXwNmnQuTObJINwPC3MSKcHr9oqjj33J9ZUW9qGB0ADNrNPW/Dufw4ERBbXrSYQ2FUu61CpYWcsQ5zd5NdlLjk8yv+7lT8u5kYqR7n6wXOb7KPp0j7VM7ARPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/8bHYBb6+Ios2jrP99bpncibBNGDdgxs1OCjxBTX4o=;
 b=hLBclO+vC3fJZ2GIhavXqsYP6iW6UsvEIA7Sqph9mflwjy8RmoPg3qM1t1D0vRFUeSN0MgCRKyo8Mi06lQ+65R485uMtSNf+hvnIfUXXUTHInqSPMClFrSHaDoFHvZzem2JCP63+DtaMyAZ41L+VJ+Cfik3UQZ6npeqi5qP7BzTVK1Us05RejlHuoxbEXgwvlsJmGnN512VsUg5kKccqUormcYnrC2bc/nZAX1n3lOGSmdcV/I56ym3xzhyYV2QA16CXpIakD1jj3V28Ze5tv+R/u3FtbeKSzHhdO8x8q9WRiWNwCXgFFwDc9p5x36WRHRQyBnaRYry09LCSaYZWKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/8bHYBb6+Ios2jrP99bpncibBNGDdgxs1OCjxBTX4o=;
 b=OV9iCmcXcQZpwg38Jq2NFLNXDkDdp83S+xCzf8MtoGFkx5nlq0VkwBRBlCmhXZPIN3V1s36bi3INPjjTuWDFE4VPirDge5Wrz6ir79juLhfXJUnqOEnPs6UG/XmW3t3MiKQIOuL2YaSSOFsKQlrG6+aIYK9697FnD4VMqZ0aC5Q=
Received: from SA0PR11CA0136.namprd11.prod.outlook.com (2603:10b6:806:131::21)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:34:06 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::95) by SA0PR11CA0136.outlook.office365.com
 (2603:10b6:806:131::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 04:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:34:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:34:04 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 26/32] tests/kms_colorop: Add tests that exercise the 1D
 LUT colorops
Date: Wed, 29 Oct 2025 22:27:55 -0600
Message-ID: <20251030042801.2315866-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH2PR12MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 854b0472-3a6a-40bf-7126-08de176d8f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O073CJ5lW2zcwHoWkEqoHYoWf9u/EQE/MdYCs2hAGjk41CqtWSrbX9n21AiQ?=
 =?us-ascii?Q?rkt5CRdOVZF7aaA9UbZTeq3fiFUkM3rkIUY0QQI91LLTZ/ewuoWTMtDTYPx2?=
 =?us-ascii?Q?plXLI4wMPX05rIzY4JdcM5ld5MB4Yxo9puy+c9EpsN5UoRNALrQjsQWHg+bA?=
 =?us-ascii?Q?r4TQu4oDcEvQaGo7Jz8xddukL2KdUCerjXP3ArlaklKSjzLCMm8uk2Yar2gw?=
 =?us-ascii?Q?6F8A9V1ls6l978V+dPWXMrET2HiQAv2glKeH6fecnFL+pn36LqgWkT9vfRIZ?=
 =?us-ascii?Q?ynZwIz6tNmjwVCW6f56PIf5B94ZyRwfeIxISr6z/z6FivQBjbkMbkSuO6ywA?=
 =?us-ascii?Q?vaPRoKfu3rlP5DUD8HnUW2OyS2rndAX2VNhX8Yu/WfrsWUWAv9+kEp4VoXlp?=
 =?us-ascii?Q?xNgZnhtCfAXFO94xGw50vE6htIfpQ4HSsMnJXTuCc9dleUUw9OPDeWafAaOy?=
 =?us-ascii?Q?0TyODa4lkaJlCPJRkBOW/krYOmMukYypigkJOZEPL42NjEN111+ebS9qrcM7?=
 =?us-ascii?Q?HnIjNo+itvLPZNYcPTMkt2+g2iBjguSMV3JmPcyIvNgYHrSwGrcS9JXwehiY?=
 =?us-ascii?Q?ZTsR3TR3lQttYO2jNXZgNZw80r5V1VhvRlVYf/hR+VjqVAyoolUDnANqpaK9?=
 =?us-ascii?Q?jOhl8GEov9OXTf26viDHihTFhy9AGuyhjBwy82iJRVsu/L/EURh7qsWPsjwN?=
 =?us-ascii?Q?Vr7oM3leQeCjZeGj5nzG8NezE1rEuuKlS0EiD+OfyBiclKuKVqtgt87Llxot?=
 =?us-ascii?Q?qFT8r/PSISnUc3oqyfDZDdfk00TkTa1xybj12DcKsy0mp1qoZ3tZyIaMCTCr?=
 =?us-ascii?Q?tjP/2qyuzkQR8VbtOY/UcssCOPn6TL1HduMNQuQInUextF5Ph0YQ5wN0DvWx?=
 =?us-ascii?Q?STp5zvJRQzs9O33bLveEr7zUBf6QpRmjxl/ccg4PJm6HNs1vqflZVVTMMkxT?=
 =?us-ascii?Q?ckwiVHVesO3E2TZdNbkjRKB0NCH1Onju/CxMzIUsOALkKl8xPofuEyprwaSK?=
 =?us-ascii?Q?QSWhYptiKKckvSaayLFCDLx8tVmRobWA5t+4BEJdZVj8JyLlYvLBNy+ePrH3?=
 =?us-ascii?Q?M60yU8a5ajk++zt8knJRbthDIkJDMfBwMQqBnxsqVhkWuF4I3sYvAUHFpbqU?=
 =?us-ascii?Q?gg9z6OpgQZ3IquMEBKRNgtx3uZu8hhlR2U5lSV5+oKdyplakQ1Eb8h7N+ts1?=
 =?us-ascii?Q?0SA2obwiwUV/jb+ZJkrpW+GcHiQcgIxrxM+Ezr46Eub4y4xUqWeHELWb+y9v?=
 =?us-ascii?Q?WKABJQftKU2z9qW1Yf46+0Ri34FcF/Xt0Sv4d3HrDn+BWJcryYG5ZzWLwaEG?=
 =?us-ascii?Q?BQUTRBNrX7qZE9PcNFyg2RMz4WT/SrbgRqR8qSF4HsRVkxaFoJnlSOZPOyYy?=
 =?us-ascii?Q?+8fxWcEesai35BC0Mc5OgjHZe+rTR2wVT5gbYrSEQI9NwTwpxYWqRJ2CEJvU?=
 =?us-ascii?Q?BPCls+FI2mx9E8Jgh3UMeQg9Jnt49ttkk3L4TbS3Nj8HyAgre/6ACCnaZ0k3?=
 =?us-ascii?Q?FUZQtJ1GtLnH8UVKPjEY3vbQ+Rv7ZSw8Kn7iqG9VltM9xjjpxEXGmUwlGZA7?=
 =?us-ascii?Q?NfFPSxeeNGUUOWaWD3Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:34:05.7029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 854b0472-3a6a-40bf-7126-08de176d8f63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520
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

We'll use the sRGB EOTF and its inverse for convenience.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 35 +++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e098c0ffc..c4e6550b5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -32,6 +32,8 @@
  * @srgb_inv_eotf:			sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
+ * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
  * @bt2020_inv_oetf:			BT.2020 Inverse OETF
  * @bt2020_oetf:			BT.2020 OETF
  * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
@@ -172,6 +174,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -239,9 +244,33 @@ static igt_colorop_t *get_color_pipeline(igt_display_t *display,
 	return colorop;
 }
 
+static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
+{
+	uint64_t lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+	igt_pixel_t pixel;
+	float index;
+	int i;
+
+	for (i = 0; i < lut_size; i++) {
+		index = i / (float) lut_size;
+
+		pixel.r = index;
+		pixel.g = index;
+		pixel.b = index;
+
+		colorop->transform(&pixel);
+
+		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
+		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
+		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
+	}
+}
+
 static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
+	uint64_t lut_size = 0;
+
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
 
@@ -254,6 +283,10 @@ static void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		fill_custom_1dlut(display, colorop);
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -444,6 +477,8 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, "srgb_inv_eotf_lut-srgb_eotf_lut" },
 		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
 		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
 		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index bfa1030e0..7fee7f8a7 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -54,6 +54,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
@@ -93,6 +94,20 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
 	.transform = &igt_color_srgb_inv_eotf
 };
 
+kms_colorop_t kms_colorop_srgb_inv_eotf_lut = {
+	.type = KMS_COLOROP_CUSTOM_LUT1D,
+	.lut1d = &igt_1dlut_srgb_inv_eotf,
+	.name = "srgb_inv_eotf_lut",
+	.transform = &igt_color_srgb_inv_eotf
+};
+
+kms_colorop_t kms_colorop_srgb_eotf_lut = {
+	.type = KMS_COLOROP_CUSTOM_LUT1D,
+	.lut1d = &igt_1dlut_srgb_eotf,
+	.name = "srgb_eotf_lut",
+	.transform = &igt_color_srgb_eotf
+};
+
 kms_colorop_t kms_colorop_bt2020_inv_oetf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
-- 
2.43.0

