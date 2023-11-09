Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EEB10E8CA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:18:11 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 20:43:47 +0530
Message-Id: <20231109151347.2129614-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20231109151347.2129614-1-priyanka.dandamudi@intel.com>
References: <20231109151347.2129614-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2 i-g-t] tests/intel/xe_engine_property: Add
 scheduler engine set property
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added tests to check scheduler engine set properties.
Schedulers inclcude job timeout, preempt timeout and timeslice.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_engine_property.c | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/xe_engine_property.c b/tests/intel/xe_engine_property.c
index 18e050f96..226945994 100644
--- a/tests/intel/xe_engine_property.c
+++ b/tests/intel/xe_engine_property.c
@@ -14,6 +14,14 @@
  * Description: tests basic priority property by setting invalid values and positive values.
  * SUBTEST: persistence-set-property
  * Description: tests basic persistence property by setting positive values
+ * SUBTEST: %s-property-min-max
+ * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
+ *
+ * arg[1]:
+ *
+ * @preempt_timeout_us:		preempt timeout us
+ * @timeslice_duration_us:	timeslice duration us
+ * @job_timeout_ms:		job timeout ms
  */
 
 #include <dirent.h>
@@ -23,6 +31,7 @@
 #include <sys/types.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "xe_drm.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -32,6 +41,18 @@
 #define DRM_SCHED_PRIORITY_HIGH  2
 #define DRM_SCHED_PRIORITY_NORMAL 1
 
+static int get_property_name(const char *property)
+{
+	if (strstr(property, "preempt"))
+		return XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT;
+	else if (strstr(property, "job_timeout"))
+		return XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT;
+	else if (strstr(property, "timeslice"))
+		return XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE;
+	else
+		return -1;
+}
+
 static void test_set_property(int xe, int property_name,
 			      int property_value, int err_val)
 {
@@ -61,12 +82,54 @@ static void test_set_property(int xe, int property_name,
 	igt_assert_eq(ret, err_val);
 }
 
+static void test_property_min_max(int xe, int engine, const char **property)
+{
+	unsigned int max;
+	unsigned int min;
+	unsigned int set;
+	int property_name;
+	int defaults;
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	igt_require(defaults != -1);
+
+	igt_sysfs_scanf(defaults, property[2], "%u", &max);
+	igt_sysfs_scanf(defaults, property[1], "%u", &min);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+
+	property_name = get_property_name(property[0]);
+	igt_assert_neq(property_name, -1);
+
+	/* Tests scheduler properties by setting positive values */
+	test_set_property(xe, property_name, max, 0);
+	test_set_property(xe, property_name, min, 0);
+
+	/* Tests scheduler properties by setting invalid values */
+	test_set_property(xe, property_name, max + 1, -EINVAL);
+	test_set_property(xe, property_name, min - 1, -EINVAL);
+}
+
 igt_main
 {
+	static const struct {
+		const char *name;
+		void (*fn)(int, int, const char **);
+	} tests[] = {{"property-min-max", test_property_min_max}, {} };
+
+	const char *property[][3] = { {"preempt_timeout_us", "preempt_timeout_min", "preempt_timeout_max"},
+				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
+				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
+	};
+	int count = sizeof(property) / sizeof(property[0]);
+	int sys_fd;
 	int xe;
+	int gt;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		sys_fd = igt_sysfs_open(xe);
+		igt_require(sys_fd != -1);
+		close(sys_fd);
 	}
 
 	igt_subtest("priority-set-property") {
@@ -95,6 +158,26 @@ igt_main
 
 	}
 
+	for (int i = 0; i < count; i++) {
+		for (typeof(*tests) *t = tests; t->name; t++) {
+			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				xe_for_each_gt(xe, gt) {
+					int engines_fd = -1;
+					int gt_fd = -1;
+
+					gt_fd = xe_sysfs_gt_open(xe, gt);
+					igt_require(gt_fd != -1);
+					engines_fd = openat(gt_fd, "engines", O_RDONLY);
+					igt_require(engines_fd != -1);
+
+					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+					close(engines_fd);
+					close(gt_fd);
+				}
+			}
+		}
+	}
+
 	igt_fixture {
 		xe_device_put(xe);
 		drm_close_driver(xe);
-- 
2.25.1
