Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A3810E44C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:50 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:26 +0000
Message-Id: <20231114134426.7-9-francois.dugast@intel.com>
In-Reply-To: <20231114134426.7-1-francois.dugast@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 8/8] drm-uapi/xe: Be more specific about
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
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 8 ++++++--
 lib/intel_batchbuffer.c   | 4 ++--
 lib/xe/xe_ioctl.c         | 8 ++++----
 lib/xe/xe_ioctl.h         | 2 +-
 lib/xe/xe_util.c          | 2 +-
 tests/intel/xe_vm.c       | 2 +-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 7a02b78bf..af32ec161 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -672,8 +672,12 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
-	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
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
index b59c490db..f12d6219d 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1282,7 +1282,7 @@ void intel_bb_destroy(struct intel_bb *ibb)
 
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 						   uint32_t op, uint32_t flags,
-						   uint32_t region)
+						   uint32_t prefetch_region)
 {
 	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
 	struct drm_xe_vm_bind_op *bind_ops, *ops;
@@ -1303,7 +1303,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
 		ops->range = objects[i]->rsvd1;
-		ops->region = region;
+		ops->prefetch_mem_region_instance = prefetch_region;
 
 		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx\n",
 			  i, ops->obj, (long long)ops->addr, (long long)ops->range);
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index a9cfdbf9d..738c4ffdb 100644
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
index d9c97bf22..a9171bcf7 100644
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
index 2635edf72..742e6333e 100644
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
index 86c8d0c5d..05e8e7516 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -797,7 +797,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
 		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
-		bind_ops[i].region = 0;
+		bind_ops[i].prefetch_mem_region_instance = 0;
 		bind_ops[i].reserved[0] = 0;
 		bind_ops[i].reserved[1] = 0;
 
-- 
2.34.1
