Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCE5CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F26310EA5B;
	Fri, 15 Aug 2025 04:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gxbYISp/";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8F10EA5B
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX7yAUbd3b9eXSqsQMW29N8Jee6Rfte6IVpCYQairz2N7jOd1JewfqmY3rH0SFDwVoHBFZCo+KhAW3HQwPTbTh4JPdT2hCoq7bPs1R+WtsajS4uxV8JiOTwmtpE6F5vhT8Zo8aSH7NFI+5LK8N2boieDAWYm/GXJL35ezyQyIFt2aOfuzVLt4OiJ4v/4H/crBM0SqBqh+qhaRnvTZDLAJpatCiTmiSAEaKD4t+xxinJsb7hFDGgAtYcA6HkOVaDwvS2Au8pc/imBTRWaRF4mlXrFrWEqM9l2OMx2a4Fd0olUlOEFMEO4hDdnv2Xl1VPMrDcMGil19L54A8ggcHfQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKPy2BEDo42tPLYaHZVrkYfRxlWPViMxohsl2o2oWfI=;
 b=T8vI3zjGM2Vht4AO1l8deq4dJPHBKy8FYxKiLR+W/7MVuJPnmf6H0PS5ecuC6SGPAGWcTe0I5yfo3NQNqsE48A9THcXL2iq0G4LAUyI3bGY4VaT03wK88QUmVIYYydwhk2XYmPk+adXsFKcePydKBo3TtPcskUTQ+MvK8209ZUd7kNxXv3I8Q7EW38ol3gABR7bkcxt2XWBeurpifg92EDBYyis3cNVBRIukyCY3UXvAthZ4WeGXtz7YXpnM5NJO/O7fnslOj+psttGKXSw1iZAS2bert4roIKs8p1seSJBfKwTR185C2BPJV0H18G2vRRR/DEnan6fQuZ1HTiibuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKPy2BEDo42tPLYaHZVrkYfRxlWPViMxohsl2o2oWfI=;
 b=gxbYISp/VWMwNTgOr8/QZJ2Jw6GmRQuVdhSBw67VH/GZI0ksFnkmhP7cY0IivUZXZm3KWspDcQ4/rT0FlifXYjTjQccch8pUPgN4dxoALR/8mopumjxDKwIFKlIUSahIpD9Bm2cxM+FTCXG6JxsWS7FOt1cR9Onth5PdxfzMP/8=
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:12:10 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::69) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 04:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:12:10 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:12:02 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 24/30] test/kms_colorop: Add tests that exercise the 1D
 LUT colorops
