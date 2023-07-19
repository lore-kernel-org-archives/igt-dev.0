Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86C10E4EA
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 15:36:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jul 2023 17:36:19 +0200
Message-Id: <20230719153619.841459-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_*: Migrate allocator start/stop
 to fixtures
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

Although starting and stopping allocator in tests is nothing wrong
it may produce annoying warning on next start if test just fails
and doesn't call allocator stop. On multiprocess mode allocator
creates dedicated thread which should be properly stopped on the
test completion. Unfortunately premature test exit (failure)
leaves it waiting. Next allocator start solves this situation
(drops message queue what unblocks thread allowing it to exit)
but it logs warning informing about this situation.

To avoid producing warning move allocator start/stop to fixtures
in tests. I intentionally didn't touch api_intel_allocator (there
I want to check this functionality) and in single benchmark
(it is not executed on CI so there warning might be handy).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
---
v2: - migrate allocator-evict as it also should use externally
      created allocator thread (Karolina)
    - ensure thread is created in gem_lmem_swapping when module
      wasn't previously loaded (Karolina)
    - s/alloctor/allocator/
---
 tests/i915/gem_linear_blits.c      | 42 +++++++++++++++++-------------
 tests/i915/gem_lmem_swapping.c     |  4 +--
 tests/i915/gem_ringfill.c          | 13 ++++-----
 tests/i915/gem_softpin.c           | 40 ++++++++++++++--------------
 tests/i915/gem_tiled_blits.c       | 40 ++++++++++++++++------------
 tests/i915/gem_tiled_fence_blits.c | 22 +++++++++++-----
 6 files changed, 89 insertions(+), 72 deletions(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index 32b9052507..cc28e43fef 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -312,24 +312,30 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2, do_relocs);
 
-	igt_describe("The intent is to push beyond the working GTT size to force"
-			" the driver to rebind the buffers");
-	igt_subtest("normal") {
-		intel_allocator_multiprocess_start();
-		igt_fork(child, ncpus)
-			run_test(fd, count, do_relocs);
-		igt_waitchildren();
-		intel_allocator_multiprocess_stop();
-	}
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
 
-	igt_describe("Test with interrupts in between the parent process");
-	igt_subtest("interruptible") {
-		intel_allocator_multiprocess_start();
-		igt_fork_signal_helper();
-		igt_fork(child, ncpus)
-			run_test(fd, count, do_relocs);
-		igt_waitchildren();
-		igt_stop_signal_helper();
-		intel_allocator_multiprocess_stop();
+		igt_describe("The intent is to push beyond the working GTT size to force"
+				" the driver to rebind the buffers");
+		igt_subtest("normal") {
+			igt_fork(child, ncpus)
+				run_test(fd, count, do_relocs);
+			igt_waitchildren();
+		}
+
+		igt_describe("Test with interrupts in between the parent process");
+		igt_subtest("interruptible") {
+			igt_fork_signal_helper();
+			igt_fork(child, ncpus)
+				run_test(fd, count, do_relocs);
+			igt_waitchildren();
+			igt_stop_signal_helper();
+		}
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
 	}
 }
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 2921de8f9f..ede545c925 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -708,7 +708,6 @@ static void test_evict(int i915,
 	if (flags & TEST_PARALLEL) {
 		int fd = drm_reopen_driver(i915);
 
-		intel_allocator_multiprocess_start();
 		ctx = intel_ctx_create_all_physical(fd);
 		__gem_context_set_persistence(fd, ctx->id, false);
 
@@ -719,7 +718,6 @@ static void test_evict(int i915,
 		igt_waitchildren();
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
-		intel_allocator_multiprocess_stop();
 	} else {
 		__do_evict(i915, ctx, &region->region, &params, params.seed);
 	}
@@ -932,6 +930,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(__num_engines__);
 		ctx = intel_ctx_create_all_physical(i915);
 		__gem_context_set_persistence(i915, ctx->id, false);
+		intel_allocator_multiprocess_start();
 
 	}
 
@@ -946,6 +945,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		test_smem_oom(i915, ctx, region);
 
 	igt_fixture {
+		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(i915, ctx);
 		free(regions);
 		drm_close_driver(i915);
diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index c718d6fe73..66fbd27fa5 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -456,6 +456,8 @@ igt_main
 		igt_require(ring_size);
 
 		ctx = intel_ctx_create_all_physical(fd);
+
+		intel_allocator_multiprocess_start();
 	}
 
 	/* Legacy path for selecting "rings". */
@@ -467,13 +469,11 @@ igt_main
 			for_each_ring(e, fd) {
 				igt_dynamic_f("%s", e->name) {
 					igt_require(gem_can_store_dword(fd, eb_ring(e)));
-					intel_allocator_multiprocess_start();
 					run_test(fd, intel_ctx_0(fd),
 						 eb_ring(e),
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
-					intel_allocator_multiprocess_stop();
 				}
 			}
 		}
@@ -491,13 +491,11 @@ igt_main
 					continue;
 
 				igt_dynamic_f("%s", e->name) {
-					intel_allocator_multiprocess_start();
 					run_test(fd, ctx,
 						 e->flags,
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
-					intel_allocator_multiprocess_stop();
 				}
 			}
 		}
@@ -506,7 +504,6 @@ igt_main
 	igt_describe("Basic check to fill the ring upto maximum on all engines simultaneously.");
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
-		intel_allocator_multiprocess_start();
 
 		for_each_ctx_engine(fd, ctx, e) {
 			if (!gem_class_can_store_dword(fd, e->class))
@@ -517,10 +514,10 @@ igt_main
 		}
 
 		igt_waitchildren();
