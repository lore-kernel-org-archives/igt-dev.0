Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FF010E0C9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 19:05:34 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 11:05:13 -0800
Message-Id: <20221115190513.30821-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix memory
 requirement assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The reclaim subtest do not require the alloc_size memory
allocations. Ensure the memory requirement assert is only
applied for other subtests.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_shrink.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index e3e20dfc9..380d2c846 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -456,9 +456,6 @@ igt_main
 			 num_processes, alloc_size);
 
 		alloc_size <<= 20;
-		igt_require_memory(num_processes, alloc_size,
-				   CHECK_SWAP | CHECK_RAM);
-
 		close(fd);
 	}
 
@@ -467,9 +464,12 @@ igt_main
 
 	for(const struct test *t = tests; t->name; t++) {
 		for(const struct mode *m = modes; m->suffix; m++) {
-			igt_subtest_f("%s%s", t->name, m->suffix)
+			igt_subtest_f("%s%s", t->name, m->suffix) {
+				igt_require_memory(num_processes, alloc_size,
+						   CHECK_SWAP | CHECK_RAM);
 				run_test(num_processes, alloc_size,
 					 t->func, m->flags);
+			}
 		}
 	}
 }
-- 
2.21.0.rc0.32.g243a4c7e27
