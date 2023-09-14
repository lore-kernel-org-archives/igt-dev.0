Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B616310E292
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 13:56:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu, 14 Sep 2023 18:49:41 +0530
Message-Id: <20230914131942.2178847-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230914131942.2178847-1-bhanuprakash.modem@intel.com>
References: <20230914131942.2178847-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms: Fix Mega Feature in testplan
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

Adjust KMS testplan Mega Feature to allign with internal tools.

- s/Bigjoiner/Pipe Joiner/
- s/Color mgmt/Color Management/
- s/General Display Features/E2E Compression/ (CCS tests)
- s/Display Power/Display Power Management/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_color.c |  6 +++---
 tests/intel/kms_big_joiner.c          |  6 +++---
 tests/intel/kms_ccs.c                 |  6 +++---
 tests/intel/kms_pm_backlight.c        | 10 +++++-----
 tests/intel/kms_pm_dc.c               | 14 +++++++-------
 tests/intel/kms_pm_lpsp.c             |  4 ++--
 tests/kms_color.c                     | 14 +++++++-------
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 0a9788214..f9adca6c6 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -36,7 +36,7 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verif
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
  * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
@@ -133,7 +133,7 @@ static bool test_pipe_degamma(data_t *data,
  * SUBTEST: gamma
  * Description: Verify that gamma LUT transformation works correctly
  * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  * Driver requirement: i915, xe
  */
@@ -491,7 +491,7 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
  * SUBTEST: ctm-%s
  * Description: Check the color transformation %arg[1]
  * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  * Driver requirement: i915, xe
  *
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index a555ca799..5c9646133 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -51,7 +51,7 @@ typedef struct {
  *              the pipe is active with a big joiner modeset
  * Driver requirement: i915, xe
  * Functionality: 2p1p
- * Mega feature: Bigjoiner
+ * Mega feature: Pipe Joiner
  * Test category: functionality test
  */
 static void test_invalid_modeset(data_t *data)
@@ -99,7 +99,7 @@ static void test_invalid_modeset(data_t *data)
  * Description: Verify the basic modeset on big joiner mode on all pipes
  * Driver requirement: i915, xe
  * Functionality: 2p1p
- * Mega feature: Bigjoiner
+ * Mega feature: Pipe Joiner
  * Test category: functionality test
  */
 static void test_basic_modeset(data_t *data)
@@ -145,7 +145,7 @@ static void test_basic_modeset(data_t *data)
  * Description: Verify simultaneous modeset on 2 big joiner outputs
  * Driver requirement: i915, xe
  * Functionality: 2p1p
- * Mega feature: Bigjoiner
+ * Mega feature: Pipe Joiner
  * Test category: functionality test
  */
 static void test_dual_display(data_t *data)
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index e2bb5a067..102b193da 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -38,7 +38,7 @@
  * Description: Test %arg[2] with given %arg[3] modifier
  * Driver requirement: i915, xe
  * Functionality: ccs, tiling
- * Mega feature: General Display Features
+ * Mega feature: E2E Compression
  * Test category: functionality test
  *
  * arg[1]:
@@ -75,7 +75,7 @@
  * Description: Test %arg[2] with %arg[3] modifier
  * Driver requirement: i915, xe
  * Functionality: ccs, tiling
- * Mega feature: General Display Features
+ * Mega feature: E2E Compression
  * Test category: functionality test
  *
  * arg[1]:
@@ -116,7 +116,7 @@
  * Description: Test %arg[2] with %arg[3] modifier
  * Driver requirement: i915, xe
  * Functionality: ccs, rotation, tiling
- * Mega feature: General Display Features
+ * Mega feature: E2E Compression
  * Test category: functionality test
  *
  * arg[1]:
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 20af15a6b..f3f22da51 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -45,35 +45,35 @@
  * Description: Test the bad brightness.
  * Driver requirement: i915
  * Functionality: backlight
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: basic-brightness
  * Description: Test the basic brightness.
  * Driver requirement: i915
  * Functionality: backlight
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: fade
  * Description: Test basic fade.
  * Driver requirement: i915
  * Functionality: backlight
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: fade-with-dpms
  * Description: Test the fade with DPMS.
  * Driver requirement: i915
  * Functionality: dpms, backlight
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Driver requirement: i915
  * Functionality: backlight, suspend
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 76c662f1f..9c5d990f7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -46,7 +46,7 @@
  *              is in SLEEP state
  * Driver requirement: i915
  * Functionality: dc3co, pm_dc, psr2
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc5-dpms
@@ -54,7 +54,7 @@
  *              DPMS property set to OFF
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc5-dpms-negative
@@ -62,14 +62,14 @@
  *              while all connectors's DPMS property set to ON
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc5-psr
  * Description: This test validates display engine entry to DC5 state while PSR is active
  * Driver requirement: i915
  * Functionality: pm_dc, psr
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc6-dpms
@@ -77,21 +77,21 @@
  *              DPMS property set to OFF
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc6-psr
  * Description: This test validates display engine entry to DC6 state while PSR is active
  * Driver requirement: i915
  * Functionality: pm_dc, psr
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
  * Driver requirement: i915
  * Functionality: dpms, pm_dc
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 9093f728c..b2db4f653 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -41,14 +41,14 @@
  * Description: This test validates lpsp on all connected outputs on low power PIPE_A
  * Driver requirement: i915
  * Functionality: pm_lpsp
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  *
  * SUBTEST: screens-disabled
  * Description: This test validates lpsp while all crtc are disabled
  * Driver requirement: i915
  * Functionality: pm_lpsp
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index f59feabd4..4809481bc 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -36,7 +36,7 @@ IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
  * Description: Verify that degamma LUT transformation works correctly
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 static bool test_pipe_degamma(data_t *data,
@@ -132,7 +132,7 @@ static bool test_pipe_degamma(data_t *data,
  * Description: Verify that gamma LUT transformation works correctly
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 
@@ -229,7 +229,7 @@ static bool test_pipe_gamma(data_t *data,
  * Description: Verify that legacy gamma LUT transformation works correctly
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 
@@ -351,7 +351,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
  *              set through GAMMA_LUT property
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 
@@ -494,7 +494,7 @@ end:
  * Description: Check the color transformation %arg[1]
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  *
  * arg[1]:
@@ -874,7 +874,7 @@ out:
  * Description: Verify that deep color works correctly
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 static void
@@ -983,7 +983,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
  * Description: Negative check for %arg[1] sizes
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  *
  * arg[1]:
-- 
2.40.0
