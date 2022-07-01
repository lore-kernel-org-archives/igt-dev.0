Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205B0112A8B
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 23:06:12 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 16:05:43 -0700
Message-Id: <20220701230546.8348-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
References: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 2/5] lib/vm_bind: Add interface to support
 VM_BIND
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Adam Miszczak <adam.miszczak@linux.intel.com>

Add required library interfaces to support VM_BIND
functionality.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/gem_context.c         | 24 +++++++++++
 lib/i915/gem_context.h         |  3 ++
 lib/i915/gem_vm.c              | 31 +++++++++++---
 lib/i915/gem_vm.h              |  3 +-
 lib/i915/intel_memory_region.c | 14 ++++--
 lib/i915/intel_memory_region.h | 21 ++++++---
 lib/ioctl_wrappers.c           | 78 ++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h           |  6 +++
 tests/i915/gem_eio.c           |  2 +-
 tests/i915/gem_lmem_swapping.c |  2 +-
 tests/i915/i915_pm_rpm.c       |  6 +--
 tests/i915/i915_query.c        |  2 +-
 12 files changed, 171 insertions(+), 21 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index fe989a8d1c..2d06b41980 100644
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
index 505d55724e..2a2247fe10 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -63,4 +63,7 @@ void gem_context_set_persistence(int i915, uint32_t ctx, bool state);
 
 bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine);
 
+uint32_t gem_context_get_vm(int fd, uint32_t ctx_id);
+void gem_context_set_vm(int fd, uint32_t ctx_id, uint32_t vm_id);
+
 #endif /* GEM_CONTEXT_H */
diff --git a/lib/i915/gem_vm.c b/lib/i915/gem_vm.c
index 9a022a56c7..ee3c65d06e 100644
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
index acbb663e65..6cf46d8876 100644
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
diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 93a18982c1..74a4fda6f2 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -197,10 +197,14 @@ bool gem_has_lmem(int fd)
 
 /* A version of gem_create_in_memory_region_list which can be allowed to
    fail so that the object creation can be retried */
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
 				       struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions)
 {
+	struct drm_i915_gem_create_ext_vm_private vm_priv = {
+		.base = { .name = I915_GEM_CREATE_EXT_VM_PRIVATE },
+		.vm_id = vm_id,
+	};
 	struct drm_i915_gem_create_ext_memory_regions ext_regions = {
 		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
 		.num_regions = num_regions,
@@ -208,6 +212,9 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 	};
 	int ret;
 
+	if (vm_id)
+		ext_regions.base.next_extension = to_user_pointer(&vm_priv.base);
+
 	ret = __gem_create_ext(fd, size, flags, handle, &ext_regions.base);
 	if (flags && ret == -EINVAL)
 		ret = __gem_create_ext(fd, size, 0, handle, &ext_regions.base);
@@ -230,15 +237,16 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 /* gem_create_in_memory_region_list:
  * @fd: opened i915 drm file descriptor
  * @size: requested size of the buffer
+ * @vm_id: vm_id for VM private Objects. 0 for non-private Objects.
  * @mem_regions: memory regions array (priority list)
  * @num_regions: @mem_regions length
  */
-uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
+uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags, uint32_t vm_id,
 					  struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions)
 {
 	uint32_t handle;
-	int ret = __gem_create_in_memory_region_list(fd, &handle, &size, flags,
+	int ret = __gem_create_in_memory_region_list(fd, &handle, &size, flags, vm_id,
 						     mem_regions, num_regions);
 	igt_assert_eq(ret, 0);
 	return handle;
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index e1bfe0ca65..421c2ecf15 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -64,11 +64,11 @@ unsigned int gem_get_lmem_region_count(int fd);
 
 bool gem_has_lmem(int fd);
 
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
 				       struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions);
 
-uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
+uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags, uint32_t vm_id,
 					  struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions);
 
@@ -84,7 +84,7 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
 		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
 	} \
-	__gem_create_in_memory_region_list(fd, handle, size, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
+	__gem_create_in_memory_region_list(fd, handle, size, 0, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
 })
 #define gem_create_in_memory_regions(fd, size, regions...) ({ \
 	unsigned int arr__[] = { regions }; \
@@ -93,7 +93,7 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
 		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
 	} \
