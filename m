Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2A310EA11
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:18 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:56 +0000
Message-Id: <20231103144359.7-62-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 61/64] drm-uapi/xe: Align on a common way to
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
 include/drm-uapi/xe_drm.h                | 20 ++++++++++----------
 lib/xe/xe_query.c                        | 16 ++++++++--------
 lib/xe/xe_query.h                        |  4 ++--
 tests/intel-ci/xe-fast-feedback.testlist |  2 +-
 tests/intel/xe_query.c                   | 12 ++++++------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 23beea9e9..b3c15c348 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -414,14 +414,14 @@ struct drm_xe_query_config {
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
@@ -437,19 +437,19 @@ struct drm_xe_query_gt {
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
@@ -604,7 +604,7 @@ struct drm_xe_query_uc_fw_version {
  *  - %DRM_XE_DEVICE_QUERY_ENGINES
  *  - %DRM_XE_DEVICE_QUERY_MEM_REGIONS
  *  - %DRM_XE_DEVICE_QUERY_CONFIG
- *  - %DRM_XE_DEVICE_QUERY_GT_LIST - Query type to retrieve the hardware
+ *  - %DRM_XE_DEVICE_QUERY_GT - Query type to retrieve the hardware
  *    configuration of the device such as information on slices, memory,
  *    caches, and so on. It is provided as a table of key / value
  *    attributes.
@@ -654,7 +654,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES		0
 #define DRM_XE_DEVICE_QUERY_MEM_REGION		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
-#define DRM_XE_DEVICE_QUERY_GT_LIST		3
+#define DRM_XE_DEVICE_QUERY_GT			3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index b3b38fe54..607580dce 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -37,12 +37,12 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	return config;
 }
 
-static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
+static struct drm_xe_query_gt *xe_query_gt_new(int fd)
 {
-	struct drm_xe_query_gt_list *gt_list;
+	struct drm_xe_query_gt *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.query = DRM_XE_DEVICE_QUERY_GT,
 		.size = 0,
 		.data = 0,
 	};
@@ -194,7 +194,7 @@ static struct xe_device *find_in_cache(int fd)
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
-	free(xe_dev->gt_list);
+	free(xe_dev->gt);
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
 	free(xe_dev);
@@ -224,7 +224,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->config = xe_query_config_new(fd);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
-	xe_dev->gt_list = xe_query_gt_list_new(fd);
+	xe_dev->gt = xe_query_gt_new(fd);
 	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->all_memory_regions_mask = __all_memory_regions(xe_dev->mem_regions);
@@ -319,9 +319,9 @@ _TYPE _NAME(int fd)			\
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
@@ -594,7 +594,7 @@ uint32_t xe_gt_reference_clock(int fd, int gt)
 
 	igt_assert(gt >= 0 && gt < xe_number_gt(fd));
 
-	return xe_dev->gt_list->gt_list[gt].reference_clock;
+	return xe_dev->gt->gt_list[gt].reference_clock;
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 7b99eec5e..6916a9239 100644
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
 	uint64_t all_memory_regions_mask;
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
index fd04f2b30..b0358a059 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -278,17 +278,17 @@ test_query_mem_regions(int fd)
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
+	struct drm_xe_query_gt *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_LIST,
+		.query = DRM_XE_DEVICE_QUERY_GT,
 		.size = 0,
 		.data = 0,
 	};
@@ -695,8 +695,8 @@ igt_main
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
