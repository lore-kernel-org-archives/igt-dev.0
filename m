Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086189BAF
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 10:18:24 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Tue,  6 Apr 2021 15:48:36 +0530
Message-Id: <20210406101836.1140295-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: Add subtest description
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
To: igt-dev@lists.freedesktop.org
Cc: Gupta@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_color.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b1b91c74..3a42532a 100644
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
 
+	igt_describe("Check the color transformation for maximum transparency");
 	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
 		color_t full_rgb[] = {
 			{ 1.0, 0.0, 0.0 },
@@ -811,6 +818,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 full_rgb, ctm));
 	}
 
+	igt_describe("Check the color transformation for negative transparency");
 	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
 		color_t all_black[] = {
 			{ 0.0, 0.0, 0.0 },
@@ -829,15 +837,20 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		test_pipe_limited_range_ctm(data, primary);
 #endif
 
+	igt_describe("Verify that degamma LUT transformation works correctly");
 	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
 		test_pipe_degamma(data, primary);
 
+	igt_describe("Verify that gamma LUT transformation works correctly");
 	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
 		test_pipe_gamma(data, primary);
 
+	igt_describe("Verify that legacy gamma LUT transformation works correctly");
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
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
