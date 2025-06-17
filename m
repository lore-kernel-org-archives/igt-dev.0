Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0553AC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6E910E4C7;
	Tue, 17 Jun 2025 04:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yJXeN+xT";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260A10E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh0Y/eU7p+HtJXPyp5nN93gs1GNnV5nqQ+jTIrRUYfw8SuVfhA1Y5ykM8A5iWRFn9YzkILziF4UOQwpOhOR9maNw9cYMs/yEQvQsxoMvkaJ/+xQFCAxvA86ecws3qt7o328hbFMsYjJLWHY6H5uY6Ywu9A2pJWwLJ9hTjuEvPtFIvqdDI7Aa7hP0APQEENHgkVrYsJ731UmcngEWuQJl74PjcCkmH53lnSaWoqd9X9cje2BjssS8Z4IM6rLqxFjY+mLarRrEbDW2QtwssWvei3NX+25fxPpPRPyAKBsnAGo5HiU1Ou8fJ4iprCn0T8I6FNLLyRoXFiCdb//AZThE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0kd5E2bMp1iBZlqXp1sTR+si9Fq+o+7nzjJ8Jy0f2Y=;
 b=IhwGdbgb3bocUBNxpzZPu5XKk1fhft1Hd+xzIt30+u/+0AS6vk+nGXlHdb5d8jOWrp9DUFM5iNeq4s0/toPhPXa6WalybCcvowGuFi+P2P2f2+sD/duGaLjHxMBotiZDTLxmvYVi5/60bGKfQNXI/SpKd8NO2IrIXxfj7u6oUkExSXjrh19Gsk8lop374UmQG0aXbjxQSJY7gyIqPGyDWWGz4zX97zxfpU5ehC500J9Wq+Cx9me2njMT9w/YBdEents57v73n2i1Lyqjdxhy65T+FTH2miz6yD4tfpFtSFYzYtzJ+HKUg9y2nvS8pwhkvW56bVmk+o2i6Tlj6M8Xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0kd5E2bMp1iBZlqXp1sTR+si9Fq+o+7nzjJ8Jy0f2Y=;
 b=yJXeN+xTek92HJuIPTEfnQbY8F6BohUdQV1iiMg5K6Lin5imfr/9NNZYBOUpo8rD28d2qq1qfSLMek9hqjEL0PXj0p4nPmpHAoxBbSALrJ/kNMRQJTOrjNsgGt9fyj3Dh6vNzEqblz0sM8y44OHvCcCZ/GZOyQh0JzC9x80gTdY=
Received: from DM6PR11CA0066.namprd11.prod.outlook.com (2603:10b6:5:14c::43)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:40:10 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::56) by DM6PR11CA0066.outlook.office365.com
 (2603:10b6:5:14c::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:40:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:40:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:40:09 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 17/36] tests/kms_colorop: Add bypass test
