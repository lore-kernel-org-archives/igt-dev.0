Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5713410E1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:13:59 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:35 -0800
Message-Id: <20230118071350.17498-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 04/19] lib/vm_bind: Add vm_bind/unbind
 and execbuf3 ioctls
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

Add required library interfaces for new vm_bind/unbind
and execbuf3 ioctls.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/ioctl_wrappers.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h |  6 ++++
 2 files changed, 84 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 1ab41ab6d..9ce875470 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -675,6 +675,38 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	igt_assert_eq(__gem_execbuf_wr(fd, execbuf), 0);
 }
 
+/**
+ * __gem_execbuf3:
+ * @fd: open i915 drm file descriptor
+ * @execbuf: execbuffer data structure
+ *
+ * This wraps the EXECBUFFER3 ioctl, which submits a batchbuffer for the gpu to
+ * run. This is allowed to fail, with -errno returned.
+ */
+int __gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf)
+{
+	int err = 0;
+	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_EXECBUFFER3, execbuf)) {
+		err = -errno;
+		igt_assume(err != 0);
+	}
+	errno = 0;
+	return err;
+}
+
+/**
+ * gem_execbuf3:
+ * @fd: open i915 drm file descriptor
+ * @execbuf: execbuffer data structure
+ *
+ * This wraps the EXECBUFFER3 ioctl, which submits a batchbuffer for the gpu to
+ * run.
+ */
+void gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf)
+{
+	igt_assert_eq(__gem_execbuf3(fd, execbuf), 0);
+}
+
 /**
  * gem_madvise:
  * @fd: open i915 drm file descriptor
@@ -1297,3 +1329,49 @@ bool igt_has_drm_cap(int fd, uint64_t capability)
 	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
 	return cap.value;
 }
+
+/* VM_BIND */
+
+int __gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind)
+{
+	int err = 0;
+
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_BIND, bind))
+		err = -errno;
+	return err;
+}
+
+/**
+ * gem_vm_bind:
+ * @fd: open i915 drm file descriptor
+ * @bind: vm_bind data structure
+ *
+ * This wraps the VM_BIND ioctl to bind an address range to
+ * the specified address space.
+ */
+void gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind)
+{
+	igt_assert_eq(__gem_vm_bind(fd, bind), 0);
+}
+
+int __gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind)
+{
+	int err = 0;
+
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_UNBIND, unbind))
+		err = -errno;
+	return err;
+}
+
+/**
+ * gem_vm_unbind:
+ * @fd: open i915 drm file descriptor
+ * @unbind: vm_unbind data structure
+ *
+ * This wraps the VM_UNBIND ioctl to unbind an address range from
+ * the specified address space.
+ */
+void gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind)
+{
+	igt_assert_eq(__gem_vm_unbind(fd, unbind), 0);
+}
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index cf228c265..50e2139f5 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -79,6 +79,12 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
+void gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf);
+int __gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf);
+int __gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind);
+void gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind);
+int __gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind);
+void gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind);
 
 #ifndef I915_GEM_DOMAIN_WC
 #define I915_GEM_DOMAIN_WC 0x80
-- 
2.21.0.rc0.32.g243a4c7e27
