Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BBCC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F9E10E6A2;
	Wed, 30 Apr 2025 01:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/+diDSP";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775D10E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYYYGpFyeS3z6HEM3+krbng8ib8nb6H/3Fp7O3KQ52maUWkoEt4sw53kA6ZrkaZvZNgrsWKcuLOzQf/y6J5uNBxPf5uviUf37GoHKZTPbvwjcYk4A1+2JvPA0menWeu24twy+0Dn+3+71m7ohXztO2UAYz7eXTk1LgLaP81FISVOthHRbiXBnrGGw+/sle9Vxi4o89pyK7WIBBFYomMVjqH0Q+X/Xa8DxFrWeoFm4jEiqBY3wCAnbHoHUoWo6mQTsaE8GC+25HI22mepN7stGqjcJpKLXtzV3n9lvk/MZt6lLBsy6klFuGxdKmTU340YcSACfriQxR/3Cn5m7ai66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0kd5E2bMp1iBZlqXp1sTR+si9Fq+o+7nzjJ8Jy0f2Y=;
 b=JHdKI5gNAivNFCZDLbWsLJnF+AJRfuJUNdtNW+rbZg457XQ4IPe93GyTK+fxwzNydB8zrVoVz41mvqlz9o5KRUTXFst+f3EfFROk9pZlV4KKysTmkHCzzPNMRjrdDypEtCSa0kpgi9sF01xrghxvPrMu5ddPkBjnsoz8uXirEkrH5DFZazE2/tAJzXgEn+P72IJHV3Ou/jLgzWphzcuGVLIbJFPRsp2qAigQaao3aCz3doRoxVlPNHMF7AuMb0MaZNnDGdScoX6M94ZvxgTcTUqZ+FwBj0V+NwiSroXf01p9QXpBsicbLl8E40DGt/wM8DIl0jbsotjQidDtSneH4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0kd5E2bMp1iBZlqXp1sTR+si9Fq+o+7nzjJ8Jy0f2Y=;
 b=i/+diDSPUNbTjeOFhGlp09i0q+sQZ7gzULhbr1I3g4sKNN7mlZ5vMI/tY4JQ8178YLTCzmJpaKnLhUYZ5sax0JnN3WkzlUbEplokysHbIv56XOFD+5m/oYrPGlANhY85vrkMCLsozWLEF2ByfkyhZ7XsyNzpw0KDrpmpUj3SlxM=
Received: from MW4PR03CA0193.namprd03.prod.outlook.com (2603:10b6:303:b8::18)
 by SJ2PR12MB8036.namprd12.prod.outlook.com (2603:10b6:a03:4c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:38:49 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::9d) by MW4PR03CA0193.outlook.office365.com
 (2603:10b6:303:b8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:38:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:38:47 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 17/36] tests/kms_colorop: Add bypass test
Date: Tue, 29 Apr 2025 19:34:35 -0600
Message-ID: <20250430013454.226910-18-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ2PR12MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baf43b6-a795-43b4-255d-08dd8787c19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rHkCWKCZv7ax605qPFVaSfVEDg1XGz8rZ884bDYGIRxV+7S+kF0cJ1QT/P/L?=
 =?us-ascii?Q?96L/g7Zf7nawO0npk1tkFc2rQeJPui6yBxKkaxYI7uFYdnZnX5+cx/KM/1/P?=
 =?us-ascii?Q?zFZ6dM1WYRRL96NPav59fRaeRkQryzp0ZMzel0LhQpPoesCDQvr9sEWKWeAo?=
 =?us-ascii?Q?SRcqXdMTz5y8KhpkYlQy5wXPpcxhQfUuFxFkR9t5El68qRRpY62f9XxwUGnp?=
 =?us-ascii?Q?0yi3YP9hoIEPqttHkFvjLqdOue48PneNpq3WIYVzXjIXRvy1Lr/xW2pAnNPW?=
 =?us-ascii?Q?BDzfeTxuEw/GxufFhBcsO5HKsclt7woWkLqILJN1bM+KkJYPesuEwAhL1Jyg?=
 =?us-ascii?Q?eIJiHeaEmS79o7vvjj9pyBKUhz3tujt7mm0I7NnLNLjZ3SO+OePQ7j4o7MeW?=
 =?us-ascii?Q?crIh13Ia4qmRNrpJCU+1QTOvFXWQu7Zj0ArnBaGC1JhV753uk7J9EQYzTsLt?=
 =?us-ascii?Q?AjdP5ZM1I3n7KYrqI/LW6dlPGmnVFJIvQ3tEQw+jLWJfK6ba5yR5BEvxpE/F?=
 =?us-ascii?Q?boGLSc9ofApKJWCK+Q4s02QCeafKNWbNfO7dPsH8+eSR2nwZGGwOA/3bAcql?=
 =?us-ascii?Q?UeTe1yUgKIvpj7vcloIR2MGZ6rosQUlYSzEPk/a8AXixXTW+DDaFcSBeXDlQ?=
 =?us-ascii?Q?NXFq7skErPoBgXkS+adSEYILQyisJuauqrXZsXsw4jfqZPWTTW8OhsU6Kd06?=
 =?us-ascii?Q?JkO/PXCzn93y1F3rLdK4Gl2IPWBAR9JOCSDnpYU3w5vJj06bTt+rnAxye5xt?=
 =?us-ascii?Q?W8VLDexypr6EFAmOApU/tKaCf0aUbefvL0iSW67j5BoTIBJ2ybF1wU2fahHQ?=
 =?us-ascii?Q?L/gwuk+/fSV9QrlEyfjfmonQMxGYhSScTYpbDsEPI4Zc7NP5tpqclt44od4u?=
 =?us-ascii?Q?xkj5zwtSMB5lh0w95Q2Q9xQBiKBvh4wQ6+RqWcG+C2NCn4be7zzSJY6zkow8?=
 =?us-ascii?Q?GTKVk9PZwuWvsiNjonxqH56CDM5AZYXYymbAnIcYbrpHFKBeI8hYmnwGmpXr?=
 =?us-ascii?Q?MY6cv3NZ3c6Pe8JEQ8+G5e7/T+04JYFw5aHuuFXXEBxoZcBWmZhfOnhjAmR0?=
 =?us-ascii?Q?EeI17NbMmg02bUqCMOm8Z0v4lPWuoLD5Pi37XpYkxb5LQa52RxQ0Rma6PIT/?=
 =?us-ascii?Q?RmiouSvBUYBlWVOdMQlsiuIMCKyGcKMVMP0ytVPmlqh0930Iv3gR/OhMaSm8?=
 =?us-ascii?Q?z/F0eWypty94PaJomKtBPkxFMrLpQMxxvnkJK+INfo8wkHldWASUkNJAwjHh?=
 =?us-ascii?Q?RjxnEPeHZdVU19Z+qfSjk+H5CypalgeAmIPwgyv1YxuRkQQpvKydmyBPune9?=
 =?us-ascii?Q?FF3yZxlbfUOGEEpX+p9rtmcgJfoNAiz7E3C3HEUYt2hddi28WzDgzSvICBb0?=
 =?us-ascii?Q?8qqg+ycm0uwHMrKkrACjmXER8Yzz0Lqgw6YRlLdIBsMN8BhjoaE6zPEcs4JA?=
 =?us-ascii?Q?gxwtJ/G7UcmDSCyT7o2l+awfLTHZ6+pKjxcxKKJLGz2msC/NuGcLWxLPY3Wn?=
 =?us-ascii?Q?Y5bIwu6+lo24i52Mfkn7dXV/fYQIEdRVec9D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:38:49.2795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baf43b6-a795-43b4-255d-08dd8787c19b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8036
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

