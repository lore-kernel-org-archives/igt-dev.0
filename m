Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E816E99A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jan 2021 05:27:07 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 22 Jan 2021 10:58:56 +0530
Message-Id: <20210122052856.770946-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_ctx_create: Added test description for test case
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

v2: Modified description to be more precise

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_ctx_create.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 9a512a03..b8f2fb00 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -35,6 +35,8 @@
 #include "igt_rand.h"
 #include "sw_sync.h"
 
+IGT_TEST_DESCRIPTION("Test the context create ioctls");
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static unsigned all_engines[I915_EXEC_RING_MASK + 1];
@@ -582,6 +584,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Test random context creation");
 	igt_subtest("basic") {
 		memset(&create, 0, sizeof(create));
 		create.ctx_id = rand();
@@ -591,41 +594,67 @@ igt_main
 		gem_context_destroy(fd, create.ctx_id);
 	}
 
+	igt_describe("Verify valid and invalid context extensions");
 	igt_subtest("ext-param")
 		basic_ext_param(fd);
+
+	igt_describe("Set, validate and execute particular context params");
 	igt_subtest("iris-pipeline")
 		iris_pipeline(fd);
 
+	igt_describe("Create contexts upto available RAM size, check the average "
+	       "performance of their execution on multiple parallel threads");
 	igt_subtest("maximum-mem")
 		maximum(fd, ncpus, CHECK_RAM);
+
+	igt_describe("Create contexts upto available RAM+SWAP size, check the average "
+	       "performance of their execution on multiple parallel threads");
 	igt_subtest("maximum-swap")
 		maximum(fd, ncpus, CHECK_RAM | CHECK_SWAP);
 
+	igt_describe("Exercise implicit per-fd context creation");
 	igt_subtest("basic-files")
 		files(fd, 2, 1);
+
+	igt_describe("Exercise implicit per-fd context creation on 1 CPU for long duration");
 	igt_subtest("files")
 		files(fd, 20, 1);
+
+	igt_describe("Exercise implicit per-fd context creation on all CPUs for long duration");
 	igt_subtest("forked-files")
 		files(fd, 20, ncpus);
 
+	igt_describe("Check the average performance of context creation and "
+	       "it's execution using all engines");
 	/* NULL value means all engines */
 	igt_subtest("active-all")
 		active(fd, NULL, 20, 1);
+
+	igt_describe("Check the average performance of context creation and it's execution "
+	       "using all engines on multiple parallel threads");
 	igt_subtest("forked-active-all")
 		active(fd, NULL, 20, ncpus);
 
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution");
 	igt_subtest_with_dynamic("active") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
 				active(fd, e, 20, 1);
 		}
 	}
+
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution on multiple parallel threads");
 	igt_subtest_with_dynamic("forked-active") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
 				active(fd, e, 20, ncpus);
 		}
 	}
+
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution while all other engines are hogging the resources");
 	igt_subtest_with_dynamic("hog") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
