Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CCC6EA34
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Sep 2021 05:58:23 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Wed, 22 Sep 2021 11:23:01 +0530
Message-Id: <20210922055301.1853271-3-jigar.bhatt@intel.com>
In-Reply-To: <20210922055301.1853271-1-jigar.bhatt@intel.com>
References: <20210922055301.1853271-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/i915_pm_dc: Fix DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, anshuman.gupta@intel.com, nischal.varide@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V1:
Currently, check_dc9 is being called with reference
(previous) counter being read after dpms_off call.
At this time, already the counter is 0.
We need to read the counter before dpms_off is called
so that it holds the previous value which had
incremented while testing shallow states (DC5 or DC6).

V2:
Bit cleaner code.[Imre]
dump the i915_pm_runtime_status debugfs file in case of test
failure.[Anshuman]

V3:
Disabling the polling during DC9 test “echo 0 >
/sys/module/drm_kms_helper/parameters/poll”.[Anshuman]

V4:
passing right fd to igt_sysfs_get_boolean() function,
moving save and get part of polling to setup_dc9_dpms().

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 45 ++++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 04acf839..4efe3206 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -40,6 +40,7 @@
 #define CHECK_DC3CO	(1 << 2)
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
+#define RPM_STATUS "i915_runtime_pm_status"
 
 typedef struct {
 	double r, g, b;
@@ -393,42 +394,58 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int seconds)
+static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int seconds)
 {
 	/*
 	 * since we do not have DC9 counter,
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
 	 */
-	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
-			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
+	return igt_wait(read_dc_counter(debugfs_fd, dc_target) >
 			prev_dc, seconds, 100);
 }
 
-static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
+static void check_dc9(data_t *data, int dc_target, int prev_dc)
 {
+	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
+			"DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
+			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
+}
+
+static bool setup_dc9_dpms(data_t *data, int dc_target, int sysfs_fd, const char *kms_poll)
+{
+	int prev_dc;
+	bool buf = true;
+
+	if (sysfs_fd >= 0) {
+		buf = igt_sysfs_get_boolean(sysfs_fd, kms_poll);
+		igt_sysfs_set_boolean(sysfs_fd, kms_poll, 0);
+	}
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc_dpms(data);
 	dpms_off(data);
-	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
-				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
+	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
 	dpms_on(data);
 	cleanup_dc_dpms(data);
+	return buf;
 }
 
 static void test_dc9_dpms(data_t *data)
 {
-	bool dc6_supported;
+	int prev_dc, dc_target, sysfs_fd;
+	bool buf;
+	const char *kms_poll = "/sys/module/drm_kms_helper/parameters/poll";
 
+	sysfs_fd = open(kms_poll, O_WRONLY);
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
-	dc6_supported = support_dc6(data->debugfs_fd);
-	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
+	buf = setup_dc9_dpms(data, dc_target, sysfs_fd, kms_poll);
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	dpms_off(data);
-	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-				read_dc_counter(data->debugfs_fd, CHECK_DC5),
-				dc6_supported, 3000), "Not in DC9\n");
+	check_dc9(data, dc_target, prev_dc);
 	dpms_on(data);
+	if (sysfs_fd >= 0)
+		igt_sysfs_set_boolean(sysfs_fd, kms_poll, buf);
 }
 
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
-- 
2.25.1
