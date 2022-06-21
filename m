Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 11:29:56 +0100
Message-Id: <20220621103001.184373-5-matthew.auld@intel.com>
In-Reply-To: <20220621103001.184373-1-matthew.auld@intel.com>
References: <20220621103001.184373-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/9] lib/i915: add
 gem_create_with_cpu_access_in_memory_regions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Most users shouldn't care about such an interface, but where required,
this should be useful to aid in setting NEEDS_CPU_ACCESS for a given BO.
Underneath we try to smooth over needing to provide an explicit SMEM
region, or if this is SMEM-only, we don't want the kernel to throw an
error.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/i915/intel_memory_region.c | 10 +++--
 lib/i915/intel_memory_region.h | 68 ++++++++++++++++++++++++++++++++--
 tests/i915/gem_eio.c           |  1 +
 tests/i915/gem_lmem_swapping.c |  2 +-
 tests/i915/i915_pm_rpm.c       |  6 +--
 5 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index ce04c6a3..3173507f 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -197,7 +197,7 @@ bool gem_has_lmem(int fd)
 
 /* A version of gem_create_in_memory_region_list which can be allowed to
    fail so that the object creation can be retried */
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
 				       struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions)
 {
@@ -208,7 +208,9 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 	};
 	int ret;
 
-	ret = __gem_create_ext(fd, size, 0, handle, &ext_regions.base);
+	ret = __gem_create_ext(fd, size, flags, handle, &ext_regions.base);
+	if (flags && ret == -EINVAL)
+		ret = __gem_create_ext(fd, size, 0, handle, &ext_regions.base);
 
 	/*
 	 * Provide fallback for stable kernels if region passed in the array
@@ -231,12 +233,12 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
  * @mem_regions: memory regions array (priority list)
  * @num_regions: @mem_regions length
  */
-uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
+uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 					  struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions)
 {
 	uint32_t handle;
-	int ret = __gem_create_in_memory_region_list(fd, &handle, &size,
+	int ret = __gem_create_in_memory_region_list(fd, &handle, &size, flags,
 						     mem_regions, num_regions);
 	igt_assert_eq(ret, 0);
 	return handle;
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index a8741724..40ff832d 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -22,6 +22,7 @@
  */
 #include "i915_drm.h"
 #include "igt_collection.h"
+#include "i915_drm_local.h"
 
 #ifndef INTEL_MEMORY_REGION_H
 #define INTEL_MEMORY_REGION_H
@@ -63,11 +64,11 @@ unsigned int gem_get_lmem_region_count(int fd);
 
 bool gem_has_lmem(int fd);
 
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
 				       struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions);
 
-uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
+uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 					  struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions);
 
@@ -83,7 +84,7 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
 		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
 		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
 	} \
-	__gem_create_in_memory_region_list(fd, handle, size, arr_query__, ARRAY_SIZE(arr_query__)); \
+	__gem_create_in_memory_region_list(fd, handle, size, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
 })
 #define gem_create_in_memory_regions(fd, size, regions...) ({ \
 	unsigned int arr__[] = { regions }; \
@@ -92,7 +93,66 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
 		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
 		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
 	} \
