Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FA010E6F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:54:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:15:50 +0530
Message-Id: <20230811184655.157060-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 16/81] tests/i915/kms_dsc: Document each
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

V2: - Add documentation for dsc-with-output-formats-with-bpc (Swati)

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 5bdac57e2..036c351f8 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -30,8 +30,37 @@
  *
  */
 
+/**
+ * TEST: kms dsc
+ * Category: Display
+ * Description: Test to validate display stream compression
+ */
 #include "kms_dsc_helper.h"
 
+/**
+ * SUBTEST: dsc-%s
+ * Description: Tests basic display stream compression functionality if supported
+ *              by a connector by forcing %arg[1]
+ * Driver requirement: any
+ * Functionality: dsc
+ * Mega feature: VDSC
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @basic:                DSC on all connectors that support it with default parameters
+ * @with-bpc:             DSC on all connectors that support it with certain input BPC
+ *                        for the connector
+ * @with-bpc-formats:     DSC on all connectors that support it with certain input
+ *                        BPC for the connector with diff formats
+ * @with-formats:         DSC on all connectors that support it with default parameters
+ *                        and creating fb with diff formats
+ * @with-output-formats:  DSC and output format on all connectors that support it
+ * @with-output-formats-with-bpc: DSC and output format on all connectors that support
+ *                                it with certain input BPC for the connector
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define LEN		20
-- 
2.40.0
