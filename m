Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4C89F61
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:39:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id q25so10956343pfh.7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:39:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:38:46 -0500
Message-Id: <20210614163902.366168-12-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 61/77] tests/i915/sysfs: Convert to
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
 tests/i915/sysfs_heartbeat_interval.c | 40 ++++++++++-----------
 tests/i915/sysfs_preempt_timeout.c    | 39 ++++++++++----------
 tests/i915/sysfs_timeslice_duration.c | 51 +++++++++++++--------------
 3 files changed, 64 insertions(+), 66 deletions(-)

diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index b8aba2416..b70b653b1 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -132,13 +132,12 @@ static void set_unbannable(int i915, uint32_t ctx)
 	gem_context_set_param(i915, &p);
 }
 
-static uint32_t create_context(int i915, unsigned int class, unsigned int inst, int prio)
+static const intel_ctx_t *
+create_ctx(int i915, unsigned int class, unsigned int inst, int prio)
 {
-	uint32_t ctx;
-
-	ctx = gem_context_create_for_engine(i915, class, inst);
-	set_unbannable(i915, ctx);
-	gem_context_set_priority(i915, ctx, prio);
+	const intel_ctx_t *ctx = intel_ctx_create_for_engine(i915, class, inst);
+	set_unbannable(i915, ctx->id);
+	gem_context_set_priority(i915, ctx->id, prio);
 
 	return ctx;
 }
@@ -149,23 +148,23 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	struct timespec ts = {};
 	igt_spin_t *spin[2];
 	uint64_t elapsed;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
 	set_heartbeat(engine, timeout);
 
