Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C2510E257
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:23 +0530
Message-Id: <20230815164815.320904-30-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 29/81] tests/i915/kms_psr_stress_test: Document
 each subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_psr_stress_test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
index 23dcb4077..e8cec7807 100644
--- a/tests/i915/kms_psr_stress_test.c
+++ b/tests/i915/kms_psr_stress_test.c
@@ -7,6 +7,28 @@
 #include <stdio.h>
 #include <string.h>
 #include <sys/timerfd.h>
+/**
+ * TEST: kms psr stress test
+ * Category: Display
+ *
+ * SUBTEST: flip-primary-invalidate-overlay
+ * Description: Mix page flips in primary plane and frontbuffer writes to overlay
+ *              plane and check for warnings, underruns or PSR state changes
+ * Driver requirement: i915, xe
+ * Functionality: plane, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalidate-primary-flip-overlay
+ * Description: Mix frontbuffer writes to the primary plane and page flips in the
+ *              overlay plane and check for warnings, underruns or PSR state changes
+ * Driver requirement: i915, xe
+ * Functionality: plane, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define INVALIDATES_PER_SEC 15
 #define FLIPS_PER_SEC 30
-- 
2.40.0
