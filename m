Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2311BE3D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 08:11:39 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue, 28 Jun 2022 13:30:53 +0530
Message-Id: <20220628080054.1655626-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220628080054.1655626-1-priyanka.dandamudi@intel.com>
References: <20220628080054.1655626-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_mmap_gtt: added description
 for test case
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added global description and subtest descriptions.

v2:Minor corrections.

v3: Added descriptions to copy subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_mmap_gtt.c | 81 +++++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 6db82229..e39b9047 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -54,6 +54,8 @@
 
 #define abs(x) ((x) >= 0 ? (x) : -(x))
 
+IGT_TEST_DESCRIPTION("Ensure that all operations around MMAP_GTT ioctl works.");
+
 static int OBJECT_SIZE = 16*1024*1024;
 
 static void
@@ -1272,6 +1274,7 @@ igt_main
 		gem_require_mappable_ggtt(fd);
 	}
 
+	igt_describe("Verify mapping to invalid gem objects fails.");
 	igt_subtest("bad-object") {
 		uint32_t real_handle = gem_create(fd, 4096);
 		uint32_t handles[20];
@@ -1293,77 +1296,126 @@ igt_main
 		gem_close(fd, real_handle);
 	}
 
+	igt_describe("Basic checks of GEM_MMAP_GTT ioctl.");
 	igt_subtest("basic")
 		test_access(fd);
+	igt_describe("Test mmaping less than the full object.");
 	igt_subtest("basic-short")
 		test_short(fd);
+	igt_describe("Test copy between two GTT mmappings.");
 	igt_subtest("basic-copy")
 		test_copy(fd);
+	igt_describe("Test to read content from GTT mmapped object.");
 	igt_subtest("basic-read")
 		test_read(fd);
+	igt_describe("Test to write content to GTT mmapped object.");
 	igt_subtest("basic-write")
 		test_write(fd);
+	igt_describe("Test creates a prefault object into GTT and "
+		     "writes into it from another GTT mmapped.");
 	igt_subtest("basic-write-gtt")
 		test_write_gtt(fd);
+	igt_describe("Inspect a GTT mmap using ptrace().");
 	igt_subtest("ptrace")
 		test_ptrace(fd);
+	igt_describe("Check whether a write through the GTT is immediately visible to the CPU.");
 	igt_subtest("coherency")
 		test_coherency(fd);
+	igt_describe("Check the userspace clflushing of the GTT mmap.");
 	igt_subtest("clflush")
 		test_clflush(fd);
+	igt_describe("Check read/writes across a GPU reset.");
 	igt_subtest("hang")
 		test_hang(fd);
+	igt_describe("Exercise the GTT mmap revocation for a reset on a busy object.");
 	igt_subtest("hang-busy")
 		test_hang_busy(fd);
+	igt_describe("Mix a busy hang with GTT and userptr.");
 	igt_subtest("hang-user")
 		test_hang_user(fd);
+	igt_describe("Check basic read->write order of a GTT mmapped bo.");
 	igt_subtest("basic-read-write")
 		test_read_write(fd, READ_BEFORE_WRITE);
+	igt_describe("Check basic write->read order of a GTT mmapped bo.");
 	igt_subtest("basic-write-read")
 		test_read_write(fd, READ_AFTER_WRITE);
+	igt_describe("Check distinct read->write order of a GTT mmapped bo.");
 	igt_subtest("basic-read-write-distinct")
 		test_read_write2(fd, READ_BEFORE_WRITE);
+	igt_describe("Check distinct write->read order of a GTT mmapped bo.");
 	igt_subtest("basic-write-read-distinct")
 		test_read_write2(fd, READ_AFTER_WRITE);
+	igt_describe("Excercise concurrent pagefaulting of a GTT mmaped bo.");
 	igt_subtest("fault-concurrent")
 		test_fault_concurrent(fd, I915_TILING_NONE);
+	igt_describe("Excercise concurrent pagefaulting of a X-tiled GTT mmaped bo.");
 	igt_subtest("fault-concurrent-X")
 		test_fault_concurrent(fd, I915_TILING_X);
+	igt_describe("Excercise concurrent pagefaulting of a Y-tiled GTT mmaped bo.");
 	igt_subtest("fault-concurrent-Y")
 		test_fault_concurrent(fd, I915_TILING_Y);
+	igt_describe("Check coherency between GTT and CPU mmappings with LLC.");
 	igt_subtest("basic-write-cpu-read-gtt")
 		test_write_cpu_read_gtt(fd);
+	igt_describe("Check the performance of WC writes with WC reads of GTT "
+		     "and WC writes of GTT with WB writes of CPU.");
 	igt_subtest("basic-wc")
 		test_wc(fd);
+	igt_describe("Test mmap_offset lifetime, closing the object on"
+		     " another file should not affect the local mmap_offset.");
 	igt_subtest("isolation")
 		test_isolation(fd);
