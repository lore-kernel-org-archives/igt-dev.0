Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12A910E834
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 13:10:42 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Sep 2022 18:41:56 +0530
Message-Id: <20220902131156.29798-4-swati2.sharma@intel.com>
In-Reply-To: <20220902131156.29798-1-swati2.sharma@intel.com>
References: <20220902131156.29798-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 3/3] tests/i915/i915_pm_dc: Modify dc9 test
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

Existing dc9 test is modified. Added new condition,
runtime_suspended_time value should increases when system
enters dc9. This condition will be checked for both igfx
and dgfx whereas existing condition where we wait for
dc counter to reset is limited only to igfx.

v2: modified existing test. no need of new subtest (imre)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/i915_pm_dc.c | 45 ++++++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index d90d64cca..f1f650256 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -31,8 +31,11 @@
 #include "igt_kmod.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
+#include "igt_device.h"
+#include "igt_device_scan.h"
 #include "limits.h"
 #include "time.h"
+#include "igt_pm.h"
 
 /* DC State Flags */
 #define CHECK_DC5	(1 << 0)
@@ -411,19 +414,13 @@ static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int
 {
 	/*
 	 * since we do not have DC9 counter,
-	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
+	 * so we rely on dc5/dc6 counter reset
+	 * to check if display engine was in DC9.
 	 */
 	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
 			prev_dc, seconds, 100);
 }
 
-static void check_dc9(data_t *data, int dc_target, int prev_dc)
-{
-	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
-			"DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
-			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
-}
-
 static bool is_dgfx(data_t *data)
 {
 	char buf[4096];
@@ -433,9 +430,32 @@ static bool is_dgfx(data_t *data)
 	return strstr(buf, "is_dgfx: yes");
 }
 
+static bool dc9_runtime_suspend_time(int before, int after)
+{
+	return (before < after) ? 1 : 0;
+}
+
+static void check_dc9(data_t *data, int dc_target, int prev_dc,
+		      int before, int after)
+{
+	if(!(is_dgfx(data))) {
+		igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
+			     "DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
+			     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
+		igt_assert_f(dc9_runtime_suspend_time(before, after), "Runtime suspended time didn't "
+			     "increase\n before:%d  after:%d\n", before, after);
+	} else
+		igt_assert_f(dc9_runtime_suspend_time(before, after), "Runtime suspended time didn't "
+			    "increase\n before:%d  after:%d\n", before, after);
+}
+
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
 	int prev_dc, sysfs_fd;
+	struct pci_device *i915;
+	int before, after;
+
+	i915 = igt_device_get_pci_device(data->drm_fd);
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
@@ -444,14 +464,19 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc_dpms(data);
 	dpms_off(data);
-	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
+	if(!(is_dgfx(data)))
+		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
 	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
+	before = igt_pm_get_runtime_suspended_time(i915);
+	igt_assert_lte(0, before);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
 	dpms_off(data);
 	sleep(1); /* wait for counters reset*/
-	check_dc9(data, dc_target, prev_dc);
+	after = igt_pm_get_runtime_suspended_time(i915);
+	igt_assert_lte(0, after);
+	check_dc9(data, dc_target, prev_dc, before, after);
 	dpms_on(data);
 }
 
-- 
2.25.1
