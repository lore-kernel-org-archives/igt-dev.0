Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F006A89F38
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 09:17:23 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 24 Aug 2021 14:39:43 +0530
Message-Id: <20210824090943.1158940-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/gem_userptr_blits: Remove vma-merge subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@intel.com, tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

mmap requests for huge page size in vma-merge subtest are
cancelled from kernel using i915_request_cancel(rq, -EINTR),
otherwise it results in system hang. It is known/expected
failure thus it is decided to remove the subtest.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_userptr_blits.c | 40 ----------------------------------
 1 file changed, 40 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 756bd6e4..11bce6d7 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -702,43 +702,6 @@ static size_t hugepagesize(void)
 #undef LINE
 }
 
-static void test_vma_merge(int i915)
-{
-	const size_t sz = 2 * hugepagesize();
-	igt_spin_t *spin;
-	uint32_t handle;
-	void *addr;
-	uint64_t ahnd = get_reloc_ahnd(i915, 0);
-
-	addr = mmap(NULL, sz, PROT_READ | PROT_WRITE,
-		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
-
-	gem_userptr(i915, addr + sz / 2, 4096, 0, userptr_flags, &handle);
-
-	spin = igt_spin_new(i915, .ahnd = ahnd, .dependency = handle,
-			    .flags = IGT_SPIN_FENCE_OUT);
-	igt_assert(gem_bo_busy(i915, handle));
-
-	for (size_t x = 0; x < sz; x += 4096) {
-		if (x == sz / 2)
-			continue;
-
-		igt_assert(mmap(addr + x, 4096, PROT_READ | PROT_WRITE,
-				MAP_FIXED | MAP_SHARED | MAP_ANON, -1, 0) !=
-			   MAP_FAILED);
-	}
-
-	igt_spin_end(spin);
-	gem_close(i915, handle);
-
-	munmap(addr, sz);
-
-	gem_sync(i915, spin->handle);
-	igt_assert_eq(sync_fence_status(spin->out_fence), 1);
-	igt_spin_free(i915, spin);
-	put_ahnd(ahnd);
-}
-
 static void test_huge_split(int i915)
 {
 	const size_t sz = 2 * hugepagesize();
@@ -2614,9 +2577,6 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("nohangcheck")
 			test_nohangcheck_hostile(fd);
 
-		igt_subtest("vma-merge")
-			test_vma_merge(fd);
-
 		igt_subtest("huge-split")
 			test_huge_split(fd);
 	}
-- 
2.31.1
