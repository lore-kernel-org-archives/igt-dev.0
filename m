Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7CCDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9F389A77;
	Tue, 23 Jun 2026 18:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S9rwfDDT";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013054.outbound.protection.outlook.com
 [40.107.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D810EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVPI9P3UNs4/UtyMVu4QHsKcwHL87VCorTiuMMAnGIILpCNuE0W9cgyrQrMctI/jgWA4DQ7NjKPq1GhBjkfZ0LYsIVvDuAmKoO6jAkNWdGS4e8loeS8Al5aNU7Mvrv1HsRh3jGzjmOap1ZSLww33jOSFADgGb+plSoQz0SDZqaFxoT/eJ5FEAhxqHKb4Hm1MuO4t1Ix1vvKFoWNTWS+B6e3nqtIofaLsi5Skfa8n2BMGRLnK26WnfiRNbIPjSQOkHa5z9LDGacf28zvwlbrh96p2U7dBD5WvyiJsLiP1M8cc8OMYH+zDuiPkwMNLvGTJaH5ropkFxR8k8YZiigu3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYDps7rtC0TZjn9NkoRoY7s9Wfq6lWYKybjIhm6tIjY=;
 b=ainTZQLzwySOj1TU0OtoyFziPcx6U359waVKOuu/pUky9QeODV9Jt4AD8hVxquKZb19720uMynrsQeaA2MbhJr+4B3+MztreKBzlvblr+FbDcrH/6YkKwxYWdrRG21xJEz744u3WzTbwgRntyzwt/ieBUFLoOawlcYJAMi3VHF8jxnfCm46+BpYEJMTOvNf4LwnyM7SzKYWDN4lRPOcqZoxkCZTbEKCM0G/37R1WJP0//bJb/aLL/28Cx316hTp4DTHV5B+Px05iBhVLuUNGC9+kXOywH0/fKojQ6LhEGFXW13ss8qVkXHc2GqE7wePDSNTdyMlxZL//pKFF7BPnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYDps7rtC0TZjn9NkoRoY7s9Wfq6lWYKybjIhm6tIjY=;
 b=S9rwfDDTEzaT9+mVMulvmyuUr3qXLkgqGXO4yUWLvVpDtvuM0wjI8UUkV4fKXoj8Szej0vE0ULRkwjw/4TER330Q3JCFeDdauzJupFyvls+44+hQxja89uHEKJ9TbND/xkwPuINPR+xUho2rXbsYPIvKbyzkWcFhDZG9lsGinak=
Received: from BN9PR03CA0604.namprd03.prod.outlook.com (2603:10b6:408:106::9)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 17:57:53 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::ae) by BN9PR03CA0604.outlook.office365.com
 (2603:10b6:408:106::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 10:57:51 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 11/12] tests/kms_colorop: Add bypass transition tests
Date: Tue, 23 Jun 2026 13:57:36 -0400
Message-ID: <20260623175737.171142-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|SJ0PR12MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1ea015-f899-45fd-d7dc-08ded150f29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|6133799003|11063799006|56012099006|5023799004|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 8rD3840AU9L8DI4N4fCot9ZfuDxhrCZndan7BI1ZJxoyNM1epxE0Rc5oVcRbv0Eko+35ekb8/jeWBg7Ok9PJo38mRrMY+vNYPzLNlvfpu8wg4nHSCobLHNRdxrLHgjcDEGHxrVkGHYsGM0L8Wrqn5oXw9Rav2buAhmi0xtIOOaxTUPurYJeFDoYB4HyYdjQ0SvfLT4DIM/37fXKlGo4/SmbHtFeUgRtkb+jJ2FU338tMDOialhlwquIFyHtQxgaStssMBnE6eXH2fGHyMGfxoMFQdydU2i7tRbr2RbEzAHA1UkKbAPFpcEdWxmxDkY16tadwJ9eZyRjy6tgnv3ZHW92GDy6IoZDJBoBaJrOAGTxCwMgO+cLoVqNsZa0KsrkzR60rNVE8mNe05SZWbADXCQHeGVR0GDLKLRMhARWBH+p8b/dR+3fky4nB1vkPSQvi3ZnBeZJ/mcB28+27ogqLf1xHNt4ZJQ5gvmTZX0JawhH5YWvpBDksXAdx560RvEoOptW34be6/3oYhmICInvadqunKyVJwHM2wjWP5WPMULUmnebsVu3aGKe7FOBy5HVmSatb4LbYZcUcix8I2a25Q/0lNiWl1i009nhq/wFhOeA5fHD67FGAHdTjMHATiX5iVFTQDTyCKMPV6NDVL0L1kom6sjkoCjoO6B5CzupVYRqzVudok1ksFgBmQkVBaA3s6ymSuaiuv3vfljK6KtSA9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(6133799003)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5djBf568NQRjxp9G1bAR5kHJYRPAEblhkAVnPmbqPB28XllP27MNY/jaiyC0A201BQaURWM8dsw733T/M9BXkmVRits3lG/EanTltPwtEOUsbB//VoM+bNi81o5Y52HpmHhJg5j8QHFnBQemDH8sC4xh5uEe8k8AswBTrD6APgUAoO6lmuOopkX7na/NZ711+jKDgCtjsU3+Iox4Q8y9aDpwzysK2TF8KtQ/Z59ZW2Q+lrjC9+tpVwN3CPM9xAs8b7hljNWddVZbcjbOMEHzLh/sZhQX71Z1tM2vxCVZxljicb8dwrTJc0xffGcHbEsp0lK7x9YdMhZ0hTAb0/eo9IsFQFETEeIWkjQOrlnLfHuRn2Ok19qTLHhS2uzQUNvT62p9wYCG1T5wPI3ZYo2o5JUyY8q2r0088QrtTEZ2uSV88UsrEaBhiq/TWT+IJb1o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:53.0620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1ea015-f899-45fd-d7dc-08ded150f29a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903
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
 tests/kms_colorop.c | 127 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 12 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4e8b2563ea4e..a2784243c0f5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -80,6 +80,16 @@
  * SUBTEST: plane-XR30-XR30-multiply_125
  * SUBTEST: plane-XR30-XR30-multiply_inv_125
  * SUBTEST: plane-XR30-XR30-3dlut_17_12_rgb
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
  * Description: Tests DRM colorop properties on RGB formats
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -273,7 +283,8 @@ static void colorop_plane_test(igt_display_t *display,
 			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+			       kms_colorop_t *colorops[],
+			       bool verify_bypass)
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -337,17 +348,26 @@ static void colorop_plane_test(igt_display_t *display,
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
@@ -471,6 +491,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
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
@@ -569,7 +603,75 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -653,7 +755,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							&output_fb,
 							formats_yuv[j].fourcc_in,
 							formats_yuv[j].fourcc_out,
-							tests_yuv[i].colorops);
+							tests_yuv[i].colorops,
+							false);
 
 					/* Switch plane back to temp_fb to keep CRTC active */
 					igt_plane_set_fb(plane, &temp_fb);
-- 
2.54.0

