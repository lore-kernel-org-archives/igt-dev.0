Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBFC10EA34
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:17 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:55 +0000
Message-Id: <20231103144359.7-61-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 60/64] drm-uapi/xe: Align on a common way to
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
 include/drm-uapi/xe_drm.h   | 38 ++++++++++----------
 lib/xe/xe_query.c           | 72 ++++++++++++++++++-------------------
 lib/xe/xe_query.h           |  4 +--
 lib/xe/xe_util.c            |  6 ++--
 tests/intel/xe_create.c     |  2 +-
 tests/intel/xe_drm_fdinfo.c |  8 ++---
 tests/intel/xe_pm.c         | 12 +++----
 tests/intel/xe_query.c      | 44 +++++++++++------------
 tests/kms_plane.c           |  2 +-
 9 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6acb39c7b..23beea9e9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -238,23 +238,23 @@ struct drm_xe_query_engine_info {
 
 	/**
 	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is near this engine.
+	 * drm_xe_query_mem_region that is near this engine.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u64 near_mem_regions;
 	/**
 	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is far from this engine.
+	 * drm_xe_query_mem_region that is far from this engine.
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u64 far_mem_regions;
 
@@ -277,10 +277,10 @@ enum drm_xe_memory_class {
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
@@ -355,19 +355,19 @@ struct drm_xe_query_mem_region {
 };
 
 /**
- * struct drm_xe_query_mem_regions - describe memory regions
+ * struct drm_xe_query_mem_region - describe memory regions
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
- * struct drm_xe_query_mem_regions in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_REGION, then the reply uses
+ * struct drm_xe_query_mem_region in .data.
  */
-struct drm_xe_query_mem_regions {
-	/** @num_regions: number of memory regions returned in @regions */
-	__u32 num_regions;
+struct drm_xe_query_mem_region {
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
@@ -652,7 +652,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
@@ -709,9 +709,9 @@ struct drm_xe_gem_create {
 	/**
 	 * @placement: A mask of memory instances of where GEM can be placed.
 	 * Each index in this mask refers directly to the struct
-	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * drm_xe_query_mem_region's instance, no assumptions should
 	 * be made about order. The type of each region is described
-	 * by struct drm_xe_query_mem_regions' mem_class.
+	 * by struct drm_xe_mem_region's mem_class.
 	 */
 	__u32 placement;
 
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 7fe3d2849..b3b38fe54 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -58,12 +58,12 @@ static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 	return gt_list;
 }
 
-static uint64_t __all_memory_regions(struct drm_xe_query_mem_regions *mem_regions)
+static uint64_t __all_memory_regions(struct drm_xe_query_mem_region *mem_regions)
 {
 	uint64_t regions = 0;
 
-	for (int i = 0; i < mem_regions->num_regions; i++)
-		regions |= 1 << mem_regions->regions[i].instance;
+	for (int i = 0; i < mem_regions->num_mem_regions; i++)
+		regions |= 1 << mem_regions->mem_regions[i].instance;
 
 	return regions;
 }
@@ -93,12 +93,12 @@ xe_query_engines(int fd, unsigned int *num_engines)
 	return engines;
 }
 
-static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
+static struct drm_xe_query_mem_region *xe_query_mem_regions_new(int fd)
 {
-	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_query_mem_region *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
 		.size = 0,
 		.data = 0,
 	};
@@ -125,22 +125,22 @@ static uint64_t mem_region_near_engine(struct drm_xe_query_engine_info *engine)
 	return region;
 }
 
-static bool __mem_has_vram(struct drm_xe_query_mem_regions *mem_regions)
+static bool __mem_has_vram(struct drm_xe_query_mem_region *mem_regions)
 {
-	for (int i = 0; i < mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
+	for (int i = 0; i < mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[i]))
 			return true;
 
 	return false;
 }
 
-static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_regions)
+static uint32_t __mem_default_alignment(struct drm_xe_query_mem_region *mem_regions)
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
@@ -358,9 +358,9 @@ uint64_t any_vram(int fd)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
-			return 1 << xe_dev->mem_regions->regions[i].instance;
+	for (int i = 0; i < xe_dev->mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->mem_regions[i]))
+			return 1 << xe_dev->mem_regions->mem_regions[i].instance;
 	return 0;
 }
 
