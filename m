Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9808B10E314
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 15:53:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 21:13:20 +0530
Message-Id: <20230911154320.2006325-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel/kms: Drop Run type field
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

Follow "ada49eb7d: tests: Intel Xe: drop Run type field" commit
and do the same for pending KMS tests.

Fixes: 9da2960b1
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 5 -----
 tests/intel/kms_pm_dc.c        | 7 -------
 tests/intel/kms_pm_lpsp.c      | 2 --
 3 files changed, 14 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 42aa7cb5d..20af15a6b 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -46,7 +46,6 @@
  * Driver requirement: i915
  * Functionality: backlight
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: basic-brightness
@@ -54,7 +53,6 @@
  * Driver requirement: i915
  * Functionality: backlight
  * Mega feature: Display Power
- * Run type: BAT
  * Test category: functionality test
  *
  * SUBTEST: fade
@@ -62,7 +60,6 @@
  * Driver requirement: i915
  * Functionality: backlight
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fade-with-dpms
@@ -70,7 +67,6 @@
  * Driver requirement: i915
  * Functionality: dpms, backlight
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fade-with-suspend
@@ -78,7 +74,6 @@
  * Driver requirement: i915
  * Functionality: backlight, suspend
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 895fe4b4c..76c662f1f 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -47,7 +47,6 @@
  * Driver requirement: i915
  * Functionality: dc3co, pm_dc, psr2
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc5-dpms
@@ -56,7 +55,6 @@
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc5-dpms-negative
@@ -65,7 +63,6 @@
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc5-psr
@@ -73,7 +70,6 @@
  * Driver requirement: i915
  * Functionality: pm_dc, psr
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc6-dpms
@@ -82,7 +78,6 @@
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc6-psr
@@ -90,7 +85,6 @@
  * Driver requirement: i915
  * Functionality: pm_dc, psr
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: dc9-dpms
@@ -98,7 +92,6 @@
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 9b5547cda..9093f728c 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -42,7 +42,6 @@
  * Driver requirement: i915
  * Functionality: pm_lpsp
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: screens-disabled
@@ -50,7 +49,6 @@
  * Driver requirement: i915
  * Functionality: pm_lpsp
  * Mega feature: Display Power
- * Run type: FULL
  * Test category: functionality test
  */
 
-- 
2.40.0
