Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE5910E8E3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:57 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:35 +0000
Message-Id: <20231109155410.7-23-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 22/57] drm-uapi/xe: Remove unused
 QUERY_CONFIG_GT_COUNT
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

Align with commit ("drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h |  5 +----
 lib/xe/xe_query.c         | 11 +++++------
 lib/xe/xe_query.h         |  3 ---
 tests/intel/xe_debugfs.c  |  2 --
 tests/intel/xe_query.c    |  2 --
 5 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1ed982935..a80d1f460 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -340,8 +340,6 @@ struct drm_xe_query_mem_usage {
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
- *  - %DRM_XE_QUERY_CONFIG_GT_COUNT - Total number of GTs for the entire
- *    device
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
  */
@@ -357,8 +355,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
-#define DRM_XE_QUERY_CONFIG_GT_COUNT			4
-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
+#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c19988215..9e917cfee 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -249,16 +249,15 @@ struct xe_device *xe_device_get(int fd)
 
 	xe_dev->fd = fd;
 	xe_dev->config = xe_query_config_new(fd);
-	xe_dev->number_gt = xe_dev->config->info[DRM_XE_QUERY_CONFIG_GT_COUNT];
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
 	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
-	xe_dev->vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->visible_vram_size));
-	for (int gt = 0; gt < xe_dev->number_gt; gt++) {
+	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
+	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
 		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
 						     xe_dev->gt_list, gt);
 		xe_dev->visible_vram_size[gt] =
@@ -358,7 +357,7 @@ _TYPE _NAME(int fd)			\
  *
  * Return number of gt_list for xe device fd.
  */
-xe_dev_FN(xe_number_gt, number_gt, unsigned int);
+xe_dev_FN(xe_number_gt, gt_list->num_gt, unsigned int);
 
 /**
  * all_memory_regions:
@@ -394,7 +393,7 @@ uint64_t vram_memory(int fd, int gt)
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
+	igt_assert(gt >= 0 && gt < xe_dev->gt_list->num_gt);
 
 	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
 }
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index eb23a89fb..90ddd795c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -29,9 +29,6 @@ struct xe_device {
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
-	/** @number_gt: number of gt */
-	unsigned int number_gt;
-
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 9ffc6f6d8..60ddceda7 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -121,8 +121,6 @@ test_base(int fd, struct drm_xe_query_config *config)
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
 	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-	if (config->info[DRM_XE_QUERY_CONFIG_GT_COUNT] > 1)
-		igt_assert(igt_debugfs_exists(fd, "gt1", O_RDONLY));
 
 	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
 	igt_debugfs_dump(fd, "gtt_mm");
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 351e56eb4..969ad1c7f 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -374,8 +374,6 @@ test_query_config(int fd)
 		config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT]);
 	igt_info("DRM_XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
 		config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
-	igt_info("DRM_XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
-		config->info[DRM_XE_QUERY_CONFIG_GT_COUNT]);
 	igt_info("DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
 		config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
 	dump_hex_debug(config, query.size);
-- 
2.34.1
