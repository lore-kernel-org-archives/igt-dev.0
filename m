Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B56EDE5
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:42 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:23 -0800
Message-Id: <20191213215429.24498-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 1/7] drm-uapi: Import SVM UAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com, jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Niranjana <nvishwa1@nvishwa1-DESK1.sc.intel.com>

Import Shared Virtual Memory (SVM) user API. It includes SVM capability
defintion and the bind and prefetch ioctl defintions.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 include/drm-uapi/i915_drm.h | 74 +++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 9b72e821..de51c7e4 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -361,6 +361,10 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_GEM_VM_CREATE		0x3a
 #define DRM_I915_GEM_VM_DESTROY		0x3b
 #define DRM_I915_GEM_OBJECT_SETPARAM	DRM_I915_GEM_CONTEXT_SETPARAM
+#define DRM_I915_GEM_VM_GETPARAM        DRM_I915_GEM_CONTEXT_GETPARAM
+#define DRM_I915_GEM_VM_SETPARAM        DRM_I915_GEM_CONTEXT_SETPARAM
+#define DRM_I915_GEM_VM_BIND		0x3c
+#define DRM_I915_GEM_VM_PREFETCH	0x3d
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -425,6 +429,10 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_OBJECT_SETPARAM	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_OBJECT_SETPARAM, struct drm_i915_gem_object_param)
+#define DRM_IOCTL_I915_GEM_VM_GETPARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_GETPARAM, struct drm_i915_gem_vm_param)
+#define DRM_IOCTL_I915_GEM_VM_SETPARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_SETPARAM, struct drm_i915_gem_vm_param)
+#define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_PREFETCH		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_PREFETCH, struct drm_i915_gem_vm_prefetch)
 
 /* Allow drivers to submit batchbuffers directly to hardware, relying
  * on the security mechanisms provided by hardware.
@@ -622,6 +630,9 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_PERF_REVISION	54
 
+/* Shared Virtual Memory (SVM) support capability */
+#define I915_PARAM_HAS_SVM		55
+
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -1848,6 +1859,17 @@ struct drm_i915_gem_vm_control {
 	__u32 vm_id;
 };
 
+struct drm_i915_gem_vm_param {
+	__u32 vm_id;
+	__u32 rsvd;
+
+#define I915_VM_PARAM     (2ull << 32)
+#define I915_GEM_VM_PARAM_SVM   0x1
+	__u64 param;
+
+	__u64 value;
+};
+
 struct drm_i915_reg_read {
 	/*
 	 * Register offset.
@@ -2399,6 +2421,58 @@ struct drm_i915_query_memory_region_info {
 	struct drm_i915_memory_region_info regions[];
 };
 
+/**
+ * struct drm_i915_gem_vm_bind
+ *
+ * Bind an object/buffer in a vm's page table.
+ */
+struct drm_i915_gem_vm_bind {
+	/** VA start to bind **/
+	__u64 start;
+
+	/**
+	 * VA length to [un]bind
+	 * length only required while binding buffers.
+	 */
+	__u64 length;
+
+	/** Type of memory to [un]bind **/
+	__u32 type;
+#define I915_GEM_VM_BIND_SVM_OBJ      0
+#define I915_GEM_VM_BIND_SVM_BUFFER   1
+
+	/** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type **/
+	__u32 handle;
+
+	/** vm to [un]bind **/
+	__u32 vm_id;
+
+	/** Flags **/
+	__u32 flags;
+#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
+#define I915_GEM_VM_BIND_READONLY    (1 << 1)
+};
+
+/**
+ * struct drm_i915_gem_vm_prefetch
+ *
+ * Prefetch an address range to a memory region.
+ */
+struct drm_i915_gem_vm_prefetch {
+	/** Type of memory to prefetch **/
+	__u32 type;
+#define I915_GEM_VM_PREFETCH_SVM_BUFFER   0
+
+	/** Memory region to prefetch to **/
+	__u32 region;
+
+	/** VA start to prefetch **/
+	__u64 start;
+
+	/** VA length to prefetch **/
+	__u64 length;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
