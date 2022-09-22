Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A05510EABC
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 11:09:38 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 13:09:14 +0200
Message-Id: <20220922110918.16510-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
References: <20220922110918.16510-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] i915/gem_mmap_offset: Verify all
 regions with ptrace
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

Check we can use ptrace to query *ptr of each mmap for each region.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_mmap_offset.c | 84 ++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 8d237f22..608080c7 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -370,64 +370,72 @@ static void test_ptrace(int i915)
 	const unsigned int SZ = 3 * 4096;
 	unsigned long *ptr, *cpy;
 	unsigned long AA, CC;
-	uint32_t bo;
 
 	memset(&AA, 0xaa, sizeof(AA));
 	memset(&CC, 0x55, sizeof(CC));
 
 	cpy = malloc(SZ);
-	bo = gem_create(i915, SZ);
+	igt_assert(cpy);
 
-	for_each_mmap_offset_type(i915, t) {
-		ptr = __mmap_offset(i915, bo, 0, SZ,
-				    PROT_READ | PROT_WRITE,
-				    t->type);
-		if (!ptr)
-			continue;
+	for_each_memory_region(r, i915) {
+		uint64_t size = SZ;
+		uint32_t bo;
 
-		igt_dynamic_f("%s", t->name) {
-			pid_t pid;
+		igt_assert_eq(__gem_create_in_memory_region_list(i915, &bo, &size, 0, &r->ci, 1), 0);
+		make_resident(i915, 0, bo);
 
-			memset(cpy, AA, SZ);
-			memset(ptr, CC, SZ);
+		for_each_mmap_offset_type(i915, t) {
+			ptr = __mmap_offset(i915, bo, 0, size,
+					    PROT_READ | PROT_WRITE,
+					    t->type);
+			if (!ptr)
+				continue;
 
-			igt_assert(!memchr_inv(ptr, CC, SZ));
-			igt_assert(!memchr_inv(cpy, AA, SZ));
+			igt_dynamic_f("%s-%s", r->name, t->name) {
+				pid_t pid;
 
-			igt_fork(child, 1) {
-				ptrace(PTRACE_TRACEME, 0, NULL, NULL);
-				raise(SIGSTOP);
-			}
+				memset(cpy, AA, SZ);
+				memset(ptr, CC, SZ);
 
-			/* Wait for the child to ready themselves [SIGSTOP] */
-			pid = wait(NULL);
+				igt_assert(!memchr_inv(ptr, CC, SZ));
+				igt_assert(!memchr_inv(cpy, AA, SZ));
 
-			ptrace(PTRACE_ATTACH, pid, NULL, NULL);
-			for (int i = 0; i < SZ / sizeof(long); i++) {
-				long ret;
+				igt_fork(child, 1) {
+					ptrace(PTRACE_TRACEME, 0, NULL, NULL);
+					raise(SIGSTOP);
+				}
 
-				ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
-				igt_assert_eq_u64(ret, CC);
-				cpy[i] = ret;
+				/* Wait for the child to ready themselves [SIGSTOP] */
+				pid = wait(NULL);
 
-				ret = ptrace(PTRACE_POKEDATA, pid, ptr + i, AA);
-				igt_assert_eq(ret, 0l);
-			}
-			ptrace(PTRACE_DETACH, pid, NULL, NULL);
+				ptrace(PTRACE_ATTACH, pid, NULL, NULL);
+				for (int i = 0; i < SZ / sizeof(long); i++) {
+					long ret;
+
+					ret = ptrace(PTRACE_PEEKDATA, pid, ptr + i);
+					igt_assert_eq_u64(ret, CC);
+					cpy[i] = ret;
+
+					ret = ptrace(PTRACE_POKEDATA, pid, ptr + i, AA);
+					igt_assert_eq(ret, 0l);
+				}
+				ptrace(PTRACE_DETACH, pid, NULL, NULL);
 
-			/* Wakeup the child for it to exit */
-			kill(SIGCONT, pid);
-			igt_waitchildren();
+				/* Wakeup the child for it to exit */
+				kill(SIGCONT, pid);
+				igt_waitchildren();
 
-			/* The two buffers should now be swapped */
-			igt_assert(!memchr_inv(ptr, AA, SZ));
-			igt_assert(!memchr_inv(cpy, CC, SZ));
+				/* The two buffers should now be swapped */
+				igt_assert(!memchr_inv(ptr, AA, SZ));
+				igt_assert(!memchr_inv(cpy, CC, SZ));
+			}
+
+			munmap(ptr, size);
 		}
 
-		munmap(ptr, SZ);
+		gem_close(i915, bo);
 	}
 
-	gem_close(i915, bo);
 	free(cpy);
 }
 
-- 
2.34.1
