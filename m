Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059710E6EB
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:12 +0530
Message-Id: <20230811184655.157060-39-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 38/81] tests/kms_color: Document each subtest
 for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Include ctm-signed test
V3: - Drop colorspace_gamma from the functionality

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b15b9572c..88da3cd6d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -22,10 +22,24 @@
  *
  */
 
+/**
+ * TEST: kms color
+ * Category: Display
+ * Description: Test Color Features at Pipe level
+ */
 #include "kms_color_helper.h"
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+/**
+ * SUBTEST: degamma
+ * Description: Verify that degamma LUT transformation works correctly
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -114,6 +128,16 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
+/**
+ * SUBTEST: gamma
+ * Description: Verify that gamma LUT transformation works correctly
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
  * LUT and verify we have the same CRC as drawing solid color rectangles.
@@ -202,6 +226,16 @@ static bool test_pipe_gamma(data_t *data,
 	return ret;
 }
 
+/**
+ * SUBTEST: legacy-gamma
+ * Description: Verify that legacy gamma LUT transformation works correctly
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -314,6 +348,17 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	return ret;
 }
 
+/**
+ * SUBTEST: legacy-gamma-reset
+ * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
+ *              set through GAMMA_LUT property
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 /*
  * Verify that setting the legacy gamma LUT resets the gamma LUT set
  * through the GAMMA_LUT property.
@@ -448,6 +493,28 @@ end:
 	return ret;
 }
 
+/**
+ * SUBTEST: ctm-%s
+ * Description: Check the color transformation %arg[1]
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @0-25:           for 0.25 transparency
+ * @0-50:           for 0.50 transparency
+ * @0-75:           for 0.75 transparency
+ * @blue-to-red:    from blue to red
+ * @green-to-red:   from green to red
+ * @max:            for maximum transparency
+ * @negative:       for negative transparency
+ * @red-to-blue:    from red to blue
+ * @signed:         for correct signed handling
+ */
+
 /*
  * Draw 3 rectangles using before colors with the ctm matrix apply and verify
  * the CRC is equal to using after colors with an identify ctm matrix.
@@ -807,6 +874,15 @@ out:
 	test_cleanup(data);
 }
 
+/**
+ * SUBTEST: deep-color
+ * Description: Verify that deep color works correctly
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -899,6 +975,21 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 	test_cleanup(data);
 }
 
+/**
+ * SUBTEST: invalid-%s-sizes
+ * Description: Negative check for %arg[1] sizes
+ * Driver requirement: any
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @ctm-matrix:         Color transformation matrix
+ * @degamma-lut:        Degamma LUT
+ * @gamma-lut:          Gamma LUT
+ */
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
-- 
2.40.0
