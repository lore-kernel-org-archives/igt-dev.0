Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159810F30D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 05:52:03 +0000 (UTC)
From: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
To: igt-dev@lists.freedesktop.org,
 tejaskumarx.surendrakumar.upadhyay@intel.com, mahesh.meena@intel.com
Date: Thu, 21 Apr 2022 11:28:19 +0530
Message-Id: <20220421055819.3765382-2-ravitejax.goud.talla@intel.com>
In-Reply-To: <20220421055819.3765382-1-ravitejax.goud.talla@intel.com>
References: <20220421055819.3765382-1-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t, v2,
 2/2] lib/rpl_p: Add Raptor Lake P platform definition
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

Adding Raptor lake platform definitions

v2: Modifying intel_device_info.c in seperate commit (Petri)
    Earlier changes done in i915_pciids.h commit

Signed-off-by: Adam Miszczak <adam.miszczak@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

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
