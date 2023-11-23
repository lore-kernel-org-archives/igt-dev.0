Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF8610E6CB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 05:26:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Nov 2023 10:58:06 +0530
Message-Id: <20231123052807.157210-2-swati2.sharma@intel.com>
In-Reply-To: <20231123052807.157210-1-swati2.sharma@intel.com>
References: <20231123052807.157210-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_feature_discovery: update
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
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_feature_discovery.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 81064aa0e..1b192b0bd 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -72,7 +72,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * arg[1].values: 2, 3, 4
+ * arg[1].values: 1, 2, 3, 4
  */
 
 #include "igt.h"
@@ -137,6 +137,11 @@ igt_main {
 				}
 			}
 
+			igt_describe("Make sure that we can use at least 1 output at a time.");
+			igt_subtest("display-1x") {
+				igt_require(output_count >= 1);
+			}
+
 			igt_describe("Make sure that we can use at least 2 outputs at the same time.");
 			igt_subtest("display-2x") {
 				igt_require(output_count >= 2);
-- 
2.25.1
