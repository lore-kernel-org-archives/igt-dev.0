Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B69A10E080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:52:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:51 +0530
Message-Id: <20230823114354.787212-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/7] tests/i915/kms_pm_dc: Fix testplan
 documentation
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

As kms_pm_dc is moved to display, update the test documentation
according to the kms testplan kms_test_config.json

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_pm_dc.c | 66 ++++++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/tests/i915/kms_pm_dc.c b/tests/i915/kms_pm_dc.c
index 43d88f38b..47febaa53 100644
--- a/tests/i915/kms_pm_dc.c
+++ b/tests/i915/kms_pm_dc.c
@@ -38,45 +38,69 @@
 #include "time.h"
 #include "igt_pm.h"
 /**
- * TEST: i915 pm dc
+ * TEST: kms pm dc
+ * Category: Display
  * Description: Tests to validate display power DC states.
- * Run type: FULL
  *
  * SUBTEST: dc3co-vpb-simulation
- * Description:
- *   In this test we make sure that system enters DC3CO when PSR2 is active and system is in SLEEP
- *   state
- * Feature: dc3co, pm_dc
+ * Description: Make sure that system enters DC3CO when PSR2 is active and system
+ *              is in SLEEP state
+ * Driver requirement: i915
+ * Functionality: dc3co, pm_dc, psr2
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc5-dpms
- * Description:
- *   This test validates display engine entry to DC5 state while all connectors's DPMS property
- *   set to OFF
- * Feature: pm_dc
+ * Description: Validate display engine entry to DC5 state while all connectors's
+ *              DPMS property set to OFF
+ * Driver requirement: i915
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc5-dpms-negative
- * Description:
- *   This test validates negative scenario of DC5 display engine entry to DC5 state while all
- *   connectors's DPMS property set to ON
- * Feature: pm_dc
+ * Description: Validate negative scenario of DC5 display engine entry to DC5 state
+ *              while all connectors's DPMS property set to ON
+ * Driver requirement: i915
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc5-psr
  * Description: This test validates display engine entry to DC5 state while PSR is active
- * Feature: pm_dc
+ * Driver requirement: i915
+ * Functionality: pm_dc, psr
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc6-dpms
- * Description:
- *   This test validates display engine entry to DC6 state while all connectors's DPMS property
- *   set to OFF
- * Feature: pm_dc
+ * Description: Validate display engine entry to DC6 state while all connectors's
+ *              DPMS property set to OFF
+ * Driver requirement: i915
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc6-psr
  * Description: This test validates display engine entry to DC6 state while PSR is active
- * Feature: pm_dc
+ * Driver requirement: i915
+ * Functionality: pm_dc, psr
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
- * Feature: pm_dc
+ * Driver requirement: i915
+ * Functionality: dpms, pm_dc
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  */
 
 /* DC State Flags */
-- 
2.40.0
