Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5A610E4C0
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:07:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:28:16 +0530
Message-Id: <20231006075819.3055887-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/4] lib/igt_fb: Use small case for modifier name
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

As few tests are using modifier name as subtest, let's keep
it as a small case. Also, don't mix '_' & '-'.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 54a66eb6a..50b49102b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -4919,32 +4919,32 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 	case DRM_FORMAT_MOD_LINEAR:
 		return "linear";
 	case I915_FORMAT_MOD_X_TILED:
-		return "X";
+		return "x";
 	case I915_FORMAT_MOD_Y_TILED:
-		return "Y";
+		return "y";
 	case I915_FORMAT_MOD_Yf_TILED:
-		return "Yf";
+		return "yf";
 	case I915_FORMAT_MOD_Y_TILED_CCS:
-		return "Y-CCS";
+		return "y-ccs";
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
-		return "Yf-CCS";
+		return "yf-ccs";
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
-		return "Y-RC_CCS";
+		return "y-rc-ccs";
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
-		return "Y-RC_CCS-CC";
+		return "y-rc-ccs-cc";
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
-		return "Y-MC_CCS";
+		return "y-mc-ccs";
 	case I915_FORMAT_MOD_4_TILED:
 		return "4";
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
-		return "4-RC_CCS";
+		return "4-rc-ccs";
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-		return "4-MC_CCS";
+		return "4-mc-ccs";
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-		return "4-RC_CCS-CC";
+		return "4-rc-ccs-cc";
 	default:
 		return "?";
 	}
-- 
2.40.0
