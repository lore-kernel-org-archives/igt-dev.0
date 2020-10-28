Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3C6E488
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2020 15:43:27 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed, 28 Oct 2020 21:16:39 +0530
Message-Id: <20201028154639.41616-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_hangman: Added test description
 for test case
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test and subtests description

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/i915_hangman.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 2b341c4b..4340d680 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -36,6 +36,8 @@
 #include "igt_sysfs.h"
 #include "igt_debugfs.h"
 
+IGT_TEST_DESCRIPTION("Tests the handling of hang scenarios");
+
 #ifndef I915_PARAM_CMD_PARSER_VERSION
 #define I915_PARAM_CMD_PARSER_VERSION       28
 #endif
@@ -274,9 +276,11 @@ igt_main
 		igt_require(has_error_state(sysfs));
 	}
 
+	igt_describe("Validates the error state after manually triggering a hang");
 	igt_subtest("error-state-basic")
 		test_error_state_basic();
 
+	igt_describe("For each engine, validates the error state after injecting a hanging batch");
 	igt_subtest_with_dynamic("error-state-capture") {
 		__for_each_physical_engine(device, e) {
 			igt_dynamic_f("%s", e->name)
@@ -284,6 +288,7 @@ igt_main
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
