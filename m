Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D8A10EA12
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:35 +0000
Message-Id: <20231103144359.7-41-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 40/64] xe: Build all_memory_regions_mask out of
 memory_regions query info
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

The memory mask is build out of the instance in the memory_regions.
Let's use this information directly instead of having to inspect all
the GT's for all the near and far memory, what even results in useless
'1-or-1' duplications.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c | 12 +++++-------
 lib/xe/xe_query.h |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 63f80a8b3..04d73f405 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -58,14 +58,12 @@ static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 	return gt_list;
 }
 
-static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
+static uint64_t __all_memory_regions(struct drm_xe_query_mem_regions *mem_regions)
 {
 	uint64_t regions = 0;
-	int i;
 
-	for (i = 0; i < gt_list->num_gt; i++)
-		regions |= gt_list->gt_list[i].near_mem_regions |
-			   gt_list->gt_list[i].far_mem_regions;
+	for (int i = 0; i < mem_regions->num_regions; i++)
+		regions |= 1 << mem_regions->regions[i].instance;
 
 	return regions;
 }
@@ -250,9 +248,9 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
-	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
+	xe_dev->all_memory_regions_mask = __all_memory_regions(xe_dev->mem_regions);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
 	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
@@ -363,7 +361,7 @@ xe_dev_FN(xe_number_gt, gt_list->num_gt, unsigned int);
  *
  * Returns memory regions bitmask for xe device @fd.
  */
-xe_dev_FN(all_memory_regions, memory_regions, uint64_t);
+xe_dev_FN(all_memory_regions, all_memory_regions_mask, uint64_t);
 
 /**
  * system_memory:
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index ef90d5b63..0faa9c284 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -30,7 +30,7 @@ struct xe_device {
 	struct drm_xe_query_gt_list *gt_list;
 
 	/** @gt_list: bitmask of all memory regions */
-	uint64_t memory_regions;
+	uint64_t all_memory_regions_mask;
 
 	/** @engines: array of hardware engines */
 	struct drm_xe_query_engine_info *engines;
-- 
2.34.1
