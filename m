Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3110E230
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 14:12:33 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 15:12:10 +0100
Message-Id: <7286dd35d52cd376f25f4020d31a3366537cca71.1675950055.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675950055.git.karolina.stolarek@intel.com>
References: <cover.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 7/9] lib/intel_cmds_info: Add flags field
 to describe command properties
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
platform. Add a new field to blt_cmd_info struct to describe
their properties. Update block-copy definitions for DG2 and MTL
to use that field.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/intel_cmds_info.c | 28 ++++++++++++++++++++++------
 lib/i915/intel_cmds_info.h |  4 ++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
index 9fce0351..59ee0403 100644
--- a/lib/i915/intel_cmds_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -12,6 +12,12 @@
 		.supported_tiling = _tiling \
 	}
 
+#define BLT_INFO_EXT(_cmd, _tiling, _flags)  { \
+		.blt_cmd_type = _cmd, \
+		.supported_tiling = _tiling, \
+		.flags = _flags, \
+	}
+
 static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
 static const struct blt_cmd_info
 		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
@@ -45,11 +51,21 @@ static const struct blt_cmd_info
 					       BIT(T_LINEAR) |
 					       BIT(T_YMAJOR));
 static const struct blt_cmd_info
-		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
-					     BIT(T_LINEAR) |
-					     BIT(T_XMAJOR) |
-					     BIT(T_TILE4)  |
-					     BIT(T_TILE64));
+		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
+						 BIT(T_LINEAR) |
+						 BIT(T_XMAJOR) |
+						 BIT(T_TILE4)  |
+						 BIT(T_TILE64),
+						 BLT_CMD_EXTENDED |
+						 BLT_CMD_SUPPORTS_COMPRESSION);
+
+static const struct blt_cmd_info
+		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
+						 BIT(T_LINEAR) |
+						 BIT(T_XMAJOR) |
+						 BIT(T_TILE4)  |
+						 BIT(T_TILE64),
+						 BLT_CMD_EXTENDED);
 
 const struct intel_cmds_info pre_gen8_cmds_info = {
 	.blt_cmds = {
@@ -90,6 +106,6 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
 const struct intel_cmds_info gen12_mtl_cmds_info = {
 	.blt_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
-		[XY_BLOCK_COPY] = &dg2_xy_block_copy
+		[XY_BLOCK_COPY] = &mtl_xy_block_copy,
 	}
 };
diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 4fdce343..541727ec 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -29,6 +29,10 @@ enum blt_cmd_type {
 struct blt_cmd_info {
 	enum blt_cmd_type blt_cmd_type;
 	uint32_t supported_tiling;
+
+	uint32_t flags;
+#define BLT_CMD_EXTENDED               (1 << 0)
+#define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
 };
 
 struct intel_cmds_info {
-- 
2.25.1
