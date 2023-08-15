Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AEC10E26D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:43 +0530
Message-Id: <20230815164815.320904-50-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 49/81] tests/kms_force_connector_basic:
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

V2: - Driver requirement: s/any/i915, xe/
    - Run type: s/BAT/BAT, FULL/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_force_connector_basic.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 950af8d8a..5fe8bf52e 100644
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
@@ -159,8 +169,9 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
 /**
  * SUBTEST: force-connector-state
  * Description: Test to check the forced connector state
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
@@ -206,8 +217,9 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 /**
  * SUBTEST: force-edid
  * Description: Test to check the values after forcing edid
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
@@ -255,8 +267,9 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 /**
  * SUBTEST: prune-stale-modes
  * Description: Tests pruning of stale modes
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: force_connector
  * Mega feature: General Display Features
  */
-- 
2.40.0
