Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CC110E3E1
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:57:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:09 +0530
Message-Id: <20230629144910.3055377-81-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 80/81] tests/testdisplay: Document each subtest
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/testdisplay.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 294d4c604..2a88eb64e 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -69,6 +69,19 @@
 #include <stdlib.h>
 #include <signal.h>
 
+/**
+ * TEST: testdisplay
+ * Category: Display
+ * Description: Tests basic display functionality.
+ *
+ * SUBTEST:
+ * Description: Tests basic display functionality.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 IGT_TEST_DESCRIPTION("Tests basic display functionality.");
 
 enum {
-- 
2.40.0
