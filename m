Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5507810E1A7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:23:36 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 15:23:30 -0700
Message-Id: <20230329222331.32734-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
References: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib: Add Pontevecchio platform
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

Add library support for Pontevecchio (PVC) platform.

v2: Fix by properly adding full pvc library support

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/intel_cmds_info.c | 20 ++++++++++++++++++++
 lib/i915/intel_cmds_info.h |  1 +
 lib/i915_pciids.h          | 13 +++++++++++++
 lib/intel_chipset.h        |  2 ++
 lib/intel_device_info.c    | 10 ++++++++++
 5 files changed, 46 insertions(+)

diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
index 08fc981ac..166fb4740 100644
--- a/lib/i915/intel_cmds_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -48,6 +48,12 @@ static const struct blt_cmd_info
 					    BIT(T_XMAJOR) |
 					    BIT(T_TILE4)  |
 					    BIT(T_TILE64));
+static const struct blt_cmd_info
+		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
+					    BIT(T_LINEAR) |
+					    BIT(T_TILE4)  |
+					    BIT(T_TILE64));
+
 static const struct blt_cmd_info
 		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
 					       BIT(T_LINEAR) |
@@ -69,6 +75,13 @@ static const struct blt_cmd_info
 						 BIT(T_TILE64),
 						 BLT_CMD_EXTENDED);
 
+static const struct blt_cmd_info
+		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
+						 BIT(T_LINEAR) |
+						 BIT(T_TILE4)  |
+						 BIT(T_TILE64),
+						 BLT_CMD_EXTENDED);
+
 const struct intel_cmds_info pre_gen6_cmds_info = {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
@@ -120,6 +133,13 @@ const struct intel_cmds_info gen12_mtl_cmds_info = {
 	}
 };
 
+const struct intel_cmds_info gen12_pvc_cmds_info = {
+	.blt_cmds = {
+		[XY_FAST_COPY] = &pvc_xy_fast_copy,
+		[XY_BLOCK_COPY] = &pvc_xy_block_copy,
+	}
+};
+
 const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
 					    enum blt_cmd_type cmd)
 {
diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 9af2f2d99..1db8709f8 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -46,6 +46,7 @@ extern const struct intel_cmds_info gen11_cmds_info;
 extern const struct intel_cmds_info gen12_cmds_info;
 extern const struct intel_cmds_info gen12_dg2_cmds_info;
 extern const struct intel_cmds_info gen12_mtl_cmds_info;
+extern const struct intel_cmds_info gen12_pvc_cmds_info;
 
 #define for_each_tiling(__tiling) \
 	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 14f3ff198..bee58554d 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -750,4 +750,17 @@
 	INTEL_MTL_M_IDS(info), \
 	INTEL_MTL_P_IDS(info)
 
+/* PVC */
+#define INTEL_PVC_IDS(info) \
+	INTEL_VGA_DEVICE(0x0BD0, info),	\
+	INTEL_VGA_DEVICE(0x0BD5, info),	\
+	INTEL_VGA_DEVICE(0x0BD6, info),	\
+	INTEL_VGA_DEVICE(0x0BD7, info),	\
+	INTEL_VGA_DEVICE(0x0BD8, info),	\
+	INTEL_VGA_DEVICE(0x0BD9, info),	\
+	INTEL_VGA_DEVICE(0x0BDA, info),	\
+	INTEL_VGA_DEVICE(0x0BDB, info),	\
+	INTEL_VGA_DEVICE(0x0BD1, info),	\
+	INTEL_VGA_DEVICE(0x0BD2, info)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index c2c8998dd..accfa90ef 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -89,6 +89,7 @@ struct intel_device_info {
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
 	bool is_meteorlake : 1;
+	bool is_pontevecchio : 1;
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
 };
@@ -201,6 +202,7 @@ void intel_check_pch(void);
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
 #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
+#define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 754479ffb..2c9a45b68 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -495,6 +495,14 @@ static const struct intel_device_info intel_meteorlake_info = {
 	.cmds_info = &gen12_mtl_cmds_info,
 };
 
+static const struct intel_device_info intel_pontevecchio_info = {
+	.graphics_ver = 12,
+	.graphics_rel = 60,
+	.is_pontevecchio = true,
+	.codename = "pontevecchio",
+	.cmds_info = &gen12_pvc_cmds_info,
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -596,6 +604,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_MTL_IDS(&intel_meteorlake_info),
 
+	INTEL_PVC_IDS(&intel_pontevecchio_info),
+
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.21.0.rc0.32.g243a4c7e27