@@ -441,16 +441,16 @@ struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
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
@@ -488,7 +488,7 @@ const char *xe_region_name(uint64_t region)
  */
 uint16_t xe_region_class(int fd, uint64_t region)
 {
-	struct drm_xe_query_mem_region *memreg;
+	struct drm_xe_mem_region *memreg;
 
 	memreg = xe_mem_region(fd, region);
 
@@ -544,9 +544,9 @@ uint64_t xe_vram_size_any_region(int fd)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
-			return xe_dev->mem_regions->regions[i].total_size;
+	for (int i = 0; i < xe_dev->mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->mem_regions[i]))
+			return xe_dev->mem_regions->mem_regions[i].total_size;
 
 	return 0;
 }
@@ -568,11 +568,11 @@ uint64_t xe_vram_size_region_near_tile(int fd, int tile)
 
 	xe_for_each_engine(fd, engine) {
 		if (tile == engine->tile_id)
-			for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-				if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
-				    ((1 << xe_dev->mem_regions->regions[i].instance) &
+			for (int i = 0; i < xe_dev->mem_regions->num_mem_regions; i++)
+				if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->mem_regions[i]) &&
+				    ((1 << xe_dev->mem_regions->mem_regions[i].instance) &
 				     mem_region_near_engine(engine)))
-					return xe_dev->mem_regions->regions[i].total_size;
+					return xe_dev->mem_regions->mem_regions[i].total_size;
 	}
 
 	return 0;
@@ -610,9 +610,9 @@ uint64_t xe_visible_vram_size_any_region(int fd)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
-			return xe_dev->mem_regions->regions[i].cpu_visible_size;
+	for (int i = 0; i < xe_dev->mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->mem_regions[i]))
+			return xe_dev->mem_regions->mem_regions[i].cpu_visible_size;
 
 	return 0;
 }
@@ -628,10 +628,10 @@ uint64_t xe_visible_vram_size_any_region(int fd)
  */
 uint64_t xe_vram_available_any_region(int fd)
 {
-	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_query_mem_region *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
 		.size = 0,
 		.data = 0,
 	};
@@ -645,10 +645,10 @@ uint64_t xe_vram_available_any_region(int fd)
 	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (int i = 0; i < mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
-			return mem_regions->regions[i].total_size -
-				mem_regions->regions[i].used;
+	for (int i = 0; i < mem_regions->num_mem_regions; i++)
+		if (XE_IS_CLASS_VRAM(&mem_regions->mem_regions[i]))
+			return mem_regions->mem_regions[i].total_size -
+				mem_regions->mem_regions[i].used;
 
 	return 0;
 }
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index bfe860390..7b99eec5e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -39,7 +39,7 @@ struct xe_device {
 	unsigned int number_engines;
 
 	/** @mem_regions: regions memory information and usage */
-	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_query_mem_region *mem_regions;
 
 	/** @default_alignment: safe alignment regardless region location */
 	uint32_t default_alignment;
@@ -82,7 +82,7 @@ uint64_t any_vram_if_possible(int fd);
 uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *engine);
 struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
-struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
+struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 62f00b305..cc8b26120 100644
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
index c70729ebd..edd8e2e43 100644
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
index e085dc307..03a724e9c 100644
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
@@ -171,7 +171,7 @@ static void test_active(int fd, struct drm_xe_query_engine_info *engine)
 
 static void test_shared(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	struct drm_gem_flink flink;
@@ -216,7 +216,7 @@ static void test_shared(int xe)
 
 static void test_total_resident(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	uint32_t vm;
@@ -264,7 +264,7 @@ static void test_total_resident(int xe)
 
 static void basic(int xe)
 {
-	struct drm_xe_query_mem_region *memregion;
+	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	unsigned int ret;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 5ca499915..2ae4237ea 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -375,10 +375,10 @@ NULL));
  */
 static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 {
-	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_query_mem_region *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
 		.size = 0,
 		.data = 0,
 	};
@@ -402,10 +402,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
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
index b595e978b..fd04f2b30 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -226,10 +226,10 @@ test_query_engines(int fd)
 static void
 test_query_mem_regions(int fd)
 {
-	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_query_mem_region *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGION,
 		.size = 0,
 		.data = 0,
 	};
@@ -244,34 +244,34 @@ test_query_mem_regions(int fd)
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
index 24df7e8ca..419d4e9be 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -458,7 +458,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
 	}
 
 	if (is_xe_device(data->drm_fd)) {
-		struct drm_xe_query_mem_region *memregion;
+		struct drm_xe_mem_region *memregion;
 		uint64_t memreg = all_memory_regions(data->drm_fd), region;
 
 		xe_for_each_mem_region(data->drm_fd, memreg, region) {
-- 
2.34.1
