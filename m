Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8658A6E03D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 02:39:42 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Mon, 12 Apr 2021 02:39:39 +0000
Message-ID: <efc2cfcf4e994af48e680f5e9d0bc833@intel.com>
References: <20210409171352.1570240-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210409171352.1570240-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Added tests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Hagaragi, Arundhati <arundhati.hagaragi@intel.com> 
Sent: Friday, April 9, 2021 10:44 PM
To: igt-dev@lists.freedesktop.org
Cc: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>; Gupta; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Subject: [PATCH i-g-t] Added tests description

Added description for following kms tests:
   tests/kms_color.c
   tests/kms_dp_dsc.c
   tests/kms_flip.c
   tests/kms_flip_tiling.c
   tests/kms_psr.c

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>

The descriptions looks good to me.
Reviewed-by: Nidhi Gupta
---
 tests/kms_color.c       | 16 ++++++++++++++++
 tests/kms_dp_dsc.c      |  3 ++-
 tests/kms_flip.c        |  5 +++++
 tests/kms_flip_tiling.c | 10 +++++++++-
 tests/kms_psr.c         | 12 ++++++++++++
 5 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c index b1b91c74..3a42532a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -687,6 +687,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
 
+	igt_describe("Check the color transformation from red to blue");
 	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
 		color_t blue_green_blue[] = {
 			{ 0.0, 0.0, 1.0 },
@@ -700,6 +701,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 blue_green_blue, ctm));
 	}
 
+	igt_describe("Check the color transformation from green to red");
 	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
 		color_t red_red_blue[] = {
 			{ 1.0, 0.0, 0.0 },
@@ -713,6 +715,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 red_red_blue, ctm));
 	}
 
+	igt_describe("Check the color transformation from blue to red");
 	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
 		color_t red_green_red[] = {
 			{ 1.0, 0.0, 0.0 },
@@ -730,6 +733,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	 * the it depends on the hardware we're dealing with, we can
 	 * either get clamped or rounded values and we also need to
 	 * account for odd number of items in the LUTs. */
+	igt_describe("Check the color transformation for 0.25 transparency");
 	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
@@ -751,6 +755,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
+	igt_describe("Check the color transformation for 0.5 transparency");
 	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
@@ -772,6 +777,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
+	igt_describe("Check the color transformation for 0.75 transparency");
 	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
@@ -793,6 +799,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
+	igt_describe("Check the color transformation for maximum 
+transparency");
 	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
 		color_t full_rgb[] = {
 			{ 1.0, 0.0, 0.0 },
@@ -811,6 +818,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 full_rgb, ctm));
 	}
 
