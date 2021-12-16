Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2B210F3F0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 13:06:52 +0000 (UTC)
From: Talla Raviteja Goud <ravitejax.goud.talla@intel.com>
Date: Thu, 16 Dec 2021 18:41:22 +0530
Message-Id: <20211216131122.1457689-1-ravitejax.goud.talla@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/rpl_s: Add Raptor Lake S platform definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Adding Raptor lake platform definitions

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Raviteja Goud Talla <ravitejax.goud.talla@intel.com>
---
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2b795527..cf8ff1ae 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -78,6 +78,7 @@ struct intel_device_info {
 	bool is_rocketlake : 1;
 	bool is_dg1 : 1;
 	bool is_alderlake_s : 1;
+	bool is_raptorlake_s : 1;
 	bool is_alderlake_p : 1;
 	const char *codename;
 };
@@ -181,6 +182,7 @@ void intel_check_pch(void);
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
 #define IS_ALDERLAKE_S(devid)	(intel_get_device_info(devid)->is_alderlake_s)
+#define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 07338957..178e7d0a 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -396,6 +396,13 @@ static const struct intel_device_info intel_alderlake_s_info = {
 	.codename = "alderlake_s"
 };
 
+static const struct intel_device_info intel_raptorlake_s_info = {
+	.graphics_ver = 12,
+	.display_ver = 12,
+	.is_raptorlake_s = true,
+	.codename = "raptorlake_s"
+};
+
 static const struct intel_device_info intel_alderlake_p_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
@@ -494,6 +501,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_DG1_IDS(&intel_dg1_info),
 
 	INTEL_ADLS_IDS(&intel_alderlake_s_info),
+	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
 	INTEL_ADLP_IDS(&intel_alderlake_p_info),
 
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
-- 
2.34.1
