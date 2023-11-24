Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F510E796
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 02:06:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 07:46:23 +0530
Message-Id: <20231124021623.21746-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vrr: New subtest for toggle VRR
 during fastsets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Allow VRR to be toggled during fastsets, without
the need of full modeset.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index f26adbccf..843740858 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -37,6 +37,13 @@
  * Mega feature: VRR
  * Test category: functionality test
  *
+ * SUBTEST: flip-basic-fastset
+ * Description: Tests that VRR basic without modeset
+ * Driver requirement: i915, xe
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Test category: functionality test
+ *
  * SUBTEST: flip-dpms
  * Description: Tests with DPMS that VRR is enabled and that the difference
  *              between flip timestamps converges to the requested rate.
@@ -88,7 +95,8 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
-	TEST_NEGATIVE = 1 << 4,
+	TEST_FASTSET = 1 << 4,
+	TEST_NEGATIVE = 1 << 5,
 };
 
 typedef struct range {
@@ -236,11 +244,15 @@ static bool vrr_capable(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
+static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
+			    bool need_modeset, bool enabled)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
 				enabled);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	if (need_modeset)
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 /* Prepare the display for testing on the given pipe. */
@@ -413,7 +425,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
 
-	set_vrr_on_pipe(data, pipe, true);
+	set_vrr_on_pipe(data, pipe, true, true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -479,13 +491,23 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
 
+	if (flags & TEST_FASTSET) {
+		set_vrr_on_pipe(data, pipe, false, true);
+
+		rate = vtest_ns.mid;
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     ((range.max + range.min) / 2), rate, result);
+	}
+
 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
@@ -569,6 +591,12 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Tests that VRR basic without modeset");
+	igt_subtest_with_dynamic("flip-basic-fastset") {
+		igt_require_intel(data.drm_fd);
+		run_vrr_test(&data, test_basic, TEST_FASTSET);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.39.0
