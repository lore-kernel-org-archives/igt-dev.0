Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD81061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337BB10E6C9;
	Mon, 30 Mar 2026 15:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ujirRGJu";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCD810E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz8Qam4HyVz/bGRruQ+HknwmGbdZR8/ZrtCVtH6ag9MmW9i7g35SLicBHPg+rw7kib4vqI+d9XPhuMFHZWHzbSm2JflUSRNhnWBsQDcHNezIkeCxXumdXrAxh5VnUrGMrQeVcdcffHq/wfus3SL3GlCAyo7lrlxVmraMRs5qF6AtCY8+Wh++S/T5Tx1lgxARlNZ0OC7inHGgOdXEk2GXZF2wge+r2vuqeHUhdYMzZV/q3F11PyIx1Fm+n5DQ6CLp6CZWwNOCbCJ7KsSK9kzp24k/UK9TqYuVELj94dtAywSiUP9Gi1WpMMcIFexNdwA0KDz6L5VpBFH9AMKmPfScAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOlXgCQOk8I9ijxFrlKtx9TnF58srMubtl+IAfyMeo8=;
 b=UvOuNmZXNneBk+BARV5hYjuDJi7zODJyHNwHNWBNAcLWx5UIrULTvnrdezIwrUB19nWWaRrcmX6JqcQ1a48t6CQyFguTS0LO8qXNIbwh3dIELakFtyackZZXmORRfWxpLktESYKo1R0tYj69XWt9iBptfjtRr923vCWmcNVDHh4tulX8ab49gkfEQk5JlbUS2scxWB7csU0HkLWX1Y9gzwKvy1DnqsDhSeyL+f23Ue/Jnt//rLh5T5irhK3bdUpMbOcq9uwCiOGj4X5I/zkr89/05uuDgFnHVwNNi+c9AyciFYshOmctEBGwo+x+9Sc0wP2XyRfrCa87hXoxtEM76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOlXgCQOk8I9ijxFrlKtx9TnF58srMubtl+IAfyMeo8=;
 b=ujirRGJuF/hpc76cbA36skfEo1S5gapl2oiF2wO/cMT3+jNFNglIzDrpF9+MdZGmaRxJ4NejbMS4STNxRTTE1ww4xrYKat28RmZdwVxwW1Kc2CN/RUvj6wZnKn1n8Uu5mTMZDOexn4+zLBN2e3Dgu96JsYLTirbFIrLaILBnnbg=
Received: from SJ0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:a03:33e::34)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:35 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a) by SJ0PR03CA0059.outlook.office365.com
 (2603:10b6:a03:33e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:27 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:27 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 10/11] tests/kms_colorop: Add bypass transition tests
