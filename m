Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F7810E25F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 10:26:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:56:22 +0530
Message-Id: <20230918102622.258614-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dither: rename subtest
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

Use small case for subtest naming.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_dither.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index c41961937..3387a3b10 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -187,14 +187,14 @@ static bool is_supported(igt_output_t *output)
 }
 
 /**
- * SUBTEST: FB-8BPC-Vs-Panel-6BPC
+ * SUBTEST: fb-8bpc-vs-panel-6bpc
  * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
  * Driver requirement: i915, xe
  * Functionality: colorspace, kms_gem_interop
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: FB-8BPC-Vs-Panel-8BPC
+ * SUBTEST: fb-8bpc-vs-panel-8bpc
  * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
  * Driver requirement: i915, xe
  * Functionality: colorspace, kms_gem_interop
@@ -257,7 +257,7 @@ igt_main
 			       (tests[i].fb_bpc > tests[i].output_bpc) ?
 							"Enable": "Disable");
 
-		igt_subtest_with_dynamic_f("FB-%dBPC-Vs-Panel-%dBPC",
+		igt_subtest_with_dynamic_f("fb-%dbpc-vs-panel-%dbpc",
 				tests[i].fb_bpc, tests[i].output_bpc)
 			run_dither_test(&data,
 					tests[i].fb_bpc,
-- 
2.25.1
