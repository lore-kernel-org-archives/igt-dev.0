Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CAF6EBFD
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:46 +0200
Message-Id: <20210806094649.21162-54-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 53/56] tests/perf_pmu: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c | 147 ++++++++++++++++++++++++++++++------------
 1 file changed, 107 insertions(+), 40 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 10dc3bf2f..924f39d1a 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -174,10 +174,11 @@ static unsigned int measured_usleep(unsigned int usec)
 #define FLAG_HANG (32)
 #define TEST_S3 (64)
 
-static igt_spin_t * __spin_poll(int fd, const intel_ctx_t *ctx,
-				const struct intel_execution_engine2 *e)
+static igt_spin_t *__spin_poll(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
+		.ahnd = ahnd,
 		.ctx = ctx,
 		.engine = e->flags,
 	};
@@ -217,25 +218,26 @@ static unsigned long __spin_wait(int fd, igt_spin_t *spin)
 	return igt_nsec_elapsed(&start);
 }
 
-static igt_spin_t * __spin_sync(int fd, const intel_ctx_t *ctx,
-				const struct intel_execution_engine2 *e)
+static igt_spin_t *__spin_sync(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e)
 {
-	igt_spin_t *spin = __spin_poll(fd, ctx, e);
+	igt_spin_t *spin = __spin_poll(fd, ahnd, ctx, e);
 
 	__spin_wait(fd, spin);
 
 	return spin;
 }
 
-static igt_spin_t * spin_sync(int fd, const intel_ctx_t *ctx,
-			      const struct intel_execution_engine2 *e)
+static igt_spin_t *spin_sync(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			     const struct intel_execution_engine2 *e)
 {
 	igt_require_gem(fd);
 
-	return __spin_sync(fd, ctx, e);
+	return __spin_sync(fd, ahnd, ctx, e);
 }
 
-static igt_spin_t * spin_sync_flags(int fd, const intel_ctx_t *ctx, unsigned int flags)
+static igt_spin_t *spin_sync_flags(int fd, uint64_t ahnd,
+				   const intel_ctx_t *ctx, unsigned int flags)
 {
 	struct intel_execution_engine2 e = { };
 
@@ -244,7 +246,7 @@ static igt_spin_t * spin_sync_flags(int fd, const intel_ctx_t *ctx, unsigned int
 		     (I915_EXEC_BSD | I915_EXEC_BSD_RING2) ? 1 : 0;
 	e.flags = flags;
 
-	return spin_sync(fd, ctx, &e);
+	return spin_sync(fd, ahnd, ctx, &e);
 }
 
 static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
@@ -286,11 +288,12 @@ single(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_t *spin;
 	uint64_t val;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	if (flags & TEST_BUSY)
-		spin = spin_sync(gem_fd, ctx, e);
+		spin = spin_sync(gem_fd, ahnd, ctx, e);
 	else
 		spin = NULL;
 
@@ -321,6 +324,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(gem_fd, spin);
 	close(fd);
+	put_ahnd(ahnd);
 
 	gem_quiescent_gpu(gem_fd);
 }
@@ -333,6 +337,7 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
 	uint64_t val, ts[2];
 	igt_spin_t *spin;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	/*
 	 * Defeat the busy stats delayed disable, we need to guarantee we are
@@ -340,7 +345,7 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
 	 */
 	sleep(2);
 
-	spin = __spin_sync(gem_fd, ctx, e);
+	spin = __spin_sync(gem_fd, ahnd, ctx, e);
 
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
@@ -351,6 +356,7 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(gem_fd, spin);
 	close(fd);
+	put_ahnd(ahnd);
 
 	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
 	gem_quiescent_gpu(gem_fd);
@@ -370,8 +376,10 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_t *spin[2];
 	const intel_ctx_t *tmp_ctx;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id), ahndN;
 
 	tmp_ctx = intel_ctx_create(gem_fd, &ctx->cfg);
+	ahndN = get_reloc_ahnd(gem_fd, tmp_ctx->id);
 
 	/*
 	 * Defeat the busy stats delayed disable, we need to guarantee we are
@@ -384,9 +392,10 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	 * re-submission in execlists mode. Make sure busyness is correctly
 	 * reported with the engine busy, and after the engine went idle.
 	 */
-	spin[0] = __spin_sync(gem_fd, ctx, e);
+	spin[0] = __spin_sync(gem_fd, ahnd, ctx, e);
 	usleep(500e3);
 	spin[1] = __igt_spin_new(gem_fd,
+				 .ahnd = ahndN,
 				 .ctx = tmp_ctx,
 				 .engine = e->flags);
 
