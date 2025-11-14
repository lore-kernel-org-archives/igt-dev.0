Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FB8CE8D60
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F7E10EAD9;
	Fri, 14 Nov 2025 17:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpMm3mJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50710EAEA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140964; x=1794676964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vx2qSZhWUUksywXAfI8LJtkpGaPVCsXr4g16Zvx1sd8=;
 b=bpMm3mJbZr9b00TaukXgAlvx+bBYrU5QS7oKsiArnJMPD89bvPoMD41h
 iGM/gN7c0LFuFFWJ2KdMkg0SJJFZ5CojJnI5gJT/Q2ZvBABADdhNUiS/A
 1mfI7TXrxv4nnKeymZqMzL2Z3g4EI9TwNDqUXrAlehXr+/Twrys32RQiq
 Uib28Cei4o2lM6LnIwgZ6485t6N9McO+cYIABCeuiahGx1vTO07q9JEzO
 qUjW66JLz+v6P/pVLfOlLQdSucfVpkbvkHlbCiWBrwwzF04BAwksbvItG
 WPMZ+bWYFFAo3p0VYUo0wmeRhjhmLtyXXazW89tDCH9Ff2O1Cn4HgOZvQ Q==;
X-CSE-ConnectionGUID: Ie+BhO4tSYiPAIjUZeOE2A==
X-CSE-MsgGUID: O2kripybSZeLZW77/Af5pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871450"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:44 -0800
X-CSE-ConnectionGUID: g1AcphqSQg6QyYZPSVjpxg==
X-CSE-MsgGUID: x/FUwt5bSRyRtUT+GJ+Ssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981483"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:42 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 11/23] tests/kms_color: Add Intel plane pipeline tests with LUT1D
 and CTM
Date: Fri, 14 Nov 2025 22:58:56 +0530
Message-Id: <20251114172908.1027816-12-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For now, Intel plane color pipeline contains 3 colorops:
Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)

Create subtests to cover different combinations of available
colorops:
  igt@kms_color@plane-lut1d
  igt@kms_color@plane-lut1d-ctm3x4
  igt@kms_color@plane-ctm3x4-lut1d
  igt@kms_color@plane-lut1d-lut1d
  igt@kms_color@plane-lut1d-ctm3x4-lut1d

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 115 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 101 insertions(+), 14 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index a47c71f33..72857e822 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -32,6 +32,8 @@
 
 #include "kms_color_helper.h"
 
+#define MAX_COLOROPS	5
+
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
@@ -76,7 +78,21 @@
  * @gamma-lut:          Gamma LUT
  */
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+/**
+ * SUBTEST: plane-%s
+ * Description: Test plane color pipeline with colorops: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @lut1d:			1D LUT
+ * @ctm3x4:			3X4 CTM
+ * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
+ * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
+ * @lut1d-lut1d:		1D LUT --> 1D LUT
+ * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
+ */
+
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe and Plane level");
 
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
@@ -724,7 +740,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
-__maybe_unused
 static void clear_lut_data(kms_colorop_t *colorops[])
 {
 	int i;
@@ -735,7 +750,6 @@ static void clear_lut_data(kms_colorop_t *colorops[])
 	}
 }
 
-__maybe_unused
 static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 {
 	int i;
@@ -773,7 +787,6 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 	}
 }
 
-__maybe_unused
 static bool ctm_colorop_only(kms_colorop_t *colorops[])
 {
 	int i;
@@ -784,7 +797,6 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
-__maybe_unused
 static bool test_plane_colorops(data_t *data,
 				const color_t *fb_colors,
 				const color_t *exp_colors,
@@ -988,7 +1000,6 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
-__maybe_unused
 static void run_plane_color_tests(data_t *data,
 				  const color_t *fb_colors,
 				  const color_t *exp_colors,
@@ -1327,16 +1338,92 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
-	igt_fixture
-		igt_require(data->display.is_atomic);
+	igt_subtest_group {
+		static const color_t colors_red_to_blue[] = {
+			{ 0.0, 0.0, 1.0 },
+			{ 0.0, 1.0, 0.0 },
+			{ 0.0, 0.0, 1.0 },
+		};
+		const igt_matrix_3x4_t ctm_red_to_blue = { {
+			0.0, 0.0, 0.0, 0.0,
+			0.0, 1.0, 0.0, 0.0,
+			1.0, 0.0, 1.0, 0.0,
+		} };
+		kms_colorop_t lut1d_linear = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (linear LUT)",
+			.lut_type = KMS_COLOROP_LUT1D_LINEAR,
+		};
+		kms_colorop_t lut1d_max = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (max LUT)",
+			.lut_type = KMS_COLOROP_LUT1D_MAX,
+		};
+		kms_colorop_t ctm_3x4 = {
+			.type = KMS_COLOROP_CTM_3X4,
+			.name = "CTM 3X4 (red to blue)",
+			.matrix_3x4 = &ctm_red_to_blue,
+		};
+		struct {
+			const char *name;
+			const color_t *fb_colors;
+			const color_t *exp_colors;
+			kms_colorop_t *colorops[MAX_COLOROPS];
+		} plane_colorops_tests[] = {
+			{ .name = "lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_max, NULL },
+			},
+			{ .name = "ctm3x4",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x4, NULL },
+			},
+			{ .name = "lut1d-ctm3x4",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_max, &ctm_3x4, NULL },
+			},
+			{ .name = "ctm3x4-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x4, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-ctm3x4-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
+			},
+		};
 
-	igt_describe("Verify that deep color works correctly");
-	igt_subtest_with_dynamic("deep-color") {
-		for_each_pipe(&data->display, pipe) {
-			run_deep_color_tests_for_pipe(data, pipe);
+		igt_fixture {
+			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+				data->display.is_atomic = 1;
+		}
 
-			if (igt_run_in_simulation())
-				break;
+		for (i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
+			igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
+			igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name)
+				run_plane_color_tests(data,
+						      plane_colorops_tests[i].fb_colors,
+						      plane_colorops_tests[i].exp_colors,
+						      plane_colorops_tests[i].colorops);
+		}
+
+		igt_describe("Verify that deep color works correctly");
+		igt_subtest_with_dynamic("deep-color") {
+			for_each_pipe(&data->display, pipe) {
+				run_deep_color_tests_for_pipe(data, pipe);
+
+				if (igt_run_in_simulation())
+					break;
+			}
 		}
 	}
 }
-- 
2.25.1

