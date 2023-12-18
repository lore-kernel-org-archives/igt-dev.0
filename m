Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0861110E399
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 8/9] tests/kms_vrr: Add a max/min test to oscillate between
 rates
Date: Mon, 18 Dec 2023 13:52:06 +0530
Message-Id: <20231218082207.32719-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
References: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The new MAXMIN test will oscillate between the max and min
refresh rates every frame to stress test the panel. This is
useful for manual profiling of flicker.

v2:
- Added to the set
v3: (Bhanu)
- Rebase
- Add testplan documentation

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2b6e1064b..77791dfb6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -66,6 +66,10 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Functionality: adaptive_sync, drrs
  *
+ * SUBTEST: max-min
+ * Description: Oscillates between highest and lowest refresh each frame for
+ *              manual flicker profiling
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -86,7 +90,8 @@ enum {
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
 	TEST_FASTSET = 1 << 6,
-	TEST_NEGATIVE = 1 << 7,
+	TEST_MAXMIN = 1 << 7,
+	TEST_NEGATIVE = 1 << 8,
 };
 
 enum {
@@ -543,6 +548,14 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.min - 5), rate[0], result);
 	}
 
+	if (flags & TEST_MAXMIN) {
+		uint64_t maxmin_rates[] = {vtest_ns.max, vtest_ns.min};
+		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+		igt_assert_f(result < 50,
+			     "Refresh rate (%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+			     (range.min - 5), maxmin_rates[0], maxmin_rates[1], result);
+	}
+
 	/*
 	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
 	 * modeset. And the expected behavior is the same as disabling VRR on
@@ -784,6 +797,11 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Oscillates between highest and lowest refresh each frame for manual "
+		     "flicker profiling");
+	igt_subtest_with_dynamic("max-min")
+		run_vrr_test(&data, test_basic, TEST_MAXMIN);
+
 	igt_subtest_group {
 		igt_fixture
 			igt_require_intel(data.drm_fd);
-- 
2.40.0
