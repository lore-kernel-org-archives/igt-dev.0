Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0A96E997
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:16:01 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id k6so5766824pfk.12
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:16:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:15:11 -0500
Message-Id: <20210617191516.577394-25-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 74/79] tests/i915/gen9_exec_parse: Convert
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
 tests/i915/gen9_exec_parse.c | 106 +++++++++++++++++------------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index e10c6ce9f..6e6ee3af7 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -81,7 +81,7 @@ __checked_execbuf(int i915, struct drm_i915_gem_execbuffer2 *eb)
 }
 
 static int
-__exec_batch_patched(int i915, int engine,
+__exec_batch_patched(int i915, const intel_ctx_t *ctx, int engine,
 		     uint32_t cmd_bo, const uint32_t *cmds, int size,
 		     uint32_t target_bo, uint64_t target_offset, uint64_t target_delta)
 {
@@ -110,12 +110,13 @@ __exec_batch_patched(int i915, int engine,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.batch_len = size;
+	execbuf.rsvd1 = ctx->id;
 	execbuf.flags = engine;
 
 	return __checked_execbuf(i915, &execbuf);
 }
 
-static void exec_batch_patched(int i915, int engine,
+static void exec_batch_patched(int i915, const intel_ctx_t *ctx, int engine,
 			       uint32_t cmd_bo, const uint32_t *cmds,
 			       int size, int patch_offset,
 			       long int expected_value)
@@ -124,7 +125,8 @@ static void exec_batch_patched(int i915, int engine,
 	uint64_t actual_value = 0;
 	long int ret;
 
-	ret = __exec_batch_patched(i915, engine, cmd_bo, cmds, size, target_bo, patch_offset, 0);
+	ret = __exec_batch_patched(i915, ctx, engine, cmd_bo, cmds, size,
+				   target_bo, patch_offset, 0);
 	if (ret) {
 		igt_assert_lt(ret, 0);
 		gem_close(i915, target_bo);
@@ -139,8 +141,8 @@ static void exec_batch_patched(int i915, int engine,
 	igt_assert_eq(actual_value, expected_value);
 }
 
-static int __exec_batch(int i915, int engine, uint32_t cmd_bo,
-			const uint32_t *cmds, int size)
+static int __exec_batch(int i915, const intel_ctx_t *ctx, int engine,
+			uint32_t cmd_bo, const uint32_t *cmds, int size)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[1];
@@ -154,6 +156,7 @@ static int __exec_batch(int i915, int engine, uint32_t cmd_bo,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 1;
 	execbuf.batch_len = size;
+	execbuf.rsvd1 = ctx->id;
 	execbuf.flags = engine;
 
 	return  __checked_execbuf(i915, &execbuf);
@@ -173,12 +176,12 @@ static void print_batch(const uint32_t *cmds, const uint32_t sz)
 #define print_batch(cmds, size)
 #endif
 
-#define exec_batch(i915, engine, bo, cmds, sz, expected)	\
+#define exec_batch(i915, ctx, engine, bo, cmds, sz, expected)	\
 	print_batch(cmds, sz); \
-	igt_assert_eq(__exec_batch(i915, engine, bo, cmds, sz), expected)
+	igt_assert_eq(__exec_batch(i915, ctx, engine, bo, cmds, sz), expected)
 
-static void exec_split_batch(int i915, int engine, const uint32_t *cmds,
-			     int size, int expected_ret)
+static void exec_split_batch(int i915, const intel_ctx_t *ctx, int engine,
+			     const uint32_t *cmds, int size, int expected_ret)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[1];
@@ -213,6 +216,7 @@ static void exec_split_batch(int i915, int engine, const uint32_t *cmds,
 	execbuf.batch_len =
 		ALIGN(size + actual_start_offset - execbuf.batch_start_offset,
 		      0x8);
+	execbuf.rsvd1 = ctx->id;
 	execbuf.flags = engine;
 
 	igt_assert_eq(__checked_execbuf(i915, &execbuf), expected_ret);
@@ -220,7 +224,7 @@ static void exec_split_batch(int i915, int engine, const uint32_t *cmds,
 	gem_close(i915, cmd_bo);
 }
 
-static void exec_batch_chained(int i915, int engine,
+static void exec_batch_chained(int i915, const intel_ctx_t *ctx, int engine,
 			       uint32_t cmd_bo, const uint32_t *cmds,
 			       int size, int patch_offset,
 			       uint64_t expected_value,
@@ -276,6 +280,7 @@ static void exec_batch_chained(int i915, int engine,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 3;
 	execbuf.batch_len = sizeof(first_level_cmds);
+	execbuf.rsvd1 = ctx->id;
 	execbuf.flags = engine;
 
 	ret = __checked_execbuf(i915, &execbuf);
@@ -371,7 +376,8 @@ static void test_allowed_all(const int i915, const uint32_t handle)
 
 	b = inject_cmd(b, MI_BATCH_BUFFER_END, 1);
 
-	exec_batch(i915, I915_EXEC_BLT, handle, batch, batch_bytes(batch, b), 0);
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT,
+		   handle, batch, batch_bytes(batch, b), 0);
 }
 
 static void test_allowed_single(const int i915, const uint32_t handle)
@@ -386,7 +392,8 @@ static void test_allowed_single(const int i915, const uint32_t handle)
 
 		b = inject_cmd(b, MI_BATCH_BUFFER_END, 1);
 
-		igt_assert_eq(__exec_batch(i915, I915_EXEC_BLT, handle,
+		igt_assert_eq(__exec_batch(i915, intel_ctx_0(i915),
+					   I915_EXEC_BLT, handle,
 					   batch, batch_bytes(batch, b)),
 			      0);
 	};
@@ -658,14 +665,14 @@ static void test_bb_chained(const int i915, const uint32_t handle)
 		MI_BATCH_BUFFER_END,
 	};
 
-	exec_batch_chained(i915, I915_EXEC_RENDER,
+	exec_batch_chained(i915, intel_ctx_0(i915), I915_EXEC_RENDER,
 			   handle,
 			   batch, sizeof(batch),
 			   4,
 			   0xbaadf00d,
 			   0);
 
-	exec_batch_chained(i915, I915_EXEC_BLT,
+	exec_batch_chained(i915, intel_ctx_0(i915), I915_EXEC_BLT,
 			   handle,
 			   batch, sizeof(batch),
 			   4,
@@ -690,11 +697,11 @@ static void test_cmd_crossing_page(const int i915, const uint32_t handle)
 		MI_BATCH_BUFFER_END,
 	};
 
-	exec_split_batch(i915, I915_EXEC_BLT,
+	exec_split_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT,
 			 lri_ok, sizeof(lri_ok),
 			 0);
 
-	exec_batch_patched(i915, I915_EXEC_BLT, handle,
+	exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   0xbaadf00d);
@@ -729,25 +736,25 @@ static void test_invalid_length(const int i915, const uint32_t handle)
 		MI_BATCH_BUFFER_END,
 	};
 
-	exec_batch(i915, I915_EXEC_BLT, handle,
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 		   lri_ok, sizeof(lri_ok),
 		   0);
 
-	exec_batch_patched(i915, I915_EXEC_BLT, handle,
+	exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   ok_val);
 
-	exec_batch(i915, I915_EXEC_BLT, handle,
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 		   lri_bad, 0,
 		   0);
 
-	exec_batch_patched(i915, I915_EXEC_BLT, handle,
+	exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   ok_val);
 
-	exec_batch(i915, I915_EXEC_BLT, handle,
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 		   lri_ok, 4096,
 		   0);
 
@@ -842,20 +849,20 @@ static void test_register(const int i915, const uint32_t handle,
 		MI_BATCH_BUFFER_END,
 	};
 
-	exec_batch(i915, I915_EXEC_BLT, handle,
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 		   lri_mask, sizeof(lri_mask),
 		   r->privileged ? -EACCES : 0);
 
-	exec_batch_patched(i915, I915_EXEC_BLT, handle,
+	exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   r->privileged ? -EACCES : r->mask);
 
-	exec_batch(i915, I915_EXEC_BLT, handle,
+	exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 		   lri_zero, sizeof(lri_zero),
 		   r->privileged ? -EACCES : 0);
 
-	exec_batch_patched(i915, I915_EXEC_BLT, handle,
+	exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   store_reg, sizeof(store_reg),
 			   2 * sizeof(uint32_t), /* reloc */
 			   r->privileged ? -EACCES : 0);
@@ -886,8 +893,8 @@ static long int read_reg(const int i915, const uint32_t handle,
 
 	target_bo = gem_create(i915, HANDLE_SIZE);
 
-	ret = __exec_batch_patched(i915, I915_EXEC_BLT, handle,
-				   store_reg, sizeof(store_reg),
+	ret = __exec_batch_patched(i915, intel_ctx_0(i915), I915_EXEC_BLT,
+				   handle, store_reg, sizeof(store_reg),
 				   target_bo, 2 * sizeof(uint32_t), 0);
 
 	if (ret) {
@@ -913,7 +920,7 @@ static int write_reg(const int i915, const uint32_t handle,
 		MI_BATCH_BUFFER_END,
 	};
 
-	return __exec_batch(i915, I915_EXEC_BLT, handle,
+	return __exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			    lri, sizeof(lri));
 }
 
@@ -999,7 +1006,8 @@ static void test_unaligned_jump(const int i915, const uint32_t handle)
 }
 
 static void
-test_reject_on_engine(int i915, uint32_t handle, unsigned int engine)
+test_reject_on_engine(int i915, const intel_ctx_t *ctx, unsigned int engine,
+		      uint32_t handle)
 {
 	const uint32_t invalid_cmd[] = {
 		INSTR_INVALID_CLIENT << INSTR_CLIENT_SHIFT,
@@ -1010,45 +1018,37 @@ test_reject_on_engine(int i915, uint32_t handle, unsigned int engine)
 		MI_BATCH_BUFFER_END,
 	};
 
-	exec_batch(i915, engine, handle,
+	exec_batch(i915, ctx, engine, handle,
 		   invalid_cmd, sizeof(invalid_cmd),
 		   -EINVAL);
 
-	exec_batch(i915, engine, handle,
+	exec_batch(i915, ctx, engine, handle,
 		   invalid_set_context, sizeof(invalid_set_context),
 		   -EINVAL);
 }
 
 static void test_rejected(int i915, uint32_t handle, bool ctx_param)
 {
-#define engine_class(e, n) ((e)->engines[(n)].engine_class)
-#define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
-
 	if (ctx_param) {
+		intel_ctx_cfg_t cfg = {};
+		const intel_ctx_t *ctx;
 		int i;
 
-		I915_DEFINE_CONTEXT_PARAM_ENGINES(engines , I915_EXEC_RING_MASK + 1);
-		struct drm_i915_gem_context_param param = {
-			.ctx_id = 0,
-			.param = I915_CONTEXT_PARAM_ENGINES,
-			.value = to_user_pointer(&engines),
-			.size = sizeof(engines),
-		};
-
-		memset(&engines, 0, sizeof(engines));
-		for (i = 0; i <= I915_EXEC_RING_MASK; i++) {
-			engine_class(&engines, i) = I915_ENGINE_CLASS_COPY;
-			engine_instance(&engines, i) = 0;
+		for (i = 0; i < GEM_MAX_ENGINES; i++) {
+			cfg.engines[i].engine_class = I915_ENGINE_CLASS_COPY;
+			cfg.engines[i].engine_instance = 0;
 		}
-		gem_context_set_param(i915, &param);
+		cfg.num_engines = GEM_MAX_ENGINES;
+
+		ctx = intel_ctx_create(i915, &cfg);
 
 		for (i = 0; i <= I915_EXEC_RING_MASK; i++)
-			test_reject_on_engine(i915, handle, i);
+			test_reject_on_engine(i915, ctx, i, handle);
 
-		param.size = 0;
-		gem_context_set_param(i915, &param);
+		intel_ctx_destroy(i915, ctx);
 	} else {
-		test_reject_on_engine(i915, handle, I915_EXEC_BLT);
+		test_reject_on_engine(i915, intel_ctx_0(i915),
+				      I915_EXEC_BLT, handle);
 	}
 }
 
@@ -1223,7 +1223,7 @@ igt_main
 	igt_subtest("batch-without-end") {
 		const uint32_t noop[1024] = { 0 };
 
-		exec_batch(i915, I915_EXEC_BLT, handle,
+		exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   noop, sizeof(noop),
 			   -EINVAL);
 	}
@@ -1231,7 +1231,7 @@ igt_main
 	igt_subtest("batch-zero-length") {
 		const uint32_t noop[] = { 0, MI_BATCH_BUFFER_END };
 
-		exec_batch(i915, I915_EXEC_BLT, handle,
+		exec_batch(i915, intel_ctx_0(i915), I915_EXEC_BLT, handle,
 			   noop, 0,
 			   -EINVAL);
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
