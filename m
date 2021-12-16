Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0715910F484
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:20:33 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 16 Dec 2021 16:45:10 +0530
Message-Id: <20211216111510.4094034-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib: sync i915_pciids.h with kernel
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
List-ID: <igt-dev@lists.freedesktop.org>

This synchronizes with kernel commit

52407c220c44 ("drm/i915/rpl-s: Add PCI IDS for Raptor Lake S")

to bring in RPL-S PCI IDs.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915_pciids.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index c00ac546..baf3d1d3 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -666,4 +666,13 @@
 	INTEL_VGA_DEVICE(0x46C2, info), \
 	INTEL_VGA_DEVICE(0x46C3, info)
 
+/* RPL-S */
+#define INTEL_RPLS_IDS(info) \
+	INTEL_VGA_DEVICE(0xA780, info), \
+	INTEL_VGA_DEVICE(0xA781, info), \
+	INTEL_VGA_DEVICE(0xA782, info), \
+	INTEL_VGA_DEVICE(0xA783, info), \
+	INTEL_VGA_DEVICE(0xA788, info), \
+	INTEL_VGA_DEVICE(0xA789, info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.31.1
