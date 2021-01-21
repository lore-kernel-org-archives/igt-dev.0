Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCD46E526
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 08:33:09 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu, 21 Jan 2021 14:04:32 +0530
Message-Id: <20210121083432.526247-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/i915_pm_dc: Add DC9 igt test
 Function
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

From: jbhatt <jigar.bhatt@intel.com>

test_dc9_dpms is getting DC5 and,
DC6 values and pass through function check_dc9.
Function check_dc9 is responsible for dpms off,
getting recent values of DC5 and DC6 and,
checking whether they decremented or not.
Finally checking DC9 is ready or not with yes or no.

Signed-off-by: jbhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 30c6024..60d3434 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -384,6 +384,30 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	cleanup_dc_dpms(data);
 }
 
+static bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int prev_dc6)
+{
+        char buf[4096];
+        char *str;
+        igt_skip_on_f(igt_debugfs_simple_read(debugfs_fd, "i915_pm_req_res_info", buf, sizeof(buf)),"skipping DC9 test");
+        igt_assert_f(strstr(buf, "DC9 Ready = "),"DC9 is not ready");
+        str = strstr(buf, "DC9 Ready = ");
+        igt_assert_f((str&&strlen(str)>12&&str[12]=='y'&&strstr(str,"yes")), "DC9 is not ready\n");
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
+        dpms_off(data);
+        igt_assert_f(check_dc9(data->debugfs_fd,dc5_prev,dc6_prev),"\n Not in DC9");
+        dpms_on(data);
+}
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
@@ -449,6 +473,10 @@ int main(int argc, char *argv[])
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
