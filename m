Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6310E197
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:18 +0530
Message-Id: <20230515081720.3713293-78-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 77/79] tests/kms_vrr: Document each subtest for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4eb..fb58822e3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -24,6 +24,53 @@
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
+/**
+ * TEST: kms vrr
+ * Category: Display
+ *
+ * SUBTEST: flip-basic
+ * Description: Tests that VRR is enabled and that the difference between flip
+ *              timestamps converges to the requested rate
+ * Driver requirement: any
+ * Functionality: vrr
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-dpms
+ * Description: Tests with DPMS that VRR is enabled and that the difference
+ *              between flip timestamps converges to the requested rate.
+ * Driver requirement: any
+ * Functionality: vrr
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-suspend
+ * Description: Tests that VRR is enabled and that the difference between flip
+ *              timestamps converges to the requested rate in a suspend test
+ * Driver requirement: any
+ * Functionality: vrr
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flipline
+ * Description: Make sure that flips happen at flipline decision boundary.
+ * Driver requirement: any
+ * Functionality: vrr
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: negative-basic
+ * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
+ * Driver requirement: any
+ * Functionality: vrr
+ * Mega feature: VRR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define NSECS_PER_SEC (1000000000ull)
 
-- 
2.40.0
