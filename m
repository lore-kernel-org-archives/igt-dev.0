Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4126710EA37
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 14:53:39 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 24 Jan 2022 20:11:24 +0530
Message-Id: <20220124144125.1900320-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220124144125.1900320-1-priyanka.dandamudi@intel.com>
References: <20220124144125.1900320-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915_pciids: PCI IDS for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, adam.miszczak@intel.com, matthew.d.roper@intel.com
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
2.25.1
