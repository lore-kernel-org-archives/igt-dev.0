Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3CB6E951
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 09:23:37 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Fri, 16 Jul 2021 02:23:20 -0700
Message-Id: <20210716092334.961262-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
References: <20210716092334.961262-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 02/16] Update IOCTL wrapper with
 DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Update IOCTL wrapper with DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/ioctl_wrappers.c | 34 ++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 48526d29..99d4419f 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -680,6 +680,40 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	igt_assert_eq(__gem_execbuf_wr(fd, execbuf), 0);
 }
 
+/**
+ * __gem_ctx_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @ctx_ext: context_create_ext data structure
+ *
+ * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem context based on
+ * additional drm_i915_gem_context_create_ext_setparam input extensions. This is
+ * allowed to fail, with -errno returned
+ */
+int __gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext)
+{
+	int err = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, ctx_ext)) {
+		err = -errno;
+		igt_assume(err != 0);
+	}
+	errno = 0;
+	return err;
+}
+
+/**
+ * gem_ctx_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @ctx_ext: context_create_ext data structure
+ *
+ * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem context based on
+ * additional drm_i915_gem_context_create_ext_setparam input extensions.
+ */
+void gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext)
+{
+	igt_assert_eq(__gem_ctx_create_ext(fd, ctx_ext), 0);
+}
+
 /**
  * gem_madvise:
  * @fd: open i915 drm file descriptor
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index a8274a3f..24191db3 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -84,6 +84,8 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
+int __gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext);
+void gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext *ctx_ext);
 
 #ifndef I915_GEM_DOMAIN_WC
 #define I915_GEM_DOMAIN_WC 0x80
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
