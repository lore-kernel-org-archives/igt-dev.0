Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1723CCEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3310EBFB;
	Sat, 15 Nov 2025 00:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WEKFE8xM";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFCE10EBFB
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrayzY3LpWx3viYOVMNQHeCdyHvpkKl9BkNHIGzT6NlNgW4nLvsbye7gPjSFUG4zQ+5AoiWmWndW0B0Uz/qizSPgGB6A1lRa/R6ea8+Bg06BvJ8+lc25iIKOw7/5YcOk+5R9EAoSQxbLnSxYab/TGpNEX4SNSBmiWVLuFO+KMK4kHlhUfmBieMZG/c1uFFkCm8vE1yuSnxxUuuPuk9PpiJHPaCSr7DFSDExh2uZYNj1md2fjQrTNwQJaMecUopPbzhT0lzy0mnN0/Szb2p/Rm69R4FYz9/KqESzIP2Dp1BD9ZiWhQp3QYdms7PPUV1tLa9h1NQzNZHaMUFL/2/0fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBvPfUeYruwNfwzedIvS1ryV31Ha9G6lJyB8Prnu36s=;
 b=KPd9Tl78jNgF074uwPJT0/rHmwcQiwRwf1SgPs7OQDSWb/0pZ/SrhIenyisL7tXJgYhPecCFWvQ2pk5iu0h8PlnRUPyyi7HiHoQLnHLunpPEcmP7GwSaHN1AFu/7mPG7cVLH2umI8mVc1ijsonAs6VjfqA73IUvBkYevTspQ30hFXtyt1GfcQ+/cw+baKiqnYSjVl32zao+5Kd8Q77Pg3ukHkr5g7+GdfaJ9ec7fh4ox+ZENAlEig8h3W6fnTWKjJmvq7XSPNWrl+CMBDRNrpNXjryEKSWUjeb526lUh0aOrbZgn274tyVMYIfqDiBHws72/Mmvdi+1YzzhSQVxtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBvPfUeYruwNfwzedIvS1ryV31Ha9G6lJyB8Prnu36s=;
 b=WEKFE8xMmYGEtIGK4ceGeb4/x+2c8d+ELeP3VYJpJFa/ESYQniiwBgZLWi8pKnjlXlRNw5y+bze+6aENeM3mqy1IF3vsxChAN8qrFyrkfOT4vwLAIg8HvsLeu2ldzO0BeGt6busrERNiJfsBV1CyEH1YIuwrRo5iSgGtyVI3r8I=
Received: from BLAPR03CA0104.namprd03.prod.outlook.com (2603:10b6:208:32a::19)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:21:53 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::91) by BLAPR03CA0104.outlook.office365.com
 (2603:10b6:208:32a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:21:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:21:52 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 15/32] tests/kms_colorop: Add bypass test
