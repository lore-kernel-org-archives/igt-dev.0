Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95BC10E77E
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 17:02:11 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 18:01:55 +0100
Message-Id: <20231206170156.23120-2-marcin.bernatowicz@intel.com>
In-Reply-To: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
References: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 i-g-t 1/2] lib/xe/xe_query:
 xe_visible_available_vram_size helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adam.miszczak@intel.com, matthew.auld@intel.com,
 jakub1.kolakowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added 'xe_visible_available_vram_size' helper function
to query the available CPU-visible VRAM size.

Also, renamed 'xe_vram_available' to 'xe_available_vram_size'
for consistency with other function names.

v2: adjustments to uAPI changes

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
---
 lib/xe/xe_query.c          | 58 +++++++++++++++++++++++++++++---------
 lib/xe/xe_query.h          |  3 +-
 tests/intel/xe_evict_ccs.c |  2 +-
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3ebce8361..d2dad317e 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -578,20 +578,20 @@ uint64_t xe_visible_vram_size(int fd, int gt)
 
 	return visible_size;
 }
-/**
- * xe_vram_available:
- * @fd: xe device fd
- * @gt: gt
- *
- * Returns available vram of xe device @fd and @gt.
- */
-uint64_t xe_vram_available(int fd, int gt)
+
+struct __available_vram {
+	uint64_t total_available;
+	uint64_t cpu_visible_available;
+};
+
+static void __available_vram_size_snapshot(int fd, int gt, struct __available_vram *vram)
 {
 	struct xe_device *xe_dev;
 	int region_idx;
 	struct drm_xe_mem_region *mem_region;
 	struct drm_xe_query_mem_regions *mem_regions;
 
+	igt_assert(vram);
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
@@ -599,19 +599,49 @@ uint64_t xe_vram_available(int fd, int gt)
 	mem_region = &xe_dev->mem_regions->mem_regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
-		uint64_t available_vram;
-
 		mem_regions = xe_query_mem_regions_new(fd);
 		pthread_mutex_lock(&cache.cache_mutex);
 		mem_region->used = mem_regions->mem_regions[region_idx].used;
-		available_vram = mem_region->total_size - mem_region->used;
+		mem_region->cpu_visible_used =
+			mem_regions->mem_regions[region_idx].cpu_visible_used;
+		vram->total_available = mem_region->total_size - mem_region->used;
+		vram->cpu_visible_available =
+			mem_region->cpu_visible_size - mem_region->cpu_visible_used;
 		pthread_mutex_unlock(&cache.cache_mutex);
 		free(mem_regions);
-
-		return available_vram;
 	}
+}
 
-	return 0;
+/**
+ * xe_available_vram_size:
+ * @fd: xe device fd
+ * @gt: gt
+ *
+ * Returns size of available vram of xe device @fd and @gt.
+ */
+uint64_t xe_available_vram_size(int fd, int gt)
+{
+	struct __available_vram vram = {};
+
+	__available_vram_size_snapshot(fd, gt, &vram);
+
+	return vram.total_available;
+}
+
+/**
+ * xe_visible_available_vram_size:
+ * @fd: xe device fd
+ * @gt: gt
+ *
+ * Returns size of visible available vram of xe device @fd and @gt.
+ */
+uint64_t xe_visible_available_vram_size(int fd, int gt)
+{
+	struct __available_vram vram = {};
+
+	__available_vram_size_snapshot(fd, gt, &vram);
+
+	return vram.cpu_visible_available;
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index a91677ad1..1e3a7bdb9 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -89,7 +89,8 @@ unsigned int xe_number_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint64_t xe_visible_vram_size(int fd, int gt);
-uint64_t xe_vram_available(int fd, int gt);
+uint64_t xe_available_vram_size(int fd, int gt);
+uint64_t xe_visible_available_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 0c775e5f4..674c8537e 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -326,7 +326,7 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	config->param = param;
 	config->flags = flags;
 	config->free_mb = xe_visible_vram_size(fd, 0) / SZ_1M;
-	config->total_mb = xe_vram_available(fd, 0) / SZ_1M;
+	config->total_mb = xe_available_vram_size(fd, 0) / SZ_1M;
 	config->test_mb = min_t(int, config->free_mb * config->param->vram_percent / 100,
 				config->total_mb * config->param->vram_percent / 100);
 
-- 
2.31.1
