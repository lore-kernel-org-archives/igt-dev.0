Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FA110E3F6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:39:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:02:01 +0530
Message-Id: <20230523063243.669540-41-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 40/82] tests/kms_concurrent: Document each
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
index e1e581723..a7bb64374 100644
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