Date: Mon, 30 Mar 2026 11:35:17 -0400
Message-ID: <20260330153518.99898-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ff3552-ba30-4e33-9618-08de8e71fc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: J2983H4p2fjCl/89+SKLoF4msIZOmMbe7Rjnw5AMVm8Xo9SNv20qzG3VZndeaAFeUY+8juF5pP1giIcUFA4dR32D0IBrYxqzdYFMK9cnALecJL3aDdjpVHUmCgFO58DgdlEQ5MUNHeg97SL7upuowsco5eHr3/z9te2F7ArdocmjzIGD84Eb05gYFb84/V3Ic+7SlysoZfhTBPUb6t/pJAqkHf3jraFt+DvlDXj/XgHM4ofdjbTXgGn1PPm6McPTKz6Yf7bHT2PzDvG/ffadDlLkLkFgGThqkfn+VStVz2YO1Hi0/38H5D6L61XjPsb8NShetcLpYX6xVLluzFBvUBJRytZ52gOiWZ4HkO5Tq9bX0ejZjZ0p+2A33vO73CpLcwAfTm62M/lT3Z5sP/ujQDbA+aV7kWSe8xiiV6fIPMvb3XyP4zOxudAj+Vw8K4pe4OCwnU6wEx4dE5mrpJ04wdserLIsvlWbtAGok/izUjU3DpXSaGBrbzjmQx6ILBjKhJm5yGYlX2tLzo/5op95CI0eD6MO/sEBue5uqvrpdwymCQHSJym2c4KG/n0gLu8a25M0VmkJFIc1R/oOlfEjpz4pI9R/Yr9FqF5iXFEOkthPZOVK/BMbOpjwBcl18Tv6tO5koKnYUlBp1ZSZHq84RgWstzJ+GDDLCd5Q5nnQzFJoyGMScBm8rM3BoIdfVH/2GhxKr5oJd9IvL8mkaSviTkMiI/Gctj5sAAkmGnt+DxyM1IFCU8hZrWNooPkhrPuVibWULRcGT4Pqt440LPOUEA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uMa6Nks+x0oN9skNen5BoGmYXBtlIqarYlxU0yj/g0J9pi8i0WQLiQkdJtorCXHOWs8qvnZtV55wnDHmou3yEbJ8QsvpQItvb6pYvh8ALC3PrUs/gTy1kbQRgi+1c2CmRAvZkvD9m5cL9ms/FyDsmnk8/2zlhYPqUUJBSACojmsiyJYS4V+eU81IiPcpER/2TcvW/jXO3o4uxUUULR6ZLhjnabusp/ZAKW3H/ORzGW1re+UktofNSLhIfbVWzZ+4sjzAQcYFuP5SKjyD9vGofsuUHLJKRoyD04pRO9llj1QBAffURlquyOIDEcj8Z7gn+yBQgIIxsfDu265KJVaMq93KB4rU6xCkdAuXXS63XF9yPf11gi/UeIrEM5O9W1uteqMgAvIFcndIoKt2vtiZFAK6VCpbcqg5ch3FJHhVy+vgW5wTa0uAuKoqncyUeQcB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:34.9964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ff3552-ba30-4e33-9618-08de8e71fc73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496
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

Add tests to verify color pipeline correctly transitions to bypass state
after being configured with various colorops. This ensures no stale state
remains when switching from an active configuration back to bypass.

This also changes existing test behavior: tests no longer commit bypass
state at the end, leaving the pipeline in its configured state between
subtests.

Test approach:
- Configure pipeline with specific colorops
- Verify configured output is correct
- Transition to bypass
- Verify bypass output matches input (identity transform)

Test coverage:
  * Enumerated 1D curve (srgb_eotf)
  * Custom 1D LUT (srgb_inv_eotf_lut)
  * CTM (ctm_3x4_50_desat)
  * 3D LUT (3dlut_17_12_rgb)
  * Multi-stage (srgb_eotf + ctm_3x4_50_desat)

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 133 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 121 insertions(+), 12 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 34c3b5d1fe5b..b77fe0836195 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -86,6 +86,22 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
+ * SUBTEST: plane-bypass-XR24-XR24-srgb_eotf
+ * SUBTEST: plane-bypass-XR24-XR24-srgb_inv_eotf_lut
+ * SUBTEST: plane-bypass-XR24-XR24-ctm_3x4_50_desat
+ * SUBTEST: plane-bypass-XR24-XR24-3dlut_17_12_rgb
+ * SUBTEST: plane-bypass-XR24-XR24-srgb_eotf-ctm_3x4_50_desat
+ * SUBTEST: plane-bypass-XR30-XR30-srgb_eotf
+ * SUBTEST: plane-bypass-XR30-XR30-srgb_inv_eotf_lut
+ * SUBTEST: plane-bypass-XR30-XR30-ctm_3x4_50_desat
+ * SUBTEST: plane-bypass-XR30-XR30-3dlut_17_12_rgb
+ * SUBTEST: plane-bypass-XR30-XR30-srgb_eotf-ctm_3x4_50_desat
+ * Description: Tests color pipeline to bypass transitions on RGB formats
+ * Driver requirement: amdgpu
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
  * SUBTEST: plane-NV12-XR24-csc_bt709_limited
  * SUBTEST: plane-NV12-XR24-csc_bt709_full
  * SUBTEST: plane-NV12-XR24-csc_bt601_limited