-	ctx[0] = create_context(i915, class, inst, 1023);
-	spin[0] = igt_spin_new(i915, ctx[0],
+	ctx[0] = create_ctx(i915, class, inst, 1023);
+	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx[1] = create_context(i915, class, inst, -1023);
+	ctx[1] = create_ctx(i915, class, inst, -1023);
 	igt_nsec_elapsed(&ts);
-	spin[1] = igt_spin_new(i915, ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[1]);
 	elapsed = igt_nsec_elapsed(&ts);
 
@@ -176,8 +175,8 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 
 	igt_spin_free(i915, spin[0]);
 
-	gem_context_destroy(i915, ctx[1]);
-	gem_context_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	intel_ctx_destroy(i915, ctx[0]);
 	gem_quiescent_gpu(i915);
 
 	return elapsed;
@@ -292,18 +291,18 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
 {
 	unsigned int class, inst;
 	unsigned long count = 0;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
-	ctx = create_context(i915, class, inst, 0);
+	ctx = create_ctx(i915, class, inst, 0);
 
 	while (!READ_ONCE(*ctl)) {
 		unsigned int elapsed;
 		igt_spin_t *spin;
 
-		spin = igt_spin_new(i915, ctx,
+		spin = igt_spin_new(i915, .ctx = ctx,
 				    .flags = (IGT_SPIN_NO_PREEMPTION |
 					      IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
@@ -331,7 +330,7 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
 		count++;
 	}
 
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 	igt_info("%s client completed %lu spins\n",
 		 expect < 0 ? "Bad" : "Good", count);
 }
@@ -414,7 +413,7 @@ static void test_off(int i915, int engine)
 	unsigned int class, inst;
 	unsigned int saved;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * Some other clients request that there is never any interruption
@@ -433,9 +432,9 @@ static void test_off(int i915, int engine)
 
 	set_heartbeat(engine, 0);
 
-	ctx = create_context(i915, class, inst, 0);
+	ctx = create_ctx(i915, class, inst, 0);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .flags = (IGT_SPIN_POLL_RUN |
 				      IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_FENCE_OUT));
@@ -455,6 +454,7 @@ static void test_off(int i915, int engine)
 
 	gem_quiescent_gpu(i915);
 	set_heartbeat(engine, saved);
+	intel_ctx_destroy(i915, ctx);
 }
 
 igt_main
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index 83a60436c..9f00093ea 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -126,13 +126,12 @@ static void set_unbannable(int i915, uint32_t ctx)
 	gem_context_set_param(i915, &p);
 }
 
-static uint32_t create_context(int i915, unsigned int class, unsigned int inst, int prio)
+static const intel_ctx_t *
+create_ctx(int i915, unsigned int class, unsigned int inst, int prio)
 {
-	uint32_t ctx;
-
-	ctx = gem_context_create_for_engine(i915, class, inst);
-	set_unbannable(i915, ctx);
-	gem_context_set_priority(i915, ctx, prio);
+	const intel_ctx_t *ctx = intel_ctx_create_for_engine(i915, class, inst);
+	set_unbannable(i915, ctx->id);
+	gem_context_set_priority(i915, ctx->id, prio);
 
 	return ctx;
 }
@@ -143,23 +142,23 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	struct timespec ts = {};
 	igt_spin_t *spin[2];
 	uint64_t elapsed;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
 	set_preempt_timeout(engine, timeout);
 
-	ctx[0] = create_context(i915, class, inst, -1023);
-	spin[0] = igt_spin_new(i915, ctx[0],
+	ctx[0] = create_ctx(i915, class, inst, -1023);
+	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx[1] = create_context(i915, class, inst, 1023);
+	ctx[1] = create_ctx(i915, class, inst, 1023);
 	igt_nsec_elapsed(&ts);
-	spin[1] = igt_spin_new(i915, ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[1]);
 	elapsed = igt_nsec_elapsed(&ts);
 
@@ -170,8 +169,8 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 
 	igt_spin_free(i915, spin[0]);
 
-	gem_context_destroy(i915, ctx[1]);
-	gem_context_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	intel_ctx_destroy(i915, ctx[0]);
 	gem_quiescent_gpu(i915);
 
 	return elapsed;
@@ -231,7 +230,7 @@ static void test_off(int i915, int engine)
 	unsigned int class, inst;
 	igt_spin_t *spin[2];
 	unsigned int saved;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	/*
 	 * We support setting the timeout to 0 to disable the reset on
@@ -252,15 +251,15 @@ static void test_off(int i915, int engine)
 
 	set_preempt_timeout(engine, 0);
 
-	ctx[0] = create_context(i915, class, inst, -1023);
-	spin[0] = igt_spin_new(i915, ctx[0],
+	ctx[0] = create_ctx(i915, class, inst, -1023);
+	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx[1] = create_context(i915, class, inst, 1023);
-	spin[1] = igt_spin_new(i915, ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	ctx[1] = create_ctx(i915, class, inst, 1023);
+	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
 
 	for (int i = 0; i < 150; i++) {
 		igt_assert_eq(sync_fence_status(spin[0]->out_fence), 0);
@@ -277,8 +276,8 @@ static void test_off(int i915, int engine)
 
 	igt_spin_free(i915, spin[0]);
 
-	gem_context_destroy(i915, ctx[1]);
-	gem_context_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	intel_ctx_destroy(i915, ctx[0]);
 
 	igt_assert(enable_hangcheck(i915, true));
 	gem_quiescent_gpu(i915);
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index 05ab79667..b73ee3889 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -138,13 +138,12 @@ static void set_unbannable(int i915, uint32_t ctx)
 	gem_context_set_param(i915, &p);
 }
 
-static uint32_t create_context(int i915, unsigned int class, unsigned int inst, int prio)
+static const intel_ctx_t *
+create_ctx(int i915, unsigned int class, unsigned int inst, int prio)
 {
-	uint32_t ctx;
-
-	ctx = gem_context_create_for_engine(i915, class, inst);
-	set_unbannable(i915, ctx);
-	gem_context_set_priority(i915, ctx, prio);
+	const intel_ctx_t *ctx = intel_ctx_create_for_engine(i915, class, inst);
+	set_unbannable(i915, ctx->id);
+	gem_context_set_priority(i915, ctx->id, prio);
 
 	return ctx;
 }
@@ -191,7 +190,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 	double duration = clockrate(i915);
 	unsigned int class, inst, mmio;
 	uint32_t *cs, *map;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 	int start;
 	int i;
 
@@ -204,8 +203,8 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 
 	set_timeslice(engine, timeout);
 
-	ctx[0] = create_context(i915, class, inst, 0);
-	ctx[1] = create_context(i915, class, inst, 0);
+	ctx[0] = create_ctx(i915, class, inst, 0);
+	ctx[1] = create_ctx(i915, class, inst, 0);
 
 	map = gem_mmap__device_coherent(i915, obj[2].handle,
 					0, 4096, PROT_WRITE);
@@ -260,10 +259,10 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 	igt_assert(cs - map < 4096 / sizeof(*cs));
 	munmap(map, 4096);
 
-	eb.rsvd1 = ctx[0];
+	eb.rsvd1 = ctx[0]->id;
 	gem_execbuf(i915, &eb);
 
-	eb.rsvd1 = ctx[1];
+	eb.rsvd1 = ctx[1]->id;
 	eb.batch_start_offset = start;
 	gem_execbuf(i915, &eb);
 
@@ -280,7 +279,7 @@ static uint64_t __test_duration(int i915, int engine, unsigned int timeout)
 	munmap(map, 4096);
 
 	for (i = 0; i < ARRAY_SIZE(ctx); i++)
-		gem_context_destroy(i915, ctx[i]);
+		intel_ctx_destroy(i915, ctx[i]);
 
 	for (i = 0; i < ARRAY_SIZE(obj); i++)
 		gem_close(i915, obj[i].handle);
@@ -371,23 +370,23 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 	struct timespec ts = {};
 	igt_spin_t *spin[2];
 	uint64_t elapsed;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
 	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
 
 	set_timeslice(engine, timeout);
 
-	ctx[0] = create_context(i915, class, inst, 0);
-	spin[0] = igt_spin_new(i915, ctx[0],
+	ctx[0] = create_ctx(i915, class, inst, 0);
+	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx[1] = create_context(i915, class, inst, 0);
+	ctx[1] = create_ctx(i915, class, inst, 0);
 	igt_nsec_elapsed(&ts);
-	spin[1] = igt_spin_new(i915, ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[1]);
 	elapsed = igt_nsec_elapsed(&ts);
 
@@ -398,8 +397,8 @@ static uint64_t __test_timeout(int i915, int engine, unsigned int timeout)
 
 	igt_spin_free(i915, spin[0]);
 
-	gem_context_destroy(i915, ctx[1]);
-	gem_context_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	intel_ctx_destroy(i915, ctx[0]);
 	gem_quiescent_gpu(i915);
 
 	return elapsed;
@@ -460,7 +459,7 @@ static void test_off(int i915, int engine)
 	unsigned int class, inst;
 	unsigned int saved;
 	igt_spin_t *spin[2];
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	/*
 	 * As always, there are some who must run uninterrupted and simply do
@@ -482,15 +481,15 @@ static void test_off(int i915, int engine)
 
 	set_timeslice(engine, 0);
 
-	ctx[0] = create_context(i915, class, inst, 0);
-	spin[0] = igt_spin_new(i915, ctx[0],
+	ctx[0] = create_ctx(i915, class, inst, 0);
+	spin[0] = igt_spin_new(i915, .ctx = ctx[0],
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx[1] = create_context(i915, class, inst, 0);
-	spin[1] = igt_spin_new(i915, ctx[1], .flags = IGT_SPIN_POLL_RUN);
+	ctx[1] = create_ctx(i915, class, inst, 0);
+	spin[1] = igt_spin_new(i915, .ctx = ctx[1], .flags = IGT_SPIN_POLL_RUN);
 
 	for (int i = 0; i < 150; i++) {
 		igt_assert_eq(sync_fence_status(spin[0]->out_fence), 0);
@@ -507,8 +506,8 @@ static void test_off(int i915, int engine)
 
 	igt_spin_free(i915, spin[0]);
 
-	gem_context_destroy(i915, ctx[1]);
-	gem_context_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	intel_ctx_destroy(i915, ctx[0]);
 
 	igt_assert(enable_hangcheck(i915, true));
 	gem_quiescent_gpu(i915);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
