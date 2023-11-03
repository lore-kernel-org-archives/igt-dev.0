Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9237810EA1F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:59 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:38 +0000
Message-Id: <20231103144359.7-44-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 43/64] xe: Also be specific on VRAM selection
 when inspecting its sizes
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

The VRAM selection was split, but the size continued to be
mixed up. This needs to be also split so the memory_region
mask can be moved from GT to the engine info.

This patch is not attempting to close any gap of fix any
of the regions selections and it should have absolutely
no functional impact.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c                 | 37 ++++++++++++++++++++++---------
 lib/xe/xe_query.h                 |  5 +++--
 tests/intel/xe_evict.c            |  2 +-
 tests/intel/xe_evict_ccs.c        |  4 ++--
 tests/intel/xe_mmap.c             |  6 ++---
 tests/intel/xe_noexec_ping_pong.c |  2 +-
 tests/intel/xe_sysfs_tile.c       |  3 ++-
 tests/intel/xe_vm.c               |  4 ++--
 8 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 407e08668..8826c61b2 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -533,13 +533,12 @@ xe_dev_FN(xe_number_engines, number_engines, unsigned int);
 xe_dev_FN(xe_has_vram, has_vram, bool);
 
 /**
- * xe_vram_size:
+ * xe_vram_size_any_region:
  * @fd: xe device fd
- * @gt: gt
  *
- * Returns size of vram of xe device @fd.
+ * Returns size of any vram region of this device.
  */
-uint64_t xe_vram_size(int fd, int gt)
+uint64_t xe_vram_size_any_region(int fd)
 {
 	struct xe_device *xe_dev;
 
@@ -547,22 +546,20 @@ uint64_t xe_vram_size(int fd, int gt)
 	igt_assert(xe_dev);
 
 	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
-		    ((1 << xe_dev->mem_regions->regions[i].instance) &
-		     mem_region_near_gt(xe_dev->gt_list, gt)))
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
 			return xe_dev->mem_regions->regions[i].total_size;
 
 	return 0;
 }
 
 /**
- * xe_visible_vram_size:
+ * xe_vram_size_region_near_gt:
  * @fd: xe device fd
  * @gt: gt
  *
- * Returns size of visible vram of xe device @fd.
+ * Returns size of vram region given a @gt id of this device.
  */
-uint64_t xe_visible_vram_size(int fd, int gt)
+uint64_t xe_vram_size_region_near_gt(int fd, int gt)
 {
 	struct xe_device *xe_dev;
 
@@ -573,6 +570,26 @@ uint64_t xe_visible_vram_size(int fd, int gt)
 		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
 		    ((1 << xe_dev->mem_regions->regions[i].instance) &
 		     mem_region_near_gt(xe_dev->gt_list, gt)))
+			return xe_dev->mem_regions->regions[i].total_size;
+
+	return 0;
+}
+
+/**
+ * xe_visible_vram_size_any_region:
+ * @fd: xe device fd
+ *
+ * Returns size of visible size of any vram of this device.
+ */
+uint64_t xe_visible_vram_size_any_region(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
 			return xe_dev->mem_regions->regions[i].cpu_visible_size;
 
 	return 0;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index c0446060d..f0a3382f2 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -86,8 +86,9 @@ uint32_t xe_min_page_size(int fd, uint64_t region);
 struct drm_xe_query_config *xe_config(int fd);
 unsigned int xe_number_engines(int fd);
 bool xe_has_vram(int fd);
-uint64_t xe_vram_size(int fd, int gt);
-uint64_t xe_visible_vram_size(int fd, int gt);
+uint64_t xe_vram_size_any_region(int fd);
+uint64_t xe_vram_size_region_near_gt(int fd, int gt);
+uint64_t xe_visible_vram_size_any_region(int fd);
 uint64_t xe_vram_available(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 536c38bed..1c8d52358 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -759,7 +759,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
-		vram_size = xe_visible_vram_size(fd, 0);
+		vram_size = xe_visible_vram_size_any_region(fd);
 		igt_assert(vram_size);
 
 		xe_for_each_engine_instance(fd, eci)
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 1876d200c..c72f24181 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -325,7 +325,7 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 
 	config->param = param;
 	config->flags = flags;
-	config->free_mb = xe_visible_vram_size(fd, 0) / SZ_1M;
+	config->free_mb = xe_visible_vram_size_any_region(fd) / SZ_1M;
 	config->total_mb = xe_vram_available(fd, 0) / SZ_1M;
 	config->test_mb = min_t(int, config->free_mb * config->param->vram_percent / 100,
 				config->total_mb * config->param->vram_percent / 100);
@@ -496,7 +496,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
-		vram_size = xe_visible_vram_size(fd, 0);
+		vram_size = xe_visible_vram_size_any_region(fd);
 		igt_assert(vram_size);
 	}
 
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index d7b87f295..f41656b3a 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -158,7 +158,7 @@ static void trap_sigbus(uint32_t *ptr)
 static void test_small_bar(int fd)
 {
 	size_t page_size = xe_get_default_alignment(fd);
-	uint32_t visible_size = xe_visible_vram_size(fd, 0);
+	uint32_t visible_size = xe_visible_vram_size_any_region(fd);
 	uint32_t bo;
 	uint64_t mmo;
 	uint32_t *map;
@@ -234,8 +234,8 @@ igt_main
 		test_bad_object(fd);
 
 	igt_subtest("small-bar") {
-		igt_require(xe_visible_vram_size(fd, 0));
-		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));
+		igt_require(xe_visible_vram_size_any_region(fd));
+		igt_require(xe_visible_vram_size_any_region(fd) < xe_vram_size_any_region(fd));
 		test_small_bar(fd);
 	}
 
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 8686206b4..fa9b284ee 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -45,7 +45,7 @@
 
 static void test_ping_pong(int fd, struct drm_xe_query_engine_info *engine)
 {
-	size_t vram_size = xe_vram_size(fd, 0);
+	size_t vram_size = xe_vram_size_any_region(fd);
 	size_t align = xe_get_default_alignment(fd);
 	size_t bo_size = vram_size / NUM_VMS / NUM_BOS;
 	uint32_t vm[NUM_VMS];
diff --git a/tests/intel/xe_sysfs_tile.c b/tests/intel/xe_sysfs_tile.c
index ba970cda8..b21fac0cd 100644
--- a/tests/intel/xe_sysfs_tile.c
+++ b/tests/intel/xe_sysfs_tile.c
@@ -47,7 +47,8 @@ igt_main
 	igt_subtest("physical_vram_size_bytes") {
 		igt_require(xe_has_vram(fd));
 		for_each_sysfs_tile_dirfd(fd, tilefd, tile) {
-			vram_size = xe_vram_size(fd, tile);
+			/* FIXME: Tile and GT mixed misusage */
+			vram_size = xe_vram_size_region_near_gt(fd, tile);
 			test_vram_physical_vram_size_bytes(tilefd, tile, vram_size);
 		}
 	}
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index edd48ee9b..9fc61c179 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -947,8 +947,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
 		igt_assert(map);
 	} else {
-		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
-			    xe_visible_vram_size(fd, 0));
+		igt_skip_on(xe_visible_vram_size_any_region(fd) && bo_size >
+			    xe_visible_vram_size_any_region(fd));
 
 		bo = xe_bo_create(fd, vm, bo_size,
 				  vram_near_gt_if_possible(fd, eci->gt_id),
-- 
2.34.1
