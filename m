Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E5410E4B4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 09:43:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:04:16 +0530
Message-Id: <20231019093417.3782665-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231019093417.3782665-1-bhanuprakash.modem@intel.com>
References: <20231019093417.3782665-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 4/5] tests/kms/testplan: Fix Mega Feature in
 testplan documentation
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
 tests/chamelium/kms_chamelium_color.c | 2 +-
 tests/intel/kms_big_joiner.c          | 2 +-
 tests/intel/kms_ccs.c                 | 2 +-
 tests/intel/kms_pm_backlight.c        | 2 +-
 tests/intel/kms_pm_dc.c               | 2 +-
 tests/intel/kms_pm_lpsp.c             | 2 +-
 tests/kms_color.c                     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index e94e13e40..4156023da 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -28,7 +28,7 @@
  * Description: Test Color Features at Pipe level using Chamelium to verify instead of CRC
  * Driver requirement: i915, xe
  * Functionality: chamelium, colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 93fd04bf5..9544589ae 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -30,7 +30,7 @@
  * Description: Test big joiner
  * Driver requirement: i915, xe
  * Functionality: 2p1p
- * Mega feature: Bigjoiner
+ * Mega feature: Pipe Joiner
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 13c75e85e..f13d40b32 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -30,7 +30,7 @@
  *              uses to interpret the compressed data.
  * Driver requirement: i915, xe
  * Functionality: ccs, tiling
- * Mega feature: General Display Features
+ * Mega feature: E2E Compression
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 5b4c397bb..2e691dab0 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -31,7 +31,7 @@
  * Description: Basic backlight sysfs test
  * Driver requirement: i915, xe
  * Functionality: backlight
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 9a2b0013d..d0de93e9e 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -28,7 +28,7 @@
  * Description: Tests to validate display power DC states.
  * Driver requirement: i915, xe
  * Functionality: dpms, pm_dc
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 75a6aa53c..88cdb8d5c 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -29,7 +29,7 @@
  * Category: Display
  * Description: These tests validates display Low Power Single Pipe configurations
  * Functionality: pm_lpsp
- * Mega feature: Display Power
+ * Mega feature: Display Power Management
  * Test category: functionality test
  */
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 39752de81..bdb80a4ad 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -28,7 +28,7 @@
  * Description: Test Color Features at Pipe level
  * Driver requirement: i915, xe
  * Functionality: colorspace
- * Mega feature: Color mgmt
+ * Mega feature: Color Management
  * Test category: functionality test
  */
 
-- 
2.40.0
