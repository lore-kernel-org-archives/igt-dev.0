Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139C76E9C9
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 07:06:48 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu,  4 Mar 2021 12:39:17 +0530
Message-Id: <20210304070917.1666818-1-jigar.bhatt@intel.com>
In-Reply-To: <20210121083432.526247-1-jigar.bhatt@intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6] tests/i915/i915_pm_dc: Add DC9 igt test
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

DC9 igt test validation depends on DC{5,6} counters reset.
When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
We don't have a DC9 counter unlike DC{5,6},
therefore this tests uses DC{5,6} counter reset method to validate DC9.

v6:
- assert for DC6 counter in setup_dc9_dpms.
- Move  dpms_off() to test_dc9_dpms() [ Gupta Anshuman ]

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 30c6024..a3931fc 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -383,6 +383,35 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	dpms_on(data);
 	cleanup_dc_dpms(data);
 }
+tatic bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int prev_dc6, int seconds)
+{
+        /*
+         * since we do not have DC9 Counter,
+         * so we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
+         */
+        return igt_wait((read_dc_counter(debugfs_fd, CHECK_DC5) > prev_dc5 || read_dc_counter(debugfs_fd, CHECK_DC6) > prev_dc6), seconds, 100);
+}
+static void setup_dc9_dpms(data_t *data, int prev_dc5, int prev_dc6)
+{
+        igt_disable_runtime_pm();
+        data->runtime_suspend_disabled = true;
+        dpms_off(data);
+        igt_assert_f(igt_wait(read_dc_counter(data->debugfs_fd, CHECK_DC6) > prev_dc6, 1000, 100),"Not in DC9\n");
+        dpms_on(data);
+        data->runtime_suspend_disabled = false;
+        igt_restore_runtime_pm();
+        igt_setup_runtime_pm(data->drm_fd);
+
+}
+static void test_dc9_dpms(data_t *data)
+{
+        require_dc_counter(data->debugfs_fd, CHECK_DC5);
+        require_dc_counter(data->debugfs_fd, CHECK_DC6);
+        setup_dc9_dpms(data, read_dc_counter(data->debugfs_fd, CHECK_DC5), read_dc_counter(data->debugfs_fd, CHECK_DC6));
+        dpms_off(data);
+        igt_assert_f(!check_dc9(data->debugfs_fd, read_dc_counter(data->debugfs_fd, CHECK_DC5), read_dc_counter(data->debugfs_fd, CHECK_DC6), 3000),"Not in DC9\n");
+        dpms_on(data);
+}
 
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
@@ -449,6 +478,10 @@ int main(int argc, char *argv[])
 		test_dc_state_dpms(&data, CHECK_DC6);
 	}
 
+	igt_describe("This test validates display engine entry to DC9 state");
+        igt_subtest("dc9-dpms"){
+                test_dc9_dpms(&data);
+        }
 	igt_fixture {
 		free(data.pwr_dmn_info);
 		close(data.debugfs_fd);
-- 
2.8.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
