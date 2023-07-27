Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1310E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 01:21:41 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:21:36 -0700
Message-Id: <20230727012136.456190-5-matthew.brost@intel.com>
In-Reply-To: <20230727012136.456190-1-matthew.brost@intel.com>
References: <20230727012136.456190-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/4] xe_vm: Add EIO test
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

Let's make sure bad input to VM bind doesn't crash the driver or leak
resources. Also ensure that VM can enter / exit error state.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c |  22 ++++++
 lib/xe/xe_ioctl.h |   4 +
 tests/xe/xe_vm.c  | 186 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 2d3ad00c60..24a76f70e4 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -71,6 +71,28 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
 			    sync, num_syncs, 0, 0);
 }
 
+int __xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
+		       struct drm_xe_vm_bind_op *bind_ops,
+		       uint32_t num_bind, struct drm_xe_sync *sync,
+		       uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.engine_id = engine,
+	};
+
+	igt_assert(num_bind > 1);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
+		return -errno;
+
+	return 0;
+}
+
 void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
 		      struct drm_xe_vm_bind_op *bind_ops,
 		      uint32_t num_bind, struct drm_xe_sync *sync,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 5c4b4f21ab..5bcd800a49 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -58,6 +58,10 @@ void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		     uint64_t addr, uint64_t size);
 void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 		       uint64_t addr, uint64_t size);
+int __xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
+		       struct drm_xe_vm_bind_op *bind_ops,
+		       uint32_t num_bind, struct drm_xe_sync *sync,
+		       uint32_t num_syncs);
 void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
 		      struct drm_xe_vm_bind_op *bind_ops,
 		      uint32_t num_bind, struct drm_xe_sync *sync,
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 6ffe756676..f04c9c2f97 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -295,6 +295,188 @@ static void unbind_all(int fd, int n_vmas)
 
 #define	MAP_ADDRESS	0x00007fadeadbe000
 