@@ -419,6 +428,8 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	close(fd);
 
 	intel_ctx_destroy(gem_fd, tmp_ctx);
+	put_ahnd(ahnd);
+	put_ahnd(ahndN);
 
 	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
 	igt_assert_eq(val2, 0);
@@ -457,6 +468,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	int fd[num_engines];
 	unsigned long slept;
 	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	i = 0;
 	fd[0] = -1;
@@ -472,7 +484,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 
 	igt_assert_eq(i, num_engines);
 
-	spin = spin_sync(gem_fd, ctx, e);
+	spin = spin_sync(gem_fd, ahnd, ctx, e);
 	pmu_read_multi(fd[0], num_engines, tval[0]);
 	slept = measured_usleep(batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
@@ -483,6 +495,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_free(gem_fd, spin);
 	for (i = 0; i < num_engines; i++)
 		close(fd[i]);
+	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
 		val[i] = tval[1][i] - tval[0][i];
@@ -524,6 +537,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	unsigned long slept;
 	igt_spin_t *spin = NULL;
 	unsigned int idle_idx, i;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	i = 0;
 	for_each_ctx_engine(gem_fd, ctx, e_) {
@@ -532,7 +546,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 		else if (spin)
 			__submit_spin(gem_fd, spin, e_, 64);
 		else
-			spin = __spin_poll(gem_fd, ctx, e_);
+			spin = __spin_poll(gem_fd, ahnd, ctx, e_);
 
 		val[i++] = I915_PMU_ENGINE_BUSY(e_->class, e_->instance);
 	}
@@ -556,6 +570,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_free(gem_fd, spin);
 	for (i = 0; i < num_engines; i++)
 		close(fd[i]);
+	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
 		val[i] = tval[1][i] - tval[0][i];
@@ -583,13 +598,14 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	unsigned long slept;
 	igt_spin_t *spin = NULL;
 	unsigned int i;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	i = 0;
 	for_each_ctx_engine(gem_fd, ctx, e) {
 		if (spin)
 			__submit_spin(gem_fd, spin, e, 64);
 		else
-			spin = __spin_poll(gem_fd, ctx, e);
+			spin = __spin_poll(gem_fd, ahnd, ctx, e);
 
 		val[i++] = I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	}
@@ -612,6 +628,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_free(gem_fd, spin);
 	for (i = 0; i < num_engines; i++)
 		close(fd[i]);
+	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
 		val[i] = tval[1][i] - tval[0][i];
@@ -631,6 +648,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 	igt_spin_t *spin;
 	uint64_t val[2][2];
 	int fd[2];
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
@@ -638,7 +656,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 			   fd[0]);
 
 	if (flags & TEST_BUSY)
-		spin = spin_sync(gem_fd, ctx, e);
+		spin = spin_sync(gem_fd, ahnd, ctx, e);
 	else
 		spin = NULL;
 
@@ -657,6 +675,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 	}
 	close(fd[0]);
 	close(fd[1]);
+	put_ahnd(ahnd);
 
 	assert_within_epsilon(val[0][0], 0.0f, tolerance);
 	assert_within_epsilon(val[0][1], 0.0f, tolerance);
@@ -682,6 +701,8 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	uint32_t batch[16];
 	uint64_t val[2], ts[2];
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
+	uint64_t obj_offset, bb_offset;
 
 	igt_require(intel_gen(intel_get_drm_devid(gem_fd)) >= 8);
 
@@ -693,19 +714,21 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 
 	bb_handle = gem_create(gem_fd, 4096);
 	obj_handle = gem_create(gem_fd, 4096);
+	bb_offset = get_offset(ahnd, bb_handle, 4096, 0);
+	obj_offset = get_offset(ahnd, obj_handle, 4096, 0);
 
 	obj_ptr = gem_mmap__wc(gem_fd, obj_handle, 0, 4096, PROT_WRITE);
 
 	batch[0] = MI_STORE_DWORD_IMM;
-	batch[1] = sizeof(*obj_ptr);
-	batch[2] = 0;
+	batch[1] = obj_offset + sizeof(*obj_ptr);
+	batch[2] = (obj_offset + sizeof(*obj_ptr)) >> 32;
 	batch[3] = 1;
 	batch[4] = MI_SEMAPHORE_WAIT |
 		   MI_SEMAPHORE_POLL |
 		   MI_SEMAPHORE_SAD_GTE_SDD;
 	batch[5] = 1;
