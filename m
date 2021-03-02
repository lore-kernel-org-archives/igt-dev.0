Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB526E2C0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:54:31 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:24 -0800
Message-Id: <20210302225334.361966-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 01/11] Sync i915_drm.h UAPI for PXP
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

Sync i915_drm.h UAPI for PXP

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 include/drm-uapi/i915_drm.h | 94 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index bf9ea471..62828148 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -392,6 +392,7 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_ENTERVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_ENTERVT)
 #define DRM_IOCTL_I915_GEM_LEAVEVT	DRM_IO(DRM_COMMAND_BASE + DRM_I915_GEM_LEAVEVT)
 #define DRM_IOCTL_I915_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create)
+#define DRM_IOCTL_I915_GEM_CREATE_EXT   DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_CREATE, struct drm_i915_gem_create_ext)
 #define DRM_IOCTL_I915_GEM_PREAD	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PREAD, struct drm_i915_gem_pread)
 #define DRM_IOCTL_I915_GEM_PWRITE	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_PWRITE, struct drm_i915_gem_pwrite)
 #define DRM_IOCTL_I915_GEM_MMAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct drm_i915_gem_mmap)
@@ -729,6 +730,27 @@ struct drm_i915_gem_create {
 	__u32 pad;
 };
 
+struct drm_i915_gem_create_ext {
+	/**
+	 * Requested size for the object.
+	 *
+	 * The (page-aligned) allocated size for the object will be returned.
+	 */
+	__u64 size;
+	/**
+	 * Returned handle for the object.
+	 *
+	 * Object handles are nonzero.
+	 */
+	__u32 handle;
+	__u32 pad;
+#define I915_GEM_CREATE_EXT_SETPARAM (1u << 0)
+#define I915_GEM_CREATE_EXT_FLAGS_UNKNOWN \
+	(-(I915_GEM_CREATE_EXT_SETPARAM << 1))
+	__u64 extensions;
+
+};
+
 struct drm_i915_gem_pread {
 	/** Handle for the object being read. */
 	__u32 handle;
@@ -1694,11 +1716,76 @@ struct drm_i915_gem_context_param {
  * Default is 16 KiB.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
+
+/*
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
+ *
+ * Enable usage of protected content with the context. This flag can only be
+ * set at context creation time and, when set to true, must be preceded by
+ * an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE to false. This flag
+ * can't be set to true in conjunction with setting the
+ * I915_CONTEXT_PARAM_BANNABLE flag to false.
+ *
+ * Given the numerous restriction on this flag, there are several unique 
+ * failure cases:
+ *
+ * -ENODEV: feature not available
+ * -EEXIST: trying to modify an existing context
+ * -EPERM: trying to mark a recoverable or not bannable context as protected
+ */
+#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
 
 	__u64 value;
 };
 
+struct drm_i915_gem_object_param {
+	/* Object handle (0 for I915_GEM_CREATE_EXT_SETPARAM) */
+	__u32 handle;
+
+	/* Data pointer size */
+	__u32 size;
+
+/*
+ * I915_OBJECT_PARAM:
+ *
+ * Select object namespace for the param.
+ */
+#define I915_OBJECT_PARAM  (1ull << 32)
+
+/*
+ * I915_OBJECT_PARAM_PROTECTED_CONTENT:
+ *
+ * If set to true, buffer contents is expected to be protected by PXP
+ * encryption and requires decryption for scan out and processing. This is
+ * only possible on platforms that have PXP enabled, on all other scenarios
+ * setting this flag will cause the ioctl to fail and return -ENODEV.
+ *
+ * Protected buffers can only be used with contexts created using the
+ * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. The buffer contents are
+ * considered invalid after a PXP session teardown.
+ *
+ * Given the restriction above, the following errors are possible when
+ * submitting a protected object in an execbuf call:
+ *
+ * -ENODEV: PXP session not currently active
+ * -EIO: buffer has become invalid after a teardown event
+ * -EPERM: buffer submitted using a context not marked as protected
+ */
+#define I915_OBJECT_PARAM_PROTECTED_CONTENT  0x0
+/* Must be kept compact -- no holes and well documented */
+
+	__u64 param;
+
+	/* Data value or pointer */
+	__u64 data;
+};
+
+struct drm_i915_gem_create_ext_setparam {
+	struct i915_user_extension base;
+	struct drm_i915_gem_object_param param;
+};
+
 /**
  * Context SSEU programming
  *
@@ -1924,6 +2011,7 @@ struct drm_i915_reg_read {
 struct drm_i915_reset_stats {
 	__u32 ctx_id;
 	__u32 flags;
+#define I915_CONTEXT_INVALIDATED 0x1
 
 	/* All resets since boot/module reload, for all contexts */
 	__u32 reset_count;
@@ -2093,7 +2181,7 @@ struct drm_i915_perf_open_param {
  * Change metrics_set captured by a stream.
  *
  * If the stream is bound to a specific context, the configuration change
- * will performed __inline__ with that context such that it takes effect before
+ * will performed inline with that context such that it takes effect before
  * the next execbuf submission.
  *
  * Returns the previously bound metrics set id, or a negative error code.
@@ -2376,6 +2464,10 @@ struct drm_i915_query_perf_config {
 	__u8 data[];
 };
 
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
