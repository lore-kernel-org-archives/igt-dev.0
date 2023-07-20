Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96410E029
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 04:26:47 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 10:00:15 +0530
Message-Id: <20230720043015.1677140-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: Add a test that validates GT C0
 on exec
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

Add a test that validates if GT is in C0 while
running a spinner on an engine of the gt

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index a20c4449c..7614af761 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -14,6 +14,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
 #define SLEEP_DURATION 3000 /* in milliseconds */
@@ -76,6 +77,38 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }
 
+/**
+ * SUBTEST: gt-c0-on-exec
+ * Description: Validate if GT is in C0 while running a spinner
+ *		on an engine of that GT
+ * Run type: FULL
+ */
+static void test_c0_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint64_t ahnd;
+	unsigned int engine;
+	uint32_t vm;
+	igt_spin_t *spin;
+
+	/* Start with GT in C6 */
+	igt_assert_f(igt_wait(is_gt_in_c6(fd, hwe->gt_id), 1000, 1), "GT is not in C6\n");
+
+	igt_debug("Run on engine: %s:%d\n",
+		  xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
+	vm = xe_vm_create(fd, 0, 0);
+	engine = xe_engine_create(fd, vm, hwe, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm);
+
+	/* GT should be in C0 when busy */
+	igt_assert_f(!is_gt_in_c6(fd, hwe->gt_id), "GT in C6\n");
+
+	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: idle-residency
  * Description: basic residency test to validate idle residency
@@ -101,12 +134,18 @@ static void test_idle_residency(int fd, int gt)
 igt_main
 {
 	int fd, gt;
+	struct drm_xe_engine_class_instance *hwe;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
 	}
 
+	igt_describe("Validate GT C0 on exec");
+	igt_subtest("gt-c0-on-exec")
+		xe_for_each_hw_engine(fd, hwe)
+			test_c0_exec(fd, hwe);
+
 	igt_describe("Validate GT C6 on idle");
 	igt_subtest("gt-c6-on-idle")
 		xe_for_each_gt(fd, gt)
-- 
2.40.0
