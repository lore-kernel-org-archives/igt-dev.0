Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3A10E061
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:12:26 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] lib: sync i915_pciids.h with kernel
Date: Tue, 12 Dec 2023 14:38:41 +0530
Message-Id: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nemesa.garg@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This synchronizes with kernel commit

8940da9fe5f27 ("drm/i915/mtl: Adding DeviceID for Arrowlake-S under MTL")
to bring in ARL-S PCI IDs.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/i915_pciids.h       | 4 ++++
 lib/intel_device_info.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index bee58554d..106e42f84 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -750,6 +750,10 @@
 	INTEL_MTL_M_IDS(info), \
 	INTEL_MTL_P_IDS(info)
 
+/* ARL-S */
+#define INTEL_ARLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x7D67, info)
+
 /* PVC */
 #define INTEL_PVC_IDS(info) \
 	INTEL_VGA_DEVICE(0x0BD0, info),	\
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 34817f7b6..48036bec5 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -614,6 +614,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ATS_M_IDS(&intel_ats_m_info),
 
 	INTEL_MTL_IDS(&intel_meteorlake_info),
+	INTEL_ARLS_IDS(&intel_meteorlake_info),
 
 	INTEL_PVC_IDS(&intel_pontevecchio_info),
 
-- 
2.25.1
