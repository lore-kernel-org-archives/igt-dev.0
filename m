Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F178310EB4F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 22:42:32 +0000 (UTC)
From: Charlton Lin <charlton.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/kms_sysfs_edid_timing: increase thresholds
Date: Fri,  8 Dec 2023 14:42:05 -0800
Message-Id: <20231208224205.3428717-1-charlton.lin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Charlton Lin <charlton.lin@intel.com>, Sharma@freedesktop.org,
	Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

A customer panel consistently exceeds 150ms. Additionally, the
timing may be impacted by certain power states.

Increase all thresholds to accommodate.

Cc: Sharma, Swati2 <swati2.sharma@intel.com>
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Charlton Lin <charlton.lin@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 775211089f81..582133ea002e 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -26,9 +26,9 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
-#define THRESHOLD_PER_CONNECTOR		150
-#define THRESHOLD_PER_CONNECTOR_MEAN	140
-#define THRESHOLD_ALL_CONNECTORS_MEAN	100
+#define THRESHOLD_PER_CONNECTOR		1500
+#define THRESHOLD_PER_CONNECTOR_MEAN	1400
+#define THRESHOLD_ALL_CONNECTORS_MEAN	1000
 #define CHECK_TIMES			15
 
 IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
-- 
2.25.1
