Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF18710E717
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:19:06 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:19:02 -0700
Message-ID: <20230922211902.2506191-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] include/drm-uapi: Update to latest
 i915_drm.h from drm-next
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

Update to the latest version of the drm uapi header file from
drm-next (https://anongit.freedesktop.org/git/drm/drm):

	commit f107ff76a8c242b298413ef52db9978dc3fe0153
	Merge: ce9ecca0238b1 15d30b46573d7
	Author: Dave Airlie <airlied@redhat.com>
	Date:   Fri Sep 22 16:28:29 2023 +1000

	Merge tag 'drm-misc-next-2023-09-11-1' of
	git://anongit.freedesktop.org/drm/drm-misc into drm-next

	drm-misc-next for v6.7-rc1:

Also remove duplicated declarations from lib/i915/i915_drm_local.h

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/i915_drm.h | 377 ++++++++++++++++++++++++++++--------
 lib/i915/i915_drm_local.h   |  55 ------
 2 files changed, 301 insertions(+), 131 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee41323..0a5c81445528 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -280,7 +280,16 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_ENGINE_SEMA(class, instance) \
 	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_SEMA)
 
-#define __I915_PMU_OTHER(x) (__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x))
+/*
+ * Top 4 bits of every non-engine counter are GT id.
+ */
+#define __I915_PMU_GT_SHIFT (60)
+
+#define ___I915_PMU_OTHER(gt, x) \
+	(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
+	((__u64)(gt) << __I915_PMU_GT_SHIFT))
+
+#define __I915_PMU_OTHER(x) ___I915_PMU_OTHER(0, x)
 
 #define I915_PMU_ACTUAL_FREQUENCY	__I915_PMU_OTHER(0)
 #define I915_PMU_REQUESTED_FREQUENCY	__I915_PMU_OTHER(1)
