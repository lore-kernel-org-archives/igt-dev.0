Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D528C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0261510E793;
	Wed, 26 Mar 2025 23:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CDFmeAB9";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135410E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/4wQ3puUPMDqoO21f00mA7xFbDoqbq8hiGGP2HnW7sTYU7BhowkbRC9RehYbnvuhDFZX+3kZi6ASP07B3XfL6XiBGfywKf7hGGF/Ou+rmDRDCsL7hfBnLdeRIxm7dUX+VX0rFcmc+2rGWSYnZMJdmFYZuCegbYWdohq1R8CPBUfHI6n1sPFt7R9Joo5iEoephwuemx+N+lFL9uJSXm/OXwDnXC0PkQ/++OyPBMtdcvuzP3as1EP2+RtqDLCeQ7vZT5/8SNWqh9ymef9QzT9yScva9V2c912G1oCWpwJsTzAQs6Y3omHMZh3jMShbuhLHG/m98hQAGuS+6wl4osPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vj/Xs92g3urEW8JIvtLzbvkSqkB8qrNkziobp6JLlc=;
 b=R3MBsbjtwOn/2mxZObKhXBR2ra/YQdpO9lyZ3XkC3WqjoHk7E/7dZMtG1ExDQhFdavEyyKImcwhMyDLmCZvinPa1H9aWVGfAv483g6F44vi2OZlQdnBEb5MeoFXik46Seu7CCMgQl7mZkRAFG68V2CPt9IOsP340WyQ2pOh7jWY1Hw0kYkqyJXYMERA4ya37PpPK9hXD3P3UTR+n/wiCn/JXgx7UkB9vaxTH3O7F95xSXerHUy9AlZSgrHD+JYJg2G61BaZDJlsYWO9Ie50z3PRwdoekxn9QusnjilGCdWxOrlXhOxUYoX2uQcXj43YdLFFX9QQWd2A+rBk9CwquUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vj/Xs92g3urEW8JIvtLzbvkSqkB8qrNkziobp6JLlc=;
 b=CDFmeAB94qFoamwa4SU0ipWt2x6MRixxwAAHNQ95YNcpZnbWBOUrj/OSjGCeX9IE4qg3wppRz0qCkmLOPIrhuhYlA2J8AG6kqhriIDDBIXMYoiZuS3K0e3dVFiI2GEKFwv+f3yaIvj3hxkdexOOA5U+5TmexMBsHSVwTvp64s1U=
Received: from DS7PR03CA0305.namprd03.prod.outlook.com (2603:10b6:8:2b::25) by
 DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 23:45:46 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::90) by DS7PR03CA0305.outlook.office365.com
 (2603:10b6:8:2b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:45:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:45:43 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 31/37] test/kms_colorop: Add tests that exercise the 1D LUT
 colorops
