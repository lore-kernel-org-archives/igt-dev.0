Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5153110E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 07:52:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	vidya.srinivas@intel.com
Date: Mon,  4 Dec 2023 13:11:09 +0530
Message-Id: <20231204074111.3167784-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
References: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 7/9] tests/kms_vrr: Add new subtest to switch
 RR without modeset
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

Add new subtest to switch between low refresh rate to high
refresh rate and vice versa seamlessly without modeset.

Below are the sequence of operations to perform:

1. Use High RR mode + VRR On  -> Measure vblank timings
2. Switch to Low RR mode -> Measure vblank timings
3. Switch back to High RR mode -> Measure vblank timings

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 95 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 26f89f7a8..74f1b0d09 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -53,6 +53,10 @@
  * SUBTEST: flipline
  * Description: Make sure that flips happen at flipline decision boundary.
  *
+ * SUBTEST: seamless-rr-switch-vrr
+ * Description: Test to switch RR seamlessly without modeset.
+ * Functionality: adaptive_sync, lrr
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -70,7 +74,14 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
-	TEST_NEGATIVE = 1 << 4,
+	TEST_SEAMLESS_VRR = 1 << 4,
+	TEST_NEGATIVE = 1 << 5,
+};
+
+enum {
+	HIGH_RR_MODE,
+	LOW_RR_MODE,
+	RR_MODES_COUNT,
 };
 
 typedef struct range {
@@ -85,6 +96,7 @@ typedef struct data {
 	igt_fb_t fb0;
 	igt_fb_t fb1;
 	range_t range;
+	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 } data_t;
 
 typedef struct vtest_ns {
@@ -397,6 +409,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
+	igt_info("Override Mode: ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	set_vrr_on_pipe(data, pipe, true);
 
@@ -472,6 +486,53 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
 }
 
+static void
+test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint32_t result;
+	vtest_ns_t vtest_ns;
+	uint64_t rate;
+
+	igt_info("Use HIGH_RR Mode as default: ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
+	prepare_test(data, output, pipe);
+	vtest_ns = get_test_rate_ns(data->range);
+
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	rate = vtest_ns.max;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+		     data->range.max, rate, result);
+
+	/* Switch to low rr mode without modeset. */
+	igt_info("Switch to LOW_RR Mode: ");
+	kmstest_dump_mode(&data->switch_modes[LOW_RR_MODE]);
+	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	rate = vtest_ns.min;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+		     data->range.min, rate, result);
+
+	/* Switch back to high rr mode without modeset. */
+	igt_info("Switch back to HIGH_RR Mode: ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	rate = vtest_ns.mid;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+		     ((data->range.max + data->range.min) / 2), rate, result);
+}
+
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
@@ -484,9 +545,11 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
-static bool output_constraint(data_t *data, igt_output_t *output)
+static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	drmModeModeInfo mode;
+	if ((flags & TEST_SEAMLESS_VRR) &&
+	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
 
 	/* Reset output */
 	igt_display_reset(&data->display);
@@ -499,16 +562,22 @@ static bool output_constraint(data_t *data, igt_output_t *output)
 	 *   - vrr_min range should be less than the override mode vrefresh.
 	 *   - Limit the vrr_max range with the override mode vrefresh.
 	 */
-	mode = output_mode_with_maxrate(output, data->range.max);
-	if (mode.vrefresh < data->range.min)
+	data->switch_modes[HIGH_RR_MODE] = output_mode_with_maxrate(output, data->range.max);
+	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min)
 		return false;
 
-	data->range.max = mode.vrefresh;
+	data->range.max = data->switch_modes[HIGH_RR_MODE].vrefresh;
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
-	igt_info("Override Mode: ");
-	kmstest_dump_mode(&mode);
+	/* Search for a low refresh rate mode. */
+	if (!(flags & TEST_SEAMLESS_VRR))
+		return true;
 
-	igt_output_override_mode(output, &mode);
+	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
+	if (data->switch_modes[LOW_RR_MODE].vrefresh == data->switch_modes[HIGH_RR_MODE].vrefresh)
+		return false;
+
+	data->range.min = data->switch_modes[LOW_RR_MODE].vrefresh;
 
 	return true;
 }
@@ -525,7 +594,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
 		return false;
 
-	if (!output_constraint(data, output))
+	if (!output_constraint(data, output, flags))
 		return false;
 
 	return true;
@@ -601,6 +670,12 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Test to switch RR seamlessly without modeset.");
+	igt_subtest_with_dynamic("seamless-rr-switch-vrr"){
+		igt_require_intel(data.drm_fd);
+		run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_VRR);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.40.0
