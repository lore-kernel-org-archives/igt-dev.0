Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4610E569
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 17:15:20 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 20 Jan 2022 22:33:15 +0530
Message-Id: <20220120170316.1854652-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220120170316.1854652-1-priyanka.dandamudi@intel.com>
References: <20220120170316.1854652-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915_pciids: synchronize PCI IDs
 with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Adam Miszczak <adam.miszczak@intel.com>

This contains the PCI IDs copied from the final state of the kernel tree
and should not be used for upstreaming purposes. The way to upstream
the PCI ID on userspace components is to copy the i915_pciids.h header
from the kernel possibly mentioning the commit from which it's being
copied.

Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915_pciids.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc..3c56b06a 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -681,4 +681,46 @@
 	INTEL_VGA_DEVICE(0xA788, info), \
 	INTEL_VGA_DEVICE(0xA789, info)
 
+/*
+ * DG2
+ *
+ * The first five IDs here are "Super-SKU" validation IDs that will onyl be
+ * used at poweron and very early post-PO.  We should remove them once bulk
+ * hardware starts becoming available.
+ */
+#define INTEL_DG2_G10_IDS(info) \
+        INTEL_VGA_DEVICE(0x4F80, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x4F81, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x4F82, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x4F83, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x4F84, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x5690, info), \
+        INTEL_VGA_DEVICE(0x5691, info), \
+        INTEL_VGA_DEVICE(0x5692, info), \
+
+#define INTEL_DG2_G11_IDS(info) \
+        INTEL_VGA_DEVICE(0x4F87, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x4F88, info), /* validation Super-SKU */ \
+        INTEL_VGA_DEVICE(0x56A5, info), \
+        INTEL_VGA_DEVICE(0x56A6, info), \
+        INTEL_VGA_DEVICE(0x5693, info), \
+        INTEL_VGA_DEVICE(0x5694, info), \
+        INTEL_VGA_DEVICE(0x5695, info), \
+        INTEL_VGA_DEVICE(0x56B0, info), \
+        INTEL_VGA_DEVICE(0x56B1, info)
+
+#define INTEL_DG2_IDS(info) \
+        INTEL_DG2_G10_IDS(info) \
+        INTEL_DG2_G11_IDS(info)
+
+#define INTEL_DG2_ND1_IDS(info) \
+        INTEL_VGA_DEVICE(0x56C0, info)
+
+#define INTEL_DG2_ND3_IDS(info) \
+        INTEL_VGA_DEVICE(0x56C1, info)
+
+#define INTEL_DG2_ND_IDS(info) \
+        INTEL_DG2_ND1_IDS(info), \
+        INTEL_DG2_ND3_IDS(info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.25.1
