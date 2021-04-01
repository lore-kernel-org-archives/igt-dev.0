Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5188FD4
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:16 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2226846pjh.1
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:29 -0500
Message-Id: <20210401021243.4147604-17-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 16/30] tests/i915/gem_exec_fair: Convert to
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

---
 tests/i915/gem_exec_fair.c | 99 ++++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 41 deletions(-)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index c1a71f77..f3a894c9 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -224,7 +224,7 @@ static void delay(int i915,
 }
 
 static struct drm_i915_gem_exec_object2
-delay_create(int i915, uint32_t ctx,
+delay_create(int i915, const intel_ctx_t *ctx,
 	     const struct intel_execution_engine2 *e,
 	     uint64_t target_ns)
 {
@@ -235,7 +235,7 @@ delay_create(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 
@@ -325,7 +325,8 @@ static void tslog(int i915,
 }
 
 static struct drm_i915_gem_exec_object2
-tslog_create(int i915, uint32_t ctx, const struct intel_execution_engine2 *e)
+tslog_create(int i915, const intel_ctx_t *ctx,
+	     const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = batch_create(i915),
@@ -334,7 +335,7 @@ tslog_create(int i915, uint32_t ctx, const struct intel_execution_engine2 *e)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 
@@ -361,7 +362,8 @@ static int cmp_u32(const void *A, const void *B)
 }
 
 static uint32_t
-read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
+read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
+		   const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -373,6 +375,7 @@ read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
@@ -414,23 +417,31 @@ read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
 	return ts;
 }
 
-static bool has_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
+static bool has_ctx_timestamp(int i915, const intel_ctx_cfg_t *cfg,
+			      const struct intel_execution_engine2 *e)
 {
 	const int gen = intel_gen(intel_get_drm_devid(i915));
+	intel_ctx_t *tmp_ctx;
+	uint32_t timestamp;
 
 	if (gen == 8 && e->class == I915_ENGINE_CLASS_VIDEO)
 		return false; /* looks fubar */
 
-	return read_ctx_timestamp(i915, e);
+	tmp_ctx = intel_ctx_create(i915, cfg);
+	timestamp = read_ctx_timestamp(i915, tmp_ctx, e);
+	intel_ctx_destroy(i915, tmp_ctx);
+
+	return timestamp;
 }
 
 static struct intel_execution_engine2
-pick_random_engine(int i915, const struct intel_execution_engine2 *not)
+pick_random_engine(int i915, const intel_ctx_cfg_t *cfg,
+		   const struct intel_execution_engine2 *not)
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int count = 0;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (e->flags == not->flags)
 			continue;
 		if (!gem_class_has_mutable_submission(i915, e->class))
@@ -441,7 +452,7 @@ pick_random_engine(int i915, const struct intel_execution_engine2 *not)
 		return *not;
 
 	count = rand() % count;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (e->flags == not->flags)
 			continue;
 		if (!gem_class_has_mutable_submission(i915, e->class))
@@ -453,7 +464,7 @@ pick_random_engine(int i915, const struct intel_execution_engine2 *not)
 	return *e;
 }
 
-static void fair_child(int i915, uint32_t ctx,
+static void fair_child(int i915, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint64_t frame_ns,
 		       int timeline,
@@ -494,7 +505,7 @@ static void fair_child(int i915, uint32_t ctx,
 
 	srandom(getpid());
 	if (flags & F_PING)
-		ping = pick_random_engine(i915, e);
+		ping = pick_random_engine(i915, &ctx->cfg, e);
 	obj[0] = tslog_create(i915, ctx, &ping);
 
 	/* Synchronize with other children/parent upon construction */
@@ -514,7 +525,7 @@ static void fair_child(int i915, uint32_t ctx,
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(obj),
 			.buffer_count = 3,
-			.rsvd1 = ctx,
+			.rsvd1 = ctx->id,
 			.rsvd2 = -1,
 			.flags = aux_flags,
 		};
@@ -636,7 +647,7 @@ static void timeline_advance(int timeline, int delay_ns)
 	sw_sync_timeline_inc(timeline, 1);
 }
 
-static void fairness(int i915,
+static void fairness(int i915, const intel_ctx_cfg_t *cfg,
 		     const struct intel_execution_engine2 *e,
 		     int duration, unsigned int flags)
 {
@@ -649,7 +660,7 @@ static void fairness(int i915,
 		int parent[2];
 	} lnk;
 
-	igt_require(has_ctx_timestamp(i915, e));
+	igt_require(has_ctx_timestamp(i915, cfg, e));
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
 	if (flags & (F_ISOLATE | F_PING))
 		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
@@ -713,12 +724,12 @@ static void fairness(int i915,
 		if (flags & F_PING) { /* fill the others with light bg load */
 			struct intel_execution_engine2 *ping;
 
-			__for_each_physical_engine(i915, ping) {
+			for_each_ctx_cfg_engine(i915, cfg, ping) {
 				if (ping->flags == e->flags)
 					continue;
 
 				igt_fork(child, 1) {
-					uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+					intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 
 					fair_child(i915, ctx, ping,
 						   child_ns / 8,
@@ -727,7 +738,7 @@ static void fairness(int i915,
 						   &result[nchild],
 						   NULL, NULL, -1, -1);
 
-					gem_context_destroy(i915, ctx);
+					intel_ctx_destroy(i915, ctx);
 				}
 			}
 		}
@@ -735,7 +746,7 @@ static void fairness(int i915,
 		getrusage(RUSAGE_CHILDREN, &old_usage);
 		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
 		igt_fork(child, nchild) {
-			uint32_t ctx;
+			intel_ctx_t *ctx;
 
 			if (flags & F_ISOLATE) {
 				int clone, dmabuf = -1;
@@ -751,10 +762,10 @@ static void fairness(int i915,
 					common = prime_fd_to_handle(i915, dmabuf);
 			}
 
-			ctx = gem_context_clone_with_engines(i915, 0);
+			ctx = intel_ctx_create(i915, cfg);
 
 			if (flags & F_VIP && child == 0) {
-				gem_context_set_priority(i915, ctx, 1023);
+				gem_context_set_priority(i915, ctx->id, 1023);
 				flags |= F_FLOW;
 			}
 			if (flags & F_RRUL && child == 0)
@@ -766,7 +777,7 @@ static void fairness(int i915,
 				   &result[child], &iqr[child],
 				   lnk.child[1], lnk.parent[0]);
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		{
@@ -911,7 +922,7 @@ static void fairness(int i915,
 }
 
 static void deadline_child(int i915,
-			   uint32_t ctx,
+			   const intel_ctx_t *ctx,
 			   const struct intel_execution_engine2 *e,
 			   uint32_t handle,
 			   int timeline,
@@ -931,7 +942,7 @@ static void deadline_child(int i915,
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = I915_EXEC_FENCE_OUT | e->flags,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	unsigned int seq = 1;
 	int prev = -1, next = -1;
@@ -976,11 +987,12 @@ static void deadline_child(int i915,
 	close(prev);
 }
 
-static struct intel_execution_engine2 pick_default(int i915)
+static struct intel_execution_engine2
+pick_default(int i915, const intel_ctx_cfg_t *cfg)
 {
 	const struct intel_execution_engine2 *e;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (!e->flags)
 			return *e;
 	}
@@ -988,11 +1000,12 @@ static struct intel_execution_engine2 pick_default(int i915)
 	return (struct intel_execution_engine2){};
 }
 
-static struct intel_execution_engine2 pick_engine(int i915, const char *name)
+static struct intel_execution_engine2
+pick_engine(int i915, const intel_ctx_cfg_t *cfg, const char *name)
 {
 	const struct intel_execution_engine2 *e;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (!strcmp(e->name, name))
 			return *e;
 	}
@@ -1029,15 +1042,16 @@ static uint64_t time_get_mono_ns(void)
 	return tv.tv_sec * NSEC64 + tv.tv_nsec;
 }
 
-static void deadline(int i915, int duration, unsigned int flags)
+static void deadline(int i915, const intel_ctx_cfg_t *cfg,
+		     int duration, unsigned int flags)
 {
 	const int64_t frame_ns = 33670 * 1000; /* 29.7fps */
 	const int64_t parent_ns = 400 * 1000;
 	const int64_t switch_ns = 50 * 1000;
 	const int64_t overhead_ns = /* estimate timeslicing overhead */
 		(frame_ns / 1000 / 1000 + 2) * switch_ns + parent_ns;
-	struct intel_execution_engine2 pe = pick_default(i915);
-	struct intel_execution_engine2 ve = pick_engine(i915, "vcs0");
+	struct intel_execution_engine2 pe = pick_default(i915, cfg);
+	struct intel_execution_engine2 ve = pick_engine(i915, cfg, "vcs0");
 	struct drm_i915_gem_exec_fence *fences = calloc(sizeof(*fences), 32);
 	struct drm_i915_gem_exec_object2 *obj = calloc(sizeof(*obj), 32);
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -1053,9 +1067,9 @@ static void deadline(int i915, int duration, unsigned int flags)
 	igt_require(has_syncobj(i915));
 	igt_require(has_fence_array(i915));
 	igt_require(has_mi_math(i915, &pe));
-	igt_require(has_ctx_timestamp(i915, &pe));
+	igt_require(has_ctx_timestamp(i915, cfg, &pe));
 	igt_require(has_mi_math(i915, &ve));
-	igt_require(has_ctx_timestamp(i915, &ve));
+	igt_require(has_ctx_timestamp(i915, cfg, &ve));
 	igt_assert(obj && fences);
 	if (flags & DL_PRIO)
 		igt_require(gem_scheduler_has_preemption(i915));
@@ -1092,7 +1106,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 
 		*ctl = 0;
 		igt_fork(child, num_children) {
-			uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+			intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 
 			deadline_child(i915, ctx, &ve, obj[child + 1].handle,
 				       timeline, child_ns,
@@ -1100,7 +1114,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 				       link[child].parent[0],
 				       ctl, flags);
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		for (int i = 0; i < num_children; i++)
@@ -1281,6 +1295,7 @@ igt_main
 		{}
 	};
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	int i915 = -1;
 
 	igt_fixture {
@@ -1296,6 +1311,8 @@ igt_main
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(gem_scheduler_has_ctx_priority(i915));
 
+		cfg = intel_ctx_cfg_all_physical(i915);
+
 		igt_info("CS timestamp frequency: %d\n",
 			 read_timestamp_frequency(i915));
 		igt_require(has_mi_math(i915, NULL));
@@ -1309,7 +1326,7 @@ igt_main
 			continue;
 
 		igt_subtest_with_dynamic_f("basic-%s", f->name)  {
-			__for_each_physical_engine(i915, e) {
+			for_each_ctx_cfg_engine(i915, &cfg, e) {
 				if (!has_mi_math(i915, e))
 					continue;
 
@@ -1320,19 +1337,19 @@ igt_main
 					continue;
 
 				igt_dynamic_f("%s", e->name)
-					fairness(i915, e, 1, f->flags);
+					fairness(i915, &cfg, e, 1, f->flags);
 			}
 		}
 	}
 
 	igt_subtest("basic-deadline")
-		deadline(i915, 2, 0);
+		deadline(i915, &cfg, 2, 0);
 	igt_subtest("deadline-prio")
-		deadline(i915, 2, DL_PRIO);
+		deadline(i915, &cfg, 2, DL_PRIO);
 
 	for (typeof(*fair) *f = fair; f->name; f++) {
 		igt_subtest_with_dynamic_f("fair-%s", f->name)  {
-			__for_each_physical_engine(i915, e) {
+			for_each_ctx_cfg_engine(i915, &cfg, e) {
 				if (!has_mi_math(i915, e))
 					continue;
 
@@ -1343,7 +1360,7 @@ igt_main
 					continue;
 
 				igt_dynamic_f("%s", e->name)
-					fairness(i915, e, 5, f->flags);
+					fairness(i915, &cfg, e, 5, f->flags);
 			}
 		}
 	}
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
