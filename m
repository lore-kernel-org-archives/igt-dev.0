Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7AE10EA17
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:33 +0000
Message-Id: <20231103144359.7-39-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 38/64] drm-uapi/xe: Align with xe_exec ioctl
 reorder
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

Align with kernel commit ("drm/xe/uapi: Move xe_exec after xe_exec_queue")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 144 +++++++++++++++++++-------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index b546e42a5..87daba5b6 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -62,11 +62,11 @@ extern "C" {
 #define DRM_XE_VM_CREATE		0x03
 #define DRM_XE_VM_DESTROY		0x04
 #define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC			0x06
-#define DRM_XE_EXEC_QUEUE_CREATE	0x07
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_EXEC_QUEUE_CREATE	0x06
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x07
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x08
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x09
+#define DRM_XE_EXEC			0x0a
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 /* Must be kept compact -- no holes */
 
@@ -76,11 +76,11 @@ extern "C" {
 #define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
 #define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
 #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
@@ -863,53 +863,6 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
- */
-struct drm_xe_vm_bind {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @vm_id: The ID of the VM to bind to */
-	__u32 vm_id;
-
-	/**
-	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
-	 * and exec queue must have same vm_id. If zero, the default VM bind engine
-	 * is used.
-	 */
-	__u32 exec_queue_id;
-
-	/** @num_binds: number of binds in this IOCTL */
-	__u32 num_binds;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	union {
-		/** @bind: used if num_binds == 1 */
-		struct drm_xe_vm_bind_op bind;
-
-		/**
-		 * @vector_of_binds: userptr to array of struct
-		 * drm_xe_vm_bind_op if num_binds > 1
-		 */
-		__u64 vector_of_binds;
-	};
-
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @pad2: MBZ */
-	__u32 pad2;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_sync - Main structure for sync objects and user fences
  *
@@ -964,35 +917,47 @@ struct drm_xe_sync {
 };
 
 /**
- * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
  */
-struct drm_xe_exec {
+struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @exec_queue_id: Exec queue ID for the batch buffer */
-	__u32 exec_queue_id;
-
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
+	/** @vm_id: The ID of the VM to bind to */
+	__u32 vm_id;
 
 	/**
-	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-	 * array of batch buffer addresses
+	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
+	 * and exec queue must have same vm_id. If zero, the default VM bind engine
+	 * is used.
 	 */
-	__u64 address;
+	__u32 exec_queue_id;
 
-	/**
-	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
-	 */
-	__u16 num_batch_buffer;
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
 
 	/** @pad: MBZ */
-	__u16 pad[3];
+	__u32 pad;
+
+	union {
+		/** @bind: used if num_binds == 1 */
+		struct drm_xe_vm_bind_op bind;
+
+		/**
+		 * @vector_of_binds: userptr to array of struct
+		 * drm_xe_vm_bind_op if num_binds > 1
+		 */
+		__u64 vector_of_binds;
+	};
+
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -1112,6 +1077,41 @@ struct drm_xe_exec_queue_get_property {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
+struct drm_xe_exec {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID for the batch buffer */
+	__u32 exec_queue_id;
+
+	/** @num_syncs: Amount of struct drm_xe_sync in array. */
+	__u32 num_syncs;
+
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/**
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
+	__u64 address;
+
+	/**
+	 * @num_batch_buffer: number of batch buffer in this exec, must match
+	 * the width of the engine
+	 */
+	__u16 num_batch_buffer;
+
+	/** @pad: MBZ */
+	__u16 pad[3];
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
-- 
2.34.1
