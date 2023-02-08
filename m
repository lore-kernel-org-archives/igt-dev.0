Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A75010E780
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 13:48:16 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 14:47:34 +0100
Message-Id: <ca6cb77195b2a4f31f06ac58c153740c026a5c01.1675854161.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675854161.git.karolina.stolarek@intel.com>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/6] lib/intel_tiling_info: Rename
 blt_cmd_info to blt_cmds_desc
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

The struct stores information on more than just one blitter cmd,
so the current name is slightly confusing. Change it to
blt_cmds_desc to emphasize that it describes available commands
on the platform. Change the field name in intel_device_info, as
it won't just describe tiling information.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c          | 28 ++++++++--------
 lib/i915/i915_blt.h          |  4 +--
 lib/i915/intel_tiling_info.c | 12 +++----
 lib/i915/intel_tiling_info.h | 14 ++++----
 lib/intel_chipset.h          |  4 +--
 lib/intel_device_info.c      | 64 ++++++++++++++++++------------------
 6 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index bbfb6ffc..32d22720 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -210,42 +210,42 @@ bool blt_supports_compression(int i915)
 
 /**
  * blt_supports_command:
- * @info: Blitter command info struct
+ * @blt_info: Blitter commands description struct
  * @cmd: Blitter command enum
  *
- * Checks if @info has an entry of supported tiling formats for @cmd command.
+ * Checks if @blt_info has an entry of supported tiling formats for @cmd command.
  *
  * Returns: true if it does, false otherwise
  */
-bool blt_supports_command(const struct blt_cmd_info *info,
+bool blt_supports_command(const struct blt_cmds_desc *blt_info,
 			  enum blt_cmd_type cmd)
 {
-	igt_require_f(info, "No config found for the platform\n");
+	igt_require_f(blt_info, "No config found for the platform\n");
 
-	return info->supported_cmds[cmd];
+	return blt_info->supported_cmds[cmd];
 }
 
 /**
  * blt_cmd_supports_tiling:
- * @info: Blitter command info struct
+ * @blt_info: Blitter commands description struct
  * @cmd: Blitter command enum
  * @tiling: tiling format enum
  *
- * Checks if a @cmd entry of @info lists @tiling. It also returns false if
+ * Checks if a @cmd entry of @blt_info lists @tiling. It also returns false if
  * no information about the command is stored.
  *
  * Returns: true if it does, false otherwise
  */
-bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
 			     enum blt_cmd_type cmd,
 			     enum blt_tiling_type tiling)
 {
 	struct blt_tiling_info const *tile_config;
 
-	if (!info)
+	if (!blt_info)
 		return false;
 
-	tile_config = info->supported_cmds[cmd];
+	tile_config = blt_info->supported_cmds[cmd];
 
 	/* no config means no support for that tiling */
 	if (!tile_config)
@@ -265,7 +265,7 @@ bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
  */
 bool blt_has_block_copy(int i915)
 {
-	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
 
 	return blt_supports_command(blt_info, XY_BLOCK_COPY);
 }
@@ -281,7 +281,7 @@ bool blt_has_block_copy(int i915)
  */
 bool blt_has_fast_copy(int i915)
 {
-	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
 
 	return blt_supports_command(blt_info, XY_FAST_COPY);
 }
@@ -298,7 +298,7 @@ bool blt_has_fast_copy(int i915)
  */
 bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
-	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
 
 	return blt_cmd_supports_tiling(blt_info, XY_FAST_COPY, tiling);
 }
@@ -315,7 +315,7 @@ bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
  */
 bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
-	const struct blt_cmd_info *blt_info = GET_BLT_INFO(i915);
+	const struct blt_cmds_desc *blt_info = GET_BLT_INFO(i915);
 
 	return blt_cmd_supports_tiling(blt_info, XY_BLOCK_COPY, tiling);
 }
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 299dff8e..6a0c246a 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -158,9 +158,9 @@ struct blt_ctrl_surf_copy_data {
 };
 
 bool blt_supports_compression(int i915);
