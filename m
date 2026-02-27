Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F390FD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81E910EA52;
	Fri, 27 Feb 2026 08:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbay7Aip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D6C10EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179656; x=1803715656;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LkP//DZrjA0uNKftYDWSxzrGV7DPYlviM+0qrL30kqM=;
 b=jbay7Aip5Tm6KgKJb3MpDo9W/bsM4DPAVLhwEFzV2eZKr5eRPfmMnQOz
 pwdGtoMQw0SwvfKLuIeN4mUI54XSLGgiYjXpI+wBLqbZVkrTbBmBfA0Jz
 b6dwFDsffxDpibCROq1Aj2dSnhzqFhnwXUy9K2vsfX/mmuMkFTnv8CwRn
 JwznVNprWve5ZDNE6YPVCpaUPNt1ie5DvEFITjBRXgJIPOd7vt3afaGap
 oh0mOIXmTK8HC1n3dvR3B08r7pmQO2nGFAvLIhME4N/WA3TM2L60ECehe
 9xV91jCh5q18AdSJdNKMgnxuNQD4lwz48nQLiAtiTIDXqmhqR8G3kj1EK A==;
X-CSE-ConnectionGUID: AidOfonpSUG4odeQl3wAKA==
X-CSE-MsgGUID: 6bSBWb2xQ7OCTlFwARhCNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98727131"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="98727131"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:35 -0800
X-CSE-ConnectionGUID: CSMGPsJbRRud1IAlGxcFUg==
X-CSE-MsgGUID: UcobqBmtSx6vWLBCOV1stA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216065862"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:34 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/17] tests/kms_color*: Prefer "crtc" over "pipe" in
 function names
Date: Fri, 27 Feb 2026 10:06:45 +0200
Message-ID: <20260227080653.30389-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Rename a bunch of functions that operate on igt_crtc_t from
the old "pipe" terminology to the new "crtc" terminology.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier OLD_FUNC =~ "pipe";
identifier CRTC;
@@
OLD_FUNC(..., igt_crtc_t *CRTC, ...) { ... }

@script:python rename@
OLD_FUNC << func.OLD_FUNC;
NEW_FUNC;
@@
coccinelle.NEW_FUNC = OLD_FUNC.replace("pipe", "crtc")

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...) { ... }

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
type T;
@@
T
- OLD_FUNC
+ NEW_FUNC
  (...);

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 22 ++++++++++----------
 tests/kms_color.c                     | 22 ++++++++++----------
 tests/kms_color_helper.c              | 30 +++++++++++++--------------
 tests/kms_color_helper.h              |  6 +++---
 tests/kms_color_pipeline.c            |  2 +-
 5 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 24d66f473ca2..d43c3be7775a 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -429,7 +429,7 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 }
 
 static void
-prep_pipe(data_t *data, igt_crtc_t *crtc)
+prep_crtc(data_t *data, igt_crtc_t *crtc)
 {
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
@@ -451,7 +451,7 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
 	int i = 0;
 
 	igt_display_reset(&data->display);
-	prep_pipe(data, crtc);
+	prep_crtc(data, crtc);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
@@ -485,7 +485,7 @@ static int test_setup(data_t *data, igt_crtc_t *crtc)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
+run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
 {
 	int port_idx = test_setup(data,
@@ -497,7 +497,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, crtc))
+	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
 	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
@@ -505,7 +505,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 }
 
 static void
-run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
+run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       color_t *expected_colors,
 		       double *ctm,
 		       int iter)
@@ -536,7 +536,7 @@ run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, crtc))
+	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
 	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
@@ -572,7 +572,7 @@ run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 }
 
 static void
