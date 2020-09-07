Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7A6E342
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2020 08:10:59 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  7 Sep 2020 13:44:13 +0530
Message-Id: <20200907081413.2037276-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pwrite: Added test description for
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test description to all the available subtests.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/gem_pwrite.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index e491263f..83befe12 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -42,6 +42,8 @@
 #include "igt.h"
 #include "igt_rand.h"
 
+IGT_TEST_DESCRIPTION("Sanity and performance testing of PWRITE IOCTL.");
+
 #define MiB(x) ((x) * 1024 * 1024)
 
 typedef void *(*mmap_fn_t)(int, uint32_t, uint64_t, uint64_t, unsigned int);
@@ -322,6 +324,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		src = malloc(object_size);
 	}
 
+	igt_describe("Test the performance of writing into gem object");
 	igt_subtest("bench") {
 		for (count = 1; count <= 1<<17; count <<= 1) {
 			struct timeval start, end;
@@ -337,10 +340,14 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_describe("Verify writing into gem object from address space mapped "
+	       "(using different mapping methods) to itself works fine");
 	igt_subtest("self")
 		pwrite_self(fd);
 
 	for (c = cache; c->level != -1; c++) {
+		igt_describe_f("Test the performance of writing into gem object with "
+		       "%s caching mode", c->name);
 		igt_subtest(c->name) {
 			gem_set_caching(fd, dst, c->level);
 
@@ -364,6 +371,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		gem_close(fd, dst);
 	}
 
+	igt_describe("Validation of random data written at random offset of the gem object");
 	igt_subtest_f("basic-random")
 		test_random(fd);
 
@@ -379,18 +387,36 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 			{ NULL },
 		}, *m;
 		for (m = modes; m->name; m++) {
+			igt_describe_f("Validation of writes into small buffer object with "
+			       "CPU domain set for read-write. Writes are done going %s",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("small-cpu-%s", m->name)
 				test_big_cpu(fd, 0, m->flags);
+			igt_describe_f("Validation of writes into small buffer object with "
+			       "GTT domain set for read-write. Writes are done going %s.",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("small-gtt-%s", m->name)
 				test_big_gtt(fd, 0, m->flags);
 
+			igt_describe_f("Validation of writes into big buffer object with "
+			       "CPU domain set for read-write. Writes are done going %s.",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("big-cpu-%s", m->name)
 				test_big_cpu(fd, 1, m->flags);
+			igt_describe_f("Validation of writes into big buffer object with "
+			       "GTT domain set for read-write. Writes are done going %s.",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("big-gtt-%s", m->name)
 				test_big_gtt(fd, 1, m->flags);
 
+			igt_describe_f("Validation of writes into huge buffer object with "
+			       "CPU domain set for read-write. Writes are done going %s.",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("huge-cpu-%s", m->name)
 				test_big_cpu(fd, 2, m->flags);
+			igt_describe_f("Validation of writes into huge buffer object with "
+			       "GTT domin set for read-write. Writes are done going %s.",
+			        strcmp(m->name, "fbr") ? m->name : "forward-backword-random");
 			igt_subtest_f("huge-gtt-%s", m->name)
 				test_big_gtt(fd, 2, m->flags);
 		}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
