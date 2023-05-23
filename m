Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651BC10E3D9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:38:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:01:38 +0530
Message-Id: <20230523063243.669540-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 17/82] tests/i915/kms_dsc: Document each
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
index 4af48b196..8047aac27 100644
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
 #include "igt_dsc_helper.h"
 
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
