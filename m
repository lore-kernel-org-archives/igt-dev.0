Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7861CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851D10EBD9;
	Sat, 15 Nov 2025 00:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qFae+28p";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635310EBD5
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxqyFwywAkh3Ov4r3+3EeteoFp6329XCoqzBzlbg3IXi/gCAt92oPOWoTA9rQ3iTzt8AV9fNLfw7UrdhI9seNsXfokQe+GbHykNbccm3lAfFQJM1e3CXbiczpJvwCxWrWnClZOnNLqru4f8z1Niqq8saX/bqidcPNIqttmEblFdjYX2Ws3nMi3dLSo1eC/+sE55Z3et/zWriCGo1/Q01L/dITi4ERHAIVvqKKtJjHBdtyfzyqbU01u7m1TCzgVWyNWulWwajwoTqOdXIti48qMTtXDRSyBPln+6fUCihOf7tWXm17Q2tBwStt8xZFEoqvEIQNwjJIl+2fXA75ZFTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFsXoJbXGqmN5s4WTKKShPE1splhPbGQ7qjrO8L0CAg=;
 b=gNzrV8GTeUdNekC9u7Av6AGb2Th4Z2JybBZNQ//IH7zjyLled1bLo4Z/8Oeu9jSk0KXTEZlTtCrY1SeFrNnixtdHTZJahDpNs1uX01f2nyhDEJqE/TJGfrm1Lp4AeOSSAKaTIoUc34xR5KuHbAGOj3L7nPgspGj30O/hc8lgWjDasBnjJhyMf46idNbYlhM+7rlQuzry3d/q2XjV8BKxoi0ytllLXf0K9kTipXopYrrp3X2X5koHZbzwVhckF8xqvEjP28dTCg9bxE2VSiSwi8w7V+AZWp563juAyu5WQ9/1Qof2xUNMdjNlkv1XoSSZDzo0WikiYl3mHOjyZ95g3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFsXoJbXGqmN5s4WTKKShPE1splhPbGQ7qjrO8L0CAg=;
 b=qFae+28p7NXYuYVKM/9jZiTGA+gGpXYHmTDwBWIb+OqNdG89ASnS0jnfH0YrEDaa5rmEJGf+Q95K4JdfUMmH37zQvlHCpRlzC2xWelBcOedxjeSue6Ek6E3XZMfg0W0F3B6iCHwL2Zl/kp5Flc5DmTNcBHipSwex5U+dgeNGsn8=
Received: from DS7PR06CA0019.namprd06.prod.outlook.com (2603:10b6:8:2a::18) by
 IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Sat, 15 Nov 2025 00:24:05 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::b0) by DS7PR06CA0019.outlook.office365.com
 (2603:10b6:8:2a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:24:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:24:03 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 26/32] tests/kms_colorop: Add tests that exercise the 1D
 LUT colorops
