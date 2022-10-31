Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0629F10E2B3
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 13:56:42 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 19:26:52 +0530
Message-Id: <20221031135652.2342078-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/i915_pm_rpm: Verify bridge binds with
 pcieport driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

It has been observed that on some Intel x86 host PCI core
does not bind the Intel dgfx catds's pci bridge
devices(virtual switch port) to the pcieport driver.
This leaves the pci bridge devices to D0 state and
burns power on dgfx card.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 1ff69a060a..92c30ae791 100644
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
@@ -1559,10 +1559,18 @@ static bool device_in_pci_d3(void)
 
 static void pci_d3_state_subtest(void)
 {
+	struct pci_device *pci_dev, *bridge_pci_dev;
+
 	igt_require(has_runtime_pm);
 
+	pci_dev = igt_device_get_pci_device(drm_fd);
+	bridge_pci_dev = pci_device_get_parent_bridge(pci_dev);
+
 	disable_all_screens_and_wait(&ms_data);
-	igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
+	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
+
+	if (gem_has_lmem(drm_fd))
+		igt_require((pci_device_has_kernel_driver(bridge_pci_dev));
 
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	igt_assert(!device_in_pci_d3());
-- 
2.38.0
