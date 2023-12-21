Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950810E6EF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 20:26:40 +0000 (UTC)
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_clos: CLOS Based Cache
 Reservation test
Date: Fri, 22 Dec 2023 02:04:19 +0530
Message-Id: <20231221203419.3924552-3-pallavi.mishra@intel.com>
In-Reply-To: <20231221203419.3924552-1-pallavi.mishra@intel.com>
References: <20231221203419.3924552-1-pallavi.mishra@intel.com>
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

Add basic test for new Class of Service interface

PVC and XE2 expose control over each Cache through the
Class of Service (CLOS) feature. CLOS allows to define
which portions of a cache may be used for a given
allocation through a set of Waymask controls grouped
into multiple sets.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/intel/xe_clos.c | 141 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 tests/intel/xe_clos.c

diff --git a/tests/intel/xe_clos.c b/tests/intel/xe_clos.c
new file mode 100644
index 000000000..37dfb22f3
--- /dev/null
+++ b/tests/intel/xe_clos.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+/** TEST: Basic test for clos functionality.
+ *  Category: Software building block
+ *  Sub-category: uapi
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+static uint16_t clos_entry_alloc(int fd)
+{
+	struct drm_xe_clos_reserve clos = {};
+
+	igt_ioctl(fd, DRM_IOCTL_XE_CLOS_RESERVE, &clos);
+	return clos.clos_index;
+}
+
+static void clos_entry_free(int fd, uint16_t clos_index)
+{
+	struct drm_xe_clos_reserve clos = {};
+
+	clos.clos_index = clos_index;
+	igt_ioctl(fd, DRM_IOCTL_XE_CLOS_FREE, &clos);
+}
+
+static int cache_way_alloc(int fd, uint16_t clos_index, uint16_t cache_level, uint16_t num_ways)
+{
+	struct drm_xe_cache_reserve cache = {};
+
+	cache.clos_index = clos_index;
+	cache.cache_level = cache_level;
+	cache.num_ways = num_ways;
+	igt_ioctl(fd, DRM_IOCTL_XE_CACHE_RESERVE, &cache);
+
+	return cache.num_ways;
+}
+
+#define MEM_TYPE_UC 0
+#define MEM_TYPE_WC 1
+#define MEM_TYPE_WT 2
+#define MEM_TYPE_WB 3
+
+/* PVC
+PAT Index      CLOS    MemType
+       0       0       UC (00)
+       1       0       WC (01)
+       2       0       WT (10)
+       3       0       WB (11)
+       4       1       WT (10)
+       5       1       WB (11)
+       6       2       WT (10)
+       7       2       WB (11)
+*/
+
+/* XE2
+ PAT Index      CLOS
+  0 - 15         0
+ 20 - 23         1
+ 24 - 27         2
+ 23 - 31         3
+*/
+
+/*Select a pat index for given clos index */
+static uint8_t pat_index(uint16_t clos_index, uint8_t cache_type, uint16_t devid)
+{
+	if (IS_PONTEVECCHIO(devid))
+		return (clos_index == 0 ? cache_type :
+		       (4 + (clos_index - 1) * 2 + (cache_type - MEM_TYPE_WT) ));
+	else
+		return (clos_index == 0 ? cache_type :
+			(22 + (clos_index - 1) * 4)); /* pat index mapped to 1 - way*/
+}
+
+#define PAGE_SIZE      4096l
+#define BATCH_VA       0x8000000000
+
+static void vm_bind_clos(int fd, uint16_t clos_index, uint16_t devid)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint32_t vm, bo;
+	uint8_t pat;
+	void *data;
+
+	data = mmap(0, size, PROT_READ |
+		    PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(data != MAP_FAILED);
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
+				  DRM_XE_GEM_CPU_CACHING_WB);
+
+	pat = pat_index(clos_index, MEM_TYPE_WB, devid);
+	
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+				   pat, 0),
+				   0);
+	
+	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+	munmap(data, size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);	
+}
+
+#define NUM_WAYS 2
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("clos_basic"){
+		uint16_t devid;
+		uint16_t clos_index;
+
+		devid = intel_get_drm_devid(fd);
+		igt_require((IS_PONTEVECCHIO(devid)) || (intel_get_device_info(devid)->graphics_ver >= 20));
+
+		clos_index = clos_entry_alloc(fd);
+		igt_debug("clos index=%d\n", clos_index);
+		cache_way_alloc(fd, clos_index, 3, NUM_WAYS);
+ 		vm_bind_clos(fd, clos_index, devid);
+		clos_entry_free(fd, clos_index);
+		cache_way_alloc(fd, clos_index, 3, 0);
+	}
+	igt_fixture {
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index a6a8498e2..1628311de 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,7 @@ intel_xe_progs = [
 	'xe_create',
 	'xe_compute',
 	'xe_copy_basic',
+	'xe_clos',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_drm_fdinfo',
-- 
2.25.1
