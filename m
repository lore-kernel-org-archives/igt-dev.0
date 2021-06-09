Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FD6EA25
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:37:11 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id h12so16130294pfe.2
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:37:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:36:04 -0500
Message-Id: <20210609173632.248880-22-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 21/93] tests/i915/perf_pmu: Convert to
 intel_ctx_t
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/perf_pmu.c | 228 ++++++++++++++++++++++++------------------
 1 file changed, 128 insertions(+), 100 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index aa297bf1..563795c8 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -47,6 +47,7 @@
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 #include "igt_pm.h"
+#include "intel_ctx.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
@@ -172,11 +173,11 @@ static unsigned int measured_usleep(unsigned int usec)
 #define FLAG_HANG (32)
 #define TEST_S3 (64)
 
-static igt_spin_t * __spin_poll(int fd, uint32_t ctx,
+static igt_spin_t * __spin_poll(int fd, const intel_ctx_t *ctx,
 				const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
-		.ctx_id = ctx,
+		.ctx = ctx,
 		.engine = e->flags,
 	};
 
@@ -215,7 +216,7 @@ static unsigned long __spin_wait(int fd, igt_spin_t *spin)
 	return igt_nsec_elapsed(&start);
 }
 
-static igt_spin_t * __spin_sync(int fd, uint32_t ctx,
+static igt_spin_t * __spin_sync(int fd, const intel_ctx_t *ctx,
 				const struct intel_execution_engine2 *e)
 {
 	igt_spin_t *spin = __spin_poll(fd, ctx, e);
@@ -225,7 +226,7 @@ static igt_spin_t * __spin_sync(int fd, uint32_t ctx,
 	return spin;
 }
 
-static igt_spin_t * spin_sync(int fd, uint32_t ctx,
+static igt_spin_t * spin_sync(int fd, const intel_ctx_t *ctx,
 			      const struct intel_execution_engine2 *e)
 {
 	igt_require_gem(fd);
@@ -233,7 +234,7 @@ static igt_spin_t * spin_sync(int fd, uint32_t ctx,
 	return __spin_sync(fd, ctx, e);
 }
 
-static igt_spin_t * spin_sync_flags(int fd, uint32_t ctx, unsigned int flags)
+static igt_spin_t * spin_sync_flags(int fd, const intel_ctx_t *ctx, unsigned int flags)
 {
 	struct intel_execution_engine2 e = { };
 
@@ -277,7 +278,8 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
 }
 
 static void
-single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
+single(int gem_fd, const intel_ctx_t *ctx,
+       const struct intel_execution_engine2 *e, unsigned int flags)
 {
 	unsigned long slept;
 	igt_spin_t *spin;
@@ -287,7 +289,7 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	if (flags & TEST_BUSY)
-		spin = spin_sync(gem_fd, 0, e);
+		spin = spin_sync(gem_fd, ctx, e);
 	else
 		spin = NULL;
 
@@ -323,7 +325,8 @@ single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 }
 
 static void
-busy_start(int gem_fd, const struct intel_execution_engine2 *e)
+busy_start(int gem_fd, const intel_ctx_t *ctx,
+	   const struct intel_execution_engine2 *e)
 {
 	unsigned long slept;
 	uint64_t val, ts[2];
@@ -336,7 +339,7 @@ busy_start(int gem_fd, const struct intel_execution_engine2 *e)
 	 */
 	sleep(2);
 
-	spin = __spin_sync(gem_fd, 0, e);
+	spin = __spin_sync(gem_fd, ctx, e);
 
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
@@ -358,15 +361,16 @@ busy_start(int gem_fd, const struct intel_execution_engine2 *e)
  * will depend on the CI systems running it a lot to detect issues.
  */
 static void
-busy_double_start(int gem_fd, const struct intel_execution_engine2 *e)
+busy_double_start(int gem_fd, const intel_ctx_t *ctx,
+		  const struct intel_execution_engine2 *e)
 {
 	unsigned long slept;
 	uint64_t val, val2, ts[2];
 	igt_spin_t *spin[2];
-	uint32_t ctx;
+	const intel_ctx_t *tmp_ctx;
 	int fd;
 
-	ctx = gem_context_clone_with_engines(gem_fd, 0);
+	tmp_ctx = intel_ctx_create(gem_fd, &ctx->cfg);
 
 	/*
 	 * Defeat the busy stats delayed disable, we need to guarantee we are
@@ -379,10 +383,10 @@ busy_double_start(int gem_fd, const struct intel_execution_engine2 *e)
 	 * re-submission in execlists mode. Make sure busyness is correctly
 	 * reported with the engine busy, and after the engine went idle.
 	 */
-	spin[0] = __spin_sync(gem_fd, 0, e);
+	spin[0] = __spin_sync(gem_fd, ctx, e);
 	usleep(500e3);
 	spin[1] = __igt_spin_new(gem_fd,
-				 .ctx_id = ctx,
+				 .ctx = tmp_ctx,
 				 .engine = e->flags);
 
 	/*
@@ -413,7 +417,7 @@ busy_double_start(int gem_fd, const struct intel_execution_engine2 *e)
 
 	close(fd);
 
-	gem_context_destroy(gem_fd, ctx);
+	intel_ctx_destroy(gem_fd, tmp_ctx);
 
 	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
 	igt_assert_eq(val2, 0);
@@ -441,7 +445,8 @@ static void log_busy(unsigned int num_engines, uint64_t *val)
 }
 
 static void
-busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
+busy_check_all(int gem_fd, const intel_ctx_t *ctx,
+	       const struct intel_execution_engine2 *e,
 	       const unsigned int num_engines, unsigned int flags)
 {
 	struct intel_execution_engine2 *e_;
@@ -454,7 +459,7 @@ busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
 
 	i = 0;
 	fd[0] = -1;
-	__for_each_physical_engine(gem_fd, e_) {
+	for_each_ctx_engine(gem_fd, ctx, e_) {
 		if (e->class == e_->class && e->instance == e_->instance)
 			busy_idx = i;
 
@@ -466,7 +471,7 @@ busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
 
 	igt_assert_eq(i, num_engines);
 
-	spin = spin_sync(gem_fd, 0, e);
+	spin = spin_sync(gem_fd, ctx, e);
 	pmu_read_multi(fd[0], num_engines, tval[0]);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
@@ -507,7 +512,8 @@ __submit_spin(int gem_fd, igt_spin_t *spin,
 }
 
 static void
-most_busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
+most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
+		    const struct intel_execution_engine2 *e,
 		    const unsigned int num_engines, unsigned int flags)
 {
 	struct intel_execution_engine2 *e_;
@@ -519,13 +525,13 @@ most_busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
 	unsigned int idle_idx, i;
 
 	i = 0;
-	__for_each_physical_engine(gem_fd, e_) {
+	for_each_ctx_engine(gem_fd, ctx, e_) {
 		if (e->class == e_->class && e->instance == e_->instance)
 			idle_idx = i;
 		else if (spin)
 			__submit_spin(gem_fd, spin, e_, 64);
 		else
-			spin = __spin_poll(gem_fd, 0, e_);
+			spin = __spin_poll(gem_fd, ctx, e_);
 
 		val[i++] = I915_PMU_ENGINE_BUSY(e_->class, e_->instance);
 	}
@@ -565,7 +571,8 @@ most_busy_check_all(int gem_fd, const struct intel_execution_engine2 *e,
 }
 
 static void
-all_busy_check_all(int gem_fd, const unsigned int num_engines,
+all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
+		   const unsigned int num_engines,
 		   unsigned int flags)
 {
 	struct intel_execution_engine2 *e;
@@ -577,11 +584,11 @@ all_busy_check_all(int gem_fd, const unsigned int num_engines,
 	unsigned int i;
 
 	i = 0;
-	__for_each_physical_engine(gem_fd, e) {
+	for_each_ctx_engine(gem_fd, ctx, e) {
 		if (spin)
 			__submit_spin(gem_fd, spin, e, 64);
 		else
-			spin = __spin_poll(gem_fd, 0, e);
+			spin = __spin_poll(gem_fd, ctx, e);
 
 		val[i++] = I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	}
@@ -616,7 +623,9 @@ all_busy_check_all(int gem_fd, const unsigned int num_engines,
 }
 
 static void
-no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
+no_sema(int gem_fd, const intel_ctx_t *ctx,
+	const struct intel_execution_engine2 *e,
+	unsigned int flags)
 {
 	igt_spin_t *spin;
 	uint64_t val[2][2];
@@ -628,7 +637,7 @@ no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 			   fd[0]);
 
 	if (flags & TEST_BUSY)
-		spin = spin_sync(gem_fd, 0, e);
+		spin = spin_sync(gem_fd, ctx, e);
 	else
 		spin = NULL;
 
@@ -659,7 +668,8 @@ no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
 static void
-sema_wait(int gem_fd, const struct intel_execution_engine2 *e,
+sema_wait(int gem_fd, const intel_ctx_t *ctx,
+	  const struct intel_execution_engine2 *e,
 	  unsigned int flags)
 {
 	struct drm_i915_gem_relocation_entry reloc[2] = {};
@@ -718,6 +728,7 @@ sema_wait(int gem_fd, const struct intel_execution_engine2 *e,
 	eb.buffer_count = 2;
 	eb.buffers_ptr = to_user_pointer(obj);
 	eb.flags = e->flags;
+	eb.rsvd1 = ctx->id;
 
 	/**
 	 * Start the semaphore wait PMU and after some known time let the above
@@ -789,7 +800,7 @@ create_sema(int gem_fd, struct drm_i915_gem_relocation_entry *reloc)
 }
 
 static void
-__sema_busy(int gem_fd, int pmu,
+__sema_busy(int gem_fd, int pmu, const intel_ctx_t *ctx,
 	    const struct intel_execution_engine2 *e,
 	    int sema_pct,
 	    int busy_pct)
@@ -811,6 +822,7 @@ __sema_busy(int gem_fd, int pmu,
 		.buffer_count = 1,
 		.buffers_ptr = to_user_pointer(&obj),
 		.flags = e->flags,
+		.rsvd1 = ctx->id,
 	};
 	igt_spin_t *spin;
 	uint32_t *map;
@@ -822,7 +834,7 @@ __sema_busy(int gem_fd, int pmu,
 
 	map = gem_mmap__wc(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
 	gem_execbuf(gem_fd, &eb);
-	spin = igt_spin_new(gem_fd, .engine = e->flags);
+	spin = igt_spin_new(gem_fd, .ctx = ctx, .engine = e->flags);
 
 	/* Wait until the batch is executed and the semaphore is busy-waiting */
 	while (!READ_ONCE(*map) && gem_bo_busy(gem_fd, obj.handle))
@@ -862,7 +874,7 @@ __sema_busy(int gem_fd, int pmu,
 }
 
 static void
-sema_busy(int gem_fd,
+sema_busy(int gem_fd, const intel_ctx_t *ctx,
 	  const struct intel_execution_engine2 *e,
 	  unsigned int flags)
 {
@@ -875,15 +887,15 @@ sema_busy(int gem_fd,
 	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance),
 			   fd[0]);
 
-	__sema_busy(gem_fd, fd[0], e, 50, 100);
-	__sema_busy(gem_fd, fd[0], e, 25, 50);
-	__sema_busy(gem_fd, fd[0], e, 75, 75);
+	__sema_busy(gem_fd, fd[0], ctx, e, 50, 100);
+	__sema_busy(gem_fd, fd[0], ctx, e, 25, 50);
+	__sema_busy(gem_fd, fd[0], ctx, e, 75, 75);
 
 	close(fd[0]);
 	close(fd[1]);
 }
 
-static void test_awake(int i915)
+static void test_awake(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
 	unsigned long slept;
@@ -894,8 +906,8 @@ static void test_awake(int i915)
 	igt_skip_on(fd < 0);
 
 	/* Check that each engine is captured by the GT wakeref */
-	__for_each_physical_engine(i915, e) {
-		igt_spin_new(i915, .engine = e->flags);
+	for_each_ctx_engine(i915, ctx, e) {
+		igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
 
 		val = pmu_read_single(fd);
 		slept = measured_usleep(batch_duration_ns / 1000);
@@ -906,8 +918,8 @@ static void test_awake(int i915)
 	}
 
 	/* And that the total GT wakeref matches walltime not summation */
-	__for_each_physical_engine(i915, e)
-		igt_spin_new(i915, .engine = e->flags);
+	for_each_ctx_engine(i915, ctx, e)
+		igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
 
 	val = pmu_read_single(fd);
 	slept = measured_usleep(batch_duration_ns / 1000);
@@ -996,7 +1008,8 @@ static int has_secure_batches(const int fd)
 }
 
 static void
-event_wait(int gem_fd, const struct intel_execution_engine2 *e)
+event_wait(int gem_fd, const intel_ctx_t *ctx,
+	   const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_exec_object2 obj = { };
 	struct drm_i915_gem_execbuffer2 eb = { };
@@ -1052,6 +1065,7 @@ event_wait(int gem_fd, const struct intel_execution_engine2 *e)
 	eb.buffer_count = 1;
 	eb.buffers_ptr = to_user_pointer(&obj);
 	eb.flags = e->flags | I915_EXEC_SECURE;
+	eb.rsvd1 = ctx->id;
 
 	for_each_pipe_with_valid_output(&data.display, p, output) {
 		struct igt_helper_process waiter = { };
@@ -1124,7 +1138,8 @@ event_wait(int gem_fd, const struct intel_execution_engine2 *e)
 }
 
 static void
-multi_client(int gem_fd, const struct intel_execution_engine2 *e)
+multi_client(int gem_fd, const intel_ctx_t *ctx,
+	     const struct intel_execution_engine2 *e)
 {
 	uint64_t config = I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	unsigned long slept[2];
@@ -1143,7 +1158,7 @@ multi_client(int gem_fd, const struct intel_execution_engine2 *e)
 	 */
 	fd[1] = open_pmu(gem_fd, config);
 
-	spin = spin_sync(gem_fd, 0, e);
+	spin = spin_sync(gem_fd, ctx, e);
 
 	val[0] = val[1] = __pmu_read_single(fd[0], &ts[0]);
 	slept[1] = measured_usleep(batch_duration_ns / 1000);
@@ -1706,7 +1721,8 @@ test_rc6(int gem_fd, unsigned int flags)
 }
 
 static void
-test_enable_race(int gem_fd, const struct intel_execution_engine2 *e)
+test_enable_race(int gem_fd, const intel_ctx_t *ctx,
+		 const struct intel_execution_engine2 *e)
 {
 	uint64_t config = I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	struct igt_helper_process engine_load = { };
@@ -1724,6 +1740,7 @@ test_enable_race(int gem_fd, const struct intel_execution_engine2 *e)
 	eb.buffer_count = 1;
 	eb.buffers_ptr = to_user_pointer(&obj);
 	eb.flags = e->flags;
+	eb.rsvd1 = ctx->id;
 
 	/*
 	 * This test is probabilistic so run in a few times to increase the
@@ -1770,7 +1787,8 @@ test_enable_race(int gem_fd, const struct intel_execution_engine2 *e)
 	__assert_within(x, ref, tolerance, tolerance)
 
 static void
-accuracy(int gem_fd, const struct intel_execution_engine2 *e,
+accuracy(int gem_fd, const intel_ctx_t *ctx,
+	 const struct intel_execution_engine2 *e,
 	 unsigned long target_busy_pct,
 	 unsigned long target_iters)
 {
@@ -1820,7 +1838,7 @@ accuracy(int gem_fd, const struct intel_execution_engine2 *e,
 		igt_spin_t *spin;
 
 		/* Allocate our spin batch and idle it. */
-		spin = igt_spin_new(gem_fd, .engine = e->flags);
+		spin = igt_spin_new(gem_fd, .ctx = ctx, .engine = e->flags);
 		igt_spin_end(spin);
 		gem_sync(gem_fd, spin->handle);
 
@@ -1979,6 +1997,7 @@ static int unload_i915(void)
 static void test_unload(unsigned int num_engines)
 {
 	igt_fork(child, 1) {
+		intel_ctx_cfg_t cfg;
 		const struct intel_execution_engine2 *e;
 		int fd[4 + num_engines * 3], i;
 		uint64_t *buf;
@@ -2004,7 +2023,8 @@ static void test_unload(unsigned int num_engines)
 		if (fd[count] != -1)
 			count++;
 
-		__for_each_physical_engine(i915, e) {
+		cfg = intel_ctx_cfg_all_physical(i915);
+		for_each_ctx_cfg_engine(i915, &cfg, e) {
 			fd[count] = perf_i915_open_group(i915,
 							 I915_PMU_ENGINE_BUSY(e->class, e->instance),
 							 fd[count - 1]);
@@ -2052,12 +2072,12 @@ static void test_unload(unsigned int num_engines)
 	igt_assert_eq(unload_i915(), 0);
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-#define test_each_rcs(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_rcs(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER) \
 			igt_dynamic_f("%s", e->name)
 
@@ -2065,6 +2085,7 @@ igt_main
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	/**
@@ -2079,7 +2100,9 @@ igt_main
 		igt_require_gem(fd);
 		igt_require(i915_perf_type_id(fd) > 0);
 
-		__for_each_physical_engine(fd, e)
+		ctx = intel_ctx_create_all_physical(fd);
+
+		for_each_ctx_engine(fd, ctx, e)
 			num_engines++;
 		igt_require(num_engines);
 	}
@@ -2107,48 +2130,48 @@ igt_main
 	 * Test that a single engine metric can be initialized or it
 	 * is correctly rejected.
 	 */
-	test_each_engine("init-busy", fd, e)
+	test_each_engine("init-busy", fd, ctx, e)
 		init(fd, e, I915_SAMPLE_BUSY);
 
-	test_each_engine("init-wait", fd, e)
+	test_each_engine("init-wait", fd, ctx, e)
 		init(fd, e, I915_SAMPLE_WAIT);
 
-	test_each_engine("init-sema", fd, e)
+	test_each_engine("init-sema", fd, ctx, e)
 		init(fd, e, I915_SAMPLE_SEMA);
 
 	/**
 	 * Test that engines show no load when idle.
 	 */
-	test_each_engine("idle", fd, e)
-		single(fd, e, 0);
+	test_each_engine("idle", fd, ctx, e)
+		single(fd, ctx, e, 0);
 
 	/**
 	 * Test that a single engine reports load correctly.
 	 */
-	test_each_engine("busy", fd, e)
-		single(fd, e, TEST_BUSY);
-	test_each_engine("busy-idle", fd, e)
-		single(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
+	test_each_engine("busy", fd, ctx, e)
+		single(fd, ctx, e, TEST_BUSY);
+	test_each_engine("busy-idle", fd, ctx, e)
+		single(fd, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
 	/**
 	 * Test that when one engine is loaded other report no
 	 * load.
 	 */
-	test_each_engine("busy-check-all", fd, e)
-		busy_check_all(fd, e, num_engines, TEST_BUSY);
-	test_each_engine("busy-idle-check-all", fd, e)
-		busy_check_all(fd, e, num_engines,
+	test_each_engine("busy-check-all", fd, ctx, e)
+		busy_check_all(fd, ctx, e, num_engines, TEST_BUSY);
+	test_each_engine("busy-idle-check-all", fd, ctx, e)
+		busy_check_all(fd, ctx, e, num_engines,
 			       TEST_BUSY | TEST_TRAILING_IDLE);
 
 	/**
 	 * Test that when all except one engine are loaded all
 	 * loads are correctly reported.
 	 */
-	test_each_engine("most-busy-check-all", fd, e)
-		most_busy_check_all(fd, e, num_engines,
+	test_each_engine("most-busy-check-all", fd, ctx, e)
+		most_busy_check_all(fd, ctx, e, num_engines,
 				    TEST_BUSY);
-	test_each_engine("most-busy-idle-check-all", fd, e)
-		most_busy_check_all(fd, e, num_engines,
+	test_each_engine("most-busy-idle-check-all", fd, ctx, e)
+		most_busy_check_all(fd, ctx, e, num_engines,
 				    TEST_BUSY |
 				    TEST_TRAILING_IDLE);
 
@@ -2156,40 +2179,40 @@ igt_main
 	 * Test that semphore counters report no activity on
 	 * idle or busy engines.
 	 */
-	test_each_engine("idle-no-semaphores", fd, e)
-		no_sema(fd, e, 0);
+	test_each_engine("idle-no-semaphores", fd, ctx, e)
+		no_sema(fd, ctx, e, 0);
 
-	test_each_engine("busy-no-semaphores", fd, e)
-		no_sema(fd, e, TEST_BUSY);
+	test_each_engine("busy-no-semaphores", fd, ctx, e)
+		no_sema(fd, ctx, e, TEST_BUSY);
 
-	test_each_engine("busy-idle-no-semaphores", fd, e)
-		no_sema(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
+	test_each_engine("busy-idle-no-semaphores", fd, ctx, e)
+		no_sema(fd, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
 	/**
 	 * Test that semaphore waits are correctly reported.
 	 */
-	test_each_engine("semaphore-wait", fd, e)
-		sema_wait(fd, e, TEST_BUSY);
+	test_each_engine("semaphore-wait", fd, ctx, e)
+		sema_wait(fd, ctx, e, TEST_BUSY);
 
-	test_each_engine("semaphore-wait-idle", fd, e)
-		sema_wait(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
+	test_each_engine("semaphore-wait-idle", fd, ctx, e)
+		sema_wait(fd, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
-	test_each_engine("semaphore-busy", fd, e)
-		sema_busy(fd, e, 0);
+	test_each_engine("semaphore-busy", fd, ctx, e)
+		sema_busy(fd, ctx, e, 0);
 
 	/**
 	 * Check that two perf clients do not influence each
 	 * others observations.
 	 */
-	test_each_engine("multi-client", fd, e)
-		multi_client(fd, e);
+	test_each_engine("multi-client", fd, ctx, e)
+		multi_client(fd, ctx, e);
 
 	/**
 	 * Check that reported usage is correct when PMU is
 	 * enabled after the batch is running.
 	 */
-	test_each_engine("busy-start", fd, e)
-		busy_start(fd, e);
+	test_each_engine("busy-start", fd, ctx, e)
+		busy_start(fd, ctx, e);
 
 	/**
 	 * Check that reported usage is correct when PMU is
@@ -2198,16 +2221,16 @@ igt_main
 	igt_subtest_group {
 		igt_fixture gem_require_contexts(fd);
 
-		test_each_engine("busy-double-start", fd, e)
-			busy_double_start(fd, e);
+		test_each_engine("busy-double-start", fd, ctx, e)
+			busy_double_start(fd, ctx, e);
 	}
 
 	/**
 	 * Check that the PMU can be safely enabled in face of
 	 * interrupt-heavy engine load.
 	 */
-	test_each_engine("enable-race", fd, e)
-		test_enable_race(fd, e);
+	test_each_engine("enable-race", fd, ctx, e)
+		test_enable_race(fd, ctx, e);
 
 	igt_subtest_group {
 		const unsigned int pct[] = { 2, 50, 98 };
@@ -2217,18 +2240,18 @@ igt_main
 		 */
 		for (unsigned int i = 0; i < ARRAY_SIZE(pct); i++) {
 			igt_subtest_with_dynamic_f("busy-accuracy-%u", pct[i]) {
-				__for_each_physical_engine(fd, e) {
+				for_each_ctx_engine(fd, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						accuracy(fd, e, pct[i], 10);
+						accuracy(fd, ctx, e, pct[i], 10);
 				}
 			}
 		}
 	}
 
-	test_each_engine("busy-hang", fd, e) {
+	test_each_engine("busy-hang", fd, ctx, e) {
 		igt_hang_t hang = igt_allow_hang(fd, 0, 0);
 
-		single(fd, e, TEST_BUSY | FLAG_HANG);
+		single(fd, ctx, e, TEST_BUSY | FLAG_HANG);
 
 		igt_disallow_hang(fd, hang);
 	}
@@ -2236,17 +2259,18 @@ igt_main
 	/**
 	 * Test that event waits are correctly reported.
 	 */
-	test_each_rcs("event-wait", fd, e)
-		event_wait(fd, e);
+	test_each_rcs("event-wait", fd, ctx, e)
+		event_wait(fd, ctx, e);
 
 	/**
 	 * Test that when all engines are loaded all loads are
 	 * correctly reported.
 	 */
 	igt_subtest("all-busy-check-all")
-		all_busy_check_all(fd, num_engines, TEST_BUSY);
+		all_busy_check_all(fd, ctx, num_engines,
+				   TEST_BUSY);
 	igt_subtest("all-busy-idle-check-all")
-		all_busy_check_all(fd, num_engines,
+		all_busy_check_all(fd, ctx, num_engines,
 				   TEST_BUSY | TEST_TRAILING_IDLE);
 
 	/**
@@ -2291,32 +2315,36 @@ igt_main
 	 * Test GT wakeref tracking (similar to RC0, opposite of RC6)
 	 */
 	igt_subtest("gt-awake")
-		test_awake(fd);
+		test_awake(fd, ctx);
 
 	/**
 	 * Check render nodes are counted.
 	 */
 	igt_subtest_group {
 		int render_fd = -1;
+		const intel_ctx_t *render_ctx = NULL;
 
 		igt_fixture {
 			render_fd = __drm_open_driver_render(DRIVER_INTEL);
 			igt_require_gem(render_fd);
+			render_ctx = intel_ctx_create_all_physical(render_fd);
 
 			gem_quiescent_gpu(fd);
 		}
 
-		test_each_engine("render-node-busy", render_fd, e)
-			single(render_fd, e, TEST_BUSY);
-		test_each_engine("render-node-busy-idle", render_fd, e)
-			single(render_fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
+		test_each_engine("render-node-busy", render_fd, ctx, e)
+			single(render_fd, render_ctx, e, TEST_BUSY);
+		test_each_engine("render-node-busy-idle", render_fd, ctx, e)
+			single(render_fd, render_ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
 		igt_fixture {
+			intel_ctx_destroy(render_fd, render_ctx);
 			close(render_fd);
 		}
 	}
 
 	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
