Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB23C1114
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 04:35:01 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 21:34:52 -0700
Message-Id: <20220727043452.4024839-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: sync i915_pciids.h with kernel
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

7835303982d1 ("drm/i915/mtl: Add MeteorLake PCI IDs")
to bring in DG2/ATS-M and initial MTL PCI IDs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/i915_pciids.h       | 55 +++++++++++++++++++++++++++++++++++++++++
 lib/i915_pciids_local.h | 21 ----------------
 2 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index a7b5eea7..278031aa 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -692,4 +692,59 @@
 	INTEL_VGA_DEVICE(0xA7A8, info), \
 	INTEL_VGA_DEVICE(0xA7A9, info)
 
+/* DG2 */
+#define INTEL_DG2_G10_IDS(info) \
+	INTEL_VGA_DEVICE(0x5690, info), \
+	INTEL_VGA_DEVICE(0x5691, info), \
+	INTEL_VGA_DEVICE(0x5692, info), \
+	INTEL_VGA_DEVICE(0x56A0, info), \
+	INTEL_VGA_DEVICE(0x56A1, info), \
+	INTEL_VGA_DEVICE(0x56A2, info)
+
+#define INTEL_DG2_G11_IDS(info) \
+	INTEL_VGA_DEVICE(0x5693, info), \
+	INTEL_VGA_DEVICE(0x5694, info), \
+	INTEL_VGA_DEVICE(0x5695, info), \
+	INTEL_VGA_DEVICE(0x5698, info), \
+	INTEL_VGA_DEVICE(0x56A5, info), \
+	INTEL_VGA_DEVICE(0x56A6, info), \
+	INTEL_VGA_DEVICE(0x56B0, info), \
+	INTEL_VGA_DEVICE(0x56B1, info)
+
+#define INTEL_DG2_G12_IDS(info) \
+	INTEL_VGA_DEVICE(0x5696, info), \
+	INTEL_VGA_DEVICE(0x5697, info), \
+	INTEL_VGA_DEVICE(0x56A3, info), \
+	INTEL_VGA_DEVICE(0x56A4, info), \
+	INTEL_VGA_DEVICE(0x56B2, info), \
+	INTEL_VGA_DEVICE(0x56B3, info)
+
+#define INTEL_DG2_IDS(info) \
+	INTEL_DG2_G10_IDS(info), \
+	INTEL_DG2_G11_IDS(info), \
+	INTEL_DG2_G12_IDS(info)
+
+#define INTEL_ATS_M150_IDS(info) \
+	INTEL_VGA_DEVICE(0x56C0, info)
+
+#define INTEL_ATS_M75_IDS(info) \
+	INTEL_VGA_DEVICE(0x56C1, info)
+
+#define INTEL_ATS_M_IDS(info) \
+	INTEL_ATS_M150_IDS(info), \
+	INTEL_ATS_M75_IDS(info)
+/* MTL */
+#define INTEL_MTL_M_IDS(info) \
+	INTEL_VGA_DEVICE(0x7D40, info), \
+	INTEL_VGA_DEVICE(0x7D60, info)
+
+#define INTEL_MTL_P_IDS(info) \
+	INTEL_VGA_DEVICE(0x7D45, info), \
+	INTEL_VGA_DEVICE(0x7D55, info), \
+	INTEL_VGA_DEVICE(0x7DD5, info)
+
+#define INTEL_MTL_IDS(info) \
+	INTEL_MTL_M_IDS(info), \
+	INTEL_MTL_P_IDS(info)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index b3ac70ff..91c26152 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -7,25 +7,4 @@
 
 #include "i915_pciids.h"
 
-/* DG2 */
-#define INTEL_DG2_IDS(info) \
-	INTEL_VGA_DEVICE(0x56A0, info), \
-	INTEL_VGA_DEVICE(0x56A1, info), \
-	INTEL_VGA_DEVICE(0x56A2, info), \
-	INTEL_VGA_DEVICE(0x56A3, info), \
-	INTEL_VGA_DEVICE(0x56A4, info), \
-	INTEL_VGA_DEVICE(0x56A5, info), \
-	INTEL_VGA_DEVICE(0x56A6, info)
-
-/* ATS-M */
-#define INTEL_ATS_M150_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C0, info)
-
-#define INTEL_ATS_M75_IDS(info) \
-	INTEL_VGA_DEVICE(0x56C1, info)
-
-#define INTEL_ATS_M_IDS(info) \
-	INTEL_ATS_M150_IDS(info), \
-	INTEL_ATS_M75_IDS(info)
-
 #endif /* _I915_PCIIDS_LOCAL_H */
-- 
2.37.1
