Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E2E10E425
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 11:24:19 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nRuQS-003hfU-Ke
 for igt-dev@lists.freedesktop.org; Wed, 09 Mar 2022 12:24:16 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Mar 2022 12:24:15 +0100
Message-Id: <20220309112415.882790-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220309112415.882790-1-mauro.chehab@linux.intel.com>
References: <20220309112415.882790-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/1] lib/i915_pciids.h: Add DG2 PCI IDs
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As DG2 hardware will start showing up in CI shortly, and the DG2
list of PCI id's is not in sync with the patch merged at Linux
drm-tip upstream, update them to reflect what it was merged
there by this Linux changeset:

  commit 92b805135ed2851989097106bbde0f099d664902
  Author: Matt Roper <matthew.d.roper@intel.com>
  Date:   Tue Feb 15 13:45:44 2022 -0800

    drm/i915: Add DG2 PCI IDs

    DG2 hardware will start showing up in CI shortly; let's make sure it's
    recognized by the driver.

    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Caz Yokoyama <caz.yokoyama@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20220215214544.2197483-1-matthew.d.roper@intel.com
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This patch partially reverts:
b842aa665d48 ("lib/intel_device_info: Introduce i915_pciids_local.h and add DG2 definition")
but it preserves the file, as this may be used in the future while
testing future devices, while PCI IDs are still a WIP.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/i915_pciids.h       | 27 +++++++++++++++++++++++++++
 lib/i915_pciids_local.h | 10 +---------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc9da1..3609f3254f24 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -681,4 +681,31 @@
 	INTEL_VGA_DEVICE(0xA788, info), \
 	INTEL_VGA_DEVICE(0xA789, info)
 
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
+	INTEL_VGA_DEVICE(0x56A5, info), \
+	INTEL_VGA_DEVICE(0x56A6, info), \
+	INTEL_VGA_DEVICE(0x56B0, info), \
+	INTEL_VGA_DEVICE(0x56B1, info)
+
+#define INTEL_DG2_G12_IDS(info) \
+	INTEL_VGA_DEVICE(0x56A3, info), \
+	INTEL_VGA_DEVICE(0x56A4, info)
+
+#define INTEL_DG2_IDS(info) \
+	INTEL_DG2_G10_IDS(info), \
+	INTEL_DG2_G11_IDS(info), \
+	INTEL_DG2_G12_IDS(info)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index 2a18109e59e5..3a26412e71ae 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -7,14 +7,6 @@
 
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
+/* Curently empty. Should be used as place to put temporary PCI IDs */
 
 #endif /* _I915_PCIIDS_LOCAL_H */
-- 
2.35.1
