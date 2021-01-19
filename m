Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ECD6E823
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jan 2021 06:24:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue, 19 Jan 2021 19:47:12 +0530
Message-Id: <20210119141712.24980-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vrr: Update condition checks for
 flipline test
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

This patch includes below updates
* For Flipline test: if refresh_rate <= Vrr_min then
	- Expected returned refresh rate would be vrr_max
	- At least 35% of the flips should be in threshold
* Update "igt_display_commit_atomic" with "igt_display_commit2"
* Add few debug prints

V2:
* Rebase

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 51 ++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index beb06854f..e6edd131f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -170,7 +170,7 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
 				enabled);
-	igt_display_commit_atomic(&data->display, 0, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }

 /* Prepare the display for testing on the given pipe. */
@@ -208,8 +208,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	 */
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);

-	igt_display_commit_atomic(&data->display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }

 /* Waits for the vblank interval. Returns the vblank timestamp in ns. */
@@ -291,14 +290,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 * difference between 144Hz and 143Hz which should give this
 		 * enough accuracy for most use cases.
 		 */
-		if (rate_ns <= vtest_ns.min && rate_ns >= vtest_ns.max)
+		if ((rate_ns < vtest_ns.min) && (rate_ns >= vtest_ns.max))
 			diff_ns = rate_ns;
-		else if (rate_ns > vtest_ns.min)
-			diff_ns = vtest_ns.min;
-		else if (rate_ns < vtest_ns.max)
-			diff_ns = vtest_ns.max;
 		else
-			diff_ns = rate_ns;
+			diff_ns = vtest_ns.max;
 		diff_ns -= event_ns - last_event_ns;

 		if (llabs(diff_ns) < 50000ll)
@@ -323,8 +318,8 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		while (get_time_ns() < target_ns);
 	}

-	igt_info("Completed %u flips, %u were in threshold for %"PRIu64"ns.\n",
-		 total_flip, total_pass, rate_ns);
+	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
+		 total_flip, total_pass, (NSECS_PER_SEC/rate_ns), rate_ns);

 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
@@ -338,8 +333,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	range_t range = get_vrr_range(data, output);
 	uint64_t rate = vtest_ns.mid;

-	igt_info("VRR Test execution on %s, PIPE_%s\n",
-		 output->name, kmstest_pipe_name(pipe));
+	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), range.min, range.max);

 	prepare_test(data, output, pipe);

@@ -370,46 +365,42 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * decision boundary.
 	 *
 	 * Example: if range is 40 - 60Hz and
-	 * if refresh_rate > 60Hz:
+	 * if refresh_rate > 60Hz or <= 40Hz:
 	 *      Flip should happen at the flipline boundary & returned refresh rate
 	 *      would be 60Hz.
 	 * if refresh_rate is 50Hz:
 	 *      Flip will happen right away so returned refresh rate is 50Hz.
-	 * if refresh_rate < 40Hz:
-	 *      Flip should happen at the vmax so the returned refresh rate
-	 *      would be 40Hz.
 	 */
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.min - 5);
+		rate = rate_from_refresh(range.max + 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
-			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     rate, result);
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     (range.max + 5), rate, result);

-		rate = rate_from_refresh(range.max + 5);
+		rate = rate_from_refresh(range.min - 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-		igt_assert_f(result > 75,
-			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     rate, result);
+		igt_assert_f(result > 35,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     (range.min - 5), rate, result);
 	}

 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
-		     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-		     rate, result);
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+		     ((range.max + range.min) / 2), rate, result);

 	set_vrr_on_pipe(data, pipe, 0);
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
-		     "Refresh rate %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
-		     rate, result);
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
+		     ((range.max + range.min) / 2), rate, result);

 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit_atomic(&data->display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);

 	igt_remove_fb(data->drm_fd, &data->fb1);
 	igt_remove_fb(data->drm_fd, &data->fb0);
--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
