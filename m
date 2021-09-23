Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B9D6ED08
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 10:24:25 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu, 23 Sep 2021 15:48:57 +0530
Message-Id: <20210923101857.1868172-3-jigar.bhatt@intel.com>
In-Reply-To: <20210923101857.1868172-1-jigar.bhatt@intel.com>
References: <20210923101857.1868172-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/i915_pm_dc: Fix DC9 test
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

V5:
Use macro for "/sys/module/drm_kms_helper/parameters/poll".
Add igt_require when opening sysfs.
Add igt_install_exit_handler(reset_kms_poll) so it will restore actual
sysfs kms polling status.[Anshuman]

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 49 +++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 04acf839..f3c9f6ba 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -40,6 +40,10 @@
 #define CHECK_DC3CO	(1 << 2)
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
+#define RPM_STATUS "i915_runtime_pm_status"
+#define KMS_POLL_PATH "/sys/module/drm_kms_helper/parameters/poll"
+
+bool kms_poll_saved_state;
 
 typedef struct {
 	double r, g, b;
@@ -393,23 +397,33 @@ static bool support_dc6(int debugfs_fd)
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
+static void setup_dc9_dpms(data_t *data, int dc_target, int sysfs_fd)
+{
+	int prev_dc;
+
+	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, KMS_POLL_PATH);
+	igt_sysfs_set_boolean(sysfs_fd, KMS_POLL_PATH, 0);
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc_dpms(data);
 	dpms_off(data);
-	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
-				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
+	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
 	dpms_on(data);
 	cleanup_dc_dpms(data);
@@ -417,20 +431,26 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
 
 static void test_dc9_dpms(data_t *data)
 {
-	bool dc6_supported;
+	int prev_dc, dc_target, sysfs_fd;
 
+	igt_require((sysfs_fd = open(KMS_POLL_PATH, O_WRONLY)) >= 0);
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
-	dc6_supported = support_dc6(data->debugfs_fd);
-	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
+	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
+	setup_dc9_dpms(data, dc_target, sysfs_fd);
+	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	dpms_off(data);
-	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
-				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
-				read_dc_counter(data->debugfs_fd, CHECK_DC5),
-				dc6_supported, 3000), "Not in DC9\n");
+	check_dc9(data, dc_target, prev_dc);
 	dpms_on(data);
 }
 
+static void kms_poll_reset(int sig)
+{
+	int sysfs_fd;
+
+	igt_require((sysfs_fd = open(KMS_POLL_PATH, O_WRONLY)) >= 0);
+	igt_sysfs_set_boolean(sysfs_fd, KMS_POLL_PATH, kms_poll_saved_state);
+}
+
 IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
 int main(int argc, char *argv[])
 {
@@ -453,6 +473,7 @@ int main(int argc, char *argv[])
 		data.msr_fd = open("/dev/cpu/0/msr", O_RDONLY);
 		igt_assert_f(data.msr_fd >= 0,
 			     "Can't open /dev/cpu/0/msr.\n");
+		igt_install_exit_handler(kms_poll_reset);
 	}
 
 	igt_describe("In this test we make sure that system enters DC3CO "
-- 
2.25.1
