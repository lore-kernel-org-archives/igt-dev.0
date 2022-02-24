Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B044710EBA1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 05:17:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	manasi.d.navare@intel.com
Date: Thu, 24 Feb 2022 10:46:44 +0530
Message-Id: <20220224051648.91470-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
References: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/5] tests/kms_vrr: Create dynamic subtests
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

Create dynamic subtests with crtc/connector combinations

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 55de7cb989..8976d4a6c3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -364,7 +364,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
 
-	set_vrr_on_pipe(data, pipe, 1);
+	set_vrr_on_pipe(data, pipe, true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -414,7 +414,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, result);
 
-	set_vrr_on_pipe(data, pipe, 0);
+	set_vrr_on_pipe(data, pipe, false);
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
@@ -435,7 +435,6 @@ static void
 run_vrr_test(data_t *data, test_t test, uint32_t flags)
 {
 	igt_output_t *output;
-	bool found = false;
 
 	for_each_connected_output(&data->display, output) {
 		enum pipe pipe;
@@ -443,16 +442,15 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 		if (!has_vrr(output))
 			continue;
 
-		for_each_pipe(&data->display, pipe)
+		for_each_pipe(&data->display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
-				test(data, pipe, output, flags);
-				found = true;
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
+					test(data, pipe, output, flags);
 				break;
 			}
+		}
 	}
-
-	if (!found)
-		igt_skip("No vrr capable outputs found.\n");
 }
 
 igt_main
@@ -471,21 +469,21 @@ igt_main
 
 	igt_describe("Tests that VRR is enabled and that the difference between flip "
 		     "timestamps converges to the requested rate");
-	igt_subtest("flip-basic")
+	igt_subtest_with_dynamic("flip-basic")
 		run_vrr_test(&data, test_basic, 0);
 
 	igt_describe("Tests with DPMS that VRR is enabled and that the difference between flip "
 		     "timestamps converges to the requested rate.");
-	igt_subtest("flip-dpms")
+	igt_subtest_with_dynamic("flip-dpms")
 		run_vrr_test(&data, test_basic, TEST_DPMS);
 
 	igt_describe("Tests that VRR is enabled and that the difference between flip "
 		     "timestamps converges to the requested rate in a suspend test");
-	igt_subtest("flip-suspend")
+	igt_subtest_with_dynamic("flip-suspend")
 		run_vrr_test(&data, test_basic, TEST_SUSPEND);
 
 	igt_describe("Make sure that flips happen at flipline decision boundary.");
-	igt_subtest("flipline")
+	igt_subtest_with_dynamic("flipline")
 		run_vrr_test(&data, test_basic, TEST_FLIPLINE);
 
 	igt_fixture {
-- 
2.35.0
