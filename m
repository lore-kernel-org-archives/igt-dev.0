Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14CB10E610
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:23 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:51 +0000
Message-Id: <20231129145457.7-15-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 14/20] drm-uapi/xe: Kill tile_mask
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

Align with commit ("drm/xe/uapi: Kill tile_mask")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 8 +-------
 tests/intel/xe_vm.c       | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1e98363b2..2a4ac6e8e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -683,12 +683,6 @@ struct drm_xe_vm_bind_op {
 	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
 	__u64 addr;
 
-	/**
-	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
-	 * only applies to creating new VMAs
-	 */
-	__u64 tile_mask;
-
 #define DRM_XE_VM_BIND_OP_MAP		0x0
 #define DRM_XE_VM_BIND_OP_UNMAP		0x1
 #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
@@ -723,7 +717,7 @@ struct drm_xe_vm_bind_op {
 	__u32 prefetch_mem_region_instance;
 
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[3];
 };
 
 struct drm_xe_vm_bind {
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7871fa789..4122b5e49 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -799,7 +799,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		bind_ops[i].obj_offset = 0;
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
-		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
 		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].prefetch_mem_region_instance = 0;
-- 
2.34.1
