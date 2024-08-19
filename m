Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5EBC5472C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590910E48E;
	Mon, 19 Aug 2024 20:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NRF6+ZgG";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503010E482
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv9u9opSNGxh47AWqqOl45VtZWwMb7mHhRwmhj2WPiQOWZer9Abv2zZP/auw81KRZ7aWTIW+IYfgqfK4ZZf1awDpfjT4Nvi0axRQry24cnxybcx6zkaH4CNLiB1BSSCOS1ZqdyZ2hQyfLjo4jBA2ILdtSa5vUezrbt1xEAJw/HCGCNmspBiQgHk9zcFQpyGc8DmCdjq9qqxb8aio0uHHr7a3W7E4MqpZdV4I0B2cco6Pc4cK0B+joAorsbJRLZ5/65ZEMkgI9XH/+y0swip9L9jy6OI3IlYp7jtB0eD+c7Q4B1jvkAcQbgvvZ+/a2G8KKlLnL2BVzNbCFlDi+mt5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC+SpA4ia2JRkrqE4f5m+S0h5RJd7VtzyPQRfpOKI+U=;
 b=wq3hU4HqXNQ668/x+TmOOgrnHr6bJcoP4NF0msJss142kdmQYNczkFvl2OBNMI0U8QBhu1A8v4Z7R5kwZiIuZNFTP5PAI1H1JDz3oCgYV7oIyAAF30jvlgQTEI2g9TpIVZxAmpGNq0KpgxUPQLFCeJD0CYsgC11ogU2ow6OxP3sjQluSCMtZf5qmLPCfO6LYJ8ypasHq7Nc+sjbg6Evl9kUxajrGNshHC7sPQBoeTGy9FBtaBZHzXQ/s1jFJ+3tf8H4lHJ37PC6o2ukFjTICEultC8tqa+1hMb8rutUcGuEX33JIkGSNbonyS+bVIgLU5qG/SPcZxK54XGteCLsjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC+SpA4ia2JRkrqE4f5m+S0h5RJd7VtzyPQRfpOKI+U=;
 b=NRF6+ZgG8icC5PeKypXJSvr+Jx8kXl1UWxNVOtLMoHD3/eaJ0kUHIpHGIF8jvYAw8BxVa86Of3msl+1biI7XTt69YXvwFpCRNeTP35caRgMSIPcyuq1+ai7389Ig4Xzp6ATUONSN6ZpckqTtaZJ6P7OgImMUjzD6M7py/Y6KayA=
Received: from CH0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:610:b1::7)
 by DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Mon, 19 Aug 2024 20:58:42 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a8) by CH0PR13CA0002.outlook.office365.com
 (2603:10b6:610:b1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 31/37] test/kms_colorop: Add tests that exercise the 1D LUT
 colorops
