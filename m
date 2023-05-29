Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F2D10E0B8
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:48:35 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 14:48:24 +0200
Message-Id: <20230529124824.1876093-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: Add a test for corner cases of
 eviction.
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

Gitlab issues 194 and 239 show some corner cases. In particular,
signal handling, pt eviction and losing track of external objects
on the list.

The patch series to fix those was sent as
https://patchwork.freedesktop.org/series/118428/

But because it's tricky to reproduce those issues, I had to add some
custom igt's to handle those.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/meson.build     |   1 +
 tests/xe/xe_evicted.c | 313 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 tests/xe/xe_evicted.c

diff --git a/tests/meson.build b/tests/meson.build
index 6551194fe..166937b6c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -248,6 +248,7 @@ xe_progs = [
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_evict',
+	'xe_evicted',
 	'xe_exec_balancer',
 	'xe_exec_basic',
 	'xe_exec_compute_mode',
diff --git a/tests/xe/xe_evicted.c b/tests/xe/xe_evicted.c
new file mode 100644
index 000000000..3f5e6a82c
--- /dev/null
+++ b/tests/xe/xe_evicted.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Test various eviction and ENOMEM corner cases.
+ * Category: Software building block
+ * Sub-category: VM_BIND / eviction
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+static void evict_mem(struct xe_device *xe)
+{
+	if (xe->has_vram)
+		igt_debugfs_write(xe->fd, "vram0_evict", "1");
+	else
+		igt_debugfs_write(xe->fd, "gtt_evict", "1");
+}
+
+static void execstress(struct xe_device *xe, uint32_t engine, uint32_t addr)
+{
+	struct timespec start, end;
+
+	igt_fork(child, 2) {
+		struct drm_xe_sync sync = {
+			.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+			.handle = syncobj_create(xe->fd, 0),
+		};
+
+		clock_gettime(CLOCK_MONOTONIC, &start);
+
+		do {
+			if (!child)
+				evict_mem(xe);
+			else
+				xe_exec_sync(xe->fd, engine, addr, &sync, 1);
+
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		} while (end.tv_sec - start.tv_sec <= 3);
+
+		if (child)
+			igt_assert(syncobj_wait(xe->fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+		syncobj_destroy(xe->fd, sync.handle);
+	}
+
+	igt_waitchildren();
+
+	/* Leave function in a known state */
+	evict_mem(xe);
+}
+
+/* See issue 194, unbinding first VMA may cause BO not to be locked correctly */
+static void test_multimap(struct xe_device *xe, bool external)
+{
+	uint64_t size = xe->default_alignment;
+	uint32_t vm = xe_vm_create(xe->fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+	uint32_t bo = xe_bo_create(xe->fd, 0, external ? 0 : vm, size);
+	uint32_t engine = xe_engine_create_class(xe->fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	uint32_t *map = xe_bo_map(xe->fd, bo, size);
+
+	*map = MI_BATCH_BUFFER_END;
+	munmap(map, size);
+
+	/* Create 2 mappings */
+	xe_vm_bind_sync(xe->fd, vm, bo, 0, 0, size);
+	xe_vm_bind_sync(xe->fd, vm, bo, 0, size, size);
+
+	execstress(xe, engine, size);
+
+	/* Unbind the first one, to possibly confuse stuff */
+	xe_vm_unbind_sync(xe->fd, vm, 0, 0, size);
+
+	execstress(xe, engine, size);
+
+	/* Teardown.. */
+	xe_engine_destroy(xe->fd, engine);
+	xe_vm_destroy(xe->fd, vm);
+	gem_close(xe->fd, bo);
+}
+
+static uint64_t avail_vram(struct xe_device **xe)
+{
+	int fd = (*xe)->fd;
+	int region_idx;
+
+	/* Refresh to get up-to-date values */
+	xe_device_put(fd);
+	*xe = xe_device_get(fd);
+
+	region_idx = ffs((*xe)->gts->gts[0].native_mem_regions) - 1;
+
+	return (*xe)->mem_usage->regions[region_idx].total_size -
+	       (*xe)->mem_usage->regions[region_idx].used;
+}
+
+static void test_pt_eviction(struct xe_device *xe, bool external)
+{
+	uint32_t bo, i;
+	uint64_t size, full_size, full_addr, addr, avail;
+	uint32_t vm;
+	uint32_t engine;
+	uint32_t *map;
+	struct drm_xe_exec exec = {};
+	igt_require(xe->has_vram);
+
+	vm = xe_vm_create(xe->fd, 0, 0);
+	engine = xe_engine_create_class(xe->fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+
+	/* Refresh xe_device size after creating vm + engine */
+	evict_mem(xe);
+	full_size = (avail_vram(&xe) - (2 << 20ULL)) & ~((2 << 20ULL) - 1);
+
+	bo = xe_bo_create(xe->fd, 0, external ? 0 : vm, full_size);
+
+	/* Only map what we need.. */
+	map = xe_bo_map(xe->fd, bo, xe->default_alignment);
+	*map = MI_BATCH_BUFFER_END;
+	munmap(map, xe->default_alignment);
+
+	/* Stuff bo at the end, so we can use start for partial bo's */
+	full_addr = (1ULL << (uint64_t)xe_va_bits(xe->fd)) - full_size;
+	xe_vm_bind_sync(xe->fd, vm, bo, 0, full_addr, full_size);
+
+	exec.engine_id = engine;
+	exec.num_batch_buffer = 1;
+	exec.address = full_addr;
+
+	/* Now map partially at 0, and see how many pagetables we can still fill.. */
+	addr = 0;
+	size = xe->default_alignment;
+	xe_vm_bind_sync(xe->fd, vm, bo, 0, addr, size);
+
+	xe_exec_sync(xe->fd, engine, full_addr, NULL, 0);
+
+	avail = full_size >> 12;
+	while (1) {
+		uint64_t new_avail = avail_vram(&xe) >> 12;
+
+		if (new_avail >= avail)
+			igt_info("TTM delayed destroy may have freed some memory\n");
+		avail = new_avail;
+
+		igt_info("%"PRIu64" available 4K pages left\n", avail);
+		if (!avail)
+			break;
+
+		if (avail == 1) {
+			xe_vm_bind_sync(xe->fd, vm, bo, 0, 2 << 20ULL, size);
+			break;
+		}
+
+		addr += 1 << 30ULL;
+
+		/* Remove 1 for second level PT */
+		avail--;
+
+		for (i = 0; i < min((uint64_t)512, avail); i++) {
+			uint64_t this_addr = addr + (i << 21);
+
+			xe_vm_bind_sync(xe->fd, vm, bo, 0, this_addr, size);
+		}
+	}
+
+	/* Verify that with 0 memory available, exec still completes */
+	xe_exec_sync(xe->fd, engine, full_addr, NULL, 0);
+
+	/* Bind 1 more to go over the edge, this should never succeed.. */
+	if (__xe_vm_bind(xe->fd, vm, 0, bo, 0, 4 << 20ULL, size,
+			 XE_VM_BIND_OP_MAP, NULL, 0, 0, 0) == 0) {
+
+		/* Boom! */
+		igt_assert(igt_ioctl(xe->fd, DRM_IOCTL_XE_EXEC, &exec) < 0 &&
+			   errno == ENOMEM);
+
+		xe_vm_unbind_sync(xe->fd, vm, 0, 4 << 20ULL, size);
+	} else {
+		igt_assert(errno == ENOMEM);
+	}
+
+	/*
+	 * After evicting, we may end up creating new page tables,
+	 * so this should fail..
+	 */
+	evict_mem(xe);
+	igt_assert(igt_ioctl(xe->fd, DRM_IOCTL_XE_EXEC, &exec) < 0 &&
+		   errno == ENOMEM);
+
+	/* Cleanup */
+	xe_engine_destroy(xe->fd, engine);
+	xe_vm_destroy(xe->fd, vm);
+	gem_close(xe->fd, bo);
+}
+
+/* Test OOM with signal handler enabled, to mimic X.org (issue #239) */
+static void test_signal_oom(struct xe_device *xe, bool external)
+{
+	uint32_t bo[13], num_bo = 0, i;
+	uint64_t binds, size = xe->has_vram ? xe->vram_size[0] : igt_get_avail_ram_mb();
+	uint32_t vm = xe_vm_create(xe->fd, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+	uint32_t engine = xe_engine_create_class(xe->fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	int err;
+	struct drm_xe_gem_create create = {
+		.flags = vram_if_possible(xe->fd, 0),
+	};
+	struct drm_xe_sync sync[2] = {
+		{
+			.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+			.handle = syncobj_create(xe->fd, 0),
+		},
+		{
+			.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+			.handle = syncobj_create(xe->fd, 0),
+		},
+	};
+	struct drm_xe_exec exec = {
+		.engine_id = engine,
+		.syncs = (uintptr_t)sync,
+		.num_syncs = ARRAY_SIZE(sync),
+		.address = 0,
+		.num_batch_buffer = 1,
+	};
+
+	size /= 12;
+	size &= ~(xe->default_alignment - 1);
+
+	create.size = size;
+	if (!external)
+		create.vm_id = vm;
+
+	/* Create as many bo's as we can without OOMs */
+	while (num_bo < ARRAY_SIZE(bo)) {
+		igt_while_interruptible(true) {
+			if (num_bo >= ARRAY_SIZE(bo))
+				continue;
+
+			create.handle = 0;
+			err = igt_ioctl(xe->fd, DRM_IOCTL_XE_GEM_CREATE, &create);
+			if (!err)
+				bo[num_bo++] = create.handle;
+		}
+
+		igt_assert(err == 0 || errno == ENOMEM);
+		if (err) {
+			igt_assert(!xe->has_vram || num_bo > 9);
+			break;
+		}
+	}
+
+	igt_info("Created %u bo's (total: %"PRIu64" MB)\n",
+		 num_bo, (num_bo * size) >> 20ULL);
+
+	binds = 0;
+	for (i = 0; i < num_bo; i++) {
+		evict_mem(xe);
+		igt_debug("Binding bo %i, total attempts %"PRIi64"\n", i, binds);
+
+		igt_while_interruptible(true)
+			xe_vm_bind(xe->fd, vm, bo[i], 0, ((binds++) << 32ULL), size, sync, 1);
+	}
+
+	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+
+	/* Try a few times, why not? */
+	for (i = 0; i < 4; i++) {
+		igt_while_interruptible(true) {
+			err = igt_ioctl(xe->fd, DRM_IOCTL_XE_EXEC, &exec);
+			igt_assert(err < 0 && errno == ENOMEM);
+		}
+	}
+
+	xe_vm_destroy(xe->fd, vm);
+	while (num_bo--)
+		gem_close(xe->fd, bo[num_bo]);
+	syncobj_destroy(xe->fd, sync[1].handle);
+	syncobj_destroy(xe->fd, sync[0].handle);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("multimap-internal")
+		test_multimap(xe_device_get(fd), false);
+
+	igt_subtest("multimap-external")
+		test_multimap(xe_device_get(fd), true);
+
+	igt_subtest("pt-eviction-internal")
+		test_pt_eviction(xe_device_get(fd), false);
+
+	igt_subtest("pt-eviction-external")
+		test_pt_eviction(xe_device_get(fd), false);
+
+	igt_subtest("signal-oom-internal")
+		test_signal_oom(xe_device_get(fd), false);
+
+	igt_subtest("signal-oom-external")
+		test_signal_oom(xe_device_get(fd), false);
+}
-- 
2.34.1
