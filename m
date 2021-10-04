Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8F56E223
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 22:39:08 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Mon,  4 Oct 2021 15:39:35 -0700
Message-Id: <20211004223949.2138370-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20211004223949.2138370-1-alan.previn.teres.alexis@intel.com>
References: <20211004223949.2138370-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v12 01/15] i915_drm.h sync
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sync UAPI for to get GEM_CREATE_EXT's I915_OBJECT_PARAM_PROTECTED_CONTENT
and GEM_CONTEXT_CREATE's I915_CONTEXT_PARAM_PROTECTED_CONTENT

Taken from kernel commit:
commit d3ac8d42168a9be7380be8035df8b6d3780ec2a1
       ("drm/i915/pxp: interfaces for using protected objects.")

Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 include/drm-uapi/i915_drm.h | 94 +++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index f4691fcc..6e81f6ea 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -1815,6 +1815,55 @@ struct drm_i915_gem_context_param {
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
@@ -2931,8 +2980,12 @@ struct drm_i915_gem_create_ext {
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
 
@@ -2990,6 +3043,47 @@ struct drm_i915_gem_create_ext_memory_regions {
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
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
-- 
2.25.1
