Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB0110F179
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 12:43:03 +0000 (UTC)
From: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Apr 2022 18:19:20 +0530
Message-Id: <20220420124920.3628871-1-ravitejax.goud.talla@intel.com>
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Adding Raptor lake P platform definitions

Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
---
 lib/i915_pciids.h       | 9 +++++++++
 lib/intel_device_info.c | 1 +
 2 files changed, 10 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc..f4b21a26 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -681,4 +681,13 @@
 	INTEL_VGA_DEVICE(0xA788, info), \
 	INTEL_VGA_DEVICE(0xA789, info)
 
+/*RPL-P */
+#define INTEL_RPLP_IDS(info) \
+        INTEL_VGA_DEVICE(0xA720, info), \
+        INTEL_VGA_DEVICE(0xA721, info), \
+        INTEL_VGA_DEVICE(0xA7A0, info), \
+        INTEL_VGA_DEVICE(0xA7A1, info), \
+        INTEL_VGA_DEVICE(0xA7A8, info), \
+        INTEL_VGA_DEVICE(0xA7A9, info)
+
 #endif /* _I915_PCIIDS_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e55841df..0253a732 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -521,6 +521,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ADLS_IDS(&intel_alderlake_s_info),
 	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
 	INTEL_ADLP_IDS(&intel_alderlake_p_info),
+	INTEL_RPLP_IDS(&intel_alderlake_p_info),
 	INTEL_ADLN_IDS(&intel_alderlake_n_info),
 
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
-- 
2.34.1
