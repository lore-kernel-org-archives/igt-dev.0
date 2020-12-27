Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C2889217
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Dec 2020 12:02:29 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 27 Dec 2020 17:34:35 +0530
Message-Id: <20201227120435.371959-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_reset_stats: Add test and subtests
 description
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
To: igt-dev@lists.freedesktop.org, katarzyna.dec@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for test and all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
---
 tests/i915/gem_reset_stats.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 4ba1ec8e..abc2424b 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -44,6 +44,8 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 
+IGT_TEST_DESCRIPTION("Tests the GET_RESET_STATS ioctl");
+
 #define RS_NO_ERROR      0
 #define RS_BATCH_ACTIVE  (1 << 0)
 #define RS_BATCH_PENDING (1 << 1)
@@ -796,46 +798,76 @@ igt_main
 			      "Full GPU reset is not enabled. Is enable_hangcheck set?\n");
 	}
 
+	igt_describe("Verfiy GET_RESET_STATS ioctl behavior with valid/invalid param values "
+	       "and default context");
 	igt_subtest("params")
 		test_params();
 
+	igt_describe("Verfiy GET_RESET_STATS ioctl behavior with valid/invalid param values "
+	       "and non-default context");
 	igt_subtest_f("params-ctx")
 		RUN_TEST(test_params_ctx());
 
 	for (e = intel_execution_engines; e->name; e++) {
+		igt_describe_f("For %s engine, verify that reset stats are correctly updated "
+		       "for different FDs with default context", e->name);
 		igt_subtest_f("reset-stats-%s", e->name)
 			RUN_TEST(test_rs(e, 4, 1, 0));
 
+		igt_describe_f("For %s engine, verify that reset stats are correctly updated "
+		       "for different FDs with non-default context", e->name);
 		igt_subtest_f("reset-stats-ctx-%s", e->name)
 			RUN_CTX_TEST(test_rs_ctx(e, 4, 4, 1, 2));
 
+		igt_describe_f("For %s engine, try banning default context of fd and verify "
+		       "that correct number of active batches are returned", e->name);
 		igt_subtest_f("ban-%s", e->name)
 			RUN_TEST(test_ban(e));
 
+		igt_describe_f("For %s engine, try banning non-default context of fd and verify "
+		       "that correct number of active batches are returned", e->name);
 		igt_subtest_f("ban-ctx-%s", e->name)
 			RUN_CTX_TEST(test_ban_ctx(e));
 
+		igt_describe_f("Verify that correct reset counts are returned after injecting hang "
+		       "corresponding to default context on %s engine", e->name);
 		igt_subtest_f("reset-count-%s", e->name)
 			RUN_TEST(test_reset_count(e, false));
 
+		igt_describe_f("Verify that correct reset counts are returned after injecting hang "
+		       "corresponding to non-default context on %s engine", e->name);
 		igt_subtest_f("reset-count-ctx-%s", e->name)
 			RUN_CTX_TEST(test_reset_count(e, true));
 
+		igt_describe_f("For %s engine, verify that unrelated contexts are independent of "
+		       "each other with respect to updating reset stats", e->name);
 		igt_subtest_f("unrelated-ctx-%s", e->name)
 			RUN_CTX_TEST(test_unrelated_ctx(e));
 
+		igt_describe_f("Test that default context can be destroyed after injecting a hang "
+		       "batch corresponding to it on %s engine", e->name);
 		igt_subtest_f("close-pending-%s", e->name)
 			RUN_TEST(test_close_pending(e));
 
+		igt_describe_f("Test that non-default context can be destroyed after injecting a hang "
+		       "batch corresponding to it on %s engine", e->name);
 		igt_subtest_f("close-pending-ctx-%s", e->name)
 			RUN_CTX_TEST(test_close_pending_ctx(e));
 
+		igt_describe_f("Inject a hang on %s engine and verify that the forked child "
+		       "(which scheduled the same noop batch on each ring sequentially) can be "
+		       "killed successfully", e->name);
 		igt_subtest_f("close-pending-fork-%s", e->name)
 			RUN_TEST(test_close_pending_fork(e, false));
 
+		igt_describe_f("Inject a hang on %s engine and verify that the forked child "
+		       "(which scheduled the same noop batch on each ring in reverse order) "
+		       "can be killed successfully", e->name);
 		igt_subtest_f("close-pending-fork-reverse-%s", e->name)
 			RUN_TEST(test_close_pending_fork(e, true));
 
+                igt_describe_f("Inject hang on %s engine and verify in deferred manner that reset "
+		       "count is increased", e->name);
 		igt_subtest_f("defer-hangcheck-%s", e->name)
 			RUN_TEST(defer_hangcheck(e));
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
