Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3305F10E15D
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Jun 2023 11:14:01 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, tejas.upadhyay@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Date: Sun, 25 Jun 2023 16:43:13 +0530
Message-Id: <20230625111316.534770-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
References: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] xe/xe_sysfs_defaults: Verify .defaults
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

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/meson.build            |   1 +
 tests/xe/xe_sysfs_defaults.c | 105 +++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 tests/xe/xe_sysfs_defaults.c

diff --git a/tests/meson.build b/tests/meson.build
index 85ea7e74..b24bae5c 100644
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
index 00000000..1733ade7
--- /dev/null
+++ b/tests/xe/xe_sysfs_defaults.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
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
+/**
+ * TEST: xe sysfs defaults
+ * Category: Infrastructure
+ * Functionality: driver handler
+ * Run type: FULL
+ * Sub-category: xe
+ * Test category: SysMan
+ * SUBTEST: defaults
+ */
+
+static void test_defaults(int xe, int engine)
+{
+	struct dirent *de;
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
+		igt_assert_f(igt_sysfs_get(defaults, de->d_name),
+					 "Default value %s is not present!\n",
+					 de->d_name);
+
+		igt_assert_f(!igt_sysfs_set(defaults, de->d_name, "garbage"),
+					 "write into default value of %s succeeded!\n",
+					 de->d_name);
+	}
+	closedir(dir);
+}
+
+igt_main
+{
+	int xe, sys;
+	int gt;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_device_get(xe);
+
+		sys = igt_sysfs_open(xe);
+		igt_require(sys != -1);
+	}
+	igt_subtest_with_dynamic("defaults") {
+		xe_for_each_gt(xe, gt) {
+			int engines = -1;
+			char buf[100];
+
+			sprintf(buf, "device/gt%d/engines", gt);
+			engines = openat(sys, buf, O_RDONLY);
+			igt_require(engines != -1);
+
+			igt_sysfs_engines(xe, engines, NULL, test_defaults);
+
+			close(engines);
+		}
+	}
+
+	igt_fixture {
+		close(sys);
+		xe_device_put(xe);
+		close(xe);
+	}
+}
+
-- 
2.25.1
