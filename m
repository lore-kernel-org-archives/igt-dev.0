Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EBF6E0AA
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Jan 2021 11:19:52 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 10 Jan 2021 16:51:53 +0530
Message-Id: <20210110112153.476908-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/i915_hangman: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: katarzyna.dec@intel.com, petri.latvala@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test and subtests description

v2: Added descriptions for newly added subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_hangman.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 72e4d8b8..d8004c55 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -38,6 +38,8 @@
 #include "igt_debugfs.h"
 #include "sw_sync.h"
 
+IGT_TEST_DESCRIPTION("Tests the handling of hang scenarios");
+
 #ifndef I915_PARAM_CMD_PARSER_VERSION
 #define I915_PARAM_CMD_PARSER_VERSION       28
 #endif
@@ -324,9 +326,11 @@ igt_main
 		igt_require(has_error_state(sysfs));
 	}
 
+	igt_describe("Validates the error state after manually triggering a hang");
 	igt_subtest("error-state-basic")
 		test_error_state_basic();
 
+	igt_describe("For each engine, validates the error state after injecting a hanging batch");
 	igt_subtest_with_dynamic("error-state-capture") {
 		__for_each_physical_engine(device, e) {
 			igt_dynamic_f("%s", e->name)
@@ -334,6 +338,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify that other engines remain unaffected after an engine is hanged");
 	igt_subtest_with_dynamic("engine-hang") {
                 int has_gpu_reset = 0;
 		struct drm_i915_getparam gp = {
@@ -352,6 +357,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify that other engines remain unaffected after a hang with invalid cs"
+	       "is injected on an engine");
 	igt_subtest_with_dynamic("engine-error") {
 		int has_gpu_reset = 0;
 		struct drm_i915_getparam gp = {
@@ -369,6 +376,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify that execution of unterminated batch buffer triggers a hang");
 	igt_subtest("hangcheck-unterminated")
 		hangcheck_unterminated();
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
