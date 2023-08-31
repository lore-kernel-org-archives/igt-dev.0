Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AEA10E6FB
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 23:47:10 +0000 (UTC)
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 23:46:54 +0000
Message-Id: <20230831234654.18207-1-yu.bruce.chang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe add invalid va access tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Oak Zeng <oak.zeng@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

add the following invalid va access test cases:

	gpu fault	scratch page	command timeout
1) 	no		no		yes
2) 	no		yes		no
3) 	yes		no		yes
4) 	yes		yes		no

TODO: with futher improvement of xe_wait_ufence, the test
can check more specific error code from it.

v2: async vm/bind, and re-bind valid address
v3: added xe_wait_ufence check

Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c             |  15 +++-
 lib/xe/xe_ioctl.h             |   3 +
 tests/meson.build             |   1 +
 tests/xe/xe_exec_invalid_va.c | 164 ++++++++++++++++++++++++++++++++++
 4 files changed, 180 insertions(+), 3 deletions(-)
 create mode 100644 tests/xe/xe_exec_invalid_va.c

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 730dcfd16..022f0cf04 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -415,9 +415,9 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
 	syncobj_destroy(fd, sync.handle);
 }
 
-int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+int64_t _xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       struct drm_xe_engine_class_instance *eci,
-		       int64_t timeout)
+		       int64_t timeout, bool timeout_assert)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
@@ -430,11 +430,20 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
+	if (igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait))
+		igt_assert (!timeout_assert && errno == ETIME);
 
 	return wait.timeout;
 }
 
+
+int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+		       struct drm_xe_engine_class_instance *eci,
+		       int64_t timeout)
+{
+	return _xe_wait_ufence(fd, addr, value, eci, timeout, true);
+}
+
 /**
  * xe_wait_ufence_abstime:
  * @fd: xe device fd
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6c281b3bf..4bf7410a4 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -82,6 +82,9 @@ void xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
+int64_t _xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
+		       struct drm_xe_engine_class_instance *eci,
+		       int64_t timeout, bool timeout_assert);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       struct drm_xe_engine_class_instance *eci,
 		       int64_t timeout);
diff --git a/tests/meson.build b/tests/meson.build
index 4d325bed1..8861b6c5b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -276,6 +276,7 @@ xe_progs = [
 	'xe_exec_reset',
 	'xe_exec_store',
 	'xe_exec_threads',
+	'xe_exec_invalid_va',
 	'xe_exercise_blt',
 	'xe_gpgpu_fill',
 	'xe_guc_pc',
diff --git a/tests/xe/xe_exec_invalid_va.c b/tests/xe/xe_exec_invalid_va.c
new file mode 100644
index 000000000..468b90c8a
--- /dev/null
+++ b/tests/xe/xe_exec_invalid_va.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: invalid va tests
+ * Category: Hardware building block
+ * Sub-category: execbuf
+ * Functionality: fault mode
+ * Test category: functionality test
+ * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FAULT_MODE
+ */
+
+#include <fcntl.h>
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
+static void insert_store(uint32_t *bb, uint64_t va, uint64_t data)
+{
+	*bb++ = MI_STORE_DWORD_IMM_GEN4;
+	*bb++ = lower_32_bits(va);
+	*bb++ = upper_32_bits(va);
+	*bb++ = data;
+	*bb++ = MI_BATCH_BUFFER_END;
+}
+
+/**
+ * SUBTEST: invalid-va
+ * Description: Check driver handling of invalid va access
+ * Run type: FULL
+ *
+ * SUBTEST: invalid-va-scratch
+ * Description: Check driver handling of invalid va access with scratch page
+ * Run type: FULL
+ *
+ * SUBTEST: invalid-va-fault
+ * Description: Check driver handling of invalid va access with fault enabled
+ * Run type: FULL
+ *
+ * SUBTEST: invalid-va-fault-scratch
+ * Description: Check driver handling of invalid va access with fault + scratch page
+ * Run type: FULL
+ *
+ * arg[1]: for vm create flags
+ */
+static void test_exec(int fd, uint32_t flags)
+{
+	const uint64_t inv_addr = 0x20000000;
+	const uint64_t addr = 0x1a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define ONE_SEC			MS_TO_NS(1000)
+#define	STORE_DATA		0xDEADBEAF
+	struct _data {
+		uint32_t batch[16];
+		uint64_t vm_sync;
+		uint64_t sync;
+		uint64_t data;
+	} *data;
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.address = addr,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t vm;
+	uint32_t bo;
+	size_t bo_size;
+	struct drm_xe_engine_class_instance *eci;
+
+	eci = xe_hw_engine(fd, 0);
+	vm = xe_vm_create(fd, flags | DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = ALIGN(sizeof(*data), xe_get_default_alignment(fd));
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				all_memory_regions(fd) |
+				visible_vram_if_possible(fd, 0));
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+
+	insert_store(data->batch, inv_addr + offsetof(struct _data, data), STORE_DATA);
+	exec.exec_queue_id = xe_exec_queue_create(fd, vm, eci, 0);
+	sync.addr = to_user_pointer(&data->vm_sync);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0,
+				addr, bo_size, &sync, 1,
+				XE_VM_BIND_FLAG_IMMEDIATE);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	data->vm_sync = 0;
+	sync.addr = addr + offsetof(struct _data, sync);
+	xe_exec(fd, &exec);
+	_xe_wait_ufence(fd, &data->sync, USER_FENCE_VALUE, NULL, ONE_SEC, false);
+	if (!(flags & DRM_XE_VM_CREATE_SCRATCH_PAGE))
+		assert(errno == ETIME);
+	else
+		assert(errno == 0);
+	data->sync = 0;
+
+	if ((flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
+	    (flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)) {
+		/* bind inv_addr after scratch page was created */
+		sync.addr = to_user_pointer(&data->vm_sync);
+		xe_vm_bind_async_flags(fd, vm, 0, bo, 0,
+				inv_addr, bo_size, &sync, 1,
+				XE_VM_BIND_FLAG_IMMEDIATE);
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+		data->vm_sync = 0;
+		data->data = 0;
+		sync.addr = addr + offsetof(struct _data, sync);
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, &data->sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+		igt_assert_eq(data->data, STORE_DATA);
+	}
+
+	sync.addr = to_user_pointer(&data->vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	data->vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, inv_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_exec_queue_destroy(fd, exec.exec_queue_id);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "invalid-va", 0 },
+		{ "invalid-va-scratch", DRM_XE_VM_CREATE_SCRATCH_PAGE },
+		{ "invalid-va-fault", DRM_XE_VM_CREATE_FAULT_MODE },
+		{ "invalid-va-fault-scratch", DRM_XE_VM_CREATE_FAULT_MODE |
+					      DRM_XE_VM_CREATE_SCRATCH_PAGE },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_supports_faults(fd));
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("%s", s->name)
+			test_exec(fd, s->flags);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
+
-- 
2.25.1
