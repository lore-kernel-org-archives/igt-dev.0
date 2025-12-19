Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B3D767DB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA89E10EF0C;
	Fri, 19 Dec 2025 11:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRSznwMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3E110EF21
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143151; x=1797679151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nCiqdkTjWse/wThq5QwpjrGTUMCn6/dHZmoWJLAxSHY=;
 b=hRSznwMbaezz0s6kbu4lJ9SH6XWeN+KpkholQSfRlVIBDTK4ICq5WUJE
 R/rrRGENnKp0MzCGEcKUbnWcrf+rgPj92JQbDzWwDW7SMnaIAu1TKa2Al
 wiOxpf1S2yedNLzegsFYm1dz5GawIsdmJrJqOLfS+uj7D0Cqlm1dJ/y9y
 p+d7lw9Wl2lX9vdlE4Qam1wThxSzElmiY3d5Wue3eeo9UTF+XG4T8VvZB
 2mRVuxy0W7NTbWuu3Hf8ad9D8nOiP2NhHdTgMjMobrIY+sRiA8yrB8ob2
 MKbmTbOcIV7e5QUcsgYBa6lO52mCI2lK915S9ck4YcGNkqDzrLD4fG41E w==;
X-CSE-ConnectionGUID: bSGOXz0MQHqpnw8FPhVMLA==
X-CSE-MsgGUID: lj9iEA9RSmybI2/5lfl7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816171"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:11 -0800
X-CSE-ConnectionGUID: wUYVsDZ9RfeIh7FkqGkcZQ==
X-CSE-MsgGUID: Fy3KE+YAT1WkMzRLsZsXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235504"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:10 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 6/8] tests/kms_color: Add Intel plane pipeline tests with LUT1D
 and CTM
Date: Fri, 19 Dec 2025 16:56:04 +0530
Message-Id: <20251219112606.1330425-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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

These tests follow a common flow: primary plane is configured with a
deterministic test pattern, one or more colorops are enabled in a
specific order on the plane color pipeline, and the corresponding
color properties are programmed with known transformation values.
The output is then validated by comparing the resulting frame
against the expected transformed output using CRC based
verification.

Separate subtests exercise different valid combinations of the
available colorops to ensure correct programming, ordering, and
interaction of plane color pipeline elements:
  igt@kms_color@plane-lut1d
  igt@kms_color@plane-lut1d-pre-ctm3x4
  igt@kms_color@plane-lut1d-post-ctm3x4
  igt@kms_color@plane-lut1d-ctm3x4
  igt@kms_color@plane-ctm3x4-lut1d
  igt@kms_color@plane-lut1d-lut1d
  igt@kms_color@plane-lut1d-ctm3x4-lut1d

