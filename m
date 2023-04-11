Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2034A10E130
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 07:51:10 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 10:50:55 +0300
Message-Id: <20230411075101.2785-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
References: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/8] tests/kms_color: Use named initializers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use named initializers to make it actually possible to figure out
what is happening. And sprinkle some missing commas around while
at it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 202 +++++++++++++++++++++++++++-------------------
 1 file changed, 118 insertions(+), 84 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 369dc8057d83..84a8eabe5484 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -35,7 +35,7 @@ static bool test_pipe_degamma(data_t *data,
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
 	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
@@ -127,7 +127,7 @@ static bool test_pipe_gamma(data_t *data,
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
 	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
@@ -215,7 +215,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
 	drmModeCrtc *kms_crtc;
 	uint32_t i, legacy_lut_size;
@@ -324,7 +324,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	const double ctm_identity[] = {
 		1.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
-		0.0, 0.0, 1.0
+		0.0, 0.0, 1.0,
 	};
 	drmModeCrtc *kms_crtc;
 	gamma_lut_t *degamma_linear = NULL, *gamma_zero;
@@ -461,7 +461,7 @@ static bool test_pipe_ctm(data_t *data,
 	const double ctm_identity[] = {
 		1.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
-		0.0, 0.0, 1.0
+		0.0, 0.0, 1.0,
 	};
 	gamma_lut_t *degamma_linear = NULL, *gamma_linear = NULL;
 	igt_output_t *output = data->output;
@@ -569,16 +569,18 @@ static void test_pipe_limited_range_ctm(data_t *data,
 	color_t red_green_blue_limited[] = {
 		{ limited_result, 0.0, 0.0 },
 		{ 0.0, limited_result, 0.0 },
-		{ 0.0, 0.0, limited_result }
+		{ 0.0, 0.0, limited_result },
 	};
 	color_t red_green_blue_full[] = {
 		{ 0.5, 0.0, 0.0 },
 		{ 0.0, 0.5, 0.0 },
-		{ 0.0, 0.0, 0.5 }
+		{ 0.0, 0.0, 0.5 },
+	};
+	double ctm[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0,
 	};
-	double ctm[] = { 1.0, 0.0, 0.0,
-			0.0, 1.0, 0.0,
-			0.0, 0.0, 1.0 };
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output;
 	bool has_broadcast_rgb_output = false;
@@ -743,7 +745,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
 
 	test_setup(data, p);
@@ -799,16 +801,18 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 	color_t blue_green_blue[] = {
 		{ 0.0, 0.0, 1.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	double ctm[] = { 0.0, 0.0, 0.0,
-			 0.0, 1.0, 0.0,
-			 1.0, 0.0, 1.0 };
+	double ctm[] = {
+		0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		1.0, 0.0, 1.0,
+	};
 
 	if (is_i915_device(data->drm_fd))
 		igt_require_f((intel_display_ver(data->devid) >= 11),
@@ -924,17 +928,22 @@ run_tests_for_pipe(data_t *data)
 		bool (*test_t)(data_t*, igt_plane_t*);
 		const char *desc;
 	} gamma_degamma_tests[] = {
-		{ "degamma", test_pipe_degamma,
-		  "Verify that degamma LUT transformation works correctly" },
-
-		{ "gamma", test_pipe_gamma,
-		  "Verify that gamma LUT transformation works correctly" },
-
-		{ "legacy-gamma", test_pipe_legacy_gamma,
-		  "Verify that legacy gamma LUT transformation works correctly" },
-
-		{ "legacy-gamma-reset", test_pipe_legacy_gamma_reset,
-		  "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property" },
+		{ .name = "degamma",
+		  .test_t = test_pipe_degamma,
+		  .desc = "Verify that degamma LUT transformation works correctly",
+		},
+		{ .name = "gamma",
+		  .test_t = test_pipe_gamma,
+		  .desc = "Verify that gamma LUT transformation works correctly",
+		},
+		{ .name = "legacy-gamma",
+		  .test_t = test_pipe_legacy_gamma,
+		  .desc = "Verify that legacy gamma LUT transformation works correctly",
+		},
+		{ .name = "legacy-gamma-reset",
+		  .test_t = test_pipe_legacy_gamma_reset,
+		  .desc = "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property",
+		},
 	};
 	struct {
 		const char *name;
@@ -943,71 +952,96 @@ run_tests_for_pipe(data_t *data)
 		double ctm[9];
 		const char *desc;
 	} ctm_tests[] = {
-		{ "ctm-red-to-blue", 0,
-			{{ 0.0, 0.0, 1.0 },
-			 { 0.0, 1.0, 0.0 },
-			 { 0.0, 0.0, 1.0 }},
-		  { 0.0, 0.0, 0.0,
-		    0.0, 1.0, 0.0,
-		    1.0, 0.0, 1.0 },
-		  "Check the color transformation from red to blue"
+		{ .name = "ctm-red-to-blue",
+		  .colors = {
+			  { 0.0, 0.0, 1.0 },
+			  { 0.0, 1.0, 0.0 },
+			  { 0.0, 0.0, 1.0 },
+		  },
+		  .ctm = {
+			  0.0, 0.0, 0.0,
+			  0.0, 1.0, 0.0,
+			  1.0, 0.0, 1.0,
+		  },
+		  .desc = "Check the color transformation from red to blue",
 		},
-		{ "ctm-green-to-red", 0,
-			{{ 1.0, 0.0, 0.0 },
-			 { 1.0, 0.0, 0.0 },
-			 { 0.0, 0.0, 1.0 }},
-		  { 1.0, 1.0, 0.0,
-		    0.0, 0.0, 0.0,
-		    0.0, 0.0, 1.0 },
-		  "Check the color transformation from green to red"
+		{ .name = "ctm-green-to-red",
+		  .colors = {
+			  { 1.0, 0.0, 0.0 },
+			  { 1.0, 0.0, 0.0 },
+			  { 0.0, 0.0, 1.0 },
+		  },
+		  .ctm = {
+			  1.0, 1.0, 0.0,
+			  0.0, 0.0, 0.0,
+			  0.0, 0.0, 1.0,
+		  },
+		  .desc = "Check the color transformation from green to red",
 		},
-		{ "ctm-blue-to-red", 0,
-			{{ 1.0, 0.0, 0.0 },
-			 { 0.0, 1.0, 0.0 },
-			 { 1.0, 0.0, 0.0 }},
-		  { 1.0, 0.0, 1.0,
-		    0.0, 1.0, 0.0,
-		    0.0, 0.0, 0.0 },
-		  "Check the color transformation from blue to red"
+		{ .name = "ctm-blue-to-red",
+		  .colors = {
+			  { 1.0, 0.0, 0.0 },
+			  { 0.0, 1.0, 0.0 },
+			  { 1.0, 0.0, 0.0 },
+		  },
+		  .ctm = {
+			  1.0, 0.0, 1.0,
+			  0.0, 1.0, 0.0,
+			  0.0, 0.0, 0.0,
+		  },
+		  .desc = "Check the color transformation from blue to red",
 		},
-		{ "ctm-max", 0,
-			{{ 1.0, 0.0, 0.0 },
-			 { 0.0, 1.0, 0.0 },
-			 { 0.0, 0.0, 1.0 }},
-		  { 100.0, 0.0, 0.0,
-		    0.0, 100.0, 0.0,
-		    0.0, 0.0, 100.0 },
-		  "Check the color transformation for maximum transparency"
+		{ .name = "ctm-max",
+		  .colors = {
+			  { 1.0, 0.0, 0.0 },
+			  { 0.0, 1.0, 0.0 },
+			  { 0.0, 0.0, 1.0 },
+		  },
+		  .ctm = { 100.0, 0.0, 0.0,
+			  0.0, 100.0, 0.0,
+			  0.0, 0.0, 100.0,
+		  },
+		  .desc = "Check the color transformation for maximum transparency",
 		},
-		{ "ctm-negative", 0,
-			{{ 0.0, 0.0, 0.0 },
-			 { 0.0, 0.0, 0.0 },
-			 { 0.0, 0.0, 0.0 }},
-		  { -1.0, 0.0, 0.0,
-		    0.0, -1.0, 0.0,
-		    0.0, 0.0, -1.0 },
-		  "Check the color transformation for negative transparency"
+		{ .name = "ctm-negative",
+		  .colors = {
+			  { 0.0, 0.0, 0.0 },
+			  { 0.0, 0.0, 0.0 },
+			  { 0.0, 0.0, 0.0 },
+		  },
+		  .ctm = {
+			  -1.0,  0.0,  0.0,
+			   0.0, -1.0,  0.0,
+			   0.0,  0.0, -1.0,
+		  },
+		  .desc = "Check the color transformation for negative transparency",
 		},
-		{ "ctm-0-25", 5,
-			{{ 0.0, }, { 0.0, }, { 0.0, }},
-		  { 0.25, 0.0,  0.0,
-		    0.0,  0.25, 0.0,
-		    0.0,  0.0,  0.25 },
-		  "Check the color transformation for 0.25 transparency"
+		{ .name = "ctm-0-25",
+		  .iter = 5,
+		  .ctm = {
+			  0.25, 0.0,  0.0,
+			  0.0,  0.25, 0.0,
+			  0.0,  0.0,  0.25,
+		  },
+		  .desc = "Check the color transformation for 0.25 transparency",
 		},
-		{ "ctm-0-50", 5,
-			{{ 0.0, }, { 0.0, }, { 0.0, }},
-		  { 0.5,  0.0,  0.0,
-		    0.0,  0.5,  0.0,
-		    0.0,  0.0,  0.5 },
-		  "Check the color transformation for 0.5 transparency"
+		{ .name = "ctm-0-50",
+		  .iter = 5,
+		  .ctm = {
+			  0.5,  0.0,  0.0,
+			  0.0,  0.5,  0.0,
+			  0.0,  0.0,  0.5,
+		  },
+		  .desc = "Check the color transformation for 0.5 transparency",
 		},
-		{ "ctm-0-75", 7,
-			{{ 0.0, }, { 0.0, }, { 0.0, }},
-		  { 0.75, 0.0,  0.0,
-		    0.0,  0.75, 0.0,
-		    0.0,  0.0,  0.75 },
-		  "Check the color transformation for 0.75 transparency"
+		{ .name = "ctm-0-75",
+		  .iter = 7,
+		  .ctm = {
+			  0.75, 0.0,  0.0,
+			  0.0,  0.75, 0.0,
+			  0.0,  0.0,  0.75,
+		  },
+		  .desc = "Check the color transformation for 0.75 transparency",
 		},
 	};
 	int i;
-- 
2.39.2
