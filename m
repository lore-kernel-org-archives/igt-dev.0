Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C96ECD6C8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034BB10E63E;
	Wed, 11 Feb 2026 16:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFQHzBFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1A10E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827686; x=1802363686;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wD2Kn/5GkDqolcuhh5/uSFZuti3uxd+ymOINhYZdIDc=;
 b=YFQHzBFG6Np70u0J4UJ5Kmc9Myr8Czpn5C754dipUuQNzf9sX01x6bBD
 95cjj2gy1mOXY+MmIW9nZN+aau1s65dv0jbdlVkBuJ+zAqHfZ0EjTQBFL
 GKZBG0rFGyoO/yFV6nFGk+W5bx3p+798p8HC/EhAdQrFO3VYPppXsdL7Y
 umzH89z9iXjNqv1znmjDKQuapTjnr+l2IvHmlE2EQ1zWb6A5hxNBCn7ow
 hD/vswLK/CIfAFHehgqehlph21+T8X5M60IKNt1/qt618hwDzRLlJSTRK
 4u2hNr0fUj5XySgJGmDyH/6d1JSMFV7jXQGLH09RLqUUi61BgL2D8ArIM Q==;
X-CSE-ConnectionGUID: qPV9YfJSQv2wuetBkQvLnw==
X-CSE-MsgGUID: 57jtWHwIRRacDYeRTO1Mkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879756"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:45 -0800
X-CSE-ConnectionGUID: cL2ZUH1oSRyzwNM3Yl7pnA==
X-CSE-MsgGUID: M4sjmtpJTp2vZBUC31kXTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394104"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:45 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/17] tests/kms_color*: Use igt_crtc_t instead of enum
 pipe
Date: Wed, 11 Feb 2026 18:33:56 +0200
Message-ID: <20260211163404.2018-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert the use of enum pipe to igt_crtc_t in
tests/kms_color*.

The use of function pointers makes this a bit more
complicated than your average test.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
 FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *crtc
  ,...)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

@depends on func@
identifier func.FUNC;
expression PIPE;
expression list[func.N] EP;
@@
FUNC(EP
-    ,PIPE
+    ,igt_crtc_for_pipe(display, PIPE)
   ,...)

@@
identifier FUNC, CRTC;
@@
FUNC(..., igt_crtc_t *CRTC, ...)
{
...
(
- igt_crtc_t *CRTC = CRTC;
|
- igt_crtc_t *CRTC = igt_crtc_for_pipe(...);
|
- igt_crtc_t *CRTC;
...
- CRTC = igt_crtc_for_pipe(...);
)
...
}

@func_ptr@
parameter list[N] P;
identifier F, PIPE;
type T;
@@
struct {
       ...
       T (*F)(P
-	,enum pipe PIPE
+	,igt_crtc_t *crtc
	,...);
	...
}

@depends on func_ptr@
identifier func_ptr.F;
expression list[func_ptr.N] EP;
expression PIPE, X;
@@
X.F(EP
- ,PIPE
+ ,igt_crtc_for_pipe(display, PIPE)
 ,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY;
expression E;
@@
- igt_display_t *DISPLAY = E;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 49 ++++++++++++++-------------
 tests/kms_color.c                     | 46 ++++++++++++-------------
 tests/kms_color_helper.c              | 23 +++++++------
 tests/kms_color_helper.h              |  8 ++---
 tests/kms_color_pipeline.c            | 10 +++---
 5 files changed, 67 insertions(+), 69 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index d77b924ac672..70dbedf82acc 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -429,10 +429,8 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 }
 
 static void
-prep_pipe(data_t *data, enum pipe p)
+prep_pipe(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	igt_require_pipe(&data->display, crtc->pipe);
 
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
@@ -450,14 +448,12 @@ prep_pipe(data_t *data, enum pipe p)
 	}
 }
 
-static int test_setup(data_t *data, enum pipe p)
+static int test_setup(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	int i = 0;
 
 	igt_display_reset(&data->display);
-	prep_pipe(data, crtc->pipe);
+	prep_pipe(data, crtc);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
@@ -489,10 +485,11 @@ static int test_setup(data_t *data, enum pipe p)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
-		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
+run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
+				 bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
 {
-	int port_idx = test_setup(data, p);
+	int port_idx = test_setup(data,
+				  crtc);
 
 	igt_require(port_idx >= 0);
 
@@ -500,15 +497,15 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, p))
+	if (!pipe_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
 
 static void
-run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 		       color_t *expected_colors,
 		       double *ctm,
 		       int iter)
@@ -519,7 +516,8 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 }
 	};
