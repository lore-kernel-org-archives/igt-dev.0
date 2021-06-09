Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DBE6EA1B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:37:16 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id k15so18959007pfp.6
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:37:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:36:08 -0500
Message-Id: <20210609173632.248880-26-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 25/93] tests/i915/gem_ctx_isolation: Convert
 to intel_ctx_t
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
 tests/i915/gem_ctx_isolation.c | 126 +++++++++++++++++----------------
 1 file changed, 66 insertions(+), 60 deletions(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index ff5d3718..70c15b63 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -233,7 +233,7 @@ static bool ignore_register(uint32_t offset, uint32_t mmio_base)
 }
 
 static void tmpl_regs(int fd,
-		      uint32_t ctx,
+		      const intel_ctx_t *ctx,
 		      const struct intel_execution_engine2 *e,
 		      uint32_t handle,
 		      uint32_t value)
@@ -278,7 +278,7 @@ static void tmpl_regs(int fd,
 }
 
 static uint32_t read_regs(int fd,
-			  uint32_t ctx,
+			  const intel_ctx_t *ctx,
 			  const struct intel_execution_engine2 *e,
 			  unsigned int flags)
 {
@@ -350,7 +350,7 @@ static uint32_t read_regs(int fd,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
 	free(reloc);
@@ -359,7 +359,7 @@ static uint32_t read_regs(int fd,
 }
 
 static void write_regs(int fd,
-		       uint32_t ctx,
+		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       unsigned int flags,
 		       uint32_t value)
@@ -414,13 +414,13 @@ static void write_regs(int fd,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj.handle);
 }
 
 static void restore_regs(int fd,
-			 uint32_t ctx,
+			 const intel_ctx_t *ctx,
 			 const struct intel_execution_engine2 *e,
 			 unsigned int flags,
 			 uint32_t regs)
@@ -492,7 +492,7 @@ static void restore_regs(int fd,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
 }
@@ -596,7 +596,7 @@ static void compare_regs(int fd, const struct intel_execution_engine2 *e,
 		     num_errors, who);
 }
 
