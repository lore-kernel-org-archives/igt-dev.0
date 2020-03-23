Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8B089DDD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:47:11 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon, 23 Mar 2020 12:16:07 +0530
Message-Id: <20200323064607.7041-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_ctx_create: Reverted
 device reopen logic
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Removed gem_reopen_driver and gem_context_copy_engines
logic from code as it is not recommended.
No reopen after fork is needed .

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_create.c | 45 +++++--------------------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 2d477226..4f160ea9 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -100,12 +100,10 @@ static void files(int core, int timeout, const int ncpus)
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
-		int fd;
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
-			fd = gem_reopen_driver(core);
-			gem_context_copy_engines(core, 0, fd, 0);
+			int fd = drm_open_driver(DRIVER_INTEL);
 
 			obj.handle = gem_open(fd, name);
 			execbuf.flags &= ~ENGINE_FLAGS;
@@ -160,15 +158,6 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 	if (ncpus < 0) {
 		igt_fork(child, ppgtt_nengine) {
 			unsigned long count = 0;
-			int i915;
-
-			i915 = gem_reopen_driver(fd);
-			/*
-			 * Ensure the gpu is idle by launching
-			 * a nop execbuf and stalling for it
-			 */
-			gem_quiescent_gpu(i915);
-			gem_context_copy_engines(fd, 0, i915, 0);
 
 			if (ppgtt_engines[child] == e->flags)
 				continue;
@@ -192,21 +181,10 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
-		int i915;
-		uint32_t ctx;
-
-		i915 = gem_reopen_driver(fd);
-		/*
-		 * Ensure the gpu is idle by launching
-		 * a nop execbuf and stalling for it.
-		 */
-		gem_quiescent_gpu(i915);
-		ctx = gem_context_create(i915);
-		gem_context_copy_engines(fd, 0, i915, ctx);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
-			execbuf.rsvd1 = gem_context_clone_with_engines(fd, ctx);
+			execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
 			for (unsigned n = 0; n < nengine; n++) {
 				execbuf.flags = engines[n];
 				gem_execbuf(fd, &execbuf);
@@ -217,8 +195,6 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 			clock_gettime(CLOCK_MONOTONIC, &end);
 		} while (elapsed(&start, &end) < timeout);
 
-		gem_context_destroy(fd, ctx);
-
 		gem_sync(fd, obj.handle);
 		clock_gettime(CLOCK_MONOTONIC, &end);
 		igt_info("[%d] Context creation + execution: %.3f us\n",
@@ -325,18 +301,9 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
-		int i915;
-
-		i915 = gem_reopen_driver(fd);
-		/*
-		 * Ensure the gpu is idle by launching
-		 * a nop execbuf and stalling for it.
-		 */
-		gem_quiescent_gpu(i915);
-		gem_context_copy_engines(fd, 0, i915, 0);
 
 		hars_petruska_f54_1_random_perturb(child);
-		obj[0].handle = gem_create(i915, 4096);
+		obj[0].handle = gem_create(fd, 4096);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		for (int repeat = 0; repeat < 3; repeat++) {
@@ -347,13 +314,13 @@ static void maximum(int fd, int ncpus, unsigned mode)
 				execbuf.rsvd1 = contexts[i];
 				for (unsigned long j = 0; j < all_nengine; j++) {
 					execbuf.flags = all_engines[j];
-					gem_execbuf(i915, &execbuf);
+					gem_execbuf(fd, &execbuf);
 				}
 			}
 		}
-		gem_sync(i915, obj[0].handle);
+		gem_sync(fd, obj[0].handle);
 		clock_gettime(CLOCK_MONOTONIC, &end);
-		gem_close(i915, obj[0].handle);
+		gem_close(fd, obj[0].handle);
 
 		igt_info("[%d] Context execution: %.3f us\n", child,
 			 elapsed(&start, &end) / (3 * count * all_nengine) * 1e6);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
