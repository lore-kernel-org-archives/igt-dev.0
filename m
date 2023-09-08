Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 13:45:21 +0530
Message-Id: <20230908081521.3305380-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH V2 i-g-t] tests/xe_drm_fdinfo: Add tests to read
 and verify fdinfo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests to verify fdinfo published by xe KMD with
following subtests :
@basic
@drm-total-residents
@drm-shared
@drm-active

TODO: drm-purgeable test is not possbile as we consider objects in
system memory to be purgeable but current xe KMD does not allow
BOs to be created in system memory (instead KMD creates it in
XE_PL_TT which is VRAM backed system memory).

V2:
  - Replace printf with igt_info - Kamil
  - run checkpatch - Kamil
  - use igt_assert_f - Kamil

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 266 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 267 insertions(+)
 create mode 100644 tests/intel/xe_drm_fdinfo.c

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
new file mode 100644
index 000000000..8aa753d95
--- /dev/null
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_device.h"
+#include "igt_drm_fdinfo.h"
+#include "lib/igt_syncobj.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+/**
+ * TEST: xe drm fdinfo
+ * Description: Read and verify drm client memory consumption using fdinfo
+ * Feature: SMI, core
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: basic
+ * Description: Check if basic fdinfo content is present
+ *
+ * SUBTEST: drm-total-resident
+ * Description: Create and compare total and resident memory consumption by client
+ *
+ * SUBTEST: drm-shared
+ * Description: Create and compare shared memory consumption by client
+ *
+ * SUBTEST: drm-active
+ * Description: Create and compare active memory consumption by client
+ */
+
+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
+
+/* Subtests */
+static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_client_fdinfo info = { };
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+#define N_EXEC_QUEUES   2
+	uint32_t exec_queues[N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[N_EXEC_QUEUES];
+	uint32_t syncobjs[N_EXEC_QUEUES + 1];
+	size_t bo_size;
+	uint32_t bo = 0;
+	int region = 0x2; /* VRAM 0 */
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * N_EXEC_QUEUES;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+			region);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < N_EXEC_QUEUES; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	}
+	syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size,
+			sync, 1);
+
+	for (i = 0; i < N_EXEC_QUEUES; i++) {
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = addr + spin_offset;
+		int e = i;
+
+		if (i == 0) {
+			xe_spin_init(&data[i].spin, spin_addr, true);
+			exec.exec_queue_id = exec_queues[e];
+			exec.address = spin_addr;
+			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+			sync[1].handle = syncobjs[e];
+			xe_exec(fd, &exec);
+			xe_spin_wait_started(&data[i].spin);
+
+			addr += bo_size;
+			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+			sync[1].handle = syncobjs[e];
+			xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+					bo_size, sync + 1, 1);
+			addr += bo_size;
+		} else {
+			sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+					bo_size, sync, 1);
+		}
+
+		b = igt_parse_drm_fdinfo(fd, &info, NULL, 0, NULL, 0);
+		igt_assert_f(b != 0, "failed with err:%d\n", errno);
+
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence if bo is active on
+		 * N_EXEC_QUEUES consumption should be
+		 * >= bo_size + bo_size * N_EXEC_QUEUES
+		 */
+		igt_info("info.total:%ld active:%ld bo_size:%ld\n",
+				info.region_mem[region].total,
+				info.region_mem[region].active, bo_size);
+		igt_assert(info.region_mem[region].active >=
+				bo_size + bo_size * N_EXEC_QUEUES);
+	}
+	xe_spin_end(&data[0].spin);
+
+	syncobj_destroy(fd, sync[0].handle);
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < N_EXEC_QUEUES; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+		xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_shared(int xe)
+{
+	struct drm_client_fdinfo info = { };
+	struct drm_gem_flink flink;
+	struct drm_gem_open open_struct;
+	uint32_t bo;
+	int region = 0x1;
+	int ret;
+
+	bo = xe_bo_create_flags(xe, 0, 4096, region);
+
+	flink.handle = bo;
+	ret = igt_ioctl(xe, DRM_IOCTL_GEM_FLINK, &flink);
+	igt_assert_eq(ret, 0);
+
+	open_struct.name = flink.name;
+	ret = igt_ioctl(xe, DRM_IOCTL_GEM_OPEN, &open_struct);
+	igt_assert_eq(ret, 0);
+	igt_assert(open_struct.handle != 0);
+
+	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+
+	igt_info("info.total:%ld shared:%ld\n",
+			info.region_mem[region].total,
+			info.region_mem[region].shared);
+	igt_assert_eq(info.region_mem[region].shared,
+			2 * 4096);
+
+	gem_close(xe, bo);
+}
+
+static void test_total_resident(int xe)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(xe), region;
+	struct drm_client_fdinfo info = { };
+	uint32_t vm;
+	uint32_t handle;
+	uint64_t addr = 0x1a0000;
+	int ret;
+
+	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+
+	xe_for_each_mem_region(xe, memreg, region) {
+		memregion = xe_mem_region(xe, region);
+
+		handle = xe_bo_create_flags(xe, vm, memregion->min_page_size, region);
+		xe_vm_bind_sync(xe, vm, handle, 0, addr, memregion->min_page_size);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+		/* currently xe KMD maps memory class system region to
+		 * XE_PL_TT thus we need memregion->instance + 1
+		 */
+		igt_info("info.total:%ld resident:%ld for instance: %d bo_size:%d\n",
+				info.region_mem[memregion->instance + 1].total,
+				info.region_mem[memregion->instance + 1].resident,
+				memregion->instance, memregion->min_page_size);
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence it should be
+		 * >= memregion->min_page_size
+		 */
+		igt_assert(info.region_mem[memregion->instance + 1].total >=
+				memregion->min_page_size);
+		igt_assert(info.region_mem[memregion->instance + 1].resident >=
+				memregion->min_page_size);
+		xe_vm_unbind_sync(xe, vm, 0, addr, memregion->min_page_size);
+		gem_close(xe, handle);
+	}
+
+	xe_vm_destroy(xe, vm);
+}
+
+static void basic(int xe)
+{
+	struct drm_client_fdinfo info = { };
+	unsigned int ret;
+
+	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+
+	igt_assert(!strcmp(info.driver, "xe"));
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		struct drm_client_fdinfo info = { };
+
+		xe = drm_open_driver(DRIVER_XE);
+		igt_require_xe(xe);
+		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
+	}
+
+	igt_describe("Check if basic fdinfo content is present");
+	igt_subtest("basic")
+		basic(xe);
+
+	igt_describe("Create and compare total and resident memory consumption by client");
+	igt_subtest("drm-total-resident")
+		test_total_resident(xe);
+
+	igt_describe("Create and compare shared memory consumption by client");
+	igt_subtest("drm-shared")
+		test_shared(xe);
+
+	igt_describe("Create and compare active memory consumption by client");
+	igt_subtest("drm-active")
+		test_active(xe, xe_hw_engine(xe, 0));
+
+	igt_fixture {
+		drm_close_driver(xe);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index aa8e3434c..f5f495050 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -275,6 +275,7 @@ intel_xe_progs = [
 	'xe_compute',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
+	'xe_drm_fdinfo',
 	'xe_evict',
 	'xe_exec_balancer',
 	'xe_exec_basic',
-- 
2.25.1
