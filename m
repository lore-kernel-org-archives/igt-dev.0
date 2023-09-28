Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F110E607
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 11:05:36 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:05 +0000
Message-Id: <20230928110516.7-4-francois.dugast@intel.com>
In-Reply-To: <20230928110516.7-1-francois.dugast@intel.com>
References: <20230928110516.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 03/14] drm-uapi/xe_drm: Separate VM_BIND's
 operation and flag, align with latest uapi
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Separate VM_BIND's operation and flag")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h     | 14 ++++++++------
 lib/intel_batchbuffer.c       | 11 +++++++----
 lib/xe/xe_ioctl.c             | 31 ++++++++++++++++---------------
 lib/xe/xe_ioctl.h             |  6 +++---
 lib/xe/xe_util.c              |  9 ++++++---
 tests/intel/xe_exec_basic.c   |  2 +-
 tests/intel/xe_exec_threads.c |  2 +-
 tests/intel/xe_vm.c           | 16 +++++++++-------
 8 files changed, 51 insertions(+), 40 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 8a702e6f4..807d8ac2c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -660,8 +660,10 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_RESTART		0x3
 #define XE_VM_BIND_OP_UNMAP_ALL		0x4
 #define XE_VM_BIND_OP_PREFETCH		0x5
+	/** @op: Bind operation to perform */
+	__u32 op;
 
-#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
 	/*
 	 * A bind ops completions are always async, hence the support for out
 	 * sync. This flag indicates the allocation of the memory for new page
@@ -686,12 +688,12 @@ struct drm_xe_vm_bind_op {
 	 * configured in the VM and must be set if the VM is configured with
 	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
 	 */
-#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
+#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -699,9 +701,9 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
+	/** @flags: Bind flags */
+	__u32 flags;
 
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e7b1b755f..6e668d28c 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1281,7 +1281,8 @@ void intel_bb_destroy(struct intel_bb *ibb)
 }
 
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
-						   uint32_t op, uint32_t region)
+						   uint32_t op, uint32_t flags,
+						   uint32_t region)
 {
 	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
@@ -1298,6 +1299,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 			ops->obj = objects[i]->handle;
 
 		ops->op = op;
+		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
 		ops->range = objects[i]->rsvd1;
@@ -1323,9 +1325,10 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
 
 	if (ibb->num_objects > 1) {
 		struct drm_xe_vm_bind_op *bind_ops;
-		uint32_t op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+		uint32_t op = XE_VM_BIND_OP_UNMAP;
+		uint32_t flags = XE_VM_BIND_FLAG_ASYNC;
 
-		bind_ops = xe_alloc_bind_ops(ibb, op, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, op, flags, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 2);
 		free(bind_ops);
@@ -2354,7 +2357,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 
 	syncs[0].handle = syncobj_create(ibb->fd, 0);
 	if (ibb->num_objects > 1) {
-		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, 0);
+		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, 0);
 		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
 				 ibb->num_objects, syncs, 1);
 		free(bind_ops);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 730dcfd16..48cd185de 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -67,7 +67,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, 0, 0, 0,
-			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_UNMAP_ALL, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -91,8 +91,8 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext)
+		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		  uint32_t region, uint64_t ext)
 {
 	struct drm_xe_vm_bind bind = {
 		.extensions = ext,
@@ -103,6 +103,7 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		.bind.range = size,
 		.bind.addr = addr,
 		.bind.op = op,
+		.bind.flags = flags,
 		.bind.region = region,
 		.num_syncs = num_syncs,
 		.syncs = (uintptr_t)sync,
@@ -117,11 +118,11 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
-			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t region, uint64_t ext)
 {
 	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
-				   op, sync, num_syncs, region, ext), 0);
+				   op, flags, sync, num_syncs, region, ext), 0);
 }
 
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
@@ -129,7 +130,7 @@ void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
+			    XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0, 0);
 }
 
 void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
@@ -137,7 +138,7 @@ void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
 		  struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
-			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
+			    XE_VM_BIND_OP_UNMAP, 0, sync, num_syncs, 0, 0);
 }
 
 void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
@@ -146,7 +147,7 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t off
 			  uint32_t region)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_PREFETCH, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, region, 0);
 }
 
@@ -155,7 +156,7 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, sync,
 			    num_syncs, 0, 0);
 }
 
@@ -165,7 +166,7 @@ void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t b
 			    uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
-			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
+			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC | flags,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -174,7 +175,7 @@ void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
 			      struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
