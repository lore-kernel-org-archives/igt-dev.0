Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6B1C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022810E792;
	Wed, 26 Mar 2025 23:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pxQnW3vN";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998A210E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdWCC+7BXqPHTLu+Oy3Y77yghJs5pFeCPrTbLKlPCi465wQwloYfS3acL8caa3yPjYbB6fonhvJYHyltm3zj9/Qk3Vo4yagdiFM9S9R7czrcmLodqfj/TIYFlLvrjSMwWYlfxb7Qux7I5Li/TB6nrEasxyH8kLGnoaLPSXLBn2vIYB8meot9ReB/3khTwZYLf12AUXt5AHk0HWfgB2ABMyOjnVW37yET894Zi3+3VFv/3vlgqFRkp3pFhM1BOE9dJMwVduxVSJeiHsR4+PCvBO1o8G+W4eozxPoPQm32Gtqo7yKUIm30iBDmG0GDKNfmvjgEMcIKds9/z6RXxDo/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Tklet9Ze9h+xU16E6aufHNHhnYH4W87Q2N3KJ2BlRU=;
 b=Zr87GbyLG++XDiu47chsUeL00lblAWF00tNjIGjYO84nglIbppw8OCpetDJD522KDpvJs7mUYcmqt55N1aKA5AavpjwPQK9f3vRfA9eysnZru8N3amuPiVME/tx9DfxnUIP7kCsFQxSemVmpZCzpxHd7II6XRUU3glZ+T2xg0ORhKX4c0A7a4Qqy2NGH7mwn8ftW4YIhxqVPMrn8SkWp4j1044E9R2Zc2SVMCuqHVxSGyOYDJpHc1p2+++pTI0jIG+LPRikJMfYahL/tf0i2TgBZIqSIFYBX6YXmwlDGFfvv6dzFdIH8p+XN6xQ9R11iQ2Jysg3F7j6BtI+yX2UR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Tklet9Ze9h+xU16E6aufHNHhnYH4W87Q2N3KJ2BlRU=;
 b=pxQnW3vN0rv+kgusR6wAzc9aWTxehxY1RHzqv/1Ea868U3UaQpGq9su+89Xb2jCujKYrFnVuIhNyrPH918PjGoIzK0wuFf2yvfC1JxRw28Nf/rFvtzlHCgLXuah2rU8BqbOmXxYw4KY2e6HwzuD1LHwjhWhkCKCTWHkdFBxFiTU=
Received: from BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) by SA1PR12MB8723.namprd12.prod.outlook.com
 (2603:10b6:806:385::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:42:57 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::fb) by BL0PR1501CA0029.outlook.office365.com
 (2603:10b6:207:17::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 26 Mar 2025 23:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:42:56 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:42:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 17/37] tests/kms_colorop: Parametrize the buffer format