We want to test that setting the color pipeline to bypass
yields the expected results.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 66 +++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 95ccf2c47..83f121073 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -30,7 +30,7 @@
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
- * SUBTEST: plane-%s
+ * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -39,6 +39,11 @@
  *
  * arg[1]:
  *
+ * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ *
+ * arg[2]:
+ *
+ * @bypass:			Bypass Color Pipeline
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
@@ -54,11 +59,12 @@
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
-				    drmModeModeInfo override_mode)
+				    drmModeModeInfo override_mode, __u32 fourcc_in,
+				    __u32 fourcc_out)
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
-	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
+	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
 
@@ -68,7 +74,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
@@ -101,7 +107,7 @@ typedef struct {
 static data_t data;
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
 	enum pipe pipe;
@@ -137,7 +143,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
-			if (check_writeback_config(display, output, override_mode)) {
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -364,6 +370,8 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       __u32 fourcc_in,
+			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
@@ -376,7 +384,7 @@ static void colorop_plane_test(igt_display_t *display,
 	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
 
-	output = kms_writeback_get_output(display);
+	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
 	igt_require(output);
 
 	if (output->use_override_mode)
@@ -390,7 +398,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	fb_id = igt_create_color_pattern_fb(display->drm_fd,
 					mode.hdisplay, mode.vdisplay,
-					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					fourcc_in, DRM_FORMAT_MOD_LINEAR,
 					0.2, 0.2, 0.2, &input_fb);
 	igt_assert(fb_id >= 0);
 	igt_plane_set_fb(plane, &input_fb);
@@ -400,7 +408,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* create output fb */
 	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				DRM_FORMAT_XRGB8888,
+				fourcc_in,
 				igt_fb_mod_to_tiling(0),
 				&output_fb);
 	igt_require(fb_id > 0);
@@ -439,13 +447,18 @@ static void colorop_plane_test(igt_display_t *display,
 #endif
 	/* discover and set COLOR PIPELINE */
 
-	/* get COLOR_PIPELINE enum */
-	color_pipeline = get_color_pipeline(display, plane, colorops);
+	if (!colorops[0]) {
+		/* bypass test */
+		set_color_pipeline_bypass(plane);
+	} else {
+		/* get COLOR_PIPELINE enum */
+		color_pipeline = get_color_pipeline(display, plane, colorops);
 
-	/* skip test if we can't find applicable pipeline */
-	igt_skip_on(!color_pipeline);
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
 
-	set_color_pipeline(display, plane, colorops, color_pipeline);
+		set_color_pipeline(display, plane, colorops, color_pipeline);
+	}
 
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -486,6 +499,7 @@ igt_main
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
+		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
@@ -498,8 +512,16 @@ igt_main
 		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
 	};
 
+	struct {
+		__u32 fourcc_in;
+		__u32 fourcc_out;
+		const char *name;
+	} formats[] = {
+		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+	};
+
 	igt_display_t display;
-	int i, ret;
+	int i, j, ret;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -521,12 +543,16 @@ igt_main
 
 	}
 
-	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-		igt_describe("Bla bla bla");
-		igt_subtest_f("plane-%s", tests[i].name)
-			colorop_plane_test(&display, tests[i].colorops);
+	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+		for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+			igt_describe("Bla bla bla");
+			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+				colorop_plane_test(&display,
+						   formats[j].fourcc_in,
+						   formats[j].fourcc_out,
+						   tests[i].colorops);
+		}
 	}
-
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
 #if 0
 	igt_subtest("plane-srgb") {
-- 
2.43.0

