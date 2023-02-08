Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D13F10E78F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 13:48:22 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 14:47:38 +0100
Message-Id: <8fcbdd60e361172fb3c210d6c15e6c200e36e6b2.1675854161.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675854161.git.karolina.stolarek@intel.com>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/6] lib/i915_blt: Add checks for command
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
version of the block-copy command or supports compression.
Group functions together in the header file.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c | 73 +++++++++++++++++++++++++++++++++++++++++++--
 lib/i915/i915_blt.h |  8 +++++
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 554905d2..f85e12ca 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -208,6 +208,15 @@ bool blt_supports_compression(int i915)
 	return HAS_FLATCCS(devid);
 }
 
+static const struct blt_cmd_info *blt_get_cmd_info(const struct blt_cmds_desc *blt_info,
+						   enum blt_cmd_type cmd)
+{
+	if (!blt_info)
+		return NULL;
+
+	return blt_info->supported_cmds[cmd];
+}
+
 /**
  * blt_supports_command:
  * @blt_info: Blitter commands description struct
@@ -222,7 +231,7 @@ bool blt_supports_command(const struct blt_cmds_desc *blt_info,
 {
 	igt_require_f(blt_info, "No config found for the platform\n");
 
-	return blt_info->supported_cmds[cmd];
+	return blt_get_cmd_info(blt_info, cmd);
 }
 
 /**
@@ -245,7 +254,7 @@ bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
 	if (!blt_info)
 		return false;
 
-	cmd_info = blt_info->supported_cmds[cmd];
+	cmd_info = blt_get_cmd_info(blt_info, cmd);
 
 	/* no config means no support for that tiling */
 	if (!cmd_info)
@@ -254,6 +263,32 @@ bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
 	return cmd_info->supported_tiling & BIT(tiling);
 }
 
+/**
+ * blt_cmd_has_property:
+ * @blt_info: Blitter commands description struct
+ * @cmd: Blitter command enum
+ * @prop: property flag
+ *
+ * Checks if a @cmd entry of @blt_info has @prop property. The properties can
+ * be freely combined, but the function will return true for platforms for
+ * which all properties defined in the bit flag are present. The function
+ * returns false if no information about the command is stored.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_cmd_has_property(const struct blt_cmds_desc *blt_info,
+			  enum blt_cmd_type cmd, uint32_t prop)
+{
+	struct blt_cmd_info const *cmd_info;
+
+	cmd_info = blt_get_cmd_info(blt_info, cmd);
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
@@ -320,6 +355,40 @@ bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
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
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
+
+	return blt_cmd_has_property(blt_info, XY_BLOCK_COPY,
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
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
+
+	return blt_cmd_has_property(blt_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
+}
+
 /**
  * blt_tiling_name:
  * @tiling: tiling id
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 7acf9595..23e0609f 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -163,10 +163,18 @@ bool blt_supports_command(const struct blt_cmds_desc *blt_info,
 bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
 			     enum blt_cmd_type cmd,
 			     enum blt_tiling_type tiling);
+bool blt_cmd_has_property(const struct blt_cmds_desc *blt_info,
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
-- 
2.25.1
