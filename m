Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52656E217
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Feb 2021 04:44:17 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Mon, 22 Feb 2021 10:16:45 +0530
Message-Id: <20210222044645.131579-1-jigar.bhatt@intel.com>
In-Reply-To: <20210121083432.526247-1-jigar.bhatt@intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4] tests/i915/i915_pm_dc: Add DC9 igt test
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
Cc: jigar.bhatt@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

DC9 igt test validation depends on DC9 Ready and DC{5,6} counters reset.
When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
We don't have a DC9 counter unlike DC{5,6},
therefore this tests uses DC{5,6} counter reset method to validate DC9.

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 30c6024..f901400 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -384,6 +384,32 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	cleanup_dc_dpms(data);
 }
 
+static bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int prev_dc6)
+{
+        /*
+         * since we do not have DC9 Counter,
+         * so we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
+         */
+        return igt_wait((read_dc_counter(debugfs_fd, CHECK_DC5)>prev_dc5 || read_dc_counter(debugfs_fd, CHECK_DC6)>prev_dc6),3000,100);
+}
+static void test_dc9_dpms(data_t *data)
+{
+        require_dc_counter(data->debugfs_fd, CHECK_DC5);
+        require_dc_counter(data->debugfs_fd, CHECK_DC6);
+        int dc5_prev=read_dc_counter(data->debugfs_fd, CHECK_DC5);
+        int dc6_prev=read_dc_counter(data->debugfs_fd, CHECK_DC6);
+        igt_disable_runtime_pm();
+        data->runtime_suspend_disabled = true;
+        dpms_off(data);
+        dpms_on(data);
+        data->runtime_suspend_disabled = false;
+        igt_restore_runtime_pm();
+        igt_setup_runtime_pm(data->drm_fd);
+        dpms_off(data);
+        igt_assert_f(!check_dc9(data->debugfs_fd,dc5_prev,dc6_prev),"Not in DC9");
+        dpms_on(data);
+}
+
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
@@ -449,6 +475,11 @@ int main(int argc, char *argv[])
 		test_dc_state_dpms(&data, CHECK_DC6);
 	}
 
+	igt_describe("This test validates display engine entry to DC9 state");
+        igt_subtest("dc9-dpms"){
+                test_dc9_dpms(&data);
+        }
+
 	igt_fixture {
 		free(data.pwr_dmn_info);
 		close(data.debugfs_fd);
-- 
2.8.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
