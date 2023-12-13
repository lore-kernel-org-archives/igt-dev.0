Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927810E6F2
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 04:48:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V8 7/7] tests/kms_vrr: New subtest for toggle VRR during
 fastsets
Date: Wed, 13 Dec 2023 10:07:41 +0530
Message-Id: <20231213043741.3640374-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
References: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow VRR to be toggled during fastsets, without full modeset.
This patch enables 'kms_vrr@flip-basic' subtest to verify fastset
too.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index de2ee13c7..1ace970a5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -41,6 +41,10 @@
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
  *
+ * SUBTEST: flip-basic-fastset
+ * Description: Tests that VRR is enabled without modeset and that the difference
+ *              between flip timestamps converges to the requested rate
+ *
  * SUBTEST: flip-dpms
  * Description: Tests with DPMS that VRR is enabled and that the difference
  *              between flip timestamps converges to the requested rate.
@@ -81,7 +85,8 @@ enum {
 	TEST_FLIPLINE = 1 << 3,
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
-	TEST_NEGATIVE = 1 << 6,
+	TEST_FASTSET = 1 << 6,
+	TEST_NEGATIVE = 1 << 7,
 };
 
 enum {
@@ -253,11 +258,15 @@ static bool vrr_capable(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
+static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
+			    bool need_modeset, bool enabled)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
 				enabled);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_assert(igt_display_try_commit_atomic(&data->display,
+						 need_modeset ? DRM_MODE_ATOMIC_ALLOW_MODESET : 0,
+						 NULL) == 0);
 }
 
 /* Prepare the display for testing on the given pipe. */
@@ -418,7 +427,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("Override Mode: ");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
-	set_vrr_on_pipe(data, pipe, true);
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -484,7 +493,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
@@ -506,10 +515,8 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	prepare_test(data, output, pipe);
 	vtest_ns = get_test_rate_ns(data->range);
 
-	if (vrr) {
-		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
-		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
-	}
+	if (vrr)
+		set_vrr_on_pipe(data, pipe, false, true);
 
 	rate = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
@@ -703,6 +710,11 @@ igt_main
 		igt_describe("Test to switch RR seamlessly without modeset.");
 		igt_subtest_with_dynamic("seamless-rr-switch-drrs")
 			run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_DRRS);
+
+		igt_describe("Tests that VRR is enabled without modeset and that the difference "
+			     "between flip timestamps converges to the requested rate");
+		igt_subtest_with_dynamic("flip-basic-fastset")
+			run_vrr_test(&data, test_basic, TEST_FASTSET);
 	}
 
 	igt_fixture {
-- 
2.40.0
