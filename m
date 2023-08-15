Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F4110E26B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:07 +0530
Message-Id: <20230815164815.320904-74-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 73/81] tests/kms_sysfs_edid_timing: Document
 each subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 775211089..3a440ed98 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -25,6 +25,23 @@
 #include <dirent.h>
 #include <fcntl.h>
 #include <sys/stat.h>
+/**
+ * TEST: kms sysfs edid timing
+ * Category: Display
+ * Description: Test to check the time it takes to reprobe each connector.
+ *
+ * SUBTEST:
+ * Description: This test checks the time it takes to reprobe each connector and
+ *              fails if either the time it takes for one reprobe is too long or
+ *              if the mean time it takes to reprobe one connector is too long.
+ *              Additionally, make sure that the mean time for all connectors is
+ *              not too long.
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define THRESHOLD_PER_CONNECTOR		150
 #define THRESHOLD_PER_CONNECTOR_MEAN	140
-- 
2.40.0