+/**
+ * SUBTEST: eio
+ * Description:
+ *	Verifies bad input to vm bind is handled correctly and doesn't crash the
+ *	driver or leak resources
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+static void eio(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	struct drm_xe_vm_bind_op bind_ops[3];
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t async_bind_engine;
+	uint32_t sync_bind_engine;
+	int ret, i;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, 0, vm, size);
+	async_bind_engine = xe_bind_engine_create(fd, vm, 0, true);
+	sync_bind_engine = xe_bind_engine_create(fd, vm, 0, false);
+
+	/* Bad BO */
+	ret = __xe_vm_bind(fd, vm, 0, bo + 1, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -ENOENT);
+
+	/* Bad BO /w an engine */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo + 1, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -ENOENT);
+
+	/* Unmap with BO */
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+			   size, XE_VM_BIND_OP_UNMAP, NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Async / sync mismatch */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, bo, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Async / sync mismatch */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Reclaim sync */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Reclaim async */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, bo, 0, 0x40000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Invalid engine */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine + async_bind_engine, bo, 0,
+			   0x40000, size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -ENOENT);
+
+	/* Bad BO offset */
+	ret = __xe_vm_bind(fd, vm, 0, bo, xe_get_default_alignment(fd) * 2, 0x40000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Bad BO offset /w an engine */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo,
+			   xe_get_default_alignment(fd) * 2, 0x40000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);
+
+	/* Bad BO 2nd op */
+	memset(bind_ops, 0, sizeof(bind_ops));
+	for (i = 0; i < 2; ++i) {
+		bind_ops[i].obj = bo + i;
+		bind_ops[i].obj_offset = 0;
+		bind_ops[i].range = size;
+		bind_ops[i].addr = 0x40000 * (i + 1);
+		bind_ops[i].op = XE_VM_BIND_OP_MAP;
+	}
+	ret = __xe_vm_bind_array(fd, vm, 0, bind_ops, 2, 0, 0);
+	igt_assert(ret == -ENOENT);
+
+	/* Bad BO /w an engine 2nd op */
+	memset(bind_ops, 0, sizeof(bind_ops));
+	for (i = 0; i < 2; ++i) {
+		bind_ops[i].obj = bo + i;
+		bind_ops[i].obj_offset = 0;
+		bind_ops[i].range = size;
+		bind_ops[i].addr = 0x40000 * (i + 1);
+		bind_ops[i].op = XE_VM_BIND_OP_MAP;
+	}
+	ret = __xe_vm_bind_array(fd, vm, sync_bind_engine, bind_ops, 2, 0, 0);
+	igt_assert(ret == -ENOENT);
+
+	/* userptr_invalid 2nd op */
+	memset(bind_ops, 0, sizeof(bind_ops));
+	for (i = 0; i < 2; ++i) {
+		bind_ops[i].obj = !i ? bo : 0;
+		bind_ops[i].obj_offset = !i ? 0 : MAP_ADDRESS;
+		bind_ops[i].range = size;
+		bind_ops[i].addr = 0x40000 * (i + 1);
+		bind_ops[i].op = !i ? XE_VM_BIND_OP_MAP :
+			XE_VM_BIND_OP_MAP_USERPTR;
+	}
+	ret = __xe_vm_bind_array(fd, vm, sync_bind_engine, bind_ops, 2, 0, 0);
+	igt_assert(ret == -EFAULT);
+
+	/* fail 2nd op, verify error allowed / not allowed ops, restart */
+	memset(bind_ops, 0, sizeof(bind_ops));
+	for (i = 0; i < 3; ++i) {
+		bind_ops[i].obj = bo;
+		bind_ops[i].obj_offset = 0;
+		bind_ops[i].range = size;
+		bind_ops[i].addr = 0x40000 * (i + 1);
+		bind_ops[i].op = XE_VM_BIND_OP_MAP;
+#define INJECT_ERROR	(0x1 << 31)
+		if (i == 1)
+			bind_ops[i].op |= INJECT_ERROR;
+	}
+	ret = __xe_vm_bind_array(fd, vm, sync_bind_engine, bind_ops, 3, 0, 0);
+	igt_assert(ret == -ENOSPC);	/* Enter error state, 2nd bind op failed */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, bo, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EALREADY);	/* Can't do anything w/o reclaim */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_MAP, NULL, 0, 0, 0);
+	igt_assert(ret == -EALREADY);	/* Can't do anything w/o reclaim */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, 0, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EALREADY);	/* Can't do anything w/o reclaim */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, 0, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_UNMAP,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EALREADY);	/* Can't do anything w/o reclaim */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, bo, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC |
+			   XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);	/* Can't map with reclaim */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);	/* Can't map with reclaim */
+	ret = __xe_vm_bind(fd, vm, async_bind_engine, 0, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC |
+			   XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);	/* Can't use async with reclaim */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, 0, 0, 0x4000000,
+			   size, XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(!ret);	/* Reclaim memory */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, 0, 0, 0,
+			   0, XE_VM_BIND_OP_RESTART |
+			   XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(!ret);	/* Exit error state, 2nd & 3rd bind op executed */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0,
+			   0, XE_VM_BIND_OP_UNMAP_ALL |
+			   XE_VM_BIND_FLAG_RECLAIM,
+			   NULL, 0, 0, 0);
+	igt_assert(ret == -EINVAL);	/* Verify not in error state */
+	ret = __xe_vm_bind(fd, vm, sync_bind_engine, bo, 0, 0,
+			   0, XE_VM_BIND_OP_UNMAP_ALL,
+			   NULL, 0, 0, 0);
+	igt_assert(!ret);	/* Cleanup works */
+
+	xe_engine_destroy(fd, async_bind_engine);
+	xe_engine_destroy(fd, sync_bind_engine);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: userptr-invalid
  * Description:
@@ -358,7 +540,6 @@ static void vm_async_ops_err(int fd, bool destroy)
 
 	for (i = 0; i < N_BINDS; i++) {
 		sync.handle = syncobjs[i];
-#define INJECT_ERROR	(0x1 << 31)
 		if ((i == N_BINDS / 8 && destroy) ||
 		    (!((i + 1) % (N_BINDS / 8)) && !destroy)) { /* Inject error on this bind */
 			__xe_vm_bind(fd, vm, 0, bo, 0,
@@ -1959,6 +2140,9 @@ igt_main
 	igt_subtest("unbind-all-8-vmas")
 		unbind_all(fd, 8);
 
+	igt_subtest("eio")
+		eio(fd);
+
 	igt_subtest("userptr-invalid")
 		userptr_invalid(fd);
 
-- 
2.34.1
