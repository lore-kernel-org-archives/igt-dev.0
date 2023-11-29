Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E0110E612
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:19 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:47 +0000
Message-Id: <20231129145457.7-11-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 10/20] drm-uapi/xe: Align on a common way to
 return arrays (memory regions)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Align on a common way to return
arrays (memory regions)")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h   | 12 +++++------
 lib/xe/xe_query.c           | 32 ++++++++++++++---------------
 lib/xe/xe_query.h           |  2 +-
 lib/xe/xe_util.c            |  6 +++---
 tests/intel/xe_create.c     |  2 +-
 tests/intel/xe_drm_fdinfo.c |  8 ++++----
 tests/intel/xe_pm.c         |  8 ++++----
 tests/intel/xe_query.c      | 40 ++++++++++++++++++-------------------
 tests/kms_plane.c           |  2 +-
 9 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 4b944b32a..a6dc63c21 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -182,10 +182,10 @@ enum drm_xe_memory_class {
 };
 
 /**
- * struct drm_xe_query_mem_region - Describes some region as known to
+ * struct drm_xe_mem_region - Describes some region as known to
  * the driver.
  */
-struct drm_xe_query_mem_region {
+struct drm_xe_mem_region {
 	/**
 	 * @mem_class: The memory class describing this region.
 	 *
@@ -322,12 +322,12 @@ struct drm_xe_query_engine_cycles {
  * struct drm_xe_query_mem_regions in .data.
  */
 struct drm_xe_query_mem_regions {
-	/** @num_regions: number of memory regions returned in @regions */
-	__u32 num_regions;
+	/** @num_mem_regions: number of memory regions returned in @mem_regions */
+	__u32 num_mem_regions;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @regions: The returned regions for this device */
-	struct drm_xe_query_mem_region regions[];
+	/** @mem_regions: The returned memory regions for this device */
+	struct drm_xe_mem_region mem_regions[];
 };
 
 /**
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index f9dec1f7a..d00051bd9 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -134,8 +134,8 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
-	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
-		return mem_regions->regions[region_idx].total_size;
+	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
+		return mem_regions->mem_regions[region_idx].total_size;
 
 	return 0;
 }
@@ -145,16 +145,16 @@ static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
-	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
-		return mem_regions->regions[region_idx].cpu_visible_size;
+	if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[region_idx]))
+		return mem_regions->mem_regions[region_idx].cpu_visible_size;
 
 	return 0;
 }
 
 static bool __mem_has_vram(struct drm_xe_query_mem_regions *mem_regions)
 {
-	for (int i = 0; i < mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
+	for (int i = 0; i < mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[i]))
 			return true;
 
 	return false;
@@ -164,9 +164,9 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
 {
 	uint32_t alignment = XE_DEFAULT_ALIGNMENT;
 
-	for (int i = 0; i < mem_regions->num_regions; i++)
-		if (alignment < mem_regions->regions[i].min_page_size)
-			alignment = mem_regions->regions[i].min_page_size;
+	for (int i = 0; i < mem_regions->num_mem_regions; i++)
+		if (alignment < mem_regions->mem_regions[i].min_page_size)
+			alignment = mem_regions->mem_regions[i].min_page_size;
 
 	return alignment;
 }
@@ -454,16 +454,16 @@ struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
  *
  * Returns memory region structure for @region mask.
  */
-struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
+struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region)
 {
 	struct xe_device *xe_dev;
 	int region_idx = ffs(region) - 1;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(xe_dev->mem_regions->num_regions > region_idx);
+	igt_assert(xe_dev->mem_regions->num_mem_regions > region_idx);
 
-	return &xe_dev->mem_regions->regions[region_idx];
+	return &xe_dev->mem_regions->mem_regions[region_idx];
 }
 
 /**
@@ -501,7 +501,7 @@ const char *xe_region_name(uint64_t region)
  */
 uint16_t xe_region_class(int fd, uint64_t region)
 {
-	struct drm_xe_query_mem_region *memreg;
+	struct drm_xe_mem_region *memreg;
 
 	memreg = xe_mem_region(fd, region);
 
@@ -593,21 +593,21 @@ uint64_t xe_vram_available(int fd, int gt)
 {
 	struct xe_device *xe_dev;
 	int region_idx;
-	struct drm_xe_query_mem_region *mem_region;
+	struct drm_xe_mem_region *mem_region;
 	struct drm_xe_query_mem_regions *mem_regions;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
 	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
-	mem_region = &xe_dev->mem_regions->regions[region_idx];
+	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
 		uint64_t available_vram;
 
 		mem_regions = xe_query_mem_regions_new(fd);
 		pthread_mutex_lock(&cache.cache_mutex);
-		mem_region->used = mem_regions->regions[region_idx].used;
+		mem_region->used = mem_regions->mem_regions[region_idx].used;
 		available_vram = mem_region->total_size - mem_region->used;
 		pthread_mutex_unlock(&cache.cache_mutex);
 		free(mem_regions);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index fede00036..5862ecba6 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -83,7 +83,7 @@ uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
-struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
+struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 742e6333e..1bb52b142 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -10,7 +10,7 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
-static bool __region_belongs_to_regions_type(struct drm_xe_query_mem_region *region,
+static bool __region_belongs_to_regions_type(struct drm_xe_mem_region *region,
 					     uint32_t *mem_regions_type,
 					     int num_regions)
 {
@@ -23,7 +23,7 @@ static bool __region_belongs_to_regions_type(struct drm_xe_query_mem_region *reg
 struct igt_collection *
 __xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	struct igt_collection *set = NULL;
 	uint64_t memreg = all_memory_regions(xe), region;
 	int count = 0, pos = 0;
@@ -78,7 +78,7 @@ char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set)
 	igt_assert(name);
 
 	for_each_collection_data(data, set) {
-		struct drm_xe_query_mem_region *memreg;
+		struct drm_xe_mem_region *memreg;
 		int r;
 
 		region = data->value;
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 03feecd25..865cb9840 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -48,7 +48,7 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
  */
 static void create_invalid_size(int fd)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
 	uint32_t vm;
 	uint32_t handle;
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index cec3e0825..fc39649ea 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -42,7 +42,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo
 /* Subtests */
 static void test_active(int fd, struct drm_xe_query_engine_info *engine)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
 	struct drm_client_fdinfo info = { };
 	uint32_t vm;
@@ -169,7 +169,7 @@ static void test_active(int fd, struct drm_xe_query_engine_info *engine)
 
 static void test_shared(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	struct drm_gem_flink flink;
@@ -214,7 +214,7 @@ static void test_shared(int xe)
 
 static void test_total_resident(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	uint32_t vm;
@@ -262,7 +262,7 @@ static void test_total_resident(int xe)
 
 static void basic(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	unsigned int ret;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d78ca31a8..a8fc56e4b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -400,10 +400,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < mem_regions->num_regions; i++) {
-		if (mem_regions->regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
-			vram_used_mb +=  (mem_regions->regions[i].used / (1024 * 1024));
-			vram_total_mb += (mem_regions->regions[i].total_size / (1024 * 1024));
+	for (i = 0; i < mem_regions->num_mem_regions; i++) {
+		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
+			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
+			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
 		}
 	}
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 48042337a..207785a38 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -218,34 +218,34 @@ test_query_mem_regions(int fd)
 	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < mem_regions->num_regions; i++) {
+	for (i = 0; i < mem_regions->num_mem_regions; i++) {
 		igt_info("mem region %d: %s\t%#llx / %#llx\n", i,
-			mem_regions->regions[i].mem_class ==
+			mem_regions->mem_regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_SYSMEM ? "SYSMEM"
-			:mem_regions->regions[i].mem_class ==
+			:mem_regions->mem_regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_VRAM ? "VRAM" : "?",
-			mem_regions->regions[i].used,
-			mem_regions->regions[i].total_size
+			mem_regions->mem_regions[i].used,
+			mem_regions->mem_regions[i].total_size
 		);
 		igt_info("min_page_size=0x%x\n",
-		       mem_regions->regions[i].min_page_size);
+		       mem_regions->mem_regions[i].min_page_size);
 
 		igt_info("visible size=%lluMiB\n",
-			 mem_regions->regions[i].cpu_visible_size >> 20);
+			 mem_regions->mem_regions[i].cpu_visible_size >> 20);
 		igt_info("visible used=%lluMiB\n",
-			 mem_regions->regions[i].cpu_visible_used >> 20);
-
-		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_size,
-				   mem_regions->regions[i].total_size);
-		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
-				   mem_regions->regions[i].cpu_visible_size);
-		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
-				   mem_regions->regions[i].used);
-		igt_assert_lte_u64(mem_regions->regions[i].used,
-				   mem_regions->regions[i].total_size);
-		igt_assert_lte_u64(mem_regions->regions[i].used -
-				   mem_regions->regions[i].cpu_visible_used,
-				   mem_regions->regions[i].total_size);
+			 mem_regions->mem_regions[i].cpu_visible_used >> 20);
+
+		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_size,
+				   mem_regions->mem_regions[i].total_size);
+		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_used,
+				   mem_regions->mem_regions[i].cpu_visible_size);
+		igt_assert_lte_u64(mem_regions->mem_regions[i].cpu_visible_used,
+				   mem_regions->mem_regions[i].used);
+		igt_assert_lte_u64(mem_regions->mem_regions[i].used,
+				   mem_regions->mem_regions[i].total_size);
+		igt_assert_lte_u64(mem_regions->mem_regions[i].used -
+				   mem_regions->mem_regions[i].cpu_visible_used,
+				   mem_regions->mem_regions[i].total_size);
 	}
 	dump_hex_debug(mem_regions, query.size);
 	free(mem_regions);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index e50a94578..51ca082ae 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -467,7 +467,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
 	}
 
 	if (is_xe_device(data->drm_fd)) {
-		struct drm_xe_query_mem_region *memregion;
+		struct drm_xe_mem_region *memregion;
 		uint64_t memreg = all_memory_regions(data->drm_fd), region;
 
 		xe_for_each_mem_region(data->drm_fd, memreg, region) {
-- 
2.34.1
