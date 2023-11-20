Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AB810E322
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 08:35:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Date: Mon, 20 Nov 2023 13:54:59 +0530
Message-Id: <20231120082459.1859375-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231120082459.1859375-1-bhanuprakash.modem@intel.com>
References: <20231120082459.1859375-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/kms_vrr: New subtest for CMRR
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

CMRR is an variation of VRR where it varies Vtotal slightly
(between additional 0 and 1 Vtotal scanlines) to match content
rate exactly without frame drops using the adaptive sync framework.

This patch creates a new subtest to validate the CMRR as below:
- Request flips with the refresh_rate * 1.001
- Flips should happen at the frequency of refresh_rate.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 741a13be6..351645da5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -29,6 +29,14 @@
  * Category: Display
  * Description: Test to validate diffent features of VRR
  *
+ * SUBTEST: cmrr
+ * Description: Test to validate the content rate to exactly match with the
+ *              requested rate without any frame drops.
+ * Driver requirement: i915, xe
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Test category: functionality test
+ *
  * SUBTEST: flip-basic
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
@@ -83,6 +91,8 @@
 	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
 	(m)->type, (m)->flags
 
+#define CMRR_FACTOR 1.001
+
 enum {
 	TEST_BASIC = 1 << 0,
 	TEST_DPMS = 1 << 1,
@@ -332,6 +342,57 @@ do_flip(data_t *data, igt_fb_t *fb)
 	igt_reset_timeout();
 }
 
+static uint32_t
+flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
+		      unsigned int refresh_rate, uint64_t duration_ns)
+{
+	uint64_t start_ns, last_event_ns, event_ns;
+	uint32_t total_flip = 0, total_pass = 0;
+	bool front = false;
+	drmModeModeInfoPtr mode = igt_output_get_mode(output);
+	uint64_t req_rate_ns = rate_from_refresh(refresh_rate * CMRR_FACTOR);
+	uint64_t exp_rate_ns = rate_from_refresh(refresh_rate);
+	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
+
+	igt_info("CMRR on: requested rate: %"PRIu64" ns (%f Hz) "
+		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%f-%f Hz)\n",
+		 req_rate_ns, refresh_rate * CMRR_FACTOR,
+		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
+		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
+		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
+
+	do_flip(data, &data->fb0);
+	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+	do {
+		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
+
+		front = !front;
+		do_flip(data, front ? &data->fb1 : &data->fb0);
+
+		event_ns = get_kernel_event_ns(data, DRM_EVENT_VBLANK);
+		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%f Hz)\n",
+			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
+
+		diff_ns -= event_ns - last_event_ns;
+		if (llabs(diff_ns) <= threshold_ns)
+			total_pass += 1;
+		total_flip += 1;
+
+		diff_ns = event_ns - start_ns;
+		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
+		wait_ns -= diff_ns;
+		target_ns = event_ns + wait_ns;
+		while (get_time_ns() < target_ns - 10);
+
+		last_event_ns = get_time_ns();
+	} while (event_ns - start_ns <= duration_ns);
+
+	igt_info("Completed %u flips, %u vblanks were in threshold for (%u Hz) %"PRIu64"ns.\n",
+		 total_flip, total_pass, refresh_rate, req_rate_ns);
+
+	return total_flip ? ((total_pass * 100) / total_flip) : 0;
+}
+
 /*
  * Flips at the given rate and measures against the expected value.
  * Returns the pass rate as a percentage from 0 - 100.
@@ -414,6 +475,34 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
 
+static void
+test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint32_t result;
+	range_t range;
+
+	prepare_test(data, output, pipe);
+	range = data->range;
+
+	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
+
+	result = flip_and_measure_cmrr(data, output, pipe, range.max, TEST_DURATION_NS);
+
+	/* Clean-up */
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_override_mode(output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_remove_fb(data->drm_fd, &data->fb1);
+	igt_remove_fb(data->drm_fd, &data->fb0);
+
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
+		     range.max, rate_from_refresh(range.max), result);
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
@@ -587,6 +676,14 @@ igt_main
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Test to validate the the content rate exactly match with the "
+		     "requested rate without any frame drops.");
+	igt_subtest_with_dynamic("cmrr") {
+		igt_require(is_intel_device(data.drm_fd) &&
+			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
+		run_vrr_test(&data, test_cmrr, TEST_BASIC);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.40.0
