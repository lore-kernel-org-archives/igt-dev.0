Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBD10F7A8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:22:42 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon,  7 Feb 2022 23:51:36 +0530
Message-Id: <20220207182152.31211-2-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 01/17] lib/i915_pciids: PCI IDS for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Melkaveri@freedesktop.org, Adam Miszczak <adam.miszczak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Adds PCI IDS for DG2.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915_pciids.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc..b4230424 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -681,4 +681,23 @@
 	INTEL_VGA_DEVICE(0xA788, info), \
 	INTEL_VGA_DEVICE(0xA789, info)
 
+/* DG2 */
+#define INTEL_DG2_G10_IDS(info) \
+        INTEL_VGA_DEVICE(0x5690, info), \
+        INTEL_VGA_DEVICE(0x5691, info), \
+        INTEL_VGA_DEVICE(0x5692, info), \
+
+#define INTEL_DG2_G11_IDS(info) \
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
 #endif /* _I915_PCIIDS_H */
-- 
2.17.1
