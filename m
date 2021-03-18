Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088706E0FB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 10:18:38 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu, 18 Mar 2021 15:26:15 +0530
Message-Id: <1616061375-20641-1-git-send-email-jigar.bhatt@intel.com>
In-Reply-To: <20210121083432.526247-1-jigar.bhatt@intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
Subject: [igt-dev] [PATCH i-g-t v9] tests/i915/i915_pm_dc: Add DC9 igt test
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

DC9 igt test validation depends on DC{5,6} counters reset.
When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
We don't have a DC9 counter unlike DC{5,6},
therefore this tests uses DC{5,6} counter reset method to validate DC9.

v9: [Anshuman]
- Change function name check_dc9() to dc9_failed().

v8: [Anshuman]
- Add support_dc6() to check whether a platform supports dc6.

v7: [Anshuman]
- Skip if no support of DC6.

v6: [Anshuman]
- assert for DC6 counter in setup_dc9_dpms.
- Move  dpms_off() to test_dc9_dpms().

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 30c6024..874b37c 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -384,6 +384,55 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	cleanup_dc_dpms(data);
 }
 
+static bool support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
+				buf, sizeof(buf));
+	return strstr(buf, "DC5 -> DC6 count");
+}
+
+static bool dc9_failed(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int seconds)
+{
+	/*
+	 * since we do not have DC9 Counter,
+	 * so we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
+	 */
+	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) >
+			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) >
+			prev_dc, seconds, 100);
+}
+
+static void setup_dc9_dpms(data_t *data, int prev_dc, bool  dc6_supported)
+{
+	igt_disable_runtime_pm();
+	data->runtime_suspend_disabled = true;
+	dpms_off(data);
+	igt_skip_on_f(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
+				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
+				prev_dc, 3000, 100), "Unable to enters shallow DC states\n");
+	dpms_on(data);
+	data->runtime_suspend_disabled = false;
+	igt_restore_runtime_pm();
+	igt_setup_runtime_pm(data->drm_fd);
+}
+
+static void test_dc9_dpms(data_t *data)
+{
+	require_dc_counter(data->debugfs_fd, CHECK_DC5);
+	bool dc6_supported = support_dc6(data->debugfs_fd);
+
+	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	dpms_off(data);
+	igt_assert_f(!dc9_failed(data->debugfs_fd, dc6_supported ?
+				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
+				read_dc_counter(data->debugfs_fd, CHECK_DC5),
+				dc6_supported, 3000), "Not in DC9\n");
+	dpms_on(data);
+}
+
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
@@ -448,6 +497,13 @@ int main(int argc, char *argv[])
 			      "PC8+ residencies not supported\n");
 		test_dc_state_dpms(&data, CHECK_DC6);
 	}
+
+	igt_describe("This test validates display engine entry to DC9 state");
+	igt_subtest("dc9-dpms") {
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
