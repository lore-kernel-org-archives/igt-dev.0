Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A99910E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 20:59:24 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-457c4e4a392so997103137.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 13:59:24 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 20:56:37 +0000
Message-ID: <20231023205910.3556533-8-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
References: <20231023205910.3556533-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 7/8] tests/kms_vrr: Allow for multiple rates in
 a test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Instead of passing just one rate into flip_and_measure, pass in an array
to allow for tests which vary the refresh rate from one frame to the
next. Currently the test will just cycle through the rates in order per
frame.

Just framework, no changes to any tests.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Added to the set
---
 tests/kms_vrr.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 57bd87ddf..b986087f0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -375,7 +375,7 @@ do_flip(data_t *data, igt_fb_t *fb)
  */
 static uint32_t
 flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
-		 uint64_t rate_ns, uint64_t duration_ns)
+		 uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
 {
 	uint64_t start_ns, last_event_ns, target_ns;
 	uint32_t total_flip = 0, total_pass = 0;
@@ -387,9 +387,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
 
-	for (;;) {
+	for (int i = 0;;++i) {
 		uint64_t event_ns, wait_ns;
 		int64_t diff_ns;
+		uint64_t rate_ns = rates_ns[i % num_rates];
 
 		front = !front;
 		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
@@ -440,8 +441,12 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		while (get_time_ns() < target_ns - 10);
 	}
 
-	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
-		 total_flip, total_pass, (NSECS_PER_SEC/rate_ns), rate_ns);
+	igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
+	for (int i = 0; i < num_rates; ++i) {
+		igt_info("(%llu Hz) %"PRIu64"ns%s", (NSECS_PER_SEC/rates_ns[i]), rates_ns[i],
+			 i < num_rates - 1 ? "," : "");
+	}
+	igt_info("]\n");
 
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
@@ -453,12 +458,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	uint32_t result;
 	vtest_ns_t vtest_ns;
 	range_t range;
-	uint64_t rate;
+	uint64_t rate[] = {0};
 
 	prepare_test(data, output, pipe);
 	range = data->range;
 	vtest_ns = data->vtest_ns;
-	rate = vtest_ns.rate_ns;
+	rate[0] = vtest_ns.rate_ns;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
@@ -470,7 +475,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * This is to make sure we were actually in the middle of
 	 * active flipping before doing the DPMS/suspend steps.
 	 */
-	flip_and_measure(data, output, pipe, rate, 250000000ull);
+	flip_and_measure(data, output, pipe, rate, 1, 250000000ull);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(output->display->drm_fd,
@@ -501,27 +506,27 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 *      next Vmin.
 	 */
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = rate_from_refresh(range.max + 5);
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     (range.max + 5), rate, result);
+			     (range.max + 5), rate[0], result);
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
-		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = vtest_ns.rate_ns;
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     ((range.max + range.min) / 2), rate, result);
+			     ((range.max + range.min) / 2), rate[0], result);
 	}
 
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.min - 5);
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = rate_from_refresh(range.min - 5);
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
-			     (range.min - 5), rate, result);
+			     (range.min - 5), rate[0], result);
 	}
 
 	/*
@@ -530,11 +535,11 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * a VRR capable panel.
 	 */
 	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
-	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+	rate[0] = vtest_ns.rate_ns;
+	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
+		     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE)? "on" : "off", result);
 
 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
-- 
Sean Paul, Software Engineer, Google / Chromium OS
