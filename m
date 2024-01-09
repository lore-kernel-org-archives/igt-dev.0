Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7310E34C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 06:16:50 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib: Add non-kernel macros to i915_pciids_local.h
Date: Tue,  9 Jan 2024 11:39:42 +0530
Message-Id: <20240109060943.1236373-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240109060943.1236373-1-chaitanya.kumar.borah@intel.com>
References: <20240109060943.1236373-1-chaitanya.kumar.borah@intel.com>
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

Add MTL and PVC PCI-ID macros which are not present in kernel
header to i915_pciids_local.h. This will help us sync the kernel
and IGT headers.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com> 
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

---
 lib/i915_pciids_local.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index 91c26152a..1ed8364c5 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -7,4 +7,42 @@
 
 #include "i915_pciids.h"
 
+/* MTL perf */
+#ifndef INTEL_MTL_M_IDS
+#define INTEL_MTL_M_IDS(info) \
+       INTEL_VGA_DEVICE(0x7D60, info)
+#endif
+
+#ifndef INTEL_MTL_P_GT2_IDS
+#define INTEL_MTL_P_GT2_IDS(info) \
+       INTEL_VGA_DEVICE(0x7D45, info)
+#endif
+
+#ifndef INTEL_MTL_P_GT3_IDS
+#define INTEL_MTL_P_GT3_IDS(info) \
+        INTEL_VGA_DEVICE(0x7D55, info), \
+        INTEL_VGA_DEVICE(0x7DD5, info)
+#endif
+
+#ifndef INTEL_MTL_P_IDS
+#define INTEL_MTL_P_IDS(info) \
+       INTEL_MTL_P_GT2_IDS(info), \
+       INTEL_MTL_P_GT3_IDS(info)
+#endif
+
+/* PVC */
+#ifndef INTEL_PVC_IDS
+#define INTEL_PVC_IDS(info) \
+       INTEL_VGA_DEVICE(0x0BD0, info), \
+       INTEL_VGA_DEVICE(0x0BD5, info), \
+       INTEL_VGA_DEVICE(0x0BD6, info), \
+       INTEL_VGA_DEVICE(0x0BD7, info), \
+       INTEL_VGA_DEVICE(0x0BD8, info), \
+       INTEL_VGA_DEVICE(0x0BD9, info), \
+       INTEL_VGA_DEVICE(0x0BDA, info), \
+       INTEL_VGA_DEVICE(0x0BDB, info), \
+       INTEL_VGA_DEVICE(0x0BD1, info), \
+       INTEL_VGA_DEVICE(0x0BD2, info)
+#endif
+
 #endif /* _I915_PCIIDS_LOCAL_H */
-- 
2.25.1
