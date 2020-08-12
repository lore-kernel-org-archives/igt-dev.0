Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77A6E073
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2020 09:09:52 +0000 (UTC)
From: Adam Miszczak <adam.miszczak@linux.intel.com>
Date: Wed, 12 Aug 2020 11:05:47 +0200
Message-Id: <20200812090548.4973-2-adam.miszczak@linux.intel.com>
In-Reply-To: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
References: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add DG1 and clean-up VLV PCI IDs.

Align with kernel commits:
fb8920f04f5d ("drm/i915: Remove dubious Valleyview PCI IDs")
fd38cdb81105 ("drm/i915/dg1: Add DG1 PCI IDs")

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/i915_pciids.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index d6cb2899..8e7ae30e 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -258,9 +258,7 @@
 	INTEL_VGA_DEVICE(0x0f30, info), \
 	INTEL_VGA_DEVICE(0x0f31, info), \
 	INTEL_VGA_DEVICE(0x0f32, info), \
-	INTEL_VGA_DEVICE(0x0f33, info), \
-	INTEL_VGA_DEVICE(0x0157, info), \
-	INTEL_VGA_DEVICE(0x0155, info)
+	INTEL_VGA_DEVICE(0x0f33, info)
 
 #define INTEL_BDW_ULT_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x1606, info), /* GT1 ULT */ \
@@ -618,4 +616,8 @@
 	INTEL_VGA_DEVICE(0x4C90, info), \
 	INTEL_VGA_DEVICE(0x4C9A, info)
 
+/* DG1 */
+#define INTEL_DG1_IDS(info) \
+	INTEL_VGA_DEVICE(0x4905, info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
