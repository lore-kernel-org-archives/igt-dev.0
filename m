Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778B10E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 07:35:19 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com
Date: Tue,  3 Oct 2023 13:03:44 +0530
Message-Id: <20231003073344.20470-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
References: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] intel/xe_copy_basic: Add copy basic
 test to exercise blt commands
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add copy basic test to exercise copy commands like mem-copy and mem-set.

Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_copy_basic.c | 208 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 tests/intel/xe_copy_basic.c

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
new file mode 100644
index 000000000..9aed6e43c
--- /dev/null
+++ b/tests/intel/xe_copy_basic.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ *
+ * Authors:
+ *      Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "intel_blt.h"
+#include "lib/intel_cmds_info.h"
+#include "lib/intel_mocs.h"
+#include "lib/intel_reg.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+
+#define MEM_FILL 0x8b
+
+/**
+ * TEST: Test to validate copy commands on xe
+ * Category: Software building block
+ * Sub-category: Copy
+ * Functionality: blitter
+ */
+
+/**
+ * SUBTEST: mem-copy-%s
+ * Description: Test validates MEM_COPY command, it takes various
+ *              parameters needed for the filling batch buffer for MEM_COPY command
+ *              with size %arg[1].
+ * Test category: functionality test
+ *
+ * arg[1]:
+ * @0x369: 0x369
+ * @0x3fff: 0x3fff
+ * @0xfd: 0xfd
+ * @0xffff: 0xffff
+ */
+static void
+igt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle,
+	     const intel_ctx_t *ctx, uint32_t row_size, uint32_t size,
+	     uint32_t col_size, uint32_t region)
+{
+	struct blt_mem_data mem = {};
+	uint64_t bb_size = xe_get_default_alignment(fd);
+	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
+						  INTEL_ALLOCATOR_SIMPLE,
+						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	uint32_t bb;
+	int result;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+
+	bb = xe_bo_create_flags(fd, 0, bb_size, region);
+
+	blt_mem_init(fd, &mem);
+	blt_set_mem_object(&mem.src, src_handle, row_size, 0, size, col_size,
+			   region, src_mocs, M_LINEAR, COMPRESSION_DISABLED);
+	blt_set_mem_object(&mem.dst, dst_handle, row_size, 0, size, col_size,
+			   region, dst_mocs, M_LINEAR, COMPRESSION_DISABLED);
+	mem.src.ptr = xe_bo_map(fd, src_handle, row_size);
+	mem.dst.ptr = xe_bo_map(fd, dst_handle, row_size);
+
+	blt_set_batch(&mem.bb, bb, bb_size, region);
+	igt_assert(mem.src.size == mem.dst.size);
+
+	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, col_size);
+	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
+	igt_assert_f(!result, "source and destination differ\n");
+
+	intel_allocator_bind(ahnd, 0, 0);
+	munmap(mem.src.ptr, row_size);
+	munmap(mem.dst.ptr, row_size);
+	gem_close(fd, bb);
+	put_ahnd(ahnd);
+}
+
+/**
+ * SUBTEST: mem-set-%s
+ * Description: Test validates MEM_SET command with size %arg[1].
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0x369: 0x369
+ * @0x3fff: 0x3fff
+ * @0xfd: 0xfd
+ * @0xffff: 0xffff
+ */
+static void igt_mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx,
+			uint32_t row_size, uint32_t size, uint32_t height,
+			uint8_t fill_data, uint32_t region)
+{
+	struct blt_mem_data mem = {};
+	uint64_t bb_size = xe_get_default_alignment(fd);
+	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
+						  INTEL_ALLOCATOR_SIMPLE,
+						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	uint32_t bb;
+	uint32_t result[row_size + 1];
+	uint8_t dst_mocs = intel_get_uc_mocs(fd);
+
+	bb = xe_bo_create_flags(fd, 0, bb_size, region);
+	blt_mem_init(fd, &mem);
+	blt_set_mem_object(&mem.dst, dst_handle, row_size, 0, size, height, region,
+			   dst_mocs, M_LINEAR, COMPRESSION_DISABLED);
+	mem.dst.ptr = xe_bo_map(fd, dst_handle, row_size);
+	blt_set_batch(&mem.bb, bb, bb_size, region);
+	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
+
+	for(int i = 0; i<= row_size + 1; i ++) {
+		result[i] = mem.dst.ptr[i];
+	};
+
+	igt_assert(result[0] = fill_data);
+	igt_assert(result[row_size + 1] != fill_data);
+
+	intel_allocator_bind(ahnd, 0, 0);
+	munmap(mem.dst.ptr, row_size);
+	gem_close(fd, bb);
+	put_ahnd(ahnd);
+}
+
+static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
+	uint32_t bo_size = ALIGN(size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	const intel_ctx_t *ctx;
+
+	src_handle = xe_bo_create_flags(fd, 0, bo_size, region);
+	dst_handle = xe_bo_create_flags(fd, 0, bo_size, region);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
+
+	src_size = bo_size;
+	dst_size = bo_size;
+
+	if (cmd == MEM_COPY) {
+		igt_mem_copy(fd,
+			     src_handle,
+			     dst_handle,
+			     ctx,
+			     src_size,
+			     size,
+			     1,
+			     region);
+	} else if (cmd == MEM_SET) {
+		igt_mem_set(fd,
+			    dst_handle,
+			    ctx,
+			    dst_size,
+			    size,
+			    1,
+			    MEM_FILL,
+			    region);
+	}
+
+	gem_close(fd, src_handle);
+	gem_close(fd, dst_handle);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int fd;
+	struct igt_collection *set, *regions;
+	uint32_t region;
+	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFF};
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+		set = xe_get_memory_region_set(fd,
+					       XE_MEM_REGION_CLASS_SYSMEM,
+					       XE_MEM_REGION_CLASS_VRAM);
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(size); i++) {
+		igt_subtest_f("mem-copy-0x%lx", size[i]) {
+			igt_require(blt_has_mem_copy(fd));
+			for_each_variation_r(regions, 1, set) {
+				region = igt_collection_get_value(regions, 0);
+				copy_test(fd, size[i], MEM_COPY, region);
+			}
+		}
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(size); i++) {
+		igt_subtest_f("mem-set-0x%lx", size[i]) {
+			igt_require(blt_has_mem_set(fd));
+			for_each_variation_r(regions, 1, set) {
+				region = igt_collection_get_value(regions, 0);
+				copy_test(fd, size[i], MEM_SET, region);
+			}
+		}
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 974cb433b..3381fd919 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_xe_progs = [
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
+	'xe_copy_basic',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_drm_fdinfo',
-- 
2.39.1
