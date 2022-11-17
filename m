Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED9510E0C0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 11:40:25 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Nov 2022 17:14:58 +0530
Message-Id: <1668685498-10679-4-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1668685498-10679-1-git-send-email-nidhi1.gupta@intel.com>
References: <1668685498-10679-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH v5 3/3] tests/i915/i915_pm_backlight: Create
 dynamic subtests
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
 tests/i915/i915_pm_backlight.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 1dcfc7e..8296066 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -307,7 +307,7 @@ igt_main
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe(tests[i].desc);
-		igt_subtest(tests[i].name) {
+		igt_subtest_with_dynamic(tests[i].name) {
 			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
 				test_setup(display, &contexts->output[j]);
 
@@ -317,8 +317,10 @@ igt_main
 				if (tests[i].flags == TEST_SUSPEND)
 					check_suspend(contexts[j].output);
 
-				tests[i].test_t(&contexts[j]);
-				test_cleanup(&display, contexts[j].output);
+				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
+					tests[i].test_t(&contexts[j]);
+					test_cleanup(&display, contexts[j].output);
+				}
 			}
 		}
 	}
-- 
1.9.1
