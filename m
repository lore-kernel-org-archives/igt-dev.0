Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAEC6EAB4
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:54:01 +0000 (UTC)
From: bhanuprakash.modem@intel.com
Date: Thu, 24 Sep 2020 20:18:02 +0530
Message-Id: <20200924144802.30147-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20200924144802.30147-1-bhanuprakash.modem@intel.com>
References: <20200924144802.30147-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v4 2/2] tests/kms_vrr: Add new subtest to validate
 Flipline mode
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Check flipline mode by making sure that flips happen at flipline
decision boundary.

Example: if monitor vrr range is 40 - 60Hz and

* flip at refresh_rate > 60Hz:
        Flip should happen at the flipline boundary & returned refresh rate
        would be 60Hz.
* flip at refresh_rate == 50Hz:
        Flip should happen right away so returned refresh rate is 50Hz.
* flip at refresh_rate < 40Hz:
        Flip should happen at the vmax so the returned refresh rate
        would be 40Hz.

v2:
* s/*vblank_ns/*event_ns/ (Manasi)
* Reset vrr_enabled state before enabling it (Manasi)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 tests/kms_vrr.c | 113 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 31 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 471d765dec..ac42165bef 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -37,6 +37,7 @@ enum {
 	TEST_NONE = 0,
 	TEST_DPMS = 1 << 0,
 	TEST_SUSPEND = 1 << 1,
+	TEST_FLIPLINE = 1 << 2,
 };
 
 typedef struct range {
@@ -52,6 +53,12 @@ typedef struct data {
 	igt_fb_t fb1;
 } data_t;
 
+typedef struct vtest_ns {
+	uint64_t min;
+	uint64_t mid;
+	uint64_t max;
+} vtest_ns_t;
+
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
@@ -104,13 +111,18 @@ static uint64_t rate_from_refresh(uint64_t refresh)
 	return NSECS_PER_SEC / refresh;
 }
 
-/* Returns the min and max vrr range from the connector debugfs. */
+/* Read min and max vrr range from the connector debugfs.
+ *  - min range should be less than the current mode vfreq
+ *  - if max range is grater than the current mode vfreq, consider
+ *       current mode vfreq as the max range.
+ */
 static range_t get_vrr_range(data_t *data, igt_output_t *output)
 {
 	char buf[256];
 	char *start_loc;
 	int fd, res;
 	range_t range;
+	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
 	igt_assert(fd >= 0);
@@ -122,32 +134,28 @@ static range_t get_vrr_range(data_t *data, igt_output_t *output)
 
 	igt_assert(start_loc = strstr(buf, "Min: "));
 	igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
+	igt_require(mode->vrefresh > range.min);
 
 	igt_assert(start_loc = strstr(buf, "Max: "));
 	igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
 
+	range.max = (mode->vrefresh < range.max) ? mode->vrefresh : range.max;
+
 	return range;
 }
 
-/* Returns a suitable vrr test frequency. */
-static uint64_t get_test_rate_ns(data_t *data, igt_output_t *output)
+/* Returns vrr test frequency for min, mid & max range. */
+static vtest_ns_t get_test_rate_ns(data_t *data, igt_output_t *output)
 {
-	drmModeModeInfo *mode = igt_output_get_mode(output);
 	range_t range;
-	uint64_t vtest;
+	vtest_ns_t vtest_ns;
 
-	/*
-	 * The frequency with the fastest convergence speed should be
-	 * the midpoint between the current mode vfreq and the min
-	 * supported vfreq.
-	 */
 	range = get_vrr_range(data, output);
-	igt_require(mode->vrefresh > range.min);
-
-	vtest = (mode->vrefresh - range.min) / 2 + range.min;
-	igt_require(vtest < mode->vrefresh);
+	vtest_ns.min = rate_from_refresh(range.min);
+	vtest_ns.mid = rate_from_refresh(((range.max + range.min) / 2));
+	vtest_ns.max = rate_from_refresh(range.max);
 
-	return rate_from_refresh(vtest);
+	return vtest_ns;
 }
 
 /* Returns true if an output supports VRR. */
