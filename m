Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50406EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:42 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:24 -0800
Message-Id: <20191213215429.24498-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 2/7] lib: Add interface to support SVM
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com, jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
List-ID: <igt-dev@lists.freedesktop.org>

Add required interfaces to support Shared Virtual Memory (SVM)
functionality. It includes SVM capability handling functions
and the bind and prefetch ioctl wrappers.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 lib/i915/gem_context.c |  27 ++++++++
 lib/i915/gem_context.h |   2 +
 lib/i915/gem_vm.c      |  48 +++++++++++++
 lib/i915/gem_vm.h      |   6 ++
 lib/ioctl_wrappers.c   | 154 +++++++++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h   |  14 ++++
 6 files changed, 251 insertions(+)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 1fae5191..e202b47a 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -403,3 +403,30 @@ bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine)
 
 	return __gem_execbuf(fd, &execbuf) == -ENOENT;
 }
+
+uint32_t gem_ctx_get_vm(int fd, uint32_t ctx_id)
+{
+	struct drm_i915_gem_context_param arg;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.param = I915_CONTEXT_PARAM_VM;
+	arg.ctx_id = ctx_id;
+	gem_context_get_param(fd, &arg);
+	igt_assert(arg.value);
+
+	return arg.value;
+}
+
+uint32_t gem_ctx_set_vm(int fd, uint32_t ctx_id, uint32_t vm_id)
+{
+	struct drm_i915_gem_context_param arg;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.param = I915_CONTEXT_PARAM_VM;
+	arg.ctx_id = ctx_id;
+	arg.value = vm_id;
+	gem_context_set_param(fd, &arg);
+	igt_assert(arg.value);
+
+	return arg.value;
+}
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index c0d4c961..4cfc6ed8 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -68,4 +68,6 @@ void gem_context_set_persistence(int i915, uint32_t ctx, bool state);
 
 bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine);
 
+uint32_t gem_ctx_get_vm(int fd, uint32_t ctx_id);
+uint32_t gem_ctx_set_vm(int fd, uint32_t ctx_id, uint32_t vm_id);
 #endif /* GEM_CONTEXT_H */
diff --git a/lib/i915/gem_vm.c b/lib/i915/gem_vm.c
index 9a022a56..64e6a319 100644
--- a/lib/i915/gem_vm.c
+++ b/lib/i915/gem_vm.c
@@ -128,3 +128,51 @@ void gem_vm_destroy(int i915, uint32_t vm_id)
 {
 	igt_assert_eq(__gem_vm_destroy(i915, vm_id), 0);
 }
+
+int __gem_vm_set_param(int fd, struct drm_i915_gem_vm_param *p)
+{
+	int err = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_VM_SETPARAM, p)) {
+		err = -errno;
+		igt_assume(err);
+	}
+
+	errno = 0;
+	return err;
+}
+
+/**
+ * gem_vm_set_param:
+ * @fd: open i915 drm file descriptor
+ * @param: i915 vm parameter
+ *
+ * Feature test macro to query whether context parameter support for @param
+ * is available. Automatically skips through igt_require() if not.
+ */
+void gem_vm_set_param(int fd, struct drm_i915_gem_vm_param *p)
+{
+	igt_assert_eq(__gem_vm_set_param(fd, p), 0);
+}
+
+void gem_vm_enable_svm(int fd, uint32_t vm_id)
+{
+	struct drm_i915_gem_vm_param arg;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.param = (I915_VM_PARAM | I915_GEM_VM_PARAM_SVM);
+	arg.vm_id = vm_id;
+	arg.value = 1;
+	gem_vm_set_param(fd, &arg);
+}
+
+void gem_vm_disable_svm(int fd, uint32_t vm_id)
+{
+	struct drm_i915_gem_vm_param arg;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.param = (I915_VM_PARAM | I915_GEM_VM_PARAM_SVM);
+	arg.vm_id = vm_id;
+	arg.value = 0;
+	gem_vm_set_param(fd, &arg);
+}
diff --git a/lib/i915/gem_vm.h b/lib/i915/gem_vm.h
index 27af899d..bb279483 100644
--- a/lib/i915/gem_vm.h
+++ b/lib/i915/gem_vm.h
@@ -35,4 +35,10 @@ int __gem_vm_create(int i915, uint32_t *vm_id);
 void gem_vm_destroy(int i915, uint32_t vm_id);
 int __gem_vm_destroy(int i915, uint32_t vm_id);
 
+void gem_vm_set_param(int fd, struct drm_i915_gem_vm_param *p);
+int __gem_vm_set_param(int fd, struct drm_i915_gem_vm_param *p);
+
+void gem_vm_enable_svm(int fd, uint32_t vm_id);
+void gem_vm_disable_svm(int fd, uint32_t vm_id);
+
 #endif /* GEM_VM_H */
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 627717d2..3c42581d 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1454,3 +1454,157 @@ int __kms_addfb(int fd, uint32_t handle,
 
 	return ret < 0 ? -errno : ret;
 }
