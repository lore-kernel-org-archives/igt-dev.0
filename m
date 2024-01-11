Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC5A10E851
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 09:42:41 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] RFC: tests/xe_svm: basic svm test
Date: Thu, 11 Jan 2024 15:13:04 +0530
Message-Id: <20240111094304.395181-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test will verify SVM basic functionality, by allocating a memory with
system allocator(malloc()) and accessing in GPU.

Kernel changes:
https://lore.kernel.org/dri-devel/20231221043812.3783313-1-oak.zeng@intel.com/

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 136 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 tests/intel/xe_svm.c

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
new file mode 100644
index 000000000..f82cb8fc7
--- /dev/null
+++ b/tests/intel/xe_svm.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for svm functionality
+ * Category: Hardware building block
+ * Sub-category: svm-basic
+ * Functionality: svm
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+/**
+ * SUBTEST: svm-basic
+ * Description: Run svm basic test only once
+ * Test category: functionality test
+ */
+
+static void
+test_exec(int fd)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues;
+	uint32_t bind_exec_queues;
+	uint64_t batch_offset;
+	uint64_t batch_addr;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int b;
+	uint64_t dst = (uint64_t *)malloc(4);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data) ;
+	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, bo_size,
+			all_memory_regions(fd) |
+			vram_if_possible(fd, 0),
+			DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+
+	exec_queues = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	bind_exec_queues = xe_bind_exec_queue_create(fd, vm, 0);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+
+	xe_vm_bind_async_flags(fd, vm, bind_exec_queues, bo, 0,
+			addr, bo_size, sync, 1,
+			DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+
+#define ONE_SEC MS_TO_NS(1000)
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, bind_exec_queues, ONE_SEC);
+	data[0].vm_sync = 0;
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = dst;
+	data[0].batch[b++] = dst >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	sync[0].addr = addr + (char *)&data[0].exec_sync - (char *)data;
+
+	exec.exec_queue_id = exec_queues;
+	exec.address = batch_addr;
+	xe_exec(fd, &exec);
+
+	xe_wait_ufence(fd, &data[0].exec_sync, USER_FENCE_VALUE, exec_queues, ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+
+	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size, sync, 1);
+
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, bind_exec_queues, ONE_SEC);
+
+	igt_assert_eq(dst, 0xc0ffee);
+
+	if (exec_queues)
+		xe_exec_queue_destroy(fd, exec_queues);
+	if (bind_exec_queues)
+		xe_exec_queue_destroy(fd, bind_exec_queues);
+
+	free(data);
+	free(dst);
+	gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest_f("svm-basic")
+		test_exec(fd);
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index a6a8498e2..13cc7acae 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
+	'xe_svm',
 ]
 
 msm_progs = [
-- 
2.25.1
