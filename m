Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA4F10E61A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 14:54:09 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 14:53:46 +0000
Message-Id: <20231116145348.7-12-francois.dugast@intel.com>
In-Reply-To: <20231116145348.7-1-francois.dugast@intel.com>
References: <20231116145348.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 11/13] drm-uapi/xe: Align on a common way to
 return arrays (gt)
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
arrays (gt)")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h                | 18 ++++----
 lib/xe/xe_query.c                        | 54 ++++++++++++------------
 lib/xe/xe_query.h                        |  8 ++--
 lib/xe/xe_spin.c                         |  6 +--
 tests/intel-ci/xe-fast-feedback.testlist |  2 +-
 tests/intel/xe_query.c                   | 30 ++++++-------
 6 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 61de386f5..ad4b3f9ae 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -356,14 +356,14 @@ struct drm_xe_query_config {
 };
 
 /**
- * struct drm_xe_query_gt - describe an individual GT.
+ * struct drm_xe_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gt_list, which will return a list with all the
+ * To be used with drm_xe_query_gt, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
  */
-struct drm_xe_query_gt {
+struct drm_xe_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
 #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
 	/** @type: GT type: Main or Media */
@@ -390,19 +390,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gt_list - A list with GT description items.
+ * struct drm_xe_query_gt - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
- * drm_xe_query_gt_list in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT, then the reply uses struct
+ * drm_xe_query_gt in .data.
  */
-struct drm_xe_query_gt_list {
+struct drm_xe_query_gt {
 	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
 	/** @gt_list: The GT list returned for this device */
-	struct drm_xe_query_gt gt_list[];
+	struct drm_xe_gt gt_list[];
 };
 
 /**
@@ -495,7 +495,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
 #define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
-#define DRM_XE_DEVICE_QUERY_GT_LIST		3
+#define DRM_XE_DEVICE_QUERY_GT			3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 4aeeee928..01b5cc715 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -39,35 +39,35 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	return config;
 }
 
-static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
+static struct drm_xe_query_gt *xe_query_gt_new(int fd)
 {
-	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_query_gt *gt;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.query = DRM_XE_DEVICE_QUERY_GT,
 		.size = 0,
 		.data = 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	gt_list = malloc(query.size);
-	igt_assert(gt_list);
+	gt = malloc(query.size);
+	igt_assert(gt);
 
-	query.data = to_user_pointer(gt_list);
+	query.data = to_user_pointer(gt);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	return gt_list;
+	return gt;
 }
 
-static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
+static uint64_t __memory_regions(const struct drm_xe_query_gt *gt)
 {
 	uint64_t regions = 0;
 	int i;
 
-	for (i = 0; i < gt_list->num_gt; i++)
-		regions |= gt_list->gt_list[i].near_mem_regions |
-			   gt_list->gt_list[i].far_mem_regions;
+	for (i = 0; i < gt->num_gt; i++)
+		regions |= gt->gt_list[i].near_mem_regions |
+			   gt->gt_list[i].far_mem_regions;
 
 	return regions;
 }
@@ -118,7 +118,7 @@ static struct drm_xe_query_mem_region *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
-static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
+static uint64_t native_region_for_gt(const struct drm_xe_query_gt *gt_list, int gt)
 {
 	uint64_t region;
 
@@ -130,7 +130,7 @@ static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list,
 }
 
 static uint64_t gt_vram_size(const struct drm_xe_query_mem_region *mem_regions,
-			     const struct drm_xe_query_gt_list *gt_list, int gt)
+			     const struct drm_xe_query_gt *gt_list, int gt)
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
@@ -141,7 +141,7 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_region *mem_regions,
 }
 
 static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_region *mem_regions,
-				     const struct drm_xe_query_gt_list *gt_list, int gt)
+				     const struct drm_xe_query_gt *gt_list, int gt)
 {
 	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
@@ -220,7 +220,7 @@ static struct xe_device *find_in_cache(int fd)
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
-	free(xe_dev->gt_list);
+	free(xe_dev->gt);
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
@@ -251,18 +251,18 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->config = xe_query_config_new(fd);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gt_list = xe_query_gt_list_new(fd);
-	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
+	xe_dev->gt = xe_query_gt_new(fd);
+	xe_dev->memory_regions = __memory_regions(xe_dev->gt);
 	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
-	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
-	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
+	xe_dev->vram_size = calloc(xe_dev->gt->num_gt, sizeof(*xe_dev->vram_size));
+	xe_dev->visible_vram_size = calloc(xe_dev->gt->num_gt, sizeof(*xe_dev->visible_vram_size));
+	for (int gt = 0; gt < xe_dev->gt->num_gt; gt++) {
 		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
-						     xe_dev->gt_list, gt);
+						     xe_dev->gt, gt);
 		xe_dev->visible_vram_size[gt] =
 			gt_visible_vram_size(xe_dev->mem_regions,
-					     xe_dev->gt_list, gt);
+					     xe_dev->gt, gt);
 	}
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
@@ -355,9 +355,9 @@ _TYPE _NAME(int fd)			\
  * xe_number_gt:
  * @fd: xe device fd
  *
- * Return number of gt_list for xe device fd.
+ * Return number of gt for xe device fd.
  */
-xe_dev_FN(xe_number_gt, gt_list->num_gt, unsigned int);
+xe_dev_FN(xe_number_gt, gt->num_gt, unsigned int);
 
 /**
  * all_memory_regions:
@@ -393,9 +393,9 @@ uint64_t vram_memory(int fd, int gt)
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(gt >= 0 && gt < xe_dev->gt_list->num_gt);
+	igt_assert(gt >= 0 && gt < xe_dev->gt->num_gt);
 
-	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
+	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt, gt) : 0;
 }
 
 static uint64_t __xe_visible_vram_size(int fd, int gt)
@@ -599,7 +599,7 @@ uint64_t xe_vram_available(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
+	region_idx = ffs(native_region_for_gt(xe_dev->gt, gt)) - 1;
 	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 1c76b0caf..b65b442f4 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -26,8 +26,8 @@ struct xe_device {
 	/** @config: xe configuration */
 	struct drm_xe_query_config *config;
 
-	/** @gt_list: gt info */
-	struct drm_xe_query_gt_list *gt_list;
+	/** @gt: gt info */
+	struct drm_xe_query_gt *gt;
 
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
@@ -41,10 +41,10 @@ struct xe_device {
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_region *mem_regions;
 
-	/** @vram_size: array of vram sizes for all gt_list */
+	/** @vram_size: array of vram sizes for all gt */
 	uint64_t *vram_size;
 
-	/** @visible_vram_size: array of visible vram sizes for all gt_list */
+	/** @visible_vram_size: array of visible vram sizes for all gt */
 	uint64_t *visible_vram_size;
 
 	/** @default_alignment: safe alignment regardless region location */
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 91bc6664d..20021f5ee 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -20,10 +20,10 @@ static uint32_t read_timestamp_frequency(int fd, int gt_id)
 {
 	struct xe_device *dev = xe_device_get(fd);
 
-	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
+	igt_assert(dev && dev->gt && dev->gt->num_gt);
+	igt_assert(gt_id >= 0 && gt_id <= dev->gt->num_gt);
 
-	return dev->gt_list->gt_list[gt_id].clock_freq;
+	return dev->gt->gt_list[gt_id].clock_freq;
 }
 
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f11761ac8..530280720 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -116,7 +116,7 @@ igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
-igt@xe_query@query-gt-list
+igt@xe_query@query-gt
 igt@xe_query@query-config
 igt@xe_query@query-hwconfig
 igt@xe_query@query-topology
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 562ee2736..b79e9ea48 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -252,17 +252,17 @@ test_query_mem_regions(int fd)
 }
 
 /**
- * SUBTEST: query-gt-list
+ * SUBTEST: query-gt
  * Test category: functionality test
  * Description: Display information about available GT components for xe device.
  */
 static void
-test_query_gt_list(int fd)
+test_query_gt(int fd)
 {
-	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_query_gt *gt;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.query = DRM_XE_DEVICE_QUERY_GT,
 		.size = 0,
 		.data = 0,
 	};
@@ -271,20 +271,20 @@ test_query_gt_list(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
-	gt_list = malloc(query.size);
-	igt_assert(gt_list);
+	gt = malloc(query.size);
+	igt_assert(gt);
 
-	query.data = to_user_pointer(gt_list);
+	query.data = to_user_pointer(gt);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < gt_list->num_gt; i++) {
-		igt_info("type: %d\n", gt_list->gt_list[i].type);
-		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
-		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
+	for (i = 0; i < gt->num_gt; i++) {
+		igt_info("type: %d\n", gt->gt_list[i].type);
+		igt_info("gt_id: %d\n", gt->gt_list[i].gt_id);
+		igt_info("clock_freq: %u\n", gt->gt_list[i].clock_freq);
 		igt_info("near_mem_regions: 0x%016llx\n",
-		       gt_list->gt_list[i].near_mem_regions);
+		       gt->gt_list[i].near_mem_regions);
 		igt_info("far_mem_regions: 0x%016llx\n",
-		       gt_list->gt_list[i].far_mem_regions);
+		       gt->gt_list[i].far_mem_regions);
 	}
 }
 
@@ -671,8 +671,8 @@ igt_main
 	igt_subtest("query-mem-usage")
 		test_query_mem_regions(xe);
 
-	igt_subtest("query-gt-list")
-		test_query_gt_list(xe);
+	igt_subtest("query-gt")
+		test_query_gt(xe);
 
 	igt_subtest("query-config")
 		test_query_config(xe);
-- 
2.34.1