-static void nonpriv(int fd,
+static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 		    const struct intel_execution_engine2 *e,
 		    unsigned int flags)
 {
@@ -621,33 +621,34 @@ static void nonpriv(int fd,
 
 	for (int v = 0; v < num_values; v++) {
 		igt_spin_t *spin = NULL;
-		uint32_t ctx, regs[2], tmpl;
+		const intel_ctx_t *ctx;
+		uint32_t regs[2], tmpl;
 
-		ctx = gem_context_clone_with_engines(fd, 0);
+		ctx = intel_ctx_create(fd, cfg);
 
 		tmpl = read_regs(fd, ctx, e, flags);
 		regs[0] = read_regs(fd, ctx, e, flags);
 
 		tmpl_regs(fd, ctx, e, tmpl, values[v]);
 
-		spin = igt_spin_new(fd, .ctx_id = ctx, .engine = e->flags);
+		spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
 
 		igt_debug("%s[%d]: Setting all registers to 0x%08x\n",
 			  __func__, v, values[v]);
 		write_regs(fd, ctx, e, flags, values[v]);
 
 		if (flags & DIRTY2) {
-			uint32_t sw = gem_context_clone_with_engines(fd, 0);
+			const intel_ctx_t *sw = intel_ctx_create(fd, &ctx->cfg);
 			igt_spin_t *syncpt, *dirt;
 
 			/* Explicit sync to keep the switch between write/read */
 			syncpt = igt_spin_new(fd,
-					      .ctx_id = ctx,
+					      .ctx = ctx,
 					      .engine = e->flags,
 					      .flags = IGT_SPIN_FENCE_OUT);
 
 			dirt = igt_spin_new(fd,
-					    .ctx_id = sw,
+					    .ctx = sw,
 					    .engine = e->flags,
 					    .fence = syncpt->out_fence,
 					    .flags = (IGT_SPIN_FENCE_IN |
@@ -655,14 +656,14 @@ static void nonpriv(int fd,
 			igt_spin_free(fd, syncpt);
 
 			syncpt = igt_spin_new(fd,
-					      .ctx_id = ctx,
+					      .ctx = ctx,
 					      .engine = e->flags,
 					      .fence = dirt->out_fence,
 					      .flags = IGT_SPIN_FENCE_IN);
 			igt_spin_free(fd, dirt);
 
 			igt_spin_free(fd, syncpt);
-			gem_context_destroy(fd, sw);
+			intel_ctx_destroy(fd, sw);
 		}
 
 		regs[1] = read_regs(fd, ctx, e, flags);
@@ -679,12 +680,12 @@ static void nonpriv(int fd,
 
 		for (int n = 0; n < ARRAY_SIZE(regs); n++)
 			gem_close(fd, regs[n]);
-		gem_context_destroy(fd, ctx);
+		intel_ctx_destroy(fd, ctx);
 		gem_close(fd, tmpl);
 	}
 }
 
-static void isolation(int fd,
+static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		      const struct intel_execution_engine2 *e,
 		      unsigned int flags)
 {
@@ -704,12 +705,13 @@ static void isolation(int fd,
 
 	for (int v = 0; v < num_values; v++) {
 		igt_spin_t *spin = NULL;
-		uint32_t ctx[2], regs[2], tmp;
+		const intel_ctx_t *ctx[2];
+		uint32_t regs[2], tmp;
 
-		ctx[0] = gem_context_clone_with_engines(fd, 0);
+		ctx[0] = intel_ctx_create(fd, cfg);
 		regs[0] = read_regs(fd, ctx[0], e, flags);
 
-		spin = igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
+		spin = igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
 
 		if (flags & DIRTY1) {
 			igt_debug("%s[%d]: Setting all registers of ctx 0 to 0x%08x\n",
@@ -725,7 +727,7 @@ static void isolation(int fd,
 		 * the default values from this context, but if goes badly we
 		 * see the corruption from the previous context instead!
 		 */
-		ctx[1] = gem_context_clone_with_engines(fd, 0);
+		ctx[1] = intel_ctx_create(fd, cfg);
 		regs[1] = read_regs(fd, ctx[1], e, flags);
 
 		if (flags & DIRTY2) {
@@ -750,7 +752,7 @@ static void isolation(int fd,
 
 		for (int n = 0; n < ARRAY_SIZE(ctx); n++) {
 			gem_close(fd, regs[n]);
-			gem_context_destroy(fd, ctx[n]);
+			intel_ctx_destroy(fd, ctx[n]);
 		}
 		gem_close(fd, tmp);
 	}
@@ -763,21 +765,25 @@ static void isolation(int fd,
 #define S4 (4 << 8)
 #define SLEEP_MASK (0xf << 8)
 
-static uint32_t create_reset_context(int i915)
+static const intel_ctx_t *
+create_reset_context(int i915, const intel_ctx_cfg_t *cfg)
 {
+	const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_clone_with_engines(i915, 0),
+		.ctx_id = ctx->id,
 		.param = I915_CONTEXT_PARAM_BANNABLE,
 	};
 
 	gem_context_set_param(i915, &param);
-	return param.ctx_id;
+	return ctx;
 }
 
-static void inject_reset_context(int fd, const struct intel_execution_engine2 *e)
+static void inject_reset_context(int fd, const intel_ctx_cfg_t *cfg,
+				 const struct intel_execution_engine2 *e)
 {
+	const intel_ctx_t *ctx = create_reset_context(fd, cfg);
 	struct igt_spin_factory opts = {
-		.ctx_id = create_reset_context(fd),
+		.ctx = ctx,
 		.engine = e->flags,
 		.flags = IGT_SPIN_FAST,
 	};
@@ -802,10 +808,10 @@ static void inject_reset_context(int fd, const struct intel_execution_engine2 *e
 	igt_force_gpu_reset(fd);
 
 	igt_spin_free(fd, spin);
-	gem_context_destroy(fd, opts.ctx_id);
+	intel_ctx_destroy(fd, ctx);
 }
 
-static void preservation(int fd,
+static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 			 const struct intel_execution_engine2 *e,
 			 unsigned int flags)
 {
@@ -819,17 +825,17 @@ static void preservation(int fd,
 		0xdeadbeef
 	};
 	const unsigned int num_values = ARRAY_SIZE(values);
-	uint32_t ctx[num_values +1 ];
+	const intel_ctx_t *ctx[num_values +1 ];
 	uint32_t regs[num_values + 1][2];
 	igt_spin_t *spin;
 
 	gem_quiescent_gpu(fd);
 
-	ctx[num_values] = gem_context_clone_with_engines(fd, 0);
-	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
+	ctx[num_values] = intel_ctx_create(fd, cfg);
+	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
 	regs[num_values][0] = read_regs(fd, ctx[num_values], e, flags);
 	for (int v = 0; v < num_values; v++) {
-		ctx[v] = gem_context_clone_with_engines(fd, 0);
+		ctx[v] = intel_ctx_create(fd, cfg);
 		write_regs(fd, ctx[v], e, flags, values[v]);
 
 		regs[v][0] = read_regs(fd, ctx[v], e, flags);
@@ -839,7 +845,7 @@ static void preservation(int fd,
 	igt_spin_free(fd, spin);
 
 	if (flags & RESET)
-		inject_reset_context(fd, e);
+		inject_reset_context(fd, cfg, e);
 
 	switch (flags & SLEEP_MASK) {
 	case NOSLEEP:
@@ -866,7 +872,7 @@ static void preservation(int fd,
 		break;
 	}
 
-	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
+	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
 	for (int v = 0; v < num_values; v++)
 		regs[v][1] = read_regs(fd, ctx[v], e, flags);
 	regs[num_values][1] = read_regs(fd, ctx[num_values], e, flags);
@@ -880,10 +886,10 @@ static void preservation(int fd,
 
 		gem_close(fd, regs[v][0]);
 		gem_close(fd, regs[v][1]);
-		gem_context_destroy(fd, ctx[v]);
+		intel_ctx_destroy(fd, ctx[v]);
 	}
 	compare_regs(fd, e, regs[num_values][0], regs[num_values][1], "clean");
-	gem_context_destroy(fd, ctx[num_values]);
+	intel_ctx_destroy(fd, ctx[num_values]);
 }
 
 static unsigned int __has_context_isolation(int fd)
@@ -901,8 +907,8 @@ static unsigned int __has_context_isolation(int fd)
 	return value;
 }
 
-#define test_each_engine(e, i915, mask) \
-	__for_each_physical_engine(i915, e) \
+#define test_each_engine(e, i915, cfg, mask) \
+	for_each_ctx_cfg_engine(i915, cfg, e) \
 		for_each_if(mask & (1 << (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
@@ -910,6 +916,7 @@ igt_main
 {
 	unsigned int has_context_isolation = 0;
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	int i915 = -1;
 
 	igt_fixture {
@@ -918,6 +925,7 @@ igt_main
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(gem_has_contexts(i915));
+		cfg = intel_ctx_cfg_all_physical(i915);
 
 		has_context_isolation = __has_context_isolation(i915);
 		igt_require(has_context_isolation);
@@ -929,50 +937,48 @@ igt_main
 		igt_skip_on(gen > LAST_KNOWN_GEN);
 	}
 
-	/* __for_each_physical_engine switches context to all engines. */
-
 	igt_fixture {
 		igt_fork_hang_detector(i915);
 	}
 
 	igt_subtest_with_dynamic("nonpriv") {
-		test_each_engine(e, i915, has_context_isolation)
-			nonpriv(i915, e, 0);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			nonpriv(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("nonpriv-switch") {
-		test_each_engine(e, i915, has_context_isolation)
-			nonpriv(i915, e, DIRTY2);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			nonpriv(i915, &cfg, e, DIRTY2);
 	}
 
 	igt_subtest_with_dynamic("clean") {
-		test_each_engine(e, i915, has_context_isolation)
-			isolation(i915, e, 0);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			isolation(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("dirty-create") {
-		test_each_engine(e, i915, has_context_isolation)
-			isolation(i915, e, DIRTY1);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			isolation(i915, &cfg, e, DIRTY1);
 	}
 
 	igt_subtest_with_dynamic("dirty-switch") {
-		test_each_engine(e, i915, has_context_isolation)
-			isolation(i915, e, DIRTY2);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			isolation(i915, &cfg, e, DIRTY2);
 	}
 
 	igt_subtest_with_dynamic("preservation") {
-		test_each_engine(e, i915, has_context_isolation)
-			preservation(i915, e, 0);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			preservation(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("preservation-S3") {
-		test_each_engine(e, i915, has_context_isolation)
-			preservation(i915, e, S3);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			preservation(i915, &cfg, e, S3);
 	}
 
 	igt_subtest_with_dynamic("preservation-S4") {
-		test_each_engine(e, i915, has_context_isolation)
-			preservation(i915, e, S4);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			preservation(i915, &cfg, e, S4);
 	}
 
 	igt_fixture {
@@ -982,8 +988,8 @@ igt_main
 	igt_subtest_with_dynamic("preservation-reset") {
 		igt_hang_t hang = igt_allow_hang(i915, 0, 0);
 
-		test_each_engine(e, i915, has_context_isolation)
-			preservation(i915, e, RESET);
+		test_each_engine(e, i915, &cfg, has_context_isolation)
+			preservation(i915, &cfg, e, RESET);
 
 		igt_disallow_hang(i915, hang);
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