@@ -290,6 +299,12 @@ enum drm_i915_pmu_engine_sample {
 
 #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
 
+#define __I915_PMU_ACTUAL_FREQUENCY(gt)		___I915_PMU_OTHER(gt, 0)
+#define __I915_PMU_REQUESTED_FREQUENCY(gt)	___I915_PMU_OTHER(gt, 1)
+#define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
+#define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
+#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
+
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
 #define I915_NR_TEX_REGIONS 255	/* table size 2k - maximum due to use
@@ -645,6 +660,23 @@ typedef struct drm_i915_irq_wait {
  */
 #define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
+/*
+ * Query the status of HuC load.
+ *
+ * The query can fail in the following scenarios with the listed error codes:
+ *  -ENODEV if HuC is not present on this platform,
+ *  -EOPNOTSUPP if HuC firmware usage is disabled,
+ *  -ENOPKG if HuC firmware fetch failed,
+ *  -ENOEXEC if HuC firmware is invalid or mismatched,
+ *  -ENOMEM if i915 failed to prepare the FW objects for transfer to the uC,
+ *  -EIO if the FW transfer or the FW authentication failed.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one of the
+ * following values:
+ *  * 0 if HuC firmware load is not complete,
+ *  * 1 if HuC firmware is loaded and fully authenticated,
+ *  * 2 if HuC firmware is loaded and authenticated for clear media only
+ */
 #define I915_PARAM_HUC_STATUS		 42
 
 /* Query whether DRM_I915_GEM_EXECBUFFER2 supports the ability to opt-out of
@@ -755,16 +787,48 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
 
+/*
+ * Query the status of PXP support in i915.
+ *
+ * The query can fail in the following scenarios with the listed error codes:
+ *     -ENODEV = PXP support is not available on the GPU device or in the
+ *               kernel due to missing component drivers or kernel configs.
+ *
+ * If the IOCTL is successful, the returned parameter will be set to one of
+ * the following values:
+ *     1 = PXP feature is supported and is ready for use.
+ *     2 = PXP feature is supported but should be ready soon (pending
+ *         initialization of non-i915 system dependencies).
+ *
+ * NOTE: When param is supported (positive return values), user space should
+ *       still refer to the GEM PXP context-creation UAPI header specs to be
+ *       aware of possible failure due to system state machine at the time.
+ */
+#define I915_PARAM_PXP_STATUS		 58
+
 /* Must be kept compact -- no holes and well documented */
 
-typedef struct drm_i915_getparam {
+/**
+ * struct drm_i915_getparam - Driver parameter query structure.
+ */
+struct drm_i915_getparam {
+	/** @param: Driver parameter to query. */
 	__s32 param;
-	/*
+
+	/**
+	 * @value: Address of memory where queried value should be put.
+	 *
 	 * WARNING: Using pointers instead of fixed-size u64 means we need to write
 	 * compat32 code. Don't repeat this mistake.
 	 */
 	int *value;
-} drm_i915_getparam_t;
+};
+
+/**
+ * typedef drm_i915_getparam_t - Driver parameter query structure.
+ * See struct drm_i915_getparam.
+ */
+typedef struct drm_i915_getparam drm_i915_getparam_t;
 
 /* Ioctl to set kernel params:
  */
@@ -1245,76 +1309,119 @@ struct drm_i915_gem_exec_object2 {
 	__u64 rsvd2;
 };
 
+/**
+ * struct drm_i915_gem_exec_fence - An input or output fence for the execbuf
+ * ioctl.
+ *
+ * The request will wait for input fence to signal before submission.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * request.
+ */
 struct drm_i915_gem_exec_fence {
-	/**
-	 * User's handle for a drm_syncobj to wait on or signal.
-	 */
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
 	__u32 handle;
 
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_EXEC_FENCE_WAIT:
+	 * Wait for the input fence before request submission.
+	 *
+	 * I915_EXEC_FENCE_SIGNAL:
+	 * Return request completion fence as output
+	 */
+	__u32 flags;
 #define I915_EXEC_FENCE_WAIT            (1<<0)
 #define I915_EXEC_FENCE_SIGNAL          (1<<1)
 #define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
-	__u32 flags;
 };
 
-/*
- * See drm_i915_gem_execbuffer_ext_timeline_fences.
- */
-#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
-
-/*
+/**
+ * struct drm_i915_gem_execbuffer_ext_timeline_fences - Timeline fences
+ * for execbuf ioctl.
+ *
  * This structure describes an array of drm_syncobj and associated points for
  * timeline variants of drm_syncobj. It is invalid to append this structure to
  * the execbuf if I915_EXEC_FENCE_ARRAY is set.
  */
 struct drm_i915_gem_execbuffer_ext_timeline_fences {
+#define DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES 0
+	/** @base: Extension link. See struct i915_user_extension. */
 	struct i915_user_extension base;
 
 	/**
-	 * Number of element in the handles_ptr & value_ptr arrays.
+	 * @fence_count: Number of elements in the @handles_ptr & @value_ptr
+	 * arrays.
 	 */
 	__u64 fence_count;
 
 	/**
-	 * Pointer to an array of struct drm_i915_gem_exec_fence of length
-	 * fence_count.
+	 * @handles_ptr: Pointer to an array of struct drm_i915_gem_exec_fence
+	 * of length @fence_count.
 	 */
 	__u64 handles_ptr;
 
 	/**
-	 * Pointer to an array of u64 values of length fence_count. Values
-	 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
-	 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
+	 * @values_ptr: Pointer to an array of u64 values of length
+	 * @fence_count.
+	 * Values must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
 	 */
 	__u64 values_ptr;
 };
 
+/**
+ * struct drm_i915_gem_execbuffer2 - Structure for DRM_I915_GEM_EXECBUFFER2
+ * ioctl.
+ */
 struct drm_i915_gem_execbuffer2 {
-	/**
-	 * List of gem_exec_object2 structs
-	 */
+	/** @buffers_ptr: Pointer to a list of gem_exec_object2 structs */
 	__u64 buffers_ptr;
+
+	/** @buffer_count: Number of elements in @buffers_ptr array */
 	__u32 buffer_count;
 
-	/** Offset in the batchbuffer to start execution from. */
+	/**
+	 * @batch_start_offset: Offset in the batchbuffer to start execution
+	 * from.
+	 */
 	__u32 batch_start_offset;
-	/** Bytes used in batchbuffer from batch_start_offset */
+
+	/**
+	 * @batch_len: Length in bytes of the batch buffer, starting from the
+	 * @batch_start_offset. If 0, length is assumed to be the batch buffer
+	 * object size.
+	 */
 	__u32 batch_len;
+
+	/** @DR1: deprecated */
 	__u32 DR1;
+
+	/** @DR4: deprecated */
 	__u32 DR4;
+
+	/** @num_cliprects: See @cliprects_ptr */
 	__u32 num_cliprects;
+
 	/**
-	 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
-	 * & I915_EXEC_USE_EXTENSIONS are not set.
+	 * @cliprects_ptr: Kernel clipping was a DRI1 misfeature.
+	 *
+	 * It is invalid to use this field if I915_EXEC_FENCE_ARRAY or
+	 * I915_EXEC_USE_EXTENSIONS flags are not set.
 	 *
 	 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
-	 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
-	 * of the array.
+	 * of &drm_i915_gem_exec_fence and @num_cliprects is the length of the
+	 * array.
 	 *
 	 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
-	 * single struct i915_user_extension and num_cliprects is 0.
+	 * single &i915_user_extension and num_cliprects is 0.
 	 */
 	__u64 cliprects_ptr;
+
+	/** @flags: Execbuf flags */
+	__u64 flags;
 #define I915_EXEC_RING_MASK              (0x3f)
 #define I915_EXEC_DEFAULT                (0<<0)
 #define I915_EXEC_RENDER                 (1<<0)
@@ -1332,10 +1439,6 @@ struct drm_i915_gem_execbuffer2 {
 #define I915_EXEC_CONSTANTS_REL_GENERAL (0<<6) /* default */
 #define I915_EXEC_CONSTANTS_ABSOLUTE 	(1<<6)
 #define I915_EXEC_CONSTANTS_REL_SURFACE (2<<6) /* gen4/5 only */
-	__u64 flags;
-	__u64 rsvd1; /* now used for context info */
-	__u64 rsvd2;
-};
 
 /** Resets the SO write offset registers for transform feedback on gen7. */
 #define I915_EXEC_GEN7_SOL_RESET	(1<<8)
@@ -1438,9 +1541,23 @@ struct drm_i915_gem_execbuffer2 {
  * drm_i915_gem_execbuffer_ext enum.
  */
 #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
-
 #define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
 
+	/** @rsvd1: Context id */
+	__u64 rsvd1;
+
+	/**
+	 * @rsvd2: in and out sync_file file descriptors.
+	 *
+	 * When I915_EXEC_FENCE_IN or I915_EXEC_FENCE_SUBMIT flag is set, the
+	 * lower 32 bits of this field will have the in sync_file fd (input).
+	 *
+	 * When I915_EXEC_FENCE_OUT flag is set, the upper 32 bits of this
+	 * field will have the out sync_file fd (output).
+	 */
+	__u64 rsvd2;
+};
+
 #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
 #define i915_execbuffer2_set_context_id(eb2, context) \
 	(eb2).rsvd1 = context & I915_EXEC_CONTEXT_ID_MASK
@@ -1820,19 +1937,58 @@ struct drm_i915_gem_context_create {
 	__u32 pad;
 };
 
+/**
+ * struct drm_i915_gem_context_create_ext - Structure for creating contexts.
+ */
 struct drm_i915_gem_context_create_ext {
-	__u32 ctx_id; /* output: id of new context*/
+	/** @ctx_id: Id of the created context (output) */
+	__u32 ctx_id;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS:
+	 *
+	 * Extensions may be appended to this structure and driver must check
+	 * for those. See @extensions.
+	 *
+	 * I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE
+	 *
+	 * Created context will have single timeline.
+	 */
 	__u32 flags;
 #define I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS	(1u << 0)
 #define I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE	(1u << 1)
 #define I915_CONTEXT_CREATE_FLAGS_UNKNOWN \
 	(-(I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE << 1))
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * I915_CONTEXT_CREATE_EXT_SETPARAM:
+	 * Context parameter to set or query during context creation.
+	 * See struct drm_i915_gem_context_create_ext_setparam.
+	 *
+	 * I915_CONTEXT_CREATE_EXT_CLONE:
+	 * This extension has been removed. On the off chance someone somewhere
+	 * has attempted to use it, never re-use this extension number.
+	 */
 	__u64 extensions;
+#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
+#define I915_CONTEXT_CREATE_EXT_CLONE 1
 };
 
+/**
+ * struct drm_i915_gem_context_param - Context parameter to set or query.
+ */
 struct drm_i915_gem_context_param {
+	/** @ctx_id: Context id */
 	__u32 ctx_id;
+
+	/** @size: Size of the parameter @value */
 	__u32 size;
+
+	/** @param: Parameter to set or query */
 	__u64 param;
 #define I915_CONTEXT_PARAM_BAN_PERIOD	0x1
 /* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
@@ -1975,10 +2131,26 @@ struct drm_i915_gem_context_param {
  *
  * -ENODEV: feature not available
  * -EPERM: trying to mark a recoverable or not bannable context as protected
+ * -ENXIO: A dependency such as a component driver or firmware is not yet
+ *         loaded so user space may need to attempt again. Depending on the
+ *         device, this error may be reported if protected context creation is
+ *         attempted very early after kernel start because the internal timeout
+ *         waiting for such dependencies is not guaranteed to be larger than
+ *         required (numbers differ depending on system and kernel config):
+ *            - ADL/RPL: dependencies may take up to 3 seconds from kernel start
+ *                       while context creation internal timeout is 250 milisecs
+ *            - MTL: dependencies may take up to 8 seconds from kernel start
+ *                   while context creation internal timeout is 250 milisecs
+ *         NOTE: such dependencies happen once, so a subsequent call to create a
+ *         protected context after a prior successful call will not experience
+ *         such timeouts and will not return -ENXIO (unless the driver is reloaded,
+ *         or, depending on the device, resumes from a suspended state).
+ * -EIO: The firmware did not succeed in creating the protected context.
  */
 #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
+	/** @value: Context parameter value to be set or queried */
 	__u64 value;
 };
 
@@ -2129,7 +2301,7 @@ struct i915_context_engines_load_balance {
 
 	__u64 mbz64; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(name__, N__) struct { \
@@ -2167,7 +2339,7 @@ struct i915_context_engines_bond {
 	__u64 flags; /* all undefined flags must be zero */
 	__u64 mbz64[4]; /* reserved for future use; must be zero */
 
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_ENGINES_BOND(name__, N__) struct { \
@@ -2294,7 +2466,7 @@ struct i915_context_engines_parallel_submit {
 	 * length = width (i) * num_siblings (j)
 	 * index = j + i * num_siblings
 	 */
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 
 } __attribute__((packed));
 
@@ -2369,7 +2541,7 @@ struct i915_context_param_engines {
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
 #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
 #define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
-	struct i915_engine_class_instance engines[0];
+	struct i915_engine_class_instance engines[];
 } __attribute__((packed));
 
 #define I915_DEFINE_CONTEXT_PARAM_ENGINES(name__, N__) struct { \
@@ -2377,23 +2549,29 @@ struct i915_context_param_engines {
 	struct i915_engine_class_instance engines[N__]; \
 } __attribute__((packed)) name__
 
+/**
+ * struct drm_i915_gem_context_create_ext_setparam - Context parameter
+ * to set or query during context creation.
+ */
 struct drm_i915_gem_context_create_ext_setparam {
-#define I915_CONTEXT_CREATE_EXT_SETPARAM 0
+	/** @base: Extension link. See struct i915_user_extension. */
 	struct i915_user_extension base;
+
+	/**
+	 * @param: Context parameter to set or query.
+	 * See struct drm_i915_gem_context_param.
+	 */
 	struct drm_i915_gem_context_param param;
 };
 
-/* This API has been removed.  On the off chance someone somewhere has
- * attempted to use it, never re-use this extension number.
- */
-#define I915_CONTEXT_CREATE_EXT_CLONE 1
-
 struct drm_i915_gem_context_destroy {
 	__u32 ctx_id;
 	__u32 pad;
 };
 
-/*
+/**
+ * struct drm_i915_gem_vm_control - Structure to create or destroy VM.
+ *
  * DRM_I915_GEM_VM_CREATE -
  *
  * Create a new virtual memory address space (ppGTT) for use within a context
@@ -2403,20 +2581,23 @@ struct drm_i915_gem_context_destroy {
  * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
  * returned in the outparam @id.
  *
- * No flags are defined, with all bits reserved and must be zero.
- *
  * An extension chain maybe provided, starting with @extensions, and terminated
  * by the @next_extension being 0. Currently, no extensions are defined.
  *
  * DRM_I915_GEM_VM_DESTROY -
  *
- * Destroys a previously created VM id, specified in @id.
+ * Destroys a previously created VM id, specified in @vm_id.
  *
  * No extensions or flags are allowed currently, and so must be zero.
  */
 struct drm_i915_gem_vm_control {
+	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
+
+	/** @flags: reserved for future usage, currently MBZ */
 	__u32 flags;
+
+	/** @vm_id: Id of the VM created or to be destroyed */
 	__u32 vm_id;
 };
 
@@ -2631,6 +2812,25 @@ enum drm_i915_perf_property_id {
 	 */
 	DRM_I915_PERF_PROP_POLL_OA_PERIOD,
 
+	/**
+	 * Multiple engines may be mapped to the same OA unit. The OA unit is
+	 * identified by class:instance of any engine mapped to it.
+	 *
+	 * This parameter specifies the engine class and must be passed along
+	 * with DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE.
+	 *
+	 * This property is available in perf revision 6.
+	 */
+	DRM_I915_PERF_PROP_OA_ENGINE_CLASS,
+
+	/**
+	 * This parameter specifies the engine instance and must be passed along
+	 * with DRM_I915_PERF_PROP_OA_ENGINE_CLASS.
+	 *
+	 * This property is available in perf revision 6.
+	 */
+	DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE,
+
 	DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
 
@@ -3392,27 +3592,13 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * The (page-aligned) allocated size for the object will be returned.
 	 *
-	 * DG2 64K min page size implications:
-	 *
-	 * On discrete platforms, starting from DG2, we have to contend with GTT
-	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
-	 * objects.  Specifically the hardware only supports 64K or larger GTT
-	 * page sizes for such memory. The kernel will already ensure that all
-	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
-	 * sizes underneath.
-	 *
-	 * Note that the returned size here will always reflect any required
-	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
-	 * such as DG2. The kernel will always select the largest minimum
-	 * page-size for the set of possible placements as the value to use when
-	 * rounding up the @size.
-	 *
-	 * Special DG2 GTT address alignment requirement:
+	 * On platforms like DG2/ATS the kernel will always use 64K or larger
+	 * pages for I915_MEMORY_CLASS_DEVICE. The kernel also requires a
+	 * minimum of 64K GTT alignment for such objects.
 	 *
-	 * The GTT alignment will also need to be at least 2M for such objects.
-	 *
-	 * Note that due to how the hardware implements 64K GTT page support, we
-	 * have some further complications:
+	 * NOTE: Previously the ABI here required a minimum GTT alignment of 2M
+	 * on DG2/ATS, due to how the hardware implemented 64K GTT page support,
+	 * where we had the following complications:
 	 *
 	 *   1) The entire PDE (which covers a 2MB virtual address range), must
 	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
@@ -3421,12 +3607,10 @@ struct drm_i915_gem_create_ext {
 	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
 	 *   objects.
 	 *
-	 * To keep things simple for userland, we mandate that any GTT mappings
-	 * must be aligned to and rounded up to 2MB. The kernel will internally
-	 * pad them out to the next 2MB boundary. As this only wastes virtual
-	 * address space and avoids userland having to copy any needlessly
-	 * complicated PDE sharing scheme (coloring) and only affects DG2, this
-	 * is deemed to be a good compromise.
+	 * However on actual production HW this was completely changed to now
+	 * allow setting a TLB hint at the PTE level (see PS64), which is a lot
+	 * more flexible than the above. With this the 2M restriction was
+	 * dropped where we now only require 64K.
 	 */
 	__u64 size;
 
@@ -3496,9 +3680,13 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
 	 * struct drm_i915_gem_create_ext_protected_content.
+	 *
+	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
+	 * struct drm_i915_gem_create_ext_set_pat.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
 #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
+#define I915_GEM_CREATE_EXT_SET_PAT 2
 	__u64 extensions;
 };
 
@@ -3613,6 +3801,43 @@ struct drm_i915_gem_create_ext_protected_content {
 	__u32 flags;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_set_pat - The
+ * I915_GEM_CREATE_EXT_SET_PAT extension.
+ *
+ * If this extension is provided, the specified caching policy (PAT index) is
+ * applied to the buffer object.
+ *
+ * Below is an example on how to create an object with specific caching policy:
+ *
+ * .. code-block:: C
+ *
+ *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
+ *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
+ *              .pat_index = 0,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext = {
+ *              .size = PAGE_SIZE,
+ *              .extensions = (uintptr_t)&set_pat_ext,
+ *      };
+ *
+ *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ */
+struct drm_i915_gem_create_ext_set_pat {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+	/**
+	 * @pat_index: PAT index to be set
+	 * PAT index is a bit field in Page Table Entry to control caching
+	 * behaviors for GPU accesses. The definition of PAT index is
+	 * platform dependent and can be found in hardware specifications,
+	 */
+	__u32 pat_index;
+	/** @rsvd: reserved for future use */
+	__u32 rsvd;
+};
+
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 0f47578c636d..dd646aedf497 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -19,61 +19,6 @@ extern "C" {
  * or local_ prefix and without any #ifndef's. Attempt should be made to
  * clean these up when kernel uapi headers are sync'd.
  */
-#define I915_ENGINE_CLASS_COMPUTE 4
-
-#define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
-
-#define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
-#define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
-
-/*
- * Top 4 bits of every non-engine counter are GT id.
- */
-#define __I915_PMU_GT_SHIFT (60)
-
-#define ___I915_PMU_OTHER(gt, x) \
-	(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
-	((__u64)(gt) << __I915_PMU_GT_SHIFT))
-
-#define __I915_PMU_ACTUAL_FREQUENCY(gt)		___I915_PMU_OTHER(gt, 0)
-#define __I915_PMU_REQUESTED_FREQUENCY(gt)	___I915_PMU_OTHER(gt, 1)
-#define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
-#define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
-#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
-
-#define I915_GEM_CREATE_EXT_SET_PAT 2
-
-/**
- * struct drm_i915_gem_create_ext_set_pat - The
- * I915_GEM_CREATE_EXT_SET_PAT extension.
- *
- * If this extension is provided, the specified caching policy (PAT index) is
- * applied to the buffer object.
- *
- * Below is an example on how to create an object with specific caching policy:
- *
- * .. code-block:: C
- *
- *	struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
- *		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
- *		.pat_index = 0,
- *	};
- *	struct drm_i915_gem_create_ext create_ext = {
- *		.size = PAGE_SIZE,
- *		.extensions = (uintptr_t)&set_pat_ext,
- *	};
- *
- *	int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
- *	if (err) ...
- */
-struct drm_i915_gem_create_ext_set_pat {
-	/** @base: Extension link. See struct i915_user_extension. */
-	struct i915_user_extension base;
-	/** @pat_index: PAT index to be set */
-	__u32 pat_index;
-	/** @rsvd: reserved for future use */
-	__u32 rsvd;
-};
 
 #if defined(__cplusplus)
 }
-- 
2.41.0