-run_limited_range_ctm_test_for_pipe(data_t *data, igt_crtc_t *crtc,
+run_limited_range_ctm_test_for_crtc(data_t *data, igt_crtc_t *crtc,
 				    bool (*test_t)(data_t*, igt_plane_t*, struct chamelium_port*))
 {
 	int port_idx = test_setup(data,
@@ -585,7 +585,7 @@ run_limited_range_ctm_test_for_pipe(data_t *data, igt_crtc_t *crtc,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	if (!pipe_output_combo_valid(data, crtc))
+	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
 	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
@@ -687,7 +687,7 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
-				run_gamma_degamma_tests_for_pipe(data,
+				run_gamma_degamma_tests_for_crtc(data,
 								 crtc,
 								 gamma_degamma_tests[i].test_t);
 			}
@@ -698,7 +698,7 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
-				run_ctm_tests_for_pipe(data,
+				run_ctm_tests_for_crtc(data,
 						       crtc,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
@@ -710,7 +710,7 @@ run_tests_for_pipe(data_t *data)
 	igt_describe("Compare after applying ctm matrix & identity matrix");
 	igt_subtest_with_dynamic("ctm-limited-range") {
 		for_each_crtc(&data->display, crtc) {
-			run_limited_range_ctm_test_for_pipe(data,
+			run_limited_range_ctm_test_for_crtc(data,
 							    crtc,
 							    test_pipe_limited_range_ctm);
 		}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index f54911b204a6..565edb2dc926 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -712,7 +712,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 #endif
 
 static void
-prep_pipe(data_t *data, igt_crtc_t *crtc)
+prep_crtc(data_t *data, igt_crtc_t *crtc)
 {
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
@@ -731,7 +731,7 @@ prep_pipe(data_t *data, igt_crtc_t *crtc)
 
 static void test_setup(data_t *data, igt_crtc_t *crtc)
 {
-	prep_pipe(data, crtc);
+	prep_crtc(data, crtc);
 	igt_require_pipe_crc(data->drm_fd);
 	igt_require(crtc->n_planes >= 0);
 
@@ -749,7 +749,7 @@ static void test_cleanup(data_t *data)
 }
 
 static void
-run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
+run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
 	test_setup(data, crtc);
@@ -762,7 +762,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	igt_require(pipe_output_combo_valid(data, crtc));
+	igt_require(crtc_output_combo_valid(data, crtc));
 
 	igt_assert(test_t(data, data->primary));
 
@@ -779,7 +779,7 @@ static void transform_color(color_t *color, const double *ctm, double offset)
 }
 
 static void
-run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
+run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       const color_t *fb_colors,
 		       const double *ctm,
 		       int iter)
@@ -804,7 +804,7 @@ run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
-	igt_require(pipe_output_combo_valid(data, crtc));
+	igt_require(crtc_output_combo_valid(data, crtc));
 
 	if (!iter)
 		iter = 1;
@@ -838,7 +838,7 @@ run_ctm_tests_for_pipe(data_t *data, igt_crtc_t *crtc,
 }
 
 static void
-run_deep_color_tests_for_pipe(data_t *data, igt_crtc_t *crtc)
+run_deep_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc)
 {
 	igt_output_t *output;
 	static const color_t blue_green_blue[] = {
@@ -982,7 +982,7 @@ run_invalid_tests_for_pipe(data_t *data)
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_crtc(&data->display, crtc) {
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					prep_pipe(data,
+					prep_crtc(data,
 						  crtc);
 					tests[i].test_t(data,
 							crtc);
@@ -1128,7 +1128,7 @@ run_tests_for_pipe(data_t *data)
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
 				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_gamma_degamma_tests_for_pipe(data,
+					run_gamma_degamma_tests_for_crtc(data,
 									 crtc,
 									 gamma_degamma_tests[i].test_t);
 			}
@@ -1141,7 +1141,7 @@ run_tests_for_pipe(data_t *data)
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
 				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 					      igt_output_name(data->output))
-					run_ctm_tests_for_pipe(data,
+					run_ctm_tests_for_crtc(data,
 							       crtc,
 							       ctm_tests[i].fb_colors,
 							       ctm_tests[i].ctm,
@@ -1158,7 +1158,7 @@ run_tests_for_pipe(data_t *data)
 	igt_describe("Verify that deep color works correctly");
 	igt_subtest_with_dynamic("deep-color") {
 		for_each_crtc(&data->display, crtc) {
-			run_deep_color_tests_for_pipe(data,
+			run_deep_color_tests_for_crtc(data,
 						      crtc);
 
 			if (igt_run_in_simulation())
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 3cd282cbbee3..24663444a3f3 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,7 +24,7 @@
 
 #include "kms_color_helper.h"
 
-bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc)
+bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 {
 	bool ret = true;
 
@@ -284,7 +284,7 @@ get_blob(data_t *data, igt_crtc_t *crtc, enum igt_atomic_crtc_properties prop)
 }
 
 int
-pipe_set_property_blob_id(igt_crtc_t *crtc,
+crtc_set_property_blob_id(igt_crtc_t *crtc,
 			  enum igt_atomic_crtc_properties prop,
 			  uint32_t blob_id)
 {
@@ -304,7 +304,7 @@ pipe_set_property_blob_id(igt_crtc_t *crtc,
 }
 
 int
-pipe_set_property_blob(igt_crtc_t *crtc,
+crtc_set_property_blob(igt_crtc_t *crtc,
 		       enum igt_atomic_crtc_properties prop,
 		       void *ptr, size_t length)
 {
@@ -331,17 +331,17 @@ invalid_lut_sizes(data_t *data, igt_crtc_t *crtc,
 			    display->is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
+	igt_assert_eq(crtc_set_property_blob(crtc, prop, lut,
 					     1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
+	igt_assert_eq(crtc_set_property_blob(crtc, prop, lut,
 					     lut_size + 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
+	igt_assert_eq(crtc_set_property_blob(crtc, prop, lut,
 					     lut_size - 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
+	igt_assert_eq(crtc_set_property_blob(crtc, prop, lut,
 					     lut_size + sizeof(struct drm_color_lut)), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(crtc, prop,
+	igt_assert_eq(crtc_set_property_blob_id(crtc, prop,
 						crtc->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(crtc, prop,
+	igt_assert_eq(crtc_set_property_blob_id(crtc, prop,
 						4096 * 4096), -EINVAL);
 
 	free(lut);
@@ -371,20 +371,20 @@ void invalid_ctm_matrix_sizes(data_t *data, igt_crtc_t *crtc)
 
 	ptr = malloc(sizeof(struct drm_color_ctm) * 4);
 
-	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr, 1),
+	igt_assert_eq(crtc_set_property_blob(crtc, IGT_CRTC_CTM, ptr, 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(crtc_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) + 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(crtc_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) - 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(crtc_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) * 2),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(crtc, IGT_CRTC_CTM,
+	igt_assert_eq(crtc_set_property_blob_id(crtc, IGT_CRTC_CTM,
 						crtc->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(crtc, IGT_CRTC_CTM,
+	igt_assert_eq(crtc_set_property_blob_id(crtc, IGT_CRTC_CTM,
 						4096 * 4096), -EINVAL);
 
 	free(ptr);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index daa0a729c9c6..e2b3da61e44c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -68,7 +68,7 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
-bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc);
+bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc);
 bool panel_supports_deep_color(igt_output_t *output);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
@@ -104,10 +104,10 @@ void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop);
 drmModePropertyBlobPtr get_blob(data_t *data, igt_crtc_t *pipe,
 				enum igt_atomic_crtc_properties prop);
 bool crc_equal(igt_crc_t *a, igt_crc_t *b);
-int pipe_set_property_blob_id(igt_crtc_t *pipe,
+int crtc_set_property_blob_id(igt_crtc_t *pipe,
 			      enum igt_atomic_crtc_properties prop,
 			      uint32_t blob_id);
-int pipe_set_property_blob(igt_crtc_t *pipe,
+int crtc_set_property_blob(igt_crtc_t *pipe,
 			   enum igt_atomic_crtc_properties prop,
 			   void *ptr, size_t length);
 void invalid_gamma_lut_sizes(data_t *data, igt_crtc_t *crtc);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 3b4b857580af..d31df6ff2319 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -328,7 +328,7 @@ run_tests_for_plane(data_t *data)
 							 output) {
 				data->output = output;
 
-				if (!pipe_output_combo_valid(data, crtc))
+				if (!crtc_output_combo_valid(data, crtc))
 					continue;
 
 				test_setup(data,
-- 
2.52.0

