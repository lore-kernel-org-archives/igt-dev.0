Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128B10E347
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 11:23:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 16:45:46 +0530
Message-Id: <20230816111546.339507-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-17-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-17-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V8 16/81] tests/i915/kms_dsc: Document each
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
V3: - Fix test description
    - Driver requirement: s/any/i915, xe/
V4: - Optimize test description

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 5bdac57e2..21f0c5a32 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -30,8 +30,33 @@
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
+ * Description: Tests Display Stream Compression functionality if supported by a
+ *              connector by forcing %arg[1] on all connectors that support it
+ * Driver requirement: i915, xe
+ * Functionality: dsc
+ * Mega feature: VDSC
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @basic:                        DSC with default parameters
+ * @with-bpc:                     DSC with certain input BPC for the connector
+ * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
+ * @with-formats:                 DSC with default parameters and creating fb with diff formats
+ * @with-output-formats:          DSC and output format
+ * @with-output-formats-with-bpc: DSC and output format with certain input BPC for the connector
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define LEN		20
-- 
2.40.0
