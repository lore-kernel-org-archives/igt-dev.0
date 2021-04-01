Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512296EC0F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:10 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id p12so575832pgj.10
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:25 -0500
Message-Id: <20210401021243.4147604-13-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 12/30] tests/i915/gem_busy: Convert to intel_ctx_t
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

---
 tests/i915/gem_busy.c | 80 ++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 32 deletions(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 77a55101..4e79842d 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -67,6 +67,7 @@ static void __gem_busy(int fd,
 
 static bool exec_noop(int fd,
 		      uint32_t *handles,
+		      const intel_ctx_t *ctx,
 		      unsigned flags,
 		      bool write)
 {
@@ -84,6 +85,7 @@ static bool exec_noop(int fd,
 	execbuf.buffers_ptr = to_user_pointer(exec);
 	execbuf.buffer_count = 3;
 	execbuf.flags = flags;
+	execbuf.rsvd1 = ctx->id;
 	igt_debug("Queuing handle for %s on engine %d\n",
 		  write ? "writing" : "reading", flags);
 	return __gem_execbuf(fd, &execbuf) == 0;
@@ -96,7 +98,8 @@ static bool still_busy(int fd, uint32_t handle)
 	return write;
 }
 
-static void semaphore(int fd, const struct intel_execution_engine2 *e)
+static void semaphore(int fd, const intel_ctx_t *ctx,
+		      const struct intel_execution_engine2 *e)
 {
 	struct intel_execution_engine2 *__e;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -113,18 +116,19 @@ static void semaphore(int fd, const struct intel_execution_engine2 *e)
 	/* Create a long running batch which we can use to hog the GPU */
 	handle[BUSY] = gem_create(fd, 4096);
 	spin = igt_spin_new(fd,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .dependency = handle[BUSY]);
 
 	/* Queue a batch after the busy, it should block and remain "busy" */
-	igt_assert(exec_noop(fd, handle, e->flags, false));
+	igt_assert(exec_noop(fd, handle, ctx, e->flags, false));
 	igt_assert(still_busy(fd, handle[BUSY]));
 	__gem_busy(fd, handle[TEST], &read, &write);
 	igt_assert_eq(read, 1 << e->class);
 	igt_assert_eq(write, 0);
 
 	/* Requeue with a write */
-	igt_assert(exec_noop(fd, handle, e->flags, true));
+	igt_assert(exec_noop(fd, handle, ctx, e->flags, true));
 	igt_assert(still_busy(fd, handle[BUSY]));
 	__gem_busy(fd, handle[TEST], &read, &write);
 	igt_assert_eq(read, 1 << e->class);
@@ -132,8 +136,8 @@ static void semaphore(int fd, const struct intel_execution_engine2 *e)
 
 	/* Now queue it for a read across all available rings */
 	active = 0;
-	__for_each_physical_engine(fd, __e) {
-		if (exec_noop(fd, handle, __e->flags, false))
+	for_each_ctx_engine(fd, ctx, __e) {
+		if (exec_noop(fd, handle, ctx, __e->flags, false))
 			active |= 1 << __e->class;
 	}
 	igt_assert(still_busy(fd, handle[BUSY]));
@@ -157,7 +161,8 @@ static void semaphore(int fd, const struct intel_execution_engine2 *e)
 
 #define PARALLEL 1
 #define HANG 2
-static void one(int fd, const struct intel_execution_engine2 *e, unsigned test_flags)
+static void one(int fd, const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e, unsigned test_flags)
 {
 	uint32_t scratch = gem_create(fd, 4096);
 	uint32_t read[2], write[2];
@@ -167,6 +172,7 @@ static void one(int fd, const struct intel_execution_engine2 *e, unsigned test_f
 	int timeout;
 
 	spin = igt_spin_new(fd,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .dependency = scratch,
 			    .flags = (test_flags & HANG) ? IGT_SPIN_NO_PREEMPTION : 0);
@@ -177,13 +183,13 @@ static void one(int fd, const struct intel_execution_engine2 *e, unsigned test_f
 	if (test_flags & PARALLEL) {
 		struct intel_execution_engine2 *e2;
 
-		__for_each_physical_engine(fd, e2) {
+		for_each_ctx_engine(fd, ctx, e2) {
 			if (e2->class == e->class &&
 			    e2->instance == e->instance)
 				continue;
 
 			igt_debug("Testing %s in parallel\n", e2->name);
-			one(fd, e2, 0);
+			one(fd, ctx, e2, 0);
 		}
 	}
 
@@ -228,7 +234,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 	u32[j] = tmp;
 }
 
-static void close_race(int fd)
+static void close_race(int fd, const intel_ctx_t *ctx)
 {
 	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const unsigned int nhandles = gem_submission_measure(fd, ALL_ENGINES);
@@ -247,7 +253,7 @@ static void close_race(int fd)
 	 */
 
 	nengine = 0;
-	__for_each_physical_engine(fd, e)
+	for_each_ctx_engine(fd, ctx, e)
 		engines[nengine++] = e->flags;
 	igt_require(nengine);
 
@@ -295,6 +301,7 @@ static void close_race(int fd)
 
 		for (i = 0; i < nhandles; i++) {
 			spin[i] = __igt_spin_new(fd,
+						 .ctx = ctx,
 						 .engine = engines[rand() % nengine]);
 			handles[i] = spin[i]->handle;
 		}
@@ -303,6 +310,7 @@ static void close_race(int fd)
 			for (i = 0; i < nhandles; i++) {
 				igt_spin_free(fd, spin[i]);
 				spin[i] = __igt_spin_new(fd,
+							 .ctx = ctx,
 							 .engine = engines[rand() % nengine]);
 				handles[i] = spin[i]->handle;
 				__sync_synchronize();
@@ -354,10 +362,12 @@ static bool has_extended_busy_ioctl(int fd)
 	return read != 0;
 }
 
-static void basic(int fd, const struct intel_execution_engine2 *e, unsigned flags)
+static void basic(int fd, const intel_ctx_t *ctx,
+		  const struct intel_execution_engine2 *e, unsigned flags)
 {
 	igt_spin_t *spin =
 		igt_spin_new(fd,
+			     .ctx = ctx,
 			     .engine = e->flags,
 			     .flags = flags & HANG ?
 			     IGT_SPIN_NO_PREEMPTION | IGT_SPIN_INVALID_CS : 0);
@@ -384,32 +394,38 @@ static void basic(int fd, const struct intel_execution_engine2 *e, unsigned flag
 	igt_spin_free(fd, spin);
 }
 
-static void all(int i915)
+static void all(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
 
-	__for_each_physical_engine(i915, e)
-		igt_fork(child, 1) basic(i915, e, 0);
+	for_each_ctx_engine(i915, ctx, e)
+		igt_fork(child, 1) basic(i915, ctx, e, 0);
 	igt_waitchildren();
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", (e)->name)
 
-#define test_each_engine_store(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine_store(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if (gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
+
+		if (gem_has_contexts(fd))
+			ctx = intel_ctx_create_all_physical(fd);
+		else
+			ctx = intel_ctx_0(fd);
 	}
 
 	igt_subtest_group {
@@ -420,13 +436,13 @@ igt_main
 		igt_subtest_with_dynamic("busy") {
 			igt_dynamic("all") {
 				gem_quiescent_gpu(fd);
-				all(fd);
+				all(fd, ctx);
 			}
 
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s", e->name) {
 					gem_quiescent_gpu(fd);
-					basic(fd, e, 0);
+					basic(fd, ctx, e, 0);
 				}
 			}
 		}
@@ -437,15 +453,15 @@ igt_main
 				gem_require_mmap_wc(fd);
 			}
 
-			test_each_engine_store("extended", fd, e) {
+			test_each_engine_store("extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
-				one(fd, e, 0);
+				one(fd, ctx, e, 0);
 				gem_quiescent_gpu(fd);
 			}
 
-			test_each_engine_store("parallel", fd, e) {
+			test_each_engine_store("parallel", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
-				one(fd, e, PARALLEL);
+				one(fd, ctx, e, PARALLEL);
 				gem_quiescent_gpu(fd);
 			}
 		}
@@ -456,15 +472,15 @@ igt_main
 				igt_require(has_semaphores(fd));
 			}
 
-			test_each_engine("semaphore", fd, e) {
+			test_each_engine("semaphore", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
-				semaphore(fd, e);
+				semaphore(fd, ctx, e);
 				gem_quiescent_gpu(fd);
 			}
 		}
 
 		igt_subtest("close-race")
-			close_race(fd);
+			close_race(fd, ctx);
 
 		igt_fixture {
 			igt_stop_hang_detector();
@@ -478,9 +494,9 @@ igt_main
 			hang = igt_allow_hang(fd, 0, 0);
 		}
 
-		test_each_engine("hang", fd, e) {
+		test_each_engine("hang", fd, ctx, e) {
 			gem_quiescent_gpu(fd);
-			basic(fd, e, HANG);
+			basic(fd, ctx, e, HANG);
 			gem_quiescent_gpu(fd);
 		}
 
@@ -490,9 +506,9 @@ igt_main
 				gem_require_mmap_wc(fd);
 			}
 
-			test_each_engine_store("hang-extended", fd, e) {
+			test_each_engine_store("hang-extended", fd, ctx, e) {
 				gem_quiescent_gpu(fd);
-				one(fd, e, HANG);
+				one(fd, ctx, e, HANG);
 				gem_quiescent_gpu(fd);
 			}
 		}
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
