Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9581CCA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F10C10E9BC;
	Fri, 15 Aug 2025 04:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OLpemBu4";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBE610E9BC
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaR5th4tFgPHC/Kh4QBGJ32Vu+jDKVkJOeHPPQ6I4pL8dJxDeeWpKuFlFKPugo0StVE8jYlK7zdGAvkg13qyomQk3O58ORKyagcLcsMJ2MGMAANXmN9t/kU+lhvQk1Il0brFeVN0KQtkVYmzYfLni2S+TCzq/RKoGFMlWqspcoeH3J6YMjofLpHLzs45rm5P+WaWamiKYRULAjv9nyajRv9npfZIP2ukaUE8dcU4K7kK/w9sq9DKsJhqpPsPYEPP4rUCAOGogGxs8vwOOjvQPZt+e6dwi2iggKcxm1SBprunmOUz6nOXHgyfcAU6AemniJRupVZpMP5HJavWPPN8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avyQg355eBwgQHKpCtWfakN16MXLMkLHy6erjCY3ttQ=;
 b=y2Ohnj7Z7e3gFhihxbPPF87ZxIxy/z77F3gAaiLv6muo4ktiT7nPwAv7qpufZvh4QvLacf9Vcm+kC52XQe75ZWr/Za1ff9Rfh4AuZsVEOfyRU4XKQl+sblz4oKTjPOQZZut23TBSchck8qKbrzeItkQLQj6DV99f2x3LeygY5BH5XynS/U6MqppjThpxWRHhNwfc6u6xjZPvtqKqev5wQFdM9xpFXz3V0Xb6IuyxprCsBB4qVpi53B9P5B+szNP4MtfR9H/NqeGaJ8wdhy8ENMy6esqxYcojq6YdeP9yuv6M4O4XGq6ug24SKTwsBNTbDBgwO8ZhwDAuP2usa05L0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avyQg355eBwgQHKpCtWfakN16MXLMkLHy6erjCY3ttQ=;
 b=OLpemBu4HF5t6IdPW1K6T5upSAILzQXurHdkrRHRhLw3NUNZ8Wzc6taHUktGpeCGAl74+Tzug6T7ip7aWze4limgqSKZoj73EOt1iHaATm0q+oeC+AWb5VA6xjUIWk9CyWsXeDS9qutH4Zzd9XeNESlBfREJ9SoAPmeQc9NA+/o=
Received: from SJ0PR05CA0191.namprd05.prod.outlook.com (2603:10b6:a03:330::16)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:09:53 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::b7) by SJ0PR05CA0191.outlook.office365.com
 (2603:10b6:a03:330::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Fri,
 15 Aug 2025 04:09:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:09:52 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:09:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 13/30] tests/kms_colorop: Add bypass test
