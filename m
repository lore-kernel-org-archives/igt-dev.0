Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1210E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 07:01:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 12:31:47 +0530
Message-Id: <20230912070149.1305060-3-swati2.sharma@intel.com>
In-Reply-To: <20230912070149.1305060-1-swati2.sharma@intel.com>
References: <20230912070149.1305060-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 2/4] tests/kms_feature_discovery: add testplan
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

Add testplan documentation for the subtests.

v2: -remove run type and change mega feature to PSR

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_feature_discovery.c | 48 ++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index d1f4b1633..5ee481c4b 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -22,6 +22,53 @@
  *
  */
 
+/**
+ * TEST: kms feature discovery
+ * Category: Display
+ * Description: A metatest that checks for \"features\" presence.
+ *		The subtests here should only skip or pass,
+ *		anything else means we have a serious problem.
+ *
+ * SUBTEST: display
+ * Description: Make sure that we have display support with
+ * 		some outputs connected.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: display-%dx
+ * Description: Make sure that we have display support with %arg[1]
+ * 		outputs connected.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: chamelium
+ * Description: Make sure that Chamelium is configured and reachable.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, chamelium
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ *
+ * SUBTEST: psr1
+ * Description: Make sure that we have eDP panel with PSR1 support.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, psr1, eDP
+ * Mega feature: PSR
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2
+ * Description: Make sure that we have eDP panel with PSR2 support.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, psr2, eDP
+ * Mega feature: PSR
+ * Test category: functionality test
+ *
+ * arg[1].values: 2, 3, 4
+ */
+
 #include "igt.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
@@ -46,7 +93,6 @@ igt_main {
 	}
 
 	igt_subtest_group {
-
 		igt_fixture {
 			igt_display_require(&display, fd);
 		}
-- 
2.25.1