+	igt_describe("Check the color transformation for negative 
+transparency");
 	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
 		color_t all_black[] = {
 			{ 0.0, 0.0, 0.0 },
@@ -829,15 +837,20 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		test_pipe_limited_range_ctm(data, primary);  #endif
 
+	igt_describe("Verify that degamma LUT transformation works 
+correctly");
 	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
 		test_pipe_degamma(data, primary);
 
+	igt_describe("Verify that gamma LUT transformation works correctly");
 	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
 		test_pipe_gamma(data, primary);
 
+	igt_describe("Verify that legacy gamma LUT transformation works 
+correctly");
 	igt_subtest_f("pipe-%s-legacy-gamma", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma(data, primary);
 
+	igt_describe("Verify that setting the legacy gamma LUT resets the gamma LUT set through "
+			"GAMMA_LUT property");
 	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma_reset(data, primary);
 
@@ -870,12 +883,15 @@ igt_main
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 
+	igt_describe("Negative check for invalid gamma lut sizes");
 	igt_subtest_f("pipe-invalid-gamma-lut-sizes")
 		invalid_gamma_lut_sizes(&data);
 
+	igt_describe("Negative check for invalid degamma lut sizes");
 	igt_subtest_f("pipe-invalid-degamma-lut-sizes")
 		invalid_degamma_lut_sizes(&data);
 
+	igt_describe("Negative check for color tranformation matrix sizes");
 	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
 		invalid_ctm_matrix_sizes(&data);
 
diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c index e2e3aaa0..60ed3855 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -271,7 +271,8 @@ igt_main
 	}
 
 	for (test_cnt = 0; test_cnt < ARRAY_SIZE(tests); test_cnt++) {
-
+		igt_describe("Validate display stream compression functionality if supported on "
+			       "DP/eDP connector");
 		igt_subtest_f("basic-dsc-enable-%s",
 			      kmstest_connector_type_str(tests[test_cnt])) {
 			test_conn_cnt = 0;
diff --git a/tests/kms_flip.c b/tests/kms_flip.c index e0d009d2..64907c2c 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1667,10 +1667,12 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests that nonblocking reading fails correctly");
 	igt_subtest("nonblocking-read")
 		test_nonblocking_read(drm_fd);
 
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		igt_describe("Basic test for validating modeset, dpms and 
+pageflips");
 		igt_subtest_with_dynamic_f("%s%s",
 			      tests[i].flags & TEST_BASIC ? "basic-" : "",
 			      tests[i].name)
@@ -1679,6 +1681,7 @@ igt_main
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
+		igt_describe("Test for validating modeset, dpms and pageflips with a 
+pair of connected displays");
 		igt_subtest_with_dynamic_f("2x-%s", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
@@ -1705,12 +1708,14 @@ igt_main
 		if (tests[i].flags & (TEST_EINVAL | TEST_EBUSY | TEST_HANG))
 			continue;
 
+		igt_describe("Interrupt test for validating modeset, dpms and 
+pageflips");
 		igt_subtest_with_dynamic_f("%s-interruptible", tests[i].name)
 			run_test(tests[i].duration, tests[i].flags);
 
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
+		 igt_describe("Interrupt test for validating modeset, dpms and 
+pageflips with pair of connected displays");
 		igt_subtest_with_dynamic_f("2x-%s-interruptible", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c index 7a736fba..09e99580 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -173,6 +173,7 @@ igt_main
 	 * generated and compared to the reference one.
 	 */
 
+	igt_describe("Check pageflip from tiled buffer to linear one works 
+correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE }; @@ -187,6 +188,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to linear one works 
+correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE }; @@ -205,7 +207,7 @@ igt_main
 		}
 	}
 
-
+	igt_describe("Check pageflip from tiled buffer to linear one works 
+correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE }; @@ -232,6 +234,7 @@ igt_main
 	 * reference one.
 	 */
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one 
+works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_I915_FORMAT_MOD_X_TILED }; @@ -246,6 +249,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one 
+works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED }; @@ -264,6 +268,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from tiled buffer to another tiled one 
+works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED }; @@ -290,6 +295,7 @@ igt_main
 	 * reference one.
 	 */
 
+	igt_describe("Check pageflip from linear buffer to tiled one works 
+correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_X_TILED }; @@ -304,6 +310,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from linear buffer to tiled one works 
+correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED }; @@ -322,6 +329,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Check pageflip from linear buffer to tiled one works 
+correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED }; diff --git a/tests/kms_psr.c b/tests/kms_psr.c index 4b7513d7..a80abf19 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -480,12 +480,14 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 	for (data.op_psr_mode = PSR_MODE_1; data.op_psr_mode <= PSR_MODE_2;
 	     data.op_psr_mode++) {
 
+		igt_describe("Basic check for psr if it is detecting changes made in 
+planes");
 		igt_subtest_f("%sbasic", append_subtest_name[data.op_psr_mode]) {
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			test_setup(&data);
 			test_cleanup(&data);
 		}
 
+		igt_describe("Check if psr is detecting changes when drrs is 
+disabled");
 		igt_subtest_f("%sno_drrs", append_subtest_name[data.op_psr_mode]) {
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			test_setup(&data);
@@ -494,6 +496,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = PAGE_FLIP; op <= RENDER; op++) {
+			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
+					"rendering operations performed on primary planes");
 			igt_subtest_f("%sprimary_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -506,6 +510,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
+			igt_describe("Check if psr is detecting memory mapping,rendering "
+					"and plane operations performed on sprite planes");
 			igt_subtest_f("%ssprite_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -516,6 +522,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 				test_cleanup(&data);
 			}
 
+			igt_describe("Check if psr is detecting memory mapping, rendering "
+					"and plane operations performed on cursor planes");
 			igt_subtest_f("%scursor_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -527,6 +535,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Check if psr is detecting changes when rendering operation is performed"
+				"  with dpms enabled or disabled");
 		igt_subtest_f("%sdpms", append_subtest_name[data.op_psr_mode]) {
 			data.op = RENDER;
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY; @@ -536,6 +546,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			test_cleanup(&data);
 		}
 
+		igt_describe("Check if psr is detecting changes when plane operation is performed "
+				"with suspend resume cycles");
 		igt_subtest_f("%ssuspend", append_subtest_name[data.op_psr_mode]) {
 			data.op = PLANE_ONOFF;
 			data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
