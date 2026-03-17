Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A035FED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D514410E709;
	Tue, 17 Mar 2026 16:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eJ5W9wRG";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3C10E6EB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDUjzaVMBzmB39TANx52ba9Ax1x6z4y2pIa8tvAHi3JGoSGH4BAlfowu1Iel5cX4IDhlp0AHePjRiPxweotcbN9ljlO8V1uLaAWJnKarrTA9abBmFLHWMi1a5C9s5mRJmqzu8AXHQjKfZ6KYuzLD/srn4IHtwp9xRPfH9U46UurAmOALVSTgIrrenbSXRE5WlNeJigZqOW+zlU7OiLpQKYsbqKsrM93wznQK68cUoBT7r9zxHdK42uDTH4MrxVnlgtZIQJ5PvVdWzEyqYv+Q+n5qPpxrQQInnCpv+deD0jv6rxCdlNkJWaxcUJeBJ0gtGJk3fKCVTnyUlmX0e+mD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNDbILXGlFb+23EBy8Ui7UHLEQ4qh29Tb9BJi7bJrkI=;
 b=UmEQBc7NlgxU5+w0qKXtjz+LRLi2dNGWoGdYPY0zbwx6JALAEGaKzvcM7BtOQ+zbbl/Nru2Pakn9qBYsvGQMpBbc0Db9te2gxR/GdCT1dRXhB/O94mMtOs1h1j+Cf7mvGphOoPZv0sV0PvWBFbOXmqnGQyx6qz8W6Od4OpUawz2jaiWpYLBiU373KdFLBHS8XX2+RRp9WgFs5ydFg397YTOQ8hZszXEjeRexkF3iOk//D/RlPTqHJPyKmdPBemv5O2I192LQgthzYj/9+xEEs3nP4Oyeau0p4F8hApakgufW1mdPeWoqsZZulTb0fM7PXwpSfu/bxeDhnZ14eqeCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNDbILXGlFb+23EBy8Ui7UHLEQ4qh29Tb9BJi7bJrkI=;
 b=eJ5W9wRGF3P4Vd20dhgH4f6FqhuHSrPgjA8kaRfqrsdypzk5QfcW+6g0iASBJfrQOyUdz2a0AtbLL3tvEMGwdhQHBdScTDaHXF2upIk8/FGr+z6nK0W0DAo1iwMkoeaw/6KVCL4EQyaf75+WOoqHCboux7GsoiwkP7UBchyjj0k=
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 16:05:13 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::6a) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 16:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:05:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:51 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 09/10] tests/kms_colorop: Add bypass transition tests
Date: Tue, 17 Mar 2026 12:04:35 -0400
Message-ID: <20260317160443.229812-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a9cf53-4ef0-4fa9-9c76-08de843ef8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: GjHmLbf32aznZuvtfGQ0y6TbCh+tkTom5GFXHZnscjSJgVOr69jo4K9i30LCE2RRMvwSoPAW6bZR4EP9BJCpiXSV+MyXMOF8n8WiLz/QaK0FPRVHFJVq6o4dRufEUHWuD8ZSjT4mGFHSgaIdOd23i0zX0XhAfrdzr0jt6hh311TYYElf8tgG+LuDYCvilKOKpmSoePWtLw6L+Ns8dS5LQd23g4//RgudbVj/NCVLpGgodrGUfpd1ld73ZA0oJXcmLAjDbv7LX6T3ptgRDEgVA2l8BBV0luwm0/bzZ3GI69+u4pgMDsctRfFw0Wqdzd+7gU2T6NfBEn+AVm5E2QCQ9nU8NrJcyvfsg/Hh0hsiyy0Dj2GrHQx0OhIq69nQJ6OSrz1OrOf/3MBlBCD4VQsmQcxmOFjpRy4FLvD54noNgU1GkiM6hmqsivuxikxz1g3aD0hgBhF3nCqK1bFKAW8imZwwmFExZ5K/5yxOXL0EmCCwps8tEpgVYPNUGL4moj95B5/X43LYDlh8jBZFx3wPLFEjKM/Sx0sBUyQa79o8QRLTs/5G4FT10q7JDX0tDR7bLLZVJQifHwbbR7iqnEDcHPrgHNM3itdQ+0MHIM/njdm+Vg9yGod1hI9UxWYRyut0TgZxXzUT7V1Ad2iPwHQ12+X5WL3QfJnb6WbrluBwRB2AnJj4v7Xs2rQ+5TZDkGfzc16B/AfBQeT9hb1bFPNwXzoWFnjk6qSSGnJlMZRJ5FqeVRW6oTklISqgk5m+d30S6AzLn7kxLKq1KtaBIBnj2w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HbvKdrWOQTwzEW4SX6I5hB53Xhl1GNw0DeW5jiBViQXsgsYGuiOd/cxnUA7/FxZG1LgskxKo1c2K2Hw+VKj+EbP31ZGDHjdnEuko9md+TL0aRHJ/vIuS8c1o14JpdvNcmkAhu0R35XE1u2E1S90shJBdZ9clqui009ccc36QDuBDhN14B04KDPTWHNT3C2wF1KGEZGOdVdlLaoTxPGBdzLCyiUWVQ0rzztJ7B8ae4XRSLlQDVOUZyMAfw5kQrMsUZPui3Y1XSGV9M1T9Qa2hcM38abL6d91g9/0Zt1vF0FL74iXJrYGnY9s6catNox6uW0EydQrqA/o0VO096fccguQZaGbhncYgbg7RHcOolMQeaArtPBnw2kIZjoCTVGY1sWhe7yS1kaCRTlrkwCQiPXhd2WI6sUgdKC5HpnqTs1htEwiIOZuzo4yDOPF2HWUt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:05:13.2624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a9cf53-4ef0-4fa9-9c76-08de843ef8fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 133 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 121 insertions(+), 12 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 3c39f917dfd3..d697f2e19868 100644
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
@@ -270,7 +286,8 @@ static void colorop_plane_test(igt_display_t *display,
 			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+			       kms_colorop_t *colorops[],
+			       bool verify_bypass)
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -334,17 +351,26 @@ static void colorop_plane_test(igt_display_t *display,
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
@@ -468,6 +494,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_csc_bt709_limited, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "csc_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
 	};
 
+	/* Bypass transition tests - test config → bypass → verify identity (RGB only) */
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
@@ -570,7 +610,75 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -653,7 +761,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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

