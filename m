Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541F10E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:47 -0800
Message-Id: <20230118071350.17498-17-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 16/19] tests/i915/vm_bind: Test capture
 of persistent mappings
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

Add i915_vm_bind_capture to validate dump capture of persistent
mappings including partial binding.

v2: Use i915_capture library routines, add vm_bind version check,
    use intel allocator
v3: Use syncobj library functions

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_capture.c | 358 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 359 insertions(+)
 create mode 100644 tests/i915/i915_vm_bind_capture.c

diff --git a/tests/i915/i915_vm_bind_capture.c b/tests/i915/i915_vm_bind_capture.c
new file mode 100644
index 000000000..03385ce62
--- /dev/null
+++ b/tests/i915/i915_vm_bind_capture.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+/** @file gem_vm_bind_capture.c
+ *
+ * This is the test for dump capture of VM_BIND mappings.
+ *
+ * The goal is to simply ensure that capture of persistent mappings
+ * works. This test in part is derived from gem_exec_capture.c
+ */
+
+#include <sched.h>
+
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "i915/i915_error_decode.h"
+#include "i915/i915_vm_bind.h"
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+#include "igt_types.h"
+#include "intel_ctx.h"
+
+#define PAGE_SIZE   4096
+
+#define NUM_OBJS  3
+#define NUM_MAPS  4
+
+IGT_TEST_DESCRIPTION("Check that we capture the user specified persistent mappings on a hang");
+
+struct mappings {
+	uint32_t  obj;
+	uint64_t  va;
+	uint64_t  offset;
+	uint64_t  length;
+
+	uint32_t  idx;
+	uint32_t  expect;
+	bool      found;
+};
+
+static int check_error_state(int dir, struct mappings *map, uint32_t num_maps)
+{
+	char *error, *str;
+	int blobs = 0;
+
+	errno = 0;
+	error = igt_sysfs_get(dir, "error");
+	igt_sysfs_set(dir, "error", "Begone!");
+	igt_assert(error);
+	igt_assert(errno != ENOMEM);
+	igt_debug("%s\n", error);
+
+	/* render ring --- user = 0x00000000 ffffd000 */
+	for (str = error; (str = strstr(str, "--- user = ")); ) {
+		uint32_t *data = NULL;
+		uint64_t addr;
+		unsigned long i, j, sz;
+		unsigned long start;
+		unsigned long end;
+
+		if (strncmp(str, "--- user = 0x", 13))
+			break;
+		str += 13;
+		addr = strtoul(str, &str, 16);
+		addr <<= 32;
+		addr |= strtoul(str + 1, &str, 16);
+		igt_assert(*str++ == '\n');
+
+		start = 0;
+		end = num_maps;
+		while (end > start) {
+			i = (end - start) / 2 + start;
+			if (map[i].va < addr)
+				start = i + 1;
+			else if (map[i].va > addr)
+				end = i;
+			else
+				break;
+		}
+
+		igt_assert(map[i].va == addr);
+		igt_assert(!map[i].found);
+		map[i].found = true;
+		igt_debug("offset:%"PRIx64", index:%d\n",
+			  addr, map[i].idx);
+
+		/* gtt_page_sizes = 0x00010000 */
+		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
+			str += 19 + 8;
+			igt_assert(*str++ == '\n');
+		}
+
+		if (!(*str == ':' || *str == '~'))
+			continue;
+
+		igt_debug("blob:%.64s\n", str);
+		sz = i915_ascii85_decode(str + 1, &data, *str == ':', &str);
+		igt_debug("Found addr 0x%lx sz 0x%lx\n", addr, sz);
+		igt_assert_eq(4 * sz, map[i].length);
+		igt_assert(*str++ == '\n');
+		str = strchr(str, '-');
+
+		for (j = 0; j < sz; j++)
+			igt_assert_eq(data[j], map[i].expect + j);
+
+		blobs++;
+		free(data);
+	}
+
+	free(error);
+	return blobs;
+}
+
+static int gem_recurse(uint32_t *batch, uint64_t batch_va)
+{
+	*batch++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
+	*batch++ = lower_32_bits(batch_va);
+	*batch++ = upper_32_bits(batch_va);
+	*batch = 0;
+
+	return 4 * sizeof(uint32_t);
+}
+
+static struct gem_engine_properties
+configure_hangs(int fd, const struct intel_execution_engine2 *e, int ctx_id)
+{
+	struct gem_engine_properties props;
+
+	/* Ensure fast hang detection */
+	props.engine = e;
+	props.preempt_timeout = 250;
+	props.heartbeat_interval = 500;
+	gem_engine_properties_configure(fd, &props);
+
+	/* Allow engine based resets and disable banning */
+	igt_allow_hang(fd, ctx_id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+
+	return props;
+}
+
+static void gem_reset(int fd, int dir, uint32_t ctx_id, uint32_t batch,
+		      uint64_t batch_va, struct intel_execution_engine2 *e)
+{
+	struct drm_i915_gem_timeline_fence exec_fence = { };
+	struct drm_i915_gem_execbuffer3 execbuf = { };
+	uint64_t fence_value = 0;
+	uint32_t exec_syncobj;
+	uint32_t buf[20], len;
+
+	len = gem_recurse(buf, batch_va);
+	gem_write(fd, batch, 0, buf, len);
+
+	execbuf.ctx_id = ctx_id;
+	execbuf.batch_address = batch_va;
+	execbuf.engine_idx = e->flags;
+	execbuf.fence_count = 1;
+	execbuf.timeline_fences = to_user_pointer(&exec_fence);
+
+	exec_syncobj = syncobj_create(fd, 0);
+	exec_fence.handle = exec_syncobj;
+	exec_fence.flags = I915_TIMELINE_FENCE_SIGNAL;
+
+	gem_execbuf3(fd, &execbuf);
+
+	igt_assert(syncobj_timeline_wait(fd, &exec_syncobj, &fence_value, 1,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+	syncobj_destroy(fd, exec_syncobj);
+}
+
+static void set_map(struct mappings *m, uint32_t idx, uint32_t obj, uint64_t va,
+		    uint64_t offset, uint64_t length, uint32_t expect)
+{
+	m->idx = idx;
+	m->obj = obj;
+	m->va = va;
+	m->offset = offset;
+	m->length = length;
+	m->expect = expect;
+	igt_debug("Created mapping:0x%x - va 0x%lx handle %d offset 0x%lx length 0x%lx\n",
+		  m->idx, m->va, m->obj, m->offset, m->length);
+}
+
+static uint32_t create_obj(int fd, struct gem_memory_region *mr, uint32_t size, void **addr)
+{
+	uint32_t handle;
+
+	if (!mr) {
+		igt_assert(posix_memalign(addr, PAGE_SIZE, size) == 0);
+		gem_userptr(fd, *addr, size, 0, 0, &handle);
+	} else {
+		handle = gem_create_in_memory_region_list(fd, size, 0, &mr->ci, 1);
+		*addr = gem_mmap__cpu(fd, handle, 0, size, PROT_WRITE);
+	}
+
+	return handle;
+}
+
+static void destroy_obj(int fd, uint32_t handle, uint32_t size, void *addr, bool is_userptr)
+{
+	if (!is_userptr)
+		igt_assert(gem_munmap(addr, size) == 0);
+
+	gem_close(fd, handle);
+
+	if (is_userptr)
+		free(addr);
+}
+
+static void run_vm_bind_capture(int fd, int dir, const intel_ctx_t *base_ctx,
+				struct gem_memory_region *mr,
+				struct intel_execution_engine2 *e)
+{
+	uint64_t obj_size = (mr ? mr->gtt_alignment : PAGE_SIZE) * 4;
+	struct mappings *m, map[NUM_MAPS * NUM_OBJS + 1] = { };
+	struct drm_i915_gem_context_param param = {
+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
+		.value = 0,
+	};
+	struct gem_engine_properties saved_engine;
+	uint64_t batch_va, va, ahnd;
+	uint32_t i, obj[NUM_OBJS];
+	uint32_t *addr[NUM_OBJS];
+	const intel_ctx_t *ctx;
+	uint32_t vm_id, batch;
+
+	ctx = intel_ctx_create(fd, &base_ctx->cfg);
+	param.ctx_id = ctx->id;
+	gem_context_set_param(fd, &param);
+	vm_id = gem_vm_create_in_vm_bind_mode(fd);
+	gem_context_set_vm(fd, ctx->id, vm_id);
+
+	saved_engine = configure_hangs(fd, e, ctx->id);
+
+	ahnd = intel_allocator_open_full(fd, ctx->id, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH,
+					 obj_size);
+
+	/* Create objects and mappings */
+	batch = gem_create(fd, PAGE_SIZE);
+	batch_va = CANONICAL(get_offset(ahnd, batch, PAGE_SIZE, 0));
+	for (i = 0, m = map; i < NUM_OBJS; i++) {
+		obj[i] = create_obj(fd, mr, obj_size, (void **)&addr[i]);
+		va = CANONICAL(get_offset(ahnd, obj[i], obj_size * NUM_MAPS, 0));
+
+		for (unsigned int n = 0; n < obj_size / sizeof(*addr[0]); n++)
+			addr[i][n] = (i << 24) + n;
+
+		/* Full bind */
+		set_map(m++, 0 + (i * NUM_MAPS), obj[i], va, 0, obj_size, (i << 24));
+		/* Full bind with alias VA */
+		set_map(m++, 1 + (i * NUM_MAPS), obj[i], va + obj_size, 0, obj_size, (i << 24));
+		/* Partial bind */
+		set_map(m++, 2 + (i * NUM_MAPS), obj[i], va + (obj_size * 2), 0, obj_size / 2, (i << 24));
+		/* Partial bind with offset */
+		set_map(m++, 3 + (i * NUM_MAPS), obj[i], va + (obj_size * 3), obj_size / 2, obj_size / 2,
+			(i << 24) + (obj_size / 2) / sizeof(*addr[0]));
+	}
+	m->length = 0;
+
+	i915_vm_bind(fd, vm_id, batch_va, batch, 0, PAGE_SIZE, 0, 0, 0);
+	/* Bind mappings with capture request */
+	for (m = map; m->length; m++)
+		i915_vm_bind(fd, vm_id, m->va, m->obj, m->offset, m->length,
+			     I915_GEM_VM_BIND_CAPTURE, 0, 0);
+
+	/* Cause reset and check the dump */
+	gem_reset(fd, dir, ctx->id, batch, batch_va, e);
+	igt_assert_eq(check_error_state(dir, map, NUM_OBJS * NUM_MAPS), NUM_OBJS * NUM_MAPS);
+
+	for (m = map; m->length; m++)
+		i915_vm_unbind(fd, vm_id, m->va, m->length);
+	i915_vm_unbind(fd, vm_id, batch_va, PAGE_SIZE);
+
+	put_ahnd(ahnd);
+	gem_close(fd, batch);
+	for (i = 0; i < NUM_OBJS; i++)
+		destroy_obj(fd, obj[i], obj_size, (void *)addr[i], !mr);
+
+	gem_engine_properties_restore(fd, &saved_engine);
+
+	gem_vm_destroy(fd, vm_id);
+	intel_ctx_destroy(fd, ctx);
+}
+
+static int has_userptr(int fd)
+{
+	uint32_t handle = 0;
+	void *ptr;
+	int ret;
+
+	assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
+	ret = __gem_userptr(fd, ptr, PAGE_SIZE, 0, 0, &handle);
+	if (ret != 0) {
+		free(ptr);
+		return 0;
+	}
+
+	gem_close(fd, handle);
+	free(ptr);
+
+	return handle != 0;
+}
+
+static size_t safer_strlen(const char *s)
+{
+	return s ? strlen(s) : 0;
+}
+
+igt_main
+{
+	struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
+	igt_fd_t(dir);
+	igt_fd_t(fd);
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require(i915_vm_bind_version(fd) == 1);
+		igt_allow_hang(fd, 0, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+
+		dir = igt_sysfs_open(fd);
+		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
+		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
+		ctx = intel_ctx_create_all_physical(fd);
+	}
+
+	igt_describe("Basic vm_bind capture test");
+	igt_subtest_with_dynamic("basic") {
+		for_each_ctx_engine(fd, ctx, e) {
+
+			for_each_memory_region(r, fd) {
+				if (r->ci.memory_instance)
+					continue;
+
+				igt_dynamic_f("%s-%s", e->name, r->name)
+					run_vm_bind_capture(fd, dir, ctx, r, e);
+			}
+
+			if (has_userptr(fd)) {
+				/* Use NULL memory region for userptr */
+				igt_dynamic_f("%s-userptr", e->name)
+					run_vm_bind_capture(fd, dir, ctx, NULL, e);
+			}
+		}
+	}
+
+	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2ac10df2d..facf43e7d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -217,6 +217,7 @@ i915_progs = [
 	'i915_selftest',
 	'i915_suspend',
 	'i915_vm_bind_basic',
+	'i915_vm_bind_capture',
 	'i915_vm_bind_sanity',
 	'kms_big_fb',
 	'kms_big_joiner' ,
-- 
2.21.0.rc0.32.g243a4c7e27
