Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0074710E8DF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:11 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:54:10 +0000
Message-Id: <20231109155410.7-58-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 57/57] drm-uapi/xe: Add examples of user space
 code
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

Align with commit ("drm/xe/uapi: Add examples of user space code")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 268cf8f5b..aee7bbec5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -958,6 +958,30 @@ struct drm_xe_vm_bind_op {
 
 /**
  * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ *
+ * Below is an example of a minimal use of @drm_xe_vm_bind to
+ * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
+ * illustrate `userptr`. It can be synchronized by using the example
+ * provided for @drm_xe_sync.
+ *
+ * .. code-block:: C
+ *
+ *     data = aligned_alloc(ALIGNMENT, BO_SIZE);
+ *     struct drm_xe_vm_bind bind = {
+ *         .vm_id = vm,
+ *         .num_binds = 1,
+ *         .bind.obj = 0,
+ *         .bind.obj_offset = to_user_pointer(data),
+ *         .bind.range = BO_SIZE,
+ *         .bind.addr = BIND_ADDRESS,
+ *         .bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
+ *         .bind.flags = DRM_XE_VM_BIND_FLAG_ASYNC,
+ *         .num_syncs = 1,
+ *         .syncs = &sync,
+ *         .exec_queue_id = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+ *
  */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1030,6 +1054,30 @@ struct drm_xe_vm_bind {
  * The @flags can be:
  *  - %DRM_XE_SYNC_FLAG_SIGNAL
  *
+ * A minimal use of @drm_xe_sync looks like this:
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_sync sync = {
+ *         .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+ *         .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+ *     };
+ *     struct drm_syncobj_create syncobj_create = { 0 };
+ *     ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &syncobj_create);
+ *     sync.handle = syncobj_create.handle;
+ *         ...
+ *         use of &sync in drm_xe_exec or drm_xe_vm_bind
+ *         ...
+ *     struct drm_syncobj_wait wait = {
+ *         .handles = &sync.handle,
+ *         .timeout_nsec = INT64_MAX,
+ *         .count_handles = 1,
+ *         .flags = 0,
+ *         .first_signaled = 0,
+ *         .pad = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, &wait);
+ *
  */
 struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1134,6 +1182,25 @@ struct drm_xe_sync {
 
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ *
+ * The example below shows how to use @drm_xe_exec_queue_create to create
+ * a simple exec_queue (no parallel submission) of class
+ * &DRM_XE_ENGINE_CLASS_RENDER.
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_engine_class_instance instance = {
+ *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+ *     };
+ *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .extensions = 0,
+ *          .vm_id = vm,
+ *          .num_bb_per_exec = 1,
+ *          .num_eng_per_bb = 1,
+ *          .instances = to_user_pointer(&instance),
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
+ *
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
@@ -1256,6 +1323,23 @@ struct drm_xe_exec_queue_get_property {
 
 /**
  * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ *
+ * This is an example to use @drm_xe_exec for execution of the object
+ * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
+ * (see example in @drm_xe_exec_queue_create). It can be synchronized
+ * by using the example provided for @drm_xe_sync.
+ *
+ * .. code-block:: C
+ *
+ *     struct drm_xe_exec exec = {
+ *         .exec_queue_id = exec_queue,
+ *         .syncs = &sync,
+ *         .num_syncs = 1,
+ *         .address = BIND_ADDRESS,
+ *         .num_batch_buffer = 1,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+ *
  */
 struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
-- 
2.34.1
