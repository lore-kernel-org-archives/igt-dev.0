Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94D010E3FD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 12:02:21 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 17:32:05 +0530
Message-Id: <20230109120205.2259410-3-anshuman.gupta@intel.com>
In-Reply-To: <20230109120205.2259410-1-anshuman.gupta@intel.com>
References: <20230109120205.2259410-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/device_reset: Add warm_reset test
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

Adding gfx card root port warm reset support
by triggering secondary bus reset on root port.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_pci.c        | 28 ++++++++++++++++++++++++++++
 lib/igt_pci.h        |  5 +++++
 tests/device_reset.c | 18 +++++++++++++++---
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index 61aaf939d1..3940a0ee1e 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -51,3 +51,31 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 {
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
+
+/**
+ * igt_pci_bridge_warm_reset:
+ * @dev: pci bridge device
+ *
+ * return:
+ * true on success otherwise false.
+ */
+bool igt_pci_bridge_warm_reset(struct pci_device *dev)
+{
+	uint8_t header_type;
+	uint16_t bridge_ctl;
+
+	if (pci_device_cfg_read_u8(dev, &header_type, PCI_HEADER_TYPE))
+		return false;
+
+	igt_assert_f((header_type & 0x7f) == 1, "PCI device is not a Bridge\n");
+
+	if (pci_device_cfg_read_u16(dev, &bridge_ctl, PCI_TYPE_1_HEADER_BRIDGE_CTL))
+		return false;
+
+	bridge_ctl |=  PCI_TYPE_1_SEC_BUS_RESET;
+
+	if (pci_device_cfg_write_u16(dev, bridge_ctl, PCI_TYPE_1_HEADER_BRIDGE_CTL))
+		return false;
+
+	return true;
+}
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 92b9cc3929..f755e4baab 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -12,6 +12,10 @@
 /* forward declaration */
 struct pci_device;
 
+#define PCI_HEADER_TYPE 0xe
+#define PCI_TYPE_1_HEADER_BRIDGE_CTL 0x3e
+#define  PCI_TYPE_1_SEC_BUS_RESET (1 << 6)
+
 #define PCI_TYPE0_1_HEADER_SIZE 0x40
 #define PCI_CAPS_START 0x34
 #define PCI_CFG_SPACE_SIZE 0x100
@@ -24,5 +28,6 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+bool igt_pci_bridge_warm_reset(struct pci_device *dev);
 
 #endif
diff --git a/tests/device_reset.c b/tests/device_reset.c
index fe26030783..cbb5bef443 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -22,8 +22,9 @@ IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
 #define DEV_BUS_ADDR_LEN 13 /* addr has form 0000:00:00.0 */
 
 enum reset {
-	COLD_RESET,
-	FLR_RESET
+	FLR_RESET,
+	WARM_RESET,
+	COLD_RESET
 };
 
 /**
@@ -39,6 +40,7 @@ struct device_data {
 	} fds;
 	char dev_bus_addr[DEV_BUS_ADDR_LEN];
 	bool snd_unload;
+	struct pci_device *root;
 };
 
 static int __open_sysfs_dir(int fd, const char* path)
@@ -336,6 +338,8 @@ static void initiate_device_reset(struct device_data *dev, enum reset type)
 
 	if (type == FLR_RESET) {
 		igt_assert(igt_sysfs_set(dev->fds.dev_dir, "reset", "1"));
+	} else if (type == WARM_RESET) {
+		igt_assert(igt_pci_bridge_warm_reset(dev->root));
 	} else if (type == COLD_RESET) {
 		igt_assert(igt_sysfs_set(dev->fds.slot_dir, "power", "0"));
 		igt_assert(!igt_sysfs_get_boolean(dev->fds.slot_dir, "power"));
@@ -404,7 +408,7 @@ static void unbind_reset_rebind(struct device_data *dev, enum reset type)
 
 igt_main
 {
-	struct device_data dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
+	struct device_data dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, .root = NULL};
 
 	igt_fixture {
 		char dev_path[PATH_MAX];
@@ -417,6 +421,7 @@ igt_main
 		set_device_filter(dev_path);
 
 		igt_skip_on(!is_sysfs_reset_supported(dev.fds.dev));
+		dev.root = igt_device_get_pci_root_port(dev.fds.dev);
 	}
 
 	igt_describe("Unbinds driver from device, initiates reset"
@@ -432,6 +437,13 @@ igt_main
 		healthcheck(&dev);
 	}
 
+	igt_describe("Unbinds driver from device, initiates warm reset"
+		     " then rebinds driver to device");
+	igt_subtest("unbind-warm-reset-rebind") {
+		unbind_reset_rebind(&dev, WARM_RESET);
+		healthcheck(&dev);
+	}
+
 	igt_subtest_group {
 		igt_fixture {
 			igt_skip_on_f(dev.fds.slot_dir < 0, "Gfx Card does not support any "
-- 
2.25.1
