Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832D110E6EE
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:54:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:15:45 +0530
Message-Id: <20230811184655.157060-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 11/81] tests/i915/kms_big_joiner: Document each
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_joiner.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index 2ff23398a..c448853c5 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -24,6 +24,11 @@
  *  Karthik B S <karthik.b.s@intel.com>
  */
 
+/**
+ * TEST: kms big joiner
+ * Category: Display
+ * Description: Test big joiner
+ */
 #include "igt.h"
 
 #define MAX_HDISPLAY_PER_PIPE 5120
@@ -40,6 +45,16 @@ typedef struct {
 	uint32_t big_joiner_output[2];
 } data_t;
 
+/**
+ * SUBTEST: invalid-modeset
+ * Description: Verify if the modeset on the adjoining pipe is rejected when
+ *              the pipe is active with a big joiner modeset
+ * Driver requirement: any
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_invalid_modeset(data_t *data)
 {
 	igt_output_t *output;
@@ -80,6 +95,15 @@ static void test_invalid_modeset(data_t *data)
 	igt_assert_lt(ret, 0);
 }
 
+/**
+ * SUBTEST: basic
+ * Description: Verify the basic modeset on big joiner mode on all pipes
+ * Driver requirement: any
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -118,6 +142,15 @@ static void test_basic_modeset(data_t *data)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
+/**
+ * SUBTEST: 2x-modeset
+ * Description: Verify simultaneous modeset on 2 big joiner outputs
+ * Driver requirement: any
+ * Functionality: 2p1p
+ * Mega feature: Bigjoiner
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_dual_display(data_t *data)
 {
 	drmModeModeInfo *mode;
-- 
2.40.0
