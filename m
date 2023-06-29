Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552C10E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:05 +0530
Message-Id: <20230629144910.3055377-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 16/81] tests/i915/kms_dsc: Document each
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
 tests/i915/kms_dsc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 0a3e29924..4cce7face 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -30,8 +30,35 @@
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
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
-- 
2.40.0