+	igt_describe("Test MMAP_GTT extension validity.");
 	igt_subtest("zero-extend")
 		test_zero_extend(fd);
+	igt_describe("Test to check that a few threads opening and closing handles"
+		     " cause explosion in other threads in the process of mmaping that handle.");
 	igt_subtest("close-race")
 		test_close_race(fd);
+	igt_describe("Test to check that a few threads opening and closing flink handles"
+		     " cause explosion in other threads in the process of mmaping that handle.");
 	igt_subtest("flink-race")
 		test_flink_race(fd);
+	igt_describe("Check that the initial pagefault is non-blocking.");
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 
+	igt_describe("Check mmap access to a small buffer object by CPU directly"
+		     " and through GTT in sequence.");
 	igt_subtest("basic-small-bo")
 		test_huge_bo(fd, -1, I915_TILING_NONE);
+	igt_describe("Check mmap access to a small X-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("basic-small-bo-tiledX")
 		test_huge_bo(fd, -1, I915_TILING_X);
+	igt_describe("Check mmap access to a small Y-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("basic-small-bo-tiledY")
 		test_huge_bo(fd, -1, I915_TILING_Y);
 
+	igt_describe("Check mmap access to a big buffer object by CPU directly "
+		     "and through GTT in sequence.");
 	igt_subtest("big-bo")
 		test_huge_bo(fd, 0, I915_TILING_NONE);
+	igt_describe("Check mmap access to a big X-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("big-bo-tiledX")
 		test_huge_bo(fd, 0, I915_TILING_X);
+	igt_describe("Check mmap access to a big Y-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("big-bo-tiledY")
 		test_huge_bo(fd, 0, I915_TILING_Y);
 
+	igt_describe("Check mmap access to a huge buffer object by CPU directly "
+		     "and through GTT in sequence.");
 	igt_subtest("huge-bo")
 		test_huge_bo(fd, 1, I915_TILING_NONE);
+	igt_describe("Check mmap access to a huge X-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("huge-bo-tiledX")
 		test_huge_bo(fd, 1, I915_TILING_X);
+	igt_describe("Check mmap access to a huge Y-tiled buffer object by CPU "
+		     "directly and through GTT in sequence.");
 	igt_subtest("huge-bo-tiledY")
 		test_huge_bo(fd, 1, I915_TILING_Y);
 
@@ -1371,27 +1423,33 @@ igt_main
 		const struct copy_size {
 			const char *prefix;
 			int size;
+			const char *description;
 		} copy_sizes[] = {
-			{ "basic-small", -2 },
-			{ "medium", -1 },
-			{ "big", 0 },
-			{ "huge", 1 },
-			{ "swap", 2 },
+			{ "basic-small", -2, "small bo's." },
+			{ "medium", -1, "medium bo's." },
+			{ "big", 0, "big bo's." },
+			{ "huge", 1, "huge bo's." },
+			{ "swap", 2, "huge bo's larger than physical memory"
+				     " and resulting in thrashing of swap space." },
 			{ }
 		};
 		const struct copy_mode {
 			const char *suffix;
 			int tiling_x, tiling_y;
+			const char *description;
 		} copy_modes[] = {
-			{ "", I915_TILING_NONE, I915_TILING_NONE},
-			{ "-XY", I915_TILING_X, I915_TILING_Y},
-			{ "-odd", -I915_TILING_X, -I915_TILING_Y},
+			{ "", I915_TILING_NONE, I915_TILING_NONE, "normal"},
+			{ "-XY", I915_TILING_X, I915_TILING_Y, "tiled"},
+			{ "-odd", -I915_TILING_X, -I915_TILING_Y, "odd tiled"},
 			{}
 		};
 		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 
 		for (const struct copy_size *s = copy_sizes; s->prefix; s++)
 			for (const struct copy_mode *m = copy_modes; m->suffix; m++) {
+				igt_describe_f("Check page by page copying between two GTT"
+					       " mmapped %s-%s", m->description,
+					       s->description);
 				igt_subtest_f("%s-copy%s", s->prefix, m->suffix)
 					test_huge_copy(fd,
 						       s->size,
@@ -1399,6 +1457,10 @@ igt_main
 						       m->tiling_y,
 						       1);
 
+				igt_describe_f("Add forked contention with lighter variant"
+					       " (single cpu) and check page by page copying"
+					       " between two GTT mmapped %s-%s",
+					       m->description, s->description);
 				igt_subtest_f("cpuset-%s-copy%s", s->prefix, m->suffix) {
 					cpu_set_t cpu, old;
 
@@ -1416,6 +1478,9 @@ igt_main
 					igt_assert(sched_setaffinity(0, sizeof(old), &old) == 0);
 				}
 
+				igt_describe_f("Add forked contention and check page by page"
+					       " copying between two GTT mmapped %s-%s",
+					       m->description, s->description);
 				igt_subtest_f("forked-%s-copy%s", s->prefix, m->suffix)
 					test_huge_copy(fd,
 						       s->size,
-- 
2.25.1
