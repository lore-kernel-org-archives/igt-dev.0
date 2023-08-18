Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AC610E447
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 05:19:55 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Fri, 18 Aug 2023 10:49:16 +0530
Message-Id: <20230818051916.28272-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
References: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_copy_basic: Add copy basic
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

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/meson.build        |   1 +
 tests/xe/xe_copy_basic.c | 262 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 tests/xe/xe_copy_basic.c

diff --git a/tests/meson.build b/tests/meson.build
index 58061dbc2..323c2108a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -266,6 +266,7 @@ xe_progs = [
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
+	'xe_copy_basic',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_evict',
diff --git a/tests/xe/xe_copy_basic.c b/tests/xe/xe_copy_basic.c
new file mode 100644
index 000000000..ce1223eb1
--- /dev/null
+++ b/tests/xe/xe_copy_basic.c
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2023 Intel Corporation
+*
+* Authors:
+*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+*/
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "lib/intel_mocs.h"
+#include "lib/intel_reg.h"
+#include "lib/igt_syncobj.h"
+#include "lib/xe/xe_util.h"
+
+/**
+ * TEST: Test to valiudate copy commands on xe
+ * Category: Software building block
+ * Sub-category: Copy
+ * Functionality: blitter
+ * Test category: functionality test
+ */
+
+enum command {
+	MEM_COPY,
+	MEM_SET,
+};
+
+static int objcmp(int fd, uint32_t src, uint32_t dst,
+			uint32_t src_size, uint32_t dst_size)
+{
+	void *buf_src, *buf_dst;
+	int ret = 0;
+
+	buf_src = xe_bo_map(fd, src, src_size);
+	buf_dst = xe_bo_map(fd, dst, dst_size);
+
+	ret = memcmp(buf_src, buf_dst , src_size);
+
+	munmap(buf_src, src_size);
+	munmap(buf_dst, dst_size);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: mem-copy
+ * Description: Test validates MEM_COPY command, it takes various
+ * 		parameters needed for the filling batch buffer for MEM_COPY command.
+ * Run type: FULL
+ */
+
+static void
+igt_mem_copy(int fd, uint32_t src, uint32_t dst,
+                uint32_t size, uint32_t col_size, uint32_t src_pitch,
+		uint32_t dst_pitch, uint32_t vm, uint32_t engine)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	uint32_t bb_handle, syncobj;
+	struct {
+		uint32_t batch[12];
+		uint32_t data;
+	} *data;
+
+	uint64_t bb_offset, src_offset, dst_offset;
+	uint64_t alignment;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint64_t bb_size = xe_get_default_alignment(fd);
+	uint8_t dst_mocs = src_mocs;
+	uint64_t ahnd;
+	int i;
+
+	alignment = xe_get_default_alignment(fd);
+
+	bb_handle = xe_bo_create_flags(fd, 0, bb_size, visible_vram_if_possible(fd, 0));
+	data = xe_bo_map(fd, bb_handle, bb_size);
+
+	ahnd = intel_allocator_open_full(fd, vm, 0, 0, INTEL_ALLOCATOR_SIMPLE,
+					ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	src_offset = get_offset(ahnd, src, size, alignment);
+	dst_offset = get_offset(ahnd, dst, size, alignment);
+	bb_offset = get_offset(ahnd, bb_handle, bb_size, alignment);
+
+	i = 0;
+	data->batch[i++] = MEM_COPY_CMD;
+	data->batch[i++] = size - 1;
+	data->batch[i++] = col_size - 1;
+	data->batch[i++] = src_pitch;
+	data->batch[i++] = dst_pitch;
+	data->batch[i++] = src_offset;
+	data->batch[i++] = src_offset << 32;
+	data->batch[i++] = dst_offset;
+	data->batch[i++] = dst_offset << 32;
+	data->batch[i++] = src_mocs << MEM_COPY_MOCS_SHIFT | dst_mocs;
+	data->batch[i++] = MI_BATCH_BUFFER_END;
+	data->batch[i++] = MI_NOOP;
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	xe_vm_bind_sync(fd, vm, bb_handle, 0, bb_offset, bb_size);
+
+	exec.exec_queue_id = engine;
+	exec.address = bb_offset;
+	sync.handle = syncobj;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+
+	gem_close(fd, bb_handle);
+	put_ahnd(ahnd);
+	munmap(data, bb_size);
+
+}
+
+/**
+ * SUBTEST: mem-set
+ * Description: Test validates MEM_SET command.
+ * RUN type: FULL
+ */
+
+static void igt_mem_set(int fd, uint32_t dst, size_t size, uint32_t height,
+			uint32_t fill_data, uint32_t vm, uint32_t engine)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct {
+		uint32_t batch[12];
+		uint32_t data;
+	} *data;
+
+	uint32_t syncobj;
+	uint64_t dst_offset, ahnd;
+	uint8_t dst_mocs = intel_get_uc_mocs(fd);
+	int b;
+
+	data = xe_bo_map(fd, dst, size);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	dst_offset = intel_allocator_alloc_with_strategy(ahnd, dst, size, 0,
+							ALLOC_STRATEGY_LOW_TO_HIGH);
+
+	b = 0;
+	data->batch[b++] = MEM_SET_CMD;
+	data->batch[b++] = size - 1;
+	data->batch[b++] = height;
+	data->batch[b++] = 2 * size - 1;
+	data->batch[b++] = dst_offset;
+	data->batch[b++] = dst_offset << 32;
+	data->batch[b++] = (fill_data << 24) | dst_mocs;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	data->batch[b++] = MI_NOOP;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	xe_vm_bind_sync(fd, vm, dst, 0, dst_offset, size);
+
+	exec.exec_queue_id = engine;
+	exec.address = dst_offset;
+	sync.handle = syncobj;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+
+	munmap(data, size);
+	put_ahnd(ahnd);
+}
+
+static void copy_test(int fd, enum command cmd,
+		      struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t src_size, dst_size;
+	uint32_t src, dst, vm, engine;
+	char c = 'a';
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t temp_buffer[bo_size];
+
+	src = xe_bo_create_flags(fd, 0, bo_size, visible_vram_memory(fd, hwe->gt_id));
+	dst = xe_bo_create_flags(fd, 0, bo_size, visible_vram_memory(fd, hwe->gt_id));
+	vm = xe_vm_create(fd, 0, 0);
+	engine = xe_exec_queue_create(fd, vm, hwe, 0);
+
+	/* Fill a pattern in the buffer */
+	for (int i = 0; i < bo_size; i++) {
+		temp_buffer[i] = c++ % 16;
+		temp_buffer[i] |= (c++ % 16) << 8;
+		temp_buffer[i] |= (c++ % 16) << 16;
+		temp_buffer[i] |= (c++ % 16) << 24;
+	}
+
+	src_size = bo_size;
+	dst_size = bo_size;
+
+	switch (cmd) {
+	case MEM_COPY: /* MEM_COPY_CMD */
+		igt_mem_copy(fd,
+			     src,
+			     dst,
+			     bo_size,
+			     1,
+			     0,
+			     0,
+			     vm,
+			     engine);
+		break;
+
+	case MEM_SET:
+		igt_mem_set(fd,
+			    dst,
+			    bo_size,
+			    1,
+			    temp_buffer[0] & 0xff,
+			    vm,
+			    engine);
+		src_size = 1;
+		break;
+	}
+
+	igt_assert_eq(objcmp(fd, src, src_size, dst, dst_size), 0);
+	gem_close(fd, src);
+	gem_close(fd, dst);
+
+	xe_exec_queue_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("mem-set")
+		xe_for_each_hw_engine(fd, hwe)
+			copy_test(fd, MEM_SET, hwe);
+
+	igt_subtest("mem-copy")
+		xe_for_each_hw_engine(fd, hwe)
+			copy_test(fd, MEM_COPY, hwe);
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
+
-- 
2.39.1
