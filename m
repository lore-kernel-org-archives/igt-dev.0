Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287A10E0FB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 11:27:10 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 16:56:21 +0530
Message-Id: <20230628112621.4084988-3-anshuman.gupta@intel.com>
In-Reply-To: <20230628112621.4084988-1-anshuman.gupta@intel.com>
References: <20230628112621.4084988-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] test/xe_pm: Add
 vram_d3cold_threshold subtest
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

Adding a vram_d3cold_threshold subtest, which creates a Xe bo and
set the vram_d3cold_threshold according to vram used and bo size.
Test setups the d3cold and expect card to be limited to d3hot.

v2:
- Add subtest doc.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/xe/xe_pm.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index c71fce892..eaafead23 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -19,6 +19,7 @@
 #include "igt.h"
 #include "lib/igt_device.h"
 #include "lib/igt_pm.h"
+#include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 
@@ -30,6 +31,8 @@
 #define NO_SUSPEND -1
 #define NO_RPM -1
 
+#define SIZE (4096 * 1024)
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -77,6 +80,22 @@ static void set_d3cold_allowed(struct pci_device *pci,
 	close(fd);
 }
 
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
+	igt_info("ret value %d", ret);
+	igt_assert(ret > 0);
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	switch (state) {
@@ -359,6 +378,62 @@ NULL));
 		igt_assert(in_d3(device, d_state));
 }
 
+/**
+ * SUBTEST: vram_d3cold_threshold
+ * Description:
+ *	Validate whether card is limited to d3hot while vram used
+ *	is greater than vram_d3cold_threshol_d3cold.
+ * Run type: FULL
+ */
+static void test_vram_d3cold_threshold(device_t device)
+{
+	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.size = 0,
+		.data = 0,
+	};
+	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold, mmo;
+	uint32_t bo;
+	void *map;
+	int i, sysfs_fd;
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
+	bo = xe_bo_create_flags(device.fd_xe, 0, SIZE, vram_memory(device.fd_xe, 0));
+	mmo = xe_bo_mmap_offset(device.fd_xe, bo);
+	map = mmap(NULL, SIZE, PROT_WRITE, MAP_SHARED, device.fd_xe, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	memset(map, 0, SIZE);
+	munmap(map, SIZE);
+	threshold = vram_used_mb + (SIZE / (1024 * 1024));
+	igt_require(threshold < vram_total_mb);
+	sysfs_fd = igt_sysfs_open(device.fd_xe);
+	set_vram_d3cold_threshold(sysfs_fd, threshold);
+	close(sysfs_fd);
+
+	/* Setup D3Cold but card should be in D0 */
+	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
+	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	igt_assert(out_of_d3(device, IGT_ACPI_D3Cold));
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -456,6 +531,11 @@ igt_main
 		}
 	}
 
+	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
+	igt_subtest("vram-d3cold-threshold") {
+		test_vram_d3cold_threshold(device);
+	}
+
 	igt_fixture {
 		display_fini(&device);
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
-- 
2.25.1
