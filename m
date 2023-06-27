Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA83810E28F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 06:00:44 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 11:33:49 +0530
Message-Id: <20230627060349.378544-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/xe: Add basic idle residency test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The test reads idle residency within a time interval and
checks if its within the tolerance

Patch for gtidle properties
https://patchwork.freedesktop.org/series/119262/

v2:
   - rename file to xe_pm_residency
   - add kernel patch in commit message (Kamil)

v3:
   - add igt test description (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/meson.build          |   1 +
 tests/xe/xe_pm_residency.c | 120 +++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 tests/xe/xe_pm_residency.c

diff --git a/tests/meson.build b/tests/meson.build
index 85ea7e74..cde4447e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -265,6 +265,7 @@ xe_progs = [
 	'xe_module_load',
 	'xe_noexec_ping_pong',
 	'xe_pm',
+	'xe_pm_residency',
 	'xe_prime_self_import',
 	'xe_query',
 	'xe_vm',
diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
new file mode 100644
index 00000000..19fbe14e
--- /dev/null
+++ b/tests/xe/xe_pm_residency.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Test gtidle properties
+ * Category: Software building block
+ * Sub-category: Power Management
+ * Functionality: GT C States
+ * Test category: functionality test
+ */
+
+#include <limits.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_query.h"
+
+#define SLEEP_DURATION 3000 /* in milliseconds */
+
+const double tolerance = 0.1;
+
+#define assert_within_epsilon(x, ref, tol) \
+	igt_assert_f((double)(x) <= (1.0 + (tol)) * (double)(ref) && \
+		     (double)(x) >= (1.0 - (tol)) * (double)(ref), \
+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
+		     #x, #ref, (double)(x), \
+		     (tol) * 100.0, (tol) * 100.0, \
+		     (double)(ref))
+
+IGT_TEST_DESCRIPTION("Tests for gtidle properties");
+
+static unsigned int measured_usleep(unsigned int usec)
+{
+	struct timespec ts = { };
+	unsigned int slept;
+
+	slept = igt_nsec_elapsed(&ts);
+	igt_assert(slept == 0);
+	do {
+		usleep(usec - slept);
+		slept = igt_nsec_elapsed(&ts) / 1000;
+	} while (slept < usec);
+
+	return igt_nsec_elapsed(&ts) / 1000;
+}
+
+static bool in_gt_c6(int sysfs, int gt)
+{
+	char path[PATH_MAX];
+	char gt_c_state[8];
+
+	sprintf(path, "device/gt%d/gtidle/idle_status", gt);
+	if (igt_sysfs_scanf(sysfs, path, "%s", gt_c_state) < 0)
+		return false;
+
+	return strcmp(gt_c_state, "gt-c6") == 0;
+}
+
+static unsigned long read_idle_residency(int sysfs, int gt)
+{
+	unsigned long residency;
+	char path[PATH_MAX];
+
+	residency = 0;
+	sprintf(path, "device/gt%d/gtidle/idle_residency_ms", gt);
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1);
+	return residency;
+}
+
+/**
+ * SUBTEST: idle-residency
+ * Description: basic residency test to check idle residency
+ *		within a time interval is within tolerance
+ * Run type: FULL
+ */
+static void test_idle_residency(int sysfs, int gt)
+{
+	unsigned long elapsed_ms, residency_start, residency_end;
+
+	assert(igt_wait(in_gt_c6(sysfs, gt), 1000, 1));
+
+	residency_start = read_idle_residency(sysfs, gt);
+	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
+	residency_end = read_idle_residency(sysfs, gt);
+
+	igt_info("Measured %lums of idle residency in %lums\n",
+		 residency_end - residency_start, elapsed_ms);
+
+	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
+}
+
+igt_main
+{
+	int fd, gt;
+	static int sysfs = -1;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+
+		xe_device_get(fd);
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
+
+		sysfs = igt_sysfs_open(fd);
+		igt_assert(sysfs != -1);
+	}
+
+	igt_describe("check idle residency within a time interval is within tolerance");
+	igt_subtest("idle-residency")
+		xe_for_each_gt(fd, gt)
+			test_idle_residency(sysfs, gt);
+
+	igt_fixture {
+		close(sysfs);
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.40.0