-	batch[6] = 0x0;
-	batch[7] = 0x0;
+	batch[6] = obj_offset;
+	batch[7] = obj_offset >> 32;
 	batch[8] = MI_BATCH_BUFFER_END;
 
 	gem_write(gem_fd, bb_handle, 0, batch, sizeof(batch));
@@ -723,7 +746,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	obj[0].handle = obj_handle;
 
 	obj[1].handle = bb_handle;
-	obj[1].relocation_count = 2;
+	obj[1].relocation_count = !ahnd ? 2 : 0;
 	obj[1].relocs_ptr = to_user_pointer(reloc);
 
 	eb.buffer_count = 2;
@@ -731,6 +754,13 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	eb.flags = e->flags;
 	eb.rsvd1 = ctx->id;
 
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[0].offset = obj_offset;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		obj[1].offset = bb_offset;
+	}
+
 	/**
 	 * Start the semaphore wait PMU and after some known time let the above
 	 * semaphore wait command finish. Then check that the PMU is reporting
@@ -766,12 +796,14 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	gem_close(gem_fd, obj_handle);
 	gem_close(gem_fd, bb_handle);
 	close(fd);
+	put_ahnd(ahnd);
 
 	assert_within_epsilon(val[1] - val[0], slept, tolerance);
 }
 
 static uint32_t
-create_sema(int gem_fd, struct drm_i915_gem_relocation_entry *reloc)
+create_sema(int gem_fd, uint64_t ahnd,
+	    struct drm_i915_gem_relocation_entry *reloc, __u64 *poffset)
 {
 	uint32_t cs[] = {
 		/* Reset our semaphore wait */
@@ -788,7 +820,12 @@ create_sema(int gem_fd, struct drm_i915_gem_relocation_entry *reloc)
 
 		MI_BATCH_BUFFER_END
 	};
-	uint32_t handle = gem_create(gem_fd, 4096);
+	uint32_t handle;
+
+	igt_assert(poffset);
+
+	handle = gem_create(gem_fd, 4096);
+	*poffset = get_offset(ahnd, handle, 4096, 0);
 
 	memset(reloc, 0, 2 * sizeof(*reloc));
 	reloc[0].target_handle = handle;
@@ -796,12 +833,19 @@ create_sema(int gem_fd, struct drm_i915_gem_relocation_entry *reloc)
 	reloc[1].target_handle = handle;
 	reloc[1].offset = 64 + 6 * sizeof(uint32_t);
 
+	if (ahnd) {
+		cs[1] = *poffset;
+		cs[2] = *poffset >> 32;
+		cs[6] = *poffset;
+		cs[7] = *poffset >> 32;
+	}
+
 	gem_write(gem_fd, handle, 64, cs, sizeof(cs));
 	return handle;
 }
 
 static void
-__sema_busy(int gem_fd, int pmu, const intel_ctx_t *ctx,
+__sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 	    const struct intel_execution_engine2 *e,
 	    int sema_pct,
 	    int busy_pct)
