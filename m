Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A0B6E9C5
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 11:24:44 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Wed, 24 Mar 2021 16:32:02 +0530
Message-Id: <1616583722-31940-1-git-send-email-jigar.bhatt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Fix misc warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Fix the mixed declarations compile warning.
Fix comment indentation in check_dc9().
Fix checkpatch.pl warnings.

Fixes: 529e182e3011 ("tests/i915/i915_pm_dc: Add DC9 igt test")
Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 67 +++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 17ae662..cf4c7da 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -386,48 +386,49 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 
 static bool support_dc6(int debugfs_fd)
 {
-       char buf[4096];
+	char buf[4096];
 
-       igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
-			       buf, sizeof(buf));
-       return strstr(buf, "DC5 -> DC6 count");
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return strstr(buf, "DC5 -> DC6 count");
 }
 
 static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int seconds)
 {
-/*
- * Since we do not have DC9 Counter,
- * So we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
- */
-       return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
-		       prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
-		       prev_dc, seconds, 100);
+	/*
+	 * since we do not have DC9 counter,
+	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
+	 */
+	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
+			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
+			prev_dc, seconds, 100);
 }
 
 static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
 {
-       setup_dc_dpms(data);
-       dpms_off(data);
-       igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
-				 prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
-				 prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
-       dpms_on(data);
-       cleanup_dc_dpms(data);
+	setup_dc_dpms(data);
+	dpms_off(data);
+	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
+				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
+				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
+	dpms_on(data);
+	cleanup_dc_dpms(data);
 }
 
 static void test_dc9_dpms(data_t *data)
 {
-       require_dc_counter(data->debugfs_fd, CHECK_DC5);
-       bool dc6_supported = support_dc6(data->debugfs_fd);
-
-       setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-		       read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
-       dpms_off(data);
-       igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-			       read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-			       read_dc_counter(data->debugfs_fd, CHECK_DC5),
-			       dc6_supported, 3000), "Not in DC9\n");
-       dpms_on(data);
+	bool dc6_supported;
+
+	require_dc_counter(data->debugfs_fd, CHECK_DC5);
+	dc6_supported = support_dc6(data->debugfs_fd);
+	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	dpms_off(data);
+	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
+				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+				read_dc_counter(data->debugfs_fd, CHECK_DC5),
+				dc6_supported, 3000), "Not in DC9\n");
+	dpms_on(data);
 }
 
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
@@ -497,10 +498,10 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-	       igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
-			       "PC8+ residencies not supported\n");
-	       test_dc9_dpms(&data);
-       }
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				"PC8+ residencies not supported\n");
+		test_dc9_dpms(&data);
+	}
 
 	igt_fixture {
 		free(data.pwr_dmn_info);
-- 
2.8.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
