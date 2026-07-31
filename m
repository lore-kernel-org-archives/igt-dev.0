Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84616C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A1E10F380;
	Fri, 31 Jul 2026 18:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O3yrjLDt";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010061.outbound.protection.outlook.com
 [40.93.198.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48AC10F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGnZ+pJ76ZQzxzfkLO2fAn2ePaIfOOpiyYordv+b6rbBHXil/lvmLrdhn4MzD+N6OZSWd8VXbfSNVaHB7qr86b0fOHu1Ntq0Qsv4Ij4ZDCZijGJ1AsWuuCohVvV2t3O9FegvtgoWJIuW657j1Gn0mPuS/TMTIWj9EV/Z+jM1D4r61sGSLa/CjSlc71ux/+A7qJNE3NEJSQprcu3eJ9nsNSfYjc0rkibgyT5C/xV7eB2V6Df/WFAngEj9Z1VKxCzYgI7xRioqGu16+0WgzVHk/CKJH8V6uHbedR9/+A8Aa1LdD9M2f4vQqkvafW80xWvnQRyICLgq0zzn/HtV2qEkGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Fze31/xblDeLg+qL8YzOXOjcy1xUxJCJ4xuZEov3s=;
 b=eZbSQgkftAG2hkIHtw2xfJkV2wz0NKCVmF1GbnE9J6X67Nbiw35jzgqbvCBPyYeDyC/qmYmv1uSQyVeLc+5tUV0NvnVL44a4gVkHVMfzjskXFY/vU/URP5jB1rGXqikreNja471qw8w0sU8yj9rprR3XipXomLQ3Xe1+FzjsANU6D/DdOwmBtBUw9Q5TpJlGtPr7kVayelzyCyZmjAw36Wp+g32owfq3oG7bMxBj/WzCzXppq3dJsjVCLoZ1jDXYt+e/KvkkoCg4Z/u0bCnOuftKqy+FulzdtObdwiVL3KmZjylh22bP61kkIGJIKHca0C70FZjyeR5sygNZXC3KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2Fze31/xblDeLg+qL8YzOXOjcy1xUxJCJ4xuZEov3s=;
 b=O3yrjLDtRzzfZaIzJO3yuSitZud2LLLaFYpK2F9BUApbb9YhzVOHnQKLTuxC38dacqbh+JA31ObpxsO7kj0h3M1r1F703hdjC2LJERLQRnQKTn9stBwntN1sFkDDAxkCZ8j8q1/49qM2PsuODQ8lX1Fwef65wCTpRsubbBIDSrA=
Received: from SJ0PR13CA0173.namprd13.prod.outlook.com (2603:10b6:a03:2c7::28)
 by DS2PR12MB9661.namprd12.prod.outlook.com (2603:10b6:8:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 18:02:15 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::30) by SJ0PR13CA0173.outlook.office365.com
 (2603:10b6:a03:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 18:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:14 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:13 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 09/10] tests/kms_colorop: Add bypass transition tests
Date: Fri, 31 Jul 2026 14:01:59 -0400
Message-ID: <20260731180200.668795-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|DS2PR12MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b923626-a73d-4714-00e4-08deef2dda7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: Tc0KtrLsFM8t0Slln5EqqYnzFxyLiNXZLrb4QkyxGzbSNWvuAGRvP6hzUmnpCt+HJ5aM7RHRMC7EiwClirgvvxJyajaDTHmbqj+573Mm3baiiizyPNd1YchVMJLuS9kKEazIr1bIWhbWgXYtitEDQR6efGAaWz1dzkOBlOgwncxlUhATbi3wfpDK9woC0p0OIcb1ixojWgvQ3525ntMmVPyjBwf/5rf1n+7f7WutpH/hPYiOdVYhKsr+iWbCROUIZUoxmRPbRPlvpcKvyE9Mn4WdtMKGX/Y6Gxcgx70VQo4KSnvY3wG03QVp9STOFTeFb+Md4LcpPV6QLFjwCx/bUm+/a86w+hxz3CrMaTAEG1cZz813Fcyb7yB3fCulieDh6N/A74SIL2di2PMf1lJZGP2vPpkIEDKW3JXPaKBby6Illr2RxefaAq5TG/pjo+EUdXO6rtlyjv6uHC6y6y0bEdEE9UF6nbvpu3q5eyn+TKWDDUj6ldsaZHT7LqgY0bwCwXwkmtiWq49Tjw+7e0o28J/awIkJkN5qPWvH7IgId2rTZBswlpYwVcuULv241kNweRppwNK3XAiuNo/EDF9GW6hQNh59vpUd5NjQmg0D+5+4y17uoSix27T/ICunxJ5UkuZFVEAzldYqlXnvyFmPwxkIO5gLRs+BAPdsLSzk1dK1KDrq0K+x3/gApo4ZtJFJAAuVORsLLk/XKfe65NQFcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F296umB/hvI9H1Hyy0n2/tVaO20Z1YF5cpV9X7nM91foIaqe2L9D4TUJYNl/MjtkuE/R3oBb+L7UiUgP6jhlg7XktwosTXOuhd+XirT+hQDilaDgUlOr8FCE6Jxfn563dGFbDXhs6A4LKv7wFTrvmG0TsGezoudypwQRYdIOuBfr3YUtFHP0y1OoDQCqUlqzz81pBe/pYCcCCYqSd5cQt8/Vqh6H7a0YKHMAV4u3gbjaVmit7BI+cVi3pukVE00G1mHzasDlqxZ7yK5azsR452iG7cG7iwkvuLv6xJl2nDnj2thzOTBQNwGExabwB9wR6CGuRZD6By0EC9E/a0nBRZ1gjm8Wrj4Mq05qzN3rbMM+RaWpaXJxsJRoNErX1IFgdFKhkCoHzU9A0+gJ+Y6/+wMnH4bLQhyOj+rLpsMZPO4kMq+4GpjZyH6x7LKVJA9v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:14.9835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b923626-a73d-4714-00e4-08deef2dda7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9661
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
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 127 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 115 insertions(+), 12 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8055a36bab74..c6adbc4b9121 100644
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
@@ -268,7 +278,8 @@ static void colorop_plane_test(igt_display_t *display,
 			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+			       kms_colorop_t *colorops[],
+			       bool verify_bypass)
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -329,17 +340,26 @@ static void colorop_plane_test(igt_display_t *display,
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
@@ -463,6 +483,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -565,7 +599,75 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
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
@@ -649,7 +751,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 							&output_fb,
 							formats_yuv[j].fourcc_in,
 							formats_yuv[j].fourcc_out,
-							tests_yuv[i].colorops);
+							tests_yuv[i].colorops,
+							false);
 
 					/* Switch plane back to temp_fb to keep CRTC active */
 					igt_plane_set_fb(plane, &temp_fb);
-- 
2.55.0

