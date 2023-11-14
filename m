Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3117210E443
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:46 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:23 +0000
Message-Id: <20231114134426.7-6-francois.dugast@intel.com>
In-Reply-To: <20231114134426.7-1-francois.dugast@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 5/8] drm-uapi/xe: Rename query's mem_usage to
 mem_regions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with kernel's commit ("drm/xe/uapi: Rename query's mem_usage to mem_regions")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 14 ++++-----
 lib/xe/xe_query.c         | 66 +++++++++++++++++++--------------------
 lib/xe/xe_query.h         |  4 +--
 tests/intel/xe_pm.c       | 18 +++++------
 tests/intel/xe_query.c    | 58 +++++++++++++++++-----------------
 5 files changed, 80 insertions(+), 80 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 621d6c0e3..ec37f6811 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -291,13 +291,13 @@ struct drm_xe_query_engine_cycles {
 };
 
 /**
- * struct drm_xe_query_mem_usage - describe memory regions and usage
+ * struct drm_xe_query_mem_regions - describe memory regions
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_MEM_USAGE, then the reply uses
- * struct drm_xe_query_mem_usage in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_MEM_REGIONS, then the reply uses
+ * struct drm_xe_query_mem_regions in .data.
  */
-struct drm_xe_query_mem_usage {
+struct drm_xe_query_mem_regions {
 	/** @num_regions: number of memory regions returned in @regions */
 	__u32 num_regions;
 	/** @pad: MBZ */
@@ -350,12 +350,12 @@ struct drm_xe_query_gt {
 	__u32 clock_freq;
 	/**
 	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is near the current engines of this GT.
+	 * drm_xe_query_mem_regions that is near the current engines of this GT.
 	 */
 	__u64 near_mem_regions;
 	/**
 	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is far from the engines of this GT.
+	 * drm_xe_query_mem_regions that is far from the engines of this GT.
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
@@ -469,7 +469,7 @@ struct drm_xe_device_query {
 	__u64 extensions;
 
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
-#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
+#define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c33bfd432..afd443be3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -97,25 +97,25 @@ xe_query_engines_new(int fd, unsigned int *num_engines)
 	return hw_engines;
 }
 
-static struct drm_xe_query_mem_usage *xe_query_mem_usage_new(int fd)
+static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 {
-	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_query_mem_regions *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
 		.size = 0,
 		.data = 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	mem_usage = malloc(query.size);
-	igt_assert(mem_usage);
+	mem_regions = malloc(query.size);
+	igt_assert(mem_regions);
 
-	query.data = to_user_pointer(mem_usage);
+	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	return mem_usage;
+	return mem_regions;
 }
 
 static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
@@ -129,44 +129,44 @@ static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list,
 	return region;
 }
 
-static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
+static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 			     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
-	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
-		return mem_usage->regions[region_idx].total_size;
+	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
+		return mem_regions->regions[region_idx].total_size;
 
 	return 0;
 }
 
-static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
+static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 				     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
-	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
-		return mem_usage->regions[region_idx].cpu_visible_size;
+	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
+		return mem_regions->regions[region_idx].cpu_visible_size;
 
 	return 0;
 }
 
-static bool __mem_has_vram(struct drm_xe_query_mem_usage *mem_usage)
+static bool __mem_has_vram(struct drm_xe_query_mem_regions *mem_regions)
 {
-	for (int i = 0; i < mem_usage->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&mem_usage->regions[i]))
+	for (int i = 0; i < mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
 			return true;
 
 	return false;
 }
 
-static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage)
+static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_regions)
 {
 	uint32_t alignment = XE_DEFAULT_ALIGNMENT;
 
-	for (int i = 0; i < mem_usage->num_regions; i++)
-		if (alignment < mem_usage->regions[i].min_page_size)
-			alignment = mem_usage->regions[i].min_page_size;
+	for (int i = 0; i < mem_regions->num_regions; i++)
+		if (alignment < mem_regions->regions[i].min_page_size)
+			alignment = mem_regions->regions[i].min_page_size;
 
 	return alignment;
 }
@@ -222,7 +222,7 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->config);
 	free(xe_dev->gt_list);
 	free(xe_dev->hw_engines);
-	free(xe_dev->mem_usage);
+	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
 	free(xe_dev);
 }
@@ -254,18 +254,18 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
-	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
+	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
-		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
+		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
 						     xe_dev->gt_list, gt);
 		xe_dev->visible_vram_size[gt] =
-			gt_visible_vram_size(xe_dev->mem_usage,
+			gt_visible_vram_size(xe_dev->mem_regions,
 					     xe_dev->gt_list, gt);
 	}
-	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
-	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
+	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
+	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
 
 	/* We may get here from multiple threads, use first cached xe_dev */
 	pthread_mutex_lock(&cache.cache_mutex);
@@ -508,9 +508,9 @@ struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(xe_dev->mem_usage->num_regions > region_idx);
+	igt_assert(xe_dev->mem_regions->num_regions > region_idx);
 
-	return &xe_dev->mem_usage->regions[region_idx];
+	return &xe_dev->mem_regions->regions[region_idx];
 }
 
 /**
@@ -641,23 +641,23 @@ uint64_t xe_vram_available(int fd, int gt)
 	struct xe_device *xe_dev;
 	int region_idx;
 	struct drm_xe_query_mem_region *mem_region;
-	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_query_mem_regions *mem_regions;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
 	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
-	mem_region = &xe_dev->mem_usage->regions[region_idx];
+	mem_region = &xe_dev->mem_regions->regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
 		uint64_t available_vram;
 
-		mem_usage = xe_query_mem_usage_new(fd);
+		mem_regions = xe_query_mem_regions_new(fd);
 		pthread_mutex_lock(&cache.cache_mutex);
-		mem_region->used = mem_usage->regions[region_idx].used;
+		mem_region->used = mem_regions->regions[region_idx].used;
 		available_vram = mem_region->total_size - mem_region->used;
 		pthread_mutex_unlock(&cache.cache_mutex);
-		free(mem_usage);
+		free(mem_regions);
 
 		return available_vram;
 	}
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 3d7e22a9b..38e9aa440 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -36,8 +36,8 @@ struct xe_device {
 	/** @number_hw_engines: length of hardware engines array */
 	unsigned int number_hw_engines;
 
-	/** @mem_usage: regions memory information and usage */
-	struct drm_xe_query_mem_usage *mem_usage;
+	/** @mem_regions: regions memory information and usage */
+	struct drm_xe_query_mem_regions *mem_regions;
 
 	/** @vram_size: array of vram sizes for all gt_list */
 	uint64_t *vram_size;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 18afb68b0..9423984cc 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -372,10 +372,10 @@ NULL));
  */
 static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 {
-	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_query_mem_regions *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
 		.size = 0,
 		.data = 0,
 	};
