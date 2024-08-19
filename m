Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1DC54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02410E491;
	Mon, 19 Aug 2024 20:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CG6OWysF";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D000110E482
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTYiInLB0AwZgplD5W1ax7yEe5bqECmpN4yyglYHBcsw84WWKIurvpfmEwTijTD9OZneR9/+AfnPbnHCTIs24nOzz/II8v0/VwJa5/NclRk1Y/u2wyjmWtcZ5QzEIHzV8uOfJtaObBMPPEX6F0FdTog9hdEAswyfxCaJDyWf/xiuOkW1qySDG7KDLe3cEGa4DyZjyB1uEg1vZB9rYBJiDigc3aJ0LYWdZSI1Lj1rXL02M8KDdxkEievus1nGpcn0DSFHZuEcHSw/vzY6tc+1UnJXYKf56lIh85Fse+HP8HmtHK21ljBb+m3W9Lp8ge1aDUowtZrp+28rlAiZgfLTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7582edOqrkchANHwkGvzA08GBKWYXb2G9bRCc5V6KA=;
 b=GP3om1VWP8uBnUgJKIGE6QbgmmawauVn48VkXclqZxjQ7Rt3ZZndv/jZIVtfcHOV8w0UF5ZjztE2k+7YbBczJPYzXTcqCDbs8CedBVlmpRN4WBqJEZHk/k60CAN5IEmXWUfG2GWovUmQvKYPKu/CumO14faXQrZl2bDleNte54MHkxaiqNuTkhIlWtomc9aIjYIKSLsp1jnWuPwrhfnIoxO4ubv5Ju1KI6lZBFYxSA3uJeEvibeVGpYhdDxi8GFpyBr4XXVNt9NhvwwppMY76ylNc+OlaFP9TSzbcJ+iOJFjBY8V4NeeIZG4fMthQhPd5zjnQC28hbVL0wWolWGVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7582edOqrkchANHwkGvzA08GBKWYXb2G9bRCc5V6KA=;
 b=CG6OWysFI41QtYOd2/tK0/riNkLBHDsumTG90VuiN6EDw6DGjtEDFpEnoUtC9R6R3SmAeX7k59mt4CuU+K6HZBJ0/O9+CxbSFtZ5m45C5ELpbWCq/DZLJdtnWMXRMkqP8XIT3GkXXW+QI+Fg/d6wnacGiv1ibDBkTsjPZIOf50w=
Received: from BN9PR03CA0845.namprd03.prod.outlook.com (2603:10b6:408:13d::10)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 20:58:43 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::8a) by BN9PR03CA0845.outlook.office365.com
 (2603:10b6:408:13d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 32/37] tests/kms_colorop: Add multiplier tests