Date: Mon, 16 Jun 2025 22:36:12 -0600
Message-ID: <20250617043631.2920587-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: a8235d06-a4c4-4ef0-5ae2-08ddad590ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FVYIAQ+AfvIFFJxTbaNHqBFXfmmYg/kI3hypw6OSJYlvoNBRvMwiTQ+c+J+K?=
 =?us-ascii?Q?o/5zi46qp2p3QyvXb+rw47l7Inck4q9vS37UkRYQpKpQQjpo8UdLNv7rUYEn?=
 =?us-ascii?Q?Ft3krL0DLOjQhy7bWd4Zs+DmqTssqE9X5uKX2/Ca+iP0vwCd+nRjVDvsqNco?=
 =?us-ascii?Q?lDDuL2BU1icKjINr6GBCo0vtNqCGUx2fMcDbnmw1nUItdOGdfsIsiTNFtoyh?=
 =?us-ascii?Q?LK1gcgKZWUFcQoc9DTbPzx1YW5WJiy3sup5pxuKJv1aRd4KkiGsIpvICl2Jz?=
 =?us-ascii?Q?Q8OOZODal90EjyARK2H0ozOKQqKblsIzFdnq/f4L2Q5pMVElRrV9+VBntREO?=
 =?us-ascii?Q?/Jvxd3qIc13tkY3uhbOecpthFXFd2m9ZJlUQv6pleShSLFVIpGzP2co5fBZj?=
 =?us-ascii?Q?LCg2+36MCCN3et5cbOkUMK6uEsStcenaUjAKg5hKBZ2f+FBhE6c1WITK29T1?=
 =?us-ascii?Q?5U7JnSWkK30/5YDvPEPZT00Vo6XDN8PX53LLeRWPrqn0aGybx+P7i/Bvs1ua?=
 =?us-ascii?Q?XLkAkznruC4ReSoRDR5YGdDuRxVLoHiZqtmfgSMgoa1/eBSctoUgqzT2Wldo?=
 =?us-ascii?Q?OGuGHXsg+N3DMy0q6e5AWwh34g9nRfKs535pqydw/4hbDd1C3py4fCfwtUfs?=
 =?us-ascii?Q?LtNwzE8TEHwfyjN6VTRJrt9JW/i4nQTx+EwTEhfVYaAmJu/FruTnK8FX/Z9x?=
 =?us-ascii?Q?l2mwOjYoX/9pJ7wKb7T8QMfdeUr9xVNouKl/2QjVTtYNpBY+SP9NtF4THxPw?=
 =?us-ascii?Q?WlfPN2szGnyD/Q4I1tYzk70rhsPljlwn49eS/i27CI83Kf0EqnAgfOX1N4Nj?=
 =?us-ascii?Q?jvqJKsJUZNeAGEjhAyaZroD/Wz0Gl5k1M/QyZYK8dKdfeDesgmB2PZ2T2R4v?=
 =?us-ascii?Q?onnr88EKkhmfZJtR9hvD6wmrPANWh9AeP7DJ8l7wEu+JswJ8pcG9BIo37+4l?=
 =?us-ascii?Q?NzmH2IZZi6Z0gODHwSPNi2f4hipN3zUC4H6tE0pFvDGCcerrFVtsCIPMZYmk?=
 =?us-ascii?Q?k9VWyud4QYlSsbW/H5PbX4srqhMROv0nFYUQYMz5pXJ57CAPIdtLuulmMElj?=
 =?us-ascii?Q?bGUNtQYaC7nKWzSCfwfd4hdH/CsSRnVvrNMtdPTlAJWrPGgIPnauN62DwqBj?=
 =?us-ascii?Q?nTl50faBIDGRn6R2GlsR8h9Dzj/p3nQlOsEZutFcLPqQf0L3uP4RoZP/Eeni?=
 =?us-ascii?Q?EkLRHpHfVr+0Buo0J2Z5AruRso+qHUYp1lQwfL7m/7hVfooGalnjw6B8eTyT?=
 =?us-ascii?Q?Br832QgBhvo7l1tbqVXLzZAP+amvGyBdybMWbSBdPxMvUWE2UHS95OnXcEuf?=
 =?us-ascii?Q?wsEG1A0OXfySLyA82d6flLJIFrJCEkO5v2L/5UeN0pDj16iOajo5YJX/0j1k?=
 =?us-ascii?Q?0hQ4cJIVaoAKAlx/wcbYXinpqGT6eiQfI1f9qfOEW7bJb0+CaZEZ0L8Fy1jc?=
 =?us-ascii?Q?Pzb+TDkUx9fD/55UBrfuzBao2J6MdDFkJ4pcZ/uq4CH9cMpthshSUBq6Oltu?=
 =?us-ascii?Q?qYpGMxJfIG26qa06vj0N11mLNDfqnBCdMo7+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:40:10.2048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8235d06-a4c4-4ef0-5ae2-08ddad590ae1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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

