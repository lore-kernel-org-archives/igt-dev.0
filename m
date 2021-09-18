Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667266F3C9
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Sep 2021 04:54:10 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 17 Sep 2021 21:54:22 -0700
Message-Id: <20210918045436.34782-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210918045436.34782-1-alan.previn.teres.alexis@intel.com>
References: <20210918045436.34782-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v11 01/15] Add PXP UAPI support in i915_drm.h
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

PXP hasn't been merged into upstream kernel, so taking the
UAPI changes from the kernel patches and adding into
i915_drm_local.h for now.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/i915/i915_drm_local.h | 102 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index dd646aed..fbb68d8a 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -20,6 +20,108 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+/*
+ * New PXP UAPI value for 'struct drm_i915_gem_context_param.param'
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
+
+/*
+ * New PXP UAPI flag for 'struct drm_i915_gem_create_ext.flags'
+ *
+ * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
+ * struct drm_i915_gem_create_ext_protected_content.
+ */
+#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
+
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
-- 
2.25.1
