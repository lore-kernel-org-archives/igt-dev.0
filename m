Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59510E02C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 13:25:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 15:24:49 +0200
Message-ID: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_fb: Rework
 igt_fb_modifier_name()
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the switch statement in igt_fb_modifier_name() with
a table so that we'll be able to also do the reverse mapping.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 59 ++++++++++++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e531a041e567..5670bc06c778 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4913,39 +4913,34 @@ void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 	}
 }
 
+static const struct {
+	uint64_t modifier;
+	const char *name;
+} modifiers[] = {
+	{ .modifier = DRM_FORMAT_MOD_LINEAR, .name = "linear", },
+	{ .modifier = I915_FORMAT_MOD_X_TILED, .name = "x", },
+	{ .modifier = I915_FORMAT_MOD_Y_TILED, .name = "y", },
+	{ .modifier = I915_FORMAT_MOD_Yf_TILED, .name = "yf", },
+	{ .modifier = I915_FORMAT_MOD_Y_TILED_CCS, .name = "y-ccs", },
+	{ .modifier = I915_FORMAT_MOD_Yf_TILED_CCS, .name = "yf-ccs", },
+	{ .modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, .name = "y-rc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, .name = "y-rc-ccs-cc", },
+	{ .modifier = I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, .name = "y-mc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED, .name = "4", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, .name = "4-rc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, .name = "4-mc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, .name = "4-rc-ccs-cc", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, .name = "4-rc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, .name = "4-rc-ccs", },
+	{ .modifier = I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, .name = "4-rc-ccs-cc", },
+};
+
 const char *igt_fb_modifier_name(uint64_t modifier)
 {
-	switch (modifier) {
-	case DRM_FORMAT_MOD_LINEAR:
-		return "linear";
-	case I915_FORMAT_MOD_X_TILED:
-		return "x";
-	case I915_FORMAT_MOD_Y_TILED:
-		return "y";
-	case I915_FORMAT_MOD_Yf_TILED:
-		return "yf";
-	case I915_FORMAT_MOD_Y_TILED_CCS:
-		return "y-ccs";
-	case I915_FORMAT_MOD_Yf_TILED_CCS:
-		return "yf-ccs";
-	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
-		return "y-rc-ccs";
-	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
-		return "y-rc-ccs-cc";
-	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
-		return "y-mc-ccs";
-	case I915_FORMAT_MOD_4_TILED:
-		return "4";
-	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
-		return "4-rc-ccs";
-	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
-	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-		return "4-mc-ccs";
-	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
-	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-		return "4-rc-ccs-cc";
-	default:
-		return "?";
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+		if (modifier == modifiers[i].modifier)
+			return modifiers[i].name;
 	}
+
+	return "?";
 }
-- 
2.41.0
