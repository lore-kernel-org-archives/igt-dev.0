Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6074A10EA2A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:13 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:51 +0000
Message-Id: <20231103144359.7-57-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 56/64] lib/xe/xe_query: Fix improper handling
 of GT vs Tile
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

Now that we converted all mem_region selection from GT to Engine,
and that we have the tile_id in the engine, we can fix the confusion
here and convert the last case from near_gt to near_tile.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/xe/xe_query.c           | 10 +++++-----
 lib/xe/xe_query.h           |  2 +-
 tests/intel/xe_sysfs_tile.c |  3 +--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 030abc7ea..7fe3d2849 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -552,13 +552,13 @@ uint64_t xe_vram_size_any_region(int fd)
 }
 
 /**
- * xe_vram_size_region_near_gt:
+ * xe_vram_size_region_near_tile:
  * @fd: xe device fd
- * @gt: gt
+ * @tile: tile
  *
- * Returns size of vram region given a @gt id of this device.
+ * Returns size of vram region given a @tile id of this device.
  */
-uint64_t xe_vram_size_region_near_gt(int fd, int gt)
+uint64_t xe_vram_size_region_near_tile(int fd, int tile)
 {
 	struct xe_device *xe_dev;
 	struct drm_xe_query_engine_info *engine;
@@ -567,7 +567,7 @@ uint64_t xe_vram_size_region_near_gt(int fd, int gt)
 	igt_assert(xe_dev);
 
 	xe_for_each_engine(fd, engine) {
-		if (gt == engine->gt_id)
+		if (tile == engine->tile_id)
 			for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
 				if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
 				    ((1 << xe_dev->mem_regions->regions[i].instance) &
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index da3b5ef36..bfe860390 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -90,7 +90,7 @@ struct drm_xe_query_config *xe_config(int fd);
 unsigned int xe_number_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size_any_region(int fd);
-uint64_t xe_vram_size_region_near_gt(int fd, int gt);
+uint64_t xe_vram_size_region_near_tile(int fd, int tile);
 uint32_t xe_gt_reference_clock(int fd, int gt);
 uint64_t xe_visible_vram_size_any_region(int fd);
 uint64_t xe_vram_available_any_region(int fd);
diff --git a/tests/intel/xe_sysfs_tile.c b/tests/intel/xe_sysfs_tile.c
index b21fac0cd..621202daa 100644
--- a/tests/intel/xe_sysfs_tile.c
+++ b/tests/intel/xe_sysfs_tile.c
@@ -47,8 +47,7 @@ igt_main
 	igt_subtest("physical_vram_size_bytes") {
 		igt_require(xe_has_vram(fd));
 		for_each_sysfs_tile_dirfd(fd, tilefd, tile) {
-			/* FIXME: Tile and GT mixed misusage */
-			vram_size = xe_vram_size_region_near_gt(fd, tile);
+			vram_size = xe_vram_size_region_near_tile(fd, tile);
 			test_vram_physical_vram_size_bytes(tilefd, tile, vram_size);
 		}
 	}
-- 
2.34.1
