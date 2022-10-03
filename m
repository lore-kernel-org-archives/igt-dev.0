Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D7010E24C
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 06:13:47 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  2 Oct 2022 23:13:16 -0700
Message-Id: <20221003061320.12782-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221003061320.12782-1-niranjana.vishwanathapura@intel.com>
References: <20221003061320.12782-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/8] lib/vm_bind: Add support for VM
 private objects
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

v2: Instead of updating existing functions/macros, add separate
    functions/macros to append vm_private extension to gem_create_ext.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/intel_memory_region.c | 48 ++++++++++++++++++++++++++++++----
 lib/i915/intel_memory_region.h | 25 ++++++++++++++++++
 2 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index d80cb3a061..e0f3ad0a0a 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -181,11 +181,11 @@ bool gem_has_lmem(int fd)
 	return gem_get_lmem_region_count(fd) > 0;
 }
 
-/* A version of gem_create_in_memory_region_list which can be allowed to
-   fail so that the object creation can be retried */
-int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
-				       const struct drm_i915_gem_memory_class_instance *mem_regions,
-				       int num_regions)
+/* A version of __gem_create_in_memory_region_list where additional extensions
+   can be appended. */
+int __gem_create_in_memory_region_list_ext(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+					   const struct drm_i915_gem_memory_class_instance *mem_regions,
+					   int num_regions, uint64_t ext)
 {
 	struct drm_i915_gem_create_ext_memory_regions ext_regions = {
 		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
@@ -194,6 +194,9 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 	};
 	int ret;
 
+	if (ext)
+		ext_regions.base.next_extension = ext;
+
 	ret = __gem_create_ext(fd, size, flags, handle, &ext_regions.base);
 	if (flags && ret == -EINVAL)
 		ret = __gem_create_ext(fd, size, 0, handle, &ext_regions.base);
@@ -213,6 +216,16 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 	return ret;
 }
 
+/* A version of gem_create_in_memory_region_list which can be allowed to
+   fail so that the object creation can be retried */
+int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+				       const struct drm_i915_gem_memory_class_instance *mem_regions,
+				       int num_regions)
+{
+	return __gem_create_in_memory_region_list_ext(fd, handle, size, flags,
+						      mem_regions, num_regions, 0);
+}
+
 /* gem_create_in_memory_region_list:
  * @fd: opened i915 drm file descriptor
  * @size: requested size of the buffer
@@ -230,6 +243,31 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 	return handle;
 }
 
+/* gem_create_vm_private_in_memory_region_list:
+ * @fd: opened i915 drm file descriptor
+ * @size: requested size of the buffer
+ * @flags: associated flags
+ * @vm_id: vm_id for VM private Objects.
+ * @mem_regions: memory regions array (priority list)
+ * @num_regions: @mem_regions length
+ */
+uint32_t gem_create_vm_private_in_memory_region_list(int fd, uint64_t size, uint32_t flags, uint32_t vm_id,
+						     const struct drm_i915_gem_memory_class_instance *mem_regions,
+						     int num_regions)
+{
+	struct drm_i915_gem_create_ext_vm_private vm_priv = {
+		.base = { .name = I915_GEM_CREATE_EXT_VM_PRIVATE },
+		.vm_id = vm_id,
+	};
+	uint32_t handle;
+
+	int ret = __gem_create_in_memory_region_list_ext(fd, &handle, &size, flags,
+							 mem_regions, num_regions,
+							 to_user_pointer(&vm_priv));
+	igt_assert_eq(ret, 0);
+	return handle;
+}
+
 static bool __region_belongs_to_regions_type(struct drm_i915_gem_memory_class_instance region,
 					     uint32_t *mem_regions_type,
 					     int num_regions)
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 425bda0ec7..38a4a08aca 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -63,6 +63,9 @@ unsigned int gem_get_lmem_region_count(int fd);
 
 bool gem_has_lmem(int fd);
 
+int __gem_create_in_memory_region_list_ext(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
+					   const struct drm_i915_gem_memory_class_instance *mem_regions,
+					   int num_regions, uint64_t ext);
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
 				       const struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions);
@@ -70,6 +73,9 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
 uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 					  const struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions);
+uint32_t gem_create_vm_private_in_memory_region_list(int fd, uint64_t size, uint32_t flags, uint32_t vm_id,
+						     const struct drm_i915_gem_memory_class_instance *mem_regions,
+						     int num_regions);
 
 /*
  * XXX: the whole converting to class_instance thing is meant as a temporary
@@ -95,6 +101,16 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 	gem_create_in_memory_region_list(fd, size, 0, arr_query__, ARRAY_SIZE(arr_query__)); \
 })
 
+#define __gem_create_in_memory_regions_ext(fd, handle, size, ext, regions...) ({ \
+	unsigned int arr__[] = { regions }; \
+	struct drm_i915_gem_memory_class_instance arr_query__[ARRAY_SIZE(arr__)]; \
+	for (int i__  = 0; i__ < ARRAY_SIZE(arr_query__); ++i__) { \
+		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]);  \
+		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]);  \
+	} \
+	__gem_create_in_memory_region_list_ext(fd, handle, size, 0, arr_query__, ARRAY_SIZE(arr_query__), ext); \
+})
+
 /*
  * Create an object that requires CPU access. This only becomes interesting on
  * platforms that have a small BAR for LMEM CPU access. Without this the object
@@ -153,6 +169,15 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
 	} \
 	gem_create_in_memory_region_list(fd, size, ext_flags__, arr_query__, arr_query_size__); \
 })
+#define gem_create_vm_private_in_memory_regions(fd, size, vm_id, regions...) ({ \
+	unsigned int arr__[] = { regions };				\
+	struct drm_i915_gem_memory_class_instance arr_query__[ARRAY_SIZE(arr__)]; \
+	for (int i__  = 0; i__ < ARRAY_SIZE(arr_query__); ++i__) {	\
+		arr_query__[i__].memory_class = MEMORY_TYPE_FROM_REGION(arr__[i__]); \
+		arr_query__[i__].memory_instance = MEMORY_INSTANCE_FROM_REGION(arr__[i__]); \
+	} \
+	gem_create_vm_private_in_memory_region_list(fd, size, 0, vm_id, arr_query__, ARRAY_SIZE(arr_query__)); \
+})
 
 struct igt_collection *
 __get_memory_region_set(struct drm_i915_query_memory_regions *regions,
-- 
2.21.0.rc0.32.g243a4c7e27
