Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5610EB06
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 14:12:34 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 15:12:11 +0100
Message-Id: <59cf7543448852caa56942bf61538219ec77cd4a.1675950055.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675950055.git.karolina.stolarek@intel.com>
References: <cover.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 8/9] lib/i915_blt: Add checks for command
 properties
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

Add a predicate that checks if a command has a specific property.
Introduce helpers that check if a platform uses an extended
version of the block-copy command or supports compression. Add
a getter for blt_cmd_info to intel_cmds_info library. Group
functions together in i915_blt header file.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c        | 64 ++++++++++++++++++++++++++++++++++++--
 lib/i915/i915_blt.h        |  8 +++++
 lib/i915/intel_cmds_info.c | 11 +++++++
 lib/i915/intel_cmds_info.h |  3 ++
 4 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 0ea25d2f..9b32a0e9 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -222,7 +222,7 @@ bool blt_supports_command(const struct intel_cmds_info *cmds_info,
 {
 	igt_require_f(cmds_info, "No config found for the platform\n");
 
-	return cmds_info->blt_cmds[cmd];
+	return blt_get_cmd_info(cmds_info, cmd);
 }
 
 /**
@@ -245,7 +245,7 @@ bool blt_cmd_supports_tiling(const struct intel_cmds_info *cmds_info,
 	if (!cmds_info)
 		return false;
 
-	cmd_info = cmds_info->blt_cmds[cmd];
+	cmd_info = blt_get_cmd_info(cmds_info, cmd);
 
 	/* no config means no support for that tiling */
 	if (!cmd_info)
@@ -254,6 +254,32 @@ bool blt_cmd_supports_tiling(const struct intel_cmds_info *cmds_info,
 	return cmd_info->supported_tiling & BIT(tiling);
 }
 
+/**
+ * blt_cmd_has_property:
+ * @cmds_info: Copy commands description struct
+ * @cmd: Blitter command enum
+ * @prop: property flag
+ *
+ * Checks if a @cmd entry of @cmds_info has @prop property. The properties can
+ * be freely combined, but the function will return true for platforms for
+ * which all properties defined in the bit flag are present. The function
+ * returns false if no information about the command is stored.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
+			  enum blt_cmd_type cmd, uint32_t prop)
+{
+	struct blt_cmd_info const *cmd_info;
+
+	cmd_info = blt_get_cmd_info(cmds_info, cmd);
+
+	if (!cmd_info)
+		return false;
+
+	return cmd_info->flags & prop;
+}
+
 /**
  * blt_has_block_copy
  * @i915: drm fd
@@ -320,6 +346,40 @@ bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 	return blt_cmd_supports_tiling(cmds_info, XY_BLOCK_COPY, tiling);
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
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
+
+	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY,
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
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
+
+	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
+}
+
 /**
  * blt_tiling_name:
  * @tiling: tiling id
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 3fe47527..6634533b 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -163,10 +163,18 @@ bool blt_supports_command(const struct intel_cmds_info *cmds_info,
 bool blt_cmd_supports_tiling(const struct intel_cmds_info *cmds_info,
 			     enum blt_cmd_type cmd,
 			     enum blt_tiling_type tiling);
+bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
+			  enum blt_cmd_type cmd,
+			  uint32_t prop);
+
 bool blt_has_block_copy(int i915);
 bool blt_has_fast_copy(int i915);
+
 bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
+bool blt_block_copy_supports_compression(int i915);
+bool blt_uses_extended_block_copy(int i915);
+
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 
 uint64_t emit_blt_block_copy(int i915,
diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
index 59ee0403..2ac6bc2a 100644
--- a/lib/i915/intel_cmds_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -4,6 +4,8 @@
  */
 
 #include <stdint.h>
+#include <stddef.h>
+
 #include "intel_chipset.h"
 #include "i915/intel_cmds_info.h"
 
@@ -109,3 +111,12 @@ const struct intel_cmds_info gen12_mtl_cmds_info = {
 		[XY_BLOCK_COPY] = &mtl_xy_block_copy,
 	}
 };
+
+const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
+					    enum blt_cmd_type cmd)
+{
+	if (!cmds_info)
+		return NULL;
+
+	return cmds_info->blt_cmds[cmd];
+}
diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 541727ec..9bf6ecd5 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -49,4 +49,7 @@ extern const struct intel_cmds_info gen12_mtl_cmds_info;
 #define for_each_tiling(__tiling) \
 	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
 
+const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
+					    enum blt_cmd_type cmd);
+
 #endif
-- 
2.25.1