@@ -275,7 +291,8 @@ static void colorop_plane_test(igt_display_t *display,
 			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+			       kms_colorop_t *colorops[],
+			       bool verify_bypass)
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -339,17 +356,26 @@ static void colorop_plane_test(igt_display_t *display,
 	/* compare sw transformed and KMS transformed FBs */
 	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
-	/* reset color pipeline*/
-	set_color_pipeline_bypass(plane);
+	/* Test bypass transition if requested */
+	if (verify_bypass) {
+		/* reset color pipeline*/
+		set_color_pipeline_bypass(plane);
 
-	/* Commit */
-	igt_plane_set_fb(plane, input_fb);
-	igt_output_set_writeback_fb(output, output_fb);
+		/* Commit */
+		igt_plane_set_fb(plane, input_fb);
+		igt_output_set_writeback_fb(output, output_fb);
 
-	igt_display_commit_atomic(output->display,
-				DRM_MODE_ATOMIC_ALLOW_MODESET,
-				NULL);
-	igt_get_and_wait_out_fence(output);
+		igt_display_commit_atomic(output->display,
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL);
+		igt_get_and_wait_out_fence(output);
+
+		if (data.dump_check)
+			igt_dump_fb(display, output_fb, ".", "bypass_output");
+
+		/* For RGB bypass, output should match input */
+		igt_assert(compare_with_bracket(input_fb, output_fb));
+	}
 }
 
 static void check_plane_colorop_ids(igt_display_t *display)
@@ -473,6 +499,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "csc_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
 	};
 
+	/* Bypass transition tests - test config -> bypass -> verify identity (RGB only) */
+	struct {
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		const char *name;
+	} tests_bypass_transitions_rgb[] = {
+		/* One per colorop type */
+		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
+		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
+		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
+		/* Multi-stage */
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "srgb_eotf-ctm_3x4_50_desat" },
+	};
+
 	struct {
 		__u32 fourcc_in;
 		__u32 fourcc_out;
@@ -575,7 +615,75 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							&output_fb,
 							formats_rgb[j].fourcc_in,
 							formats_rgb[j].fourcc_out,
-							tests_rgb[i].colorops);
+							tests_rgb[i].colorops,
+							false);
+			}
+
+			igt_fixture() {
+				igt_detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
+		}
+	}
+
+	/* Bypass transition tests - RGB formats */
+	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group() {
+			igt_fixture() {
+				output = kms_writeback_get_output(&display,
+								  formats_rgb[j].fourcc_in,
+								  formats_rgb[j].fourcc_out);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				/* create input fb */
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				fb_id = igt_create_color_pattern_fb(display.drm_fd,
+								mode.hdisplay, mode.vdisplay,
+								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								0.2, 0.2, 0.2, &input_fb);
+				igt_assert(fb_id >= 0);
+				igt_plane_set_fb(plane, &input_fb);
+
+				if (data.dump_check)
+					igt_dump_fb(&display, &input_fb, ".", "input");
+
+				/* create output fb */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats_rgb[j].fourcc_out,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			/* Run bypass transition tests */
+			for (i = 0; i < ARRAY_SIZE(tests_bypass_transitions_rgb); i++) {
+				igt_describe("Test color pipeline to bypass transition");
+				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name)
+					colorop_plane_test(&display,
+							output,
+							plane,
+							&input_fb,
+							&output_fb,
+							formats_rgb[j].fourcc_in,
+							formats_rgb[j].fourcc_out,
+							tests_bypass_transitions_rgb[i].colorops,
+							true);
 			}
 
 			igt_fixture() {
@@ -659,7 +767,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							&output_fb,
 							formats_yuv[j].fourcc_in,
 							formats_yuv[j].fourcc_out,
-							tests_yuv[i].colorops);
+							tests_yuv[i].colorops,
+							false);
 
 					/* Switch plane back to temp_fb to keep CRTC active */
 					igt_plane_set_fb(plane, &temp_fb);
-- 
2.53.0

