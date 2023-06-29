Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E89110E108
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 05:44:30 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 priyanka.dandamudi@intel.com
Date: Thu, 29 Jun 2023 11:13:38 +0530
Message-Id: <20230629054339.636091-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230629054339.636091-1-priyanka.dandamudi@intel.com>
References: <20230629054339.636091-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] xe/xe_sysfs_defaults: Verify .defaults
 in engines directory
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

Add a new test which verifies .defaults are readonly and all
parameters are present.

v2: Addressed small changes.(Kamil)

v3: Added debug for default value.(Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/meson.build            |  1 +
 tests/xe/xe_sysfs_defaults.c | 90 ++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_defaults.c

diff --git a/tests/meson.build b/tests/meson.build
index 85ea7e74e..b24bae5c2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -270,6 +270,7 @@ xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_sysfs_defaults',
 ]
 
 msm_progs = [
diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c
new file mode 100644
index 000000000..a1df312e7
--- /dev/null
+++ b/tests/xe/xe_sysfs_defaults.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: xe sysfs defaults
+ * Category: Infrastructure
+ * Functionality: driver handler
+ * Run type: FULL
+ * Sub-category: xe
+ * Test category: SysMan
+ * SUBTEST: engine-defaults
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
+static void test_defaults(int xe, int engine, const char **property)
+{
+	struct dirent *de;
+	int property_value;
+	int defaults;
+	DIR *dir;
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	igt_require(defaults != -1);
+
+	dir = fdopendir(engine);
+	while ((de = readdir(dir))) {
+		if (*de->d_name == '.')
+			continue;
+
+		igt_debug("Checking attr '%s'\n", de->d_name);
+
+		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
+			     "Default value %s is not present!\n", de->d_name);
+
+		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
+
+		igt_assert_f(!igt_sysfs_set(defaults, de->d_name, "garbage"),
+					    "write into default value of %s succeeded!\n",
+					    de->d_name);
+	}
+	closedir(dir);
+}
+
+igt_main
+{
+	int xe, sys_fd;
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
+	igt_subtest_with_dynamic("engine-defaults") {
+		xe_for_each_gt(xe, gt) {
+			int engines_fd = -1;
+			char buf[100];
+
+			sprintf(buf, "device/gt%d/engines", gt);
+			engines_fd = openat(sys_fd, buf, O_RDONLY);
+			igt_require(engines_fd != -1);
+
+			igt_sysfs_engines(xe, engines_fd, NULL, test_defaults);
+
+			close(engines_fd);
+		}
+	}
+
+	igt_fixture {
+		close(sys_fd);
+		xe_device_put(xe);
+		close(xe);
+	}
+}
+
-- 
2.25.1