@@ -814,8 +858,8 @@ __sema_busy(int gem_fd, int pmu, const intel_ctx_t *ctx,
 	uint64_t start[2], val[2];
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj = {
-		.handle = create_sema(gem_fd, reloc),
-		.relocation_count = 2,
+		.handle = create_sema(gem_fd, ahnd, reloc, &obj.offset),
+		.relocation_count = !ahnd ? 2 : 0,
 		.relocs_ptr = to_user_pointer(reloc),
 	};
 	struct drm_i915_gem_execbuffer2 eb = {
@@ -835,7 +879,7 @@ __sema_busy(int gem_fd, int pmu, const intel_ctx_t *ctx,
 
 	map = gem_mmap__wc(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
 	gem_execbuf(gem_fd, &eb);
-	spin = igt_spin_new(gem_fd, .ctx = ctx, .engine = e->flags);
+	spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 	/* Wait until the batch is executed and the semaphore is busy-waiting */
 	while (!READ_ONCE(*map) && gem_bo_busy(gem_fd, obj.handle))
@@ -880,6 +924,7 @@ sema_busy(int gem_fd, const intel_ctx_t *ctx,
 	  unsigned int flags)
 {
 	int fd[2];
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	igt_require(intel_gen(intel_get_drm_devid(gem_fd)) >= 8);
 
@@ -888,12 +933,13 @@ sema_busy(int gem_fd, const intel_ctx_t *ctx,
 	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance),
 			   fd[0]);
 
-	__sema_busy(gem_fd, fd[0], ctx, e, 50, 100);
-	__sema_busy(gem_fd, fd[0], ctx, e, 25, 50);
-	__sema_busy(gem_fd, fd[0], ctx, e, 75, 75);
+	__sema_busy(gem_fd, ahnd, fd[0], ctx, e, 50, 100);
+	__sema_busy(gem_fd, ahnd, fd[0], ctx, e, 25, 50);
+	__sema_busy(gem_fd, ahnd, fd[0], ctx, e, 75, 75);
 
 	close(fd[0]);
 	close(fd[1]);
+	put_ahnd(ahnd);
 }
 
 static void test_awake(int i915, const intel_ctx_t *ctx)
@@ -902,13 +948,14 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
 	unsigned long slept;
 	uint64_t val;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	fd = perf_i915_open(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
 	igt_skip_on(fd < 0);
 
 	/* Check that each engine is captured by the GT wakeref */
 	for_each_ctx_engine(i915, ctx, e) {
-		igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 		val = pmu_read_single(fd);
 		slept = measured_usleep(batch_duration_ns / 1000);
@@ -920,7 +967,7 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
 
 	/* And that the total GT wakeref matches walltime not summation */
 	for_each_ctx_engine(i915, ctx, e)
-		igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 	val = pmu_read_single(fd);
 	slept = measured_usleep(batch_duration_ns / 1000);
@@ -931,6 +978,7 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
 
 	igt_free_spins(i915);
 	close(fd);
+	put_ahnd(ahnd);
 }
 
 #define   MI_WAIT_FOR_PIPE_C_VBLANK (1<<21)
@@ -1147,6 +1195,7 @@ multi_client(int gem_fd, const intel_ctx_t *ctx,
 	uint64_t val[2], ts[2], perf_slept[2];
 	igt_spin_t *spin;
 	int fd[2];
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
 
 	gem_quiescent_gpu(gem_fd);
 
@@ -1159,7 +1208,7 @@ multi_client(int gem_fd, const intel_ctx_t *ctx,
 	 */
 	fd[1] = open_pmu(gem_fd, config);
 
-	spin = spin_sync(gem_fd, ctx, e);
+	spin = spin_sync(gem_fd, ahnd, ctx, e);
 
 	val[0] = val[1] = __pmu_read_single(fd[0], &ts[0]);
 	slept[1] = measured_usleep(batch_duration_ns / 1000);
@@ -1177,6 +1226,7 @@ multi_client(int gem_fd, const intel_ctx_t *ctx,
 	gem_sync(gem_fd, spin->handle);
 	igt_spin_free(gem_fd, spin);
 	close(fd[0]);
+	put_ahnd(ahnd);
 
 	assert_within_epsilon(val[0], perf_slept[0], tolerance);
 	assert_within_epsilon(val[1], perf_slept[1], tolerance);
@@ -1240,6 +1290,7 @@ static void cpu_hotplug(int gem_fd)
 	int fd, ret;
 	int cur = 0;
 	char buf;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
 
 	igt_require(cpu0_hotplug_support());
 
@@ -1250,8 +1301,10 @@ static void cpu_hotplug(int gem_fd)
 	 * Create two spinners so test can ensure shorter gaps in engine
 	 * busyness as it is terminating one and re-starting the other.
 	 */
-	spin[0] = igt_spin_new(gem_fd, .engine = I915_EXEC_DEFAULT);
-	spin[1] = __igt_spin_new(gem_fd, .engine = I915_EXEC_DEFAULT);
+	spin[0] = igt_spin_new(gem_fd, .ahnd = ahnd,
+			       .engine = I915_EXEC_DEFAULT);
+	spin[1] = __igt_spin_new(gem_fd, .ahnd = ahnd,
+				 .engine = I915_EXEC_DEFAULT);
 
 	val = __pmu_read_single(fd, &ts[0]);
 
@@ -1334,7 +1387,7 @@ static void cpu_hotplug(int gem_fd)
 			break;
 
 		igt_spin_free(gem_fd, spin[cur]);
-		spin[cur] = __igt_spin_new(gem_fd,
+		spin[cur] = __igt_spin_new(gem_fd, .ahnd = ahnd,
 					   .engine = I915_EXEC_DEFAULT);
 		cur ^= 1;
 	}
@@ -1348,6 +1401,7 @@ static void cpu_hotplug(int gem_fd)
 	igt_waitchildren();
 	close(fd);
 	close(link[0]);
+	put_ahnd(ahnd);
 
 	/* Skip if child signals a problem with offlining a CPU. */
 	igt_skip_on(buf == 's');
@@ -1372,6 +1426,7 @@ test_interrupts(int gem_fd)
 	uint64_t idle, busy;
 	int fence_fd;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
 
 	gem_quiescent_gpu(gem_fd);
 
@@ -1380,6 +1435,7 @@ test_interrupts(int gem_fd)
 	/* Queue spinning batches. */
 	for (int i = 0; i < target; i++) {
 		spin[i] = __igt_spin_new(gem_fd,
+					 .ahnd = ahnd,
 					 .engine = I915_EXEC_DEFAULT,
 					 .flags = IGT_SPIN_FENCE_OUT);
 		if (i == 0) {
@@ -1418,6 +1474,7 @@ test_interrupts(int gem_fd)
 	/* Free batches. */
 	for (int i = 0; i < target; i++)
 		igt_spin_free(gem_fd, spin[i]);
+	put_ahnd(ahnd);
 
 	/* Check at least as many interrupts has been generated. */
 	busy = pmu_read_single(fd) - idle;
@@ -1435,6 +1492,7 @@ test_interrupts_sync(int gem_fd)
 	struct pollfd pfd;
 	uint64_t idle, busy;
 	int fd;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
 
 	gem_quiescent_gpu(gem_fd);
 
@@ -1443,6 +1501,7 @@ test_interrupts_sync(int gem_fd)
 	/* Queue spinning batches. */
 	for (int i = 0; i < target; i++)
 		spin[i] = __igt_spin_new(gem_fd,
+					 .ahnd = ahnd,
 					 .flags = IGT_SPIN_FENCE_OUT);
 
 	/* Wait for idle state. */
@@ -1467,6 +1526,7 @@ test_interrupts_sync(int gem_fd)
 	/* Check at least as many interrupts has been generated. */
 	busy = pmu_read_single(fd) - idle;
 	close(fd);
+	put_ahnd(ahnd);
 
 	igt_assert_lte(target, busy);
 }
@@ -1479,6 +1539,7 @@ test_frequency(int gem_fd)
 	double min[2], max[2];
 	igt_spin_t *spin;
 	int fd[2], sysfs;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
 
 	sysfs = igt_sysfs_open(gem_fd);
 	igt_require(sysfs >= 0);
@@ -1506,7 +1567,7 @@ test_frequency(int gem_fd)
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
 
 	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
-	spin = spin_sync_flags(gem_fd, 0, I915_EXEC_DEFAULT);
+	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
 
 	slept = pmu_read_multi(fd[0], 2, start);
 	measured_usleep(batch_duration_ns / 1000);
@@ -1532,7 +1593,7 @@ test_frequency(int gem_fd)
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == max_freq);
 
 	gem_quiescent_gpu(gem_fd);
-	spin = spin_sync_flags(gem_fd, 0, I915_EXEC_DEFAULT);
+	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
 
 	slept = pmu_read_multi(fd[0], 2, start);
 	measured_usleep(batch_duration_ns / 1000);
@@ -1553,6 +1614,7 @@ test_frequency(int gem_fd)
 			 min_freq, igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
 	close(fd[0]);
 	close(fd[1]);
+	put_ahnd(ahnd);
 
 	igt_info("Min frequency: requested %.1f, actual %.1f\n",
 		 min[0], min[1]);
@@ -1839,9 +1901,13 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
 		};
 		uint64_t total_busy_ns = 0, total_ns = 0;
 		igt_spin_t *spin;
+		uint64_t ahnd;
+
+		intel_allocator_init();
+		ahnd = get_reloc_ahnd(gem_fd, 0);
 
 		/* Allocate our spin batch and idle it. */
-		spin = igt_spin_new(gem_fd, .ctx = ctx, .engine = e->flags);
+		spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 		igt_spin_end(spin);
 		gem_sync(gem_fd, spin->handle);
 
@@ -1912,6 +1978,7 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
 		}
 
 		igt_spin_free(gem_fd, spin);
+		put_ahnd(ahnd);
 	}
 
 	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
-- 
2.26.0