@@ -393,16 +393,16 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
-	mem_usage = malloc(query.size);
-	igt_assert(mem_usage);
+	mem_regions = malloc(query.size);
+	igt_assert(mem_regions);
 
-	query.data = to_user_pointer(mem_usage);
+	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < mem_usage->num_regions; i++) {
-		if (mem_usage->regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
-			vram_used_mb +=  (mem_usage->regions[i].used / (1024 * 1024));
-			vram_total_mb += (mem_usage->regions[i].total_size / (1024 * 1024));
+	for (i = 0; i < mem_regions->num_regions; i++) {
+		if (mem_regions->regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
+			vram_used_mb +=  (mem_regions->regions[i].used / (1024 * 1024));
+			vram_total_mb += (mem_regions->regions[i].total_size / (1024 * 1024));
 		}
 	}
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index b960ccfa2..5860add0b 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -198,12 +198,12 @@ test_query_engines(int fd)
  *	and alignment.
  */
 static void
-test_query_mem_usage(int fd)
+test_query_mem_regions(int fd)
 {
-	struct drm_xe_query_mem_usage *mem_usage;
+	struct drm_xe_query_mem_regions *mem_regions;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
 		.size = 0,
 		.data = 0,
 	};
@@ -212,43 +212,43 @@ test_query_mem_usage(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
-	mem_usage = malloc(query.size);
-	igt_assert(mem_usage);
+	mem_regions = malloc(query.size);
+	igt_assert(mem_regions);
 
-	query.data = to_user_pointer(mem_usage);
+	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < mem_usage->num_regions; i++) {
+	for (i = 0; i < mem_regions->num_regions; i++) {
 		igt_info("mem region %d: %s\t%#llx / %#llx\n", i,
-			mem_usage->regions[i].mem_class ==
+			mem_regions->regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_SYSMEM ? "SYSMEM"
-			:mem_usage->regions[i].mem_class ==
+			:mem_regions->regions[i].mem_class ==
 			DRM_XE_MEM_REGION_CLASS_VRAM ? "VRAM" : "?",
-			mem_usage->regions[i].used,
-			mem_usage->regions[i].total_size
+			mem_regions->regions[i].used,
+			mem_regions->regions[i].total_size
 		);
 		igt_info("min_page_size=0x%x\n",
-		       mem_usage->regions[i].min_page_size);
+		       mem_regions->regions[i].min_page_size);
 
 		igt_info("visible size=%lluMiB\n",
-			 mem_usage->regions[i].cpu_visible_size >> 20);
+			 mem_regions->regions[i].cpu_visible_size >> 20);
 		igt_info("visible used=%lluMiB\n",
-			 mem_usage->regions[i].cpu_visible_used >> 20);
-
-		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_size,
-				   mem_usage->regions[i].total_size);
-		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
-				   mem_usage->regions[i].cpu_visible_size);
-		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
-				   mem_usage->regions[i].used);
-		igt_assert_lte_u64(mem_usage->regions[i].used,
-				   mem_usage->regions[i].total_size);
-		igt_assert_lte_u64(mem_usage->regions[i].used -
-				   mem_usage->regions[i].cpu_visible_used,
-				   mem_usage->regions[i].total_size);
+			 mem_regions->regions[i].cpu_visible_used >> 20);
+
+		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_size,
+				   mem_regions->regions[i].total_size);
+		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
+				   mem_regions->regions[i].cpu_visible_size);
+		igt_assert_lte_u64(mem_regions->regions[i].cpu_visible_used,
+				   mem_regions->regions[i].used);
+		igt_assert_lte_u64(mem_regions->regions[i].used,
+				   mem_regions->regions[i].total_size);
+		igt_assert_lte_u64(mem_regions->regions[i].used -
+				   mem_regions->regions[i].cpu_visible_used,
+				   mem_regions->regions[i].total_size);
 	}
-	dump_hex_debug(mem_usage, query.size);
-	free(mem_usage);
+	dump_hex_debug(mem_regions, query.size);
+	free(mem_regions);
 }
 
 /**
@@ -669,7 +669,7 @@ igt_main
 		test_query_engines(xe);
 
 	igt_subtest("query-mem-usage")
-		test_query_mem_usage(xe);
+		test_query_mem_regions(xe);
 
 	igt_subtest("query-gt-list")
 		test_query_gt_list(xe);
-- 
2.34.1
