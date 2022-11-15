Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2210E13D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 12:56:15 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 18:30:50 +0530
Message-Id: <1668517250-4514-4-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668517250-4514-1-git-send-email-nidhi1.gupta@intel.com>
References: <1668517250-4514-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH 3/3] tests/i915/i915_pm_backlight: Create dynamic
 subtests
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

Modified the test to include dynamic subtests.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/i915_pm_backlight.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index e94214a..cb8efcb 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -305,7 +305,7 @@ igt_main
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe(tests[i].desc);
-		igt_subtest(tests[i].name) {
+		igt_subtest_with_dynamic(tests[i].name) {
 			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
 				test_setup(display, &contexts->output[j]);
 
@@ -318,11 +318,13 @@ igt_main
 				if (tests[i].flags == TEST_SUSPEND)
 					check_suspend(contexts[j].output);
 
-				igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
-				tests[i].test_t(&contexts[j]);
+				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
+					igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
+					tests[i].test_t(&contexts[j]);
+				}
+				test_cleanup(&display, output);
 			}
-
-			test_cleanup(&display, output);
+			/* TODO: Add tests for dual eDP. */
 		}
 	}
 
-- 
1.9.1
