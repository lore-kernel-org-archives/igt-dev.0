Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69007CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94EA10E8B0;
	Thu, 30 Oct 2025 04:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4AKO91fE";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D51A10E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:31:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC9dvukpcfbxAfdD4vXaEuludCcN2YeLOmQQxjKr49vaECdi9lwxAPk0vKz95yxkeAMBsIOc0Dgr/O86JL9kS8Cl/LGSYTpwQkyn9v46ZUyD5S0/bebd+AhDoWXMHtbexalZRqx+9CYF7dRVrfQYiwSnI0wWP4mXG0+26HIzg2xlSoaighBuK3Jg1Vul/q8096e/mVtiFAEnLXil/oTKz3k3avaVtZ0q++SGwsACBFvtB4gINuGTlqWw9KZoXoT1wG5i6zBsIVnfKDNLMz1M2WkxgS22nHY+ofPLDMNCsLCOs95A/A2EwoFhi7FLQrVQbV5xcxxc6Njn0fZdD6FHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oCqZQZyaTG36oes29k1xgV5lnDiFKnL9uRfqd1S2aQ=;
 b=cERWR9XHxCyp7OLblmQh7FxWwdJdP2QG1T/jYASfP6KkkL4LDhdnUARp8L/+kxp+KoGPCqreCr3XsY0S/FwEmfgbdPgtSeXZiJjStIthTs8jMw+3hk/M3TSORMDd1zShOx1vB1Sx8V7nzNMTYeK8POBG6EN13uq/8VkfdjrGmLpqKP2K5GH1Ks4aGVXnWqdu5MIlfm3b5f64lOtmdFVx8/rOR/cW+GKAXhWSi/s1zpt2TRmida7m49T5C1I6S5Ey19WNw1TJSn1L5Ltsa3WuoNcI4e64OMP/0XpJmgmvkAeFmvXao5gtsLcfCtyjA6MUhoQ/J2BvyJhdjCQtEELkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oCqZQZyaTG36oes29k1xgV5lnDiFKnL9uRfqd1S2aQ=;
 b=4AKO91fE+TctioA2XYAIrp5YMSAFvjoh8roFg4P4OEMrPHtf7jetMV6Tju0VY3WGr2SO/MusiGaUmEWqi+biVNn1XcHF8rxmuFGtD1pmXcBxIB35VgjOMnfKCZK34NxiCsM4c17cYUjy2nFliyjwU7kUUkMaEFRttT9ptoWUELM=
Received: from PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::10)
 by CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:31:53 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::e1) by PH8P220CA0032.outlook.office365.com
 (2603:10b6:510:348::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:31:51 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:31:20 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 15/32] tests/kms_colorop: Add bypass test
