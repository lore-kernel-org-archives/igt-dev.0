Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC810E6EF
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:23 +0530
Message-Id: <20230811184655.157060-50-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 49/81] tests/kms_force_connector_basic:
 Document each subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_force_connector_basic.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 950af8d8a..80e0822c3 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -23,8 +23,9 @@
  */
 
 /**
- * TEST: Check the debugfs force connector/edid features work correctly
+ * TEST: kms force connector basic
  * Category: Display
+ * Description: Check the debugfs force connector/edid features work correctly.
  */
 
 #include "igt.h"
@@ -68,6 +69,15 @@ static void reset_connectors(void)
 	drm_close_driver(drm_fd);
 }
 
+/**
+ * SUBTEST: force-load-detect
+ * Description: Test to detect forced load.
+ * Driver requirement: i915
+ * Functionality: force_connector, vga
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
 {
 	int i, j, w = 64, h = 64;
@@ -159,6 +169,7 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
 /**
  * SUBTEST: force-connector-state
  * Description: Test to check the forced connector state
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: force_connector
@@ -206,6 +217,7 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 /**
  * SUBTEST: force-edid
  * Description: Test to check the values after forcing edid
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: force_connector
@@ -255,6 +267,7 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 /**
  * SUBTEST: prune-stale-modes
  * Description: Tests pruning of stale modes
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: force_connector
-- 
2.40.0
