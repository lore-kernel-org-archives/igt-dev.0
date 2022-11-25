Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBDF10E214
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 09:08:51 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 14:34:01 +0530
Message-Id: <20221125090401.13539-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/mtl: Add Meteorlake platform definition
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index d7a6ff19..9b39472a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -85,6 +85,7 @@ struct intel_device_info {
 	bool is_raptorlake_s : 1;
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
+	bool is_meteorlake : 1;
 	const char *codename;
 };
 
@@ -194,6 +195,7 @@ void intel_check_pch(void);
 #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
 #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
+#define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index ebfcea73..68dd17ee 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -439,6 +439,15 @@ static const struct intel_device_info intel_ats_m_info = {
 	.has_flatccs = true,
 };
 
+static const struct intel_device_info intel_meteorlake_info = {
+	.graphics_ver = 12,
+	.graphics_rel = 70,
+	.display_ver = 14,
+	.has_4tile = true,
+	.is_meteorlake = true,
+	.codename = "meteorlake"
+};
+
 static const struct pci_id_match intel_device_match[] = {
 	INTEL_I810_IDS(&intel_i810_info),
 	INTEL_I815_IDS(&intel_i815_info),
@@ -538,6 +547,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_ATS_M_IDS(&intel_ats_m_info),
 
+	INTEL_MTL_IDS(&intel_meteorlake_info),
+
 	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.36.0
