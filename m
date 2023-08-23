Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3610E412
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:52:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:53 +0530
Message-Id: <20230823114354.787212-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 6/7] tests/i915/kms_pm_lpsp: Fix testplan
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
 tests/i915/kms_pm_lpsp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/i915/kms_pm_lpsp.c b/tests/i915/kms_pm_lpsp.c
index a1bd7c10c..c58afabd0 100644
--- a/tests/i915/kms_pm_lpsp.c
+++ b/tests/i915/kms_pm_lpsp.c
@@ -34,16 +34,25 @@
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