v2: -add new tests pre/post ctm (Chaitanya)
    -remove redundant code (Chaitanya)
    -create plane tests subtest_group (Chaitanya)
    -add/use transfer linear/max func (Chaitanya)
    -improve commit message (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_color.c   |  19 ++++++
 lib/igt_color.h   |   6 ++
 tests/kms_color.c | 146 ++++++++++++++++++++++++++++++++++++++++++++--
 tests/meson.build |   2 +-
 4 files changed, 168 insertions(+), 5 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index a34872763..4d94421ba 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -19,6 +19,9 @@
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
 const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
+const struct igt_color_tf linear_tf = {1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f};
+const struct igt_color_tf max_tf = {1.0f, 0.0f, 1.0f, 0.0f, 1.0e-6f, 0.0f, 0.0f};
+
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
 igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
@@ -27,6 +30,12 @@ igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
 igt_1dlut_t igt_1dlut_srgb_eotf = { {
 } };
 
+igt_1dlut_t igt_1dlut_linear = { {
+} };
+
+igt_1dlut_t igt_1dlut_max = { {
+} };
+
 static float clamp(float val, float min, float max)
 {
 	return ((val < min) ? min : ((val > max) ? max : val));
@@ -130,6 +139,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_linear(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &linear_tf);
+}
+
+void igt_color_max(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &max_tf);
+}
+
 void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
 {
 	igt_color_tf(pixel, &bt2020_inv_oetf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 45cf8f3c7..919330c8b 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -45,6 +45,9 @@ typedef struct igt_1dlut {
 extern igt_1dlut_t igt_1dlut_srgb_inv_eotf;
 extern igt_1dlut_t igt_1dlut_srgb_eotf;
 
+extern igt_1dlut_t igt_1dlut_linear;
+extern igt_1dlut_t igt_1dlut_max;
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
@@ -93,6 +96,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_max(igt_pixel_t *pixel);
+void igt_color_linear(igt_pixel_t *pixel);
+
 void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_eotf(igt_pixel_t *pixel);
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 85c7d89d6..711e2503e 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -32,6 +32,8 @@
 
 #include "kms_color_helper.h"
 
+#define MAX_COLOROPS	5
+
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
@@ -76,7 +78,23 @@
  * @gamma-lut:          Gamma LUT
  */
 
-IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
+/**
+ * SUBTEST: plane-%s
+ * Description: Test plane color pipeline with colorops: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @lut1d:				1D LUT
+ * @lut1d-pre-ctm3x4:			1D LUT PRE CTM 3x4
+ * @lut1d-post-ctm3x4:			1D LUT POST CTM 3x4
+ * @ctm3x4:				3X4 CTM
+ * @lut1d-ctm3x4:			1D LUT --> 3X4 CTM
+ * @ctm3x4-lut1d:			3X4 CTM --> 1D LUT
+ * @lut1d-lut1d:			1D LUT --> 1D LUT
+ * @lut1d-ctm3x4-lut1d:			1D LUT --> 3X4 CTM --> 1D LUT
+ */
+
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe and Plane level");
 
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
@@ -709,7 +727,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
-__maybe_unused
 static bool ctm_colorop_only(kms_colorop_t *colorops[])
 {
 	int i;
@@ -720,7 +737,6 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 	return true;
 }
 
-__maybe_unused
 static bool test_plane_colorops(data_t *data,
 				const color_t *fb_colors,
 				const color_t *exp_colors,
@@ -913,7 +929,6 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
-__maybe_unused
 static void run_plane_color_tests(data_t *data,
 				  const color_t *fb_colors,
 				  const color_t *exp_colors,
@@ -1267,6 +1282,126 @@ run_tests_for_pipe(data_t *data)
 	}
 }
 
+static void
+run_tests_for_plane(data_t *data)
+{
+	static const color_t colors_rgb[] = {
+	        { 1.0, 0.0, 0.0 },
+	        { 0.0, 1.0, 0.0 },
+	        { 0.0, 0.0, 1.0 },
+	};
+	static const color_t colors_red_to_blue[] = {
+		{ 0.0, 0.0, 1.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+	const igt_matrix_3x4_t ctm_red_to_blue = { {
+		0.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		1.0, 0.0, 1.0, 0.0,
+	} };
+	const igt_matrix_3x4_t ctm_linear = { {
+		1.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		0.0, 0.0, 1.0, 0.0,
+	} };
+	kms_colorop_t lut1d_linear = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Pre/Post CSC GAMMA (linear LUT)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+	kms_colorop_t lut1d_max = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.lut1d = &igt_1dlut_max,
+		.name = "Pre/Post CSC GAMMA (max LUT)",
+		.transform = &igt_color_max,
+	};
+	kms_colorop_t ctm_3x4 = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (red to blue)",
+		.matrix_3x4 = &ctm_red_to_blue,
+	};
+	kms_colorop_t ctm_3x4_linear = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (linear)",
+		.matrix_3x4 = &ctm_linear,
+	};
+
+	struct {
+		const char *name;
+		const color_t *fb_colors;
+		const color_t *exp_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+	} plane_colorops_tests[] = {
+		{ .name = "lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-pre-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
+		},
+		{ .name = "lut1d-post-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
+		},
+		{ .name = "ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, NULL },
+		},
+		{ .name = "lut1d-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
+		},
+		{ .name = "ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
+		},
+	};
+
+	igt_fixture() {
+		int has_plane_color_pipeline;
+
+		if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			data->display.is_atomic = 1;
+
+		if (drmSetClientCap(data->display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			has_plane_color_pipeline = 1;
+
+		igt_display_require(&data->display, data->display.drm_fd);
+
+		data->display.has_plane_color_pipeline = has_plane_color_pipeline;
+
+		igt_require(data->display.is_atomic);
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
+		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
+		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name)
+			run_plane_color_tests(data,
+					      plane_colorops_tests[i].fb_colors,
+					      plane_colorops_tests[i].exp_colors,
+					      plane_colorops_tests[i].colorops);
+	}
+}
+
 int igt_main()
 {
 	data_t data = {};
@@ -1283,6 +1418,9 @@ int igt_main()
 	igt_subtest_group()
 		run_tests_for_pipe(&data);
 
+	igt_subtest_group()
+		run_tests_for_plane(&data);
+
 	igt_subtest_group()
 		run_invalid_tests_for_pipe(&data);
 
diff --git a/tests/meson.build b/tests/meson.build
index ae48dfe04..5ffbf1a81 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -378,7 +378,7 @@ extra_sources = {
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

