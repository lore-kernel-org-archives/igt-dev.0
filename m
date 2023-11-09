Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EBE10E8C2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 14:48:27 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 20:08:31 +0530
Message-Id: <20231109143831.883641-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_vrr: Clear VRR before exit
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

Before exiting the subtest, make sure to clear the VRR.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e203fd4d5..f04d71fa9 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -404,6 +404,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	vtest_ns_t vtest_ns;
 	range_t range;
 	uint64_t rate;
+	bool pass = true;
 
 	prepare_test(data, output, pipe);
 	range = data->range;
@@ -453,25 +454,37 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     (range.max + 5), rate, result);
+		if (result < 75) {
+			igt_info("Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+				 (range.max + 5), rate, result);
+			pass = false;
+
+			goto cleanup;
+		}
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
 		rate = vtest_ns.mid;
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     ((range.max + range.min) / 2), rate, result);
+		if (result < 75) {
+			igt_info("Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+				 ((range.max + range.min) / 2), rate, result);
+			pass = false;
+
+			goto cleanup;
+		}
 	}
 
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.min - 5);
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-		igt_assert_f(result < 50,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
-			     (range.min - 5), rate, result);
+		if (result > 50) {
+			igt_info("Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+				 (range.max - 5), rate, result);
+			pass = false;
+
+			goto cleanup;
+		}
 	}
 
 	/*
@@ -482,11 +495,15 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
 	rate = vtest_ns.mid;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-	igt_assert_f(result < 10,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
+	if (result > 10) {
+		igt_info("Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
+			 ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
+
+		pass = false;
+	}
 
-	/* Clean-up */
+cleanup:
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
@@ -494,6 +511,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	igt_remove_fb(data->drm_fd, &data->fb1);
 	igt_remove_fb(data->drm_fd, &data->fb0);
+
+	igt_assert(pass);
 }
 
 /* Runs tests on outputs that are VRR capable. */
-- 
2.40.0
