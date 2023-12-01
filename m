Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7210E7BD
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 04:11:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 09:31:18 +0530
Message-Id: <20231201040119.2954812-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201040119.2954812-1-bhanuprakash.modem@intel.com>
References: <20231201040119.2954812-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 6/7] tests/kms_vrr: Add new subtest to switch
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

With VRR:
+---------------------------+
| Step | VRR  | Mode | Flip |
+------+------+------+------+
| 1    | Off  | High | Yes  |
| 2    | On   | Low  | Yes  |
| 3    | On   | High | Yes  |
| 4    | Off  | High | No   |
+------+------+------+------+

Without VRR:
+---------------------------+
| Step | VRR  | Mode | Flip |
+------+------+------+------+
| 1    | Off  | High | Yes  |
| 2    | Off  | Low  | Yes  |
| 3    | Off  | High | Yes  |
+------+------+------+------+

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 137 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 126 insertions(+), 11 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1809164eb..1361194af 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -53,6 +53,10 @@
  * SUBTEST: flipline
  * Description: Make sure that flips happen at flipline decision boundary.
  *
+ * SUBTEST: seamless-rr-switch
+ * Description: Test to switch RR seamlessly without modeset.
+ * Functionality: adaptive_sync, drrs, lrr
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -70,7 +74,14 @@ enum {
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_FLIPLINE = 1 << 3,
-	TEST_NEGATIVE = 1 << 4,
+	TEST_SEAMLESS_RR = 1 << 4,
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
@@ -166,6 +178,24 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
 	return mode;
 }
 
+static drmModeModeInfo
+low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
+{
+	int i;
+	drmModeConnectorPtr connector = output->config.connector;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	for (i = 0; i < connector->count_modes; i++)
+		/* TODO: Improve checks for downclock */
+		if (connector->modes[i].hdisplay == mode.hdisplay &&
+		    connector->modes[i].vdisplay == mode.vdisplay &&
+		    connector->modes[i].vrefresh < mode.vrefresh &&
+		    connector->modes[i].vrefresh >= vrr_min)
+			mode = connector->modes[i];
+
+	return mode;
+}
+
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
@@ -378,6 +408,9 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
 
+	igt_info("Override Mode: ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
 	set_vrr_on_pipe(data, pipe, true);
 
 	/*
@@ -454,7 +487,9 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+	if (vrr_capable(output))
+		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
@@ -464,9 +499,65 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
-static bool output_constraint(data_t *data, igt_output_t *output)
+static void
+test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
-	drmModeModeInfo mode;
+	uint32_t result;
+	vtest_ns_t vtest_ns;
+	uint64_t rate;
+	bool vrr = vrr_capable(output);
+
+	igt_info("Use HIGH_RR Mode as default (VRR: OFF): ");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
+	prepare_test(data, output, pipe);
+	vtest_ns = get_test_rate_ns(data->range);
+
+	rate = vtest_ns.max;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off threshold not reached, result was %u%%\n",
+		     data->range.max, rate, result);
+
+	/* Switch to low rr mode without modeset. */
+	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
+	kmstest_dump_mode(&data->switch_modes[LOW_RR_MODE]);
+	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+	if (vrr)
+		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	rate = vtest_ns.min;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
+		     data->range.min, rate, vrr ? "on" : "off", result);
+
+	/* Switch back to high rr mode without modeset. */
+	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+	rate = vtest_ns.mid;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(vrr ? (result > 75) : (result < 10),
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
+		     ((data->range.max + data->range.min) / 2), rate,
+		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
+
+	if (vrr) {
+		igt_info("Disable VRR.\n");
+		igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, true);
+		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+	}
+}
+
+static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
+{
+	if ((flags & TEST_SEAMLESS_RR) &&
+	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
 
 	/* Reset output */
 	igt_display_reset(&data->display);
@@ -474,21 +565,35 @@ static bool output_constraint(data_t *data, igt_output_t *output)
 	/* Capture VRR range */
 	data->range = get_vrr_range(data, output);
 
+	/*
+	 * FIXME: Read the DRRS capability, currently assuming:
+	 * - Panel should contain 2 modes only
+	 * - Both modes should have the same resolution but different RR
+	 */
+	if (!vrr_capable(output) && output->config.connector->count_modes != 2)
+		return false;
+
 	/*
 	 * Override mode with max vrefresh.
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
+	if (!(flags & TEST_SEAMLESS_RR))
+		return true;
+
+	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
+	if (data->switch_modes[LOW_RR_MODE].vrefresh == data->switch_modes[HIGH_RR_MODE].vrefresh)
+		return false;
 
-	igt_output_override_mode(output, &mode);
+	data->range.min = data->switch_modes[LOW_RR_MODE].vrefresh;
 
 	return true;
 }
@@ -498,6 +603,9 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	if (!has_vrr(output))
 		return false;
 
+	if (flags & TEST_SEAMLESS_RR)
+		goto out;
+
 	/* For Negative tests, panel should be non-vrr. */
 	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
 		return false;
@@ -505,7 +613,8 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
 		return false;
 
-	if (!output_constraint(data, output))
+out:
+	if (!output_constraint(data, output, flags))
 		return false;
 
 	return true;
@@ -581,6 +690,12 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Test to switch RR seamlessly without modeset.");
+	igt_subtest_with_dynamic("seamless-rr-switch") {
+		igt_require_intel(data.drm_fd);
+		run_vrr_test(&data, test_seamless_rr_basic, TEST_SEAMLESS_RR);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.40.0