+	}
+
+	igt_fixture {
 		intel_allocator_multiprocess_stop();
-	}
-
-	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
 	}
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index e6cbf624e1..f5f0ba2576 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -75,7 +75,7 @@
  *
  * SUBTEST: allocator-fork
  * Category: Infrastructure
- * Description: Check if multiple processes can use alloctor.
+ * Description: Check if multiple processes can use allocator.
  * Feature: mapping
  * Functionality: command submission
  * Run type: FULL
@@ -1060,13 +1060,6 @@ static void test_allocator_fork(int fd)
 	struct drm_i915_gem_exec_object2 objects[num_reserved];
 	uint64_t ahnd, ressize = 4096;
 
-	/*
-	 * Must be called before opening allocator in multiprocess environment
-	 * due to freeing previous allocator infrastructure and proper setup
-	 * of data structures and allocation thread.
-	 */
-	intel_allocator_multiprocess_start();
-
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	__reserve(ahnd, fd, true, objects, num_reserved, ressize);
 
@@ -1084,8 +1077,6 @@ static void test_allocator_fork(int fd)
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	igt_assert(intel_allocator_close(ahnd) == true);
-
-	intel_allocator_multiprocess_stop();
 }
 
 #define BATCH_SIZE (4096<<10)
@@ -1197,7 +1188,6 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 	igt_debug("Using %'d batches to fill %'llu aperture on %d engines\n",
 		  count, (long long)size, nengine);
 
-	intel_allocator_multiprocess_start();
 	ahnd = intel_allocator_open_full(fd, 0, 0, size / 16,
 					 INTEL_ALLOCATOR_RELOC,
 					 ALLOC_STRATEGY_NONE, 0);
@@ -1266,7 +1256,6 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 	igt_waitchildren();
 
 	intel_allocator_close(ahnd);
-	intel_allocator_multiprocess_stop();
 
 	for (unsigned i = 0; i < count; i++) {
 		munmap(batches[i].ptr, BATCH_SIZE);
@@ -1666,14 +1655,6 @@ igt_main
 			test_allocator_nopin(fd, true);
 		}
 
-		igt_describe("Check if multiple processes can use alloctor.");
-		igt_subtest("allocator-fork")
-			test_allocator_fork(fd);
-
-		igt_describe("Exercise eviction with softpinning.");
-		test_each_engine("allocator-evict", fd, ctx, e)
-			test_allocator_evict(fd, ctx, e->flags, 20);
-
 		igt_describe("Use same offset for all engines and for different handles.");
 		igt_subtest("evict-single-offset")
 			evict_single_offset(fd, ctx, 20);
@@ -1699,6 +1680,25 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(gem_uses_full_ppgtt(fd));
+			intel_allocator_multiprocess_start();
+		}
+
+		igt_describe("Check if multiple processes can use allocator.");
+		igt_subtest("allocator-fork")
+			test_allocator_fork(fd);
+
+		igt_describe("Exercise eviction with softpinning.");
+		test_each_engine("allocator-evict", fd, ctx, e)
+			test_allocator_evict(fd, ctx, e->flags, 20);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+	}
+
 	igt_describe("Check start offset and alignment detection.");
 	igt_subtest("safe-alignment")
 		safe_alignment(fd);
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index 22ac3280d9..072fef3c32 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -211,24 +211,30 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2);
 
-	igt_describe("Check with parallel execution.");
-	igt_subtest("normal") {
-		intel_allocator_multiprocess_start();
-		igt_fork(child, ncpus)
-			run_test(fd, count);
-		igt_waitchildren();
-		intel_allocator_multiprocess_stop();
-	}
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
 
-	igt_describe("Check with interrupts in parallel execution.");
-	igt_subtest("interruptible") {
-		intel_allocator_multiprocess_start();
-		igt_fork_signal_helper();
-		igt_fork(child, ncpus)
-			run_test(fd, count);
-		igt_waitchildren();
-		igt_stop_signal_helper();
-		intel_allocator_multiprocess_stop();
+		igt_describe("Check with parallel execution.");
+		igt_subtest("normal") {
+			igt_fork(child, ncpus)
+				run_test(fd, count);
+			igt_waitchildren();
+		}
+
+		igt_describe("Check with interrupts in parallel execution.");
+		igt_subtest("interruptible") {
+			igt_fork_signal_helper();
+			igt_fork(child, ncpus)
+				run_test(fd, count);
+			igt_waitchildren();
+			igt_stop_signal_helper();
+		}
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
 	}
 
 	igt_fixture {
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 5444dcfb85..c536c3699e 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -325,13 +325,21 @@ igt_main
 	igt_subtest("basic")
 		run_test(fd, 2, end);
 
-	igt_describe("Check with parallel execution.");
-	igt_subtest("normal") {
-		intel_allocator_multiprocess_start();
-		igt_fork(child, ncpus)
-			run_test(fd, count, end);
-		igt_waitchildren();
-		intel_allocator_multiprocess_stop();
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
+
+		igt_describe("Check with parallel execution.");
+		igt_subtest("normal") {
+			igt_fork(child, ncpus)
+					run_test(fd, count, end);
+			igt_waitchildren();
+		}
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
 	}
 
 	igt_fixture
-- 
2.34.1
