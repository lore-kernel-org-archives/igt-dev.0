Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF8910E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:58:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:13 +0530
Message-Id: <20230815164815.320904-80-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 79/81] tests/kms_writeback: Document each
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

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_writeback.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index de1267ec9..fce6554ce 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -32,6 +32,48 @@
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "sw_sync.h"
+/**
+ * TEST: kms writeback
+ * Category: Display
+ * Description: This test validates the expected behavior of the writeback
+ *              connectors feature by checking if the target device support
+ *              writeback; it validates bad and good combination, check color
+ *              format, and check the output result by using CRC.
+ *
+ * SUBTEST: writeback-check-output
+ * Description: Check writeback output with CRC validation
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: writeback-fb-id
+ * Description: Validate WRITEBACK_FB_ID with valid and invalid options
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: writeback-invalid-parameters
+ * Description: Writeback has a couple of parameters linked together(output
+ *              framebuffer and fence); this test goes throughthe combination
+ *              of possible bad options
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: writeback-pixel-formats
+ * Description: Check the writeback format
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION(
    "This test validates the expected behavior of the writeback connectors "
-- 
2.40.0
