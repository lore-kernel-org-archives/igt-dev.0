Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9E10E252
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:10 +0530
Message-Id: <20230815164815.320904-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 16/81] tests/i915/kms_dsc: Document each
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

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 5bdac57e2..f8709eebd 100644
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
+ * Description: Tests Display Stream Compression functionality if supported with %arg[1]
+ * Driver requirement: i915, xe
+ * Functionality: dsc
+ * Mega feature: VDSC
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @basic:                default parameters
+ * @with-bpc:             certain input BPC for that connector
+ * @with-bpc-formats:     certain input BPC for that connector and diff formats
+ * @with-formats:         default parameters and creating fb with diff formats
+ * @with-output-formats:  output format on all connectors that support it
+ * @with-output-formats-with-bpc: output format on all connectors that support
+ *                                it with certain input BPC for that connector
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 #define LEN		20
-- 
2.40.0
