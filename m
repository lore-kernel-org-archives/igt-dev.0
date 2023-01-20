Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E4F10EA09
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 10:14:27 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 11:14:05 +0100
Message-Id: <959b5a5302d5b728e8725b5635f564299ea39ced.1674208534.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1674208534.git.karolina.stolarek@intel.com>
References: <cover.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 5/9] lib/intel_device_info: Update
 platform definitions with blitter information
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

Update entries in intel_device_info to store information on
supported blitter commands and tiling formats. Add a function
to return tiling information for a device.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_chipset.h     |  4 ++++
 lib/intel_device_info.c | 47 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 9b39472a..cceca929 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -31,6 +31,8 @@
 #include <pciaccess.h>
 #include <stdbool.h>
 
+#include "i915/intel_tiling_info.h"
+
 #define BIT(x) (1ul <<(x))
 
 struct pci_device *intel_get_pci_device(void);
@@ -86,11 +88,13 @@ struct intel_device_info {
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
 	bool is_meteorlake : 1;
+	const struct blt_cmd_info *blt_tiling;
 	const char *codename;
 };
 
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
+const struct blt_cmd_info *intel_get_blt_info(uint16_t devid) __attribute__((pure));
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 68dd17ee..f1233ee0 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -145,6 +145,7 @@ static const struct intel_device_info intel_sandybridge_info = {
 	.graphics_ver = 6,
 	.display_ver = 6,
 	.is_sandybridge = true,
+	.blt_tiling = &pre_gen8_blt_info,
 	.codename = "sandybridge"
 };
 static const struct intel_device_info intel_sandybridge_m_info = {
@@ -152,6 +153,7 @@ static const struct intel_device_info intel_sandybridge_m_info = {
 	.display_ver = 6,
 	.is_mobile = true,
 	.is_sandybridge = true,
+	.blt_tiling = &pre_gen8_blt_info,
 	.codename = "sandybridge"
 };
 
@@ -159,6 +161,7 @@ static const struct intel_device_info intel_ivybridge_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_ivybridge = true,
+	.blt_tiling = &pre_gen8_blt_info,
 	.codename = "ivybridge"
 };
 static const struct intel_device_info intel_ivybridge_m_info = {
@@ -166,6 +169,7 @@ static const struct intel_device_info intel_ivybridge_m_info = {
 	.display_ver = 7,
 	.is_mobile = true,
 	.is_ivybridge = true,
+	.blt_tiling = &pre_gen8_blt_info,
 	.codename = "ivybridge"
 };
 
@@ -173,6 +177,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7,
 	.display_ver = 7,
 	.is_valleyview = true,
+	.blt_tiling = &pre_gen8_blt_info,
 	.codename = "valleyview"
 };
 
