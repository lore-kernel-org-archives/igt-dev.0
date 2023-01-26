Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962C310E2BF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 12:18:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jan 2023 13:18:24 +0100
Message-Id: <20230126121824.299337-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_tiled_fence_blits: Fix softpinned
 version of the test
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

Working with larger set on mappable apperture for softpinned version
of the test we might hit situation buffers randomly taken to blit
might overlap. Since reloc allocator is keeping offset per handle
only thing we can do is to pick another pair of buffers until we get
two non-overlapping ones.

Due to extremely long execution time on RKL I've limited number
of cores used to blit and verify buffer contents to four. It seems
ggtt mapping is very slow on this platform comparing to older gens
(Skylake for example).

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7675

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_tiled_fence_blits.c | 45 ++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 1c621d1e3a..b1105ffa9f 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -154,22 +154,29 @@ static void run_test(int fd, int count, uint64_t end)
 	uint32_t *src_order, *dst_order;
 	uint32_t *bo, *bo_start_val;
 	uint32_t start = 0;
-	uint64_t ahnd = 0;
+	uint64_t ahnd = 0, ahndbb = 0;
 
-	if (!gem_has_relocations(fd))
+	if (!gem_has_relocations(fd)) {
 		ahnd = intel_allocator_open_full(fd, 0, 0, end,
 						 INTEL_ALLOCATOR_RELOC,
 						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+		/* Use separated vm range for bb */
+		ahndbb = intel_allocator_open_full(fd, 1, end, 0,
+						   INTEL_ALLOCATOR_RELOC,
+						   ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	}
+
 	memset(reloc, 0, sizeof(reloc));
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
 	obj[1].flags = EXEC_OBJECT_NEEDS_FENCE;
 	obj[2].handle = gem_create(fd, 4096);
-	obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0);
+	obj[2].offset = get_offset(ahndbb, obj[2].handle, 4096, 0);
 	if (ahnd) {
 		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
 		obj[1].flags |= EXEC_OBJECT_PINNED;
-		obj[2].flags |= EXEC_OBJECT_PINNED;
+		obj[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	}
 	obj[2].relocs_ptr = to_user_pointer(reloc);
 	obj[2].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
@@ -206,6 +213,7 @@ static void run_test(int fd, int count, uint64_t end)
 		for (int i = 0; i < count; i++) {
 			int src = src_order[i];
 			int dst = dst_order[i];
+			int ret;
 
 			if (src == dst)
 				continue;
@@ -218,19 +226,33 @@ static void run_test(int fd, int count, uint64_t end)
 						sizeof(linear), 0);
 				obj[1].offset = get_offset(ahnd, obj[1].handle,
 						sizeof(linear), 0);
-				obj[2].offset = get_offset(ahnd, obj[2].handle,
+				obj[2].offset = get_offset(ahndbb, obj[2].handle,
 						4096, 0);
 				update_batch(fd, obj[2].handle, reloc,
 					     obj[0].offset, obj[1].offset);
 			}
 
-			gem_execbuf(fd, &eb);
-			if (ahnd) {
+			ret = __gem_execbuf(fd, &eb);
+
+			/*
+			 * 1. For relocations execbuf must succeed.
+			 * 2. For softpinning we might hit situation two buffers
+			 * would overlap (buffers picked to blit are randomized
+			 * and we use more buffers aperture can hold).
+			 * For such situation (ENOSPC) we just repeat pick
+			 * and execute.
+			 */
+			if (!ahnd) {
+				igt_assert_eq(ret, 0);
+			} else {
+				igt_assert(ret == 0 || ret == -ENOSPC);
 				gem_close(fd, obj[2].handle);
+				put_offset(ahndbb, obj[2].handle);
 				obj[2].handle = gem_create(fd, 4096);
 			}
 
-			bo_start_val[dst] = bo_start_val[src];
+			if (!ret)
+				bo_start_val[dst] = bo_start_val[src];
 		}
 	}
 
@@ -242,13 +264,18 @@ static void run_test(int fd, int count, uint64_t end)
 
 	gem_close(fd, obj[2].handle);
 	put_ahnd(ahnd);
+	put_ahnd(ahndbb);
 }
 
 #define MAX_32b ((1ull << 32) - 4096)
 
 igt_main
 {
-	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	/*
+	 * For machines with many cpu cores buffer verification can take
+	 * almost minute, limitation to 4 cores keeps this time in seconds.
+	 */
+	const int ncpus = min_t(int, sysconf(_SC_NPROCESSORS_ONLN), 4);
 	uint64_t count = 0, end;
 	int fd;
 
-- 
2.34.1
