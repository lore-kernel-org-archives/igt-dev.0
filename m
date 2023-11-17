Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8D310E2F8
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 15:56:57 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Nov 2023 21:28:02 +0530
Message-Id: <20231117155802.100269-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_feature_discovery: update
 display-1x
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

Use same logic to detect 1x display as 2x, 3x and 4x displays.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_feature_discovery.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 428f97ffe..9ed7ab5cd 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -29,14 +29,6 @@
  *		The subtests here should only skip or pass,
  *		anything else means we have a serious problem.
  *
- * SUBTEST: display
- * Description: Make sure that we have display support with
- * 		some outputs connected.
- * Driver requirement: i915, xe
- * Functionality: feature_discovery
- * Mega feature: General Display Features
- * Test category: functionality test
- *
  * SUBTEST: display-%dx
  * Description: Make sure that we have display support with %arg[1]
  * 		outputs connected.
@@ -73,7 +65,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * arg[1].values: 2, 3, 4
+ * arg[1].values: 1, 2, 3, 4
  */
 
 #include "igt.h"
@@ -104,11 +96,6 @@ igt_main {
 			igt_display_require(&display, fd);
 		}
 
-		igt_describe("Make sure that we have display support with some outputs connected.");
-		igt_subtest("display") {
-			/* will skip because of the fixture */
-		}
-
 		igt_subtest_group {
 			volatile int output_count = 0;
 			igt_output_t *output;
@@ -131,6 +118,11 @@ igt_main {
 				}
 			}
 
+			igt_describe("Make sure that we have display support with some outputs connected.");
+			igt_subtest("display-1x") {
+				igt_require(output_count >= 1);
+			}
+
 			igt_describe("Make sure that we can use at least 2 outputs at the same time.");
 			igt_subtest("display-2x") {
 				igt_require(output_count >= 2);
-- 
2.25.1
