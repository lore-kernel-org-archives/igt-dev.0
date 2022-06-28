Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE0D10E1EE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 04:44:25 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Tue, 28 Jun 2022 10:13:38 +0530
Message-Id: <20220628044339.14809-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220628044339.14809-1-sai.gowtham.ch@intel.com>
References: <20220628044339.14809-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_create: Added test
 description for test case.
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Added test description for all the subtests that are available.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_create.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 78d5ffb3..449aa5b2 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -47,6 +47,10 @@
 #include "i915_drm.h"
 #include "i915/intel_memory_region.h"
 
+IGT_TEST_DESCRIPTION("This test overloads the driver with transient active objects"
+		     " and checks if we don't kill the system under the memory pressure"
+		     " some of the symptoms this test look for include mysterious hangs.");
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
@@ -166,6 +170,8 @@ igt_main
 					    I915_DEVICE_MEMORY);
 	}
 
+	igt_describe("Check if we kill the system by overloading it with active objects"
+		     " iterating over legacy engines.");
 	igt_subtest_with_dynamic("legacy")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -177,6 +183,8 @@ igt_main
 			free(sub_name);
 		}
 
+	igt_describe("Check if we kill system by overloading it with active objects"
+		     " iterating over all engines.");
 	igt_subtest_with_dynamic("basic")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -188,6 +196,8 @@ igt_main
 			free(sub_name);
 		}
 
+	igt_describe("Concurrently overloads system with active objects and checks"
+		     " if we kill system.");
 	igt_subtest_with_dynamic("forked")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -199,6 +209,9 @@ igt_main
 			free(sub_name);
 		}
 
+
+	igt_describe("This test does a forced reclaim, behaving like a bad application"
+		     " leaking its bo cache.");
 	igt_subtest_with_dynamic("madvise")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
-- 
2.35.1
