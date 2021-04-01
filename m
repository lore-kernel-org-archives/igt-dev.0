Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667F66EC16
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:34 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3940950pjb.1
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:34 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:40 -0500
Message-Id: <20210401021243.4147604-28-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 27/30] tests/i915/gem_sync: Convert to intel_ctx_t
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
 tests/i915/gem_sync.c | 162 ++++++++++++++++++++++++------------------
 1 file changed, 93 insertions(+), 69 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 58781a5e..39a90587 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -96,38 +96,33 @@ filter_engines_can_store_dword(int fd, struct intel_engine_data *ied)
 	ied->nengines = count;
 }
 
-static struct intel_engine_data list_store_engines(int fd, unsigned ring)
+static struct intel_engine_data
+list_engines(int fd, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct intel_engine_data ied = { };
 
 	if (ring == ALL_ENGINES) {
-		ied = intel_init_engine_list(fd, 0);
-		filter_engines_can_store_dword(fd, &ied);
+		ied = intel_engine_list_for_ctx_cfg(fd, &ctx->cfg);
+	} else if (ctx->cfg.num_engines) {
+		igt_assert(ring < ctx->cfg.num_engines);
+		ied.engines[ied.nengines].flags = ring;
+		strcpy(ied.engines[ied.nengines].name, " ");
+		ied.nengines++;
 	} else {
-		if (gem_has_ring(fd, ring) && gem_can_store_dword(fd, ring)) {
-			ied.engines[ied.nengines].flags = ring;
-			strcpy(ied.engines[ied.nengines].name, " ");
-			ied.nengines++;
-		}
+		igt_assert(gem_has_ring(fd, ring));
+		ied.engines[ied.nengines].flags = ring;
+		strcpy(ied.engines[ied.nengines].name, " ");
+		ied.nengines++;
 	}
 
 	return ied;
 }
 
-static struct intel_engine_data list_engines(int fd, unsigned ring)
+static struct intel_engine_data
+list_store_engines(int fd, const intel_ctx_t *ctx, unsigned ring)
 {
-	struct intel_engine_data ied = { };
-
-	if (ring == ALL_ENGINES) {
-		ied = intel_init_engine_list(fd, 0);
-	} else {
-		if (gem_has_ring(fd, ring)) {
-			ied.engines[ied.nengines].flags = ring;
-			strcpy(ied.engines[ied.nengines].name, " ");
-			ied.nengines++;
-		}
-	}
-
+	struct intel_engine_data ied = list_engines(fd, ctx, ring);
+	filter_engines_can_store_dword(fd, &ied);
 	return ied;
 }
 
@@ -149,11 +144,12 @@ static void xchg_engine(void *array, unsigned i, unsigned j)
 }
 
 static void
-sync_ring(int fd, unsigned ring, int num_children, int timeout)
+sync_ring(int fd, const intel_ctx_t *ctx,
+	  unsigned ring, int num_children, int timeout)
 {
 	struct intel_engine_data ied;
 
-	ied = list_engines(fd, ring);
+	ied = list_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 	num_children *= ied.nengines;
 
@@ -173,6 +169,7 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = ied_flags(&ied, child);
+		execbuf.rsvd1 = ctx->id;
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, object.handle);
 
@@ -195,7 +192,8 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
 }
 
 static void
-idle_ring(int fd, unsigned int ring, int num_children, int timeout)
+idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
+	  int num_children, int timeout)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 object;
@@ -213,6 +211,7 @@ idle_ring(int fd, unsigned int ring, int num_children, int timeout)
 	execbuf.buffers_ptr = to_user_pointer(&object);
 	execbuf.buffer_count = 1;
 	execbuf.flags = ring;
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_sync(fd, object.handle);
 
@@ -234,11 +233,12 @@ idle_ring(int fd, unsigned int ring, int num_children, int timeout)
 }
 
 static void
-wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
+wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
+	    int timeout, int wlen)
 {
 	struct intel_engine_data ied;
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -258,8 +258,10 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = ied_flags(&ied, child);
+		execbuf.rsvd1 = ctx->id;
 
 		spin = __igt_spin_new(fd,
+				      .ctx = ctx,
 				      .engine = execbuf.flags,
 				      .flags = (IGT_SPIN_POLL_RUN |
 						IGT_SPIN_FAST));
@@ -326,12 +328,12 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-static void active_ring(int fd, unsigned int ring,
+static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 			int num_children, int timeout)
 {
 	struct intel_engine_data ied;
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -341,10 +343,12 @@ static void active_ring(int fd, unsigned int ring,
 		igt_spin_t *spin[2];
 
 		spin[0] = __igt_spin_new(fd,
+					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
 
 		spin[1] = __igt_spin_new(fd,
+					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
 
@@ -376,11 +380,12 @@ static void active_ring(int fd, unsigned int ring,
 }
 
 static void
-active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
+active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
+		   int timeout, int wlen)
 {
 	struct intel_engine_data ied;
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -400,6 +405,7 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = ied_flags(&ied, child);
+		execbuf.rsvd1 = ctx->id;
 
 		spin[0] = __igt_spin_new(fd,
 					 .engine = execbuf.flags,
@@ -490,12 +496,13 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
 }
 
 static void
-store_ring(int fd, unsigned ring, int num_children, int timeout)
+store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
+	   int num_children, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 	num_children *= ied.nengines;
 
@@ -516,6 +523,7 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 		execbuf.flags |= I915_EXEC_HANDLE_LUT;
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
+		execbuf.rsvd1 = ctx->id;
 
 		memset(object, 0, sizeof(object));
 		object[0].handle = gem_create(fd, 4096);
@@ -586,14 +594,15 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
 }
 
 static void
-switch_ring(int fd, unsigned ring, int num_children, int timeout)
+switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
+	    int num_children, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 
 	gem_require_contexts(fd);
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 	num_children *= ied.nengines;
 
@@ -603,6 +612,7 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			struct drm_i915_gem_exec_object2 object[2];
 			struct drm_i915_gem_relocation_entry reloc[1024];
 			struct drm_i915_gem_execbuffer2 execbuf;
+			intel_ctx_t *ctx;
 		} contexts[2];
 		double elapsed, baseline;
 		unsigned long cycles;
@@ -620,7 +630,9 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 			c->execbuf.flags |= I915_EXEC_HANDLE_LUT;
 			if (gen < 6)
 				c->execbuf.flags |= I915_EXEC_SECURE;
-			c->execbuf.rsvd1 = gem_context_create(fd);
+
+			c->ctx = intel_ctx_create(fd, &ctx->cfg);
+			c->execbuf.rsvd1 = c->ctx->id;
 
 			memset(c->object, 0, sizeof(c->object));
 			c->object[0].handle = gem_create(fd, 4096);
@@ -716,7 +728,7 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
 			gem_close(fd, contexts[i].object[1].handle);
 			gem_close(fd, contexts[i].object[0].handle);
-			gem_context_destroy(fd, contexts[i].execbuf.rsvd1);
+			intel_ctx_destroy(fd, contexts[i].ctx);
 		}
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
@@ -765,7 +777,8 @@ static void *waiter(void *arg)
 }
 
 static void
-__store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
+__store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
+	     int timeout, unsigned long *cycles)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -784,6 +797,7 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(object, 0, sizeof(object));
 	object[0].handle = gem_create(fd, 4096);
@@ -893,7 +907,8 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
 }
 
 static void
-store_many(int fd, unsigned int ring, int num_children, int timeout)
+store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
+	   int num_children, int timeout)
 {
 	struct intel_engine_data ied;
 	unsigned long *shared;
@@ -901,14 +916,14 @@ store_many(int fd, unsigned int ring, int num_children, int timeout)
 	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	ied = list_store_engines(fd, ring);
+	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	for (int n = 0; n < ied.nengines; n++) {
 		igt_fork(child, 1)
-			__store_many(fd,
+			__store_many(fd, ctx,
 				     ied_flags(&ied, n),
 				     timeout,
 				     &shared[n]);
@@ -924,11 +939,11 @@ store_many(int fd, unsigned int ring, int num_children, int timeout)
 }
 
 static void
-sync_all(int fd, int num_children, int timeout)
+sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 {
 	struct intel_engine_data ied;
 
-	ied = list_engines(fd, ALL_ENGINES);
+	ied = list_engines(fd, ctx, ALL_ENGINES);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -946,6 +961,7 @@ sync_all(int fd, int num_children, int timeout)
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
+		execbuf.rsvd1 = ctx->id;
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, object.handle);
 
@@ -970,12 +986,12 @@ sync_all(int fd, int num_children, int timeout)
 }
 
 static void
-store_all(int fd, int num_children, int timeout)
+store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
 
-	ied = list_store_engines(fd, ALL_ENGINES);
+	ied = list_store_engines(fd, ctx, ALL_ENGINES);
 	igt_require(ied.nengines);
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -994,6 +1010,7 @@ store_all(int fd, int num_children, int timeout)
 		execbuf.flags |= I915_EXEC_HANDLE_LUT;
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
+		execbuf.rsvd1 = ctx->id;
 
 		memset(object, 0, sizeof(object));
 		object[0].handle = gem_create(fd, 4096);
@@ -1069,20 +1086,21 @@ store_all(int fd, int num_children, int timeout)
 }
 
 static void
