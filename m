Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9B810E239
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 13:44:32 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 14:44:15 +0100
Message-Id: <20231130134416.21220-2-marcin.bernatowicz@intel.com>
In-Reply-To: <20231130134416.21220-1-marcin.bernatowicz@intel.com>
References: <20231130134416.21220-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 i-g-t 1/2] lib/xe/xe_query:
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

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.c          | 57 ++++++++++++++++++++++++++++----------
 lib/xe/xe_query.h          |  3 +-
 tests/intel/xe_evict_ccs.c |  2 +-
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index afd443be3..eb4759094 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -629,20 +629,20 @@ uint64_t xe_visible_vram_size(int fd, int gt)
 
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
 	struct drm_xe_query_mem_region *mem_region;
 	struct drm_xe_query_mem_regions *mem_regions;
 
+	igt_assert(vram);
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
@@ -650,19 +650,48 @@ uint64_t xe_vram_available(int fd, int gt)
 	mem_region = &xe_dev->mem_regions->regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
-		uint64_t available_vram;
-
 		mem_regions = xe_query_mem_regions_new(fd);
 		pthread_mutex_lock(&cache.cache_mutex);
 		mem_region->used = mem_regions->regions[region_idx].used;
-		available_vram = mem_region->total_size - mem_region->used;
+		mem_region->cpu_visible_used = mem_regions->regions[region_idx].cpu_visible_used;
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
index 38e9aa440..503d60b44 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -92,7 +92,8 @@ unsigned int xe_number_hw_engines(int fd);
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
index d7244f620..b04c20935 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -325,7 +325,7 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	config->param = param;
 	config->flags = flags;
 	config->free_mb = xe_visible_vram_size(fd, 0) / SZ_1M;
-	config->total_mb = xe_vram_available(fd, 0) / SZ_1M;
+	config->total_mb = xe_available_vram_size(fd, 0) / SZ_1M;
 	config->test_mb = min_t(int, config->free_mb * config->param->vram_percent / 100,
 				config->total_mb * config->param->vram_percent / 100);
 
-- 
2.31.1
