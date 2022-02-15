Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1C10E2C4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 12:58:54 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Tue, 15 Feb 2022 18:33:00 +0530
Message-Id: <20220215130300.2282453-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_ctx_create: Added test description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test and subtests description

v2: Modified description to be more precise

v3: Rebase

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>
---
 tests/i915/gem_ctx_create.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 44846652..67219e9c 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -36,6 +36,8 @@
 #include "igt_rand.h"
 #include "sw_sync.h"
 
+IGT_TEST_DESCRIPTION("Test the context create ioctls");
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static unsigned all_engines[I915_EXEC_RING_MASK + 1];
@@ -585,6 +587,7 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Test random context creation");
 	igt_subtest("basic") {
 		memset(&create, 0, sizeof(create));
 		create.ctx_id = rand();
@@ -594,41 +597,67 @@ igt_main
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
 		maximum(fd, &cfg, ncpus, CHECK_RAM);
+
+	igt_describe("Create contexts upto available RAM+SWAP size, check the average "
+	       "performance of their execution on multiple parallel threads");
 	igt_subtest("maximum-swap")
 		maximum(fd, &cfg, ncpus, CHECK_RAM | CHECK_SWAP);
 
+	igt_describe("Exercise implicit per-fd context creation");
 	igt_subtest("basic-files")
 		files(fd, &cfg, 2, 1);
+
+	igt_describe("Exercise implicit per-fd context creation on 1 CPU for long duration");
 	igt_subtest("files")
 		files(fd, &cfg, 20, 1);
+
+	igt_describe("Exercise implicit per-fd context creation on all CPUs for long duration");
 	igt_subtest("forked-files")
 		files(fd, &cfg, 20, ncpus);
 
+	igt_describe("Check the average performance of context creation and "
+	       "it's execution using all engines");
 	/* NULL value means all engines */
 	igt_subtest("active-all")
 		active(fd, &cfg, NULL, 20, 1);
+
+	igt_describe("Check the average performance of context creation and it's execution "
+	       "using all engines on multiple parallel threads");
 	igt_subtest("forked-active-all")
 		active(fd, &cfg, NULL, 20, ncpus);
 
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution");
 	igt_subtest_with_dynamic("active") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
 				active(fd, &cfg, e, 20, 1);
 		}
 	}
+
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution on multiple parallel threads");
 	igt_subtest_with_dynamic("forked-active") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
 				active(fd, &cfg, e, 20, ncpus);
 		}
 	}
+
+	igt_describe("For each engine check the average performance of context creation "
+	       "and execution while all other engines are hogging the resources");
 	igt_subtest_with_dynamic("hog") {
 		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-- 
2.25.1
