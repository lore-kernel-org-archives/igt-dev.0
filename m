Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B11110E1EF
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Nov 2022 07:53:16 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Nov 2022 23:52:58 -0800
Message-Id: <20221113075309.32023-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
References: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 02/13] lib/vm_bind: import uapi
 definitions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Import required VM_BIND kernel uapi definitions.

DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
buffer objects (BOs) or sections of a BOs at specified GPU virtual
addresses on a specified address space (VM). Multiple mappings can map
to the same physical pages of an object (aliasing). These mappings (also
referred to as persistent mappings) will be persistent across multiple
GPU submissions (execbuf calls) issued by the UMD, without user having
to provide a list of all required mappings during each submission (as
required by older execbuf mode).

The new execbuf3 ioctl (I915_GEM_EXECBUFFER3) will only work in vm_bind
mode. The vm_bind mode only works with this new execbuf3 ioctl.

v2: Move vm_bind uapi definitions to i915_drm-local.h
    Define HAS_64K_PAGES()
    Pull in uapi updates
v3: Remove HAS_64K_PAGES()
v4: Import reserved field changes in vm_bind/unbind structures.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/i915_drm_local.h | 297 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 297 insertions(+)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 9a2273c4e..913caf980 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -23,6 +23,303 @@ extern "C" {
 
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
 
+/*
+ * Signal to the kernel that the object will need to be accessed via
+ * the CPU.
+ *
+ * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, and only
+ * strictly required on platforms where only some of the device memory
+ * is directly visible or mappable through the CPU, like on DG2+.
+ *
+ * One of the placements MUST also be I915_MEMORY_CLASS_SYSTEM, to
+ * ensure we can always spill the allocation to system memory, if we
+ * can't place the object in the mappable part of
+ * I915_MEMORY_CLASS_DEVICE.
+ *
+ * Without this hint, the kernel will assume that non-mappable
+ * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note that the
+ * kernel can still migrate the object to the mappable part, as a last
+ * resort, if userspace ever CPU faults this object, but this might be
+ * expensive, and so ideally should be avoided.
+ */
+#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
+
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
+#define DRM_I915_GEM_EXECBUFFER3	0x3f
+
+#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
+#define DRM_IOCTL_I915_GEM_EXECBUFFER3  DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
+
+/*
+ * VM_BIND feature version supported.
+ *
+ * The following versions of VM_BIND have been defined:
+ *
+ * 0: No VM_BIND support.
+ *
+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
+ *    previously with VM_BIND, the ioctl will not support unbinding multiple
+ *    mappings or splitting them. Similarly, VM_BIND calls will not replace
+ *    any existing mappings.
+ *
+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
+ */
+#define I915_PARAM_VM_BIND_VERSION	58
+
+#define DRM_I915_GEM_EXECBUFFER3_EXT_TIMELINE_FENCES 0
+
+/**
+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
+ *
+ * The operation will wait for input fence to signal.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * operation.
+ */
+struct drm_i915_gem_timeline_fence {
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
+	__u32 handle;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_TIMELINE_FENCE_WAIT:
+	 * Wait for the input fence before the operation.
+	 *
+	 * I915_TIMELINE_FENCE_SIGNAL:
+	 * Return operation completion fence as output.
+	 */
+	__u32 flags;
+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
+
+	/**
+	 * @value: A point in the timeline.
+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
+	 */
+	__u64 value;
+};
+
+/**
+ * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER3
+ * ioctl.
+ *
+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND mode
+ * only works with this ioctl for submission.
+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
+ */
+struct drm_i915_gem_execbuffer3 {
+	/**
+	 * @ctx_id: Context id
+	 *
+	 * Only contexts with user engine map are allowed.
+	 */
+	__u32 ctx_id;
+
+	/**
+	 * @engine_idx: Engine index
+	 *
+	 * An index in the user engine map of the context specified by @ctx_id.
+	 */
+	__u32 engine_idx;
+
+	/**
+	 * @batch_address: Batch gpu virtual address/es.
+	 *
+	 * For normal submission, it is the gpu virtual address of the batch
+	 * buffer. For parallel submission, it is a pointer to an array of
+	 * batch buffer gpu virtual addresses with array size equal to the
+	 * number of (parallel) engines involved in that submission (See
+	 * struct i915_context_engines_parallel_submit).
+	 */
+	__u64 batch_address;
+
+	/** @flags: Currently reserved, MBZ */
+	__u64 flags;
+#define __I915_EXEC3_UNKNOWN_FLAGS (~0ull)
+
+	/** @fence_count: Number of fences in @timeline_fences array. */
+	__u64 fence_count;
+
+	/**
+	 * @timeline_fences: Pointer to an array of timeline fences.
+	 *
+	 * Timeline fences are of format struct drm_i915_gem_timeline_fence.
+	 */
+	__u64 timeline_fences;
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
+/*
+ * If I915_VM_CREATE_FLAGS_USE_VM_BIND flag is set, VM created will work in
+ * VM_BIND mode
+ */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
+
+/*
+ * For I915_GEM_CREATE_EXT_VM_PRIVATE usage see
+ * struct drm_i915_gem_create_ext_vm_private.
+ */
+#define I915_GEM_CREATE_EXT_VM_PRIVATE 2
+
+/**
+ * struct drm_i915_gem_create_ext_vm_private - Extension to make the object
+ * private to the specified VM.
+ *
+ * See struct drm_i915_gem_create_ext.
+ *
+ * By default, BOs can be mapped on multiple VMs and can also be dma-buf
+ * exported. Hence these BOs are referred to as Shared BOs.
+ * During each execbuf3 submission, the request fence must be added to the
+ * dma-resv fence list of all shared BOs mapped on the VM.
+ *
+ * Unlike Shared BOs, these VM private BOs can only be mapped on the VM they
+ * are private to and can't be dma-buf exported. All private BOs of a VM share
+ * the dma-resv object. Hence during each execbuf3 submission, they need only
+ * one dma-resv fence list updated. Thus, the fast path (where required
+ * mappings are already bound) submission latency is O(1) w.r.t the number of
+ * VM private BOs.
+ */
+struct drm_i915_gem_create_ext_vm_private {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+
+	/** @vm_id: Id of the VM to which Object is private */
+	__u32 vm_id;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+};
+
+/**
+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
+ *
+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
+ * virtual address (VA) range to the section of an object that should be bound
+ * in the device page table of the specified address space (VM).
+ * The VA range specified must be unique (ie., not currently bound) and can
+ * be mapped to whole object or a section of the object (partial binding).
+ * Multiple VA mappings can be created to the same section of the object
+ * (aliasing).
+ *
+ * The @start, @offset and @length must be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start, @offset and @length must be 64K aligned.
+ *
+ * Error code -EINVAL will be returned if @start, @offset and @length are not
+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
+ * -ENOSPC will be returned if the VA range specified can't be reserved.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_BIND operation can be done
+ * asynchronously, if valid @fence is specified.
+ */
+struct drm_i915_gem_vm_bind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @handle: Object handle */
+	__u32 handle;
+
+	/** @start: Virtual Address start to bind */
+	__u64 start;
+
+	/** @offset: Offset in object to bind */
+	__u64 offset;
+
+	/** @length: Length of mapping to bind */
+	__u64 length;
+
+	/**
+	 * @flags: Currently reserved, MBZ.
+	 *
+	 * Note that @fence carries its own flags.
+	 */
+	__u64 flags;
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd[2];
+
+	/**
+	 * @fence: Timeline fence for bind completion signaling.
+	 *
+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 *
+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
+	 * is not requested and binding is completed synchronously.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). VM_UNBIND will force unbind the specified
+ * range from device page table without waiting for any GPU job to complete.
+ * It is UMDs responsibility to ensure the mapping is no longer in use before
+ * calling VM_UNBIND.
+ *
+ * If the specified mapping is not found, the ioctl will simply return without
+ * any error.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
+ * asynchronously.
+ */
+struct drm_i915_gem_vm_unbind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @pad: padding, MBZ */
+	__u32 pad;
+
+	/** @start: Virtual Address start to unbind */
+	__u64 start;
+
+	/** @length: Length of mapping to unbind */
+	__u64 length;
+
+	/** @flags: Currently reserved, MBZ. */
+	__u64 flags;
+
+	/** @rsvd: Reserved, MBZ */
+	__u64 rsvd[2];
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27
