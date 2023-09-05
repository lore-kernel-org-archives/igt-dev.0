Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4210E503
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 13:03:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:23:55 +0530
Message-Id: <20230905125356.1659246-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 6/7] tests/intel/kms_pm_lpsp: Fix testplan
 documentation
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

As kms_pm_lpsp is moved to display, update the test documentation
according to the kms testplan kms_test_config.json

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 0adcb8cc0..407558a4f 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -13,16 +13,25 @@
 #include <fcntl.h>
 #include <unistd.h>
 /**
- * TEST: i915 pm lpsp
+ * TEST: kms pm lpsp
  * Description: These tests validates display Low Power Single Pipe configurations
- * Feature: pm_lpsp
- * Run type: FULL
+ * Category: Display
  *
  * SUBTEST: kms-lpsp
  * Description: This test validates lpsp on all connected outputs on low power PIPE_A
+ * Driver requirement: i915
+ * Functionality: pm_lpsp
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  *
  * SUBTEST: screens-disabled
  * Description: This test validates lpsp while all crtc are disabled
+ * Driver requirement: i915
+ * Functionality: pm_lpsp
+ * Mega feature: Display Power
+ * Run type: FULL
+ * Test category: functionality test
  */
 
 #define MAX_SINK_LPSP_INFO_BUF_LEN	4096
-- 
2.40.0
