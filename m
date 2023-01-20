Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C7110EA09
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 10:14:29 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 11:14:06 +0100
Message-Id: <73c1ff5f027ac5f31aa48996d8d30edc49a4820a.1674208534.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1674208534.git.karolina.stolarek@intel.com>
References: <cover.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 6/9] lib/i915_blt: Add helpers to check
 if command or tiling is supported
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

Add predicates that check if block or fast copy are supported and
a simple iterator for tiling formats. Update block copy tests to use
the new checks.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c  | 118 ++++++++++++++++++++++++++++++++++++-------
 lib/i915/i915_blt.h  |  10 +++-
 tests/i915/gem_ccs.c |   7 +--
 3 files changed, 113 insertions(+), 22 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index cd7422d1..cd7968a1 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -14,6 +14,7 @@
 #include "i915_blt.h"
 
 #define BITRANGE(start, end) (end - start + 1)
+#define GET_BLT_INFO(__fd) intel_get_blt_info(intel_get_drm_devid(__fd))
 
 enum blt_special_mode {
 	SM_NONE,
@@ -208,34 +209,115 @@ bool blt_supports_compression(int i915)
 }
 
 /**
- * blt_supports_tiling:
+ * blt_supports_command:
+ * @info: Blitter command info struct
+ * @cmd: Blitter command enum
+ *
+ * Checks if @info has an entry of supported tiling formats for @cmd command.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_supports_command(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd)
+{
+	igt_require_f(info, "No config found for the platform\n");
+
+	return info->supported_cmds[cmd];
+}
+
+/**
+ * blt_cmd_supports_tiling:
+ * @info: Blitter command info struct
+ * @cmd: Blitter command enum
+ * @tiling: tiling format enum
+ *
+ * Checks if a @cmd entry of @info lists @tiling. It also returns false if
+ * no information about the command is stored.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+			     enum blt_cmd_type cmd,
+			     enum blt_tiling_type tiling)
+{
+	struct blt_tiling_info const *tile_config;
+
+	if (!info)
+		return false;
+
+	tile_config = info->supported_cmds[cmd];
+
+	/* no config means no support for that tiling */
+	if (!tile_config)
+		return false;
+
+	return tile_config->supported_tiling & BIT(tiling);
+}
+
+/**
+ * blt_has_block_copy
  * @i915: drm fd
- * @tiling: tiling id
  *
- * Function checks if blitter supports @tiling on @i915 device.
+ * Check if block copy is supported by @i915 device
  *
  * Returns:
  * true if it does, false otherwise.
  */
-bool blt_supports_tiling(int i915, enum blt_tiling_type tiling)
+bool blt_has_block_copy(int i915)
 {
-	uint32_t devid = intel_get_drm_devid(i915);
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
 
-	if (tiling == T_XMAJOR) {
-		if (IS_TIGERLAKE(devid) || IS_DG1(devid))
-			return false;
-		else
-			return true;
-	}
+	return blt_supports_command(blt_info, XY_BLOCK_COPY);
+}
 
-	if (tiling == T_YMAJOR) {
-		if (IS_TIGERLAKE(devid) || IS_DG1(devid))
-			return true;
-		else
-			return false;
-	}
+/**
+ * blt_has_fast_copy
+ * @i915: drm fd
+ *
+ * Check if fast copy is supported by @i915 device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_fast_copy(int i915)
+{
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+
+	return blt_supports_command(blt_info, XY_FAST_COPY);
+}
+
+/**
+ * blt_fast_copy_supports_tiling
+ * @i915: drm fd
+ * @tiling: tiling format
+ *
+ * Check if fast copy provided by @i915 device supports @tiling format
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
+{
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+
+	return blt_cmd_supports_tiling(blt_info, XY_FAST_COPY, tiling);
+}
+
+/**
+ * blt_block_copy_supports_tiling
+ * @i915: drm fd
+ * @tiling: tiling format
+ *
+ * Check if block copy provided by @i915 device supports @tiling format
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
+{
+	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
 
-	return true;
+	return blt_cmd_supports_tiling(blt_info, XY_BLOCK_COPY, tiling);
 }
 
 /**
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 9837dcac..1e5061c6 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -158,7 +158,15 @@ struct blt_ctrl_surf_copy_data {
 };
 
 bool blt_supports_compression(int i915);
-bool blt_supports_tiling(int i915, enum blt_tiling_type tiling);
+bool blt_supports_command(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd);
+bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+			     enum blt_cmd_type cmd,
+			     enum blt_tiling_type tiling);
+bool blt_has_block_copy(int i915);
+bool blt_has_fast_copy(int i915);
+bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
+bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 
 uint64_t emit_blt_block_copy(int i915,
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 724aa20b..2b60ce31 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -652,6 +652,7 @@ static void block_copy_test(int i915,
 {
 	struct igt_collection *regions;
 	const struct intel_execution_engine2 *e;
+	int tiling;
 
 	if (config->compression && !blt_supports_compression(i915))
 		return;
@@ -659,8 +660,8 @@ static void block_copy_test(int i915,
 	if (config->inplace && !config->compression)
 		return;
 
-	for (int tiling = T_LINEAR; tiling <= T_TILE64; tiling++) {
-		if (!blt_supports_tiling(i915, tiling) ||
+	for_each_tiling(tiling) {
+		if (!blt_block_copy_supports_tiling(i915, tiling) ||
 		    (param.tiling >= 0 && param.tiling != tiling))
 			continue;
 
@@ -758,7 +759,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
-		igt_require(AT_LEAST_GEN(intel_get_drm_devid(i915), 12) > 0);
+		igt_require(blt_has_block_copy(i915));
 
 		query_info = gem_get_query_memory_regions(i915);
 		igt_require(query_info);
-- 
2.25.1
