Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55F10E08F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 04:23:13 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 09:53:03 +0530
Message-Id: <20221107042303.2889567-1-anshuman.gupta@intel.com>
In-Reply-To: <20221102115851.2223804-2-anshuman.gupta@intel.com>
References: <20221102115851.2223804-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] test/i915_pm_rpm: cache pci_device
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

cache pci_device structure so that it can be passed as argument
to device_in_pci_d3() whenever required.

No functional change.

v2:
- Fixed CI Failures.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_rpm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 1ff69a060..7a05eccd2 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1545,12 +1545,12 @@ static void reg_read_ioctl_subtest(void)
 	igt_assert(wait_for_suspended());
 }
 
-static bool device_in_pci_d3(void)
+static bool device_in_pci_d3(struct pci_device *pci_dev)
 {
 	uint16_t val;
 	int rc;
 
-	rc = pci_device_cfg_read_u16(igt_device_get_pci_device(drm_fd), &val, 0xd4);
+	rc = pci_device_cfg_read_u16(pci_dev, &val, 0xd4);
 	igt_assert_eq(rc, 0);
 
 	igt_debug("%s: PCI D3 state=%d\n", __func__, val & 0x3);
@@ -1559,13 +1559,17 @@ static bool device_in_pci_d3(void)
 
 static void pci_d3_state_subtest(void)
 {
+	struct pci_device *pci_dev;
+
 	igt_require(has_runtime_pm);
 
+	pci_dev = igt_device_get_pci_device(drm_fd);
+
 	disable_all_screens_and_wait(&ms_data);
-	igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
+	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
-	igt_assert(!device_in_pci_d3());
+	igt_assert(!device_in_pci_d3(pci_dev));
 	forcewake_put(&ms_data);
 }
 
@@ -2250,14 +2254,17 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest("module-reload") {
+		struct pci_device *pci_dev;
+
 		igt_debug("Reload w/o display\n");
 		igt_i915_driver_unload();
 
 		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
 		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
+		pci_dev = igt_device_get_pci_device(drm_fd);
 
 		igt_assert(setup_environment(false));
-		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
+		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 		teardown_environment(false);
 
 		igt_debug("Reload as normal\n");
@@ -2265,9 +2272,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
 		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
+		pci_dev = igt_device_get_pci_device(drm_fd);
 
 		igt_assert(setup_environment(true));
-		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
+		igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
 			drm_resources_equal_subtest();
 		teardown_environment(true);
-- 
2.25.1