Date: Wed, 29 Oct 2025 22:27:44 -0600
Message-ID: <20251030042801.2315866-16-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: e71e1e64-1f0b-4261-cf1d-08de176d3fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xuo1nqdRdtyPurRrceXaWwIOyRUMuIqA6SMM8aAW79GFVggXlB64IG6kR978?=
 =?us-ascii?Q?xphO5RkZftnr/+OBrE+U7fD+FPBBOso3vAh0d54EGOgbYvr0PqA794wqGHwW?=
 =?us-ascii?Q?eE20n57RSO0yJkokc/ZA2MsxLvuoIC2eI/6ouZtN8N9JATJd/gKyPnNtpHW6?=
 =?us-ascii?Q?dAInsaL+gTFqz9OhPlksv5QpOWGGfrpdWUMzFwIrYO5Ci+h/7VzunZKeKBff?=
 =?us-ascii?Q?5n79oSfhS1Yun35mSxJnnpUm+pdDpyZyKklpi0T0W2/NGQrHixiUqwR3UTei?=
 =?us-ascii?Q?NRn0WYGXuLyaYDS5QkI1QvZ5VNP+vkHjijPELn0MEBnsSMnJeB7NpN/+ngwG?=
 =?us-ascii?Q?zTL9xowZDKiawF0jdNr3HYZ/pO2HI85FmxWbe7WuVuRzlbtVGn0xFUV32kr5?=
 =?us-ascii?Q?7AGfpdVOx70nvGup8CD1VLUxNcejumV7ssWNLhQgEEnRszX4n2ztC267D37T?=
 =?us-ascii?Q?vWoaRojTMnsjtGZcjcurIXPV1HM0j3fJGBz7yjvhYf1kbeopveSCjgwk5kVK?=
 =?us-ascii?Q?1NATVfZR2xG/674NllYip6wWAtNlx7FVaP9kR4BW5GcuUCpIHnhJEu2ddPU0?=
 =?us-ascii?Q?QmCnIf9Vy1dszsXholqfvTBxHa2heJkQEAwMVEp2kYw2TYw/VOUwIfKwm04N?=
 =?us-ascii?Q?4OPmky/l13/MHqFP3yNpn9HLrLxxqJX9bjHef5lQh/K5Z9+KLvOy52GdZPw7?=
 =?us-ascii?Q?Yqfo8ojvW1kZO+wchMIki3pFoV/as9yTiPiqZ+KwHIX97XKCwONEmsm8jCYY?=
 =?us-ascii?Q?hxJ1IWZGACGi3zNqqa+vC4Ulcs4wge4GdFUF1CMJ9iEUnZl/pR5NC1hwQMss?=
 =?us-ascii?Q?FWdJOqtrlUlJ7/vPzBY1a9wclH/RMoghmg5I+HLYWf9v6kb80J++9xSn8kCN?=
 =?us-ascii?Q?Hy0RHyVrf06zs7KZBFLykfEG0vTn2+LrdeQcWvh/525pWho5WZxPJPZ1ByEb?=
 =?us-ascii?Q?8ivl5DX7UbQgALoLejWa3TfBV02UGRQGAEQxB2Md0gjKVByQ+H+7q9Cfkqr3?=
 =?us-ascii?Q?RaVBFyUYxWy/jpAxXsiatJd2tt2V9Oa6SJNxnfptvQc+6VtgbIm9AQOl1afD?=
 =?us-ascii?Q?xm3Tz3ge0FH3tNwpaUmdy7jXt7V92zcrBIoEpOhcAbzTXcReH8gMciW63fZw?=
 =?us-ascii?Q?QmaHS4/A7tBylv2JW+ENn9ARrmbdqNSUPQDU3Xz3OPZN+iEEiHRUMhUWsZ2r?=
 =?us-ascii?Q?NbxAgQ7MtCZ0YhFL90sqPEO/nY0F4tqs3GsRwKqtLZsyVKLX7bc/PI0UQAJn?=
 =?us-ascii?Q?laqMB9U+k8J75f2NmMyj5azJkiC7tr2oEEYXvVjqCUvFNQl90sd4V2uNhayj?=
 =?us-ascii?Q?w1YVyynbhog8n/FoVwW9zft4/mT64wzNk1532XSob/ggv/ip0VTcF2/fT8wB?=
 =?us-ascii?Q?eD30AWi6MuZaANYp1GpAHOMPNFBBku93qpG7fcCmZxCPo3yo//KNsti2F6B1?=
 =?us-ascii?Q?ykze35YUluNLlB/UwueU6kYpB0fs8N1s6zPImV7qCP2gVaQ7294bF6KhUjLL?=
 =?us-ascii?Q?4ijds5rkMyb17wz2XIsMVAJ15XDeXiL5aCkbvSkzewlaaVcIgPzgK2+P0i6u?=
 =?us-ascii?Q?5swRNpHB64S8YQ9aJxI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:31:51.9190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e71e1e64-1f0b-4261-cf1d-08de176d3fa4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 65 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 108e9a0e5..8e677c1d1 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -13,7 +13,7 @@
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
- * SUBTEST: plane-%s
+ * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -22,6 +22,11 @@
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
@@ -36,11 +41,12 @@
  */
 
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
 
@@ -50,7 +56,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
@@ -76,7 +82,7 @@ typedef struct {
 
 static data_t data;
 
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
 	enum pipe pipe;
@@ -107,7 +113,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
 
-			if (check_writeback_config(display, output, override_mode)) {
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -295,6 +301,8 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       __u32 fourcc_in,
+			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
@@ -307,7 +315,7 @@ static void colorop_plane_test(igt_display_t *display,
 	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
 
-	output = kms_writeback_get_output(display);
+	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
 	igt_require(output);
 
 	if (output->use_override_mode)
@@ -321,7 +329,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	fb_id = igt_create_color_pattern_fb(display->drm_fd,
 					mode.hdisplay, mode.vdisplay,
-					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					fourcc_in, DRM_FORMAT_MOD_LINEAR,
 					0.2, 0.2, 0.2, &input_fb);
 	igt_assert(fb_id >= 0);
 	igt_plane_set_fb(plane, &input_fb);
@@ -331,7 +339,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* create output fb */
 	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				DRM_FORMAT_XRGB8888,
+				fourcc_in,
 				igt_fb_mod_to_tiling(0),
 				&output_fb);
 	igt_require(fb_id > 0);
@@ -370,13 +378,18 @@ static void colorop_plane_test(igt_display_t *display,
 
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
 
@@ -437,6 +450,7 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
+		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
@@ -449,8 +463,16 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -476,10 +498,15 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 	}
 
-	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-		igt_describe("Check color ops on a plane");
-		igt_subtest_f("plane-%s", tests[i].name)
-			colorop_plane_test(&display, tests[i].colorops);
+	for (j = 0; j < ARRAY_SIZE(formats); j++) {
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_describe("Check color ops on a plane");
+			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+				colorop_plane_test(&display,
+						   formats[j].fourcc_in,
+						   formats[j].fourcc_out,
+						   tests[i].colorops);
+		}
 	}
 
 	igt_fixture {
-- 
2.43.0

