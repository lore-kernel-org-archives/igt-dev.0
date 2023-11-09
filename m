Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022F810E8EC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:06 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:58 +0000
Message-Id: <20231109155410.7-46-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 45/57] drm-uapi/xe: Be more specific about
 vm_bind prefetch region
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

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with kernel commit ("drm/xe/uapi: Be more specific about the vm_bind prefetch region")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 8 ++++++--
 lib/intel_batchbuffer.c   | 4 ++--
 lib/xe/xe_ioctl.c         | 8 ++++----
 lib/xe/xe_ioctl.h         | 2 +-
 lib/xe/xe_util.c          | 2 +-
 tests/intel/xe_vm.c       | 2 +-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d3f48c7ce..177b60161 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -873,8 +873,12 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
-	/** @region: Memory region to prefetch VMA to, instance not a mask */
-	__u32 region;
+	/**
+	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
+	 * It is a region instance, not a mask.
+	 * To be used only with %DRM_XE_VM_BIND_OP_PREFETCH operation.
+	 */
+	__u32 prefetch_mem_region_instance;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 53d4f8626..5de211371 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1283,7 +1283,7 @@ void intel_bb_destroy(struct intel_bb *ibb)
 
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 						   uint32_t op, uint32_t flags,
-						   uint32_t region)
+						   uint32_t prefetch_region)
 {
 	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
@@ -1304,7 +1304,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
 		ops->range = objects[i]->rsvd1;
-		ops->region = region;
+		ops->prefetch_mem_region_instance = prefetch_region;
 
 		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx\n",
 			  i, ops->obj, (long long)ops->addr, (long long)ops->range);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 5d4f2fcd8..db0ca6bc0 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -92,7 +92,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
-		  uint32_t region, uint64_t ext)
+		  uint32_t prefetch_region, uint64_t ext)
 {
 	struct drm_xe_vm_bind bind = {
 		.extensions = ext,
@@ -104,7 +104,7 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		.bind.addr = addr,
 		.bind.op = op,
 		.bind.flags = flags,
-		.bind.region = region,
+		.bind.prefetch_mem_region_instance = prefetch_region,
 		.num_syncs = num_syncs,
 		.syncs = (uintptr_t)sync,
 		.exec_queue_id = exec_queue,
@@ -119,10 +119,10 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
-			  uint32_t num_syncs, uint32_t region, uint64_t ext)
+			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext)
 {
 	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
-				   op, flags, sync, num_syncs, region, ext), 0);
+				   op, flags, sync, num_syncs, prefetch_region, ext), 0);
 }
 
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index c19d0464b..bc609442a 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -24,7 +24,7 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
-			  uint32_t num_syncs, uint32_t region, uint64_t ext);
+			  uint32_t num_syncs, uint32_t prefetch_region, uint64_t ext);
 void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		uint64_t addr, uint64_t size,
 		struct drm_xe_sync *sync, uint32_t num_syncs);
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 4dcf84421..62f00b305 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -147,7 +147,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
 		ops->obj_offset = 0;
 		ops->addr = obj->offset;
 		ops->range = obj->size;
-		ops->region = 0;
+		ops->prefetch_mem_region_instance = 0;
 
 		bind_info("  [%d]: [%6s] handle: %u, offset: %llx, size: %llx\n",
 			  i, obj->bind_op == XE_OBJECT_BIND ? "BIND" : "UNBIND",
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 4c53e6514..aaecb3641 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -807,7 +807,7 @@ test_bind_array(int fd, struct drm_xe_query_engine_info *engine, int n_execs,
 		bind_ops[i].tile_mask = 0x1 << engine->instance.gt_id;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
 		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
-		bind_ops[i].region = 0;
+		bind_ops[i].prefetch_mem_region_instance = 0;
 		bind_ops[i].reserved[0] = 0;
 		bind_ops[i].reserved[1] = 0;
 
-- 
2.34.1
