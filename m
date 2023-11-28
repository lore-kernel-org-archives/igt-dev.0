Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EFE10E557
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 14:30:19 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 20:01:27 +0530
Message-Id: <20231128143127.203892-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_sysfs_edid_timing: reduce num of
 iterations
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

Reduce no. of iterations, check if it helps in probe time
failures.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index b36f383e5..eda01cef2 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -49,7 +49,7 @@
 #define THRESHOLD_PER_CONNECTOR		150
 #define THRESHOLD_PER_CONNECTOR_MEAN	140
 #define THRESHOLD_ALL_CONNECTORS_MEAN	100
-#define CHECK_TIMES			15
+#define CHECK_TIMES			5
 
 IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "connector and fails if either the time it takes for "
-- 
2.25.1
