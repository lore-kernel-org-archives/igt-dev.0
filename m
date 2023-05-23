Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3305F10E3D9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:39:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:02:06 +0530
Message-Id: <20230523063243.669540-46-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 45/82] tests/kms_display_modes: Document each
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
