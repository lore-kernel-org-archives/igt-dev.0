Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9B610E0AE
 for <igt-dev@lists.freedesktop.org>; Sun, 26 Jun 2022 18:43:30 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Mon, 27 Jun 2022 00:12:44 +0530
Message-Id: <20220626184245.24068-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220626184245.24068-1-sai.gowtham.ch@intel.com>
References: <20220626184245.24068-1-sai.gowtham.ch@intel.com>
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
---
 tests/i915/gem_exec_create.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 78d5ffb3..55773243 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -47,6 +47,11 @@
 #include "i915_drm.h"
 #include "i915/intel_memory_region.h"
 
+IGT_TEST_DESCRIPTION("This test overloads the driver with transient active"
+		" objects and checks if we don't kill the system under the"
+		" memory pressure. Some of the symptoms this test look for include"
+		" mysterious hangs.");
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
@@ -166,6 +171,8 @@ igt_main
 					    I915_DEVICE_MEMORY);
 	}
 
+	igt_describe("Check if we kill the system by overloading it with active objects"
+		     " iterating over legacy engines.");
 	igt_subtest_with_dynamic("legacy")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -177,6 +184,8 @@ igt_main
 			free(sub_name);
 		}
 
+	igt_describe("Check if we kill system by overloading it with active objects"
+		     " iterating over all engines.");
 	igt_subtest_with_dynamic("basic")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -188,6 +197,8 @@ igt_main
 			free(sub_name);
 		}
 
+	igt_describe("Concurrently overloads system with active objects and checks"
+		     " if we kill system");
 	igt_subtest_with_dynamic("forked")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
@@ -199,6 +210,9 @@ igt_main
 			free(sub_name);
 		}
 
+
+	igt_describe("This test does a forced reclaim, behaving like a bad application"
+		     " leaking its bo cache");
 	igt_subtest_with_dynamic("madvise")
 		for_each_combination(regions, 1, set) {
 			char *sub_name = memregion_dynamic_subtest_name(regions);
-- 
2.35.1
