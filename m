Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042110E6E9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 17:15:23 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 20 Jan 2022 22:33:16 +0530
Message-Id: <20220120170316.1854652-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20220120170316.1854652-1-priyanka.dandamudi@intel.com>
References: <20220120170316.1854652-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/dg2: Add DG2 platform definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Added definition for DG2.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3527cbe5..9c2f1b31 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -81,6 +81,7 @@ struct intel_device_info {
 	bool is_raptorlake_s : 1;
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
+	bool is_dg2 : 1;
 	const char *codename;
 };
 
@@ -186,6 +187,7 @@ void intel_check_pch(void);
 #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
 #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
+#define IS_DG2(devid)          (intel_get_device_info(devid)->is_dg2)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 40942afe..05ba2d98 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -417,6 +417,13 @@ static const struct intel_device_info intel_alderlake_n_info = {
 	.codename = "alderlake_n"
 };
 
+static const struct intel_device_info intel_dg2_info = {
+	.graphics_ver = 12,
+	.display_ver = 13,
+	.is_dg2 = true,
+	.codename = "dg2"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -511,6 +518,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
 	INTEL_ADLP_IDS(&intel_alderlake_p_info),
 	INTEL_ADLN_IDS(&intel_alderlake_n_info),
+	INTEL_DG2_IDS(&intel_dg2_info),
 
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
-- 
2.25.1
