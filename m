Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5677B10E2BD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 06:21:50 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 23:21:11 -0700
Message-Id: <20220928062115.6412-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
References: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] lib/vm_bind: Add support for VM private
 objects
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

From: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>

Update library interfaces to support creation of VM private
objects.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/intel_memory_region.c | 14 +++++++++++---
 lib/i915/intel_memory_region.h | 21 +++++++++++++++------
 tests/i915/gem_create.c        |  4 ++--
 tests/i915/gem_eio.c           |  2 +-
 tests/i915/gem_lmem_swapping.c |  2 +-
 tests/i915/i915_pm_rpm.c       |  6 +++---
 tests/i915/i915_query.c        |  2 +-
 7 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 568bace949..2d994b890d 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -197,10 +197,14 @@ bool gem_has_lmem(int fd)
 
 /* A version of gem_create_in_memory_region_list which can be allowed to
    fail so that the object creation can be retried */
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
 				       const struct drm_i915_gem_memory_class_instance *mem_regions,
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
 					  const struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions)
 {
 	uint32_t handle;
-	int ret = __gem_create_in_memory_region_list(fd, &handle, &size, flags,
+	int ret = __gem_create_in_memory_region_list(fd, &handle, &size, flags, vm_id,
 						     mem_regions, num_regions);
 	igt_assert_eq(ret, 0);
 	return handle;
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index fd04df83b5..4d10800558 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -64,11 +64,11 @@ unsigned int gem_get_lmem_region_count(int fd);
 
 bool gem_has_lmem(int fd);
 
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
 				       const struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions);
 
-uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
+uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags, uint32_t vm_id,
 					  const struct drm_i915_gem_memory_class_instance *mem_regions,
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
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index c39390f326..9255897ed8 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -207,7 +207,7 @@ static void *thread_clear(void *data)
 		npages = get_npages(&arg->max, npages);
 		size = npages << 12;
 
-		igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
+		igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, 0, &arg->region, 1), 0);
 		if (random() & 1)
 			make_resident(i915, batch, handle);
 
@@ -315,7 +315,7 @@ static void busy_create(int i915, const struct gem_memory_region *r, int timeout
 			uint32_t handle;
 			igt_spin_t *next;
 
-			handle = gem_create_in_memory_region_list(i915, 4096, 0, &r->ci, 1);
+			handle = gem_create_in_memory_region_list(i915, 4096, 0, 0, &r->ci, 1);
 			next = __igt_spin_new(i915,
 					      .ahnd = ahnd,
 					      .ctx = ctx,
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
index cccdb3195b..d6f33af68f 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -132,7 +132,7 @@ static uint32_t create_bo(int i915,
 	int ret;
 
 retry:
-	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, region, 1);
+	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, 0, region, 1);
 	if (do_oom_test && ret == -ENOMEM)
 		goto retry;
 	igt_assert_eq(ret, 0);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index e95875dc70..8ea58a5e65 100644
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
+		handle = gem_create_in_memory_region_list(drm_fd, batch_size, 0, 0, mem_regions, 1);
 
 	gem_write(drm_fd, handle, 0, batch_buf, batch_size);
 
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 8befd48bb8..e061cb4a10 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -821,7 +821,7 @@ static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
 		if (cpu_access)
 			oh->handle = gem_create_with_cpu_access_in_memory_regions(fd, size, id);
 		else
-			oh->handle = gem_create_in_memory_region_list(fd, size, 0, &ci, 1);
+			oh->handle = gem_create_in_memory_region_list(fd, size, 0, 0, &ci, 1);
 		igt_list_add(&oh->link, &handles);
 
 		num_handles++;
-- 
2.21.0.rc0.32.g243a4c7e27
