Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387E10E279
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:58:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:14 +0530
Message-Id: <20230815164815.320904-81-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 80/81] tests/testdisplay: Document each subtest
 for testplan
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

V2: - Fix test description
V3: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/testdisplay.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 294d4c604..0a6d2718a 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -69,6 +69,20 @@
 #include <stdlib.h>
 #include <signal.h>
 
+/**
+ * TEST: testdisplay
+ * Category: Display
+ * Description: Tests basic display functionality.
+ *
+ * SUBTEST:
+ * Description: This test is intended for testing of display functionality like
+ *              modeset, clone modes, test patterns & pixel generators etc..
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 IGT_TEST_DESCRIPTION("Tests basic display functionality.");
 
 enum {
-- 
2.40.0
