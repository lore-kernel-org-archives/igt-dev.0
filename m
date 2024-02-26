Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5EDC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5B210F29D;
	Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TFs9cYAz";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512EC10F290
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfbJDuR04+S1Lpe/G3m7/w1xw0/AjqwkJ0SL8RfLHkgovZ7J4FNng0Z5HEpUyhU9Zlc0yE4krGorQAmn4x2jtK61OMTt5V6OVjN4EIat/lLxhj1gxUZ8JXFNboMiwNDeEuFQwUzGJMhZIc5TgxCVYdtZm0GKyPE0zFoOS38YpucSIgXCvcJJ7XYuYX3tcJ32xxFUy/HPhnDewaEN8uVwSjeek7ikXu2c2MfLMp/C+NOefGMDdFtLJumJ1za+NsYSuZuN7fvL1Iu/N4uewtpWS3hUhDFruvVpntWEApUHIGk0tS0NggQub7YEMMX3eSp40f94bW5u+owxnnbe9CqgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofUUmBxv3t5uAZMr7UGC49CZrk8ywqYmcWB2gYznGhw=;
 b=F7LHi8dxPRzZR/poHNUI/NI95zE7EPY8qusCVapqDWeb5H3IOGba7DnHy7hn/2F5Gl1nTPMRG1cvI6w4HimkCMd+/Nx5TZEKkYvOZ30NNDwYB+leG7qzUxtv/tCHS7wf+AXmdaTBTNUz3ZzI6EoEBwk8F1i9hRi1lwSbgjTnjvQNr8ZEFTuSBIYb/giihPd01QyJao61dp09qyJ6+qVOTH//FFHA/jeu2gSDN2TUixtV7I363fJglkRV6tnhEXZncou/HuZqcdgxI8N/l0BOrdRmb/sW9FdlrDc3fbfrlhmRhWk00w/0L0Db/aCc5fEmsfq9omRkXyx89hauGpY/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofUUmBxv3t5uAZMr7UGC49CZrk8ywqYmcWB2gYznGhw=;
 b=TFs9cYAzy9kQOt78OmlbQBbc+HXzdxr13P1hGcEZzMzUWNyuPLD8N3hUWbJYU3RTn2+tevGpzFYKQtA3qyLjODCXiMec5V9wH0X1X57i5hlkBhWmte6saFa4t/j0nftURKr+srvyRKNfLDWm12h/XB0OqFSEl60n4Om2mFIffow=
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by CO6PR12MB5490.namprd12.prod.outlook.com (2603:10b6:303:13d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:39 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a4) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:37 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:37 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 17/32] tests/kms_colorop: Parametrize the buffer format
Date: Mon, 26 Feb 2024 16:14:01 -0500
Message-ID: <20240226211416.100660-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CO6PR12MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: dcef83af-4db2-4e6e-1622-08dc370ff102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+fhU1693tmqp6DMqeKoOQXmIQ6zR6ww64ebBBYVAX3U4a5kPfNZ7ZdeBnUEOpRYpT28cuFmgmat2C3acfHa0EBRv5JKh+8xQERV08hPR8xEB7UbKI8woycmsuhc/hg+kWYvAS+WWxduBv6QBtZkG07Fwr7T+2Hwuy/fiCNIigDibJxm6/AQnGHfAkuSZtKVi+WyYO2d4mVfINd117mCGZQ+juizrBbt6ghFogarRgghgNnxqu2zvw2hQuj8pxWbpIMMhmXZotR3RrTUb8G1bCzLSYx08dVc7yhPtHxpherqetA7Xz0E2wRrAMiZXh1pAeBuLfm7SgVpdaljWnzQFgxQVIjY4XW17/Rqq9PGLGYzvjs+GOK/8IYJ4tLH5T8XLT63W0ei3y59uHPjOVf621OjQRYe3BvOES6rET4qrtqzp3kaAdXh3UfaZJ86x3mU6azdskAuODEmf6LkOSRptwZJXIXuD/xja9cfDjKi2V4V9iU2L7vgr1/pVyXmaocIUQIn/6SrBtCtNa+s5lJASzqU5lcpEN03bE396JcXFo/Lp0Ob+aMNm34OJX9PgswJoTLWoj1nsMyl+qRRGaTnEWPKSOD4Jqh1FMMxBG8UnoZ++x/i+/rOR2gwiMPXB2ZKi97My8NvBH/99vCinvAeSHaDIez7dUuQbAlhisKoHLPxbxlS5D3/0LrzNMxy9nOz6ZV0ZVfaP5/udjG3Ghw6peise3gulea618ngT9NqC9tYDiDVMQ1nAL0TLS90S/id
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:38.6469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcef83af-4db2-4e6e-1622-08dc370ff102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5490
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

We'll eventually want to run this test for 10 bpc buffers,
or even other formats. Parametrize the buffer format for
both input and writeback buffers using fourcc.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 49 +++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 5b7f81c83af5..0013d311d878 100644
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
-	int i;
+	int i, j;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -521,12 +536,16 @@ igt_main
 
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
2.44.0

