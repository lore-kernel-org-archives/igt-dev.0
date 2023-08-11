Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5108D10E6E7
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:52 +0530
Message-Id: <20230811184655.157060-79-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 78/81] tests/kms_vrr: Document each subtest for
 testplan
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

V2: - Fix the functionality

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6a766bfb9..0532023c7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -24,6 +24,54 @@
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
+/**
+ * TEST: kms vrr
+ * Category: Display
+ * Description: Test to validate diffent features of VRR
+ *
+ * SUBTEST: flip-basic
+ * Description: Tests that VRR is enabled and that the difference between flip
+ *              timestamps converges to the requested rate
+ * Driver requirement: any
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-dpms
+ * Description: Tests with DPMS that VRR is enabled and that the difference
+ *              between flip timestamps converges to the requested rate.
+ * Driver requirement: any
+ * Functionality: adaptive_sync, dpms
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-suspend
+ * Description: Tests that VRR is enabled and that the difference between flip
+ *              timestamps converges to the requested rate in a suspend test
+ * Driver requirement: any
+ * Functionality: adaptive_sync, suspend
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flipline
+ * Description: Make sure that flips happen at flipline decision boundary.
+ * Driver requirement: any
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: negative-basic
+ * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
+ * Driver requirement: any
+ * Functionality: adaptive_sync
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define NSECS_PER_SEC (1000000000ull)
 
-- 
2.40.0
