Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8210E17C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 11:50:24 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Feb 2023 12:49:59 +0100
Message-Id: <20230202114959.77568-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_tiling_info: Add flags field to
 describe command properties
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

Blitter commands may have different properties depending on the
platform. Add a new field to blt_tiling_info struct to describe
properties of the commands. Update definitions of block-copy on
DG2 and beyond to show the differences. Add helpers that check
if a platform uses an extended version of the block-copy command
or supports compression. Update gem_ccs test to use these
functions.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c          | 89 +++++++++++++++++++++++++++++-------
 lib/i915/i915_blt.h          | 10 +++-
 lib/i915/intel_tiling_info.c | 28 +++++++++---
 lib/i915/intel_tiling_info.h |  4 ++
 tests/i915/gem_ccs.c         |  7 ++-
 5 files changed, 111 insertions(+), 27 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index bbfb6ffc..bda9ea5f 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -191,23 +191,22 @@ struct gen12_block_copy_data_ext {
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
+static bool device_supports_compression(int i915)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
 	return HAS_FLATCCS(devid);
 }
 
+static const struct blt_tiling_info *blt_get_tiling_info(const struct blt_cmd_info *info,
+							 enum blt_cmd_type cmd)
+{
+	if (!info)
+		return NULL;
+
+	return info->supported_cmds[cmd];
+}
+
 /**
  * blt_supports_command:
  * @info: Blitter command info struct
@@ -222,7 +221,7 @@ bool blt_supports_command(const struct blt_cmd_info *info,
 {
 	igt_require_f(info, "No config found for the platform\n");
 
-	return info->supported_cmds[cmd];
+	return blt_get_tiling_info(info, cmd);
 }
 
 /**
@@ -242,10 +241,7 @@ bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
 {
 	struct blt_tiling_info const *tile_config;
 
-	if (!info)
-		return false;
-
-	tile_config = info->supported_cmds[cmd];
+	tile_config = blt_get_tiling_info(info, cmd);
 
 	/* no config means no support for that tiling */
 	if (!tile_config)
@@ -254,6 +250,32 @@ bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
 	return tile_config->supported_tiling & BIT(tiling);
 }
 
+/**
+ * blt_cmd_has_property:
+ * @info: Blitter command info struct
+ * @cmd: Blitter command enum
+ * @flag: property flag
+ *
+ * Checks if a @cmd entry of @info has @flag property. The properties can be
+ * freely combined, but the function will return true for platforms for which
+ * all properties defined in the bit flag are present. The function returns
+ * false if no information about the command is stored.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_cmd_has_property(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd, uint32_t flag)
+{
+	struct blt_tiling_info const *tile_config;
+
+	tile_config = blt_get_tiling_info(info, cmd);
+
+	if (!tile_config)
+		return false;
+
+	return tile_config->flags & flag;
+}
+
 /**
  * blt_has_block_copy
  * @i915: drm fd
@@ -320,6 +342,41 @@ bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 	return blt_cmd_supports_tiling(blt_info, XY_BLOCK_COPY, tiling);
 }
 
+/**
+ * blt_block_copy_supports_compression
+ * @i915: drm fd
+ *
+ * Check if block copy provided by @i915 device supports compression.
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_block_copy_supports_compression(int i915)
+{
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+
+	return device_supports_compression(i915) &&
+	       blt_cmd_has_property(blt_info, XY_BLOCK_COPY,
+				    BLT_CMD_SUPPORTS_COMPRESSION);
+}
+
+/**
+ * blt_uses_extended_block_copy
+ * @i915: drm fd
+ *
+ * Check if block copy provided by @i915 device uses an extended version
+ * of the command.
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_uses_extended_block_copy(int i915)
+{
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+
+	return blt_cmd_has_property(blt_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
+}
+
 /**
  * blt_tiling_name:
  * @tiling: tiling id
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 299dff8e..14885db3 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -157,16 +157,24 @@ struct blt_ctrl_surf_copy_data {
 	bool print_bb;
 };
 
-bool blt_supports_compression(int i915);
 bool blt_supports_command(const struct blt_cmd_info *info,
 			  enum blt_cmd_type cmd);
 bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
 			     enum blt_cmd_type cmd,
 			     enum blt_tiling_type tiling);
+bool blt_cmd_has_property(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd,
+			  uint32_t flag);
+
 bool blt_has_block_copy(int i915);
 bool blt_has_fast_copy(int i915);
+
 bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
+
+bool blt_block_copy_supports_compression(int i915);
+bool blt_uses_extended_block_copy(int i915);
+
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 
 uint64_t emit_blt_block_copy(int i915,
diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
index fc388919..1dcf17c2 100644
--- a/lib/i915/intel_tiling_info.c
+++ b/lib/i915/intel_tiling_info.c
@@ -12,6 +12,12 @@
 		.supported_tiling = _tiling \
 	}
 
+#define BLT_INFO_EXT(_cmd, _tiling, _flags) { \
+		.blt_cmd_type = _cmd, \
+		.supported_tiling = _tiling, \
+		.flags = _flags \
+	}
+
 static const struct blt_tiling_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
 static const struct blt_tiling_info
 		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
@@ -44,12 +50,22 @@ static const struct blt_tiling_info
 		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
 					       BIT(T_LINEAR) |
 					       BIT(T_YMAJOR));
+
+#define DG2_SUPPORTED_TILING \
+	(BIT(T_LINEAR) | \
+	 BIT(T_XMAJOR) | \
+	 BIT(T_TILE4)  | \
+	 BIT(T_TILE64))
+
+#define DG2_BLOCK_COPY_INFO(_flags) \
+	BLT_INFO_EXT(XY_BLOCK_COPY, DG2_SUPPORTED_TILING, (_flags))
+
+static const struct blt_tiling_info
+		dg2_xy_block_copy = DG2_BLOCK_COPY_INFO(BLT_CMD_EXTENDED |
+							BLT_CMD_SUPPORTS_COMPRESSION);
+
 static const struct blt_tiling_info
-		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
-					     BIT(T_LINEAR) |
-					     BIT(T_XMAJOR) |
-					     BIT(T_TILE4)  |
-					     BIT(T_TILE64));
+		mtl_xy_block_copy = DG2_BLOCK_COPY_INFO(BLT_CMD_EXTENDED);
 
 const struct blt_cmd_info pre_gen8_blt_info = {
 	.supported_cmds = {
@@ -90,6 +106,6 @@ const struct blt_cmd_info gen12_dg2_blt_info = {
 const struct blt_cmd_info gen12_mtl_blt_info = {
 	.supported_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
-		[XY_BLOCK_COPY] = &dg2_xy_block_copy
+		[XY_BLOCK_COPY] = &mtl_xy_block_copy
 	}
 };
diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
index bb655103..a6288f49 100644
--- a/lib/i915/intel_tiling_info.h
+++ b/lib/i915/intel_tiling_info.h
@@ -29,6 +29,10 @@ enum blt_cmd_type {
 struct blt_tiling_info {
 	enum blt_cmd_type blt_cmd_type;
 	uint32_t supported_tiling;
+
+	uint32_t flags;
+#define BLT_CMD_EXTENDED		(1 << 0)
+#define BLT_CMD_SUPPORTS_COMPRESSION	(1 << 1)
 };
 
 struct blt_cmd_info {
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
