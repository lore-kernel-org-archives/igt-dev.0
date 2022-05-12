Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004ED10FBFA
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 11:00:50 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 16:31:12 +0530
Message-Id: <20220512110113.31158-4-jeevan.b@intel.com>
In-Reply-To: <20220512110113.31158-1-jeevan.b@intel.com>
References: <20220512110113.31158-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/4] tests/kms_ccs: Add dg2 tiled-4 ccs
 modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

I915_FORMAT_MOD_4_TILED_DG2_RC_CCS
I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC

modifier added for testing and prevent impossible ccs test from
flat ccs, fb generation for FB_HAS_PLANE will use linear modifier
instead if Y-modifier as its no longer supported for latest platform.

v2: Modified commit message. (Petri)

Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_ccs.c | 62 +++++++++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 716be5b6..39bf6d58 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -98,10 +98,29 @@ static const struct {
 	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y_tiled_gen12_rc_ccs"},
 	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y_tiled_gen12_rc_ccs_cc"},
 	{I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y_tiled_gen12_mc_ccs"},
+	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4_tiled_dg2_rc_ccs"},
+	{I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4_tiled_dg2_mc_ccs"},
+	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4_tiled_dg2_rc_ccs_cc"},
 };
 
 static bool check_ccs_planes;
 
+static const struct {
+	const enum test_flags	flags;
+	const char		*testname;
+	const char		*description;
+} tests[] = {
+	{TEST_BAD_PIXEL_FORMAT, "bad-pixel-format", "Test bad pixel format with given CCS modifier"},
+	{TEST_BAD_ROTATION_90, "bad-rotation-90", "Test 90 degree rotation with given CCS modifier"},
+	{TEST_CRC, "crc-primary-basic", "Test primary plane CRC compatibility with given CCS modifier"},
+	{TEST_CRC | TEST_ROTATE_180, "crc-primary-rotation-180", "Test 180 degree rotation with given CCS modifier"},
+	{TEST_RANDOM, "random-ccs-data", "Test random CCS data"},
+	{TEST_NO_AUX_BUFFER, "missing-ccs-buffer", "Test missing CCS buffer with given CCS modifier"},
+	{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
+	{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
+	{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
+};
+
 /*
  * Limit maximum used sprite plane width so this test will not mistakenly
  * fail on hardware limitations which are not interesting to this test.
@@ -141,7 +160,8 @@ create_fb_prepare_add(int drm_fd, int width, int height,
 
 static bool is_ccs_cc_modifier(uint64_t modifier)
 {
-	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
+	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
 }
 
 /*
@@ -256,12 +276,14 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
 	 * an incorrect stride with the same delta as on earlier platforms.
 	 */
 	if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
+		igt_skip_on_f(HAS_FLATCCS(intel_get_drm_devid(data->drm_fd)), "No aux plane on flat ccs.\n");
 		igt_skip_on_f(width <= 1024,
 			      "FB already has the smallest possible stride\n");
 		f.pitches[ccs_plane] -= 64;
 	}
 
 	if (fb_flags & FB_SMALL_AUX_STRIDE) {
+		igt_skip_on_f(HAS_FLATCCS(intel_get_drm_devid(data->drm_fd)), "No aux plane on flat ccs.\n");
 		igt_skip_on_f(width <= 1024,
 			      "FB already has the smallest possible stride\n");
 		f.pitches[ccs_plane] = ALIGN(f.pitches[ccs_plane] / 2, 128);
@@ -277,6 +299,7 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
 	}
 
 	if (data->flags & TEST_NO_AUX_BUFFER) {
+		igt_skip_on_f(HAS_FLATCCS(intel_get_drm_devid(data->drm_fd)), "No aux plane on flat ccs.\n");
 		f.handles[ccs_plane] = 0;
 		f.modifier[ccs_plane] = 0;
 		f.pitches[ccs_plane] = 0;
@@ -363,7 +386,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 				   colors[!!data->plane].b,
 				   1.0};
 
-	/* Use either compressed or Y-tiled to test. However, given the lack of
+	/* Use either compressed or linear to test. However, given the lack of
 	 * available bandwidth, we use linear for the primary plane when
 	 * testing sprites, since we cannot fit two CCS planes into the
 	 * available FIFO configurations.
@@ -371,7 +394,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	if (fb_flags & FB_COMPRESSED)
 		modifier = data->ccs_modifier;
 	else if (!(fb_flags & FB_HAS_PLANE))
-		modifier = I915_FORMAT_MOD_Y_TILED;
+		modifier = DRM_FORMAT_MOD_LINEAR;
 	else
 		modifier = 0;
 
@@ -563,9 +586,11 @@ static int test_ccs(data_t *data)
 	return valid_tests;
 }
 
-static void test_output(data_t *data, const char* testformatstring)
+static void test_output(data_t *data, const int testnum)
 {
 	igt_fixture {
+		data->flags = tests[testnum].flags;
+
 		data->output = igt_get_single_output_for_pipe(&data->display,
 							      data->pipe);
 		igt_require(data->output);
@@ -573,10 +598,17 @@ static void test_output(data_t *data, const char* testformatstring)
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
+		if ((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
+		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
+		    tests[testnum].flags & TEST_BAD_CCS_PLANE)
+		    continue;
+
 		data->ccs_modifier = ccs_modifiers[i].modifier;
 
+		igt_describe(tests[testnum].description);
 		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
-			      testformatstring, ccs_modifiers[i].str ) {
+			      tests[testnum].testname, ccs_modifiers[i].str) {
 			int valid_tests = 0;
 			igt_require(data->output);
 
@@ -643,22 +675,6 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 {
 	enum pipe pipe;
 
-	const struct {
-		const enum test_flags	flags;
-		const char		*testname;
-		const char		*description;
-	} tests[] = {
-		{TEST_BAD_PIXEL_FORMAT, "bad-pixel-format", "Test bad pixel format with given CCS modifier"},
-		{TEST_BAD_ROTATION_90, "bad-rotation-90", "Test 90 degree rotation with given CCS modifier"},
-		{TEST_CRC, "crc-primary-basic", "Test primary plane CRC compatibility with given CCS modifier"},
-		{TEST_CRC | TEST_ROTATE_180, "crc-primary-rotation-180", "Test 180 degree rotation with given CCS modifier"},
-		{TEST_RANDOM, "random-ccs-data", "Test random CCS data"},
-		{TEST_NO_AUX_BUFFER, "missing-ccs-buffer", "Test missing CCS buffer with given CCS modifier"},
-		{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
-		{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
-		{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
-	};
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
@@ -678,9 +694,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 
 		igt_subtest_group {
 			for (int c = 0; c < ARRAY_SIZE(tests); c++) {
-				data.flags = tests[c].flags;
-				igt_describe(tests[c].description);
-				test_output(&data, tests[c].testname);
+				test_output(&data, c);
 			}
 		}
 	}
-- 
2.36.0
