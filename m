Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F94510E881
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 07:01:01 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:30:51 +0530
Message-Id: <20230908070053.1283474-3-swati2.sharma@intel.com>
In-Reply-To: <20230908070053.1283474-1-swati2.sharma@intel.com>
References: <20230908070053.1283474-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_feature_discovery: add
 testplan documentation
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_feature_discovery.c | 53 ++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index d1f4b1633..49958fd88 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -22,6 +22,58 @@
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
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: display-%dx
+ * Description: Make sure that we have display support with %arg[1]
+ * 		outputs connected.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: chamelium
+ * Description: Make sure that Chamelium is configured and reachable.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, chamelium
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr1
+ * Description: Make sure that we have eDP panel with PSR1 support.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, psr1, eDP
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2
+ * Description: Make sure that we have eDP panel with PSR2 support.
+ * Driver requirement: i915, xe
+ * Functionality: feature_discovery, psr2, eDP
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1].values: 2, 3, 4
+ */
+
 #include "igt.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
@@ -46,7 +98,6 @@ igt_main {
 	}
 
 	igt_subtest_group {
-
 		igt_fixture {
 			igt_display_require(&display, fd);
 		}
-- 
2.25.1
