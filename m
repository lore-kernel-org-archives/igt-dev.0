Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D666EA19
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:37:20 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso1889010pjb.0
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:37:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:36:11 -0500
Message-Id: <20210609173632.248880-29-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 28/93] tests/i915/gem_exec_fair: Convert to
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
 tests/i915/gem_exec_fair.c | 112 +++++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 47 deletions(-)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 628f4df2..7b53cc1f 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -225,7 +225,7 @@ static void delay(int i915,
 }
 
 static struct drm_i915_gem_exec_object2
-delay_create(int i915, uint32_t ctx,
+delay_create(int i915, const intel_ctx_t *ctx,
 	     const struct intel_execution_engine2 *e,
 	     uint64_t target_ns)
 {
@@ -236,7 +236,7 @@ delay_create(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 
@@ -326,7 +326,8 @@ static void tslog(int i915,
 }
 
 static struct drm_i915_gem_exec_object2
-tslog_create(int i915, uint32_t ctx, const struct intel_execution_engine2 *e)
+tslog_create(int i915, const intel_ctx_t *ctx,
+	     const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = batch_create(i915),
@@ -335,7 +336,7 @@ tslog_create(int i915, uint32_t ctx, const struct intel_execution_engine2 *e)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 
@@ -362,7 +363,8 @@ static int cmp_u32(const void *A, const void *B)
 }
 
 static uint32_t
-read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
+read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
+		   const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -374,6 +376,7 @@ read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
+		.rsvd1 = ctx->id,
 		.flags = e->flags,
 	};
 	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
@@ -415,23 +418,31 @@ read_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
 	return ts;
 }
 
-static bool has_ctx_timestamp(int i915, const struct intel_execution_engine2 *e)
+static bool has_ctx_timestamp(int i915, const intel_ctx_cfg_t *cfg,
+			      const struct intel_execution_engine2 *e)
 {
 	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const intel_ctx_t *tmp_ctx;
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
@@ -442,7 +453,7 @@ pick_random_engine(int i915, const struct intel_execution_engine2 *not)
 		return *not;
 
 	count = rand() % count;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (e->flags == not->flags)
 			continue;
 		if (!gem_class_has_mutable_submission(i915, e->class))
@@ -454,7 +465,7 @@ pick_random_engine(int i915, const struct intel_execution_engine2 *not)
 	return *e;
 }
 
-static void fair_child(int i915, uint32_t ctx,
+static void fair_child(int i915, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint64_t frame_ns,
 		       int timeline,
@@ -495,7 +506,7 @@ static void fair_child(int i915, uint32_t ctx,
 
 	srandom(getpid());
 	if (flags & F_PING)
-		ping = pick_random_engine(i915, e);
+		ping = pick_random_engine(i915, &ctx->cfg, e);
 	obj[0] = tslog_create(i915, ctx, &ping);
 
 	/* Synchronize with other children/parent upon construction */
@@ -515,7 +526,7 @@ static void fair_child(int i915, uint32_t ctx,
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(obj),
 			.buffer_count = 3,
-			.rsvd1 = ctx,
+			.rsvd1 = ctx->id,
 			.rsvd2 = -1,
 			.flags = aux_flags,
 		};
@@ -637,7 +648,7 @@ static void timeline_advance(int timeline, int delay_ns)
 	sw_sync_timeline_inc(timeline, 1);
 }
 
-static void fairness(int i915,
+static void fairness(int i915, const intel_ctx_cfg_t *cfg,
 		     const struct intel_execution_engine2 *e,
 		     int duration, unsigned int flags)
 {
@@ -650,7 +661,7 @@ static void fairness(int i915,
 		int parent[2];
 	} lnk;
 
-	igt_require(has_ctx_timestamp(i915, e));
+	igt_require(has_ctx_timestamp(i915, cfg, e));
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
 	if (flags & (F_ISOLATE | F_PING))
 		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
@@ -714,12 +725,12 @@ static void fairness(int i915,
 		if (flags & F_PING) { /* fill the others with light bg load */
 			struct intel_execution_engine2 *ping;
 
-			__for_each_physical_engine(i915, ping) {
+			for_each_ctx_cfg_engine(i915, cfg, ping) {
 				if (ping->flags == e->flags)
 					continue;
 
 				igt_fork(child, 1) {
-					uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+					const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 
 					fair_child(i915, ctx, ping,
 						   child_ns / 8,
@@ -728,7 +739,7 @@ static void fairness(int i915,
 						   &result[nchild],
 						   NULL, NULL, -1, -1);
 
-					gem_context_destroy(i915, ctx);
+					intel_ctx_destroy(i915, ctx);
 				}
 			}
 		}
@@ -736,26 +747,24 @@ static void fairness(int i915,
 		getrusage(RUSAGE_CHILDREN, &old_usage);
 		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
 		igt_fork(child, nchild) {
-			uint32_t ctx;
+			const intel_ctx_t *ctx;
 
 			if (flags & F_ISOLATE) {
-				int clone, dmabuf = -1;
+				int dmabuf = -1;
 
 				if (common)
 					dmabuf = prime_handle_to_fd(i915, common);
 
-				clone = gem_reopen_driver(i915);
-				gem_context_copy_engines(i915, 0, clone, 0);
-				i915 = clone;
+				i915 = gem_reopen_driver(i915);
 
 				if (dmabuf != -1)
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
@@ -767,7 +776,7 @@ static void fairness(int i915,
 				   &result[child], &iqr[child],
 				   lnk.child[1], lnk.parent[0]);
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		{
@@ -912,7 +921,7 @@ static void fairness(int i915,
 }
 
 static void deadline_child(int i915,
-			   uint32_t ctx,
+			   const intel_ctx_t *ctx,
 			   const struct intel_execution_engine2 *e,
 			   uint32_t handle,
 			   int timeline,
@@ -932,7 +941,7 @@ static void deadline_child(int i915,
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = I915_EXEC_FENCE_OUT | e->flags,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	unsigned int seq = 1;
 	int prev = -1, next = -1;
@@ -977,11 +986,12 @@ static void deadline_child(int i915,
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
@@ -989,11 +999,12 @@ static struct intel_execution_engine2 pick_default(int i915)
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
@@ -1030,15 +1041,16 @@ static uint64_t time_get_mono_ns(void)
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
@@ -1049,14 +1061,15 @@ static void deadline(int i915, int duration, unsigned int flags)
 			I915_EXEC_FENCE_ARRAY |
 			I915_EXEC_FENCE_OUT
 	};
+	const intel_ctx_t *delay_ctx;
 	int *ctl;
 
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
@@ -1064,9 +1077,10 @@ static void deadline(int i915, int duration, unsigned int flags)
 	ctl = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(ctl != MAP_FAILED);
 
-	obj[0] = delay_create(i915, 0, &pe, parent_ns);
+	delay_ctx = intel_ctx_create(i915, cfg);
+	obj[0] = delay_create(i915, delay_ctx, &pe, parent_ns);
 	if (flags & DL_PRIO)
-		gem_context_set_priority(i915, 0, 1023);
+		gem_context_set_priority(i915, delay_ctx->id, 1023);
 	if (intel_gen(intel_get_drm_devid(i915)) < 8)
 		execbuf.flags |= I915_EXEC_SECURE;
 	for (int n = 1; n <= 5; n++) {
@@ -1093,7 +1107,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 
 		*ctl = 0;
 		igt_fork(child, num_children) {
-			uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+			const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 
 			deadline_child(i915, ctx, &ve, obj[child + 1].handle,
 				       timeline, child_ns,
@@ -1101,7 +1115,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 				       link[child].parent[0],
 				       ctl, flags);
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		for (int i = 0; i < num_children; i++)
@@ -1175,6 +1189,7 @@ static void deadline(int i915, int duration, unsigned int flags)
 		gem_quiescent_gpu(i915);
 	}
 
+	intel_ctx_destroy(i915, delay_ctx);
 	gem_close(i915, obj[0].handle);
 	free(obj);
 	free(fences);
@@ -1282,6 +1297,7 @@ igt_main
 		{}
 	};
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	int i915 = -1;
 
 	igt_fixture {
@@ -1297,6 +1313,8 @@ igt_main
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(gem_scheduler_has_ctx_priority(i915));
 
+		cfg = intel_ctx_cfg_all_physical(i915);
+
 		igt_info("CS timestamp frequency: %d\n",
 			 read_timestamp_frequency(i915));
 		igt_require(has_mi_math(i915, NULL));
@@ -1310,7 +1328,7 @@ igt_main
 			continue;
 
 		igt_subtest_with_dynamic_f("basic-%s", f->name)  {
-			__for_each_physical_engine(i915, e) {
+			for_each_ctx_cfg_engine(i915, &cfg, e) {
 				if (!has_mi_math(i915, e))
 					continue;
 
@@ -1321,19 +1339,19 @@ igt_main
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
 
@@ -1344,7 +1362,7 @@ igt_main
 					continue;
 
 				igt_dynamic_f("%s", e->name)
-					fairness(i915, e, 5, f->flags);
+					fairness(i915, &cfg, e, 5, f->flags);
 			}
 		}
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
