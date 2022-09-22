Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D617910EABC
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 11:09:40 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 13:09:15 +0200
Message-Id: <20220922110918.16510-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
References: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] i915/gem_mmap_offset: Verify all
 regions remain in isolation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Check that we don't leak mmap pointers to different regions.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_mmap_offset.c | 99 +++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 608080c7..c9a3eb5b 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -219,68 +219,71 @@ static void basic_uaf(int i915)
 
 static void isolation(int i915)
 {
-	for_each_mmap_offset_type(i915, t) {
-		struct drm_i915_gem_mmap_offset mmap_arg = {
-			.flags = t->type
-		};
-		int A = gem_reopen_driver(i915);
-		int B = gem_reopen_driver(i915);
-		uint64_t offset_a, offset_b;
-		uint32_t a, b;
-		void *ptr;
-
-		a = gem_create(A, 4096);
-		b = gem_open(B, gem_flink(A, a));
-
-		mmap_arg.handle = a;
-		if (mmap_offset_ioctl(A, &mmap_arg)) {
-			close(A);
-			close(B);
-			continue;
-		}
-		offset_a = mmap_arg.offset;
-
-		mmap_arg.handle = b;
-		igt_assert_eq(mmap_offset_ioctl(B, &mmap_arg), 0);
-		offset_b = mmap_arg.offset;
-
-		igt_info("A[%s]: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
-			 t->name, A, a, offset_a);
-		igt_info("B[%s]: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
-			 t->name, B, b, offset_b);
+	for_each_memory_region(r, i915) {
+		igt_info("%s\n", r->name);
+		for_each_mmap_offset_type(i915, t) {
+			struct drm_i915_gem_mmap_offset mmap_arg = {
+				.flags = t->type
+			};
+			int A = gem_reopen_driver(i915);
+			int B = gem_reopen_driver(i915);
+			uint64_t offset_a, offset_b;
+			uint32_t a, b;
+			void *ptr;
+
+			a = gem_create_in_memory_region_list(A, 4096, 0, &r->ci, 1);
+			b = gem_open(B, gem_flink(A, a));
+
+			mmap_arg.handle = a;
+			if (mmap_offset_ioctl(A, &mmap_arg)) {
+				close(A);
+				close(B);
+				continue;
+			}
+			offset_a = mmap_arg.offset;
 
-		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
-		igt_assert(ptr == MAP_FAILED);
-		igt_assert_eq(errno, EACCES);
+			mmap_arg.handle = b;
+			igt_assert_eq(mmap_offset_ioctl(B, &mmap_arg), 0);
+			offset_b = mmap_arg.offset;
 
-		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
-		igt_assert(ptr == MAP_FAILED);
-		igt_assert_eq(errno, EACCES);
+			igt_info("\tA[%s]: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
+				 t->name, A, a, offset_a);
+			igt_info("\tB[%s]: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
+				 t->name, B, b, offset_b);
 
-		if (offset_a != offset_b) {
 			errno = 0;
-			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, B, offset_a);
+			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
 			igt_assert(ptr == MAP_FAILED);
 			igt_assert_eq(errno, EACCES);
 
 			errno = 0;
-			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_b);
+			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
 			igt_assert(ptr == MAP_FAILED);
 			igt_assert_eq(errno, EACCES);
-		}
 
-		close(B);
+			if (offset_a != offset_b) {
+				errno = 0;
+				ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, B, offset_a);
+				igt_assert(ptr == MAP_FAILED);
+				igt_assert_eq(errno, EACCES);
 
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
-		igt_assert(ptr != MAP_FAILED);
-		munmap(ptr, 4096);
+				errno = 0;
+				ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_b);
+				igt_assert(ptr == MAP_FAILED);
+				igt_assert_eq(errno, EACCES);
+			}
 
-		close(A);
+			close(B);
+
+			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+			igt_assert(ptr != MAP_FAILED);
+			munmap(ptr, 4096);
+
+			close(A);
 
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
-		igt_assert(ptr == MAP_FAILED);
+			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+			igt_assert(ptr == MAP_FAILED);
+		}
 	}
 }
 
-- 
2.34.1
