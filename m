Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C3010E3D4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:15 +0530
Message-Id: <20230517063323.4146387-74-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 73/81] tests/kms_setmode: Document each subtest
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 58 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a611d9382..8c0cb7f1c 100644
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


