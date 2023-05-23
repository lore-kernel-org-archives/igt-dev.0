Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF4110E3F6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:40:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:02:42 +0530
Message-Id: <20230523063243.669540-82-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 81/82] tests/testdisplay: Document each subtest
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
index ee272dfb2..ac696c7fe 100644
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
