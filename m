Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBA7D37490
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A3610EBA3;
	Fri,  5 Dec 2025 19:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFI77BI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049510EBA9
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963993; x=1796499993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kv70JMSOP+CngKgP1uUvtF3/XwcNi2wqCgmq7IqCh1I=;
 b=hFI77BI7IIVB0s2pegAlnVIHMSTwA02zDNLfCWbhYevqoY0QqfT+ySAI
 zldgZ7iPvFjG1e/e7a2VJY15wqSLq2BHA+WToZvsFmU6Vwf2b7zqbYIfc
 yFco9FGkpqhYgE+z1MA1YUoaG+EUAlG+2fDZsigvjr94bKc8nuqrj9m3G
 kEAA5R5JkEIRI9VMMwdCVQ0yC7Ux0/u5d/4cASVnFDwLyAHvAuZHATAXN
 yFxyE+0GFEg6/NgPgatQXMLImmRGzdgIIMdWC/Z1Ua4C/7dvGo8m78n/2
 WzY5gJcb0HOJqxS/YzG9trD0VPnQBajX4cgQ3ty3XyaHjqdA5NgsIY8mZ Q==;
X-CSE-ConnectionGUID: rOvCoYX0Q/+Va+gz+B/6SQ==
X-CSE-MsgGUID: ngAVKJ7VRpCytEio4zKu5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606670"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:33 -0800
X-CSE-ConnectionGUID: urdtZeZvRZilTj0/Vf67Nw==
X-CSE-MsgGUID: MwT8WYqkSQGK8h7AW6wNqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624902"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:31 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 10/13] tests/kms_color: Add Intel plane pipeline tests with LUT1D
 and CTM
Date: Sat,  6 Dec 2025 01:23:09 +0530
Message-Id: <20251205195312.1234330-11-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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
 tests/kms_color.c | 127 +++++++++++++++++++++++++++++++++++++++++-----
 tests/meson.build |   2 +-
 2 files changed, 114 insertions(+), 15 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index a47c71f33..258a78a58 100644
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
@@ -1327,16 +1338,104 @@ run_tests_for_pipe(data_t *data)
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
 
-			if (igt_run_in_simulation())
-				break;
+			igt_display_require(&data->display, data->display.drm_fd);
+			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+				data->display.has_plane_color_pipeline = 1;
+
+			kmstest_set_vt_graphics_mode();
+
+			igt_display_require(&data->display, data->display.drm_fd);
+			if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+				data->display.has_plane_color_pipeline = 1;
+
+			igt_require(data->display.is_atomic);
+		}
+
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
diff --git a/tests/meson.build b/tests/meson.build
index e0411bbc3..972b7b520 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -377,7 +377,7 @@ extra_sources = {
 	'core_hotunplug': [ 'core_hotunplug.c' ],
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
-	'kms_color':  [ 'kms_color_helper.c' ],
+	'kms_color':  [ 'kms_color_helper.c','kms_colorop_helper.c' ],
 	'kms_colorop':  [ 'kms_colorop_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.25.1

