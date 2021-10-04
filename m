Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C66E1D6
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 13:47:00 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  4 Oct 2021 19:03:18 +0530
Message-Id: <20211004133318.3050630-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_create: Add support for local
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add support for local memory region (Device memory)

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_create.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 612eb032..403c2618 100644
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
@@ -54,6 +57,7 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 
 #define ENGINES (1 << 0)
 #define LEAK (1 << 1)
+#define LMEM (1 << 2)
 
 static void all(int fd, unsigned flags, int timeout, int ncpus)
 {
@@ -61,6 +65,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
+	uint32_t region = flags & LMEM ? REGION_LMEM(0) : REGION_SMEM;
 	const intel_ctx_t *ctx;
 
 	nengine = 0;
@@ -82,7 +87,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 	igt_require(nengine);
 
 	memset(&obj, 0, sizeof(obj));
-	obj.handle =  gem_create(fd, 4096);
+	obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -108,7 +113,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			for (int n = 0; n < nengine; n++) {
-				obj.handle = gem_create(fd, 4096);
+				obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 				gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 				execbuf.flags &= ~ENGINE_FLAGS;
 				execbuf.flags |= engines[n];
@@ -121,7 +126,7 @@ static void all(int fd, unsigned flags, int timeout, int ncpus)
 			count += nengine;
 			clock_gettime(CLOCK_MONOTONIC, &now);
 		} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
-		obj.handle = gem_create(fd, 4096);
+		obj.handle = gem_create_in_memory_regions(fd, 4096, region);
 		gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 		for (int n = 0; n < nengine; n++) {
 			execbuf.flags &= ~ENGINE_FLAGS;
@@ -163,6 +168,19 @@ igt_main
 	igt_subtest("madvise")
 		all(device, ENGINES | LEAK, 20, 1);
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(gem_has_lmem(device));
+		}
+
+		igt_subtest("basic-LMEM")
+			all(device, LMEM, 5, 1);
+		igt_subtest("forked-LMEM")
+			all(device, LMEM, 20, ncpus);
+
+		igt_subtest("madvise-LMEM")
+			all(device, LEAK | LMEM, 20, 1);
+	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.25.1
