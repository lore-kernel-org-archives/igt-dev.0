Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4023810E15B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 05:44:32 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 priyanka.dandamudi@intel.com
Date: Thu, 29 Jun 2023 11:13:39 +0530
Message-Id: <20230629054339.636091-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230629054339.636091-1-priyanka.dandamudi@intel.com>
References: <20230629054339.636091-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] xe/xe_sysfs_scheduler: Verify scheduler
 control interface
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

Added 3 basic tests invalid, min-max and nonpriviled-user are added to verify
scheduler parameters for each engine.

1. invalid: Try to set invalid values to scheduler parameters and verify it.
2. min-max: For a privileged user, it sets min, max values.
   It sets scheduler parmeters within the range and verifies it.
   It sets scheduler parameters beyond the range but within the default range and verifies it.
3. nonpriviled-user: It drops the root privileges and try to set scheduler parmeters beyond the range
   and verifies it.

v2: Updated code to set min/max values to default after test.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/meson.build             |   1 +
 tests/xe/xe_sysfs_scheduler.c | 211 ++++++++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_scheduler.c

diff --git a/tests/meson.build b/tests/meson.build
index b24bae5c2..dc362a34d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -271,6 +271,7 @@ xe_progs = [
 	'xe_waitfence',
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
+	'xe_sysfs_scheduler',
 ]
 
 msm_progs = [
diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
new file mode 100644
index 000000000..965019473
--- /dev/null
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: xe sysfs scheduler
+ * Run type: FULL
+ *
+ * SUBTEST: %s-invalid
+ * Description: Test to check if %s arg[1] schedule parameter rejects any unrepresentable intervals.
+ *
+ * SUBTEST: %s-min-max
+ * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
+ *
+ * SUBTEST: %s-nonprivileged-user
+ * Description: Test %s arg[1] schedule parameter for nonprivileged user.
+ *
+ * arg[1]:
+ *
+ * @preempt_timeout_us:		preempt timeout us
+ * @timeslice_duration_us:	timeslice duration us
+ * @job_timeout_ms:		job timeout ms
+ */
+
+#include <dirent.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_query.h"
+
+static void test_invalid(int xe, int engine, const char **property)
+{
+	unsigned int saved, set;
+	unsigned int min, max;
+
+	igt_sysfs_scanf(engine, property[2], "%u", &max);
+	igt_sysfs_scanf(engine, property[1], "%u", &min);
+
+	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
+	igt_debug("Initial %s:%u\n", property[0], saved);
+
+	igt_sysfs_printf(engine, property[0], "%d", max+100);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, saved);
+
+	igt_sysfs_printf(engine, property[0], "%d", min-100);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, saved);
+}
+
+static void test_min_max(int xe, int engine, const char **property)
+{
+	unsigned int default_max, max;
+	unsigned int default_min, min;
+	unsigned int set;
+	int defaults;
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	igt_require(defaults != -1);
+
+	igt_sysfs_scanf(defaults, property[2], "%u", &default_max);
+	igt_sysfs_scanf(defaults, property[1], "%u", &default_min);
+
+	igt_sysfs_printf(engine, property[2], "%d", default_max-10);
+	igt_sysfs_scanf(engine, property[2], "%u", &max);
+	igt_assert_eq(max, (default_max-10));
+
+	igt_sysfs_printf(engine, property[2], "%d", default_max+1);
+	igt_sysfs_scanf(engine, property[2], "%u", &max);
+	igt_assert_neq(max, (default_max+1));
+
+	igt_sysfs_printf(engine, property[1], "%d", default_min+1);
+	igt_sysfs_scanf(engine, property[1], "%u", &min);
+	igt_assert_eq(min, (default_min+1));
+
+	igt_sysfs_printf(engine, property[1], "%d", default_min-10);
+	igt_sysfs_scanf(engine, property[1], "%u", &min);
+	igt_assert_neq(min, (default_min-10));
+
+	igt_sysfs_printf(engine, property[0], "%d", min);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, min);
+
+	igt_sysfs_printf(engine, property[0], "%d", max);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, max);
+
+	igt_sysfs_printf(engine, property[0], "%d", default_min);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, default_min);
+
+	igt_sysfs_printf(engine, property[0], "%d", min);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, min);
+
+	/* Reset max, min to original values */
+	igt_sysfs_printf(engine, property[1], "%d", default_min);
+	igt_sysfs_printf(engine, property[2], "%d", default_max);
+}
+
+static void test_param_nonpriv(int xe, int engine, const char **property)
+{
+	unsigned int default_max, max;
+	unsigned int default_min, min;
+	unsigned int set;
+	struct stat st;
+	int defaults;
+
+	fstat(engine, &st);
+	fchmod(engine, (st.st_mode | S_IROTH | S_IWOTH));
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	igt_require(defaults != -1);
+
+	igt_sysfs_scanf(defaults, property[2], "%u", &default_max);
+	igt_sysfs_scanf(defaults, property[1], "%u", &default_min);
+
+	igt_sysfs_printf(engine, property[2], "%d", default_max-10);
+	igt_sysfs_scanf(engine, property[2], "%u", &max);
+	igt_assert_eq(max, (default_max-10));
+
+	igt_sysfs_printf(engine, property[1], "%d", default_min+1);
+	igt_sysfs_scanf(engine, property[1], "%u", &min);
+	igt_assert_eq(min, (default_min+1));
+
+	igt_fork(child, 1) {
+		igt_drop_root();
+		igt_sysfs_printf(engine, property[0], "%d", default_min);
+		igt_sysfs_scanf(engine, property[0], "%u", &set);
+		igt_assert_neq(set, default_min);
+
+		igt_sysfs_printf(engine, property[0], "%d", min);
+		igt_sysfs_scanf(engine, property[0], "%u", &set);
+		igt_assert_eq(set, min);
+
+		igt_sysfs_printf(engine, property[0], "%d", default_max);
+		igt_sysfs_scanf(engine, property[0], "%u", &set);
+		igt_assert_neq(set, default_max);
+
+		igt_sysfs_printf(engine, property[0], "%d", max);
+		igt_sysfs_scanf(engine, property[0], "%u", &set);
+		igt_assert_eq(set, max);
+	}
+	igt_waitchildren();
+
+	fchmod(engine, st.st_mode);
+
+	/* Reset max, min to original values */
+	igt_sysfs_printf(engine, property[1], "%d", default_min);
+	igt_sysfs_printf(engine, property[2], "%d", default_max);
+}
+
+igt_main
+{
+	static const struct {
+		const char *name;
+		void (*fn)(int, int, const char **);
+	} tests[] = {
+		{ "invalid", test_invalid },
+		{ "min-max", test_min_max },
+		{ "nonprivileged-user", test_param_nonpriv },
+		{ }
+	};
+
+	const char *property[][3] = { {"preempt_timeout_us", "preempt_timeout_min", "preempt_timeout_max"},
+				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
+				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
+	};
+	int count = sizeof(property) / sizeof(property[0]);
+	int xe = -1;
+	int sys_fd;
+	int gt;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_device_get(xe);
+
+		sys_fd = igt_sysfs_open(xe);
+		igt_require(sys_fd != -1);
+	}
+
+	for (int i = 0; i < count; i++) {
+		for (typeof(*tests) *t = tests; t->name; t++) {
+			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				xe_for_each_gt(xe, gt) {
+					int engines_fd = -1;
+					char buf[100];
+
+					sprintf(buf, "device/gt%d/engines", gt);
+					engines_fd = openat(sys_fd, buf, O_RDONLY);
+					igt_require(engines_fd != -1);
+
+					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+					close(engines_fd);
+				}
+			}
+		}
+	}
+	igt_fixture {
+		close(sys_fd);
+		xe_device_put(xe);
+		close(xe);
+	}
+}
+
-- 
2.25.1