Date: Wed, 26 Mar 2025 17:35:49 -0600
Message-ID: <20250326233609.2980110-18-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SA1PR12MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c7f364-e456-410d-6dc0-08dd6cbfef74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bZR3SGv4WV7oEd663lh20wDA3H6GUVQ685GQKkzqikUpXaVDiN6/63H39dMJ?=
 =?us-ascii?Q?Um7nRkpDX5ed5LJttdHCIxPHK7cQOJZp+TYliZKPf2FbDCQDa6tZKiUhofMb?=
 =?us-ascii?Q?fSTmjgzr0gI7wa98Qsvbtj4xnre6scCkr72vD5X6WR1DKg5cpiyMApsH9mRR?=
 =?us-ascii?Q?gcbs9SCDLN+BcDQwMkao9gAfDxMOuoVHUryQiIjd9BwUcVYLZxA/F6K2VeiH?=
 =?us-ascii?Q?QP+FGAxBsyE/VvkJbl6ltunXKCS9qR6mCy1lHsXoshGFVJ012hsbTb5YW1gE?=
 =?us-ascii?Q?yh3KD9yip/DeVuvv6bwI+wJ8hHVJeEortUU4l8kd0Q9mPO6Khsr/uRJ9zW7V?=
 =?us-ascii?Q?akx5rpPOIWRcJ8wPpA85qUpcsV6RHqeZCuWRs4sOV150uB4IJ/rgvXVGBlTV?=
 =?us-ascii?Q?Di3vdXrmjE4knXugCXJLsW3ojbdCbUmlA9Fa0cZJ4l9aK69YSEi9IqfBinU+?=
 =?us-ascii?Q?8zcBj/FjqiO9Zk6sLo5OPpuQPnzS5Jb9tQ3C92xHnK3brzrAvBKFHX/rTVk/?=
 =?us-ascii?Q?S1BtQfR3R5hu1QLJbGH+EXJLom2L0EXCkJ0ytwAwhrF/9Y2Eun8VjQQeXlqA?=
 =?us-ascii?Q?1vXcUT4/G9pmIlmV2mM4naG/m9/9Ekeg1j6Wb7t+lpkoeUUugO2+WbjUGWXL?=
 =?us-ascii?Q?jyYShJZPMBlD4k1vVD7dV7QdukFMQmvA9lUKv6WvjKI3S3LSq2EEX1C+LtR6?=
 =?us-ascii?Q?MfDANIMCWcIYOR2+E2grgDBM7h4CJK9NslekwzVk5FAvD/qiF1SFSaxBAYhv?=
 =?us-ascii?Q?/ZTW8Gjtg6xh3uOg/n1VH0cgR0IDHZnsT20S/IqyLr9r2cntFv/FImKWBlCF?=
 =?us-ascii?Q?xg8vWACncG1GOPudKCyHd/KNzGr65uHiH30mrSOnczcOihaxbKjwGfpdZL81?=
 =?us-ascii?Q?btZyUfHFE004Kmccgy5+D4/B8jfdhWgiyzFnZsLvrwwmZtY2jlZV+WSCPq6L?=
 =?us-ascii?Q?HOMz8fOz3hsTD9JcLG7ITNOXUVNDAa0178qv2kmGvAk9UOYqqB5L8ZsLdBQF?=
 =?us-ascii?Q?RGYbcPURCkneYzwcxjXHsqhbWJXXqB1R/shOW5tseUfcNRlOnqEFYkk1BBF7?=
 =?us-ascii?Q?afLgGp7FMHj8KUPwmaHAJ8L/mCaxyDBx2RGqAL5cxnSqwlGmvi9YqV4rofuR?=
 =?us-ascii?Q?sicHtgtwJxAk3wsfExKUqt3A3GIlAl9s9XGtXpkGAKIlyrM1kCX6w44ecBxo?=
 =?us-ascii?Q?VNcBkXO3N+U0v776owbrKCofR16B4wHute3lwAyfRnYvohypXfRl6S9FgCwu?=
 =?us-ascii?Q?5/fYFdM0ObmiBpuV0Kr0LN0fy5mnDqgGsDVqw/7oGw7b3nL7vvwyXe4RR/wd?=
 =?us-ascii?Q?oJQqMgr8qaIpniume7NB+uAVVwJB0/FAeCazt5sG+in8D8d4oXsb8b+LffoO?=
 =?us-ascii?Q?DafLb6w6RRbCmOUHAqxUmv1iS0SG/pBx9kWkFo7eBG+1CfG8bpX5n3xUTCLK?=
 =?us-ascii?Q?p6YYTZyalqq8x0SQy6m6kgMjrpyLdOrKvtuH/0wOQgYJueDF3i3DePZDBX3X?=
 =?us-ascii?Q?p9aQ4kMc8mFykv4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:42:56.7947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c7f364-e456-410d-6dc0-08dd6cbfef74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8723
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

We'll eventually want to run this test for 10 bpc buffers,
or even other formats. Parametrize the buffer format for
both input and writeback buffers using fourcc.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 49 +++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c65a3e73f..3a12b84d2 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -31,7 +31,7 @@
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
- * SUBTEST: plane-%s
+ * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -40,6 +40,10 @@
  *
  * arg[1]:
  *
+ * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ *
+ * arg[2]:
+ *
  * @bypass:			Bypass Color Pipeline
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
@@ -56,11 +60,12 @@
 
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
 
@@ -70,7 +75,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
@@ -103,7 +108,7 @@ typedef struct {
 static data_t data;
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
 	enum pipe pipe;
@@ -139,7 +144,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
-			if (check_writeback_config(display, output, override_mode)) {
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -366,6 +371,8 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       __u32 fourcc_in,
+			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
@@ -378,7 +385,7 @@ static void colorop_plane_test(igt_display_t *display,
 	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
 
-	output = kms_writeback_get_output(display);
+	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
 	igt_require(output);
 
 	if (output->use_override_mode)
@@ -392,7 +399,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	fb_id = igt_create_color_pattern_fb(display->drm_fd,
 					mode.hdisplay, mode.vdisplay,
-					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					fourcc_in, DRM_FORMAT_MOD_LINEAR,
 					0.2, 0.2, 0.2, &input_fb);
 	igt_assert(fb_id >= 0);
 	igt_plane_set_fb(plane, &input_fb);
@@ -402,7 +409,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* create output fb */
 	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				DRM_FORMAT_XRGB8888,
+				fourcc_in,
 				igt_fb_mod_to_tiling(0),
 				&output_fb);
 	igt_require(fb_id > 0);
@@ -506,8 +513,16 @@ igt_main
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
@@ -529,12 +544,16 @@ igt_main
 
 	}
 
-	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
-		igt_describe("Bla bla bla");
-		igt_subtest_f("plane-%s", tests[i].name)
-			colorop_plane_test(&display, tests[i].colorops);
+	for (j = 0; j < sizeof(formats) / sizeof (formats[0]); j++) {
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

