Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449EA10E004
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 11:21:06 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:20:57 +0100
Message-Id: <6ee211efe5d3be2ec415ebec4efa0fc87f6e5be4.1678273325.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678273325.git.karolina.stolarek@intel.com>
References: <cover.1678273325.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/7] lib/intel_cmds_info: Correct tiling
 formats for XY_SRC_COPY
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

Both TileX and TileY are supported since SNB. Update definitions
for pre-SNB and pre-BDW platforms.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/intel_cmds_info.c | 24 ++++++++++++++++--------
 lib/i915/intel_cmds_info.h |  3 ++-
 lib/intel_device_info.c    | 12 ++++++------
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
index 2ac6bc2a..08fc981a 100644
--- a/lib/i915/intel_cmds_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -22,11 +22,11 @@
 
 static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
 static const struct blt_cmd_info
-		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
+		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
 						BIT(T_LINEAR) |
 						BIT(T_XMAJOR));
 static const struct blt_cmd_info
-		gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
+		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
 					    BIT(T_LINEAR) |
 					    BIT(T_XMAJOR) |
 					    BIT(T_YMAJOR));
@@ -69,29 +69,37 @@ static const struct blt_cmd_info
 						 BIT(T_TILE64),
 						 BLT_CMD_EXTENDED);
 
-const struct intel_cmds_info pre_gen8_cmds_info = {
+const struct intel_cmds_info pre_gen6_cmds_info = {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
-		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
+		[XY_SRC_COPY] = &pre_gen6_xy_src_copy
 	}
 };
 
+const struct intel_cmds_info gen6_cmds_info =  {
+	.blt_cmds = {
+		[SRC_COPY] = &src_copy,
+		[XY_SRC_COPY] = &gen6_xy_src_copy
+	}
+
+};
+
 const struct intel_cmds_info gen8_cmds_info = {
 	.blt_cmds = {
-		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_SRC_COPY] = &gen6_xy_src_copy,
 	}
 };
 
 const struct intel_cmds_info gen11_cmds_info = {
 	.blt_cmds = {
-		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &gen11_xy_fast_copy,
 	}
 };
 
 const struct intel_cmds_info gen12_cmds_info = {
 	.blt_cmds = {
-		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &gen12_xy_fast_copy,
 		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
 	}
@@ -99,7 +107,7 @@ const struct intel_cmds_info gen12_cmds_info = {
 
 const struct intel_cmds_info gen12_dg2_cmds_info = {
 	.blt_cmds = {
-		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_SRC_COPY] = &gen6_xy_src_copy,
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
 	}
diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 9bf6ecd5..57e34c4b 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -39,7 +39,8 @@ struct intel_cmds_info {
 	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
 };
 
-extern const struct intel_cmds_info pre_gen8_cmds_info;
+extern const struct intel_cmds_info pre_gen6_cmds_info;
+extern const struct intel_cmds_info gen6_cmds_info;
 extern const struct intel_cmds_info gen8_cmds_info;
 extern const struct intel_cmds_info gen11_cmds_info;
 extern const struct intel_cmds_info gen12_cmds_info;
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 12b81d48..0baad721 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -145,7 +145,7 @@ static const struct intel_device_info intel_sandybridge_info = {
 	.graphics_ver = 6,
 	.display_ver = 6,
 	.is_sandybridge = true,
-	.cmds_info = &pre_gen8_cmds_info,
+	.cmds_info = &gen6_cmds_info,
 	.codename = "sandybridge"
 };
 static const struct intel_device_info intel_sandybridge_m_info = {
@@ -153,7 +153,7 @@ static const struct intel_device_info intel_sandybridge_m_info = {
 	.display_ver = 6,
 	.is_mobile = true,
 	.is_sandybridge = true,
-	.cmds_info = &pre_gen8_cmds_info,
+	.cmds_info = &gen6_cmds_info,
 	.codename = "sandybridge"
 };
 
@@ -161,7 +161,7 @@ static const struct intel_device_info intel_ivybridge_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_ivybridge = true,
-	.cmds_info = &pre_gen8_cmds_info,
+	.cmds_info = &gen6_cmds_info,
 	.codename = "ivybridge"
 };
 static const struct intel_device_info intel_ivybridge_m_info = {
@@ -169,7 +169,7 @@ static const struct intel_device_info intel_ivybridge_m_info = {
 	.display_ver = 7,
 	.is_mobile = true,
 	.is_ivybridge = true,
-	.cmds_info = &pre_gen8_cmds_info,
+	.cmds_info = &gen6_cmds_info,
 	.codename = "ivybridge"
 };
 
@@ -177,7 +177,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_valleyview = true,
-	.cmds_info = &pre_gen8_cmds_info,
+	.cmds_info = &gen6_cmds_info,
 	.codename = "valleyview"
 };
 
@@ -185,7 +185,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7, \
 	.display_ver = 7, \
 	.is_haswell = true, \
-	.cmds_info = &pre_gen8_cmds_info, \
+	.cmds_info = &gen6_cmds_info, \
 	.codename = "haswell"
 
 static const struct intel_device_info intel_haswell_gt1_info = {
-- 
2.25.1
