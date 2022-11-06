Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C80110E083
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Nov 2022 13:44:51 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Nov 2022 19:14:38 +0530
Message-Id: <20221106134438.2831320-3-anshuman.gupta@intel.com>
In-Reply-To: <20221106134438.2831320-1-anshuman.gupta@intel.com>
References: <20221102115851.2223804-2-anshuman.gupta@intel.com>
 <20221106134438.2831320-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] test/i915_pm_rpm: Verify bridge
 binds with pcieport driver
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

It has been observed that on some Intel x86 host,
PCI core does not bind the Intel dgfx pci card's pci bridge
devices(virtual switch ports) to the pcieport driver.
This leaves pci bridge devices to D0 state and burns power on
dgfx card. It will block the card d3cold as well.
Therefore skip the basic-pci-d3-state subtest in case of
bridge pci devices do not bind with pcieport driver.

v2:
- Commit log modification. [Rodrigo]
- Kept a separate patch for unrelated changes. [Rodrigo]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_rpm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 7a05eccd2..719724f2b 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1559,15 +1559,20 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
 
 static void pci_d3_state_subtest(void)
 {
-	struct pci_device *pci_dev;
+	struct pci_device *pci_dev, *bridge_pci_dev;
 
 	igt_require(has_runtime_pm);
 
 	pci_dev = igt_device_get_pci_device(drm_fd);
+	bridge_pci_dev = pci_device_get_parent_bridge(pci_dev);
 
 	disable_all_screens_and_wait(&ms_data);
 	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 
+	if (gem_has_lmem(drm_fd))
+		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
+			      "pci bridge device does not bind with pcieport driver\n");
+
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	igt_assert(!device_in_pci_d3(pci_dev));
 	forcewake_put(&ms_data);
-- 
2.25.1
