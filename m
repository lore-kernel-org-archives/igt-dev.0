Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C246E884
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 19:10:19 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Mon,  8 Nov 2021 11:04:56 -0800
Message-Id: <20211108190457.32198-2-matthew.brost@intel.com>
In-Reply-To: <20211108190457.32198-1-matthew.brost@intel.com>
References: <20211108190457.32198-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] i915_drm.h sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Also delete PXP defines / structures from i915_drm_local.h.

Taken from 806acd381960 ("Merge tag 'amd-drm-fixes-5.16-2021-11-03' of https://gitlab.freedesktop.org/agd5f/linux into drm-next")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/i915_drm.h | 242 +++++++++++++++++++++++++++++++++++-
 lib/i915/i915_drm_local.h   |  13 --
 2 files changed, 241 insertions(+), 14 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index c788a1ab4..9c9e1afa6 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -1522,6 +1522,12 @@ struct drm_i915_gem_caching {
 #define I915_TILING_NONE	0
 #define I915_TILING_X		1
 #define I915_TILING_Y		2
+/*
+ * Do not add new tiling types here.  The I915_TILING_* values are for
+ * de-tiling fence registers that no longer exist on modern platforms.  Although
+ * the hardware may support new types of tiling in general (e.g., Tile4), we
+ * do not need to add them to the uapi that is specific to now-defunct ioctls.
+ */
 #define I915_TILING_LAST	I915_TILING_Y
 
 #define I915_BIT_6_SWIZZLE_NONE		0
@@ -1824,6 +1830,7 @@ struct drm_i915_gem_context_param {
  * Extensions:
  *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
  *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
+ *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
  */
 #define I915_CONTEXT_PARAM_ENGINES	0xa
 
@@ -1846,6 +1853,55 @@ struct drm_i915_gem_context_param {
  * attempted to use it, never re-use this context param number.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
+
+/*
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+ *
+ * Mark that the context makes use of protected content, which will result
+ * in the context being invalidated when the protected content session is.
+ * Given that the protected content session is killed on suspend, the device
+ * is kept awake for the lifetime of a protected context, so the user should
+ * make sure to dispose of them once done.
+ * This flag can only be set at context creation time and, when set to true,
+ * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
+ * to false. This flag can't be set to true in conjunction with setting the
+ * I915_CONTEXT_PARAM_BANNABLE flag to false. Creation example:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_i915_gem_context_create_ext_setparam p_protected = {
+ *		.base = {
+ *			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+ *		},
+ *		.param = {
+ *			.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
+ *			.value = 1,
+ *		}
+ *	};
+ *	struct drm_i915_gem_context_create_ext_setparam p_norecover = {
+ *		.base = {
+ *			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+ *			.next_extension = to_user_pointer(&p_protected),
+ *		},
+ *		.param = {
+ *			.param = I915_CONTEXT_PARAM_RECOVERABLE,
+ *			.value = 0,
+ *		}
+ *	};
+ *	struct drm_i915_gem_context_create_ext create = {
+ *		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
+ *		.extensions = to_user_pointer(&p_norecover);
+ *	};
+ *
+ *	ctx_id = gem_context_create_ext(drm_fd, &create);
+ *
+ * In addition to the normal failure cases, setting this flag during context
+ * creation can result in the following errors:
+ *
+ * -ENODEV: feature not available
+ * -EPERM: trying to mark a recoverable or not bannable context as protected
+ */
+#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
@@ -2049,6 +2105,135 @@ struct i915_context_engines_bond {
 	struct i915_engine_class_instance engines[N__]; \
 } __attribute__((packed)) name__
 
+/**
+ * struct i915_context_engines_parallel_submit - Configure engine for
+ * parallel submission.
+ *
+ * Setup a slot in the context engine map to allow multiple BBs to be submitted
+ * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
+ * in parallel. Multiple hardware contexts are created internally in the i915 to
+ * run these BBs. Once a slot is configured for N BBs only N BBs can be
+ * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
+ * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
+ * many BBs there are based on the slot's configuration. The N BBs are the last
+ * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
+ *
+ * The default placement behavior is to create implicit bonds between each
+ * context if each context maps to more than 1 physical engine (e.g. context is
+ * a virtual engine). Also we only allow contexts of same engine class and these
+ * contexts must be in logically contiguous order. Examples of the placement
+ * behavior are described below. Lastly, the default is to not allow BBs to be
+ * preempted mid-batch. Rather insert coordinated preemption points on all
+ * hardware contexts between each set of BBs. Flags could be added in the future
+ * to change both of these default behaviors.
+ *
+ * Returns -EINVAL if hardware context placement configuration is invalid or if
+ * the placement configuration isn't supported on the platform / submission
+ * interface.
+ * Returns -ENODEV if extension isn't supported on the platform / submission
+ * interface.
+ *
+ * .. code-block:: none
+ *
+ *	Examples syntax:
+ *	CS[X] = generic engine of same class, logical instance X
+ *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
+ *
+ *	Example 1 pseudo code:
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=1,
+ *		     engines=CS[0],CS[1])
+ *
+ *	Results in the following valid placement:
+ *	CS[0], CS[1]
+ *
+ *	Example 2 pseudo code:
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=2,
+ *		     engines=CS[0],CS[2],CS[1],CS[3])
+ *
+ *	Results in the following valid placements:
+ *	CS[0], CS[1]
+ *	CS[2], CS[3]
+ *
+ *	This can be thought of as two virtual engines, each containing two
+ *	engines thereby making a 2D array. However, there are bonds tying the
+ *	entries together and placing restrictions on how they can be scheduled.
+ *	Specifically, the scheduler can choose only vertical columns from the 2D
+ *	array. That is, CS[0] is bonded to CS[1] and CS[2] to CS[3]. So if the
+ *	scheduler wants to submit to CS[0], it must also choose CS[1] and vice
+ *	versa. Same for CS[2] requires also using CS[3].
+ *	VE[0] = CS[0], CS[2]
+ *	VE[1] = CS[1], CS[3]
+ *
+ *	Example 3 pseudo code:
+ *	set_engines(INVALID)
+ *	set_parallel(engine_index=0, width=2, num_siblings=2,
+ *		     engines=CS[0],CS[1],CS[1],CS[3])
+ *
+ *	Results in the following valid and invalid placements:
+ *	CS[0], CS[1]
+ *	CS[1], CS[3] - Not logically contiguous, return -EINVAL
+ */
+struct i915_context_engines_parallel_submit {
+	/**
+	 * @base: base user extension.
+	 */
+	struct i915_user_extension base;
+
+	/**
+	 * @engine_index: slot for parallel engine
+	 */
+	__u16 engine_index;
+
+	/**
+	 * @width: number of contexts per parallel engine or in other words the
+	 * number of batches in each submission
+	 */
+	__u16 width;
+
+	/**
+	 * @num_siblings: number of siblings per context or in other words the
+	 * number of possible placements for each submission
+	 */
+	__u16 num_siblings;
+
+	/**
+	 * @mbz16: reserved for future use; must be zero
+	 */
+	__u16 mbz16;
+
+	/**
+	 * @flags: all undefined flags must be zero, currently not defined flags
+	 */
+	__u64 flags;
+
+	/**
+	 * @mbz64: reserved for future use; must be zero
+	 */
+	__u64 mbz64[3];
+
+	/**
+	 * @engines: 2-d array of engine instances to configure parallel engine
+	 *
+	 * length = width (i) * num_siblings (j)
+	 * index = j + i * num_siblings
+	 */
+	struct i915_engine_class_instance engines[0];
+
+} __attribute__((packed));
+
+#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struct { \
+	struct i915_user_extension base; \
+	__u16 engine_index; \
+	__u16 width; \
+	__u16 num_siblings; \
+	__u16 mbz16; \
+	__u64 flags; \
+	__u64 mbz64[3]; \
+	struct i915_engine_class_instance engines[N__]; \
+} __attribute__((packed)) name__
+
 /**
  * DOC: Context Engine Map uAPI
  *
@@ -2108,6 +2293,7 @@ struct i915_context_param_engines {
 	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
 #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
+#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
 	struct i915_engine_class_instance engines[0];
 } __attribute__((packed));
 
@@ -2726,14 +2912,20 @@ struct drm_i915_engine_info {
 
 	/** @flags: Engine flags. */
 	__u64 flags;
+#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
 
 	/** @capabilities: Capabilities of this engine. */
 	__u64 capabilities;
 #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
 #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
 
+	/** @logical_instance: Logical instance of engine */
+	__u16 logical_instance;
+
 	/** @rsvd1: Reserved fields. */
-	__u64 rsvd1[4];
+	__u16 rsvd1[3];
+	/** @rsvd2: Reserved fields. */
+	__u64 rsvd2[3];
 };
 
 /**
@@ -2979,8 +3171,12 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
 	 * struct drm_i915_gem_create_ext_memory_regions.
+	 *
+	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
+	 * struct drm_i915_gem_create_ext_protected_content.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
+#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
 	__u64 extensions;
 };
 
@@ -3038,6 +3234,50 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_protected_content - The
+ * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
+ *
+ * If this extension is provided, buffer contents are expected to be protected
+ * by PXP encryption and require decryption for scan out and processing. This
+ * is only possible on platforms that have PXP enabled, on all other scenarios
+ * using this extension will cause the ioctl to fail and return -ENODEV. The
+ * flags parameter is reserved for future expansion and must currently be set
+ * to zero.
+ *
+ * The buffer contents are considered invalid after a PXP session teardown.
+ *
+ * The encryption is guaranteed to be processed correctly only if the object
+ * is submitted with a context created using the
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
+ * at submission time on the validity of the objects involved.
+ *
+ * Below is an example on how to create a protected object:
+ *
+ * .. code-block:: C
+ *
+ *      struct drm_i915_gem_create_ext_protected_content protected_ext = {
+ *              .base = { .name = I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
+ *              .flags = 0,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext = {
+ *              .size = PAGE_SIZE,
+ *              .extensions = (uintptr_t)&protected_ext,
+ *      };
+ *
+ *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ */
+struct drm_i915_gem_create_ext_protected_content {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+	/** @flags: reserved for future usage, currently MBZ */
+	__u32 flags;
+};
+
+/* ID of the protected content session managed by i915 when PXP is active */
+#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 74b85c853..9e82c9688 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -21,19 +21,6 @@ extern "C" {
  */
 #define I915_ENGINE_CLASS_COMPUTE 4
 
-/* Needed for PXP */
-#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT  1
-#define I915_CONTEXT_PARAM_PROTECTED_CONTENT   0xd
-#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
-
-/* Needed for PXP */
-struct drm_i915_gem_create_ext_protected_content {
-	/** @base: Extension link. See struct i915_user_extension. */
-	struct i915_user_extension base;
-	/** @flags: reserved for future usage, currently MBZ */
-	__u32 flags;
-};
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.32.0