Date: Fri, 14 Nov 2025 17:18:35 -0700
Message-ID: <20251115001841.3563993-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: e797f21e-bbe1-4e7e-2b91-08de23dd48f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?teJ4tXciw85zNhejkgrcHP/TGzZzC/xi+8VkLZxlp0yXXvU8RSovwRRQAGfJ?=
 =?us-ascii?Q?of83Ft2hO+oW6ee34DYaxLa3X2aoEKf32QVnDsG/jU1g/pjGZTR1bSJt1o6v?=
 =?us-ascii?Q?1YTQZX7OXBN0PurX/1tgaA/R37g/xhvyWp6HQrGj8948O0EIHYx1x0sGl1dy?=
 =?us-ascii?Q?TNCm/pqlaLqGGmLhE/vpnEBsJEEoRp3hHIue3+EhdLnWxcuBqeaRmQlRFm3h?=
 =?us-ascii?Q?MCYr+6s6g1xkgJi6ybVFhTvgrUONzdwPfRQy9Z/JnET5U4dGjYbV9ptcYG7S?=
 =?us-ascii?Q?Z+ZlZ7tAN/lBpDxjYoWI4B4zTGwMEjPG7dIaSO9WhMfZGRVAX1rHF9jldqSu?=
 =?us-ascii?Q?mnfTu+iqb7XkboEXnClQhbyOewIF5wqcu3YmFcSKAbg5KbpcOMJHjK8UvVK8?=
 =?us-ascii?Q?vikDEL7mIJ97PI6/87v3J0hEOZdbDXaICuk48FQWdUHHfPejEpk7FJsdXNOA?=
 =?us-ascii?Q?MvLTyT1uRuE7RVUi2VrWfURqtBbrC+0766XL/v9r3rTn4mz9PXm96lqmthXB?=
 =?us-ascii?Q?Ruzu73NySoIEMG94252VC61RgOoutCITPhG11D7j3sisnm7uZQ/s93oEzZr6?=
 =?us-ascii?Q?kjyvw+uI1I/3e3SsIqQcjK7cUpYAur5AZvrdu+uJGt+p0Re8S31jfV4CJhHQ?=
 =?us-ascii?Q?r4HCLHOlbk7pZwGF4rjROfC56xj/Z9cIJaeFkvVwO3VktE8Muolzq+c5tC61?=
 =?us-ascii?Q?zRVuwb+/7Qe9pQ9fD9hBxnesbPbb7GwiSpog7yo3God5mJLXddDZK2Ok3jfo?=
 =?us-ascii?Q?eRkxcLy9Wd7+GsoEV4GOB9erC7EnDum8heCy3T2JQt3LFKwZ0NzJ3dgOE5m0?=
 =?us-ascii?Q?i+FBeiz4GhMSO3OWt8qIGU5jaJfHYkR6rl/nMY+lHUgkdDzb5bVjnldE7pIx?=
 =?us-ascii?Q?b71yW+S/fSV17Fl9JVhAPjYIBmjMPL6U6eMAKKKHAlbMp/uWBgf/6/+OwC1H?=
 =?us-ascii?Q?YdBM/zK+VcYOreJikVJkmCDPElaBEMEbUsRlFDRK6Qu6tmtoBJZkIex+4vci?=
 =?us-ascii?Q?YDdA99oISU+aaLh710rYl2e9K9/iRrwd7oEqA3FVeJGb9Ysc9sz0Rb4A4pkq?=
 =?us-ascii?Q?aE9J9ffZRldo49FJjruSw8mr6wHYfC7AMZqYHpFsiKEiv11GaQlEtx8fVUrw?=
 =?us-ascii?Q?F8Z/u12lfJppnNV3gCmTDed4WKAnwns8Wyz9H0aMAF7PLCdqtZck5krN4qYG?=
 =?us-ascii?Q?e+h/PD/LFFTyaQaeHfHBLuFc4obvg33+fzIcNjpYG3rCC7fQSmKZhDHeRKuM?=
 =?us-ascii?Q?Mpd0HMjron0xiYM5dydmRXlLEKx8+i9Y1oR2LCC4kvfrLuUkqMubGs4mSLFM?=
 =?us-ascii?Q?Gi9KAdrENI0WwcpP6F2wtrRylzmFvSzXdLa/kxNEI5BsHp38KkrAjE3Jlrfw?=
 =?us-ascii?Q?C6PEaLUtcXAamn6UxMLdx8iDE4IJ5ZWkpIE/kS81HctLRhLsVhdfBBdUfE4E?=
 =?us-ascii?Q?m2+H19W/YzC7Yvc+q5tmvXoXMfT1+hdzMrZfZYn0fsEPVYA1f8L9MVpvqyYE?=
 =?us-ascii?Q?o6JMqBZv/uzx3vGJoKtZsWlZPfpQ6dGUytkJ1iTwwNZNO96tISsW4KAIRkQv?=
 =?us-ascii?Q?PD/tqQNs+bvzgzmZZvM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:24:05.0972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e797f21e-bbe1-4e7e-2b91-08de23dd48f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

