Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F45B10E692
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:45:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:41 +0200
Message-Id: <20220901114442.55071-12-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/12] i915/gem_mmap_offset: Exercise close
 race against all types/regions
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Iterate over all mmmap types and memory regions looking for races
against closing the object.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 tests/i915/gem_mmap_offset.c | 42 +++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 7c663f1074..5c3ed3d29f 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -491,29 +491,31 @@ static void close_race(int i915, int timeout)
 
 	igt_fork(child, ncpus + 1) {
 		do {
-			struct drm_i915_gem_mmap_offset mmap_arg = {};
-			const int i = 1 + random() % ncpus;
-			uint32_t old;
-
-			mmap_arg.handle = gem_create(i915, 4096);
-			mmap_arg.flags = I915_MMAP_OFFSET_WB;
-			old = atomic_exchange(&handles[i], mmap_arg.handle);
-			ioctl(i915, DRM_IOCTL_GEM_CLOSE, &old);
-
-			if (ioctl(i915,
-				  DRM_IOCTL_I915_GEM_MMAP_OFFSET,
-				  &mmap_arg) != -1) {
-				void *ptr;
-
-				ptr = mmap64(0, 4096,
-					     PROT_WRITE, MAP_SHARED, i915,
-					     mmap_arg.offset);
-				if (ptr != MAP_FAILED) {
+			for_each_memory_region(r, i915) {
+				const int i = 1 + random() % ncpus;
+				uint64_t size = 4096;
+				uint32_t bo, old;
+
+				igt_assert_eq(__gem_create_in_memory_region_list(i915, &bo, &size, 0, &r->ci, 1), 0);
+				make_resident(i915, 0, bo);
+
+				old = atomic_exchange(&handles[i], bo);
+				ioctl(i915, DRM_IOCTL_GEM_CLOSE, &old);
+
+				for_each_mmap_offset_type(i915, t) {
+					void *ptr;
+
+					ptr = __mmap_offset(i915, bo, 0, size,
+							    PROT_READ | PROT_WRITE,
+							    t->type);
+					if (!ptr)
+						continue;
+
+
 					*(volatile uint32_t *)ptr = 0;
-					munmap(ptr, 4096);
+					munmap(ptr, size);
 				}
 			}
-
 		} while (!READ_ONCE(handles[0]));
 	}
 
-- 
2.34.1
