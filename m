Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD8F10E791
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 13:48:23 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 14:47:39 +0100
Message-Id: <ff169cf93c19269098e19f9c1638d8e53d5f4ac7.1675854161.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675854161.git.karolina.stolarek@intel.com>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/6] tests/gem_ccs: Check for extended
 block-copy and compression support
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

Use a helper that checks blitter command flags instead of directly
checking Flat CCS compression support. Check for extended block-copy
command when initializing the copy object in block_copy and
block_multicopy tests.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c  | 17 -----------------
 lib/i915/i915_blt.h  |  1 -
 tests/i915/gem_ccs.c |  7 +++----
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index f85e12ca..766e76f8 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -191,23 +191,6 @@ struct gen12_block_copy_data_ext {
 	} dw21;
 };
 
-/**
- * blt_supports_compression:
- * @i915: drm fd
- *
- * Function checks if HW supports flatccs compression in blitter commands
- * on @i915 device.
- *
- * Returns:
- * true if it does, false otherwise.
- */
-bool blt_supports_compression(int i915)
-{
-	uint32_t devid = intel_get_drm_devid(i915);
-
-	return HAS_FLATCCS(devid);
-}
-
 static const struct blt_cmd_info *blt_get_cmd_info(const struct blt_cmds_desc *blt_info,
 						   enum blt_cmd_type cmd)
 {
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 23e0609f..add591ea 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -157,7 +157,6 @@ struct blt_ctrl_surf_copy_data {
 	bool print_bb;
 };
 
-bool blt_supports_compression(int i915);
 bool blt_supports_command(const struct blt_cmds_desc *blt_info,
 			  enum blt_cmd_type cmd);
 bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index a24c8e1f..b7e8bda7 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -346,7 +346,6 @@ static void block_copy(int i915,
 	uint32_t run_id = mid_tiling;
 	uint32_t mid_region = region2, bb;
 	uint32_t width = param.width, height = param.height;
-	uint32_t devid = intel_get_drm_devid(i915);
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -355,7 +354,7 @@ static void block_copy(int i915,
 
 	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
 
-	if (!blt_supports_compression(i915) && !IS_METEORLAKE(devid))
+	if (!blt_uses_extended_block_copy(i915))
 		pext = NULL;
 
 	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
@@ -470,7 +469,7 @@ static void block_multicopy(int i915,
 
 	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
 
-	if (!blt_supports_compression(i915))
+	if (!blt_uses_extended_block_copy(i915))
 		pext3 = NULL;
 
 	src = blt_create_object(i915, region1, width, height, bpp, uc_mocs,
@@ -557,7 +556,7 @@ static void block_copy_test(int i915,
 	const struct intel_execution_engine2 *e;
 	int tiling;
 
-	if (config->compression && !blt_supports_compression(i915))
+	if (config->compression && !blt_block_copy_supports_compression(i915))
 		return;
 
 	if (config->inplace && !config->compression)
-- 
2.25.1
