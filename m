Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DBC6EBA3
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 12:15:19 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Tue, 19 Oct 2021 17:50:42 +0530
Message-Id: <20211019122042.1699646-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_exec_create: Add support for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add support for local memory region (Device memory)

v2: Migrate to dynamic subtests for adding regioning
    support in all subtests.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_create.c | 70 +++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 612eb032..78d5ffb3 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -44,6 +44,9 @@
 #include "i915/gem_ring.h"
 #include "igt.h"
 
+#include "i915_drm.h"
+#include "i915/intel_memory_region.h"
+
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
@@ -55,7 +58,7 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 #define ENGINES (1 << 0)
 #define LEAK (1 << 1)
 
-static void all(int fd, unsigned flags, int timeout, int ncpus)
+static void all(int fd, unsigned flags, int timeout, int ncpus, uint32_t region)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -82,7 +85,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	igt_require(nengine);
 
 	memset(&obj, 0, sizeof(obj));
-	obj.handle =  gem_create(fd, 4096);
+	obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -108,7 +111,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			for (int n = 0; n < nengine; n++) {
-				obj.handle = gem_create(fd, 4096);
+				obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 				gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 				execbuf.flags &= ~ENGINE_FLAGS;
 				execbuf.flags |= engines[n];
@@ -121,7 +124,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 			count += nengine;
 			clock_gettime(CLOCK_MONOTONIC, &now);
 		} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
-		obj.handle = gem_create(fd, 4096);
+		obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 		gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 		for (int n = 0; n < nengine; n++) {
 			execbuf.flags &= ~ENGINE_FLAGS;
@@ -144,6 +147,9 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	uint32_t region;
 	int device = -1;
 
 	igt_fixture {
@@ -151,18 +157,58 @@ igt_main
 		igt_require_gem(device);
 
 		igt_fork_hang_detector(device);
+
+		query_info = gem_get_query_memory_regions(device);
+		igt_assert(query_info);
+
+		set = get_memory_region_set(query_info,
+					    I915_SYSTEM_MEMORY,
+					    I915_DEVICE_MEMORY);
 	}
 
-	igt_subtest("legacy")
-		all(device, 0, 2, 1);
-	igt_subtest("basic")
-		all(device, ENGINES, 2, 1);
-	igt_subtest("forked")
-		all(device, ENGINES, 20, ncpus);
+	igt_subtest_with_dynamic("legacy")
+		for_each_combination(regions, 1, set) {
+			char *sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+
+			igt_dynamic_f("%s", sub_name)
+				all(device, 0, 2, 1, region);
+
+			free(sub_name);
+		}
+
+	igt_subtest_with_dynamic("basic")
+		for_each_combination(regions, 1, set) {
+			char *sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+
+			igt_dynamic_f("%s", sub_name)
+				all(device, ENGINES, 2, 1, region);
 
-	igt_subtest("madvise")
-		all(device, ENGINES | LEAK, 20, 1);
+			free(sub_name);
+		}
+
+	igt_subtest_with_dynamic("forked")
+		for_each_combination(regions, 1, set) {
+			char *sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+
+			igt_dynamic_f("%s", sub_name)
+				all(device, ENGINES, 20, ncpus, region);
+
+			free(sub_name);
+		}
+
+	igt_subtest_with_dynamic("madvise")
+		for_each_combination(regions, 1, set) {
+			char *sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
 
+			igt_dynamic_f("%s", sub_name)
+				all(device, ENGINES | LEAK, 20, 1, region);
+
+			free(sub_name);
+		}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.25.1
