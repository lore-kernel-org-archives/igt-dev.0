Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892D310E6EF
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 11:19:23 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 16:49:21 +0530
Message-Id: <20220407111924.21745-2-jeevan.b@intel.com>
In-Reply-To: <20220407111924.21745-1-jeevan.b@intel.com>
References: <20220407111924.21745-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] DO NOT MERGE: drm/fourcc: Introduce
 format modifiers for DG2 render, media compression and clear color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 include/drm-uapi/drm_fourcc.h | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index d8f7cad9..78bebdea 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -583,6 +583,42 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
 
+/*
+ * Intel color control surfaces (CCS) for DG2 render compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. The CCS data is stored
+ * outside of the GEM object in a reserved memory area dedicated for the
+ * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
+ * main surface pitch is required to be a multiple of four Tile 4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
+
+/*
+ * Intel color control surfaces (CCS) for DG2 media compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all RC/RC_CC/MC compressible GEM objects. The main surface
+ * pitch is required to be a multiple of four Tile 4 widths.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
+
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for DG2 render compression.
+ *
+ * The main surface is Tile 4 and at plane index 0. The CCS data is stored
+ * outside of the GEM object in a reserved memory area dedicated for the
+ * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
+ * main surface pitch is required to be a multiple of four Tile 4 widths. The
+ * clear color is stored at plane index 1 and the pitch should be ignored. The
+ * format of the 256 bits of clear color data matches the one used for the
+ * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
+ * for details.
+ */
+#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.35.1
