Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEB110E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:06 +0530
Message-Id: <20230815164815.320904-73-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 72/81] tests/kms_setmode: Document each subtest
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

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 60 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 035bbd0b0..e32c53480 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -31,6 +31,66 @@
 #include <sys/time.h>
 #include <math.h>
 #include "xe/xe_query.h"
+/**
+ * TEST: kms setmode
+ * Category: Display
+ * Description: Tests the mode by iterating through all valid/invalid crtc/connector
+ *              combinations
+ *
+ * SUBTEST: basic
+ * Description: Tests the vblank timing by iterating through all valid crtc/connector
+ *              combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-clone-single-crtc
+ * Description: Tests the mode by cloning the single crtc by iterating through all
+ *              valid crtc/connector combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: clone-exclusive-crtc
+ * Description: Tests the mode by cloning the exclusive crtc by iterating through
+ *              all valid crtc/connector combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-exclusive-crtc
+ * Description: Tests the mode by cloning the exclusive crtc by iterating through
+ *              all invalid crtc/connector combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-single-crtc
+ * Description: Tests the mode by cloning the single crtc by iterating through all
+ *              invalid crtc/connector combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-clone-single-crtc-stealing
+ * Description: Tests the stealing mode by cloning the single crtc by iterating
+ *              through all invalid crtc/connector combinations
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define MAX_CONNECTORS  10
 #define MAX_CRTCS       6
-- 
2.40.0
