Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600A26E372
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 05:10:36 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 13 Nov 2020 10:32:01 +0530
Message-Id: <20201113050201.229179-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V2] [i-g-t] lib/i915: Identify Jasperlake
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
To: igt-dev@lists.freedesktop.org, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Recently we did split of EHL/JSL thus we need to indentify
Jasperlake.

Changes since V1:
	- Added jasperlake codename

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915/perf.c         | 2 +-
 lib/intel_chipset.h     | 1 +
 lib/intel_device_info.c | 7 +++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 8360459f..53c0a9dc 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -253,7 +253,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 		intel_perf_load_metrics_cnl(perf);
 	} else if (devinfo->is_icelake) {
 		intel_perf_load_metrics_icl(perf);
-	} else if (devinfo->is_elkhartlake) {
+	} else if (devinfo->is_elkhartlake || devinfo->is_jasperlake) {
 		intel_perf_load_metrics_ehl(perf);
 	} else if (devinfo->is_tigerlake) {
 		switch (devinfo->gt) {
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 51093091..63c98025 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -72,6 +72,7 @@ struct intel_device_info {
 	bool is_cannonlake : 1;
 	bool is_icelake : 1;
 	bool is_elkhartlake : 1;
+	bool is_jasperlake : 1;
 	bool is_tigerlake : 1;
 	bool is_rocketlake : 1;
 	bool is_dg1 : 1;
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index e1132d9c..5c3816fe 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -315,6 +315,12 @@ static const struct intel_device_info intel_elkhartlake_info = {
 	.codename = "elkhartlake"
 };
 
+static const struct intel_device_info intel_jasperlake_info = {
+	.gen = BIT(10),
+	.is_jasperlake = true,
+	.codename = "jasperlake"
+};
+
 static const struct intel_device_info intel_tigerlake_gt1_info = {
 	.gen = BIT(11),
 	.is_tigerlake = true,
@@ -423,6 +429,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ICL_11_IDS(&intel_icelake_info),
 
 	INTEL_EHL_IDS(&intel_elkhartlake_info),
+	INTEL_JSL_IDS(&intel_jasperlake_info),
 
 	INTEL_TGL_12_GT1_IDS(&intel_tigerlake_gt1_info),
 	INTEL_TGL_12_GT2_IDS(&intel_tigerlake_gt2_info),
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