-	int port_idx = test_setup(data, p);
+	int port_idx = test_setup(data,
+				  crtc);
 
 	igt_require(port_idx >= 0);
 	/*
@@ -538,10 +536,10 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, p))
+	if (!pipe_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
+	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
 		bool success = false;
 		int i;
 
@@ -574,10 +572,11 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 }
 
 static void
-run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
-		bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
+run_limited_range_ctm_test_for_pipe(data_t *data, igt_crtc_t *crtc,
+				    bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
 {
-	int port_idx = test_setup(data, p);
+	int port_idx = test_setup(data,
+				  crtc);
 
 	igt_require(port_idx >= 0);
 	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
@@ -586,10 +585,10 @@ run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, p))
+	if (!pipe_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
 
@@ -689,7 +688,7 @@ run_tests_for_pipe(data_t *data)
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
 				run_gamma_degamma_tests_for_pipe(data,
-								 crtc->pipe,
+								 crtc,
 								 gamma_degamma_tests[i].test_t);
 			}
 		}
@@ -699,7 +698,8 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
-				run_ctm_tests_for_pipe(data, crtc->pipe,
+				run_ctm_tests_for_pipe(data,
+						       crtc,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
@@ -710,7 +710,8 @@ run_tests_for_pipe(data_t *data)
 	igt_describe("Compare after applying ctm matrix & identity matrix");
 	igt_subtest_with_dynamic("ctm-limited-range") {
 		for_each_crtc(&data->display, crtc) {
-			run_limited_range_ctm_test_for_pipe(data, crtc->pipe,
+			run_limited_range_ctm_test_for_pipe(data,
+							    crtc,
 							    test_pipe_limited_range_ctm);
 		}
 	}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index b05d1ba0adab..fdc97d13dad6 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -711,10 +711,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
 #endif
 
 static void
-prep_pipe(data_t *data, enum pipe p)
+prep_pipe(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	igt_require_pipe(&data->display, crtc->pipe);
 
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
@@ -732,12 +730,9 @@ prep_pipe(data_t *data, enum pipe p)
 	}
 }
 
-static void test_setup(data_t *data, enum pipe p)
+static void test_setup(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
-
-	prep_pipe(data, crtc->pipe);
+	prep_pipe(data, crtc);
 	igt_require_pipe_crc(data->drm_fd);
 	igt_require(crtc->n_planes >= 0);
 
@@ -755,10 +750,10 @@ static void test_cleanup(data_t *data)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
+run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
-	test_setup(data, p);
+	test_setup(data, crtc);
 
 	/*
 	 * We assume an 8bits depth per color for degamma/gamma LUTs
@@ -768,7 +763,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	igt_require(pipe_output_combo_valid(data, p));
+	igt_require(pipe_output_combo_valid(data, crtc));
 
 	igt_assert(test_t(data, data->primary));
 
@@ -785,7 +780,7 @@ static void transform_color(color_t *color, const double *ctm, double offset)
 }
 
 static void
-run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 		       const color_t *fb_colors,
 		       const double *ctm,
 		       int iter)
@@ -795,7 +790,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	double delta;
 	int i;
 
-	test_setup(data, p);
+	test_setup(data, crtc);
 
 	/* MediaTek can only support bit-ture in 10-bit depth pre color */
 	if (is_mtk_device(data->drm_fd))
@@ -810,7 +805,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	igt_require(pipe_output_combo_valid(data, p));
+	igt_require(pipe_output_combo_valid(data, crtc));
 
 	if (!iter)
 		iter = 1;
@@ -844,10 +839,8 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 }
 
 static void