-	gem_create_in_memory_region_list(fd, size, arr_query__, ARRAY_SIZE(arr_query__)); \
+	gem_create_in_memory_region_list(fd, size, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
+})
+
+/*
+ * Create an object that requires CPU access. This only becomes interesting on
+ * platforms that have a small BAR for LMEM CPU access. Without this the object
+ * might need to be migrated when CPU faulting the object, or if that is not
+ * possible we hit SIGBUS. Most users should be fine with this. If enabled the
+ * kernel will never allocate this object in the non-CPU visible portion of
+ * LMEM.
+ *
+ * Underneath this just enables the I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
+ * flag, if we also have an LMEM placement. Also since the kernel requires SMEM
+ * as a potential placement, we automatically attach that as a possible
+ * placement, if not already provided. If this happens to be an SMEM-only
+ * placement then we don't supply the flag, and instead just treat as normal
+ * allocation.
+ */
+
+#define __gem_create_with_cpu_access_in_memory_regions(fd, handle, size, regions...) ({ \
+	unsigned int arr__[] = { regions }; \
+	struct drm_i915_gem_memory_class_instance arr_query__[ARRAY_SIZE(arr__) + 1]; \
+	int i__, arr_query_size__ = ARRAY_SIZE(arr__); \
+	uint32_t ext_flags__ = 0; \
+	bool ext_found_smem__ = false; \
+	for (i__  = 0; i__ < arr_query_size__; ++i__) { \
+		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
+		if (arr_query__[i__].memory_class == I915_MEMORY_CLASS_DEVICE) \
+			ext_flags__ = I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS; \
+		else \
+			ext_found_smem__ = true; \
+		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
+	} \
+	if (ext_flags__ && !ext_found_smem__) { \
+		arr_query__[i__].memory_class = I915_MEMORY_CLASS_SYSTEM; \
+		arr_query__[i__].memory_instance = 0; \
+		arr_query_size__++; \
+	} \
+	__gem_create_in_memory_region_list(fd, handle, size, ext_flags__, arr_query__, arr_query_size__); \
+})
+#define gem_create_with_cpu_access_in_memory_regions(fd, size, regions...) ({ \
+	unsigned int arr__[] = { regions }; \
+	struct drm_i915_gem_memory_class_instance arr_query__[ARRAY_SIZE(arr__) + 1]; \
+	int i__, arr_query_size__ = ARRAY_SIZE(arr__); \
+	uint32_t ext_flags__ = 0; \
+	bool ext_found_smem__ = false; \
+	for (i__  = 0; i__ < arr_query_size__; ++i__) { \
+		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
+		if (arr_query__[i__].memory_class == I915_MEMORY_CLASS_DEVICE) \
+			ext_flags__ = I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS; \
+		else \
+			ext_found_smem__ = true; \
+		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
+	} \
+	if (ext_flags__ && !ext_found_smem__) { \
+		arr_query__[i__].memory_class = I915_MEMORY_CLASS_SYSTEM; \
+		arr_query__[i__].memory_instance = 0; \
+		arr_query_size__++; \
+	} \
+	gem_create_in_memory_region_list(fd, size, ext_flags__, arr_query__, arr_query_size__); \
 })
 
 struct igt_collection *
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 913a21f9..a9641cca 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -146,6 +146,7 @@ static void test_create_ext(int fd)
 		igt_assert_eq(__gem_create_in_memory_region_list(fd,
 								 &handle,
 								 &size,
+								 0,
 								 &r->ci, 1),
 			      0);
 
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 21c2bf72..1a4f4ca5 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -131,7 +131,7 @@ static uint32_t create_bo(int i915,
 	int ret;
 
 retry:
-	ret = __gem_create_in_memory_region_list(i915, &handle, size, region, 1);
+	ret = __gem_create_in_memory_region_list(i915, &handle, size, 0, region, 1);
 	if (do_oom_test && ret == -ENOMEM)
 		goto retry;
 	igt_assert_eq(ret, 0);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index bf145b6c..e95875dc 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1117,7 +1117,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	/* Create, map and set data while the device is active. */
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
-	handle = gem_create_in_memory_region_list(drm_fd, buf_size, mem_regions, 1);
+	handle = gem_create_in_memory_region_list(drm_fd, buf_size, 0, mem_regions, 1);
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
@@ -1348,7 +1348,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	/* Create and set data while the device is active. */
 	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
-	handle = gem_create_in_memory_region_list(drm_fd, dst_size, mem_regions, 1);
+	handle = gem_create_in_memory_region_list(drm_fd, dst_size, 0, mem_regions, 1);
 
 	cpu_buf = malloc(dst_size);
 	igt_assert(cpu_buf);
@@ -1453,7 +1453,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	if (wait_flags & WAIT_PC8_RES)
 		handle = gem_create(drm_fd, batch_size);
 	else
-		handle = gem_create_in_memory_region_list(drm_fd, batch_size, mem_regions, 1);
+		handle = gem_create_in_memory_region_list(drm_fd, batch_size, 0, mem_regions, 1);
 
 	gem_write(drm_fd, handle, 0, batch_buf, batch_size);
 
-- 
2.36.1
