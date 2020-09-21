Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14689D67
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2020 17:16:52 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 21 Sep 2020 22:49:50 +0530
Message-Id: <20200921171950.2203145-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_gtt: Added test description
 for test case
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

Added test and 35 subtests description

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/gem_mmap_gtt.c | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 6637bba0..11374563 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -46,6 +46,8 @@
 #include "igt_sysfs.h"
 #include "igt_x86.h"
 
+IGT_TEST_DESCRIPTION("Tests the MMAP_GTT IOCTL for memory regions");
+
 #ifndef PAGE_SIZE
 #define PAGE_SIZE 4096
 #endif
@@ -1141,6 +1143,7 @@ igt_main
 		gem_require_mappable_ggtt(fd);
 	}
 
+	igt_describe("Verify mapping to an invalid buffer object won't be created");
 	igt_subtest("bad-object") {
 		uint32_t real_handle = gem_create(fd, 4096);
 		uint32_t handles[20];
@@ -1162,69 +1165,140 @@ igt_main
 		gem_close(fd, real_handle);
 	}
 
+	igt_describe("Tests the access of a buffer object using different methods for different fds");
 	igt_subtest("basic")
 		test_access(fd);
+
+	igt_describe("Tests the mapping of a buffer object with different access modes");
 	igt_subtest("basic-short")
 		test_short(fd);
+
+	igt_describe("Verify copying between two memory mapped buffer objects works fine");
 	igt_subtest("basic-copy")
 		test_copy(fd);
+
+	igt_describe("Verify reading from buffer obejct into gtt mapped memory region works fine");
 	igt_subtest("basic-read")
 		test_read(fd);
+
+	igt_describe("Verify writing into buffer obejct from gtt mapped memory region works fine");
 	igt_subtest("basic-write")
 		test_write(fd);
+
+	igt_describe("Verify writing into prefaulted buffer object works fine");
 	igt_subtest("basic-write-gtt")
 		test_write_gtt(fd);
+
+	igt_describe("Verify read/write at the gtt mapped address space in the tracee's memory");
 	igt_subtest("ptrace")
 		test_ptrace(fd);
+
+	igt_describe("Tests that mmap-cpu and mmap-gtt mappings to a buffer object are "
+	       "coherent after cache flush");
 	igt_subtest("coherency")
 		test_coherency(fd);
+
+	igt_describe("Verify clflush on the gtt mapped buffer object");
 	igt_subtest("clflush")
 		test_clflush(fd);
+
+	igt_describe("Verify the data integrity of gtt mapped buffer objects while "
+	       "multiple resets are being injected in a mutli-threaded environment");
 	igt_subtest("hang")
 		test_hang(fd);
+
+	igt_describe("Tests read and subsequent write on buffer object");
 	igt_subtest("basic-read-write")
 		test_read_write(fd, READ_BEFORE_WRITE);
+
+	igt_describe("Tests write and subsequent read on buffer object");
 	igt_subtest("basic-write-read")
 		test_read_write(fd, READ_AFTER_WRITE);
+
+	igt_describe("Tests read before write using distinct gtt mappings to same buffer object");
 	igt_subtest("basic-read-write-distinct")
 		test_read_write2(fd, READ_BEFORE_WRITE);
+
+	igt_describe("Tests write before read using distinct gtt mappings to same buffer object");
 	igt_subtest("basic-write-read-distinct")
 		test_read_write2(fd, READ_AFTER_WRITE);
+
+	igt_describe("Verify concurrent access of a buffer object by multiple threads work fine");
 	igt_subtest("fault-concurrent")
 		test_fault_concurrent(fd);
+
+	igt_describe("Checks the coherency of data written into buffer object using mmap-cpu and "
+	       "read from it using mmap-gtt");
 	igt_subtest("basic-write-cpu-read-gtt")
 		test_write_cpu_read_gtt(fd);
+
+	igt_describe("Test the performance of Write-Combined writes with respect to reads "
+	       "and Write-Back writes");
 	igt_subtest("basic-wc")
 		test_wc(fd);
