Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81D710E2A9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:21:48 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 23:21:13 -0700
Message-Id: <20220928062115.6412-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
References: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/i915/vm_bind: Add vm_bind sanity
 test
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_vm_bind_sanity.c | 250 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 251 insertions(+)
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

diff --git a/tests/i915/i915_vm_bind_sanity.c b/tests/i915/i915_vm_bind_sanity.c
new file mode 100644
index 0000000000..c0e7bd0633
--- /dev/null
+++ b/tests/i915/i915_vm_bind_sanity.c
@@ -0,0 +1,250 @@
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
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/poll.h>
+
+#include "igt_syncobj.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "igt.h"
+
+#include "i915/gem_vm.h"
+
+#define EOPNOTSUPP    95
+
+#define PAGE_SIZE   4096
+#define SZ_64K      (16 * PAGE_SIZE)
+#define SZ_2M       (512 * PAGE_SIZE)
+
+IGT_TEST_DESCRIPTION("Sanity test vm_bind related interfaces");
+
+#define VA 0xa0000000
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
+static inline int
+__i915_vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start,
+	       uint64_t offset, uint64_t length, uint64_t flags,
+	       struct drm_i915_gem_timeline_fence *fence)
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
+	if (fence)
+		bind.fence = *fence;
+
+	return __gem_vm_bind(fd, &bind);
+}
+
+static inline void
+i915_vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start,
+	     uint64_t offset, uint64_t length, uint64_t flags,
+	     struct drm_i915_gem_timeline_fence *fence)
+{
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, start,
+				     offset, length, flags, fence), 0);
+	if (fence) {
+		igt_assert(syncobj_timeline_wait(fd, &fence->handle, (uint64_t *)&fence->value,
+						 1, gettime_ns() + (2 * NSEC_PER_SEC),
+						 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+		igt_assert(!syncobj_busy(fd, fence->handle));
+	}
+}
+
+static inline int
+__i915_vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint64_t flags)
+{
+	struct drm_i915_gem_vm_unbind unbind;
+
+	memset(&unbind, 0, sizeof(unbind));
+	unbind.vm_id = vm_id;
+	unbind.start = start;
+	unbind.length = length;
+	unbind.flags = flags;
+
+	return __gem_vm_unbind(fd, &unbind);
+}
+
+static inline void
+i915_vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint64_t flags)
+{
+	igt_assert_eq(__i915_vm_unbind(fd, vm_id, start, length, flags), 0);
+}
+
+static void basic(int fd, bool test_lmem)
+{
+	uint32_t vm_id, vm_id2, vm_id_exec_mode, handle, pg_size, size;
+	unsigned int region = test_lmem ? REGION_LMEM(0) : REGION_SMEM;
+	struct drm_i915_gem_timeline_fence fence = {
+		.handle = syncobj_create(fd, 0),
+		.flags = I915_TIMELINE_FENCE_SIGNAL,
+		.value = 0,
+	};
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_exec_object2 obj;
+	const intel_ctx_t *ctx;
+	int dmabuf;
+
+	pg_size = (test_lmem && HAS_64K_PAGES(intel_get_drm_devid(fd))) ? SZ_64K : PAGE_SIZE;
+	size = pg_size * 4;
+
+	vm_id = gem_vm_create_in_vm_bind_mode(fd);
+	handle = gem_create_in_memory_regions(fd, size, region);
+
+	/* Bind and unbind */
+	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
+	i915_vm_unbind(fd, vm_id, VA, size, 0);
+
+	/* Bind with out fence */
+	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, &fence);
+	i915_vm_unbind(fd, vm_id, VA, size, 0);
+
+	/* Aliasing bind and unbind */
+	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
+	i915_vm_bind(fd, vm_id, handle, VA + SZ_2M, 0, size, 0, NULL);
+	i915_vm_unbind(fd, vm_id, VA, size, 0);
+	i915_vm_unbind(fd, vm_id, VA + SZ_2M, size, 0);
+
+	/* Invalid handle */
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle + 10, VA, 0, size, 0, NULL), -ENOENT);
+
+	/* Invalid mapping range */
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, 0, 0, NULL), -EINVAL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size, size, 0, NULL), -EINVAL);
+
+	/* Unaligned binds */
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size / 2, pg_size, 0, NULL), -EINVAL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, pg_size / 2, 0, NULL), -EINVAL);
+
+	/* range overflow binds */
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size, -pg_size, 0, NULL), -EINVAL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size * 2, -pg_size, 0, NULL), -EINVAL);
+
+	/* re-bind VA range without unbinding */
+	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL), -EEXIST);
+	i915_vm_unbind(fd, vm_id, VA, size, 0);
+
+	/* unbind a non-existing mapping */
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, 0, VA + SZ_2M, 0, size, 0, NULL), -ENOENT);
+
+	/* unbind with length mismatch */
+	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size * 2, 0, NULL), -EINVAL);
+	i915_vm_unbind(fd, vm_id, VA, size, 0);
+
+	/* validate exclusivity of vm_bind & exec modes of binding */
+	vm_id_exec_mode = gem_vm_create(fd);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id_exec_mode, handle, VA, 0, size, 0, NULL), -EOPNOTSUPP);
+
+	ctx = intel_ctx_create_all_physical(fd);
+	gem_context_set_vm(fd, ctx->id, vm_id);
+	(void)gem_context_get_vm(fd, ctx->id);
+
+	memset(&obj, 0, sizeof(obj));
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	obj.handle = handle;
+	i915_execbuffer2_set_context_id(execbuf, ctx->id);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EOPNOTSUPP);
+
+	intel_ctx_destroy(fd, ctx);
+	gem_vm_destroy(fd, vm_id_exec_mode);
+	gem_close(fd, handle);
+
+	/* validate VM private objects */
+	vm_id2 = gem_vm_create_in_vm_bind_mode(fd);
+	handle = gem_create_vm_private_in_memory_regions(fd, size, vm_id2, region);
+
+	igt_assert_eq(prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dmabuf), -EINVAL);
+	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL), -EINVAL);
+	i915_vm_bind(fd, vm_id2, handle, VA, 0, size, 0, NULL);
+	i915_vm_unbind(fd, vm_id2, VA, size, 0);
+
+	gem_close(fd, handle);
+	gem_vm_destroy(fd, vm_id2);
+	gem_vm_destroy(fd, vm_id);
+	syncobj_destroy(fd, fence.handle);
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
+	int fd;
+	bool has_lmem;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(fd);
+		igt_require(vm_bind_version(fd) == 1);
+		has_lmem = gem_has_lmem(fd);
+	}
+
+	igt_describe("Basic vm_bind sanity test with SMEM");
+	igt_subtest_f("basic-smem") {
+		basic(fd, false);
+	}
+
+	if (has_lmem) {
+		igt_describe("Basic vm_bind sanity test with LMEM");
+		igt_subtest_f("basic-lmem")
+			basic(fd, true);
+	}
+
+	igt_fixture {
+		close(fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index eb38c17fe8..3ee2230543 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -249,6 +249,7 @@ i915_progs = [
 	'sysfs_heartbeat_interval',
 	'sysfs_preempt_timeout',
 	'sysfs_timeslice_duration',
+	'i915_vm_bind_sanity',
 ]
 
 msm_progs = [
-- 
2.21.0.rc0.32.g243a4c7e27
