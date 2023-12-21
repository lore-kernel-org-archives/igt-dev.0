Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB1310E6D3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 16:35:04 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 3/4] tests/xe_pm: Add d3-mmap IGT test
Date: Thu, 21 Dec 2023 22:03:37 +0530
Message-Id: <20231221163338.2157257-4-anshuman.gupta@intel.com>
In-Reply-To: <20231221163338.2157257-1-anshuman.gupta@intel.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding a test to validate mmap memory mappings along with runtime
suspend and resume for both xe device and it's pci parent bridge
in device hierarchy.

v2:
- Use 0xc00fee pattern. [Rodrigo]
- Test the pagefault case on read and write the mapping. [Rodrigo]

v3:
- Cosmetic comment. [Kamil]
- Use MAGIC macro for 0xc0ffe and 0xdeadbeef. [Kamil]
- Fix xe_bo_create() with respect to Xe uapi.
- Set auto_suspend delay to 1000ms and restore it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c4ec38ae3..9e7c523eb 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -30,6 +30,8 @@
 #define NO_RPM -1
 
 #define SIZE (4096 * 1024)
+#define MAGIC_1 0xc0ffee
+#define MAGIC_2 0xdeadbeef
 
 typedef struct {
 	int fd_xe;
@@ -447,6 +449,84 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
 }
 
+/**
+ * SUBTEST: d3-mmap-%s
+ * Description:
+ *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	if supported by device.
+ * arg[1]:
+ *
+ * @vram:	vram region
+ * @system:	system region
+ *
+ * Functionality: pm-d3
+ * Run type: FULL
+ */
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+{
+	size_t bo_size = 8192;
+	uint32_t *map = NULL;
+	uint32_t bo;
+	int i, delay_ms;
+
+	igt_require_f(placement, "Device doesn't support such memory region\n");
+
+	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
+
+	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
+	map = xe_bo_map(device.fd_xe, bo, bo_size);
+	igt_assert(map);
+	memset(map, 0, bo_size);
+
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		map[i] = MAGIC_1;
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_1);
+
+	/* Runtime suspend and validate the pattern and changed the pattern */
+	close(fw_handle);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_1);
+
+	/* dgfx page-fault on mmaping should wake the gpu */
+	if (xe_has_vram(device.fd_xe)) {
+		/* Give some auto suspend delay to validate rpm active */
+		delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+		igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+		igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+	}
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		map[i] = MAGIC_2;
+
+	if (xe_has_vram(device.fd_xe))
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	/* Runtime resume and check the pattern */
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_2);
+
+	igt_assert(munmap(map, bo_size) == 0);
+	gem_close(device.fd_xe, bo);
+	close(fw_handle);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -557,6 +637,23 @@ igt_main
 			igt_install_exit_handler(vram_d3cold_threshold_restore);
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
+
+		igt_describe("Validate mmap memory mappings with system region,"
+			     "when device along with parent bridge in d3");
+		igt_subtest("d3-mmap-system") {
+			test_mmap(device, system_memory(device.fd_xe), 0);
+		}
+
+		igt_describe("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in d3");
+		igt_subtest("d3-mmap-vram") {
+			if (device.pci_root != device.pci_xe) {
+				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+			}
+
+			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1