Date: Thu, 14 Aug 2025 22:06:42 -0600
Message-ID: <20250815040659.3321102-14-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA1PR12MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b23770-94d4-4e5b-f345-08dddbb195c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jodXBQ57Jsabopfq3WAIjJEtMdB5KQlLwpEIPSoXoLyNLszuKDzP2yi/ZCWE?=
 =?us-ascii?Q?zPm0hmCLkTA4V6YuhYNdwVGfk/SbJv989RE0XcJ7V1+W4EDBs1HlVNLYogen?=
 =?us-ascii?Q?SzN7p/pjO/JJ6Ho6DIYsXUjwXJcAPn7ZU8Yy2qB/lq96k34vwYaMeSBMnKFs?=
 =?us-ascii?Q?8k/nXQQOP9TPyzGG87JMXAssXo2DGVYPhgVz4pxwNWJd7VN2xVZHAB5LlOJo?=
 =?us-ascii?Q?qJDAmYUSgCwO8bg1vm9G/BHR77kOKugbcBXLIflhGfl3oipRkBmNwY1+wl+b?=
 =?us-ascii?Q?Fm4WGn6TZSDozkTAWaoRHMvVyV+pj6gWM2pCmQaAcXSS53XkhdEE+HB9+mi8?=
 =?us-ascii?Q?ProQFviq4ClW0pK4xzJynlRw/tAgqzKNEeYH8jBGJjp+f3BcpTrEvhFo2ip7?=
 =?us-ascii?Q?Hm5km5LQqvQidO7dz9eYCW5ScbGMqOwMnjQD9Zn1NFPhAzoAUNQ3oJfyrkxt?=
 =?us-ascii?Q?B2RmuSuT1Z/hrZycCX0djcG7xknCf2Yfu/ApE6+oLe953hbcc+cH/2mBGt7+?=
 =?us-ascii?Q?MhMIuoiKBnCXMA7YJXtczjHvH5Xxu6vXym4jB36920X0bZXN6vZrBNO0K1G9?=
 =?us-ascii?Q?zo1H7Z/Pxv3Lba5JIlyFXSXlZnwQx+a3VfZwp0FoDylmg2DUkzzouY8dkqGp?=
 =?us-ascii?Q?lzw9GbVPx0sRWKwn8JRIL/KKq57E7un1oQK7aDSjz20rwIOGfE/cRlmHCC4M?=
 =?us-ascii?Q?iqrK6yI//qo65dmKFlMmvKTVscYclSEXe6PMQI/lfHBVLReonNK+KPx0ofjF?=
 =?us-ascii?Q?7GrYmxfNG4wpHNvZXTdLvqYaSpRryc4twyBX6GgNLBOVLAYitn+Gtc/wCgP8?=
 =?us-ascii?Q?7+5cP6KokgC1JFX353DpUgj2YZhFV6t4579boMiiuu4KI0Yv4dBQ2IFQkw6/?=
 =?us-ascii?Q?pXmdmP2uV1T3mEyyElc8JAFBNhkJgGYTk87LNhOajv1MTAukaxJ2ODAWwq2Z?=
 =?us-ascii?Q?eEfTHRdGy09xagxM1kLncRNVlxq4tFGw0KwOSJrbTYliMNG+z7PJ++EjWj3M?=
 =?us-ascii?Q?hUb/N1JOTUHtwpcdG1doL4QWO7yEYBLlTROBPPaGy4GXYxAXUJJZMiDviuEF?=
 =?us-ascii?Q?fLXVHNR8BTwBUBXNPEnQxy9PTO63KhcdRo9BNmxhEnoABg2Mz0733SKtFked?=
 =?us-ascii?Q?8gfi99hrZbmwiHjJBb/he/wZuCn6AngugY5yc7b/GPsXtCatI6uL9SsNaV7P?=
 =?us-ascii?Q?UsIx5BLuagBP1buAMR9pbcWEPk7FeqJIj4YlU2+BIuPTuCtktMV+VUu+NYvP?=
 =?us-ascii?Q?Axf0tz+Fo+nT6gFpaCz5WVy6PuN6HMghHbeV0j83WjdL9wBIrPJ3Y3Y5Y96A?=
 =?us-ascii?Q?Yuo10a2FfpZgvrt5H5DXg2RQT/32osGToYkwb9R8O+F+hDj9PNK//L4Ye/5m?=
 =?us-ascii?Q?6QRBonquAX1jBnm9ZM1UaAPwqmv6J6lbHkxL4Q0PIBXe/U6ePGiakqssi3O6?=
 =?us-ascii?Q?hVwshEAF95L1rfutRJnYCj5xRPHyVCMCtmVsKh2Yh14NsUlAEZCX8YTCZMJ5?=
 =?us-ascii?Q?S59FUCTBa4+28M9iH7LPjYkLmKIAdvLitcnZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:09:52.3482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b23770-94d4-4e5b-f345-08dddbb195c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018
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
 tests/kms_colorop.c | 66 +++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8c595751e..fe9854ed9 100644
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
@@ -40,6 +40,11 @@
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
@@ -55,11 +60,12 @@
 
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
 
@@ -69,7 +75,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	ret = igt_create_fb(display->drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
@@ -102,7 +108,7 @@ typedef struct {
 static data_t data;
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
 	int i;
 	enum pipe pipe;
@@ -138,7 +144,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
-			if (check_writeback_config(display, output, override_mode)) {
+			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, pipe);
@@ -355,6 +361,8 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       __u32 fourcc_in,
+			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
@@ -367,7 +375,7 @@ static void colorop_plane_test(igt_display_t *display,
 	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
 
-	output = kms_writeback_get_output(display);
+	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
 	igt_require(output);
 
 	if (output->use_override_mode)
@@ -381,7 +389,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	fb_id = igt_create_color_pattern_fb(display->drm_fd,
 					mode.hdisplay, mode.vdisplay,
-					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					fourcc_in, DRM_FORMAT_MOD_LINEAR,
 					0.2, 0.2, 0.2, &input_fb);
 	igt_assert(fb_id >= 0);
 	igt_plane_set_fb(plane, &input_fb);
@@ -391,7 +399,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* create output fb */
 	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				DRM_FORMAT_XRGB8888,
+				fourcc_in,
 				igt_fb_mod_to_tiling(0),
 				&output_fb);
 	igt_require(fb_id > 0);
@@ -429,13 +437,18 @@ static void colorop_plane_test(igt_display_t *display,
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
 
@@ -476,6 +489,7 @@ igt_main
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
+		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
@@ -488,8 +502,16 @@ igt_main
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
@@ -511,12 +533,16 @@ igt_main
 
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
-
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
 	igt_fixture {
 		igt_display_fini(&display);
-- 
2.43.0

