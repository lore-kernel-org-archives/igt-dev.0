Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C109310E5B5
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:21 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:53 +0300
Message-Id: <20230411161555.10001-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 8/9] tests/kms_color: Move dynamic
 subtests up one level
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

Move the igt_dynamic_f() up one level so that the whole subtests
doesn't skip if some pipe is missing a suitable output. We want
to skip only the dynamic subtest.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 76 +++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 1ec097953c9d..e35dccea1a61 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -736,8 +736,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	if (!pipe_output_combo_valid(data, p))
 		goto out;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
-		igt_assert(test_t(data, data->primary));
+	igt_assert(test_t(data, data->primary));
 
 out:
 	test_cleanup(data);
@@ -758,7 +757,9 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		       const double *ctm,
 		       int iter)
 {
+	bool success = false;
 	double delta;
+	int i;
 
 	test_setup(data, p);
 
@@ -777,35 +778,30 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	if (!iter)
 		iter = 1;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
-		bool success = false;
-		int i;
-
-		/*
-		 * We tests a few values around the expected result because
-		 * it depends on the hardware we're dealing with, we can either
-		 * get clamped or rounded values and we also need to account
-		 * for odd number of items in the LUTs.
-		 */
-		for (i = 0; i < iter; i++) {
-			color_t expected_colors[3] = {
-				fb_colors[0],
-				fb_colors[1],
-				fb_colors[2],
-			};
-
-			transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
-			transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
-			transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
-
-			if (test_pipe_ctm(data, data->primary, fb_colors,
-					  expected_colors, ctm)) {
-				success = true;
-				break;
-			}
+	/*
+	 * We tests a few values around the expected result because
+	 * it depends on the hardware we're dealing with, we can either
+	 * get clamped or rounded values and we also need to account
+	 * for odd number of items in the LUTs.
+	 */
+	for (i = 0; i < iter; i++) {
+		color_t expected_colors[3] = {
+			fb_colors[0],
+			fb_colors[1],
+			fb_colors[2],
+		};
+
+		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+		if (test_pipe_ctm(data, data->primary, fb_colors,
+				  expected_colors, ctm)) {
+			success = true;
+			break;
 		}
-		igt_assert(success);
 	}
+	igt_assert(success);
 
 out:
 	test_cleanup(data);
@@ -927,10 +923,10 @@ run_invalid_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
-				prep_pipe(data, pipe);
-
-				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					prep_pipe(data, pipe);
 					tests[i].test_t(data, pipe);
+				}
 			}
 		}
 	}
@@ -1070,8 +1066,10 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
-				run_gamma_degamma_tests_for_pipe(data, pipe,
-								 gamma_degamma_tests[i].test_t);
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					run_gamma_degamma_tests_for_pipe(data, pipe,
+									 gamma_degamma_tests[i].test_t);
+				}
 			}
 		}
 	}
@@ -1080,10 +1078,12 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
-				run_ctm_tests_for_pipe(data, pipe,
-						       ctm_tests[i].fb_colors,
-						       ctm_tests[i].ctm,
-						       ctm_tests[i].iter);
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					run_ctm_tests_for_pipe(data, pipe,
+							       ctm_tests[i].fb_colors,
+							       ctm_tests[i].ctm,
+							       ctm_tests[i].iter);
+				}
 			}
 		}
 	}
-- 
2.39.2
