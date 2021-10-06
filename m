Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDCE6EDB0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:11 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:38 -0400
Message-Id: <20211006161444.904476-3-rodrigo.vivi@intel.com>
In-Reply-To: <20211006161444.904476-1-rodrigo.vivi@intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/8] Revert "i915_drm.h sync"
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 4d5f8bcd2e35de368fcaa968c127111d9f450247.

That was my mistake during review and merge since I had
ignored the rules documented at README.md and considered
drm-intel branches would be enough. I'm sorry.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/i915_drm.h | 147 +-----------------------------------
 1 file changed, 1 insertion(+), 146 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 50c9308b..b9632bb2 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -572,15 +572,6 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
-/*
- * Indicates the 2k user priority levels are statically mapped into 3 buckets as
- * follows:
- *
- * -1k to -1	Low priority
- * 0		Normal priority
- * 1 to 1k	Highest priority
- */
-#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
@@ -683,9 +674,6 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
 
-/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
-#define I915_PARAM_HAS_USERPTR_PROBE 56
-
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -935,25 +923,6 @@ struct drm_i915_gem_mmap_offset {
  *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
  *
  * All other domains are rejected.
- *
- * Note that for discrete, starting from DG1, this is no longer supported, and
- * is instead rejected. On such platforms the CPU domain is effectively static,
- * where we also only support a single &drm_i915_gem_mmap_offset cache mode,
- * which can't be set explicitly and instead depends on the object placements,
- * as per the below.
- *
- * Implicit caching rules, starting from DG1:
- *
- *	- If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
- *	  contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
- *	  mapped as write-combined only.
- *
- *	- Everything else is always allocated and mapped as write-back, with the
- *	  guarantee that everything is also coherent with the GPU.
- *
- * Note that this is likely to change in the future again, where we might need
- * more flexibility on future devices, so making this all explicit as part of a
- * new &drm_i915_gem_create_ext extension is probable.
  */
 struct drm_i915_gem_set_domain {
 	/** @handle: Handle for the object. */
@@ -1846,55 +1815,6 @@ struct drm_i915_gem_context_param {
  * attempted to use it, never re-use this context param number.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
-
-/*
- * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
- *
- * Mark that the context makes use of protected content, which will result
- * in the context being invalidated when the protected content session is.
- * Given that the protected content session is killed on suspend, the device
- * is kept awake for the lifetime of a protected context, so the user should
- * make sure to dispose of them once done.
- * This flag can only be set at context creation time and, when set to true,
- * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
- * to false. This flag can't be set to true in conjunction with setting the
- * I915_CONTEXT_PARAM_BANNABLE flag to false. Creation example:
- *
- * .. code-block:: C
- *
- *	struct drm_i915_gem_context_create_ext_setparam p_protected = {
- *		.base = {
- *			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
- *		},
- *		.param = {
- *			.param = I915_CONTEXT_PARAM_PROTECTED_CONTENT,
- *			.value = 1,
- *		}
- *	};
- *	struct drm_i915_gem_context_create_ext_setparam p_norecover = {
- *		.base = {
- *			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
- *			.next_extension = to_user_pointer(&p_protected),
- *		},
- *		.param = {
- *			.param = I915_CONTEXT_PARAM_RECOVERABLE,
- *			.value = 0,
- *		}
- *	};
- *	struct drm_i915_gem_context_create_ext create = {
- *		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
- *		.extensions = to_user_pointer(&p_norecover);
- *	};
- *
- *	ctx_id = gem_context_create_ext(drm_fd, &create);
- *
- * In addition to the normal failure cases, setting this flag during context
- * creation can result in the following errors:
- *
- * -ENODEV: feature not available
- * -EPERM: trying to mark a recoverable or not bannable context as protected
- */
-#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
@@ -2283,29 +2203,12 @@ struct drm_i915_gem_userptr {
 	 * through the GTT. If the HW can't support readonly access, an error is
 	 * returned.
 	 *
-	 * I915_USERPTR_PROBE:
-	 *
-	 * Probe the provided @user_ptr range and validate that the @user_ptr is
-	 * indeed pointing to normal memory and that the range is also valid.
-	 * For example if some garbage address is given to the kernel, then this
-	 * should complain.
-	 *
-	 * Returns -EFAULT if the probe failed.
-	 *
-	 * Note that this doesn't populate the backing pages, and also doesn't
-	 * guarantee that the object will remain valid when the object is
-	 * eventually used.
-	 *
-	 * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PROBE
-	 * returns a non-zero value.
-	 *
 	 * I915_USERPTR_UNSYNCHRONIZED:
 	 *
 	 * NOT USED. Setting this flag will result in an error.
 	 */
 	__u32 flags;
 #define I915_USERPTR_READ_ONLY 0x1
-#define I915_USERPTR_PROBE 0x2
 #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
 	/**
 	 * @handle: Returned handle for the object.
@@ -2457,7 +2360,7 @@ struct drm_i915_perf_open_param {
  * Change metrics_set captured by a stream.
  *
  * If the stream is bound to a specific context, the configuration change
- * will performed inline with that context such that it takes effect before
+ * will performed __inline__ with that context such that it takes effect before
  * the next execbuf submission.
  *
  * Returns the previously bound metrics set id, or a negative error code.
@@ -3028,12 +2931,8 @@ struct drm_i915_gem_create_ext {
 	 *
 	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
 	 * struct drm_i915_gem_create_ext_memory_regions.
-	 *
-	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
-	 * struct drm_i915_gem_create_ext_protected_content.
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
-#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
 	__u64 extensions;
 };
 
@@ -3091,50 +2990,6 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
-/**
- * struct drm_i915_gem_create_ext_protected_content - The
- * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
- *
- * If this extension is provided, buffer contents are expected to be protected
- * by PXP encryption and require decryption for scan out and processing. This
- * is only possible on platforms that have PXP enabled, on all other scenarios
- * using this extension will cause the ioctl to fail and return -ENODEV. The
- * flags parameter is reserved for future expansion and must currently be set
- * to zero.
- *
- * The buffer contents are considered invalid after a PXP session teardown.
- *
- * The encryption is guaranteed to be processed correctly only if the object
- * is submitted with a context created using the
- * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
- * at submission time on the validity of the objects involved.
- *
- * Below is an example on how to create a protected object:
- *
- * .. code-block:: C
- *
- *      struct drm_i915_gem_create_ext_protected_content protected_ext = {
- *              .base = { .name = I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
- *              .flags = 0,
- *      };
- *      struct drm_i915_gem_create_ext create_ext = {
- *              .size = PAGE_SIZE,
- *              .extensions = (uintptr_t)&protected_ext,
- *      };
- *
- *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
- *      if (err) ...
- */
-struct drm_i915_gem_create_ext_protected_content {
-	/** @base: Extension link. See struct i915_user_extension. */
-	struct i915_user_extension base;
-	/** @flags: reserved for future usage, currently MBZ */
-	__u32 flags;
-};
-
-/* ID of the protected content session managed by i915 when PXP is active */
-#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1
