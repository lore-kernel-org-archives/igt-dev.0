Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F4710E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:38 +0530
Message-Id: <20230815164815.320904-45-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 44/81] tests/kms_display_modes: Document each
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

V2: - Add missing documentation
V3: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 93d91ef5b..5dbf0a88d 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -24,6 +24,11 @@
  *  Jeevan B <jeevan.b@intel.com>
  */
 
+/**
+ * TEST: kms display modes
+ * Category: Display
+ * Description: Test Display Modes
+ */
 #include "igt.h"
 
 #define HDISPLAY_4K	3840
@@ -231,6 +236,16 @@ static void run_extendedmode_basic(data_t *data,
 	for_each_connected_output_local((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
+/**
+ * SUBTEST: extended-mode-basic
+ * Description: Test for validating display extended mode with a pair of connected
+ *              displays
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void run_extendedmode_test(data_t *data) {
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
@@ -276,6 +291,16 @@ static void run_extendedmode_test(data_t *data) {
 	}
 }
 
+/**
+ * SUBTEST: mst-extended-mode-negative
+ * Description: Negative test for validating display extended mode with a pair
+ *		of connected 2k-4k or 4k-4k displays.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, mst
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
 {
 	struct igt_fb fbs[2];
-- 
2.40.0