Date: Wed, 26 Mar 2025 17:36:03 -0600
Message-ID: <20250326233609.2980110-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 0042903f-0e4c-4c65-3841-08dd6cc0544d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZHvVc7KycQHDuFcFJ26WaliHUvNnhEBWoI7ctYH0GVOuA/D4oE0438cwk2la?=
 =?us-ascii?Q?q44Hltd2zX8z+kzYTVrt8s8jfGsP8JQ6BO4zyfSC+TDDjPyOY2qibEA2NJ6j?=
 =?us-ascii?Q?lnkN49taoZn3ArhVFrHEewcVCKDBOYoWZyULbh9kDV5+1XYgch2WwcNsuDUI?=
 =?us-ascii?Q?+QVnHifAscsMyO/1S2ujiR85CbyxqhidPKLW3d+l+aRLFtiUJ78ooaHkGStv?=
 =?us-ascii?Q?bBODNKbMFmeE6nYr42lcfZv/JqhBWhmVQge1UD9yfHAIBQ0LEtRKpKoW5n1d?=
 =?us-ascii?Q?emlcsYZ0+AYPeTBMvoTczeRseN2Y8G0bBy8cx0bx2FryooIC3CmwZ3emXe6U?=
 =?us-ascii?Q?XEx33zGvU9K/COztecwzzgLJ7AQgzS+vOQhhdgDfO6bAySb7b8oMzbvtsgZu?=
 =?us-ascii?Q?LuEK7eHJ0GZQAgw8AWgrczv2UUs/CQIT2EFHeyj46W5uGgaPlzyA9Q3bJMVb?=
 =?us-ascii?Q?mTyQT9SUR6PZPfy6P28Fzulvmi03HOr8gol4wDdcjq4VG8ZcZ4NEChvip4w+?=
 =?us-ascii?Q?H/GjGPQCfXDGmpVGrORH7S++CEYiKt+up3IItuoxmyomohRtXFP54fcR3mCN?=
 =?us-ascii?Q?NEICzVan+u7LE5WUKnBY8hv5jzaRvKqFMqKlYaOMjShgw3yv5U+YtRUKHKRY?=
 =?us-ascii?Q?LVl2+G6hkdsKokY/jqyzm3VzWXDuzl1d3/1rbjcyd1ihYzP2wYvClO/SJUuo?=
 =?us-ascii?Q?NhetG9OVX2n+48UpZnF3LkQ52jDUF0i2VuPk2KsARd5hL+/IRQSaz2aEPBMn?=
 =?us-ascii?Q?Q4JKZ2PHeZ0zFaFiNNT4l27LBuuFkY34EY6Anr5zIwrE0a9ZNBE4gLmHXaCp?=
 =?us-ascii?Q?EmLOxGhJyAgbURAwS2qShNdd78MiZ9qBvf6l+A35qy2HcLXozB/PaaNDP0QR?=
 =?us-ascii?Q?m0UIvWgGp60tXHE/ZhKaLSGDi0xcm+Q4sYSATLN+EeqL5n3h90eEve4n2mjh?=
 =?us-ascii?Q?K2E8vVf5sqV0mfEK8Okf+s2vEGlNNlQaTSqldl5e8yRlDqJ2b43rG4Hng32x?=
 =?us-ascii?Q?pdoUahPd6XHWjoEE3t2ggIMAFYYuJXy3I11ihhQ/ZlSj4e84OvldtN+rdajs?=
 =?us-ascii?Q?+ldKEJ3PGphFJ2pbllBLhj1CLIUUTsojm4wcluGshtEML8+qX81cNaa1APVM?=
 =?us-ascii?Q?VKVvobBTK4NtFx7958xF+lymqQ4H4V6vvoZB5hZhd8QDYGNqnftvg0y8ZuF2?=
 =?us-ascii?Q?DLd3QvNSCgkl3XA96sfZ2x2eRD7WIghzFJAZohnsv0Vg0LTca226pdZfBBRx?=
 =?us-ascii?Q?6HcgWrgvRph2eHg7FUtWDDDkkiioeA9vxiW8sUhx98deruPmwpyxCkUdA+aK?=
 =?us-ascii?Q?c+fjvYbOUpGRBG2GDuB9aL+x8cWRwUUvSMBaylsm5Q5gPIk9PUV3Y0UKZ7rf?=
 =?us-ascii?Q?Fx2r9paY+T7lDdaHeSDSwzN/Xn7ZgGtT5oX+xgduKiCW9IBTVvXwF3AkMaoH?=
 =?us-ascii?Q?9qbm+/UN1TH/gIqsMkrVUzUeXG4BE8fz7B2fDzydpGclc0qv3V3tCYsNI87D?=
 =?us-ascii?Q?ezzdqtAU9ECNFc8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:45:45.9666 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0042903f-0e4c-4c65-3841-08dd6cc0544d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190
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
index f6738cdcf..436bd085f 100644
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
index 7b98198f6..13d15ea66 100644
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
2.43.0