@@ -180,6 +185,7 @@ static const struct intel_device_info intel_valleyview_info = {
 	.graphics_ver = 7, \
 	.display_ver = 7, \
 	.is_haswell = true, \
+	.blt_tiling = &pre_gen8_blt_info, \
 	.codename = "haswell"
 
 static const struct intel_device_info intel_haswell_gt1_info = {
@@ -201,6 +207,7 @@ static const struct intel_device_info intel_haswell_gt3_info = {
 	.graphics_ver = 8, \
 	.display_ver = 8, \
 	.is_broadwell = true, \
+	.blt_tiling = &gen8_blt_info, \
 	.codename = "broadwell"
 
 static const struct intel_device_info intel_broadwell_gt1_info = {
@@ -226,12 +233,14 @@ static const struct intel_device_info intel_cherryview_info = {
 	.graphics_ver = 8,
 	.display_ver = 8,
 	.is_cherryview = true,
+	.blt_tiling = &gen8_blt_info,
 	.codename = "cherryview"
 };
 
 #define SKYLAKE_FIELDS \
 	.graphics_ver = 9, \
 	.display_ver = 9, \
+	.blt_tiling = &gen11_blt_info, \
 	.codename = "skylake", \
 	.is_skylake = true
 
@@ -259,6 +268,7 @@ static const struct intel_device_info intel_broxton_info = {
 	.graphics_ver = 9,
 	.display_ver = 9,
 	.is_broxton = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "broxton"
 };
 
@@ -266,6 +276,7 @@ static const struct intel_device_info intel_broxton_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_kabylake = true, \
+	.blt_tiling = &gen11_blt_info, \
 	.codename = "kabylake"
 
 static const struct intel_device_info intel_kabylake_gt1_info = {
@@ -292,6 +303,7 @@ static const struct intel_device_info intel_geminilake_info = {
 	.graphics_ver = 9,
 	.display_ver = 9,
 	.is_geminilake = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "geminilake"
 };
 
@@ -299,6 +311,7 @@ static const struct intel_device_info intel_geminilake_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_coffeelake = true, \
+	.blt_tiling = &gen11_blt_info, \
 	.codename = "coffeelake"
 
 static const struct intel_device_info intel_coffeelake_gt1_info = {
@@ -320,6 +333,7 @@ static const struct intel_device_info intel_coffeelake_gt3_info = {
 	.graphics_ver = 9, \
 	.display_ver = 9, \
 	.is_cometlake = true, \
+	.blt_tiling = &gen11_blt_info, \
 	.codename = "cometlake"
 
 static const struct intel_device_info intel_cometlake_gt1_info = {
@@ -336,6 +350,7 @@ static const struct intel_device_info intel_cannonlake_info = {
 	.graphics_ver = 10,
 	.display_ver = 10,
 	.is_cannonlake = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "cannonlake"
 };
 
@@ -343,6 +358,7 @@ static const struct intel_device_info intel_icelake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_icelake = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "icelake"
 };
 
@@ -350,6 +366,7 @@ static const struct intel_device_info intel_elkhartlake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_elkhartlake = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "elkhartlake"
 };
 
@@ -357,6 +374,7 @@ static const struct intel_device_info intel_jasperlake_info = {
 	.graphics_ver = 11,
 	.display_ver = 11,
 	.is_jasperlake = true,
+	.blt_tiling = &gen11_blt_info,
 	.codename = "jasperlake"
 };
 
@@ -364,6 +382,7 @@ static const struct intel_device_info intel_tigerlake_gt1_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_tigerlake = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "tigerlake",
 	.gt = 1,
 };
@@ -372,6 +391,7 @@ static const struct intel_device_info intel_tigerlake_gt2_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_tigerlake = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "tigerlake",
 	.gt = 2,
 };
@@ -380,6 +400,7 @@ static const struct intel_device_info intel_rocketlake_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_rocketlake = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "rocketlake"
 };
 
@@ -388,6 +409,7 @@ static const struct intel_device_info intel_dg1_info = {
 	.graphics_rel = 10,
 	.display_ver = 12,
 	.is_dg1 = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "dg1"
 };
 
@@ -398,6 +420,7 @@ static const struct intel_device_info intel_dg2_info = {
 	.has_4tile = true,
 	.is_dg2 = true,
 	.codename = "dg2",
+	.blt_tiling = &gen12_dg2_blt_info,
 	.has_flatccs = true,
 };
 
@@ -405,6 +428,7 @@ static const struct intel_device_info intel_alderlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_alderlake_s = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "alderlake_s"
 };
 
@@ -412,6 +436,7 @@ static const struct intel_device_info intel_raptorlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
 	.is_raptorlake_s = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "raptorlake_s"
 };
 
@@ -419,6 +444,7 @@ static const struct intel_device_info intel_alderlake_p_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
 	.is_alderlake_p = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "alderlake_p"
 };
 
@@ -426,6 +452,7 @@ static const struct intel_device_info intel_alderlake_n_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
 	.is_alderlake_n = true,
+	.blt_tiling = &gen12_blt_info,
 	.codename = "alderlake_n"
 };
 
@@ -436,6 +463,7 @@ static const struct intel_device_info intel_ats_m_info = {
 	.is_dg2 = true,
 	.has_4tile = true,
 	.codename = "ats_m",
+	.blt_tiling = &gen12_dg2_blt_info,
 	.has_flatccs = true,
 };
 
@@ -583,6 +611,25 @@ out:
 	return cache;
 }
 
+/**
+ * intel_get_blt_info:
+ * @devid: pci device id
+ *
+ * Looks up information on blitter commands and tiling formats supported
+ * by the device.
+ *
+ * Returns:
+ * The associated blt_cmd_info, NULL if no such information is found
+ */
+const struct blt_cmd_info *intel_get_blt_info(uint16_t devid)
+{
+	const struct intel_device_info *dev_info;
+
+	dev_info = intel_get_device_info(devid);
+
+	return dev_info->blt_tiling;
+}
+
 /**
  * intel_gen:
  * @devid: pci device id
-- 
2.25.1
