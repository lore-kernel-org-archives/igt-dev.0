Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CFA89561
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:00:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:28:25 +0530
Message-Id: <20221115165916.196084-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
References: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_vrr: Add Negative tests to validate VRR
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

This patch will try to enable VRR on Non-VRR panel. VRR should
not be enabled on the Non-VRR panel. It is unlikely to reject the
commit/modeset. And the expected behavior is the same as disabling
VRR on a VRR capable panel.

V2, V3:
- Fix the condition check to run basic tests
V4:
- Fix the crash in CI (devided by zero)

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
---
 tests/kms_vrr.c | 70 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8976d4a6..68c4f264 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -41,10 +41,11 @@
 	(m)->type, (m)->flags
 
 enum {
-	TEST_NONE = 0,
-	TEST_DPMS = 1 << 0,
-	TEST_SUSPEND = 1 << 1,
-	TEST_FLIPLINE = 1 << 2,
+	TEST_BASIC = 1 << 0,
+	TEST_DPMS = 1 << 1,
+	TEST_SUSPEND = 1 << 2,
+	TEST_FLIPLINE = 1 << 3,
+	TEST_NEGATIVE = 1 << 4,
 };
 
 typedef struct range {
@@ -116,7 +117,7 @@ static uint64_t get_time_ns(void)
 /* Returns the rate duration in nanoseconds for the given refresh rate. */
 static uint64_t rate_from_refresh(uint64_t refresh)
 {
-	return NSECS_PER_SEC / refresh;
+	return refresh ? (NSECS_PER_SEC / refresh) : 0;
 }
 
 /* Instead of running on default mode, loop through the connector modes
@@ -179,11 +180,16 @@ static vtest_ns_t get_test_rate_ns(range_t range)
 	return vtest_ns;
 }
 
-/* Returns true if an output supports VRR. */
+/* Returns true if driver supports VRR. */
 static bool has_vrr(igt_output_t *output)
 {
-	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
+/* Returns true if an output supports VRR. */
+static bool vrr_capable(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
 }
 
 /* Toggles variable refresh rate on the pipe. */
@@ -398,7 +404,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 *      Flip will happen right away so returned refresh rate is 50Hz.
 	 * if refresh_rate < 40Hz:
 	 *      h/w will terminate the vblank at Vmax which is obvious.
-	 *      So, for now we can safely ignore the lower refresh rates
+	 *      So, vblank termination should happen at Vmax, and flip done at
+	 *      next Vmin.
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
@@ -408,17 +415,33 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.max + 5), rate, result);
 	}
 
-	rate = vtest_ns.mid;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate, result);
+	if (flags & ~TEST_NEGATIVE) {
+		rate = vtest_ns.mid;
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     ((range.max + range.min) / 2), rate, result);
+	}
 
-	set_vrr_on_pipe(data, pipe, false);
+	if (flags & TEST_FLIPLINE) {
+		rate = rate_from_refresh(range.min - 5);
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result < 50,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+			     (range.min - 5), rate, result);
+	}
+
+	/*
+	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
+	 * modeset. And the expected behavior is the same as disabling VRR on
+	 * a VRR capable panel.
+	 */
+	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
+	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate, result);
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
+		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
 
 	/* Clean-up */
 	igt_plane_set_fb(data->primary, NULL);
@@ -442,6 +465,13 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 		if (!has_vrr(output))
 			continue;
 
+		/* For Negative tests, panel should be non-vrr. */
+		if ((flags & TEST_NEGATIVE) && vrr_capable(output))
+			continue;
+
+		if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+			continue;
+
 		for_each_pipe(&data->display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
 				igt_dynamic_f("pipe-%s-%s",
@@ -470,7 +500,7 @@ igt_main
 	igt_describe("Tests that VRR is enabled and that the difference between flip "
 		     "timestamps converges to the requested rate");
 	igt_subtest_with_dynamic("flip-basic")
-		run_vrr_test(&data, test_basic, 0);
+		run_vrr_test(&data, test_basic, TEST_BASIC);
 
 	igt_describe("Tests with DPMS that VRR is enabled and that the difference between flip "
 		     "timestamps converges to the requested rate.");
@@ -486,6 +516,10 @@ igt_main
 	igt_subtest_with_dynamic("flipline")
 		run_vrr_test(&data, test_basic, TEST_FLIPLINE);
 
+	igt_describe("Make sure that VRR should not be enabled on the Non-VRR panel.");
+	igt_subtest_with_dynamic("negative-basic")
+		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.38.0