+
+	igt_describe("Verify mapping to a buffer object which is associated with different fds "
+	       "works in isolation");
 	igt_subtest("isolation")
 		test_isolation(fd);
+
 	igt_subtest("zero-extend")
 		test_zero_extend(fd);
+
+	igt_describe("Check race between gem close and mmap-gtt among threads");
 	igt_subtest("close-race")
 		test_close_race(fd);
+
+	igt_describe("Check race between flink and mmap-gtt among threads");
 	igt_subtest("flink-race")
 		test_flink_race(fd);
+
+	igt_describe("Verify initial page faulting completes within a specified time");
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 
+	igt_describe("Verify the data integrity of small buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with no tiling mode");
 	igt_subtest("basic-small-bo")
 		test_huge_bo(fd, -1, I915_TILING_NONE);
+
+	igt_describe("Verify the data integrity of small buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with X-tiling mode");
 	igt_subtest("basic-small-bo-tiledX")
 		test_huge_bo(fd, -1, I915_TILING_X);
+
+	igt_describe("Verify the data integrity of small buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with Y-tiling mode");
 	igt_subtest("basic-small-bo-tiledY")
 		test_huge_bo(fd, -1, I915_TILING_Y);
 
+	igt_describe("Verify the data integrity of big buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with no tiling mode");
 	igt_subtest("big-bo")
 		test_huge_bo(fd, 0, I915_TILING_NONE);
+
+	igt_describe("Verify the data integrity of big buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with X-tiling mode");
 	igt_subtest("big-bo-tiledX")
 		test_huge_bo(fd, 0, I915_TILING_X);
+
+	igt_describe("Verify the data integrity of big buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with Y-tiling mode");
 	igt_subtest("big-bo-tiledY")
 		test_huge_bo(fd, 0, I915_TILING_Y);
 
+	igt_describe("Verify the data integrity of huge buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with no tiling mode");
 	igt_subtest("huge-bo")
 		test_huge_bo(fd, 1, I915_TILING_NONE);
+
+	igt_describe("Verify the data integrity of huge buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with X-tiling mode");
 	igt_subtest("huge-bo-tiledX")
 		test_huge_bo(fd, 1, I915_TILING_X);
+
+	igt_describe("Verify the data integrity of huge buffer object accessed using "
+	       "mmap-cpu and mmap-gtt with Y-tiling mode");
 	igt_subtest("huge-bo-tiledY")
 		test_huge_bo(fd, 1, I915_TILING_Y);
 
@@ -1253,6 +1327,9 @@ igt_main
 
 		for (const struct copy_size *s = copy_sizes; s->prefix; s++)
 			for (const struct copy_mode *m = copy_modes; m->suffix; m++) {
+				igt_describe_f("Validate the copying between two %s buffer objects with "
+				       "%s tiling modes respectively", s->prefix,
+				        strcmp(m->suffix, "") == 0 ? "None" : (m->suffix+1));
 				igt_subtest_f("%s-copy%s", s->prefix, m->suffix)
 					test_huge_copy(fd,
 						       s->size,
@@ -1260,6 +1337,10 @@ igt_main
 						       m->tiling_y,
 						       1);
 
+				igt_describe_f("Validate the copying between two %s buffer objects with "
+				       "%s tiling modes respectively, performed parallelly on multiple "
+				       "threads, all affined to a single CPU core", s->prefix,
+				        strcmp(m->suffix, "") == 0 ? "None" : (m->suffix+1));
 				igt_subtest_f("cpuset-%s-copy%s", s->prefix, m->suffix) {
 					cpu_set_t cpu, old;
 
@@ -1277,6 +1358,9 @@ igt_main
 					igt_assert(sched_setaffinity(0, sizeof(old), &old) == 0);
 				}
 
+				igt_describe_f("Validate the copying between two %s buffer objects with "
+				       "%s tiling modes respectively, performed parallelly on %d threads",
+				        s->prefix, strcmp(m->suffix, "") == 0 ? "None" : (m->suffix+1), ncpus);
 				igt_subtest_f("forked-%s-copy%s", s->prefix, m->suffix)
 					test_huge_copy(fd,
 						       s->size,
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