Date: Thu, 14 Aug 2025 22:06:53 -0600
Message-ID: <20250815040659.3321102-25-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7bd485-5fe1-4ac0-a25d-08dddbb1e805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QyXtbm3pU3Oo/ldvRn+7ifpt+maKAClCaNiMuTHAkn1MmHVUDsXwkO5IFLf1?=
 =?us-ascii?Q?s/RtqhwCwFomm/6umOmH4WZFuoR7EJg8BJt26YKAaE7avyrwr14qgW/shrfg?=
 =?us-ascii?Q?00S44Gjstr5BSCRpUrAyk4UtN/gS5z2ZEzscgMqEyZtFZtPhywn0IR4lr+qO?=
 =?us-ascii?Q?QNY1o4qeyxj3Vsr3FYnGWeG0eBtKGtfxrPX+i5DQJ5jBV0aph8KaN9okUvsw?=
 =?us-ascii?Q?9IZjXGviNBxHOphC/y0lcF4nwK8XRjYsuaL0wCwqvWEjkN5L26iL1Ev8gy61?=
 =?us-ascii?Q?HNEUg4eBXVpsy+NjLBtZCBBMKssAEp4yv0nL5k9/wkmoIt0lSm+8G6zuwK6C?=
 =?us-ascii?Q?XMOQMu3ZdTa8DPNjGUxz0co3j2XnykX6lKjHgFzcYpWsL+OM6ZiyT6SCwjeQ?=
 =?us-ascii?Q?aIk14Iwrnn8lLuCkrXwQBwS2ZQg50/uI/8+xpprjd+Ps1mjllKVL1bIJrjRx?=
 =?us-ascii?Q?gF2GkIJPhHtf1FZ/+yMzULurmSlsXVRA22DAcTDl8nKFQywitf8out0kqLRT?=
 =?us-ascii?Q?DuUG+XZLwCzlLzKYoR2hEDeuOuHggEjsDaqPtUdWA6B5ls7elCBqWtg3pPBM?=
 =?us-ascii?Q?sN6S9Ms01lm+HTC9sm0qo53XlPJcKiUcXM7EnLHnVcP7JJRVILCcn5TSay4q?=
 =?us-ascii?Q?VAwrbOSjFv3au0T4vPEK7472eWkdh07besDj5okUmjIuVLAjQZe/byDPcHld?=
 =?us-ascii?Q?w2wx4u6CHyJ00X0DcqPV9iaWGbgzWuRS+uopdHVMD2MLHX+U5h7UwOpaDu5Y?=
 =?us-ascii?Q?MdZE28akwkIQ5wcBNO9svNKZnOsk52PaJBjoHHO/Te99bZDGeIpVTujLOSiD?=
 =?us-ascii?Q?Qp+JKNOpHqurpgrlzO4QNlPp1XttgI/0Yr1lehdA03G0PAo09ejqLJiQHvHA?=
 =?us-ascii?Q?a4v4CT7HcoRCG5LMW1E6xbZivbOCJitkBNHQ3DIteVMFxVS2zgChfBdKY524?=
 =?us-ascii?Q?Hc/J+BOqhd2Vgw/J6cDH5x9Z7BgsD5aOI0/hsD3rrFnWSXlvfLNRLnO4+Sqh?=
 =?us-ascii?Q?V4KbGvhAzFq8v3D7VRa4GV5WJl8dqsmCLSOZh+PdsCiIMV/J+tOsWfrZHcwA?=
 =?us-ascii?Q?AZ8xRvGCGiT96OHp1drq8hdrTudbhODXyv+0++lcrZyotFYLoJS1CFNYsLO5?=
 =?us-ascii?Q?+J06snrYnoYbkBoJoRAUDZQD5KBn5bDaQ6P1Lr7iB3cec29q/bmAgg/N1fri?=
 =?us-ascii?Q?PUmQclrIppLKXy8eo/XegQJ+9j+LX83JNeqOHnM+mVbQCr6gs1QvXgd7UuLu?=
 =?us-ascii?Q?kVetEjlBbF3ZjlIrx9mXw7rezdmRAVt1J4gxw4k1ZHELgTFNYwd9k6lo/Tvo?=
 =?us-ascii?Q?h6iycxRRee8+ND/1ogeeZ8fHuTIm6spP9EolVFuV/vYM2Xm64OjPNkrwsRI7?=
 =?us-ascii?Q?dpfZwanC5BFTpPutUy5dIO0vAmQHjfqQ7DfifH4NX+6a9IG6bJ0wA9xJNSDY?=
 =?us-ascii?Q?9rd+vC56K1S7/FA9K4sMWwdWjXW3ckgD6oJl+3j0Z4pCja6EX407qI7PRK9S?=
 =?us-ascii?Q?vLXlyckx8djBCxylCSWnDXMEM6FX/k6mwICm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:12:10.3513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7bd485-5fe1-4ac0-a25d-08dddbb1e805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
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
index ab2771d37..bd7358a27 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,8 @@
  * @srgb_inv_eotf:			sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
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
 
@@ -313,6 +342,10 @@ static void set_colorop(igt_display_t *display,
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
@@ -484,6 +517,8 @@ igt_main
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, "srgb_inv_eotf_lut-srgb_eotf_lut" },
 		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
 		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
 		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
index 50df2b26a..dfc42b352 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -72,6 +72,7 @@ typedef struct kms_colorop {
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		igt_1dlut_t *lut1d;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
 
@@ -111,6 +112,20 @@ kms_colorop_t kms_colorop_srgb_inv_eotf = {
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

