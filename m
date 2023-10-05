Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F2010E3EA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 12:03:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 17:24:14 +0530
Message-Id: <20231005115415.2951265-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231005115415.2951265-1-bhanuprakash.modem@intel.com>
References: <20231005115415.2951265-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 2/3] tests/intel/pm_rpm: Split module-reload
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

Split module-reload test as with & w/o display.

- i915_pm_rpm@module-reload: Without display
- kms_pm_rpm@module-reload:  With display

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/i915_pm_rpm.c | 11 -----------
 tests/intel/kms_pm_rpm.c  | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 2b0a63bde..c0365b304 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -1468,17 +1468,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 		teardown_environment(false);
 
-		igt_debug("Reload as normal\n");
-		igt_i915_driver_unload();
-
-		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
-		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
-
-		igt_assert(setup_environment(true));
-		pci_dev = igt_device_get_pci_device(drm_fd);
-		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
-		teardown_environment(true);
-
 		/* Remove our mmio_debugging module */
 		igt_i915_driver_unload();
 	}
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 2882e265f..3e578cbf7 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -114,6 +114,9 @@
  * SUBTEST: modeset-stress-extra-wait
  * Description: Stress test with modeset (extra wait) using runtime PM
  *
+ * SUBTEST: module-reload
+ * Description: Test to check D3 state after module reload
+ *
  * SUBTEST: pc8-residency
  * Description: Basic sanity test for PC8+ states
  *
@@ -1697,4 +1700,23 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		teardown_environment();
 		forcewake_put(&ms_data);
 	}
+
+	igt_subtest("module-reload") {
+		struct pci_device *pci_dev;
+
+		igt_i915_driver_unload();
+
+		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
+		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
+
+		igt_assert(setup_environment());
+		pci_dev = igt_device_get_pci_device(drm_fd);
+		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
+		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
+			drm_resources_equal_subtest();
+		teardown_environment();
+
+		/* Remove our mmio_debugging module */
+		igt_i915_driver_unload();
+	}
 }
-- 
2.40.0
