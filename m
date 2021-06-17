Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14786E992
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:15:53 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e20so5784219pgg.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:15:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:15:06 -0500
Message-Id: <20210617191516.577394-20-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 69/79] tests/i915/gem_mmap_gtt: Convert to
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
 tests/i915/gem_mmap_gtt.c | 18 ++++++++++++++----
 tests/i915/i915_query.c   | 17 +++++------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index cbfa222a6..60282699e 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -737,14 +737,18 @@ static void
 test_hang_busy(int i915)
 {
 	uint32_t *ptr, *tile, *x;
+	const intel_ctx_t *ctx = intel_ctx_create(i915, NULL);
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
 
-	hang = igt_allow_hang(i915, 0, 0);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION);
+	spin = igt_spin_new(i915, .ctx = ctx,
+			    .flags = IGT_SPIN_POLL_RUN |
+				     IGT_SPIN_FENCE_OUT |
+				     IGT_SPIN_NO_PREEMPTION);
 	igt_spin_busywait_until_started(spin);
 	igt_assert(spin->execbuf.buffer_count == 2);
 
@@ -785,20 +789,25 @@ test_hang_busy(int i915)
 
 	igt_spin_free(i915, spin);
 	igt_disallow_hang(i915, hang);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static void
 test_hang_user(int i915)
 {
+	const intel_ctx_t *ctx = intel_ctx_create(i915, NULL);
 	uint32_t *ptr, *mem, *x;
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
 
-	hang = igt_allow_hang(i915, 0, 0);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION);
+	spin = igt_spin_new(i915, .ctx = ctx,
+			    .flags = IGT_SPIN_POLL_RUN |
+				     IGT_SPIN_FENCE_OUT |
+				     IGT_SPIN_NO_PREEMPTION);
 	igt_spin_busywait_until_started(spin);
 	igt_assert(spin->execbuf.buffer_count == 2);
 
@@ -835,6 +844,7 @@ test_hang_user(int i915)
 
 	igt_spin_free(i915, spin);
 	igt_disallow_hang(i915, hang);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static int min_tile_width(uint32_t devid, int tiling)
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 29b938e9c..0add3401b 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -682,19 +682,14 @@ static void engines(int fd)
 	for (i = 0; i < engines->num_engines; i++) {
 		struct drm_i915_engine_info *engine =
 			(struct drm_i915_engine_info *)&engines->engines[i];
-		I915_DEFINE_CONTEXT_PARAM_ENGINES(p_engines, 1) = {
-			.engines = { engine->engine }
-		};
-		struct drm_i915_gem_context_param param = {
-			.param = I915_CONTEXT_PARAM_ENGINES,
-			.value = to_user_pointer(&p_engines),
-			.size = sizeof(p_engines),
-		};
-
+		const intel_ctx_t *ctx =
+			intel_ctx_create_for_engine(fd, engine->engine.engine_class,
+						    engine->engine.engine_instance);
 		struct drm_i915_gem_exec_object2 obj = {};
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(&obj),
 			.buffer_count = 1,
+			.rsvd1 = ctx->id,
 		};
 
 		igt_debug("%u: class=%u instance=%u flags=%llx capabilities=%llx\n",
@@ -703,11 +698,9 @@ static void engines(int fd)
 			  engine->engine.engine_instance,
 			  engine->flags,
 			  engine->capabilities);
-		gem_context_set_param(fd, &param);
 		igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
 
-		param.size = 0; /* reset context engine map to defaults */
-		gem_context_set_param(fd, &param);
+		intel_ctx_destroy(fd, ctx);
 	}
 
 	/* Check results match the legacy GET_PARAM (where we can). */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
