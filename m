Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F9110E3EA
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:03 +0530
Message-Id: <20230629144910.3055377-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 14/81] tests/i915/kms_cdclk: Document each
 subtest for testplan
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
 tests/i915/kms_cdclk.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 40eca24f0..276cda4c4 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -24,6 +24,11 @@
  *  Swati Sharma <swati2.sharma@intel.com>
  */
 
+/**
+ * TEST: kms cdclk
+ * Category: Display
+ * Description: Test cdclk features : crawling and squashing
+ */
 #include "igt.h"
 
 IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
@@ -248,6 +253,16 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+/**
+ * SUBTEST: mode-transition-all-outputs
+ * Description: Mode transition (low to high) test to validate cdclk frequency
+ *              change by simultaneous modesets on all pipes with valid outputs.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -344,6 +359,23 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
+/**
+ * SUBTEST: mode-transition
+ * Description: Mode transition (low to high) test to validate cdclk frequency change.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-scaling
+ * Description: Plane scaling test to validate cdclk frequency change.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void run_cdclk_test(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-- 
2.40.0
