Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8F210E8E8
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:53 +0000
Message-Id: <20231109155410.7-41-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 40/57] lib/xe: Get current available size and
 sync with the 'any gt'.
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

First of all, get the current available size, not a cached
value that we are not sure how old it is.

Also, remove the 'gt' selection number to align with all
the other 'any_region' variants.

Then sync all the loops so we guarantee that the region
where we are inspecting the sizes are exactly the same
where we are allocating the BO: 'any first vram region'.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c          | 44 +++++++++++++++++++-------------------
 lib/xe/xe_query.h          |  2 +-
 tests/intel/xe_evict_ccs.c |  2 +-
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a1d4aa44c..20d6690f7 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -598,37 +598,37 @@ uint64_t xe_visible_vram_size_any_region(int fd)
 }
 
 /**
- * xe_vram_available:
+ * xe_vram_available_any_region:
  * @fd: xe device fd
- * @gt: gt
  *
- * Returns available vram of xe device @fd and @gt.
+ * Returns available vram of any first available region of this device.
+ * It can be used in conjunction with visible_size functions of any
+ * region since the 'any region' selection will end up in the same
+ * region.
  */
-uint64_t xe_vram_available(int fd, int gt)
+uint64_t xe_vram_available_any_region(int fd)
 {
-	struct xe_device *xe_dev;
-	int region_idx;
-	struct drm_xe_query_mem_region *mem_region;
 	struct drm_xe_query_mem_regions *mem_regions;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
+		.size = 0,
+		.data = 0,
+	};
 
-	xe_dev = find_in_cache(fd);
-	igt_assert(xe_dev);
-
-	region_idx = ffs(mem_region_near_gt(xe_dev->gt_list, gt)) - 1;
-	mem_region = &xe_dev->mem_regions->regions[region_idx];
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
 
-	if (XE_IS_CLASS_VRAM(mem_region)) {
-		uint64_t available_vram;
+	mem_regions = malloc(query.size);
+	igt_assert(mem_regions);
 
-		mem_regions = xe_query_mem_regions_new(fd);
-		pthread_mutex_lock(&cache.cache_mutex);
-		mem_region->used = mem_regions->regions[region_idx].used;
-		available_vram = mem_region->total_size - mem_region->used;
-		pthread_mutex_unlock(&cache.cache_mutex);
-		free(mem_regions);
+	query.data = to_user_pointer(mem_regions);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-		return available_vram;
-	}
+	for (int i = 0; i < mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&mem_regions->regions[i]))
+			return mem_regions->regions[i].total_size -
+				mem_regions->regions[i].used;
 
 	return 0;
 }
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f0a3382f2..bec2a7ed6 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -89,7 +89,7 @@ bool xe_has_vram(int fd);
 uint64_t xe_vram_size_any_region(int fd);
 uint64_t xe_vram_size_region_near_gt(int fd, int gt);
 uint64_t xe_visible_vram_size_any_region(int fd);
-uint64_t xe_vram_available(int fd, int gt);
+uint64_t xe_vram_available_any_region(int fd);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index c72f24181..7ed2bd41d 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -326,7 +326,7 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	config->param = param;
 	config->flags = flags;
 	config->free_mb = xe_visible_vram_size_any_region(fd) / SZ_1M;
-	config->total_mb = xe_vram_available(fd, 0) / SZ_1M;
+	config->total_mb = xe_vram_available_any_region(fd) / SZ_1M;
 	config->test_mb = min_t(int, config->free_mb * config->param->vram_percent / 100,
 				config->total_mb * config->param->vram_percent / 100);
 
-- 
2.34.1
