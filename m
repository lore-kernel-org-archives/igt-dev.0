Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88110E2B4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 23:13:03 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 15:12:44 -0800
Message-Id: <20221212231254.2303-10-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 09/19] tests/i915/vm_bind: Add basic
 VM_BIND test support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add basic tests for VM_BIND functionality. Bind the buffer objects in
device page table with VM_BIND calls and have GPU copy the data from a
source buffer object to destination buffer object.
Test for different buffer sizes, buffer object placement and with
multiple contexts.

v2: Add basic test to fast-feedback.testlist
v3: Run all tests for different memory types,
    pass VA instead of an array for batch_address
v4: Iterate for memory region types instead of hardcoding,
    use i915_vm_bind library functions
v5: Validate synchronous vm_bind, require blt engine,
    use mr->gtt_alignment instead of HAS_64K_PAGES,
    change info to debug messages, remove igt_collection usage,
    fix dg2 alignment issue
v6: Port as per uapi reserved field changes
v7: Use syncobj library functions, rebase

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_basic.c       | 538 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/meson.build                     |   1 +
 3 files changed, 540 insertions(+)
 create mode 100644 tests/i915/i915_vm_bind_basic.c

diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
new file mode 100644
index 000000000..db6758e18
--- /dev/null
+++ b/tests/i915/i915_vm_bind_basic.c
@@ -0,0 +1,538 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/** @file i915_vm_bind_basic.c
+ *
+ * This is the basic test for VM_BIND functionality.
+ *
+ * The goal is to ensure that basics work.
+ */
+
+#include "i915/gem.h"
+#include "i915/i915_vm_bind.h"
+#include "igt.h"
+#include "igt_syncobj.h"
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
+#include "drm.h"
+#include "i915/gem_vm.h"
+
+IGT_TEST_DESCRIPTION("Basic test for vm_bind functionality");
+
+#define PAGE_SIZE   4096
+#define PAGE_SHIFT  12
+
+#define GEN9_XY_FAST_COPY_BLT_CMD       (2 << 29 | 0x42 << 22)
+#define BLT_DEPTH_32                    (3 << 24)
+
+#define DEFAULT_BUFF_SIZE  (4 * PAGE_SIZE)
+#define SZ_64K             (16 * PAGE_SIZE)
+#define SZ_2M              (512 * PAGE_SIZE)
+
+#define MAX_CTXTS   2
+#define MAX_CMDS    4
+
+#define EXEC_FENCE   0
+#define BATCH_FENCE  1
+#define SRC_FENCE    2
+#define DST_FENCE    3
+#define NUM_FENCES   4
+
+enum {
+	BATCH_MAP,
+	SRC_MAP,
+	DST_MAP = SRC_MAP + MAX_CMDS,
+	MAX_MAP
+};
+
+struct mapping {
+	uint32_t  obj;
+	uint64_t  va;
+	uint64_t  offset;
+	uint64_t  length;
+	uint64_t  flags;
+};
+
+#define SET_MAP(map, _obj, _va, _offset, _length, _flags)	\
+{                                  \
+	(map).obj = _obj;          \
+	(map).va = _va;            \
+	(map).offset = _offset;	   \
+	(map).length = _length;	   \
+	(map).flags = _flags;      \
+}
+
+#define MAX_BATCH_DWORD    64
+
+#define abs(x) ((x) >= 0 ? (x) : -(x))
+
+#define TEST_SKIP_UNBIND      BIT(0)
+#define TEST_SHARE_VM         BIT(1)
+#define TEST_SYNC_BIND        BIT(2)
+
+#define do_unbind(cfg)      (!((cfg)->flags & TEST_SKIP_UNBIND))
+#define do_share_vm(cfg)    ((cfg)->flags & TEST_SHARE_VM)
+#define do_sync_bind(cfg)   ((cfg)->flags & TEST_SYNC_BIND)
+
+struct test_cfg {
+	const char *name;
+	uint32_t size;
+	uint8_t num_cmds;
+	uint32_t num_ctxts;
+	uint32_t flags;
+};
+
+static inline void vm_bind(int fd, uint32_t vm_id, struct mapping *m,
+			   struct drm_i915_gem_timeline_fence *fence)
+{
+	uint32_t syncobj = 0;
+
+	if (fence) {
+		syncobj = syncobj_create(fd, 0);
+
+		fence->handle = syncobj;
+		fence->flags = I915_TIMELINE_FENCE_WAIT;
+		fence->value = 0;
+	}
+
+	igt_debug("VM_BIND vm:0x%x h:0x%x v:0x%lx o:0x%lx l:0x%lx f:0x%lx\n",
+		  vm_id, m->obj, m->va, m->offset, m->length, m->flags);
+	i915_vm_bind(fd, vm_id, m->va, m->obj, m->offset, m->length, m->flags, syncobj, 0);
+}
+
+static inline void vm_unbind(int fd, uint32_t vm_id, struct mapping *m)
+{
+	/* Object handle is not required during unbind */
+	igt_debug("VM_UNBIND vm:0x%x v:0x%lx l:0x%lx\n", vm_id, m->va, m->length);
+	i915_vm_unbind(fd, vm_id, m->va, m->length);
+}
+
+static void debug_dump_buffer(void *buf, uint32_t size,
+			      const char *str, bool full)
+{
+	uint32_t i = 0;
+
+	igt_debug("Printing %s size 0x%x\n", str, size);
+	while (i < size) {
+		uint32_t *b = buf + i;
+
+		igt_debug("\t%s[0x%04x]: 0x%08x 0x%08x 0x%08x 0x%08x %s\n",
+			  str, i, b[0], b[1], b[2], b[3], full ? "" : "...");
+		i += full ? 16 : PAGE_SIZE;
+	}
+}
+
+static int gem_linear_fast_blt(uint32_t *batch, uint64_t src,
+			       uint64_t dst, uint32_t size)
+{
+	uint32_t *cmd = batch;
+
+	*cmd++ = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
+	*cmd++ = BLT_DEPTH_32 | PAGE_SIZE;
+	*cmd++ = 0;
+	*cmd++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+	*cmd++ = lower_32_bits(dst);
+	*cmd++ = upper_32_bits(dst);
+	*cmd++ = 0;
+	*cmd++ = PAGE_SIZE;
+	*cmd++ = lower_32_bits(src);
+	*cmd++ = upper_32_bits(src);
+
+	*cmd++ = MI_BATCH_BUFFER_END;
+	*cmd++ = 0;
+
+	return ALIGN((cmd - batch + 1) * sizeof(uint32_t), 8);
+}
+
+static void __gem_copy(int fd, uint64_t src, uint64_t dst, uint32_t size,
+		       uint32_t ctx_id, void *batch_addr, unsigned int eb_flags,
+		       struct drm_i915_gem_timeline_fence *fence,
+		       uint64_t fence_count)
+{
+	uint32_t len, buf[MAX_BATCH_DWORD] = { 0 };
+	struct drm_i915_gem_execbuffer3 execbuf;
+
+	len = gem_linear_fast_blt(buf, src, dst, size);
+
+	memcpy(batch_addr, (void *)buf, len);
+	debug_dump_buffer(buf, len, "batch", true);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.ctx_id = ctx_id;
+	execbuf.batch_address = to_user_pointer(batch_addr);
+	execbuf.engine_idx = eb_flags;
+	execbuf.fence_count = fence_count;
+	execbuf.timeline_fences = to_user_pointer(fence);
+	gem_execbuf3(fd, &execbuf);
+}
+
+static void i915_gem_copy(int fd, uint64_t src, uint64_t dst, uint32_t va_delta,
+			  uint32_t delta, uint32_t size, const intel_ctx_t **ctx,
+			  uint32_t num_ctxts, void **batch_addr, unsigned int eb_flags,
+			  struct drm_i915_gem_timeline_fence (*fence)[NUM_FENCES],
+			  uint64_t fence_count)
+{
+	uint32_t i;
+
+	for (i = 0; i < num_ctxts; i++) {
+		igt_debug("Issuing gem copy on ctx 0x%x\n", ctx[i]->id);
+		__gem_copy(fd, src + (i * va_delta), dst + (i * va_delta), delta,
+			   ctx[i]->id, batch_addr[i], eb_flags, fence[i],  fence_count);
+	}
+}
+
+static void i915_gem_sync(int fd, const intel_ctx_t **ctx, uint32_t num_ctxts,
+			  struct drm_i915_gem_timeline_fence (*fence)[NUM_FENCES])
+{
+	uint32_t i;
+
+	for (i = 0; i < num_ctxts; i++) {
+		uint64_t fence_value = 0;
+
+		igt_assert(syncobj_timeline_wait(fd, &fence[i][EXEC_FENCE].handle,
+						 (uint64_t *)&fence_value, 1,
+						 gettime_ns() + (2 * NSEC_PER_SEC),
+						 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+		igt_assert(!syncobj_busy(fd, fence[i][EXEC_FENCE].handle));
+		igt_debug("gem copy completed on ctx 0x%x\n", ctx[i]->id);
+	}
+}
+
+static uint32_t create_obj(int fd, struct gem_memory_region *mr, uint32_t size, void **addr)
+{
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
+	*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
+
+	return handle;
+}
+
+static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr)
+{
+	igt_assert(gem_munmap(addr, size) == 0);
+	gem_close(fd, handle);
+}
+
+static void create_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[],
+			    uint32_t size, uint32_t num_cmds, void *src_addr[])
+{
+	int i = 0;
+
+	if (!num_cmds)
+		return;
+
+	/* Create first src object always in memory region 'mr' */
+	src[i] = create_obj(fd, mr, size, &src_addr[i]);
+	igt_debug("Src (%s) obj 0x%x created\n", mr->name, src[i]);
+	num_cmds--;
+	i++;
+
+	if (!num_cmds)
+		return;
+
+	/* Create one src object in all other memory regions */
+	for_each_memory_region(r, fd) {
+		if (mr &&
+		    r->ci.memory_class == mr->ci.memory_class &&
+		    r->ci.memory_instance == mr->ci.memory_instance)
+			continue;
+
+		src[i] = create_obj(fd, r, size, &src_addr[i]);
+		igt_debug("Src (%s) obj 0x%x created\n", r->name, src[i]);
+		num_cmds--;
+		i++;
+	}
+
+	/* Create rest of the src objects in memory region 'mr' */
+	while (num_cmds) {
+		src[i] = create_obj(fd, mr, size, &src_addr[i]);
+		igt_debug("Src (%s) obj 0x%x created\n", mr->name, src[i]);
+		num_cmds--;
+		i++;
+	}
+}
+
+static void destroy_src_objs(int fd, struct gem_memory_region *mr, uint32_t src[],
+			     uint32_t size, uint32_t num_cmds, void *src_addr[])
+{
+	int i;
+
+	for (i = 0; i < num_cmds; i++) {
+		igt_debug("Closing src object 0x%x\n", src[i]);
+		destroy_obj(fd, src[i], size, src_addr[i]);
+	}
+}
+
+static uint32_t create_dst_obj(int fd, struct gem_memory_region *mr, uint32_t size, void **dst_addr)
+{
+	uint32_t dst = create_obj(fd, mr, size, dst_addr);
+
+	igt_debug("Dst (%s) obj 0x%x created\n", mr->name, dst);
+	return dst;
+}
+
+static void destroy_dst_obj(int fd, struct gem_memory_region *mr, uint32_t dst,
+			    uint32_t size, void *dst_addr)
+{
+	igt_debug("Closing dst object 0x%x\n", dst);
+	destroy_obj(fd, dst, size, dst_addr);
+}
+
+static void pattern_fill_buf(void *src_addr[], uint32_t size, uint32_t num_cmds, uint32_t npages)
+{
+	uint32_t i, j;
+	void *buf;
+
+	/* Allocate buffer and fill pattern */
+	buf = malloc(size);
+	igt_require(buf);
+
+	for (i = 0; i < num_cmds; i++) {
+		for (j = 0; j < npages; j++)
+			memset(buf + j * PAGE_SIZE, i * npages + j + 1, PAGE_SIZE);
+
+		memcpy(src_addr[i], buf, size);
+	}
+
+	free(buf);
+}
+
+static void run_test(int fd, const intel_ctx_t *base_ctx, struct test_cfg *cfg,
+		     struct gem_memory_region *mr, uint32_t alignment,
+		     const struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_timeline_fence exec_fence[MAX_CTXTS][NUM_FENCES] = { };
+	void *src_addr[MAX_CMDS] = { 0 }, *dst_addr = NULL;
+	uint32_t src[MAX_CMDS], dst, i, size = cfg->size;
+	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
+	struct mapping map[MAX_CTXTS][MAX_MAP];
+	uint32_t num_ctxts = cfg->num_ctxts;
+	uint32_t num_cmds = cfg->num_cmds;
+	uint32_t npages = size / PAGE_SIZE;
+	const intel_ctx_t *ctx[MAX_CTXTS];
+	uint64_t src_va, dst_va, ahnd = 0;
+	bool share_vm = do_share_vm(cfg);
+	uint32_t delta, va_delta = SZ_2M;
+	void *batch_addr[MAX_CTXTS];
+	uint32_t batch[MAX_CTXTS];
+
+	delta = size / num_ctxts;
+	if (share_vm)
+		shared_vm_id = gem_vm_create_in_vm_bind_mode(fd);
+
+	/* Create contexts */
+	num_ctxts = min_t(num_ctxts, MAX_CTXTS, num_ctxts);
+	for (i = 0; i < num_ctxts; i++) {
+		struct drm_i915_gem_context_param param = {
+			.param = I915_CONTEXT_PARAM_RECOVERABLE,
+			.value = 0,
+		};
+		uint32_t vmid;
+
+		if (share_vm)
+			vmid = shared_vm_id;
+		else
+			vmid = gem_vm_create_in_vm_bind_mode(fd);
+
+		ctx[i] = intel_ctx_create(fd, &base_ctx->cfg);
+		param.ctx_id = ctx[i]->id;
+		gem_context_set_param(fd, &param);
+		gem_context_set_vm(fd, ctx[i]->id, vmid);
+		vm_id[i] = gem_context_get_vm(fd, ctx[i]->id);
+
+		exec_fence[i][EXEC_FENCE].handle = syncobj_create(fd, 0);
+		exec_fence[i][EXEC_FENCE].flags = I915_TIMELINE_FENCE_SIGNAL;
+		exec_fence[i][EXEC_FENCE].value = 0;
+	}
+
+	/* Create objects */
+	num_cmds = min_t(num_cmds, MAX_CMDS, num_cmds);
+	create_src_objs(fd, mr, src, size, num_cmds, src_addr);
+	dst = create_dst_obj(fd, mr, size, &dst_addr);
+
+	/*
+	 * mmap'ed addresses are PAGE_SIZE aligned. On platforms requiring
+	 * other alignment, use static addresses.
+	 */
+	if (num_cmds && (alignment == PAGE_SIZE)) {
+		src_va = to_user_pointer(src_addr[0]);
+		dst_va = to_user_pointer(dst_addr);
+	} else {
+		ahnd = intel_allocator_open_full(fd, 1, 0, 0,
+						 INTEL_ALLOCATOR_SIMPLE,
+						 ALLOC_STRATEGY_LOW_TO_HIGH,
+						 alignment);
+		dst_va = CANONICAL(get_offset(ahnd, dst, size, 0));
+		if (num_cmds)
+			src_va = CANONICAL(get_offset(ahnd, src[0], size * num_cmds, 0));
+	}
+
+	pattern_fill_buf(src_addr, size, num_cmds, npages);
+
+	if (num_cmds)
+		debug_dump_buffer(src_addr[num_cmds - 1], size, "src_obj", false);
+
+	for (i = 0; i < num_ctxts; i++) {
+		batch[i] = gem_create_in_memory_regions(fd, PAGE_SIZE, REGION_SMEM);
+		igt_debug("Batch obj 0x%x created in region 0x%x:0x%x\n", batch[i],
+			  MEMORY_TYPE_FROM_REGION(REGION_SMEM), MEMORY_INSTANCE_FROM_REGION(REGION_SMEM));
+		batch_addr[i] = gem_mmap__cpu(fd, batch[i], 0, PAGE_SIZE, PROT_WRITE);
+	}
+
+	/* Create mappings */
+	for (i = 0; i < num_ctxts; i++) {
+		uint64_t va_offset = i * va_delta;
+		uint64_t offset = i * delta;
+		uint32_t j;
+
+		for (j = 0; j < num_cmds; j++)
+			SET_MAP(map[i][SRC_MAP + j], src[j], src_va + va_offset, offset, delta, 0);
+		SET_MAP(map[i][DST_MAP], dst, dst_va + va_offset, offset, delta, 0);
+		SET_MAP(map[i][BATCH_MAP], batch[i], to_user_pointer(batch_addr[i]), 0, PAGE_SIZE, 0);
+	}
+
+	/* Bind the buffers to device page table */
+	for (i = 0; i < num_ctxts; i++) {
+		vm_bind(fd, vm_id[i], &map[i][BATCH_MAP],
+			do_sync_bind(cfg) ? NULL : &exec_fence[i][BATCH_FENCE]);
+		vm_bind(fd, vm_id[i], &map[i][DST_MAP],
+			do_sync_bind(cfg) ? NULL : &exec_fence[i][DST_FENCE]);
+	}
+
+	/* Have GPU do the copy */
+	for (i = 0; i < cfg->num_cmds; i++) {
+		uint32_t j;
+
+		for (j = 0; j < num_ctxts; j++)
+			vm_bind(fd, vm_id[j], &map[j][SRC_MAP + i],
+				do_sync_bind(cfg) ? NULL : &exec_fence[j][SRC_FENCE]);
+
+		i915_gem_copy(fd, src_va, dst_va, va_delta, delta, size, ctx,
+			      num_ctxts, batch_addr, e->flags, exec_fence,
+			      do_sync_bind(cfg) ? 1 : NUM_FENCES);
+
+		i915_gem_sync(fd, ctx, num_ctxts, exec_fence);
+
+		for (j = 0; j < num_ctxts; j++) {
+			if (!do_sync_bind(cfg))
+				syncobj_destroy(fd, exec_fence[j][SRC_FENCE].handle);
+			if (do_unbind(cfg))
+				vm_unbind(fd, vm_id[j], &map[j][SRC_MAP + i]);
+		}
+	}
+	put_ahnd(ahnd);
+
+	/*
+	 * Unbind buffers from device page table.
+	 * If not, it should get unbound while freeing the buffer.
+	 */
+	for (i = 0; i < num_ctxts; i++) {
+		if (!do_sync_bind(cfg)) {
+			syncobj_destroy(fd, exec_fence[i][BATCH_FENCE].handle);
+			syncobj_destroy(fd, exec_fence[i][DST_FENCE].handle);
+		}
+		if (do_unbind(cfg)) {
+			vm_unbind(fd, vm_id[i], &map[i][BATCH_MAP]);
+			vm_unbind(fd, vm_id[i], &map[i][DST_MAP]);
+		}
+	}
+
+	/* Close batch buffers */
+	for (i = 0; i < num_ctxts; i++) {
+		syncobj_destroy(fd, exec_fence[i][EXEC_FENCE].handle);
+		gem_close(fd, batch[i]);
+	}
+
+	if (num_cmds)
+		debug_dump_buffer(dst_addr, size, "dst_obj", false);
+
+	/* Validate by comparing the last SRC with DST */
+	if (num_cmds)
+		igt_assert(memcmp(src_addr[num_cmds - 1], dst_addr, size) == 0);
+
+	/* Free the objects */
+	destroy_src_objs(fd, mr, src, size, num_cmds, src_addr);
+	destroy_dst_obj(fd, mr, dst, size, dst_addr);
+
+	/* Done with the contexts */
+	for (i = 0; i < num_ctxts; i++) {
+		igt_debug("Destroying context 0x%x\n", ctx[i]->id);
+		gem_vm_destroy(fd, vm_id[i]);
+		intel_ctx_destroy(fd, ctx[i]);
+	}
+
+	if (share_vm)
+		gem_vm_destroy(fd, shared_vm_id);
+}
+
+igt_main
+{
+	struct test_cfg *t, tests[] = {
+		{"basic", DEFAULT_BUFF_SIZE, 1, 1, 0},
+		{"multi_cmds", DEFAULT_BUFF_SIZE, MAX_CMDS, 1, 0},
+		{"skip_copy", DEFAULT_BUFF_SIZE, 0, 1, 0},
+		{"skip_unbind", DEFAULT_BUFF_SIZE, 1, 1, TEST_SKIP_UNBIND},
+		{"multi_ctxts", DEFAULT_BUFF_SIZE, 1, MAX_CTXTS, 0},
+		{"share_vm", DEFAULT_BUFF_SIZE, 1, MAX_CTXTS, TEST_SHARE_VM},
+		{"64K", SZ_64K, 1, 1, 0},
+		{"2M", SZ_2M, 1, 1, 0},
+		{"2M_sync_bind", SZ_2M, 1, 1, TEST_SYNC_BIND},
+		{ }
+	};
+	int fd;
+	struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
+	uint32_t alignment = 0;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require(gem_has_blt(fd));
+		igt_require(i915_vm_bind_version(fd) == 1);
+		ctx = intel_ctx_create_all_physical(fd);
+
+		/* Get max alignment required */
+		for_each_memory_region(r, fd)
+			alignment = max_t(uint32_t, alignment, r->gtt_alignment);
+
+		/* Get copy engine */
+		for_each_ctx_engine(fd, ctx, e)
+			if (e->class == I915_ENGINE_CLASS_COPY)
+				break;
+	}
+
+	for (t = tests; t->name; t++) {
+		igt_describe_f("VM_BIND %s", t->name);
+		igt_subtest_with_dynamic(t->name) {
+			for_each_memory_region(r, fd) {
+				struct test_cfg cfg = *t;
+
+				if (r->ci.memory_instance)
+					continue;
+
+				cfg.size = ALIGN(cfg.size, alignment);
+				cfg.size *= cfg.num_ctxts;
+				igt_dynamic_f("%s", r->name)
+					run_test(fd, ctx, &cfg, r, alignment, e);
+			}
+		}
+	}
+
+	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 3ae32422a..bdfde4b78 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -54,6 +54,7 @@ igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
+igt@i915_vm_bind_basic@basic-smem
 igt@i915_vm_bind_sanity@basic
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
diff --git a/tests/meson.build b/tests/meson.build
index 76c7f9ca6..f4ff6fe7f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -223,6 +223,7 @@ i915_progs = [
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
+	'i915_vm_bind_basic',
 	'i915_vm_bind_sanity',
 	'kms_big_fb',
 	'kms_big_joiner' ,
-- 
2.21.0.rc0.32.g243a4c7e27
