Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44425112A84
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 23:06:12 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 16:05:45 -0700
Message-Id: <20220701230546.8348-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
References: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 4/5] tests/i915/vm_bind: Add basic VM_BIND
 test support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add basic tests for VM_BIND functionality. Bind the buffer objects in
device page table with VM_BIND calls and have GPU copy the data from a
source buffer object to destination buffer object.
Test for different buffer sizes, buffer object placement and with
multiple contexts.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_basic.c | 540 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 541 insertions(+)
 create mode 100644 tests/i915/i915_vm_bind_basic.c

diff --git a/tests/i915/i915_vm_bind_basic.c b/tests/i915/i915_vm_bind_basic.c
new file mode 100644
index 0000000000..209fda77c6
--- /dev/null
+++ b/tests/i915/i915_vm_bind_basic.c
@@ -0,0 +1,540 @@
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
+#include <sys/poll.h>
+
+#include "i915/gem.h"
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
+#define BATCH_FENCE  0
+#define SRC_FENCE    1
+#define DST_FENCE    2
+#define EXEC_FENCE   3
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
+#define SET_MAP(map, _obj, _va, _offset, _length, _flags)   \
+{                                  \
+	(map).obj = _obj;          \
+	(map).va = _va;            \
+	(map).offset = _offset;	   \
+	(map).length = _length;	   \
+	(map).flags = _flags;	   \
+}
+
+#define MAX_BATCH_DWORD    64
+
+#define abs(x) ((x) >= 0 ? (x) : -(x))
+
+#define TEST_SMEM             BIT(0)
+#define TEST_SKIP_UNBIND      BIT(1)
+#define TEST_SHARE_VM         BIT(2)
+
+#define is_lmem(cfg)        (!((cfg)->flags & TEST_SMEM))
+#define do_unbind(cfg)      (!((cfg)->flags & TEST_SKIP_UNBIND))
+#define do_share_vm(cfg)    ((cfg)->flags & TEST_SHARE_VM)
+
+struct test_cfg {
+	const char *name;
+	uint32_t size;
+	uint8_t num_cmds;
+	uint32_t num_ctxts;
+	uint32_t flags;
+};
+
+static uint64_t
+gettime_ns(void)
+{
+	struct timespec current;
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
+}
+
+static bool syncobj_busy(int fd, uint32_t handle)
+{
+	bool result;
+	int sf;
+
+	sf = syncobj_handle_to_fd(fd, handle,
+				  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
+	result = poll(&(struct pollfd){sf, POLLIN}, 1, 0) == 0;
+	close(sf);
+
+	return result;
+}
+
+static inline void i915_vm_bind(int fd, uint32_t vm_id, struct mapping *m,
+				struct drm_i915_gem_timeline_fence *fence)
+{
+	struct drm_i915_gem_vm_bind bind;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm_id;
+	bind.handle = m->obj;
+	bind.start = m->va;
+	bind.offset = m->offset;
+	bind.length = m->length;
+	bind.flags = m->flags;
+	if (fence) {
+		bind.fence.flags |= I915_TIMELINE_FENCE_SIGNAL;
+		bind.fence.handle = syncobj_create(fd, 0);
+		bind.fence.value = 0;
+
+		fence->handle = bind.fence.handle;
+		fence->flags = I915_TIMELINE_FENCE_WAIT;
+		fence->value = bind.fence.value;
+	}
+
+	igt_info("VM_BIND vm:0x%x h:0x%x v:0x%lx o:0x%lx l:0x%lx f:0x%llx\n",
+		 vm_id, m->obj, m->va, m->offset, m->length, bind.flags);
+	gem_vm_bind(fd, &bind);
+}
+
+static inline void i915_vm_unbind(int fd, uint32_t vm_id, struct mapping *m)
+{
+	struct drm_i915_gem_vm_unbind unbind;
+
+	/* Object handle is not required during unbind */
+	igt_info("VM_UNBIND vm:0x%x v:0x%lx l:0x%lx f:0x%lx\n",
+		 vm_id, m->va, m->length, m->flags);
+	memset(&unbind, 0, sizeof(unbind));
+	unbind.vm_id = vm_id;
+	unbind.start = m->va;
+	unbind.length = m->length;
+	unbind.flags = m->flags;
+
+	gem_vm_unbind(fd, &unbind);
+}
+
+static void print_buffer(void *buf, uint32_t size,
+			 const char *str, bool full)
+{
+	uint32_t i = 0;
+
+	igt_debug("Printing %s 0x%lx size 0x%x\n", str, (uint64_t)buf, size);
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
+	uint64_t src_offset = (uint64_t)src;
+	uint64_t dst_offset = (uint64_t)dst;
+
+	*cmd++ = GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
+	*cmd++ = BLT_DEPTH_32 | PAGE_SIZE;
+	*cmd++ = 0;
+	*cmd++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
+	*cmd++ = lower_32_bits(dst_offset);
+	*cmd++ = upper_32_bits(dst_offset);
+	*cmd++ = 0;
+	*cmd++ = PAGE_SIZE;
+	*cmd++ = lower_32_bits(src_offset);
+	*cmd++ = upper_32_bits(src_offset);
+
+	*cmd++ = MI_BATCH_BUFFER_END;
+	*cmd++ = 0;
+
+	return ALIGN((cmd - batch + 1) * sizeof(uint32_t), 8);
+}
+
+static void __gem_copy(int fd, uint64_t src, uint64_t dst, uint32_t offset, uint32_t size,
+		       uint32_t ctx_id, void *batch_addr, unsigned int eb_flags,
+		       struct drm_i915_gem_timeline_fence *fence)
+{
+	uint32_t len, buf[MAX_BATCH_DWORD] = { 0 };
+	struct drm_i915_gem_execbuffer3 execbuf;
+
+	len = gem_linear_fast_blt(buf, src + offset, dst + offset, size);
+
+	memcpy(batch_addr, (void *)buf, len);
+	print_buffer(buf, len, "batch", true);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.ctx_id = ctx_id;
+	execbuf.batch_address = (uint64_t)&batch_addr;
+	execbuf.engine_idx = eb_flags;
+	execbuf.fence_count = NUM_FENCES;
+	execbuf.timeline_fences = to_user_pointer(fence);
+	gem_execbuf3(fd, &execbuf);
+}
+
+static void i915_gem_copy(int fd, uint64_t src, uint64_t dst, uint32_t size,
+			  const intel_ctx_t **ctx, uint32_t num_ctxts,
+			  void **batch_addr, unsigned int eb_flags,
+			  struct drm_i915_gem_timeline_fence (*fence)[NUM_FENCES])
+{
+	uint32_t i, delta = size / num_ctxts;
+
+	for (i = 0; i < num_ctxts; i++) {
+		igt_info("Issuing gem copy on ctx 0x%x\n", ctx[i]->id);
+		__gem_copy(fd, src, dst, (i * delta), delta,
+			   ctx[i]->id, batch_addr[i], eb_flags, fence[i]);
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
+		igt_info("gem copy completed on ctx 0x%x\n", ctx[i]->id);
+	}
+}
+
+static struct igt_collection *get_region_set(int fd, struct test_cfg *cfg)
+{
+	uint32_t mem_type[] = { I915_SYSTEM_MEMORY, I915_DEVICE_MEMORY };
+	uint32_t lmem_type[] = { I915_DEVICE_MEMORY };
+	struct drm_i915_query_memory_regions *query_info;
+
+	query_info = gem_get_query_memory_regions(fd);
+	igt_assert(query_info);
+
+	if (is_lmem(cfg))
+		return __get_memory_region_set(query_info, lmem_type, 1);
+	else
+		return __get_memory_region_set(query_info, mem_type, 2);
+}
+
+static void create_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint32_t size,
+			    uint32_t num_cmds, void *src_addr[])
+{
+	int i;
+	struct igt_collection *set = get_region_set(fd, cfg);
+	uint32_t region;
+
+	for (i = 0; i < num_cmds; i++) {
+		region = igt_collection_get_value(set, i % set->size);
+		src[i] = gem_create_in_memory_regions(fd, size, region);
+		src_addr[i] = gem_mmap__cpu(fd, src[i], 0, size, PROT_WRITE);
+	}
+}
+
+static void destroy_src_objs(int fd, struct test_cfg *cfg, uint32_t src[], uint32_t size,
+			     uint32_t num_cmds, void *src_addr[])
+{
+	int i;
+
+	for (i = 0; i < num_cmds; i++) {
+		igt_assert(gem_munmap(src_addr[i], size) == 0);
+		igt_debug("Closing object 0x%x\n", src[i]);
+		gem_close(fd, src[i]);
+	}
+}
+
+static uint32_t create_dst_obj(int fd, struct test_cfg *cfg, uint32_t size, void **dst_addr)
+{
+	uint32_t dst;
+	struct igt_collection *set = get_region_set(fd, cfg);
+
+	dst = gem_create_in_memory_regions(fd, size, igt_collection_get_value(set, 0));
+	*dst_addr = gem_mmap__cpu(fd, dst, 0, size, PROT_WRITE);
+
+	return dst;
+}
+
+static void destroy_dst_obj(int fd, struct test_cfg *cfg, uint32_t dst, uint32_t size, void *dst_addr)
+{
+	igt_assert(gem_munmap(dst_addr, size) == 0);
+	igt_debug("Closing object 0x%x\n", dst);
+	gem_close(fd, dst);
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
+		     const struct intel_execution_engine2 *e)
+{
+	void *src_addr[MAX_CMDS] = { 0 }, *dst_addr = NULL;
+	uint32_t src[MAX_CMDS], dst, i, size = cfg->size;
+	struct drm_i915_gem_timeline_fence exec_fence[MAX_CTXTS][NUM_FENCES];
+	uint32_t shared_vm_id, vm_id[MAX_CTXTS];
+	struct mapping map[MAX_CTXTS][MAX_MAP];
+	uint32_t num_ctxts = cfg->num_ctxts;
+	uint32_t num_cmds = cfg->num_cmds;
+	uint32_t npages = size / PAGE_SIZE;
+	const intel_ctx_t *ctx[MAX_CTXTS];
+	bool share_vm = do_share_vm(cfg);
+	void *batch_addr[MAX_CTXTS];
+	uint32_t batch[MAX_CTXTS];
+	uint64_t src_va, dst_va;
+	uint32_t delta;
+
+	delta = size / num_ctxts;
+	if (share_vm)
+		shared_vm_id = gem_vm_create_in_vm_bind_mode(fd);
+
+	/* Create contexts */
+	num_ctxts = min_t(num_ctxts, MAX_CTXTS, num_ctxts);
+	for (i = 0; i < num_ctxts; i++) {
+		uint32_t vmid;
+
+		if (share_vm)
+			vmid = shared_vm_id;
+		else
+			vmid = gem_vm_create_in_vm_bind_mode(fd);
+
+		ctx[i] = intel_ctx_create(fd, &base_ctx->cfg);
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
+	create_src_objs(fd, cfg, src, size, num_cmds, src_addr);
+	dst = create_dst_obj(fd, cfg, size, &dst_addr);
+
+	/*
+	 * mmap'ed addresses are not 64K aligned. On platforms requiring
+	 * 64K alignment, use static addresses.
+	 */
+	if (size < SZ_2M && num_cmds && !HAS_64K_PAGES(intel_get_drm_devid(fd))) {
+		src_va = (uint64_t)src_addr[0];
+		dst_va = (uint64_t)dst_addr;
+	} else {
+		src_va = 0xa000000;
+		dst_va = 0xb000000;
+	}
+
+	pattern_fill_buf(src_addr, size, num_cmds, npages);
+
+	if (num_cmds)
+		print_buffer(src_addr[num_cmds - 1], size, "src_obj", false);
+
+	for (i = 0; i < num_ctxts; i++) {
+		batch[i] = gem_create_vm_private_in_memory_regions(fd, PAGE_SIZE, vm_id[i], REGION_SMEM);
+		batch_addr[i] = gem_mmap__cpu(fd, batch[i], 0, PAGE_SIZE, PROT_WRITE);
+	}
+
+	/* Create mappings */
+	for (i = 0; i < num_ctxts; i++) {
+		uint64_t offset = i * delta;
+		uint32_t j;
+
+		for (j = 0; j < num_cmds; j++)
+			SET_MAP(map[i][SRC_MAP + j], src[j], src_va + offset, offset, delta, 0);
+		SET_MAP(map[i][DST_MAP], dst, dst_va + offset, offset, delta, 0);
+		SET_MAP(map[i][BATCH_MAP], batch[i], (uint64_t)batch_addr[i], 0, PAGE_SIZE, 0);
+	}
+
+	/* Bind the buffers to device page table */
+	for (i = 0; i < num_ctxts; i++) {
+		i915_vm_bind(fd, vm_id[i], &map[i][BATCH_MAP], &exec_fence[i][BATCH_FENCE]);
+		i915_vm_bind(fd, vm_id[i], &map[i][DST_MAP], &exec_fence[i][DST_FENCE]);
+	}
+
+	/* Have GPU do the copy */
+	for (i = 0; i < cfg->num_cmds; i++) {
+		uint32_t j;
+
+		for (j = 0; j < num_ctxts; j++)
+			i915_vm_bind(fd, vm_id[j], &map[j][SRC_MAP + i], &exec_fence[j][SRC_FENCE]);
+
+		i915_gem_copy(fd, src_va, dst_va, size, ctx, num_ctxts,
+			      batch_addr, e->flags, exec_fence);
+
+		i915_gem_sync(fd, ctx, num_ctxts, exec_fence);
+
+		for (j = 0; j < num_ctxts; j++) {
+			syncobj_destroy(fd, exec_fence[j][SRC_FENCE].handle);
+			if (do_unbind(cfg))
+				i915_vm_unbind(fd, vm_id[j], &map[j][SRC_MAP + i]);
+		}
+	}
+
+	/*
+	 * Unbind buffers from device page table.
+	 * If not, it should get unbound while freeing the buffer.
+	 */
+	for (i = 0; i < num_ctxts; i++) {
+		syncobj_destroy(fd, exec_fence[i][BATCH_FENCE].handle);
+		syncobj_destroy(fd, exec_fence[i][DST_FENCE].handle);
+		if (do_unbind(cfg)) {
+			i915_vm_unbind(fd, vm_id[i], &map[i][BATCH_MAP]);
+			i915_vm_unbind(fd, vm_id[i], &map[i][DST_MAP]);
+		}
+	}
+
+	/* Close batch buffers */
+	for (i = 0; i < num_ctxts; i++) {
+		syncobj_destroy(fd, exec_fence[i][EXEC_FENCE].handle);
+		gem_close(fd, batch[i]);
+	}
+
+	/* Accessing the buffer will migrate the pages from device to host */
+	print_buffer(dst_addr, size, "dst_obj", false);
+
+	/* Validate by comparing the last SRC with DST */
+	if (num_cmds)
+		igt_assert(memcmp(src_addr[num_cmds - 1], dst_addr, size) == 0);
+
+	/* Free the objects */
+	destroy_src_objs(fd, cfg, src, size, num_cmds, src_addr);
+	destroy_dst_obj(fd, cfg, dst, size, dst_addr);
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
+static int vm_bind_version(int fd)
+{
+	struct drm_i915_getparam gp;
+	int value = 0;
+
+	memset(&gp, 0, sizeof(gp));
+	gp.param = I915_PARAM_VM_BIND_VERSION;
+	gp.value = &value;
+
+	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
+	errno = 0;
+
+	return value;
+}
+
+igt_main
+{
+	struct test_cfg *t, tests[] = {
+		{"basic", 0, 1, 1, 0},
+		{"multi_cmds", 0, MAX_CMDS, 1, 0},
+		{"skip_copy", 0, 0, 1, 0},
+		{"skip_unbind",  0, 1, 1, TEST_SKIP_UNBIND},
+		{"multi_ctxts", 0, 1, MAX_CTXTS, 0},
+		{"share_vm", 0, 1, MAX_CTXTS, TEST_SHARE_VM},
+		{"64K", (16 * PAGE_SIZE), 1, 1, 0},
+		{"2M", SZ_2M, 1, 1, 0},
+		{"smem", 0, 1, 1, TEST_SMEM},
+		{"smem_multi_cmds", 0, MAX_CMDS, 1, TEST_SMEM},
+		{ }
+	};
+	int fd;
+	bool has_lmem;
+	uint32_t def_size;
+	struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require(vm_bind_version(fd) == 1);
+		has_lmem = gem_has_lmem(fd);
+		def_size = HAS_64K_PAGES(intel_get_drm_devid(fd)) ?
+			   SZ_64K : DEFAULT_BUFF_SIZE;
+		ctx = intel_ctx_create_all_physical(fd);
+	}
+
+	/* Adjust test variables */
+	for (t = tests; t->name; t++) {
+		t->flags |= (has_lmem ? 0 : TEST_SMEM);
+		t->size = t->size ? : (def_size * abs(t->num_ctxts));
+	}
+
+	for (t = tests; t->name; t++)
+		igt_subtest_with_dynamic_f("%s", t->name)
+			for_each_ctx_engine(fd, ctx, e) {
+				if (e->class == I915_ENGINE_CLASS_COPY) {
+					igt_dynamic(e->name) {
+						run_test(fd, ctx, t, e);
+					}
+				}
+			}
+
+	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 56abc7e0a9..8543cce9d0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -250,6 +250,7 @@ i915_progs = [
 	'sysfs_preempt_timeout',
 	'sysfs_timeslice_duration',
 	'i915_vm_bind_sanity',
+	'i915_vm_bind_basic',
 ]
 
 msm_progs = [
-- 
2.21.0.rc0.32.g243a4c7e27
