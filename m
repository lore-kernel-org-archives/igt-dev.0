Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B4F10E260
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Apr 2022 10:50:06 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Apr 2022 16:21:50 +0530
Message-Id: <20220419105150.1068-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test:/kms_sysfs_edid_timing: Icrease mean
 time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some monitors taking long time to read the edid data
so increasing mean time.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 12013881..e2be3f5c 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -26,9 +26,9 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
-#define THRESHOLD_PER_CONNECTOR	10
-#define THRESHOLD_TOTAL		50
-#define CHECK_TIMES		15
+#define THRESHOLD_PER_CONNECTOR	200
+#define THRESHOLD_TOTAL		200
+#define CHECK_TIMES		30
 
 IGT_TEST_DESCRIPTION("This check the time we take to read the content of all "
 		     "the possible connectors. Without the edid -ENXIO patch "
-- 
2.26.2
