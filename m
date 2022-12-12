Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C777B10E2B3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 23:13:03 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 15:12:43 -0800
Message-Id: <20221212231254.2303-9-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 08/19] tests/i915/vm_bind: Add vm_bind
 sanity test
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

Add sanity test to exercise vm_bind uapi.
Test for various cases with vm_bind and vm_unbind ioctls.

v2: Add more input validity tests
    Add sanity test to fast-feedback.testlist
v3: Add only basic-smem subtest to fast-feedback.testlist
v4: Use gem_create_ext to create vm private objects,
    Ensure vm private objects are only allowed in vm_bind mode,
    Use library routine i915_vm_bind_version()
v5: Add execbuf3 sanity tests, use mr->gtt_alignment,
    add non-recoverable context sanity test
v6: Add more execbuf3 sanity tests
v7: Port as per uapi reserved field changes
v8: Validate partial binding
v9: Use syncobj library functions, rebase

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_sanity.c      | 335 ++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/meson.build                     |   1 +
 3 files changed, 337 insertions(+)
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

diff --git a/tests/i915/i915_vm_bind_sanity.c b/tests/i915/i915_vm_bind_sanity.c
new file mode 100644
index 000000000..2ba083a4f
--- /dev/null
+++ b/tests/i915/i915_vm_bind_sanity.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/** @file i915_vm_bind_sanity.c
+ *
+ * This is the sanity test for VM_BIND UAPI.
+ *
+ * The goal is to test the UAPI interface.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "i915/i915_vm_bind.h"
+#include "intel_allocator.h"
+#include "igt.h"
+#include "igt_syncobj.h"
+
+#define PAGE_SIZE   4096
+#define SZ_64K      (16 * PAGE_SIZE)
+#define SZ_2M       (512 * PAGE_SIZE)
+
+IGT_TEST_DESCRIPTION("Sanity test vm_bind related interfaces");
+
+static inline int
+__vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start, uint64_t offset,
+	  uint64_t length, uint64_t flags, uint64_t rsvd_0, uint64_t rsvd_1,
+	  struct drm_i915_gem_timeline_fence *fence, uint64_t extensions)
+{
+	struct drm_i915_gem_vm_bind bind;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm_id;
+	bind.handle = handle;
+	bind.start = start;
+	bind.offset = offset;
+	bind.length = length;
+	bind.flags = flags;
+	bind.rsvd[0] = rsvd_0;
+	bind.rsvd[1] = rsvd_1;
+	bind.extensions = extensions;
+	if (fence)
+		bind.fence = *fence;
+
+	return __gem_vm_bind(fd, &bind);
+}
+
+static inline void
+vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start,
+	uint64_t offset, uint64_t length,
+	struct drm_i915_gem_timeline_fence *fence)
+{
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, start, offset,
+				length, 0, 0, 0, fence, 0), 0);
+	if (fence) {
+		igt_assert(syncobj_timeline_wait(fd, &fence->handle, (uint64_t *)&fence->value,
+						 1, gettime_ns() + (2 * NSEC_PER_SEC),
+						 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+		igt_assert(!syncobj_busy(fd, fence->handle));
+	}
+}
+
+static inline int
+__vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint32_t pad,
+	    uint64_t flags, uint64_t rsvd_0, uint64_t rsvd_1, uint64_t extensions)
+{
+	struct drm_i915_gem_vm_unbind unbind;
+
+	memset(&unbind, 0, sizeof(unbind));
+	unbind.vm_id = vm_id;
+	unbind.pad = pad;
+	unbind.flags = flags;
+	unbind.rsvd[0] = rsvd_0;
+	unbind.rsvd[1] = rsvd_1;
+	unbind.start = start;
+	unbind.length = length;
+	unbind.extensions = extensions;
+
+	return __gem_vm_unbind(fd, &unbind);
+}
+
+static inline void
+vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint64_t flags)
+{
+	igt_assert_eq(__vm_unbind(fd, vm_id, start, length, 0, 0, 0, 0, 0), 0);
+}
+
+static inline int
+__execbuf3(int fd, uint32_t ctx_id, uint32_t engine_idx, uint64_t batch_addresses,
+	   uint64_t flags, uint64_t fence_count, uint64_t fences, uint64_t rsvd,
+	   uint64_t extensions)
+{
+	struct drm_i915_gem_execbuffer3 execbuf3;
+
+	memset(&execbuf3, 0, sizeof(execbuf3));
+	execbuf3.ctx_id = ctx_id;
+	execbuf3.engine_idx = engine_idx;
+	execbuf3.batch_address = batch_addresses;
+	execbuf3.flags = flags;
+	execbuf3.fence_count = fence_count;
+	execbuf3.timeline_fences = fences;
+	execbuf3.rsvd = rsvd;
+	execbuf3.extensions = extensions;
+
+	return __gem_execbuf3(fd, &execbuf3);
+}
+
+static void basic(int fd, const struct gem_memory_region *mr)
+{
+	uint32_t vm_id, vm_id2, vm_id_exec_mode, handle;
+	struct drm_i915_gem_create_ext_memory_regions setparam_region = {
+		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+		.regions = to_user_pointer(&mr->ci),
+		.num_regions = 1,
+	};
+	struct drm_i915_gem_timeline_fence fence = {
+		.handle = syncobj_create(fd, 0),
+		.flags = I915_TIMELINE_FENCE_SIGNAL,
+		.value = 0,
+	};
+	struct drm_i915_gem_timeline_fence exec_fence = {
+		.handle = syncobj_create(fd, 0),
+		.flags = I915_TIMELINE_FENCE_SIGNAL,
+		.value = 0,
+	};
+	struct drm_i915_gem_create_ext_vm_private vm_priv = {
+		.base = { .name = I915_GEM_CREATE_EXT_VM_PRIVATE },
+	};
+	struct drm_i915_gem_context_param param = {
+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
+		.value = 0,
+	};
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	const struct intel_execution_engine2 *e;
+	struct drm_i915_gem_exec_object2 obj;
+	uint64_t pg_size = mr->gtt_alignment;
+	uint64_t ahnd, va, size = pg_size * 4;
+	const intel_ctx_t *ctx;
+	int dmabuf;
+
+	ahnd = intel_allocator_open_full(fd, 1, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH,
+					 pg_size);
+
+	vm_id = gem_vm_create_in_vm_bind_mode(fd);
+	handle = gem_create_ext(fd, size, 0, &setparam_region.base);
+	va = CANONICAL(get_offset(ahnd, handle, size, 0));
+
+	/* Bind and unbind */
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	vm_unbind(fd, vm_id, va, size, 0);
+
+	/* Partial binds */
+	vm_bind(fd, vm_id, handle, va, 0, size / 2, NULL);
+	vm_unbind(fd, vm_id, va, size / 2, 0);
+	vm_bind(fd, vm_id, handle, va, size / 2, size / 2, NULL);
+	vm_unbind(fd, vm_id, va, size / 2, 0);
+
+	/* Bind with out fence */
+	vm_bind(fd, vm_id, handle, va, 0, size, &fence);
+	vm_unbind(fd, vm_id, va, size, 0);
+
+	/* Aliasing bind and unbind */
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	vm_bind(fd, vm_id, handle, va + SZ_2M, 0, size, NULL);
+	vm_unbind(fd, vm_id, va, size, 0);
+	vm_unbind(fd, vm_id, va + SZ_2M, size, 0);
+
+	/* MBZ fields are not 0 */
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0x10, 0, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0x10, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0x10, NULL, 0), -EINVAL);
+	fence.flags |= I915_TIMELINE_FENCE_WAIT;
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0, &fence, 0), -EINVAL);
+	fence.flags |= 0x1000;
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0, &fence, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0, NULL, to_user_pointer(&obj)), -EINVAL);
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	igt_assert_eq(__vm_unbind(fd, vm_id, va, size, 0x10, 0, 0, 0, 0), -EINVAL);
+	igt_assert_eq(__vm_unbind(fd, vm_id, va, size, 0, 0x10, 0, 0, 0), -EINVAL);
+	igt_assert_eq(__vm_unbind(fd, vm_id, va, size, 0, 0, 0x10, 0, 0), -EINVAL);
+	igt_assert_eq(__vm_unbind(fd, vm_id, va, size, 0, 0, 0, 0x10, 0), -EINVAL);
+	igt_assert_eq(__vm_unbind(fd, vm_id, va, size, 0, 0, 0, 0, to_user_pointer(&obj)), -EINVAL);
+	vm_unbind(fd, vm_id, va, size, 0);
+
+	/* Invalid handle */
+	igt_assert_eq(__vm_bind(fd, vm_id, handle + 10, va, 0, size, 0, 0, 0, NULL, 0), -ENOENT);
+
+	/* Invalid mapping range */
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, 0, 0, 0, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, pg_size, size, 0, 0, 0, NULL, 0), -EINVAL);
+
+	/* Unaligned binds */
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va + 0x10, 0, size, 0, 0, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, pg_size / 2, pg_size, 0, 0, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, pg_size / 2, 0, 0, 0, NULL, 0), -EINVAL);
+
+	/* range overflow binds */
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, pg_size, -pg_size, 0, 0, 0, NULL, 0), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, pg_size * 2, -pg_size, 0, 0, 0, NULL, 0), -EINVAL);
+
+	/* re-bind VA range without unbinding */
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0, NULL, 0), -EEXIST);
+	vm_unbind(fd, vm_id, va, size, 0);
+
+	/* unbind a non-existing mapping */
+	igt_assert_eq(__vm_bind(fd, vm_id, 0, va + SZ_2M, 0, size, 0, 0, 0, NULL, 0), -ENOENT);
+
+	/* unbind with length mismatch */
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size * 2, 0, 0, 0, NULL, 0), -EINVAL);
+	vm_unbind(fd, vm_id, va, size, 0);
+
+	/* validate exclusivity of vm_bind & exec modes of binding */
+	vm_id_exec_mode = gem_vm_create(fd);
+	igt_assert_eq(__vm_bind(fd, vm_id_exec_mode, handle, va, 0, size, 0, 0, 0, NULL, 0), -EOPNOTSUPP);
+
+	/* vm_bind mode with the default recoverable context */
+	ctx = intel_ctx_create_all_physical(fd);
+	gem_context_set_vm(fd, ctx->id, vm_id);
+	param.ctx_id = ctx->id;
+	igt_assert_eq(__gem_context_get_param(fd, &param), -EINVAL);
+	intel_ctx_destroy(fd, ctx);
+
+	/* create context, make it non-recoverable and assign vm_bind vm */
+	ctx = intel_ctx_create_all_physical(fd);
+	param.ctx_id = ctx->id;
+	gem_context_set_param(fd, &param);
+	gem_context_set_vm(fd, ctx->id, vm_id);
+	(void)gem_context_get_vm(fd, ctx->id);
+
+	/* vm_bind mode with legacy execbuf */
+	memset(&obj, 0, sizeof(obj));
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	obj.handle = handle;
+	i915_execbuffer2_set_context_id(execbuf, ctx->id);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EOPNOTSUPP);
+
+	/* vm_bind mode with execbuf3 */
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+	vm_bind(fd, vm_id, handle, va, 0, size, NULL);
+	/* grab any engine */
+	for_each_ctx_engine(fd, ctx, e)
+		break;
+
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0, 0, 0, 0, 0), 0);
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0, 1, to_user_pointer(&exec_fence), 0, 0), 0);
+	igt_assert(syncobj_timeline_wait(fd, &exec_fence.handle, (uint64_t *)&exec_fence.value, 1,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+
+	/* execbuf3 with non-vm_bind mode */
+	igt_assert_eq(__execbuf3(fd, 0, e->flags, va, 0, 0, 0, 0, 0), -EOPNOTSUPP);
+
+	/* execbuf3 MBZ fields are not 0 */
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0x10, 0, 0, 0, 0), -EINVAL);
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0, 0, 0, 0x10, 0), -EINVAL);
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0, 0, 0, 0, 0x10), -EINVAL);
+	exec_fence.flags |= 0x100;
+	igt_assert_eq(__execbuf3(fd, ctx->id, e->flags, va, 0, 1, to_user_pointer(&exec_fence), 0, 0), -EINVAL);
+
+	vm_unbind(fd, vm_id, va, size, 0);
+	intel_ctx_destroy(fd, ctx);
+	gem_vm_destroy(fd, vm_id_exec_mode);
+	gem_close(fd, handle);
+
+	/* validate VM private objects */
+	setparam_region.base.next_extension = to_user_pointer(&vm_priv);
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
+				       &setparam_region.base), -ENOENT);
+	vm_priv.rsvd = 0x10;
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
+				       &setparam_region.base), -EINVAL);
+	vm_id2 = gem_vm_create(fd);
+	vm_priv.rsvd = 0;
+	vm_priv.vm_id = vm_id2;
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
+				       &setparam_region.base), -EINVAL);
+	gem_vm_destroy(fd, vm_id2);
+
+	vm_id2 = gem_vm_create_in_vm_bind_mode(fd);
+	vm_priv.vm_id = vm_id2;
+	handle = gem_create_ext(fd, size, 0, &setparam_region.base);
+
+	igt_assert_eq(__prime_handle_to_fd(fd, handle, DRM_CLOEXEC, &dmabuf), -EINVAL);
+	igt_assert_eq(__vm_bind(fd, vm_id, handle, va, 0, size, 0, 0, 0, NULL, 0), -EINVAL);
+	vm_bind(fd, vm_id2, handle, va, 0, size, NULL);
+	vm_unbind(fd, vm_id2, va, size, 0);
+
+	gem_close(fd, handle);
+	gem_vm_destroy(fd, vm_id2);
+	gem_vm_destroy(fd, vm_id);
+	syncobj_destroy(fd, fence.handle);
+	syncobj_destroy(fd, exec_fence.handle);
+	intel_allocator_close(ahnd);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require(i915_vm_bind_version(fd) == 1);
+	}
+
+	igt_describe("Basic vm_bind sanity test");
+	igt_subtest_with_dynamic("basic") {
+		for_each_memory_region(r, fd) {
+			if (r->ci.memory_instance)
+				continue;
+
+			igt_dynamic_f("%s", r->name)
+				basic(fd, r);
+		}
+	}
+
+	igt_fixture {
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f57f8ff3b..3ae32422a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -54,6 +54,7 @@ igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
+igt@i915_vm_bind_sanity@basic
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
 igt@kms_addfb_basic@addfb25-modifier-no-flag
diff --git a/tests/meson.build b/tests/meson.build
index 619c18b25..76c7f9ca6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -223,6 +223,7 @@ i915_progs = [
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
+	'i915_vm_bind_sanity',
 	'kms_big_fb',
 	'kms_big_joiner' ,
 	'kms_busy',
-- 
2.21.0.rc0.32.g243a4c7e27
