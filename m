Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB1910E1A0
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 17:31:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 1/6] drm-uapi/xe: Align header with current kernel uAPI
Date: Tue, 12 Dec 2023 17:30:54 +0000
Message-Id: <20231212173059.7-2-francois.dugast@intel.com>
In-Reply-To: <20231212173059.7-1-francois.dugast@intel.com>
References: <20231212173059.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A few non functional changes from kernel commits below were missing:
    drm/xe/uapi: support pat_index selection with vm_bind
    drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 590f7b7af..313e555d2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -129,7 +129,6 @@ struct xe_user_extension {
  * It is returned as part of the @drm_xe_engine, but it also is used as
  * the input of engine selection for both @drm_xe_exec_queue_create and
  * @drm_xe_query_engine_cycles
- *
  */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
@@ -143,9 +142,11 @@ struct drm_xe_engine_class_instance {
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+	/** @engine_class: engine class id */
 	__u16 engine_class;
-
+	/** @engine_instance: engine instance id */
 	__u16 engine_instance;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
 	/** @pad: MBZ */
 	__u16 pad;
@@ -736,6 +737,12 @@ struct drm_xe_vm_bind_op {
 	 *
 	 * Note: For userptr and externally imported dma-buf the kernel expects
 	 * either 1WAY or 2WAY for the @pat_index.
+	 *
+	 * For DRM_XE_VM_BIND_FLAG_NULL bindings there are no KMD restrictions
+	 * on the @pat_index. For such mappings there is no actual memory being
+	 * mapped (the address in the PTE is invalid), so the various PAT memory
+	 * attributes likely do not apply.  Simply leaving as zero is one
+	 * option (still a valid pat_index).
 	 */
 	__u16 pat_index;
 
-- 
2.34.1
