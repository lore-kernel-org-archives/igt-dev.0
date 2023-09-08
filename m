Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2A910E0F4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:50:49 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 23:20:39 +0530
Message-Id: <20230908175039.1291593-6-swati2.sharma@intel.com>
In-Reply-To: <20230908175039.1291593-1-swati2.sharma@intel.com>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/intel/kms_pm_dc: Add XE support
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

Add XE driver support for kms pm tests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pm_dc.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index cbb419e12..63999e813 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -36,6 +36,9 @@
 #include "limits.h"
 #include "time.h"
 #include "igt_pm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
 /**
  * TEST: kms pm dc
  * Category: Display
@@ -44,7 +47,7 @@
  * SUBTEST: dc3co-vpb-simulation
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dc3co, pm_dc, psr2
  * Mega feature: Display Power
  * Run type: FULL
@@ -53,7 +56,7 @@
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
  * Run type: FULL
@@ -62,7 +65,7 @@
  * SUBTEST: dc5-dpms-negative
  * Description: Validate negative scenario of DC5 display engine entry to DC5 state
  *              while all connectors's DPMS property set to ON
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
  * Run type: FULL
@@ -70,7 +73,7 @@
  *
  * SUBTEST: dc5-psr
  * Description: This test validates display engine entry to DC5 state while PSR is active
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: pm_dc, psr
  * Mega feature: Display Power
  * Run type: FULL
@@ -79,7 +82,7 @@
  * SUBTEST: dc6-dpms
  * Description: Validate display engine entry to DC6 state while all connectors's
  *              DPMS property set to OFF
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
  * Run type: FULL
@@ -87,7 +90,7 @@
  *
  * SUBTEST: dc6-psr
  * Description: This test validates display engine entry to DC6 state while PSR is active
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: pm_dc, psr
  * Mega feature: Display Power
  * Run type: FULL
@@ -95,7 +98,7 @@
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
  * Run type: FULL
@@ -734,7 +737,7 @@ igt_main
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		is_dgfx = gem_has_lmem(data.drm_fd);
+		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
 		if (!is_dgfx)
 			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 				      "PC8+ residencies not supported\n");
-- 
2.25.1
