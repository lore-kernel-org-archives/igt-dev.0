Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84F710E080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:51:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:49 +0530
Message-Id: <20230823114354.787212-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/7] tests/i915/kms_pm_backlight: Fix testplan
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

As kms_pm_backlight is moved to display, update the test
documentation according to the kms testplan kms_test_config.json

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_pm_backlight.c | 40 ++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/tests/i915/kms_pm_backlight.c b/tests/i915/kms_pm_backlight.c
index ade5539d2..2e8fb4254 100644
--- a/tests/i915/kms_pm_backlight.c
+++ b/tests/i915/kms_pm_backlight.c
@@ -38,29 +38,49 @@
 #include "igt_device.h"
 #include "igt_device_scan.h"
 /**
- * TEST: i915 pm backlight
+ * TEST: kms pm backlight
+ * Category: Display
  * Description: Basic backlight sysfs test
- * Feature: backlight
  *
  * SUBTEST: bad-brightness
- * Description: test the bad brightness.
+ * Description: Test the bad brightness.
+ * Driver requirement: i915
+ * Functionality: backlight
+ * Mega feature: Display Power
  * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: basic-brightness
- * Description: test the basic brightness.
+ * Description: Test the basic brightness.
+ * Driver requirement: i915
+ * Functionality: backlight
+ * Mega feature: Display Power
  * Run type: BAT
+ * Test category: functionality test
  *
  * SUBTEST: fade
- * Description: test basic fade.
- * Run type: FULL
+ * Description: Test basic fade.
+ * Driver requirement: i915
+ * Functionality: backlight
+ * Mega feature: Display Power
+ * Run type: BAT
+ * Test category: functionality test
  *
  * SUBTEST: fade-with-dpms
- * Description: test the fade with DPMS.
- * Run type: FULL
+ * Description: Test the fade with DPMS.
+ * Driver requirement: i915
+ * Functionality: dpms, backlight
+ * Mega feature: Display Power
+ * Run type: BAT
+ * Test category: functionality test
  *
  * SUBTEST: fade-with-suspend
- * Description: test the fade with suspend.
- * Run type: FULL
+ * Description: Test the fade with suspend.
+ * Driver requirement: i915
+ * Functionality: backlight, suspend
+ * Mega feature: Display Power
+ * Run type: BAT
+ * Test category: functionality test
  */
 
 struct context {
-- 
2.40.0
