Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298FE10E3D8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 12:00:00 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 17:29:13 +0530
Message-Id: <20230808115913.1064831-3-anshuman.gupta@intel.com>
In-Reply-To: <20230808115913.1064831-1-anshuman.gupta@intel.com>
References: <20230808115913.1064831-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] test/xe_pm: Add vram_d3cold_threshold
 subtest
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

Adding a vram_d3cold_threshold subtest, which creates a Xe bo and
set the vram_d3cold_threshold according to vram used and bo size.
Test setups the d3cold and expect card to be limited to d3hot.

v2:
- Add subtest doc.
v3:
- skip the test on igfx. [Riana]
- Test doc enhancement. [Riana]
- Create the bo before vram query. [Riana]
- Use xe_bo_map insead of xe_bo_mmap_offset and mmap. [Riana]
- Close the bo handle. [Riana]
v3:
- Restore the vram_d3cold_threshold value. [Badal]
- Don't fail the test if there is no vram_d3cold_threshold.
- Test d3cold after closing the xe BO.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/xe/xe_pm.c | 121 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 23b8246ed..c9f2e57ea 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -19,6 +19,7 @@
 #include "igt.h"
 #include "lib/igt_device.h"
 #include "lib/igt_pm.h"
+#include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 
@@ -30,12 +31,16 @@
 #define NO_SUSPEND -1
 #define NO_RPM -1
 
+#define SIZE (4096 * 1024)
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
 	struct pci_device *pci_root;
 } device_t;
 
+uint64_t orig_threshold;
+
 /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
 static bool runtime_usage_available(struct pci_device *pci)
 {
@@ -76,6 +81,49 @@ static void set_d3cold_allowed(struct pci_device *pci,
 	close(fd);
 }
 
+static uint64_t get_vram_d3cold_threshold(int sysfs)
+{
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
+
+	ret = igt_sysfs_scanf(sysfs, path, "%lu", &threshold);
+	igt_assert(ret > 0);
+
+	return threshold;
+}
+
+static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, "%lu", threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert(ret > 0);
+}
+
+static void vram_d3cold_threshold_restore(int sig)
+{
+	int fd, sysfs_fd;
+
+	fd = drm_open_driver(DRIVER_XE);
+	sysfs_fd = igt_sysfs_open(fd);
+
+	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+
+	close(sysfs_fd);
+	close(fd);
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	switch (state) {
@@ -341,11 +389,75 @@ NULL));
 		igt_assert(in_d3(device, d_state));
 }
 
+/**
+ * SUBTEST: vram-d3cold-threshold
+ * Description:
+ *	Validate whether card is limited to d3hot while vram used
+ *	is greater than vram_d3cold_threshold.
+ * Run type: FULL
+ */
+static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
+	uint32_t bo, flags;
+	void *map;
+	int i;
+
+	igt_require(xe_has_vram(device.fd_xe));
+
+	flags = vram_memory(device.fd_xe, 0);
+	igt_require_f(flags, "Device doesn't support vram memory region\n");
+
+	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	mem_usage = malloc(query.size);
+	igt_assert(mem_usage);
+
+	query.data = to_user_pointer(mem_usage);
+	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	for (i = 0; i < mem_usage->num_regions; i++) {
+		if (mem_usage->regions[i].mem_class == XE_MEM_REGION_CLASS_VRAM) {
+			vram_used_mb +=  (mem_usage->regions[i].used / (1024 * 1024));
+			vram_total_mb += (mem_usage->regions[i].total_size / (1024 * 1024));
+		}
+	}
+
+	threshold = vram_used_mb;
+	igt_require(threshold < vram_total_mb);
+
+	bo = xe_bo_create_flags(device.fd_xe, 0, SIZE, flags);
+	map = xe_bo_map(device.fd_xe, bo, SIZE);
+	memset(map, 0, SIZE);
+	munmap(map, SIZE);
+	set_vram_d3cold_threshold(sysfs_fd, threshold);
+
+	/* Setup D3Cold but card should be in D3hot */
+	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
+	sleep(1);
+	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	igt_assert(out_of_d3(device, IGT_ACPI_D3Cold));
+	gem_close(device.fd_xe, bo);
+
+	/* Test D3Cold again after free up the Xe BO */
+	sleep(1);
+	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	device_t device;
 	char d3cold_allowed[2];
+	int sysfs_fd;
 	const struct s_state {
 		const char *name;
 		enum igt_suspend_state state;
@@ -378,6 +490,7 @@ igt_main
 
 		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
+		sysfs_fd = igt_sysfs_open(device.fd_xe);
 	}
 
 	for (const struct s_state *s = s_states; s->name; s++) {
@@ -437,7 +550,15 @@ igt_main
 		}
 	}
 
+	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
+	igt_subtest("vram-d3cold-threshold") {
+		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+		igt_install_exit_handler(vram_d3cold_threshold_restore);
+		test_vram_d3cold_threshold(device, sysfs_fd);
+	}
+
 	igt_fixture {
+		close(sysfs_fd);
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
 		xe_device_put(device.fd_xe);
-- 
2.25.1
