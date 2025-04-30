Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC8C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74710E6AE;
	Wed, 30 Apr 2025 01:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mzbecYoP";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951BD10E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in7899pZIQlV996LoB5mrsC415nWa37lNteChPlCwmM6VY/YyFZa0QykG4DQ8yyxJBA1ik4dWd1vjt/lrTlLE7RYAwIwDhDBf/fvubcF2Io5mrIchFYsJUGdwTPBeSwH9r7NdNny6AXPRJV6T+oeNzY+NPlQzS2HVc07f9qCtjcFXAEhyo1KQhMIwywnwKP78RVjXMyehahKZ/qPtq+2IqyxXzwWgJVDubmA4NTCOCjbLIaPMK8/9Pv+LmU0CuGgrokgdTKduC9f/+SGb0YtriQl06WBg2TavfG9aGZBFKY3Gbs6g8hbV/r9J2anAkZFom3p9u5hBmXvtnB26p8yxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj9iidzyO6d5BbtYNAqbz5HN2Isn6Xdpi5mv5310BFo=;
 b=ZZTufJioP+xwL4PkfYxtvQ/o3knj+60XJzxHm8gke1O7NJls09LR+FCLuyDfWJGqFn2+TetcP8jh0P5Hv469MELoEwxyPJn+XHCZcOmeE+kwJYoTa2wcrGf3c152qpj4WvD73HVs/Tz/an8TIgYf8ZLM1rpZJ52W6OzDF31+ECr3E4tIcLEGV0sNj5d3ZUKrvtRBL69zfyfIKy9b9r1vSX83sL1G/o860hGapGL9c8Uki/EnKTAkP6amW4FiGdkDpzhr1QeqxGqRXuFNta1pdjps34cwxAoxwKoSKLN3XLSx7auPWGM3YT8bQRSCgOeBnjlk8n7/asvL0jpNwuO6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj9iidzyO6d5BbtYNAqbz5HN2Isn6Xdpi5mv5310BFo=;
 b=mzbecYoPiZF3gf0ah5hZjtn2SbNGEk8BF9ZNgXhnU4OJ/6alYrq/wc4oCjUfYMyElUZgVfC0+66mqcDQFtS0RRjfPORl0m+28pv28rbfzy8iWVFgEArc3QbjY2DfgQsxRP6A44ao3ntlH7LwDHIJ3jh9ae/IYzui6zV9HSwFg2k=
Received: from SJ0PR13CA0108.namprd13.prod.outlook.com (2603:10b6:a03:2c5::23)
 by SJ2PR12MB8158.namprd12.prod.outlook.com (2603:10b6:a03:4f7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:41:15 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::b9) by SJ0PR13CA0108.outlook.office365.com
 (2603:10b6:a03:2c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:41:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:41:15 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:41:13 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 29/36] test/kms_colorop: Add tests that exercise the 1D LUT
 colorops
