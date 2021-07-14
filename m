Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD07C6E212
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 11:06:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 14 Jul 2021 13:06:10 +0200
Message-Id: <20210714110610.758606-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_userptr_blits: Remove tests
 depending on old userptr behavior.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Some tests now wait for the batch buffer to finish, resulting in
a test failure when the spin batch is terminated by the watchdog.
Remove the tests, as they are no longer valid.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 120 ---------------------------------
 1 file changed, 120 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 0616a9378909..545148624fe8 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -655,120 +655,6 @@ static void test_nohangcheck_hostile(int i915)
 	close(i915);
 }
 
-static size_t hugepagesize(void)
-{
-#define LINE "Hugepagesize:"
-	size_t sz = 2 << 20;
-	char *line = NULL;
-	size_t len = 0;
-	FILE *file;
-
-	file = fopen("/proc/meminfo", "r");
-	if (!file)
-		return sz;
-
-	while (getline(&line, &len, file) > 0) {
-		if (strncmp(line, LINE, strlen(LINE)))
-			continue;
-
-		if (sscanf(line + strlen(LINE), "%zu", &sz) == 1) {
-			sz <<= 10;
-			igt_debug("Found huge page size: %zu\n", sz);
-		}
-		break;
-	}
-	free(line);
-	fclose(file);
-
-	return sz;
-#undef LINE
-}
-
-static void test_vma_merge(int i915)
-{
-	const size_t sz = 2 * hugepagesize();
-	igt_spin_t *spin;
-	uint32_t handle;
-	void *addr;
-
-	addr = mmap(NULL, sz, PROT_READ | PROT_WRITE,
-		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
-
-	gem_userptr(i915, addr + sz / 2, 4096, 0, userptr_flags, &handle);
-
-	spin = igt_spin_new(i915, .dependency = handle, .flags = IGT_SPIN_FENCE_OUT);
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
-}
-
-static void test_huge_split(int i915)
-{
-	const size_t sz = 2 * hugepagesize();
-	unsigned int flags;
-	igt_spin_t *spin;
-	uint32_t handle;
-	void *addr;
-
-	flags = MFD_HUGETLB;
-#if defined(MFD_HUGE_2MB)
-	flags |= MFD_HUGE_2MB;
-#endif
-
-	do {
-		int memfd;
-
-		memfd = memfd_create("huge", flags);
-		igt_require(memfd != -1);
-		igt_require(ftruncate(memfd, sz) == 0);
-
-		addr = mmap(NULL, sz, PROT_WRITE, MAP_SHARED, memfd, 0);
-		close(memfd);
-		if (addr != MAP_FAILED)
-			break;
-
-		igt_require_f(flags, "memfd not supported\n");
-		flags = 0;
-	} while (1);
-	madvise(addr, sz, MADV_HUGEPAGE);
-
-	gem_userptr(i915, addr + sz / 2 - 4096, 8192, 0, userptr_flags, &handle);
-	spin = igt_spin_new(i915, .dependency = handle, .flags = IGT_SPIN_FENCE_OUT);
-	igt_assert(gem_bo_busy(i915, handle));
-
-	igt_assert(mmap(addr, 4096, PROT_READ,
-			MAP_FIXED | MAP_SHARED | MAP_ANONYMOUS, -1, 0) !=
-		   MAP_FAILED);
-	igt_assert(mmap(addr + sz - 4096, 4096, PROT_READ,
-			MAP_FIXED | MAP_SHARED | MAP_ANONYMOUS, -1, 0) !=
-		   MAP_FAILED);
-
-	igt_spin_end(spin);
-	gem_close(i915, handle);
-
-	munmap(addr, sz);
-
-	gem_sync(i915, spin->handle);
-	igt_assert_eq(sync_fence_status(spin->out_fence), 1);
-	igt_spin_free(i915, spin);
-}
-
 static int test_access_control(int fd)
 {
 	/* CAP_SYS_ADMIN is needed for UNSYNCHRONIZED mappings. */
@@ -2506,12 +2392,6 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 
 		igt_subtest("nohangcheck")
 			test_nohangcheck_hostile(fd);
-
-		igt_subtest("vma-merge")
-			test_vma_merge(fd);
-
-		igt_subtest("huge-split")
-			test_huge_split(fd);
 	}
 
 	igt_subtest("access-control")
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
