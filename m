Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B99910E18E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:14 +0530
Message-Id: <20230515081720.3713293-74-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 73/79] tests/kms_sysfs_edid_timing: Document each
 subtest for testplan
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
 tests/kms_sysfs_edid_timing.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 775211089..e185eaf6d 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -25,6 +25,27 @@
 #include <dirent.h>
 #include <fcntl.h>
 #include <sys/stat.h>
+/**
+ * TEST: kms sysfs edid timing
+ * Category: Display
+ * Description: This test checks the time it takes to reprobe each connector and
+ *              fails if either the time it takes for one reprobe is too long or
+ *              if the mean time it takes to reprobe one connector is too long.
+ *              Additionally, make sure that the mean time for all connectors is
+ *              not too long.
+ *
+ * SUBTEST:
+ * Description: This test checks the time it takes to reprobe each connector and
+ *              fails if either the time it takes for one reprobe is too long or
+ *              if the mean time it takes to reprobe one connector is too long.
+ *              Additionally, make sure that the mean time for all connectors is
+ *              not too long.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define THRESHOLD_PER_CONNECTOR		150
 #define THRESHOLD_PER_CONNECTOR_MEAN	140
-- 
2.40.0
