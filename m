Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7F910E3DF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:28 +0530
Message-Id: <20230629144910.3055377-40-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 39/81] tests/kms_concurrent: Document each
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
 tests/kms_concurrent.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d915a98b2..f5fe321a2 100644
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
+ * Driver requirement: any
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
