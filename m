Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756210E763
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 09:22:01 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] [RFC] tests/intel: Add tests to run suspend without display
Date: Fri, 22 Dec 2023 15:06:54 +0530
Message-Id: <20231222093654.923541-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add tasts to validate s3/s2idle suspend cycle without display
module to rule out display related issues from the suspend/resume
stack.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/xe_pm.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 602729daf..55088e7fa 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -17,6 +17,7 @@
 #include "igt.h"
 #include "lib/igt_device.h"
 #include "lib/igt_pm.h"
+#include "lib/igt_kmod.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -364,6 +365,30 @@ NULL));
 		igt_assert(in_d3(device, d_state));
 }
 
+/**
+ * SUBTEST: s2idle-without-display
+ * Functionality: pm
+ * Description: validate the s2idle cycle without display
+ */
+
+/**
+ * SUBTEST: s3-without-display
+ * Functionality: pm
+ * Description: validate the s3 cycle without display
+ */
+
+static void
+test_suspend_without_display(int state)
+{
+	igt_kmsg(KMSG_INFO "Unloading Xe\n");
+	igt_assert_eq(igt_xe_driver_unload(),0);
+
+	igt_kmsg(KMSG_INFO "Re-loading Xe\n");
+	igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
+
+	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+}
+
 /**
  * SUBTEST: vram-d3cold-threshold
  * Functionality: pm - d3cold
@@ -536,6 +561,14 @@ igt_main
 		}
 	}
 
+	igt_describe("Validate s2idle without display");
+	igt_subtest("s2idle-without-display")
+		test_suspend_without_display(SUSPEND_STATE_FREEZE);
+
+	igt_describe("Validate s3 without display");
+	igt_subtest("s3-without-display")
+		test_suspend_without_display(SUSPEND_STATE_S3);
+
 	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
 	igt_subtest("vram-d3cold-threshold") {
 		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
-- 
2.25.1