+			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC,
 			    sync, num_syncs, 0, 0);
 }
 
@@ -184,7 +185,7 @@ void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t exec_queue,
 				    uint32_t num_syncs, uint32_t flags)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
-			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
+			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC |
 			    flags, sync, num_syncs, 0, 0);
 }
 
@@ -193,7 +194,7 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
 			struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
-			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
+			    XE_VM_BIND_OP_UNMAP, XE_VM_BIND_FLAG_ASYNC, sync,
 			    num_syncs, 0, 0);
 }
 
@@ -205,8 +206,8 @@ static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		.handle = syncobj_create(fd, 0),
 	};
 
-	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
-			    0);
+	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, &sync, 1,
+			    0, 0);
 
 	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
 	syncobj_destroy(fd, sync.handle);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6c281b3bf..f0e4109dc 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -19,11 +19,11 @@ uint32_t xe_cs_prefetch_size(int fd);
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
-		  uint64_t ext);
+		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		  uint32_t region, uint64_t ext);
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
-			  uint32_t op, struct drm_xe_sync *sync,
+			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
 			  uint32_t num_syncs, uint32_t region, uint64_t ext);
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		uint64_t addr, uint64_t size,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 2f9ffe2f1..5fa4d4610 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -116,7 +116,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 {
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
 	struct xe_object *obj;
-	uint32_t num_objects = 0, i = 0, op;
+	uint32_t num_objects = 0, i = 0, op, flags;
 
 	igt_list_for_each_entry(obj, obj_list, link)
 		num_objects++;
@@ -134,13 +134,16 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 		ops = &bind_ops[i];
 
 		if (obj->bind_op == XE_OBJECT_BIND) {
-			op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+			op = XE_VM_BIND_OP_MAP;
+			flags = XE_VM_BIND_FLAG_ASYNC;
 			ops->obj = obj->handle;
 		} else {
-			op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+			op = XE_VM_BIND_OP_UNMAP;
+			flags = XE_VM_BIND_FLAG_ASYNC;
 		}
 
 		ops->op = op;
+		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = obj->offset;
 		ops->range = obj->size;
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index a4414e052..e29398aaa 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -170,7 +170,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & SPARSE)
 			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
 					    0, 0, sparse_addr[i], bo_size,
-					    XE_VM_BIND_OP_MAP |
+					    XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    XE_VM_BIND_FLAG_NULL, sync,
 					    1, 0, 0);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 12e76874e..1f9af894f 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -609,7 +609,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			if (rebind_error_inject == i)
 				__xe_vm_bind_assert(fd, vm, bind_exec_queues[e],
 						    0, 0, addr, bo_size,
-						    XE_VM_BIND_OP_UNMAP |
+						    XE_VM_BIND_OP_UNMAP,
 						    XE_VM_BIND_FLAG_ASYNC |
 						    INJECT_ERROR, sync_all,
 						    n_exec_queues, 0, 0);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 4952ea786..f96305851 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -316,7 +316,7 @@ static void userptr_invalid(int fd)
 	vm = xe_vm_create(fd, 0, 0);
 	munmap(data, size);
 	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
-			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
+			   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0, 0);
 	igt_assert(ret == -EFAULT);
 
 	xe_vm_destroy(fd, vm);
@@ -437,7 +437,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)	/* Inject error on this bind */
 			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
+					    bo_size, XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -451,7 +451,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    bo_size, XE_VM_BIND_OP_UNMAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -465,7 +465,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_MAP |
+					    bo_size, XE_VM_BIND_OP_MAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -479,7 +479,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 		if (i == N_BINDS / 8)
 			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
 					    addr + i * bo_size * 2,
-					    bo_size, XE_VM_BIND_OP_UNMAP |
+					    bo_size, XE_VM_BIND_OP_UNMAP,
 					    XE_VM_BIND_FLAG_ASYNC |
 					    INJECT_ERROR, &sync, 1, 0, 0);
 		else
@@ -928,7 +928,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
 		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
-		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].op = XE_VM_BIND_OP_MAP;
+		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].region = 0;
 		bind_ops[i].reserved[0] = 0;
 		bind_ops[i].reserved[1] = 0;
@@ -972,7 +973,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	for (i = 0; i < n_execs; ++i) {
 		bind_ops[i].obj = 0;
-		bind_ops[i].op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
+		bind_ops[i].op = XE_VM_BIND_OP_UNMAP;
+		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
 	}
 
 	syncobj_reset(fd, &sync[0].handle, 1);
-- 
2.34.1
