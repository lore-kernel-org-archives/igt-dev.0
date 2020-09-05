Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F4A6E02D
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Sep 2020 11:28:48 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat,  5 Sep 2020 17:02:03 +0530
Message-Id: <20200905113203.2021641-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pread: Added test description for
 test case
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
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test description to all the available subtests.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_pread.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index 6d12b8e9..19376aac 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -39,6 +39,8 @@
 #include <sys/time.h>
 #include "drm.h"
 
+IGT_TEST_DESCRIPTION("Basic sanity and perfromance testing of PREAD IOCTL.");
+
 #define MiB(x) ((x) * 1024 * 1024)
 
 typedef void *(*mmap_fn_t)(int, uint32_t, uint64_t, uint64_t, unsigned int);
@@ -154,6 +156,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		src = malloc(object_size);
 	}
 
+	igt_describe("Test the performance of reading from gem object");
 	igt_subtest("bench") {
 		for (count = 1; count <= 1<<17; count <<= 1) {
 			struct timeval start, end;
@@ -169,10 +172,14 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Verify reading from gem object into address space mapped "
+	       "(using different mapping methods) to itself works fine");
 	igt_subtest("self")
 		pread_self(fd);
 
 	for (c = cache; c->level != -1; c++) {
+		igt_describe_f("Test the performance of reading from gem object with "
+		       "%s caching mode", c->name);
 		igt_subtest(c->name) {
 			gem_set_caching(fd, dst, c->level);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
