Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F26F10E29C
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 09:57:44 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 11:57:11 +0200
Message-Id: <3f62b96b453ac1e5d3eabc9621356d0c16ef28d1.1684747649.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1684747649.git.karolina.stolarek@intel.com>
References: <cover.1684747649.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/i915: Add library support for
 XY_COLOR_BLT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Vikas Srivastava <vikas.srivastava@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vikas Srivastava <vikas.srivastava@intel.com>

Add API to check support for XY_COLOR_BLT command
in existing library for gen12 and older platforms.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c        | 16 ++++++++++++++++
 lib/i915/i915_blt.h        |  1 +
 lib/i915/intel_cmds_info.c | 23 ++++++++++++++++++++---
 lib/i915/intel_cmds_info.h |  2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index ef67fe26f..b9a5f8e19 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -317,6 +317,22 @@ bool blt_has_xy_src_copy(int i915)
 	return blt_supports_command(cmds_info, XY_SRC_COPY);
 }
 
+/**
+ * blt_has_xy_color
+ * @i915: drm fd
+ *
+ * Check if XY_COLOR_BLT is supported by @i915 device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_xy_color(int i915)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
+
+	return blt_supports_command(cmds_info, XY_COLOR_BLT);
+}
+
 /**
  * blt_fast_copy_supports_tiling
  * @i915: drm fd
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index a5f0edd15..1e18d15c3 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -169,6 +169,7 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
 bool blt_has_block_copy(int i915);
 bool blt_has_fast_copy(int i915);
 bool blt_has_xy_src_copy(int i915);
+bool blt_has_xy_color(int i915);
 
 bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
index 166fb4740..3ce2fd74b 100644
--- a/lib/i915/intel_cmds_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -82,24 +82,38 @@ static const struct blt_cmd_info
 						 BIT(T_TILE64),
 						 BLT_CMD_EXTENDED);
 
+static const struct blt_cmd_info
+		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
+						 BIT(T_LINEAR) |
+						 BIT(T_YMAJOR) |
+						 BIT(T_XMAJOR),
+						 BLT_CMD_LONG);
+
+static const struct blt_cmd_info
+		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
+						 BIT(T_LINEAR) |
+						 BIT(T_XMAJOR));
+
 const struct intel_cmds_info pre_gen6_cmds_info = {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
-		[XY_SRC_COPY] = &pre_gen6_xy_src_copy
+		[XY_SRC_COPY] = &pre_gen6_xy_src_copy,
+		[XY_COLOR_BLT] = &pre_gen6_xy_color_blt,
 	}
 };
 
 const struct intel_cmds_info gen6_cmds_info =  {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
-		[XY_SRC_COPY] = &gen6_xy_src_copy
+		[XY_SRC_COPY] = &gen6_xy_src_copy,
+		[XY_COLOR_BLT] = &gen6_xy_color_blt,
 	}
-
 };
 
 const struct intel_cmds_info gen8_cmds_info = {
 	.blt_cmds = {
 		[XY_SRC_COPY] = &gen6_xy_src_copy,
+		[XY_COLOR_BLT] = &gen6_xy_color_blt,
 	}
 };
 
@@ -107,6 +121,7 @@ const struct intel_cmds_info gen11_cmds_info = {
 	.blt_cmds = {
 		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &gen11_xy_fast_copy,
+		[XY_COLOR_BLT] = &gen6_xy_color_blt,
 	}
 };
 
@@ -115,6 +130,7 @@ const struct intel_cmds_info gen12_cmds_info = {
 		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &gen12_xy_fast_copy,
 		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
+		[XY_COLOR_BLT] = &gen6_xy_color_blt,
 	}
 };
 
@@ -123,6 +139,7 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
 		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
+		[XY_COLOR_BLT] = &gen6_xy_color_blt,
 	}
 };
 
diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 1db8709f8..5998a35ca 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -23,6 +23,7 @@ enum blt_cmd_type {
 	XY_SRC_COPY,
 	XY_FAST_COPY,
 	XY_BLOCK_COPY,
+	XY_COLOR_BLT,
 	__BLT_MAX_CMD
 };
 
@@ -33,6 +34,7 @@ struct blt_cmd_info {
 	uint32_t flags;
 #define BLT_CMD_EXTENDED               (1 << 0)
 #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
+#define BLT_CMD_LONG                   (1 << 2)
 };
 
 struct intel_cmds_info {
-- 
2.25.1