-bool blt_supports_command(const struct blt_cmd_info *info,
+bool blt_supports_command(const struct blt_cmds_desc *blt_info,
 			  enum blt_cmd_type cmd);
-bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+bool blt_cmd_supports_tiling(const struct blt_cmds_desc *blt_info,
 			     enum blt_cmd_type cmd,
 			     enum blt_tiling_type tiling);
 bool blt_has_block_copy(int i915);
diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
index fc388919..671b9934 100644
--- a/lib/i915/intel_tiling_info.c
+++ b/lib/i915/intel_tiling_info.c
@@ -51,27 +51,27 @@ static const struct blt_tiling_info
 					     BIT(T_TILE4)  |
 					     BIT(T_TILE64));
 
-const struct blt_cmd_info pre_gen8_blt_info = {
+const struct blt_cmds_desc pre_gen8_blt_info = {
 	.supported_cmds = {
 		[SRC_COPY] = &src_copy,
 		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
 	}
 };
 
-const struct blt_cmd_info gen8_blt_info = {
+const struct blt_cmds_desc gen8_blt_info = {
 	.supported_cmds = {
 		[XY_SRC_COPY] = &gen8_xy_src_copy,
 	}
 };
 
-const struct blt_cmd_info gen11_blt_info = {
+const struct blt_cmds_desc gen11_blt_info = {
 	.supported_cmds = {
 		[XY_SRC_COPY] = &gen8_xy_src_copy,
 		[XY_FAST_COPY] = &gen11_xy_fast_copy,
 	}
 };
 
-const struct blt_cmd_info gen12_blt_info = {
+const struct blt_cmds_desc gen12_blt_info = {
 	.supported_cmds = {
 		[XY_SRC_COPY] = &gen8_xy_src_copy,
 		[XY_FAST_COPY] = &gen12_xy_fast_copy,
@@ -79,7 +79,7 @@ const struct blt_cmd_info gen12_blt_info = {
 	}
 };
 
-const struct blt_cmd_info gen12_dg2_blt_info = {
+const struct blt_cmds_desc gen12_dg2_blt_info = {
 	.supported_cmds = {
 		[XY_SRC_COPY] = &gen8_xy_src_copy,
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
@@ -87,7 +87,7 @@ const struct blt_cmd_info gen12_dg2_blt_info = {
 	}
 };
 
-const struct blt_cmd_info gen12_mtl_blt_info = {
+const struct blt_cmds_desc gen12_mtl_blt_info = {
 	.supported_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &dg2_xy_block_copy
diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_tiling_info.h
index bb655103..97fb1ce8 100644
--- a/lib/i915/intel_tiling_info.h
+++ b/lib/i915/intel_tiling_info.h
@@ -31,16 +31,16 @@ struct blt_tiling_info {
 	uint32_t supported_tiling;
 };
 
-struct blt_cmd_info {
+struct blt_cmds_desc {
 	struct blt_tiling_info const *supported_cmds[__BLT_MAX_CMD];
 };
 
-extern const struct blt_cmd_info pre_gen8_blt_info;
-extern const struct blt_cmd_info gen8_blt_info;
-extern const struct blt_cmd_info gen11_blt_info;
-extern const struct blt_cmd_info gen12_blt_info;
-extern const struct blt_cmd_info gen12_dg2_blt_info;
-extern const struct blt_cmd_info gen12_mtl_blt_info;
+extern const struct blt_cmds_desc pre_gen8_blt_info;
+extern const struct blt_cmds_desc gen8_blt_info;
+extern const struct blt_cmds_desc gen11_blt_info;
+extern const struct blt_cmds_desc gen12_blt_info;
+extern const struct blt_cmds_desc gen12_dg2_blt_info;
+extern const struct blt_cmds_desc gen12_mtl_blt_info;
 
 #define for_each_tiling(__tiling) \
 	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cceca929..2e44de24 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -88,13 +88,13 @@ struct intel_device_info {
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
 	bool is_meteorlake : 1;
-	const struct blt_cmd_info *blt_tiling;
+	const struct blt_cmds_desc *blt_info;
 	const char *codename;
 };
 
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
-const struct blt_cmd_info *intel_get_blt_info(uint16_t devid) __attribute__((pure));
+const struct blt_cmds_desc *intel_get_blt_info(uint16_t devid) __attribute__((pure));
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 49e95ac8..56a6bbc3 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -145,7 +145,7 @@ static const struct intel_device_info intel_sandybridge_info = {
 	.graphics_ver = 6,
 	.display_ver = 6,
 	.is_sandybridge = true,
-	.blt_tiling = &pre_gen8_blt_info,
+	.blt_info = &pre_gen8_blt_info,
 	.codename = "sandybridge"
 };
 static const struct intel_device_info intel_sandybridge_m_info = {
@@ -153,7 +153,7 @@ static const struct intel_device_info intel_sandybridge_m_info = {
 	.display_ver = 6,
 	.is_mobile = true,
 	.is_sandybridge = true,
-	.blt_tiling = &pre_gen8_blt_info,
+	.blt_info = &pre_gen8_blt_info,
 	.codename = "sandybridge"
 };
 
@@ -161,7 +161,7 @@ static const struct intel_device_info intel_ivybridge_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_ivybridge = true,
-	.blt_tiling = &pre_gen8_blt_info,
+	.blt_info = &pre_gen8_blt_info,
 	.codename = "ivybridge"
 };
 static const struct intel_device_info intel_ivybridge_m_info = {
@@ -169,7 +169,7 @@ static const struct intel_device_info intel_ivybridge_m_info = {
 	.display_ver = 7,
 	.is_mobile = true,
 	.is_ivybridge = true,
-	.blt_tiling = &pre_gen8_blt_info,
+	.blt_info = &pre_gen8_blt_info,
 	.codename = "ivybridge"
 };
 
@@ -177,7 +177,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_valleyview = true,
-	.blt_tiling = &pre_gen8_blt_info,
+	.blt_info = &pre_gen8_blt_info,
 	.codename = "valleyview"
 };
 
@@ -185,7 +185,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7, \
 	.display_ver = 7, \
 	.is_haswell = true, \
-	.blt_tiling = &pre_gen8_blt_info, \
+	.blt_info = &pre_gen8_blt_info, \
 	.codename = "haswell"
 
 static const struct intel_device_info intel_haswell_gt1_info = {
@@ -207,7 +207,7 @@ static const struct intel_device_info intel_haswell_gt3_info = {
 	.graphics_ver = 8, \
 	.display_ver = 8, \
 	.is_broadwell = true, \
-	.blt_tiling = &gen8_blt_info, \
+	.blt_info = &gen8_blt_info, \
 	.codename = "broadwell"
 
 static const struct intel_device_info intel_broadwell_gt1_info = {
@@ -233,14 +233,14 @@ static const struct intel_device_info intel_cherryview_info = {
 	.graphics_ver = 8,
 	.display_ver = 8,
 	.is_cherryview = true,
-	.blt_tiling = &gen8_blt_info,
+	.blt_info = &gen8_blt_info,
 	.codename = "cherryview"
 };
 
 #define SKYLAKE_FIELDS \
 	.graphics_ver = 9, \
 	.display_ver = 9, \
-	.blt_tiling = &gen11_blt_info, \
+	.blt_info = &gen11_blt_info, \
 	.codename = "skylake", \
 	.is_skylake = true
 
@@ -268,7 +268,7 @@ static const struct intel_device_info intel_broxton_info = {
 	.graphics_ver = 9,
 	.display_ver = 9,
 	.is_broxton = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "broxton"
 };
 
@@ -276,7 +276,7 @@ static const struct intel_device_info intel_broxton_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_kabylake = true, \
-	.blt_tiling = &gen11_blt_info, \
+	.blt_info = &gen11_blt_info, \
 	.codename = "kabylake"
 
 static const struct intel_device_info intel_kabylake_gt1_info = {
@@ -303,7 +303,7 @@ static const struct intel_device_info intel_geminilake_info = {
 	.graphics_ver = 9,
 	.display_ver = 9,
 	.is_geminilake = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "geminilake"
 };
 
@@ -311,7 +311,7 @@ static const struct intel_device_info intel_geminilake_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_coffeelake = true, \
-	.blt_tiling = &gen11_blt_info, \
+	.blt_info = &gen11_blt_info, \
 	.codename = "coffeelake"
 
 static const struct intel_device_info intel_coffeelake_gt1_info = {
@@ -333,7 +333,7 @@ static const struct intel_device_info intel_coffeelake_gt3_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_cometlake = true, \
-	.blt_tiling = &gen11_blt_info, \
+	.blt_info = &gen11_blt_info, \
 	.codename = "cometlake"
 
 static const struct intel_device_info intel_cometlake_gt1_info = {
@@ -350,7 +350,7 @@ static const struct intel_device_info intel_cannonlake_info = {
 	.graphics_ver = 10,
 	.display_ver = 10,
 	.is_cannonlake = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "cannonlake"
 };
 
@@ -358,7 +358,7 @@ static const struct intel_device_info intel_icelake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_icelake = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "icelake"
 };
 
@@ -366,7 +366,7 @@ static const struct intel_device_info intel_elkhartlake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_elkhartlake = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "elkhartlake"
 };
 
@@ -374,7 +374,7 @@ static const struct intel_device_info intel_jasperlake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_jasperlake = true,
-	.blt_tiling = &gen11_blt_info,
+	.blt_info = &gen11_blt_info,
 	.codename = "jasperlake"
 };
 
@@ -382,7 +382,7 @@ static const struct intel_device_info intel_tigerlake_gt1_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_tigerlake = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "tigerlake",
 	.gt = 1,
 };
@@ -391,7 +391,7 @@ static const struct intel_device_info intel_tigerlake_gt2_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_tigerlake = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "tigerlake",
 	.gt = 2,
 };
@@ -400,7 +400,7 @@ static const struct intel_device_info intel_rocketlake_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_rocketlake = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "rocketlake"
 };
 
@@ -409,7 +409,7 @@ static const struct intel_device_info intel_dg1_info = {
 	.graphics_rel = 10,
 	.display_ver = 12,
 	.is_dg1 = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "dg1"
 };
 
@@ -420,7 +420,7 @@ static const struct intel_device_info intel_dg2_info = {
 	.has_4tile = true,
 	.is_dg2 = true,
 	.codename = "dg2",
-	.blt_tiling = &gen12_dg2_blt_info,
+	.blt_info = &gen12_dg2_blt_info,
 	.has_flatccs = true,
 };
 
@@ -428,7 +428,7 @@ static const struct intel_device_info intel_alderlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_alderlake_s = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "alderlake_s"
 };
 
@@ -436,7 +436,7 @@ static const struct intel_device_info intel_raptorlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_raptorlake_s = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "raptorlake_s"
 };
 
@@ -444,7 +444,7 @@ static const struct intel_device_info intel_alderlake_p_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
 	.is_alderlake_p = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "alderlake_p"
 };
 
@@ -452,7 +452,7 @@ static const struct intel_device_info intel_alderlake_n_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
 	.is_alderlake_n = true,
-	.blt_tiling = &gen12_blt_info,
+	.blt_info = &gen12_blt_info,
 	.codename = "alderlake_n"
 };
 
@@ -463,7 +463,7 @@ static const struct intel_device_info intel_ats_m_info = {
 	.is_dg2 = true,
 	.has_4tile = true,
 	.codename = "ats_m",
-	.blt_tiling = &gen12_dg2_blt_info,
+	.blt_info = &gen12_dg2_blt_info,
 	.has_flatccs = true,
 };
 
@@ -474,7 +474,7 @@ static const struct intel_device_info intel_meteorlake_info = {
 	.has_4tile = true,
 	.is_meteorlake = true,
 	.codename = "meteorlake",
-	.blt_tiling = &gen12_mtl_blt_info
+	.blt_info = &gen12_mtl_blt_info
 };
 
 static const struct pci_id_match intel_device_match[] = {
@@ -620,15 +620,15 @@ out:
  * by the device.
  *
  * Returns:
- * The associated blt_cmd_info, NULL if no such information is found
+ * The associated blt_cmds_desc, NULL if no such information is found
  */
-const struct blt_cmd_info *intel_get_blt_info(uint16_t devid)
+const struct blt_cmds_desc *intel_get_blt_info(uint16_t devid)
 {
 	const struct intel_device_info *dev_info;
 
 	dev_info = intel_get_device_info(devid);
 
-	return dev_info->blt_tiling;
+	return dev_info->blt_info;
 }
 
 /**
-- 
2.25.1
