Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8710E40C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:02 +0530
Message-Id: <20230629144910.3055377-74-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 73/81] tests/kms_setmode: Document each subtest
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
 tests/kms_setmode.c | 58 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 035bbd0b0..bce41fc3b 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -31,6 +31,64 @@
 #include <sys/time.h>
 #include <math.h>
 #include "xe/xe_query.h"
+/**
+ * TEST: kms setmode
+ * Category: Display
+ *
+ * SUBTEST: basic
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-clone-single-crtc
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: clone-exclusive-crtc
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-exclusive-crtc
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-single-crtc
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-single-crtc-stealing
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define MAX_CONNECTORS  10
 #define MAX_CRTCS       6
-- 
2.40.0
