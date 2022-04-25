Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BAD10E7F0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 14:56:25 +0000 (UTC)
From: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
To: igt-dev@lists.freedesktop.org,
	mahesh.meena@intel.com
Date: Mon, 25 Apr 2022 20:32:48 +0530
Message-Id: <20220425150248.245497-1-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [WARNING: UNSCANNABLE EXTRACTION FAILED][i-g-t,
 v3] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

This synchronizes with kernel commit

72c3c8d6e5275 ("drm/i915/rpl-p: Add PCI IDs")
to bring in RPL-P PCI IDs.

v2: Corresponding kernel commit added in commit message (Petri)

v3: Copying the header from 72c3c8d6e5275 also brings in these RPL-S ids: 0xA78A 0xA78B (Petri)

Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
---
 lib/i915_pciids.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc..a7b5eea7 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -679,6 +679,17 @@
 	INTEL_VGA_DEVICE(0xA782, info), \
 	INTEL_VGA_DEVICE(0xA783, info), \
 	INTEL_VGA_DEVICE(0xA788, info), \
-	INTEL_VGA_DEVICE(0xA789, info)
+	INTEL_VGA_DEVICE(0xA789, info), \
+	INTEL_VGA_DEVICE(0xA78A, info), \
+	INTEL_VGA_DEVICE(0xA78B, info)
+
+/* RPL-P */
+#define INTEL_RPLP_IDS(info) \
+	INTEL_VGA_DEVICE(0xA720, info), \
+	INTEL_VGA_DEVICE(0xA721, info), \
+	INTEL_VGA_DEVICE(0xA7A0, info), \
+	INTEL_VGA_DEVICE(0xA7A1, info), \
+	INTEL_VGA_DEVICE(0xA7A8, info), \
+	INTEL_VGA_DEVICE(0xA7A9, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.34.1
