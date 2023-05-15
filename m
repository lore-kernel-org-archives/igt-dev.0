Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4393610E185
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:23:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:46:44 +0530
Message-Id: <20230515081720.3713293-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 43/79] tests/kms_display_modes: Document each
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
 tests/kms_display_modes.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d69c7b931..ef9559ec3 100644
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
 
 IGT_TEST_DESCRIPTION("Test Display Modes");
@@ -134,6 +139,16 @@ static void run_extendedmode_basic(data_t *data,
 	for_each_connected_output_local((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
+/**
+ * SUBTEST: extended-mode-basic
+ * Description: Test for validating display extended mode with a pair of connected
+ *              displays
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void run_extendedmode_test(data_t *data) {
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
-- 
2.40.0
