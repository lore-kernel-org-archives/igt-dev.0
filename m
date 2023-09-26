Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2810E3E2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:23 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:43 +0000
Message-Id: <20230926130054.6-14-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 13/24] drm-uapi/xe: Rename gts to gt_list
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

Align with commit ("drm/xe/uapi: Rename gts to gt_list")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h                | 18 ++++----
 lib/xe/xe_query.c                        | 52 ++++++++++++------------
 lib/xe/xe_query.h                        | 10 ++---
 lib/xe/xe_spin.c                         |  6 +--
 tests/intel-ci/xe-fast-feedback.testlist |  2 +-
 tests/intel/xe_query.c                   | 36 ++++++++--------
 6 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a6773c244..a0310dbe0 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -340,7 +340,7 @@ struct drm_xe_query_config {
 /**
  * struct drm_xe_query_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gts, which will return a list with all the
+ * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
@@ -377,19 +377,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gts - describe GTs
+ * struct drm_xe_query_gt_list - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
- * drm_xe_query_gts in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
+ * drm_xe_query_gt_list in .data.
  */
-struct drm_xe_query_gts {
-	/** @num_gt: number of GTs returned in gts */
+struct drm_xe_query_gt_list {
+	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @gts: The GT list returned for this device */
-	struct drm_xe_query_gt gts[];
+	/** @gt_list: The GT list returned for this device */
+	struct drm_xe_query_gt gt_list[];
 };
 
 /**
@@ -482,7 +482,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
+#define DRM_XE_DEVICE_QUERY_GT_LIST	3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
 #define DRM_XE_QUERY_CS_CYCLES		6
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ab7b31188..986a3a0c1 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -39,35 +39,35 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	return config;
 }
 
-static struct drm_xe_query_gts *xe_query_gts_new(int fd)
+static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 {
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
 		.size = 0,
 		.data = 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	gts = malloc(query.size);
-	igt_assert(gts);
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
 
-	query.data = to_user_pointer(gts);
+	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	return gts;
+	return gt_list;
 }
 
-static uint64_t __memory_regions(const struct drm_xe_query_gts *gts)
+static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 {
 	uint64_t regions = 0;
 	int i;
 
-	for (i = 0; i < gts->num_gt; i++)
-		regions |= gts->gts[i].native_mem_regions |
-			   gts->gts[i].slow_mem_regions;
+	for (i = 0; i < gt_list->num_gt; i++)
+		regions |= gt_list->gt_list[i].native_mem_regions |
+			   gt_list->gt_list[i].slow_mem_regions;
 
 	return regions;
 }
@@ -118,21 +118,21 @@ static struct drm_xe_query_mem_usage *xe_query_mem_usage_new(int fd)
 	return mem_usage;
 }
 
-static uint64_t native_region_for_gt(const struct drm_xe_query_gts *gts, int gt)
+static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
 {
 	uint64_t region;
 
-	igt_assert(gts->num_gt > gt);
-	region = gts->gts[gt].native_mem_regions;
+	igt_assert(gt_list->num_gt > gt);
+	region = gt_list->gt_list[gt].native_mem_regions;
 	igt_assert(region);
 
 	return region;
 }
 
 static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
-			     const struct drm_xe_query_gts *gts, int gt)
+			     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
+	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
 		return mem_usage->regions[region_idx].total_size;
@@ -141,9 +141,9 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
 }
 
 static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
-				     const struct drm_xe_query_gts *gts, int gt)
+				     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
+	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
 		return mem_usage->regions[region_idx].cpu_visible_size;
@@ -220,7 +220,7 @@ static struct xe_device *find_in_cache(int fd)
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
-	free(xe_dev->gts);
+	free(xe_dev->gt_list);
 	free(xe_dev->hw_engines);
 	free(xe_dev->mem_usage);
 	free(xe_dev->vram_size);
@@ -252,18 +252,18 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->number_gt = xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
 	xe_dev->va_bits = xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gts = xe_query_gts_new(fd);
-	xe_dev->memory_regions = __memory_regions(xe_dev->gts);
+	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
 	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->visible_vram_size));
 	for (int gt = 0; gt < xe_dev->number_gt; gt++) {
 		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
-						     xe_dev->gts, gt);
+						     xe_dev->gt_list, gt);
 		xe_dev->visible_vram_size[gt] =
 			gt_visible_vram_size(xe_dev->mem_usage,
-					     xe_dev->gts, gt);
+					     xe_dev->gt_list, gt);
 	}
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
@@ -356,7 +356,7 @@ _TYPE _NAME(int fd)			\
  * xe_number_gt:
  * @fd: xe device fd
  *
- * Return number of gts for xe device fd.
+ * Return number of gt_list for xe device fd.
  */
 xe_dev_FN(xe_number_gt, number_gt, unsigned int);
 
@@ -396,7 +396,7 @@ uint64_t vram_memory(int fd, int gt)
 	igt_assert(xe_dev);
 	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
 
-	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gts, gt) : 0;
+	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
 }
 
 static uint64_t __xe_visible_vram_size(int fd, int gt)
