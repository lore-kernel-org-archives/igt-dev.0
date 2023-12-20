Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8073310E630
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 23:37:59 +0000 (UTC)
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe: CLOS Based Cache Reservation test
Date: Thu, 21 Dec 2023 05:15:53 +0530
Message-Id: <20231220234553.3862244-1-pallavi.mishra@intel.com>
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

Add basic test for new CLOS interface

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 include/drm-uapi/xe_drm.h |  70 +++++++++++++++++
 tests/intel/xe_clos.c     | 154 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 3 files changed, 225 insertions(+)
 create mode 100644 tests/intel/xe_clos.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..d01380e73 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -100,6 +100,10 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_CLOS_RESERVE		0x0b
+#define DRM_XE_CLOS_FREE		0x0c
+#define DRM_XE_CACHE_RESERVE		0x0d
+	
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +117,9 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_CLOS_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_RESERVE, struct drm_xe_clos_reserve)
+#define DRM_IOCTL_XE_CLOS_FREE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CLOS_FREE, struct drm_xe_clos_free)
+#define DRM_IOCTL_XE_CACHE_RESERVE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_CACHE_RESERVE, struct drm_xe_cache_reserve)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1340,6 +1347,69 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_clos_reserve
+ *
+ * Allows clients to request reservation of one free CLOS, to use in subsequent
+ * Cache Reservations.
+ *
+ */
+struct drm_xe_clos_reserve {
+        /** @clos_index: clos index for reservation */
+        __u16 clos_index;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
+/**
+ * struct drm_xe_clos_free
+ *
+ * Free off a previously reserved CLOS set. Any corresponding Cache Reservations
+ * that are active for the CLOS are automatically dropped and returned to the
+ * Shared set.
+ *
+ * The clos_index indicates the CLOS set which is being released and must
+ * correspond to a CLOS index previously reserved.
+ *
+ */
+struct drm_xe_clos_free {
+        /** clos_index: free clos index */
+        __u16 clos_index;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
+/**
+ * struct drm_xe_cache_reserve
+ *
+ * Allows clients to request, or release, reservation of one or more cache ways,
+ * within a previously reserved CLOS set.
+ *
+ * If num_ways = 0, KMD will drop any existing Reservation for the specified
+ * clos_index and cache_level. The requested clos_index and cache_level Waymasks
+ * will then track the Shared set once again.
+ *
+ * Otherwise, the requested number of Ways will be removed from the Shared set
+ * for the requested cache level, and assigned to the Cache and CLOS specified
+ * by cache_level/clos_index.
+ *
+ */
+struct drm_xe_cache_reserve {
+        /** @clos_index: reserved clos index */
+        __u16 clos_index;
+
+       /** @cache_level: level of cache  */
+        __u16 cache_level; /* e.g. 3 for L3 */
+
+       /** @num_ways: cache ways */
+        __u16 num_ways;
+
+       /** @pad: MBZ */
+        __u16 pad16;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_clos.c b/tests/intel/xe_clos.c
new file mode 100644
index 000000000..d33cd5f19
--- /dev/null
+++ b/tests/intel/xe_clos.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+/** @file xe_clos.c
+ *
+ * This is the basic test for clos functionality.
+ *
+ * The goal is to simply ensure that basics work.
+ */
+
+#include "igt.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
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
+
+/*Select a pat index for given clos index */
+static uint8_t pat_index(uint16_t clos_index, uint8_t cache_type, uint16_t devid)
+{
+	if (IS_PONTEVECCHIO(devid))
+		return (clos_index == 0 ? cache_type :
+		       (4 + (clos_index - 1) * 2 + (cache_type - MEM_TYPE_WT) ));
+	else
+		return (clos_index == 0 ? cache_type :
+			(22 + (clos_index - 1) * 4); /* pat index mapped to 1 - way*/
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
index a6a8498e2..0f61e605b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
+	'xe_clos',
 ]
 
 msm_progs = [
-- 
2.25.1
