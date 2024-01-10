Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F110E574
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 08:22:53 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] lib: sync i915_pciids.h with kernel
Date: Wed, 10 Jan 2024 13:45:32 +0530
Message-Id: <20240110081532.1378038-4-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
References: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This synchronizes with kernel commit

    5032c607e886 ("drm/i915: ATS-M device ID update")

v2: Keep i915_pciids.h changes only (Juha-Pekka Heikkila)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915_pciids.h | 56 +++++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index bee58554d..fcf1849aa 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -588,6 +588,7 @@
 	INTEL_VGA_DEVICE(0x4551, info), \
 	INTEL_VGA_DEVICE(0x4555, info), \
 	INTEL_VGA_DEVICE(0x4557, info), \
+	INTEL_VGA_DEVICE(0x4570, info), \
 	INTEL_VGA_DEVICE(0x4571, info)
 
 /* JSL */
@@ -641,6 +642,7 @@
 	INTEL_VGA_DEVICE(0x4682, info), \
 	INTEL_VGA_DEVICE(0x4688, info), \
 	INTEL_VGA_DEVICE(0x468A, info), \
+	INTEL_VGA_DEVICE(0x468B, info), \
 	INTEL_VGA_DEVICE(0x4690, info), \
 	INTEL_VGA_DEVICE(0x4692, info), \
 	INTEL_VGA_DEVICE(0x4693, info)
@@ -683,14 +685,22 @@
 	INTEL_VGA_DEVICE(0xA78A, info), \
 	INTEL_VGA_DEVICE(0xA78B, info)
 
+/* RPL-U */
+#define INTEL_RPLU_IDS(info) \
+	INTEL_VGA_DEVICE(0xA721, info), \
+	INTEL_VGA_DEVICE(0xA7A1, info), \
+	INTEL_VGA_DEVICE(0xA7A9, info), \
+	INTEL_VGA_DEVICE(0xA7AC, info), \
+	INTEL_VGA_DEVICE(0xA7AD, info)
+
 /* RPL-P */
 #define INTEL_RPLP_IDS(info) \
+	INTEL_RPLU_IDS(info), \
 	INTEL_VGA_DEVICE(0xA720, info), \
-	INTEL_VGA_DEVICE(0xA721, info), \
 	INTEL_VGA_DEVICE(0xA7A0, info), \
-	INTEL_VGA_DEVICE(0xA7A1, info), \
 	INTEL_VGA_DEVICE(0xA7A8, info), \
-	INTEL_VGA_DEVICE(0xA7A9, info)
+	INTEL_VGA_DEVICE(0xA7AA, info), \
+	INTEL_VGA_DEVICE(0xA7AB, info)
 
 /* DG2 */
 #define INTEL_DG2_G10_IDS(info) \
@@ -705,11 +715,14 @@
 	INTEL_VGA_DEVICE(0x5693, info), \
 	INTEL_VGA_DEVICE(0x5694, info), \
 	INTEL_VGA_DEVICE(0x5695, info), \
-	INTEL_VGA_DEVICE(0x5698, info), \
 	INTEL_VGA_DEVICE(0x56A5, info), \
 	INTEL_VGA_DEVICE(0x56A6, info), \
 	INTEL_VGA_DEVICE(0x56B0, info), \
-	INTEL_VGA_DEVICE(0x56B1, info)
+	INTEL_VGA_DEVICE(0x56B1, info), \
+	INTEL_VGA_DEVICE(0x56BA, info), \
+	INTEL_VGA_DEVICE(0x56BB, info), \
+	INTEL_VGA_DEVICE(0x56BC, info), \
+	INTEL_VGA_DEVICE(0x56BD, info)
 
 #define INTEL_DG2_G12_IDS(info) \
 	INTEL_VGA_DEVICE(0x5696, info), \
@@ -725,7 +738,8 @@
 	INTEL_DG2_G12_IDS(info)
 
 #define INTEL_ATS_M150_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C0, info)
+	INTEL_VGA_DEVICE(0x56C0, info), \
+	INTEL_VGA_DEVICE(0x56C2, info)
 
 #define INTEL_ATS_M75_IDS(info) \
 	INTEL_VGA_DEVICE(0x56C1, info)
@@ -733,34 +747,14 @@
 #define INTEL_ATS_M_IDS(info) \
 	INTEL_ATS_M150_IDS(info), \
 	INTEL_ATS_M75_IDS(info)
+
 /* MTL */
-#define INTEL_MTL_M_IDS(info) \
+#define INTEL_MTL_IDS(info) \
 	INTEL_VGA_DEVICE(0x7D40, info), \
-	INTEL_VGA_DEVICE(0x7D60, info)
-#define INTEL_MTL_P_GT2_IDS(info) \
-	INTEL_VGA_DEVICE(0x7D45, info)
-#define INTEL_MTL_P_GT3_IDS(info) \
+	INTEL_VGA_DEVICE(0x7D45, info), \
 	INTEL_VGA_DEVICE(0x7D55, info), \
+	INTEL_VGA_DEVICE(0x7D60, info), \
+	INTEL_VGA_DEVICE(0x7D67, info), \
 	INTEL_VGA_DEVICE(0x7DD5, info)
-#define INTEL_MTL_P_IDS(info) \
-	INTEL_MTL_P_GT2_IDS(info), \
-	INTEL_MTL_P_GT3_IDS(info)
-
-#define INTEL_MTL_IDS(info) \
-	INTEL_MTL_M_IDS(info), \
-	INTEL_MTL_P_IDS(info)
-
-/* PVC */
-#define INTEL_PVC_IDS(info) \
-	INTEL_VGA_DEVICE(0x0BD0, info),	\
-	INTEL_VGA_DEVICE(0x0BD5, info),	\
-	INTEL_VGA_DEVICE(0x0BD6, info),	\
-	INTEL_VGA_DEVICE(0x0BD7, info),	\
-	INTEL_VGA_DEVICE(0x0BD8, info),	\
-	INTEL_VGA_DEVICE(0x0BD9, info),	\
-	INTEL_VGA_DEVICE(0x0BDA, info),	\
-	INTEL_VGA_DEVICE(0x0BDB, info),	\
-	INTEL_VGA_DEVICE(0x0BD1, info),	\
-	INTEL_VGA_DEVICE(0x0BD2, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.25.1