@@ -647,7 +647,7 @@ uint64_t xe_vram_available(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	region_idx = ffs(native_region_for_gt(xe_dev->gts, gt)) - 1;
+	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
 	mem_region = &xe_dev->mem_usage->regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 20dbfa12c..da7deaf4c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -26,13 +26,13 @@ struct xe_device {
 	/** @config: xe configuration */
 	struct drm_xe_query_config *config;
 
-	/** @gts: gt info */
-	struct drm_xe_query_gts *gts;
+	/** @gt_list: gt info */
+	struct drm_xe_query_gt_list *gt_list;
 
 	/** @number_gt: number of gt */
 	unsigned int number_gt;
 
-	/** @gts: bitmask of all memory regions */
+	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
 	/** @hw_engines: array of hardware engines */
@@ -44,10 +44,10 @@ struct xe_device {
 	/** @mem_usage: regions memory information and usage */
 	struct drm_xe_query_mem_usage *mem_usage;
 
-	/** @vram_size: array of vram sizes for all gts */
+	/** @vram_size: array of vram sizes for all gt_list */
 	uint64_t *vram_size;
 
-	/** @visible_vram_size: array of visible vram sizes for all gts */
+	/** @visible_vram_size: array of visible vram sizes for all gt_list */
 	uint64_t *visible_vram_size;
 
 	/** @default_alignment: safe alignment regardless region location */
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index f0d77aed3..b05b38829 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -20,10 +20,10 @@ static uint32_t read_timestamp_frequency(int fd, int gt_id)
 {
 	struct xe_device *dev = xe_device_get(fd);
 
-	igt_assert(dev && dev->gts && dev->gts->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gts->num_gt);
+	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
+	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
 
-	return dev->gts->gts[gt_id].clock_freq;
+	return dev->gt_list->gt_list[gt_id].clock_freq;
 }
 
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a9fe43b08..0cf28baf9 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -147,7 +147,7 @@ igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
-igt@xe_query@query-gts
+igt@xe_query@query-gt-list
 igt@xe_query@query-config
 igt@xe_query@query-hwconfig
 igt@xe_query@query-topology
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 3aa2918f0..e0d14966b 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -252,17 +252,17 @@ test_query_mem_usage(int fd)
 }
 
 /**
- * SUBTEST: query-gts
+ * SUBTEST: query-gt-list
  * Test category: functionality test
- * Description: Display information about available GTs for xe device.
+ * Description: Display information about available GT components for xe device.
  */
 static void
-test_query_gts(int fd)
+test_query_gt_list(int fd)
 {
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GTS,
+		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
 		.size = 0,
 		.data = 0,
 	};
@@ -271,29 +271,29 @@ test_query_gts(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
-	gts = malloc(query.size);
-	igt_assert(gts);
+	gt_list = malloc(query.size);
+	igt_assert(gt_list);
 
-	query.data = to_user_pointer(gts);
+	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	for (i = 0; i < gts->num_gt; i++) {
-		igt_info("type: %d\n", gts->gts[i].type);
-		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
-		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
+	for (i = 0; i < gt_list->num_gt; i++) {
+		igt_info("type: %d\n", gt_list->gt_list[i].type);
+		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
+		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
 		igt_info("native_mem_regions: 0x%016llx\n",
-		       gts->gts[i].native_mem_regions);
+		       gt_list->gt_list[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
-		       gts->gts[i].slow_mem_regions);
+		       gt_list->gt_list[i].slow_mem_regions);
 		igt_info("inaccessible_mem_regions: 0x%016llx\n",
-		       gts->gts[i].inaccessible_mem_regions);
+		       gt_list->gt_list[i].inaccessible_mem_regions);
 	}
 }
 
 /**
  * SUBTEST: query-topology
  * Test category: functionality test
- * Description: Display topology information of GTs.
+ * Description: Display topology information of GT.
  */
 static void
 test_query_gt_topology(int fd)
@@ -682,8 +682,8 @@ igt_main
 	igt_subtest("query-mem-usage")
 		test_query_mem_usage(xe);
 
-	igt_subtest("query-gts")
-		test_query_gts(xe);
+	igt_subtest("query-gt-list")
+		test_query_gt_list(xe);
 
 	igt_subtest("query-config")
 		test_query_config(xe);
-- 
2.34.1