@@ -195,6 +203,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(data->primary, &data->fb0);
 
+	/* Clear vrr_enabled state before enabling it, because
+	 * it might be left enabled if the previous test fails.
+	 */
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
+
 	igt_display_commit_atomic(&data->display,
 				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
@@ -250,6 +263,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint64_t start_ns, last_event_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
+	vtest_ns_t vtest_ns = get_test_rate_ns(data, output);
 
 	/* Align with the vblank region to speed up convergence. */
 	last_event_ns = wait_for_vblank(data, pipe);
@@ -268,10 +282,6 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 * that same frame.
 		 */
 		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
-		diff_ns = rate_ns - (event_ns - last_event_ns);
-		last_event_ns = event_ns;
-
-		total_flip += 1;
 
 		/*
 		 * Check if the difference between the two flip timestamps
@@ -281,9 +291,19 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 * difference between 144Hz and 143Hz which should give this
 		 * enough accuracy for most use cases.
 		 */
+		if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
+			diff_ns = rate_ns - (event_ns - last_event_ns);
+		else if (rate_ns > vtest_ns.min)
+			diff_ns = vtest_ns.min - (event_ns - last_event_ns);
+		else if (rate_ns < vtest_ns.max)
+			diff_ns = vtest_ns.max - (event_ns - last_event_ns);
+
 		if (llabs(diff_ns) < 50000ll)
 			total_pass += 1;
 
+		last_event_ns = event_ns;
+		total_flip += 1;
+
 		now_ns = get_time_ns();
 		if (now_ns - start_ns > duration_ns)
 			break;
@@ -310,10 +330,13 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 static void
 test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
-	uint64_t rate;
 	uint32_t result;
+	vtest_ns_t vtest_ns = get_test_rate_ns(data, output);
+	range_t range = get_vrr_range(data, output);
+	uint64_t rate = vtest_ns.mid;
 
-	rate = get_test_rate_ns(data, output);
+	igt_info("VRR Test execution on %s, PIPE_%s\n",
+		 output->name, kmstest_pipe_name(pipe));
 
 	prepare_test(data, output, pipe);
 
@@ -339,21 +362,45 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
 
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-
-	set_vrr_on_pipe(data, pipe, 0);
+	/*
+	 * Check flipline mode by making sure that flips happen at flipline
+	 * decision boundary.
+	 *
+	 * Example: if range is 40 - 60Hz and
+	 * if refresh_rate > 60Hz:
+	 *      Flip should happen at the flipline boundary & returned refresh rate
+	 *      would be 60Hz.
+	 * if refresh_rate is 50Hz:
+	 *      Flip will happen right away so returned refresh rate is 50Hz.
+	 * if refresh_rate < 40Hz:
+	 *      Flip should happen at the vmax so the returned refresh rate
+	 *      would be 40Hz.
+	 */
+	if (flags & TEST_FLIPLINE) {
+		rate = rate_from_refresh(range.min - 5);
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     rate, result);
+
+		rate = rate_from_refresh(range.max + 5);
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     rate, result);
+	}
 
-	/* This check is delayed until after VRR is disabled so it isn't
-	 * left enabled if the test fails. */
+	rate = vtest_ns.mid;
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
-		     "Target VRR on threshold not reached, result was %u%%\n",
-		     result);
+		     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+		     rate, result);
 
+	set_vrr_on_pipe(data, pipe, 0);
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-
 	igt_assert_f(result < 10,
-		     "Target VRR off threshold exceeded, result was %u%%\n",
-		     result);
+		     "Refresh rate %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
+		     rate, result);
 
 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
@@ -413,6 +460,10 @@ igt_main
 	igt_subtest("flip-suspend")
 		run_vrr_test(&data, test_basic, TEST_SUSPEND);
 
+	igt_describe("Make sure that flips happen at flipline decision boundary.");
+	igt_subtest("flipline")
+		run_vrr_test(&data, test_basic, TEST_FLIPLINE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
