Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4289B0C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:05:28 +0200
Message-Id: <20210809130533.27759-61-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 60/65] WIP: tests/gem_ctx_persistence:
 Adopt to use allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 120 ++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index c6db06b8b..fafd8bb26 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -43,6 +43,7 @@
 #include "igt_sysfs.h"
 #include "igt_params.h"
 #include "ioctl_wrappers.h" /* gem_wait()! */
+#include "intel_allocator.h"
 #include "sw_sync.h"
 
 #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
@@ -161,6 +162,7 @@ static void test_persistence(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin;
 	int64_t timeout;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * Default behaviour are contexts remain alive until their last active
@@ -168,8 +170,9 @@ static void test_persistence(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = ctx_create_persistence(i915, cfg, true);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
 	intel_ctx_destroy(i915, ctx);
@@ -184,6 +187,7 @@ static void test_persistence(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(sync_fence_status(spin->out_fence), 1);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_nonpersistent_cleanup(int i915, const intel_ctx_cfg_t *cfg,
@@ -192,6 +196,7 @@ static void test_nonpersistent_cleanup(int i915, const intel_ctx_cfg_t *cfg,
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * A nonpersistent context is terminated immediately upon closure,
@@ -199,8 +204,9 @@ static void test_nonpersistent_cleanup(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = ctx_create_persistence(i915, cfg, false);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
 	intel_ctx_destroy(i915, ctx);
@@ -209,6 +215,7 @@ static void test_nonpersistent_cleanup(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_nonpersistent_mixed(int i915, const intel_ctx_cfg_t *cfg,
@@ -225,15 +232,18 @@ static void test_nonpersistent_mixed(int i915, const intel_ctx_cfg_t *cfg,
 	for (int i = 0; i < ARRAY_SIZE(fence); i++) {
 		igt_spin_t *spin;
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
 
 		ctx = ctx_create_persistence(i915, cfg, i & 1);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 
-		spin = igt_spin_new(i915, .ctx = ctx,
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .engine = engine,
 				    .flags = IGT_SPIN_FENCE_OUT);
 		intel_ctx_destroy(i915, ctx);
 
 		fence[i] = spin->out_fence;
+		put_ahnd(ahnd);
 	}
 
 	/* Outer pair of contexts were non-persistent and killed */
@@ -250,6 +260,7 @@ static void test_nonpersistent_hostile(int i915, const intel_ctx_cfg_t *cfg,
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * If we cannot cleanly cancel the non-persistent context on closure,
@@ -258,8 +269,9 @@ static void test_nonpersistent_hostile(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = ctx_create_persistence(i915, cfg, false);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
 	intel_ctx_destroy(i915, ctx);
@@ -267,6 +279,7 @@ static void test_nonpersistent_hostile(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *cfg,
@@ -275,6 +288,7 @@ static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin[2];
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * Double plus ungood.
@@ -289,7 +303,8 @@ static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *
 
 	ctx = ctx_create_persistence(i915, cfg, true);
 	gem_context_set_priority(i915, ctx->id, 0);
-	spin[0] = igt_spin_new(i915, .ctx = ctx,
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	spin[0] = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			       .engine = engine,
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN));
@@ -299,7 +314,7 @@ static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *
 
 	ctx = ctx_create_persistence(i915, cfg, false);
 	gem_context_set_priority(i915, ctx->id, 1); /* higher priority than 0 */
-	spin[1] = igt_spin_new(i915, .ctx = ctx,
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			       .engine = engine,
 			       .flags = IGT_SPIN_NO_PREEMPTION);
 	intel_ctx_destroy(i915, ctx);
@@ -308,6 +323,7 @@ static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *
 
 	igt_spin_free(i915, spin[1]);
 	igt_spin_free(i915, spin[0]);
+	put_ahnd(ahnd);
 }
 
 static void test_nonpersistent_hang(int i915, const intel_ctx_cfg_t *cfg,
@@ -316,15 +332,16 @@ static void test_nonpersistent_hang(int i915, const intel_ctx_cfg_t *cfg,
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
-
+	uint64_t ahnd;
 	/*
 	 * The user made a simple mistake and submitted an invalid batch,
 	 * but fortunately under a nonpersistent context. Do we detect it?
 	 */
 
 	ctx = ctx_create_persistence(i915, cfg, false);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_INVALID_CS);
 	intel_ctx_destroy(i915, ctx);
@@ -332,6 +349,7 @@ static void test_nonpersistent_hang(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
@@ -354,9 +372,10 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 	for_each_ctx_cfg_engine(i915, cfg, e) {
 		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
+		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 		igt_spin_t *spin;
 
-		spin = igt_spin_new(i915, .ctx = ctx,
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .engine = e->flags,
 				    .flags = IGT_SPIN_NO_PREEMPTION);
 		intel_ctx_destroy(i915, ctx);
@@ -364,6 +383,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 		igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 	}
 
 	igt_require(__enable_hangcheck(dir, true));
@@ -398,12 +418,14 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 		const intel_ctx_t *ctx;
 		igt_spin_t *spin;
+		uint64_t ahnd;
 
 		if (!gem_engine_has_cmdparser(i915, cfg, e->flags))
 			continue;
 
 		ctx = intel_ctx_create(i915, cfg);
-		spin = igt_spin_new(i915, .ctx = ctx,
+		ahnd = get_reloc_ahnd(i915, ctx->id);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .engine = e->flags,
 				    .flags = IGT_SPIN_INVALID_CS);
 		intel_ctx_destroy(i915, ctx);
@@ -411,6 +433,7 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 		igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 	}
 
 	igt_require(__enable_hangcheck(dir, true));
@@ -468,6 +491,7 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 
 	for_each_physical_ring(e, i915) {
 		igt_spin_t *spin[count];
+		uint64_t ahnd;
 
 		if (!set_preempt_timeout(i915, e->full_name, 250))
 			continue;
@@ -481,8 +505,8 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 			const intel_ctx_t *ctx;
 
 			ctx = intel_ctx_create(i915, NULL);
-
-			spin[n] = igt_spin_new(i915, .ctx = ctx,
+			ahnd = get_reloc_ahnd(i915, ctx->id);
+			spin[n] = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 					       .engine = eb_ring(e),
 					       .flags = (IGT_SPIN_FENCE_OUT |
 							 IGT_SPIN_POLL_RUN |
@@ -499,8 +523,11 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 				      -EIO);
 		}
 
-		for (int n = 0; n < ARRAY_SIZE(spin); n++)
+		for (int n = 0; n < ARRAY_SIZE(spin); n++) {
+			ahnd = spin[n]->ahnd;
 			igt_spin_free(i915, spin[n]);
+			put_ahnd(ahnd);
+		}
 
 		set_heartbeat(i915, e->full_name, 2500);
 		cleanup(i915);
@@ -525,6 +552,7 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 	for_each_physical_ring(e, i915) {
 		igt_spin_t *spin;
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
 		int err;
 
 		if (!set_preempt_timeout(i915, e->full_name, 250))
@@ -534,7 +562,8 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 			continue;
 
 		ctx = intel_ctx_create(i915, NULL);
-		spin = igt_spin_new(i915, .ctx = ctx,
+		ahnd = get_reloc_ahnd(i915, ctx->id);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				    .engine = eb_ring(e),
 				    .flags = (IGT_SPIN_FENCE_OUT |
 					      IGT_SPIN_POLL_RUN |
@@ -547,6 +576,7 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 
 		set_heartbeat(i915, e->full_name, 2500);
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 
 		igt_assert_eq(err, -EIO);
 		cleanup(i915);
@@ -559,6 +589,7 @@ static void test_nonpersistent_file(int i915)
 {
 	int debugfs = i915;
 	igt_spin_t *spin;
+	uint64_t ahnd;
 
 	cleanup(i915);
 
@@ -569,8 +600,9 @@ static void test_nonpersistent_file(int i915)
 
 	i915 = gem_reopen_driver(i915);
 
+	ahnd = get_reloc_ahnd(i915, 0);
 	gem_context_set_persistence(i915, 0, false);
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .flags = IGT_SPIN_FENCE_OUT);
 
 	close(i915);
 	flush_delayed_fput(debugfs);
@@ -579,6 +611,7 @@ static void test_nonpersistent_file(int i915)
 
 	spin->handle = 0;
 	igt_spin_free(-1, spin);
+	put_ahnd(ahnd);
 }
 
 static int __execbuf_wr(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
@@ -607,6 +640,7 @@ static void test_nonpersistent_queued(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin;
 	int fence = -1;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * Not only must the immediate batch be cancelled, but
@@ -614,7 +648,8 @@ static void test_nonpersistent_queued(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = ctx_create_persistence(i915, cfg, false);
-	spin = igt_spin_new(i915, .ctx = ctx,
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
 
@@ -648,6 +683,7 @@ static void test_nonpersistent_queued(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(wait_for_status(fence, reset_timeout_ms), -EIO);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void sendfd(int socket, int fd)
@@ -703,12 +739,16 @@ static void test_process(int i915)
 
 	igt_fork(child, 1) {
 		igt_spin_t *spin;
+		uint64_t ahnd;
 
+		intel_allocator_init();
 		i915 = gem_reopen_driver(i915);
 		gem_quiescent_gpu(i915);
 
 		gem_context_set_persistence(i915, 0, false);
-		spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT);
+		ahnd = get_reloc_ahnd(i915, 0);
+		spin = igt_spin_new(i915, .ahnd = ahnd,
+				    .flags = IGT_SPIN_FENCE_OUT);
 		sendfd(sv[0], spin->out_fence);
 
 		igt_list_del(&spin->link); /* prevent autocleanup */
@@ -747,12 +787,16 @@ static void test_userptr(int i915)
 
 	igt_fork(child, 1) {
 		igt_spin_t *spin;
+		uint64_t ahnd;
 
+		intel_allocator_init();
 		i915 = gem_reopen_driver(i915);
 		gem_quiescent_gpu(i915);
 
 		gem_context_set_persistence(i915, 0, false);
-		spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_USERPTR);
+		ahnd = get_reloc_ahnd(i915, 0);
+		spin = igt_spin_new(i915, .ahnd = ahnd,
+				    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_USERPTR);
 		sendfd(sv[0], spin->out_fence);
 
 		igt_list_del(&spin->link); /* prevent autocleanup */
@@ -795,9 +839,12 @@ static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
 		for (int persists = 0; persists <= 1; persists++) {
 			igt_spin_t *spin;
 			const intel_ctx_t *ctx;
+			uint64_t ahnd;
 
+			intel_allocator_init();
 			ctx = ctx_create_persistence(i915, cfg, persists);
-			spin = igt_spin_new(i915, .ctx = ctx,
+			ahnd = get_reloc_ahnd(i915, ctx->id);
+			spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 					    .engine = engine,
 					    .flags = IGT_SPIN_FENCE_OUT);
 
@@ -835,6 +882,7 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	const struct intel_execution_engine2 *other;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd = get_reloc_ahnd(i915, base_ctx->id);
 	int fence = -1;
 
 	cleanup(i915);
@@ -855,7 +903,7 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 		if (other->flags == engine->flags)
 			continue;
 
-		spin = igt_spin_new(i915, .ctx = base_ctx,
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = base_ctx,
 				   .engine = other->flags,
 				   .flags = (IGT_SPIN_NO_PREEMPTION |
 					     IGT_SPIN_FENCE_OUT));
@@ -873,10 +921,12 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 		}
 		spin->out_fence = -1;
 	}
+	put_ahnd(ahnd);
 	igt_require(fence != -1);
 
 	ctx = ctx_create_persistence(i915, &base_ctx->cfg, false);
-	spin = igt_spin_new(i915, .ctx = ctx,
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .engine = engine->flags,
 			    .flags = (IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_POLL_RUN |
@@ -891,6 +941,7 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	gem_quiescent_gpu(i915);
 	igt_assert_eq(wait_for_status(fence, reset_timeout_ms), 1);
 	close(fence);
+	put_ahnd(ahnd);
 }
 
 static void test_processes(int i915)
@@ -912,11 +963,15 @@ static void test_processes(int i915)
 		igt_fork(child, 1) {
 			igt_spin_t *spin;
 			int pid;
+			uint64_t ahnd;
 
+			intel_allocator_init();
 			i915 = gem_reopen_driver(i915);
 			gem_context_set_persistence(i915, 0, i);
 
-			spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT);
+			ahnd = get_reloc_ahnd(i915, 0);
+			spin = igt_spin_new(i915, .ahnd = ahnd,
+					    .flags = IGT_SPIN_FENCE_OUT);
 			/* prevent autocleanup */
 			igt_list_del(&spin->link);
 
@@ -978,10 +1033,12 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 	int fence = -1;
 	int fd, extra;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	fd = gem_reopen_driver(i915);
 	ctx = ctx_create_persistence(fd, cfg, expected > 0);
-	spin = igt_spin_new(fd, .ctx = ctx, .engine = engine,
+	ahnd = get_reloc_ahnd(fd, ctx->id);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
 
 	extra = rand() % 8;
@@ -1010,6 +1067,7 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 
 	spin->handle = 0;
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static void smoker(int i915, const intel_ctx_cfg_t *cfg,
@@ -1065,6 +1123,7 @@ static void many_contexts(int i915, const intel_ctx_cfg_t *cfg)
 	const struct intel_execution_engine2 *e;
 	int64_t timeout = NSEC_PER_SEC;
 	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	cleanup(i915);
 
@@ -1074,7 +1133,7 @@ static void many_contexts(int i915, const intel_ctx_cfg_t *cfg)
 	 * creating new contexts, and submitting new execbuf.
 	 */
 
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_NO_PREEMPTION);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .flags = IGT_SPIN_NO_PREEMPTION);
 	igt_spin_end(spin);
 
 	gem_sync(i915, spin->handle);
@@ -1104,6 +1163,7 @@ static void many_contexts(int i915, const intel_ctx_cfg_t *cfg)
 
 	igt_spin_free(i915, spin);
 	gem_quiescent_gpu(i915);
+	put_ahnd(ahnd);
 }
 
 static void do_test(void (*test)(int i915, const intel_ctx_cfg_t *cfg,
@@ -1256,9 +1316,21 @@ igt_main
 
 		igt_subtest("many-contexts")
 			many_contexts(i915, &ctx->cfg);
+	}
+
+	igt_subtest_group {
+		igt_fixture {
+			gem_require_contexts(i915);
+			intel_allocator_multiprocess_start();
+		}
 
 		igt_subtest("smoketest")
 			smoketest(i915, &ctx->cfg);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+
 	}
 
 	igt_fixture {
-- 
2.26.0
