Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248B10EA0B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:07 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:45 +0000
Message-Id: <20231103144359.7-51-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 50/64] drm-uapi/xe: Convert tile_mask to a
 pt_placement_hint
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

Aligns with kernel commit ("drm/xe/uapi: Convert tile_mask to a pt_placement_hint")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 16 +++++++++++++---
 tests/intel/xe_vm.c       |  2 +-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 605f783df..fd1efcf92 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -850,10 +850,20 @@ struct drm_xe_vm_bind_op {
 	__u64 addr;
 
 	/**
-	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
-	 * only applies to creating new VMAs
+	 * @pt_placement_hint: An optional memory_region bit-mask hint, which
+	 * only applies when creating new VMAs. Default value '0' is the
+	 * recommended value.
+	 *
+	 * It hints the optimal placement for the page-table tree for this VMA.
+	 * For instance, when userspace is using engines living in a secondary
+	 * tile with allocated BOs near those engines, that same
+	 * @near_mem_region could be used in this hint field.
+	 *
+	 * Since it is a hint, the Xe kernel driver is free to ignore this mask
+	 * and choose the best location for the page-table, taking into
+	 * consideration the running hardware and runtime constrains.
 	 */
-	__u64 tile_mask;
+	__u64 pt_placement_hint;
 
 #define DRM_XE_VM_BIND_OP_MAP		0x0
 #define DRM_XE_VM_BIND_OP_UNMAP		0x1
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index c9b6eb142..78cfb801a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -763,7 +763,7 @@ test_bind_array(int fd, struct drm_xe_query_engine_info *engine, int n_execs,
 		bind_ops[i].obj_offset = 0;
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
-		bind_ops[i].tile_mask = 0x1 << engine->instance.gt_id;
+		bind_ops[i].pt_placement_hint = vram_near_engine_if_possible(fd, engine);
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
 		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].prefetch_mem_region_instance = 0;
-- 
2.34.1