Date: Fri, 14 Nov 2025 17:18:24 -0700
Message-ID: <20251115001841.3563993-16-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 148c74e8-4709-469c-adf5-08de23dcfa48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LHJr1ISP4/ehSyrSyKtD4hIK+jTwhaYCPEFBzinjtj/Mi+t6P2PWNroCaBWK?=
 =?us-ascii?Q?eFYjJv9TKtiu/kZKn384DM6ri7dws2eEJn68VNbdKJF4d1Fy3sWG9wu47vmc?=
 =?us-ascii?Q?IuNwB2gtifdeMwwOpnf+vmL1IHVL3KtZ+JUq7Z1Fnj+M3S0DcT0SbP6CrRfP?=
 =?us-ascii?Q?vQPTbUut9SzHDpFAzZiW05OdJzoT9QIOdr/r+reVmw6CveOboAO+YfNCFfCH?=
 =?us-ascii?Q?t2NxhQZO15cLFrMSNz1au0UVVEGo/xETT+clBoNMlNjF7ncAOYs9+oR5o/F/?=
 =?us-ascii?Q?h8sy53Usrv3OaBPOAGOUGTExJsDhEkAeUn/SaNLHPnyzxOQSBWxijcUNkt3F?=
 =?us-ascii?Q?amcjLAlxrGKcPTde/LZYoPmU6fpkS5Cxt1LY4N71/zdMKwfkla4v16HcmJ3y?=
 =?us-ascii?Q?gzp7fqhVyviyNOBIg8GkcSexbKWCF2b0HFc3XAde7XaZUA/aNBd5L9sWpONK?=
 =?us-ascii?Q?r6G6KHCRYbdObio3gjB5YaI0pYwYGNR9ZJ/JDUrGXpSHjxS4fupB/AcXEW7F?=
 =?us-ascii?Q?BJcerHJe66NrmXKeIyyfD8qJyDj8dMnQ3RGfGz3aQt8EZTM88wJj7nqPlTVD?=
 =?us-ascii?Q?sz0ntdgLcF/F2pSvKZ9sA/IkC1JClcgnMBfDfOVQXIA0eGgIQGoAIdDSTHwX?=
 =?us-ascii?Q?l3VQ0T8d6XJaDAfTYf5UCAsK6c/cBcfN6cO0aTURfPocZS2h84Uu9Ag/ZzrE?=
 =?us-ascii?Q?ZIg4wDhDm1p4vXhYKOLgi7TRYiIoBV2lt0tTvQNq62Qwi4rlTZS9EpXYD9bI?=
 =?us-ascii?Q?Y1NToC0SLwOgKOfRBrlSX1sTEOOKhKGxrn/bHlKmF8HeGE+ZT/wvnRxjjEU0?=
 =?us-ascii?Q?Q0udiOryboYYC+02P1/JGrG1W0geI5rHXwtonFQCVSCTYJgRw/kfrfNgoJcU?=
 =?us-ascii?Q?llG7bEcB2zgpel8RBnbGhe6hkV+9tRuvU/07wlW1xn7b5JwjHOM2cP+SUJZN?=
 =?us-ascii?Q?zaDRTV1pIxN32boLBCydPfkT5g4D11q6pcBGeC76feeS6u6eYEPZ4UTDyF6N?=
 =?us-ascii?Q?zm26M775lmyuY/PRqr6FZHLsT7mJPknSKMtuBvIFHVcfRpXKM+dVnl/lpkag?=
 =?us-ascii?Q?SrOt3k464iWV8ikmoNIWcY948tzfbMMm+p4obMfcG/6PTiGde4G8qh4OVciC?=
 =?us-ascii?Q?P4FJUFHEJh4aOBIp6nLZFHpJ223NvA7C+eDu43+D9TdKUFXBP6SRpAH734OY?=
 =?us-ascii?Q?DJaCR6BjNeLXnVHjoQ5difriCMWfJyFYYGXXJFlwcdSvTgcyId1DYrUwogzl?=
 =?us-ascii?Q?3o/kL+OIBQFjvCszUyajV1puOtigIRdWGszjpSwmVDbdjmzL+k2hLs5cW9cC?=
 =?us-ascii?Q?FwHwwJdDazRnd/Lj8Cfo8wauYHZgun+Nm5As6QqvJHst2ZRscGEkX/WiPz/F?=
 =?us-ascii?Q?5N9D0zo2v72fmgICkw9Spo9HJfkF8n6JzSW9W8pvMbcXE2q9lAQqhdF3R1jk?=
 =?us-ascii?Q?B6CaaWWBrDh0LA8ZNETpeZ249GoE71RJcVfaU6i2kEBTjic1MM0iQFzw1v9B?=
 =?us-ascii?Q?2RsxafPTqFS52k8X6xb0O7rLOgrigxnqvBXcYTwi/AXfYgIz1qpLdFkim/0C?=
 =?us-ascii?Q?8gkVVL2wDGWzWbnWgsc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:21:53.1592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 148c74e8-4709-469c-adf5-08de23dcfa48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