Date: Tue, 29 Apr 2025 19:34:47 -0600
Message-ID: <20250430013454.226910-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SJ2PR12MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 939290a1-9df8-47fc-5a0d-08dd87881888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rurSNdWRUAhjiOkAEBnYrv0axDGJ1WPphbtRjOsa77PN81tQNr6vey6KjTc?=
 =?us-ascii?Q?sSk7ulyLHHuqVIvo6qcR8pXKEmCP/Lyvzm0VFYa0peLwObj2A9GDuZWSQXFf?=
 =?us-ascii?Q?1+QGBYCCBAT920sfdpQEpoV4I0RLwZAKBgCu/6qBjGE8ahT7VOLyjgF9TJC1?=
 =?us-ascii?Q?i3/MxxRVmkbGwoAEFj0asLAqrCXdyrPdMlfMLyQ9PzGaPRFhf7NCuU9LWLN6?=
 =?us-ascii?Q?3lfqTrlNvoLD2af+3KuyVWKADVfG95C9riQ+XvMqEw9stVSTBRf4a+FRUQTm?=
 =?us-ascii?Q?p034JDx4BxJj1Oxz3SuHpJ9u4MZU2CvgxL1Hj/C/dpXH1cuL8PTn5gacEXBY?=
 =?us-ascii?Q?KTycTSfaxV0TNTmHRQ10kC7uvOox5Btabe3VPnTUq1CV09knPYHokitDePlM?=
 =?us-ascii?Q?B9r1y3A0PcdJ32aFov+vGLmMDX0RPRThEr3n1lVGsaLv3tO+DYAzDY942ZWV?=
 =?us-ascii?Q?kuZ0m/UW4nwqd8/K+Mo3PvFbqf7FhT8FkM/upmJ2tzgs4tBc5Cjj5TO3IqIy?=
 =?us-ascii?Q?ESvH6O4jsOCq58zapgk4Rw0nV93G999MBIX8xks63FEvwATUQkbsseZ4KHdi?=
 =?us-ascii?Q?c6eIASNBpmsK9l7lUdtIU0RBpW3LhIKGgIqZT8kduz4KXqoMCEi/R1DOuYk3?=
 =?us-ascii?Q?WVyZ5HragY6uEgWg/T10B9xzeNxm4xYp66q2EWmxtTeHSiUnshM7QG+xjURD?=
 =?us-ascii?Q?+e3KF5H43kMV+PEvSceRkgRpQbSHWnc/ghgPl5mX5MKtr3NzOIN4BjEwHqUb?=
 =?us-ascii?Q?zryq6gKgXgW+Y6wwqBnTgCQR8j85sX9H6leQv7oNFIzAUEIqNviMB7eWqdaN?=
 =?us-ascii?Q?MPF9I6CWtrKxBPjY4hSUUvp2a5X93+la+gfxT2XL1dIPmFzUv3i8mUyMD2Ic?=
 =?us-ascii?Q?0YXEd93gH037ZdS4r/oOL0Gpm4xT0eeg3nIC9zDHYs3Dpf8NQGL2W5A4ezl2?=
 =?us-ascii?Q?tGP1EMK5QYFd6Hw/ZPotJxxML0DJzmStStNq4HgP+ZYKDliuLEdlo/qF+rnp?=
 =?us-ascii?Q?c2016uXGdr10/e0Tqq9r4vcfOexHSplAHrt/RBkqbvrkvyUna89m8Vfhlb8M?=
 =?us-ascii?Q?+eT7C5CQ1k+N0kcHdoej0AAuPB5LHzTOxdlvb0bkBRf0HCzkFiDrBpWlWJ1j?=
 =?us-ascii?Q?ncGn1Xxv//McU2PSLJtEky95I9pM3jexZ+2WBcEH3mkkJMdx1XNOiQq6/uxL?=
 =?us-ascii?Q?1EhHvD/Clia4NWEek3OeSfCe8Pd1W1V72GhlxNx692xYTmEzge2MeANYhLHJ?=
 =?us-ascii?Q?gHcxT3VsJT7/n7JqlbnQMjSQFxtjFvV354buZcEa1ynVCC2Lc0STPyvuoCqf?=
 =?us-ascii?Q?CnorCPWtreA48Zui1X22fzIFzw7KhiN9NJUdDCnT+lSZ8n6unyAFjVreHbep?=
 =?us-ascii?Q?5GR7+hbUO+ukeMe3gMYR+k8iHplf6V2uIlgQNMwtmd4zvcUdE6i7Rq0ZHVn2?=
 =?us-ascii?Q?UxgygmXIqeIpi770U3WSAF/C6cFBzQQMiFayc+u0q4jYG/3QnibjnjCwzETZ?=
 =?us-ascii?Q?RALdicj/mn+b4Q9TsFLsjvFetx7k6c1FmXu6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:41:15.1966 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 939290a1-9df8-47fc-5a0d-08dd87881888
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8158
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
index 0f2feb50f..94470ecdb 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -49,6 +49,8 @@
  * @srgb_inv_eotf:              	sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    	sRGB EOTF -> sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @srgb_inv_eotf_lut:              	sRGB Inverse EOTF Custom LUT
+ * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
  * @bt2020_inv_oetf:			BT.2020 Inverse OETF
  * @bt2020_oetf:			BT.2020 OETF
  * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
@@ -230,6 +232,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -297,9 +302,33 @@ static igt_colorop_t *get_color_pipeline(igt_display_t *display,
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
 
@@ -312,6 +341,10 @@ static void set_colorop(igt_display_t *display,
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

