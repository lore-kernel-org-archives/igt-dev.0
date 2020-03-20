Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDE46E0E7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2020 00:18:16 +0000 (UTC)
From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Date: Thu, 19 Mar 2020 17:13:19 -0700
Message-Id: <20200320001319.6982-1-swathi.dhanavanthri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Sync i915_pciids.h with kernel
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
List-ID: <igt-dev@lists.freedesktop.org>

Changes:
91b79fb35d67 ("drm/i915/tgl: Add new PCI IDs to TGL")

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
---
 lib/i915_pciids.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 3e26a917..753f97b5 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -591,12 +591,16 @@
 
 /* TGL */
 #define INTEL_TGL_12_IDS(info) \
-	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A40, info), \
+	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
 	INTEL_VGA_DEVICE(0x9A60, info), \
 	INTEL_VGA_DEVICE(0x9A68, info), \
 	INTEL_VGA_DEVICE(0x9A70, info), \
-	INTEL_VGA_DEVICE(0x9A78, info)
+	INTEL_VGA_DEVICE(0x9A78, info), \
+	INTEL_VGA_DEVICE(0x9AC0, info), \
+	INTEL_VGA_DEVICE(0x9AC9, info), \
+	INTEL_VGA_DEVICE(0x9AD9, info), \
+	INTEL_VGA_DEVICE(0x9AF8, info)
 
 #endif /* _I915_PCIIDS_H */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