-run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
+run_deep_color_tests_for_pipe(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	igt_output_t *output;
 	static const color_t blue_green_blue[] = {
 		{ 0.0, 0.0, 1.0 },
@@ -869,7 +862,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_require_f((intel_display_ver(data->devid) >= 11),
 				"At least GEN 11 is required to validate Deep-color.\n");
 
-	test_setup(data, crtc->pipe);
+	test_setup(data, crtc);
 
 	for_each_valid_output_on_pipe(&data->display, crtc->pipe, output) {
 		uint64_t max_bpc = get_max_bpc(output);
@@ -969,7 +962,7 @@ run_invalid_tests_for_pipe(data_t *data)
 	igt_crtc_t *crtc;
 	struct {
 		const char *name;
-		void (*test_t) (data_t *data, enum pipe pipe);
+		void (*test_t) (data_t *data, igt_crtc_t *crtc);
 		const char *desc;
 	} tests[] = {
 		{ "invalid-gamma-lut-sizes", invalid_gamma_lut_sizes,
@@ -988,8 +981,10 @@ run_invalid_tests_for_pipe(data_t *data)
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					prep_pipe(data, crtc->pipe);
-					tests[i].test_t(data, crtc->pipe);
+					prep_pipe(data,
+						  crtc);
+					tests[i].test_t(data,
+							crtc);
 				}
 			}
 		}
@@ -1132,7 +1127,8 @@ run_tests_for_pipe(data_t *data)
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
 				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_gamma_degamma_tests_for_pipe(data, crtc->pipe,
+					run_gamma_degamma_tests_for_pipe(data,
+									 crtc,
 									 gamma_degamma_tests[i].test_t);
 			}
 		}
@@ -1144,7 +1140,8 @@ run_tests_for_pipe(data_t *data)
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
 				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_ctm_tests_for_pipe(data, crtc->pipe,
+					run_ctm_tests_for_pipe(data,
+							       crtc,
 							       ctm_tests[i].fb_colors,
 							       ctm_tests[i].ctm,
 							       ctm_tests[i].iter);
@@ -1160,7 +1157,8 @@ run_tests_for_pipe(data_t *data)
 	igt_describe("Verify that deep color works correctly");
 	igt_subtest_with_dynamic("deep-color") {
 		for_each_crtc(&data->display, crtc) {
-			run_deep_color_tests_for_pipe(data, crtc->pipe);
+			run_deep_color_tests_for_pipe(data,
+						      crtc);
 
 			if (igt_run_in_simulation())
 				break;
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 554c1c72cbf6..aa47324dff6a 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,12 +24,12 @@
 
 #include "kms_color_helper.h"
 
-bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
+bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 {
 	bool ret = true;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, pipe));
+			    crtc);
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
@@ -316,11 +316,10 @@ pipe_set_property_blob(igt_crtc_t *crtc,
 }
 
 static void
-invalid_lut_sizes(data_t *data, enum pipe p,
+invalid_lut_sizes(data_t *data, igt_crtc_t *crtc,
 		  enum igt_atomic_crtc_properties prop, int size)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	struct drm_color_lut *lut;
 	size_t lut_size = size * sizeof(lut[0]);
 
@@ -349,21 +348,23 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 }
 
 void
-invalid_gamma_lut_sizes(data_t *data, enum pipe p)
+invalid_gamma_lut_sizes(data_t *data, igt_crtc_t *crtc)
 {
-	invalid_lut_sizes(data, p, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
+	invalid_lut_sizes(data, crtc,
+			  IGT_CRTC_GAMMA_LUT,
+			  data->gamma_lut_size);
 }
 
 void
-invalid_degamma_lut_sizes(data_t *data, enum pipe p)
+invalid_degamma_lut_sizes(data_t *data, igt_crtc_t *crtc)
 {
-	invalid_lut_sizes(data, p, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
+	invalid_lut_sizes(data, crtc,
+			  IGT_CRTC_DEGAMMA_LUT,
+			  data->degamma_lut_size);
 }
 
-void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
+void invalid_ctm_matrix_sizes(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	void *ptr;
 
 	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_CTM));
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 31f7382eb541..6a700d4610fe 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -68,7 +68,7 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
-bool pipe_output_combo_valid(data_t *data, enum pipe pipe);
+bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc);
 bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
@@ -110,9 +110,9 @@ int pipe_set_property_blob_id(igt_crtc_t *pipe,
 int pipe_set_property_blob(igt_crtc_t *pipe,
 			   enum igt_atomic_crtc_properties prop,
 			   void *ptr, size_t length);
-void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
-void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
-void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
+void invalid_gamma_lut_sizes(data_t *data, igt_crtc_t *crtc);
+void invalid_degamma_lut_sizes(data_t *data, igt_crtc_t *crtc);
+void invalid_ctm_matrix_sizes(data_t *data, igt_crtc_t *crtc);
 
 #endif
 
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 733ead1cd55c..7445b14568c5 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -46,11 +46,8 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static void test_setup(data_t *data, enum pipe p)
+static void test_setup(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
-
 	igt_require_pipe_crc(data->drm_fd);
 	igt_require(crtc);
 	igt_require(crtc->n_planes > 0);
@@ -279,10 +276,11 @@ run_tests_for_plane(data_t *data)
 							 output) {
 				data->output = output;
 
-				if (!pipe_output_combo_valid(data, crtc->pipe))
+				if (!pipe_output_combo_valid(data, crtc))
 					continue;
 
-				test_setup(data, crtc->pipe);
+				test_setup(data,
+					   crtc);
 
 				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
 					test_cleanup(data);
-- 
2.52.0