-preempt(int fd, unsigned ring, int num_children, int timeout)
+preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
+	int num_children, int timeout)
 {
 	struct intel_engine_data ied;
-	uint32_t ctx[2];
+	intel_ctx_t *tmp_ctx[2];
 
-	ied = list_engines(fd, ALL_ENGINES);
+	ied = list_engines(fd, ctx, ALL_ENGINES);
 	igt_require(ied.nengines);
 	num_children *= ied.nengines;
 
-	ctx[0] = gem_context_create(fd);
-	gem_context_set_priority(fd, ctx[0], MIN_PRIO);
+	tmp_ctx[0] = intel_ctx_create(fd, &ctx->cfg);
+	gem_context_set_priority(fd, tmp_ctx[0]->id, MIN_PRIO);
 
-	ctx[1] = gem_context_create(fd);
-	gem_context_set_priority(fd, ctx[1], MAX_PRIO);
+	tmp_ctx[1] = intel_ctx_create(fd, &ctx->cfg);
+	gem_context_set_priority(fd, tmp_ctx[1]->id, MAX_PRIO);
 
 	intel_detect_and_clear_missed_interrupts(fd);
 	igt_fork(child, num_children) {
@@ -1100,7 +1118,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
 		execbuf.flags = ied_flags(&ied, child);
-		execbuf.rsvd1 = ctx[1];
+		execbuf.rsvd1 = tmp_ctx[1]->id;
 		gem_execbuf(fd, &execbuf);
 		gem_sync(fd, object.handle);
 
@@ -1109,7 +1127,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 		do {
 			igt_spin_t *spin =
 				__igt_spin_new(fd,
-					       .ctx_id = ctx[0],
+					       .ctx = tmp_ctx[0],
 					       .engine = execbuf.flags);
 
 			do {
@@ -1128,8 +1146,8 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
-	gem_context_destroy(fd, ctx[1]);
-	gem_context_destroy(fd, ctx[0]);
+	intel_ctx_destroy(fd, tmp_ctx[1]);
+	intel_ctx_destroy(fd, tmp_ctx[0]);
 }
 
 igt_main
@@ -1137,7 +1155,7 @@ igt_main
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct {
 		const char *name;
-		void (*func)(int fd, unsigned int engine,
+		void (*func)(int fd, const intel_ctx_t *ctx, unsigned int engine,
 			     int num_children, int timeout);
 		int num_children;
 		int timeout;
@@ -1172,6 +1190,7 @@ igt_main
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int fd = -1;
 
 	igt_fixture {
@@ -1180,6 +1199,11 @@ igt_main
 		gem_submission_print_method(fd);
 		gem_scheduler_print_capability(fd);
 
+		if (gem_has_contexts(fd))
+			ctx = intel_ctx_create_all_physical(fd);
+		else
+			ctx = intel_ctx_0(fd);
+
 		igt_fork_hang_detector(fd);
 	}
 
@@ -1188,7 +1212,7 @@ igt_main
 		igt_subtest_with_dynamic_f("%s", t->name) {
 			for (const struct intel_execution_ring *l = intel_execution_rings; l->name; l++) {
 				igt_dynamic_f("%s", l->name) {
-					t->func(fd, eb_ring(l),
+					t->func(fd, intel_ctx_0(fd), eb_ring(l),
 						t->num_children, t->timeout);
 				}
 			}
@@ -1196,30 +1220,30 @@ igt_main
 	}
 
 	igt_subtest("basic-all")
-		sync_all(fd, 1, 2);
+		sync_all(fd, ctx, 1, 2);
 	igt_subtest("basic-store-all")
-		store_all(fd, 1, 2);
+		store_all(fd, ctx, 1, 2);
 
 	igt_subtest("all")
-		sync_all(fd, 1, 20);
+		sync_all(fd, ctx, 1, 20);
 	igt_subtest("store-all")
-		store_all(fd, 1, 20);
+		store_all(fd, ctx, 1, 20);
 	igt_subtest("forked-all")
-		sync_all(fd, ncpus, 20);
+		sync_all(fd, ctx, ncpus, 20);
 	igt_subtest("forked-store-all")
-		store_all(fd, ncpus, 20);
+		store_all(fd, ctx, ncpus, 20);
 
 	for_each_test(t, all) {
 		igt_subtest_f("%s", t->name)
-			t->func(fd, ALL_ENGINES, t->num_children, t->timeout);
+			t->func(fd, ctx, ALL_ENGINES, t->num_children, t->timeout);
 	}
 
 	/* New way of selecting engines. */
 	for_each_test(t, individual) {
 		igt_subtest_with_dynamic_f("%s", t->name) {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s", e->name) {
-					t->func(fd, e->flags,
+					t->func(fd, ctx, e->flags,
 						t->num_children, t->timeout);
 				}
 			}
@@ -1234,11 +1258,11 @@ igt_main
 		}
 
 		igt_subtest("preempt-all")
-			preempt(fd, ALL_ENGINES, 1, 20);
+			preempt(fd, ctx, ALL_ENGINES, 1, 20);
 		igt_subtest_with_dynamic("preempt") {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					preempt(fd, e->flags, ncpus, 20);
+					preempt(fd, ctx, e->flags, ncpus, 20);
 			}
 		}
 	}
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