Date: Mon, 19 Aug 2024 16:58:18 -0400
Message-ID: <20240819205823.316656-33-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aebaad9-2e6a-4051-bdde-08dcc091b594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WdhUZlZSWhyF0PX4GPLLTR3kNmiOS14EXkwLfl34hBoSCvnvII4pk13ASEh4?=
 =?us-ascii?Q?jlYkTPmbZ5fLHWDSmXYRuItdbdBiMsiJbh2ejoT5lDUhTAtf+8Yu1zRvczbU?=
 =?us-ascii?Q?RLGzLJzxNormLXkm4en/w/iQQFwZujJzMsJu24NBKpbOaNKtjAwzjP6qIbNF?=
 =?us-ascii?Q?/NLYpX0mdh6Q9FjytljZyDvYjoPtVXJ5FyNcuETnWzcKBQBhG0clqCGQLrhG?=
 =?us-ascii?Q?VeLUGyNb83yIPrY+NU2NqLVwETwctDaSDWTAK2jKgV+wOBGRoE8hjgzFxJNW?=
 =?us-ascii?Q?ZJqntAM09/45MWJJmUcWWC3DhcKMr69OFzrUDgW4noHUMC2N3VYG9YhVAJpX?=
 =?us-ascii?Q?1WZcEFLcP9Vsa7jBZ0cWALuRluFs7r9FG2TmG0SOMq2MvqjSABNJKy/1V66o?=
 =?us-ascii?Q?YhYzj9dg/fsGQDAmNVJ2/+nfXrHl8CEgx/T5qbBMFZqGVgCSQ6AM2ovM+cJ8?=
 =?us-ascii?Q?tpcRfLBjXUJ3HFeYyDWrCpfoD9ijDJr02OyIwzJN86MhgolobbmJe/HF3zEY?=
 =?us-ascii?Q?+5lig+lqE7+1rPRLWoJaFj09100u0UAEwDVAVVapJ3JANyD0krf4Fcw9Ka1j?=
 =?us-ascii?Q?YHFjne5r9laElW6iFcWZU84NPxrHagWBxk8KyFbb6Rp2KMZvG+zlZNpaMDy3?=
 =?us-ascii?Q?k19Vohp0t8OS/znqD8oaMMkTPtXZWhr0yiofheK98zL1rZIfxlJ55bb90Zwf?=
 =?us-ascii?Q?jFWV7DBXHsOu7weqzZPwwYJuPaOXAXs+fzLXomWrhBC+fiksBuMdlwdGfi6B?=
 =?us-ascii?Q?VudUTn/sKYbNAYCna2rbidKgaYGdnhHYS3IOkjNap1F+eYFVd7mp0i3gwSB5?=
 =?us-ascii?Q?/MWF2lK8T3lefwnDaReW51l7jK6hkFtOzS5Ey/BsrQgnskE+7+7jsJ59Qbvr?=
 =?us-ascii?Q?eMJXXLr6RK51oRWTRFUCUbiwPQIbxi6qXSnmM5dPBdJhfmTG8XyQOA7jkHVu?=
 =?us-ascii?Q?Y8U2tdRAUGLc6QR2SnTqB4WJawWwysjma1JWoM8ZGXXJp5moad6B8EXGSwQ2?=
 =?us-ascii?Q?5g+kOX3ZFYLLga84nC89j8gt/RnoMnMouTrle2gMggKNuA3J1/CtslDgUmLq?=
 =?us-ascii?Q?s8w1ja2KqKmZZI+EaG9PvGGoQTY/lTkRlPFwmgUY44kFlZKeHPwbj2wRq7zr?=
 =?us-ascii?Q?68p/xxUXhZhgZ4Oqq4hCw+SUBKaAmaZp7xeoFTCeYH+DQsyfDE9WrPwotM+w?=
 =?us-ascii?Q?u+xNgTt8rHfcpa3YQbz/CaS7jDPtc0Smwqc5sAQxG4po2NPucvdD1NYIxFy5?=
 =?us-ascii?Q?uVYIv6NPQtq92lLJMNoy/gt1NH735N8PozR0WkKHa7Dx0bf3YxMQx3eP4vC7?=
 =?us-ascii?Q?Hlzas/nieWsW7oLRVd+MX4Ggejveqedwq0j68+6ipY5hohqRXIYCgCcGXzxz?=
 =?us-ascii?Q?xUb0FQ5trmgGQUzelWIcdCG6jJ3JRwdOwszlSgJQWeQt4SIpKeOq5+VJtjII?=
 =?us-ascii?Q?FVYlVEs91XbylxZpfhfNtEZpeZu8aJtd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:42.8357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aebaad9-2e6a-4051-bdde-08dcc091b594
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
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
index 59dc8dcaa481..57b1dac3d516 100644
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
index cc5ee3b0ba50..e6f435bf436c 100644
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
index 4a9f9b7a3958..4cc34cab569e 100644
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
index efbcddec12d7..45d3252eb178 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -697,6 +697,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
+	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3e789050c860..ced45124f060 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -355,6 +355,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
+	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 436bd085f9a7..90348a34595b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,8 @@
  * @ctm_3x4_bt709_dec:			BT709 decoding matrix
  * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
  * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @multiply_125:			Multiplier by 125
+ * @multiply_inv_125:			Multiplier by inverse of 125
  *
  */
 
@@ -236,6 +238,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -329,6 +333,7 @@ static void set_colorop(igt_display_t *display,
 			kms_colorop_t *colorop)
 {
 	uint64_t lut_size = 0;
+	uint64_t mult = 1;
 
 	igt_assert(colorop->colorop);
 	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
@@ -346,6 +351,10 @@ static void set_colorop(igt_display_t *display,
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
index 13d15ea6637d..1def86bc3380 100644
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
2.46.0