+
+/* SVM */
+
+bool igt_has_svm(int fd)
+{
+	int val = -1;
+	struct drm_i915_getparam gp = {
+		.param = I915_PARAM_HAS_SVM,
+		.value = &val,
+	};
+	ioctl(fd, DRM_IOCTL_I915_GETPARAM , &gp);
+	return val > 0;
+}
+
+void igt_require_svm(int fd)
+{
+	igt_require(igt_has_svm(fd));
+}
+
+int __gem_svm_bind(int fd, uint64_t start, uint32_t handle,
+		   uint32_t vm_id, uint32_t flags)
+{
+	struct drm_i915_gem_vm_bind bind;
+	int err = 0;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.start = start;
+	bind.type = I915_GEM_VM_BIND_SVM_OBJ;
+	bind.handle = handle;
+	bind.vm_id = vm_id;
+	bind.flags = flags;
+
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_BIND, &bind))
+		err = -errno;
+	return err;
+}
+
+/**
+ * gem_svm_bind:
+ * @fd: open i915 drm file descriptor
+ * @start: VA to bind
+ * @handle: object handle
+ * @vm_id: address space id
+ * @rdonly: read only
+ *
+ * This wraps the BIND ioctl to bind an object to the specified address space.
+ */
+void gem_svm_bind(int fd, uint64_t start, uint32_t handle,
+		  uint32_t vm_id, bool rdonly)
+{
+	uint32_t flags = rdonly ? I915_GEM_VM_BIND_READONLY : 0;
+
+	igt_assert_eq(__gem_svm_bind(fd, start, handle, vm_id, flags), 0);
+}
+
+/**
+ * gem_svm_unbind:
+ * @fd: open i915 drm file descriptor
+ * @handle: object handle
+ * @vm_id: address space id
+ *
+ * This wraps the BIND ioctl to unbind an object from the
+ * specified address space.
+ */
+void gem_svm_unbind(int fd, uint32_t handle, uint32_t vm_id)
+{
+	igt_assert_eq(__gem_svm_bind(fd, 0, handle, vm_id,
+				     I915_GEM_VM_BIND_UNBIND), 0);
+}
+
+int __svm_bind(int fd, const void *buf, uint64_t length,
+	       uint32_t vm_id, uint32_t flags)
+{
+	struct drm_i915_gem_vm_bind bind;
+	int err = 0;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.start = (uint64_t)buf;
+	bind.length = length;
+	bind.type = I915_GEM_VM_BIND_SVM_BUFFER;
+	bind.vm_id = vm_id;
+	bind.flags = flags;
+
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_BIND, &bind))
+		err = -errno;
+	return err;
+}
+
+/**
+ * svm_bind:
+ * @fd: open i915 drm file descriptor
+ * @buf: pointer to the data to write into the buffer
+ * @length: size of the subrange
+ * @vm_id: address space id
+ * @rdonly: read only
+ *
+ * This wraps the BIND ioctl to bind an address range to the
+ * specified address space.
+ */
+void svm_bind(int fd, const void *buf, uint64_t length,
+	      uint32_t vm_id, bool rdonly)
+{
+	uint32_t flags = rdonly ? I915_GEM_VM_BIND_READONLY : 0;
+
+	igt_assert_eq(__svm_bind(fd, buf, length, vm_id, flags), 0);
+}
+
+/**
+ * svm_unbind:
+ * @fd: open i915 drm file descriptor
+ * @start: VA to bind
+ * @buf: pointer to the data to write into the buffer
+ * @length: size of the subrange
+ * @vm_id: address space id
+ *
+ * This wraps the BIND ioctl to unbind an address range from the
+ * specified address space.
+ */
+void svm_unbind(int fd, const void *buf, uint64_t length, uint32_t vm_id)
+{
+	igt_assert_eq(__svm_bind(fd, buf, length, vm_id,
+				 I915_GEM_VM_BIND_UNBIND), 0);
+}
+
+int __svm_prefetch(int fd, const void *buf, uint64_t length, uint32_t region)
+{
+	struct drm_i915_gem_vm_prefetch prefetch;
+	int err = 0;
+
+	memset(&prefetch, 0, sizeof(prefetch));
+	prefetch.type = I915_GEM_VM_PREFETCH_SVM_BUFFER;
+	prefetch.start = (uint64_t)buf;
+	prefetch.length = length;
+	prefetch.region = region;
+
+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_PREFETCH, &prefetch))
+		err = -errno;
+	return err;
+}
+
+/**
+ * svm_prefetch:
+ * @fd: open i915 drm file descriptor
+ * @buf: pointer to the data to write into the buffer
+ * @length: size of the subrange
+ * @region: memory region
+ *
+ * This wraps the VM_PREFETCH ioctl, which is to prefetch specified
+ * memory range to the specified memory region.
+ */
+void svm_prefetch(int fd, const void *buf, uint64_t length, uint32_t region)
+{
+	igt_assert_eq(__svm_prefetch(fd, buf, length, region), 0);
+}
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 86743ace..14736a20 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -85,6 +85,18 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
+int __gem_svm_bind(int fd, uint64_t start, uint32_t handle,
+		   uint32_t vm_id, uint32_t flags);
+void gem_svm_bind(int fd, uint64_t start, uint32_t handle,
+		  uint32_t vm_id, bool rdonly);
+void gem_svm_unbind(int fd, uint32_t handle, uint32_t vm_id);
+int __svm_bind(int fd, const void *buf, uint64_t length,
+	       uint32_t vm_id, uint32_t flags);
+void svm_bind(int fd, const void *buf, uint64_t length,
+	      uint32_t vm_id, bool rdonly);
+void svm_unbind(int fd, const void *buf, uint64_t length, uint32_t vm_id);
+int __svm_prefetch(int fd, const void *buf, uint64_t length, uint32_t region);
+void svm_prefetch(int fd, const void *buf, uint64_t length, uint32_t region);
 
 #ifndef I915_GEM_DOMAIN_WC
 #define I915_GEM_DOMAIN_WC 0x80
@@ -141,6 +153,8 @@ uint64_t gem_global_aperture_size(int fd);
 uint64_t gem_mappable_aperture_size(void);
 bool gem_has_softpin(int fd);
 bool gem_has_exec_fence(int fd);
+bool igt_has_svm(int fd);
+void igt_require_svm(int fd);
 
 /* check functions which auto-skip tests by calling igt_skip() */
 void gem_require_caching(int fd);
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
