Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E86E10E6F0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 04:48:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V8 6/7] tests/kms_vrr: Add new subtest for DRRS without modeset
Date: Wed, 13 Dec 2023 10:07:40 +0530
Message-Id: <20231213043741.3640374-7-bhanuprakash.modem@intel.com>
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
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test is same as 'kms_vrr@seamless-rr-switch-vrr' but
performs on DRRS panel without enabling the VRR.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 69 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6cb5a9b10..de2ee13c7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -31,6 +31,7 @@
  */
 
 #include "igt.h"
+#include "i915/intel_drrs.h"
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
@@ -57,6 +58,10 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Functionality: adaptive_sync, lrr
  *
+ * SUBTEST: seamless-rr-switch-drrs
+ * Description: Test to switch RR seamlessly without modeset.
+ * Functionality: adaptive_sync, drrs
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -75,7 +80,8 @@ enum {
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
 	TEST_SEAMLESS_VRR = 1 << 4,
-	TEST_NEGATIVE = 1 << 5,
+	TEST_SEAMLESS_DRRS = 1 << 5,
+	TEST_NEGATIVE = 1 << 6,
 };
 
 enum {
@@ -492,24 +498,27 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	uint32_t result;
 	vtest_ns_t vtest_ns;
 	uint64_t rate;
+	bool vrr = !!(flags & TEST_SEAMLESS_VRR);
 
-	igt_info("Use HIGH_RR Mode as default: ");
+	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	prepare_test(data, output, pipe);
 	vtest_ns = get_test_rate_ns(data->range);
 
-	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
-	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+	if (vrr) {
+		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
+		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+	}
 
 	rate = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-		     data->range.max, rate, result);
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
+		     data->range.max, rate, vrr ? "on" : "off", result);
 
 	/* Switch to low rr mode without modeset. */
-	igt_info("Switch to LOW_RR Mode: ");
+	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[LOW_RR_MODE]);
 	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
@@ -517,25 +526,28 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	rate = vtest_ns.min;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-		     data->range.min, rate, result);
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
+		     data->range.min, rate, vrr ? "on" : "off", result);
 
 	/* Switch back to high rr mode without modeset. */
-	igt_info("Switch back to HIGH_RR Mode: ");
+	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-		     ((data->range.max + data->range.min) / 2), rate, result);
+	igt_assert_f(vrr ? (result > 75) : (result < 10),
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
+		     ((data->range.max + data->range.min) / 2), rate,
+		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
 }
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+	if (vrr_capable(output))
+		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
@@ -547,10 +559,16 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	if ((flags & TEST_SEAMLESS_VRR) &&
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
+	if ((flags & TEST_SEAMLESS_DRRS) &&
+	    !intel_output_has_drrs(data->drm_fd, output)) {
+		igt_info("Selected panel won't support DRRS.\n");
+		return false;
+	}
+
 	/* Reset output */
 	igt_display_reset(&data->display);
 
@@ -570,7 +588,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & TEST_SEAMLESS_VRR))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
@@ -587,6 +605,9 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	if (!has_vrr(output))
 		return false;
 
+	if (flags & TEST_SEAMLESS_DRRS)
+		goto out;
+
 	/* For Negative tests, panel should be non-vrr. */
 	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
 		return false;
@@ -594,6 +615,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
 		return false;
 
+out:
 	if (!output_constraint(data, output, flags))
 		return false;
 
@@ -670,10 +692,17 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
-	igt_describe("Test to switch RR seamlessly without modeset.");
-	igt_subtest_with_dynamic("seamless-rr-switch-vrr"){
-		igt_require_intel(data.drm_fd);
-		run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_VRR);
+	igt_subtest_group {
+		igt_fixture
+			igt_require_intel(data.drm_fd);
+
+		igt_describe("Test to switch RR seamlessly without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-vrr")
+			run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_VRR);
+
+		igt_describe("Test to switch RR seamlessly without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-drrs")
+			run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_DRRS);
 	}
 
 	igt_fixture {
-- 
2.40.0
