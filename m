Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DF210E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 16:45:23 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Aug 2023 22:14:56 +0530
Message-Id: <20230824164457.2284937-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe_pm: Add d3-mmap IGT test
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

Adding a test to validate mmap memory mappings along with runtime
suspend and resume for both xe device and it's pci parent bridge
in device hierarchy.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/xe/xe_pm.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 2ec108d14..71a84d38e 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -40,6 +40,7 @@ typedef struct {
 } device_t;
 
 uint64_t orig_threshold;
+int fw_handle = -1;
 
 /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
 static bool runtime_usage_available(struct pci_device *pci)
@@ -167,6 +168,14 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
+static void close_fw_handle(int sig)
+{
+	if (fw_handle < 0)
+		return;
+
+	close(fw_handle);
+}
+
 /**
  * SUBTEST: %s-basic
  * Description: set GPU state to %arg[1] and test suspend/autoresume
@@ -438,6 +447,62 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
 }
 
+/**
+ * SUBTEST: d3-mmap
+ * Description:
+ *	Validate mmap memory mapping with d3 state, for vram memory region,
+ *	if supported by device.
+ * Functionality: pm-d3
+ * Run type: FULL
+ */
+static void test_mmap(device_t device)
+{
+	size_t bo_size = 8192;
+	uint8_t *map = NULL;
+	uint32_t bo;
+	int i;
+
+	bo = xe_bo_create_flags(device.fd_xe, 0, bo_size,
+				visible_vram_if_possible(device.fd_xe, 0));
+	map = xe_bo_map(device.fd_xe, bo, bo_size);
+	igt_assert(map);
+
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	for (i = 0; i < bo_size; i++)
+		map[i] = i & 0xFF;
+
+	for (i = 0; i < bo_size; i++)
+		igt_assert(map[i] == (i & 0xFF));
+
+	/* Runtime suspend and validate the pattern and clear the pattern */
+	close(fw_handle);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size; i++)
+		igt_assert(map[i] == (i & 0xFF));
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size; i++)
+		map[i] = (~i & 0xFF);
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	/* Runtime resume and check the pattern */
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	for (i = 0; i < bo_size; i++)
+		igt_assert(map[i] == (~i & 0xFF));
+
+	igt_assert(munmap(map, bo_size) == 0);
+	gem_close(device.fd_xe, bo);
+	close(fw_handle);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -543,6 +608,17 @@ igt_main
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
+	igt_describe("Validate mmap memory mappings, when device along with parent bridge in d3");
+	igt_subtest("d3-mmap") {
+		if (device.pci_root != device.pci_xe) {
+			igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+			igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+		}
+
+		igt_install_exit_handler(close_fw_handle);
+		test_mmap(device);
+	}
+
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.25.1
