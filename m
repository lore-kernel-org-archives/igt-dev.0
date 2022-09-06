Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76C89F38
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:11:33 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 18:42:45 +0530
Message-Id: <20220906131245.4757-4-swati2.sharma@intel.com>
In-Reply-To: <20220906131245.4757-1-swati2.sharma@intel.com>
References: <20220906131245.4757-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 3/3] tests/i915/i915_pm_dc: Modify dc9
 test
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

v3: -changed test design (imre)
v4: -var name changed (imre)
    -restricted counter reset condition to dg1 and dg2
     platforms only (anshuman)
    -swapped rpm vs dc9 wait order condition (imre)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/i915_pm_dc.c | 67 +++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index d90d64cca..040cc747c 100644
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
@@ -407,35 +410,59 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int seconds)
+static bool is_dgfx(data_t *data)
 {
-	/*
-	 * since we do not have DC9 counter,
-	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
-	 */
-	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
-			prev_dc, seconds, 100);
+	char buf[4096];
+
+	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
+				buf, sizeof(buf));
+	return strstr(buf, "is_dgfx: yes");
 }
 
-static void check_dc9(data_t *data, int dc_target, int prev_dc)
+static int read_runtime_suspended_time(int drm_fd)
 {
-	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
-			"DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
-			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
+	struct pci_device *i915;
+	int ret;
+
+	i915 = igt_device_get_pci_device(drm_fd);
+	ret = igt_pm_get_runtime_suspended_time(i915);
+	igt_assert_lte(0, ret);
+
+	return ret;
 }
 
-static bool is_dgfx(data_t *data)
+static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc,
+			   int prev_rpm, int seconds)
 {
-	char buf[4096];
+	bool ret1 = false, ret2 = true;
 
-	igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
-				buf, sizeof(buf));
-	return strstr(buf, "is_dgfx: yes");
+	/* runtime suspended residency should increment once DC9 is achieved */
+	ret1 = igt_wait(read_runtime_suspended_time(data->drm_fd) >
+			prev_rpm, seconds, 100);
+	/*
+	 * since we do not have DC9 counter,
+	 * so we rely on dc5/dc6 counter reset
+	 * to check if display engine was in DC9.
+	 * skip this condition for DG1 and DG2
+	 * platforms.
+	 */
+	if(!(IS_DG1(data->devid) || IS_DG2(data->devid)))
+		ret2 = igt_wait(read_dc_counter(data->debugfs_fd, dc_target) <
+				prev_dc, seconds, 100);
+
+	return ret1 && ret2;
+}
+
+static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
+{
+	igt_assert_f(dc9_wait_entry(data, dc_target, prev_dc, prev_rpm, 3000),
+		     "DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
+		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
 }
 
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
-	int prev_dc, sysfs_fd;
+	int prev_dc, prev_rpm, sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
@@ -444,14 +471,16 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
 	setup_dc_dpms(data);
 	dpms_off(data);
-	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
+	if(!(IS_DG1(data->devid) || IS_DG2(data->devid)))
+		igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
 				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
 	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
+	prev_rpm = read_runtime_suspended_time(data->drm_fd);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
 	dpms_off(data);
 	sleep(1); /* wait for counters reset*/
-	check_dc9(data, dc_target, prev_dc);
+	check_dc9(data, dc_target, prev_dc, prev_rpm);
 	dpms_on(data);
 }
 
-- 
2.25.1
