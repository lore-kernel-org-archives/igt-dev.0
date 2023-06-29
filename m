Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20B610E3E2
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:17:55 +0530
Message-Id: <20230629144910.3055377-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 06/81] tests/chamelium/kms_chamelium_color:
 Document each subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 26239a6b8..aca57095f 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -22,10 +22,25 @@
  *
  */
 
+/**
+ * TEST: kms chamelium color
+ * Category: Display
+ * Description: Test Color Features at Pipe level using Chamelium to verify instead of CRC
+ */
+
 #include "kms_color_helper.h"
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
 
+/**
+ * SUBTEST: degamma
+ * Description: Verify that degamma LUT transformation works correctly
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: any
+ */
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -115,6 +130,15 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
+/**
+ * SUBTEST: gamma
+ * Description: Verify that gamma LUT transformation works correctly
+ * Functionality: colorspace_gamma
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: any
+ */
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * gamma LUT and verify we have the same frame dump as drawing solid
@@ -465,6 +489,27 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
 }
 
+/**
+ * SUBTEST: ctm-%s
+ * Description: Check the color transformation %arg[1]
+ * Functionality: colorspace
+ * Mega feature: Color mgmt
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: any
+ *
+ * arg[1]:
+ *
+ * @0-25:            for 0.25 transparancy
+ * @0-50:            for 0.50 transparancy
+ * @0-75:            for 0.75 transparancy
+ * @blue-to-red:     from blue to red
+ * @green-to-red:    from green to red
+ * @limited-range:   with identity matrix
+ * @max:             for max transparancy
+ * @negative:        for negative transparancy
+ * @red-to-blue:     from red to blue
+ */
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		       color_t *expected_colors,
-- 
2.40.0
