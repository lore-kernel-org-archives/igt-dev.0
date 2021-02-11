Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA47F6E5AE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 10:44:53 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 11 Feb 2021 16:06:06 +0530
Message-Id: <20210211103607.241813-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210211103607.241813-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210211103607.241813-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t 1/2] lib: sync i915_pciids.h with kernel
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
Cc: anusha.srivatsa@intel.com, lucas.demarchi@intel.com, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Taken from kernel commit:
commit 0883d63b19bb ("drm/i915/adl_s: Add ADL-S platform info and PCI ids")
commit 04057a1afc75 ("drm/i915: Sort EHL/JSL PCI IDs")
commit 0e8e272f1368 ("drm/i915/ehl: Remove invalid PCI ID")

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915_pciids.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 3b5ed1e4..ebd0dd1c 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -584,20 +584,19 @@
 
 /* EHL */
 #define INTEL_EHL_IDS(info) \
-	INTEL_VGA_DEVICE(0x4500, info),	\
-	INTEL_VGA_DEVICE(0x4571, info), \
-	INTEL_VGA_DEVICE(0x4551, info), \
 	INTEL_VGA_DEVICE(0x4541, info), \
+	INTEL_VGA_DEVICE(0x4551, info), \
+	INTEL_VGA_DEVICE(0x4555, info), \
 	INTEL_VGA_DEVICE(0x4557, info), \
-	INTEL_VGA_DEVICE(0x4555, info)
+	INTEL_VGA_DEVICE(0x4571, info)
 
 /* JSL */
 #define INTEL_JSL_IDS(info) \
-	INTEL_VGA_DEVICE(0x4E71, info), \
-	INTEL_VGA_DEVICE(0x4E61, info), \
-	INTEL_VGA_DEVICE(0x4E57, info), \
+	INTEL_VGA_DEVICE(0x4E51, info), \
 	INTEL_VGA_DEVICE(0x4E55, info), \
-	INTEL_VGA_DEVICE(0x4E51, info)
+	INTEL_VGA_DEVICE(0x4E57, info), \
+	INTEL_VGA_DEVICE(0x4E61, info), \
+	INTEL_VGA_DEVICE(0x4E71, info)
 
 /* TGL */
 #define INTEL_TGL_12_GT1_IDS(info) \
@@ -635,4 +634,15 @@
 	INTEL_VGA_DEVICE(0x4907, info), \
 	INTEL_VGA_DEVICE(0x4908, info)
 
+/* ADL-S */
+#define INTEL_ADLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x4680, info), \
+	INTEL_VGA_DEVICE(0x4681, info), \
+	INTEL_VGA_DEVICE(0x4682, info), \
+	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4690, info), \
+	INTEL_VGA_DEVICE(0x4691, info), \
+	INTEL_VGA_DEVICE(0x4692, info), \
+	INTEL_VGA_DEVICE(0x4693, info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
