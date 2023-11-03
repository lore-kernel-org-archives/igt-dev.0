Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44A10EA17
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:59 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:37 +0000
Message-Id: <20231103144359.7-43-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 42/64] xe: Do not stash vram_size
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

Do not stash extra information. The queries are already stashed,
we just need to navigate the structs.

This is a preparation patch to move the memory masks from GT
to Engine. So, let's avoid having extra stashed arrays.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c | 48 ++++++++++++++---------------------------------
 lib/xe/xe_query.h |  6 ------
 2 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 14fabcd7f..407e08668 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -125,28 +125,6 @@ static uint64_t mem_region_near_gt(const struct drm_xe_query_gt_list *gt_list, i
 	return region;
 }
 
-static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
-			     const struct drm_xe_query_gt_list *gt_list, int gt)
-{
-	int region_idx = ffs(mem_region_near_gt(gt_list, gt)) - 1;
-
-	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
-		return mem_regions->regions[region_idx].total_size;
-
-	return 0;
-}
-
-static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
-				     const struct drm_xe_query_gt_list *gt_list, int gt)
-{
-	int region_idx = ffs(mem_region_near_gt(gt_list, gt)) - 1;
-
-	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
-		return mem_regions->regions[region_idx].cpu_visible_size;
-
-	return 0;
-}
-
 static bool __mem_has_vram(struct drm_xe_query_mem_regions *mem_regions)
 {
 	for (int i = 0; i < mem_regions->num_regions; i++)
@@ -219,7 +197,6 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->gt_list);
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
-	free(xe_dev->vram_size);
 	free(xe_dev);
 }
 
@@ -251,15 +228,6 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->all_memory_regions_mask = __all_memory_regions(xe_dev->mem_regions);
-	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
-	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
-		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
-						     xe_dev->gt_list, gt);
-		xe_dev->visible_vram_size[gt] =
-			gt_visible_vram_size(xe_dev->mem_regions,
-					     xe_dev->gt_list, gt);
-	}
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
 
@@ -578,7 +546,13 @@ uint64_t xe_vram_size(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	return xe_dev->vram_size[gt];
+	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
+		    ((1 << xe_dev->mem_regions->regions[i].instance) &
+		     mem_region_near_gt(xe_dev->gt_list, gt)))
+			return xe_dev->mem_regions->regions[i].total_size;
+
+	return 0;
 }
 
 /**
@@ -595,7 +569,13 @@ uint64_t xe_visible_vram_size(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	return xe_dev->visible_vram_size[gt];
+	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
+		    ((1 << xe_dev->mem_regions->regions[i].instance) &
+		     mem_region_near_gt(xe_dev->gt_list, gt)))
+			return xe_dev->mem_regions->regions[i].cpu_visible_size;
+
+	return 0;
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 839ab548e..c0446060d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -41,12 +41,6 @@ struct xe_device {
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_regions *mem_regions;
 
-	/** @vram_size: array of vram sizes for all gt_list */
-	uint64_t *vram_size;
-
-	/** @visible_vram_size: array of visible vram sizes for all gt_list */
-	uint64_t *visible_vram_size;
-
 	/** @default_alignment: safe alignment regardless region location */
 	uint32_t default_alignment;
 
-- 
2.34.1