Date: Mon, 19 Aug 2024 16:58:17 -0400
Message-ID: <20240819205823.316656-32-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4788f9-90ec-4915-2b5b-08dcc091b55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u+VUTUskQb+79f7Ugr/Ozmg42wzFPpQ8ajSN7bq6HxUwqpE4rvOJD9BSv67F?=
 =?us-ascii?Q?Lfj9+QYdtKuxEOSpF5dlFTUoGutD+KpKecnzKoX9C2iVMgjihOYxzEYsur6d?=
 =?us-ascii?Q?Zv0N3gYBZ+UIknD2KlIfKwO/H2e7NWNrfzPAf7djZBFusIv9A/7SMVxbmBwx?=
 =?us-ascii?Q?6gXwZ/8xu0f2mlKfAlmkeCeYvtSynURbrRNY/9RHIPsokRL+AKR8XOh9/Fcs?=
 =?us-ascii?Q?+bT/E6VAV+G52apktFNXBO8jlJHwptjK+DalX8EdlDPY1NHG7HoUhi+5uG3D?=
 =?us-ascii?Q?L9ttvoyWiTprzVDFY9cGU6ha8vvWMjPBchUrLSSX3RP9jXpnnPs5byWz1LZ0?=
 =?us-ascii?Q?PU1H2RZocWG1F44JmML+3m3r+K/w4Z6GFmbAlPoD9MarhbGo0XRaVcWmjZqG?=
 =?us-ascii?Q?VYiYHt28abmiTdlXOvUxphsQjiqt8SRoC+fkXvFMYSYf54dIUbTYsafwjVHO?=
 =?us-ascii?Q?YWnAe32Ll+8S/A5WcPIu3NvK3KZItWpL4zFrzBFGoDvARkjbJFjBkCJvAjtp?=
 =?us-ascii?Q?biDU8WOMhxFd0tLsmBVWH1HUZIhtMRl9MHPJaCvJfgacM/FIQxGCaUcQ3MpL?=
 =?us-ascii?Q?eP4SQy9kl3+Xkib5zYYEZ8IBj/08IUxpOsHpTxf0XNNTuFhB/fEYZ6kTwTsl?=
 =?us-ascii?Q?DZQnZRHK0zm5TU454oe3kFCO2PjnHtzmYdqVci6IH9JjcLK2bv3bNYKPBXD5?=
 =?us-ascii?Q?8W0q+qlSjXyxkkryp3c0BBE7k2H1uYbn/JhFpdngup/u1aW6ih+Xyl37RKE8?=
 =?us-ascii?Q?epbwqKMxYSzZ07nrtfIyT5w8mwV+plIEG0Ly+nbCstEvEkzzbs556rfONQgn?=
 =?us-ascii?Q?mNeF5tcp1ImeGPK9eWLNm/vd62SG4RB9iFuL559FZsLmGjzcNapJjIqP26O4?=
 =?us-ascii?Q?QJfV8Ra/56rc2yyBo+5klsp2PqckkeIJNJRoGmJ0jtM1j40bLeRElVzr0/f2?=
 =?us-ascii?Q?LaiRfMKriDtnArwgAkCSncvcrcu0cEHxJUaQEOQUWwXXLc/TJzaMvYudhkxg?=
 =?us-ascii?Q?9hkyfdELPyCtxYD/BchjWb98TqtkhsNW5ELsyhuBTzXRjOcU0JN86lJhExDK?=
 =?us-ascii?Q?6+2x/uefIdc9InsKUL5e693TQx6TChfnJ3PF9uduvUIFaGnfyA/GLxxjuuOE?=
 =?us-ascii?Q?eBW60qiQYa3L+UQ4Cr1V8dtlUwzqUNs6oxmhzImZp08ql7NoVcTw+psJHcme?=
 =?us-ascii?Q?wU6hJoghnLLF8983rUfy2u9IzYvMFexL+Ek/tn/QRm3Fc5o8y7dUPlD8P0k1?=
 =?us-ascii?Q?j0H/VxmQqZZ7fDp+ukp2/Sw8oW5o5wb/zTUIkd15YRvRfT6ISOHwZD+ICLQM?=
 =?us-ascii?Q?ifoLSV4GVM8BC0nREcBcSpXyj4oaNRPaxc+TNiyTa5jyP99xQ7NM5QhySbvc?=
 =?us-ascii?Q?nC6MCH3omRey3U6rSCK9JQicw01oVReCFWZlWJW2Lvesut+6FW8Xq9ow4qAH?=
 =?us-ascii?Q?AF9kOf2u0n90lxWt/ToPhA6ixATUxZYQ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:42.4403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4788f9-90ec-4915-2b5b-08dcc091b55d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327
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

From: Alex Hung <alex.hung@amd.com>

We'll use the sRGB EOTF and its inverse for convenience.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 35 +++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h | 15 +++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f6738cdcfdf2..436bd085f9a7 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,8 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:              	sRGB Inverse EOTF Custom LUT
+ * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
  * @bt2020_inv_oetf:			BT.2020 Inverse OETF
  * @bt2020_oetf:			BT.2020 OETF
  * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
@@ -231,6 +233,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -298,9 +303,33 @@ static igt_colorop_t *get_color_pipeline(igt_display_t *display,
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
+		colorop->lut1d->lut[i].red = pixel.r * 0xffff;
+		colorop->lut1d->lut[i].green = pixel.g * 0xffff;
+		colorop->lut1d->lut[i].blue = pixel.b * 0xffff;
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
 
@@ -313,6 +342,10 @@ static void set_colorop(igt_display_t *display,
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		fill_custom_1dlut(display, colorop);
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -494,6 +527,8 @@ igt_main
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, "srgb_inv_eotf_lut-srgb_eotf_lut" },
 		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
 		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
 		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 7b98198f6430..13d15ea6637d 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -71,6 +71,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
@@ -110,6 +111,20 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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
2.46.0

