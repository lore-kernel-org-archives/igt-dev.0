Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07A6E951
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 09:23:37 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 16 Jul 2021 02:23:19 -0700
Message-Id: <20210716092334.961262-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
References: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 01/16] Add PXP UAPI support in i915_drm.h
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

At the time of this commit, PXP hasnt been merged into
upstream kernel so this has no kernel tag reference yet

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 include/drm-uapi/i915_drm.h | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a1c0030c..9c3fb419 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -1743,6 +1743,25 @@ struct drm_i915_gem_context_param {
  * Default is 16 KiB.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
+
+/*
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+ *
+ * Mark that the context makes use of protected content, which will result
+ * in the context being invalidated when the protected content session is.
+ * This flag can only be set at context creation time and, when set to true,
+ * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
+ * to false. This flag can't be set to true in conjunction with setting the
+ * I915_CONTEXT_PARAM_BANNABLE flag to false.
+ *
+ * Given the numerous restriction on this flag, there are several unique
+ * failure cases:
+ *
+ * -ENODEV: feature not available
+ * -EPERM: trying to mark a recoverable or not bannable context as protected
+ * -EACCES: submitting an invalidated context for execution
+ */
+#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
@@ -1973,6 +1992,12 @@ struct drm_i915_reg_read {
 struct drm_i915_reset_stats {
 	__u32 ctx_id;
 	__u32 flags;
+	/*
+	 * contexts marked as using protected content are invalidated when the
+	 * protected content session dies. Submission of invalidated contexts
+	 * is rejected with -EACCES.
+	 */
+#define I915_CONTEXT_INVALIDATED 0x1
 
 	/* All resets since boot/module reload, for all contexts */
 	__u32 reset_count;
@@ -2643,8 +2668,12 @@ struct drm_i915_gem_create_ext {
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
 
@@ -2702,6 +2731,36 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/**
+ * struct drm_i915_gem_create_ext_protected_content - The
+ * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
+ *
+ * If this extension is provided, buffer contents are expected to be
+ * protected by PXP encryption and requires decryption for scan out
+ * and processing. This is only possible on platforms that have PXP enabled,
+ * on all other scenarios ysing this extension will cause the ioctl to fail
+ * and return -ENODEV. The flags parameter is reserved for future expansion and
+ * must currently be set to zero.
+ *
+ * The buffer contents are considered invalid after a PXP session teardown.
+ *
+ * The encryption is guaranteed to be processed correctly only if the object
+ * is submitted with a context created using the
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
+ * at submission time on the validity of the objects involved, which can lead to
+ * the following errors being returned from the execbuf ioctl:
+ *
+ * -ENODEV: PXP session not currently active
+ * -ENOEXEC: buffer has become invalid after a teardown event
+ */
+struct drm_i915_gem_create_ext_protected_content {
+	struct i915_user_extension base;
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

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
