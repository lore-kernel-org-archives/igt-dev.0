Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF7310E264
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:33 +0530
Message-Id: <20230815164815.320904-40-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 39/81] tests/kms_concurrent: Document each
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
 tests/kms_concurrent.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d915a98b2..a37b7d2fb 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -24,6 +24,32 @@
 
 #include "igt.h"
 #include "drmtest.h"
+/**
+ * TEST: kms concurrent
+ * Category: Display
+ * Description: Test atomic mode setting concurrently with multiple planes and
+ *              screen resolution
+ *
+ * SUBTEST: pipe-%s
+ * Description: Test atomic mode setting concurrently with multiple planes and
+ *              screen resolution on %arg[1].
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:      pipe A
+ * @B:      pipe B
+ * @C:      pipe C
+ * @D:      pipe D
+ * @E:      pipe E
+ * @F:      pipe F
+ * @G:      pipe G
+ * @H:      pipe H
+ */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with multiple planes and screen resolution");
 
-- 
2.40.0
