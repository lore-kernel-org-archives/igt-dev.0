Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3963F10E074
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 06:15:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:34:59 +0530
Message-Id: <20231127060500.2517204-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_vrr: New subtest for toggle VRR
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

Allow VRR to be toggled during fastsets, without full modeset.
This patch enables 'flip-basic' subtest to verify fastset too.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 13b347631..4e02e4aee 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -40,6 +40,10 @@
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
@@ -77,7 +81,8 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
-	TEST_NEGATIVE = 1 << 4,
+	TEST_FASTSET = 1 << 4,
+	TEST_NEGATIVE = 1 << 5,
 };
 
 typedef struct range {
@@ -225,11 +230,15 @@ static bool vrr_capable(igt_output_t *output)
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
@@ -402,7 +411,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
 
-	set_vrr_on_pipe(data, pipe, true);
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -468,7 +477,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
+	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
@@ -558,6 +567,13 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Tests that VRR is enabled without modeset and that the difference "
+		     "between flip timestamps converges to the requested rate");
+	igt_subtest_with_dynamic("flip-basic-fastset") {
+		igt_require_intel(data.drm_fd);
+		run_vrr_test(&data, test_basic, TEST_FASTSET);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.40.0