-	gem_create_in_memory_region_list(fd, size, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
+	gem_create_in_memory_region_list(fd, size, 0, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
 })
 
 /*
@@ -131,7 +131,7 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 		arr_query__[i__].memory_instance = 0; \
 		arr_query_size__++; \
 	} \
-	__gem_create_in_memory_region_list(fd, handle, size, ext_flags__, arr_query__, arr_query_size__); \
+	__gem_create_in_memory_region_list(fd, handle, size, ext_flags__, 0, arr_query__, arr_query_size__); \
 })
 #define gem_create_with_cpu_access_in_memory_regions(fd, size, regions...) ({ \
 	unsigned int arr__[] = { regions }; \
@@ -152,7 +152,16 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 		arr_query__[i__].memory_instance = 0; \
 		arr_query_size__++; \
 	} \
-	gem_create_in_memory_region_list(fd, size, ext_flags__, arr_query__, arr_query_size__); \
+	gem_create_in_memory_region_list(fd, size, ext_flags__, 0, arr_query__, arr_query_size__); \
+})
+#define gem_create_vm_private_in_memory_regions(fd, size, vm_id, regions...) ({ \
+	unsigned int arr__[] = { regions };				\
+	struct drm_i915_gem_memory_class_instance arr_query__[ARRAY_SIZE(arr__)]; \
+	for (int i__  = 0; i__ < ARRAY_SIZE(arr_query__); ++i__) {	\
+		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]); \
+		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]); \
+	} \
+	gem_create_in_memory_region_list(fd, size, 0, vm_id, arr_query__, ARRAY_SIZE(arr_query__)); \
 })
 
 struct igt_collection *
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 7713e78b65..f026473f87 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -707,6 +707,38 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
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
@@ -1329,3 +1361,49 @@ bool igt_has_drm_cap(int fd, uint64_t capability)
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
index 9a897fec23..223cd9160c 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -84,6 +84,12 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
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
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 70e82b811c..6308346747 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -146,7 +146,7 @@ static void test_create_ext(int fd)
 		igt_assert_eq(__gem_create_in_memory_region_list(fd,
 								 &handle,
 								 &size,
-								 0,
+								 0, 0,
 								 &r->ci, 1),
 			      0);
 
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 1a4f4ca5b1..3a2cd66196 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -131,7 +131,7 @@ static uint32_t create_bo(int i915,
 	int ret;
 
 retry:
-	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, region, 1);
+	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, 0, region, 1);
 	if (do_oom_test && ret == -ENOMEM)
 		goto retry;
 	igt_assert_eq(ret, 0);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index e95875dc70..29907d42c2 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1117,7 +1117,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	/* Create, map and set data while the device is active. */
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
-	handle = gem_create_in_memory_region_list(drm_fd, buf_size, 0, mem_regions, 1);
+	handle = gem_create_in_memory_region_list(drm_fd, buf_size, 0, 0, mem_regions, 1);
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
@@ -1348,7 +1348,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	/* Create and set data while the device is active. */
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
-	handle = gem_create_in_memory_region_list(drm_fd, dst_size, 0, mem_regions, 1);
+	handle = gem_create_in_memory_region_list(drm_fd, dst_size, 0, 0, mem_regions, 1);
 
 	cpu_buf = malloc(dst_size);
 	igt_assert(cpu_buf);
@@ -1453,7 +1453,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	if (wait_flags & WAIT_PC8_RES)
 		handle = gem_create(drm_fd, batch_size);
 	else
-		handle = gem_create_in_memory_region_list(drm_fd, batch_size, 0, mem_regions, 1);
+	  handle = gem_create_in_memory_region_list(drm_fd, batch_size, 0, 0, mem_regions, 1);
 
 	gem_write(drm_fd, handle, 0, batch_buf, batch_size);
 
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 840b4864a4..aa649f1058 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -819,7 +819,7 @@ static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
 		if (cpu_access)
 			oh->handle = gem_create_with_cpu_access_in_memory_regions(fd, size, id);
 		else
-			oh->handle = gem_create_in_memory_region_list(fd, size, 0, &ci, 1);
+		  oh->handle = gem_create_in_memory_region_list(fd, size, 0, 0, &ci, 1);
 		igt_list_add(&oh->link, &handles);
 
 		num_handles++;
-- 
2.21.0.rc0.32.g243a4c7e27
