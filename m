Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4763F10E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 07:24:03 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 23:23:45 -0800
Message-Id: <20221129072355.769-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221129072355.769-1-niranjana.vishwanathapura@intel.com>
References: <20221129072355.769-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 04/14] lib/vm_bind: Add vm_bind mode
 support for VM
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

Add required library interfaces to create VM in
vm_bind mode and assign the VM to a context.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/gem_context.c | 24 ++++++++++++++++++++++++
 lib/i915/gem_context.h |  3 +++
 lib/i915/gem_vm.c      | 31 ++++++++++++++++++++++++++-----
 lib/i915/gem_vm.h      |  3 ++-
 4 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index fe989a8d1..2d06b4198 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -517,3 +517,27 @@ uint32_t gem_context_create_for_class(int i915,
 	*count = i;
 	return p.ctx_id;
 }
+
+uint32_t gem_context_get_vm(int fd, uint32_t ctx_id)
+{
+	struct drm_i915_gem_context_param p = {
+		.param = I915_CONTEXT_PARAM_VM,
+		.ctx_id = ctx_id,
+	};
+
+	gem_context_get_param(fd, &p);
+	igt_assert(p.value);
+
+	return p.value;
+}
+
+void gem_context_set_vm(int fd, uint32_t ctx_id, uint32_t vm_id)
+{
+	struct drm_i915_gem_context_param p = {
+		.param = I915_CONTEXT_PARAM_VM,
+		.ctx_id = ctx_id,
+		.value = vm_id,
+	};
+
+	gem_context_set_param(fd, &p);
+}
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index 505d55724..2a2247fe1 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -63,4 +63,7 @@ void gem_context_set_persistence(int i915, uint32_t ctx, bool state);
 
 bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine);
 
+uint32_t gem_context_get_vm(int fd, uint32_t ctx_id);
+void gem_context_set_vm(int fd, uint32_t ctx_id, uint32_t vm_id);
+
 #endif /* GEM_CONTEXT_H */
diff --git a/lib/i915/gem_vm.c b/lib/i915/gem_vm.c
index 9a022a56c..ee3c65d06 100644
--- a/lib/i915/gem_vm.c
+++ b/lib/i915/gem_vm.c
@@ -48,7 +48,7 @@ bool gem_has_vm(int i915)
 {
 	uint32_t vm_id = 0;
 
-	__gem_vm_create(i915, &vm_id);
+	__gem_vm_create(i915, 0, &vm_id);
 	if (vm_id)
 		gem_vm_destroy(i915, vm_id);
 
@@ -67,9 +67,9 @@ void gem_require_vm(int i915)
 	igt_require(gem_has_vm(i915));
 }
 
-int __gem_vm_create(int i915, uint32_t *vm_id)
+int __gem_vm_create(int i915, uint32_t flags, uint32_t *vm_id)
 {
-       struct drm_i915_gem_vm_control ctl = {};
+       struct drm_i915_gem_vm_control ctl = { .flags = flags };
        int err = 0;
 
        if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_VM_CREATE, &ctl) == 0) {
@@ -88,7 +88,8 @@ int __gem_vm_create(int i915, uint32_t *vm_id)
  * @i915: open i915 drm file descriptor
  *
  * This wraps the VM_CREATE ioctl, which is used to allocate a new
- * address space for use with GEM contexts.
+ * address space for use with GEM contexts, with legacy execbuff
+ * method of binding.
  *
  * Returns: The id of the allocated address space.
  */
@@ -96,7 +97,27 @@ uint32_t gem_vm_create(int i915)
 {
 	uint32_t vm_id;
 
-	igt_assert_eq(__gem_vm_create(i915, &vm_id), 0);
+	igt_assert_eq(__gem_vm_create(i915, 0, &vm_id), 0);
+	igt_assert(vm_id != 0);
+
+	return vm_id;
+}
+
+/**
+ * gem_vm_create_in_vm_bind_mode:
+ * @i915: open i915 drm file descriptor
+ *
+ * This wraps the VM_CREATE ioctl with I915_VM_CREATE_FLAGS_USE_VM_BIND,
+ * flag which is used to allocate a new address space for use with GEM contexts
+ * with vm_bind mode of binding.
+ *
+ * Returns: The id of the allocated address space.
+ */
+uint32_t gem_vm_create_in_vm_bind_mode(int i915)
+{
+	uint32_t vm_id;
+
+	igt_assert_eq(__gem_vm_create(i915, I915_VM_CREATE_FLAGS_USE_VM_BIND, &vm_id), 0);
 	igt_assert(vm_id != 0);
 
 	return vm_id;
diff --git a/lib/i915/gem_vm.h b/lib/i915/gem_vm.h
index acbb663e6..6cf46d887 100644
--- a/lib/i915/gem_vm.h
+++ b/lib/i915/gem_vm.h
@@ -31,7 +31,8 @@ bool gem_has_vm(int i915);
 void gem_require_vm(int i915);
 
 uint32_t gem_vm_create(int i915);
-int __gem_vm_create(int i915, uint32_t *vm_id);
+uint32_t gem_vm_create_in_vm_bind_mode(int i915);
+int __gem_vm_create(int i915, uint32_t flags, uint32_t *vm_id);
 
 void gem_vm_destroy(int i915, uint32_t vm_id);
 int __gem_vm_destroy(int i915, uint32_t vm_id);
-- 
2.21.0.rc0.32.g243a4c7e27
