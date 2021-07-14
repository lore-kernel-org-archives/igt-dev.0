Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57A06E442
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:31:51 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso4344586pjc.0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:31:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:34 -0500
Message-Id: <20210714173141.1381686-3-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/9] tests/i915/gem_eio: Convert to
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

We're going to need the context cfg shortly to properly check for the
command parser.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/i915/gem_eio.c | 57 +++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 50d250f38..b03ddab54 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -174,10 +174,11 @@ static int __gem_wait(int fd, uint32_t handle, int64_t timeout)
 	return err;
 }
 
-static igt_spin_t * __spin_poll(int fd, uint32_t ctx, unsigned long flags)
+static igt_spin_t * __spin_poll(int fd, const intel_ctx_t *ctx,
+				unsigned long flags)
 {
 	struct igt_spin_factory opts = {
-		.ctx_id = ctx,
+		.ctx = ctx,
 		.engine = flags,
 		.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT,
 	};
@@ -205,7 +206,8 @@ static void __spin_wait(int fd, igt_spin_t *spin)
 	}
 }
 
-static igt_spin_t * spin_sync(int fd, uint32_t ctx, unsigned long flags)
+static igt_spin_t * spin_sync(int fd, const intel_ctx_t *ctx,
+			      unsigned long flags)
 {
 	igt_spin_t *spin = __spin_poll(fd, ctx, flags);
 
@@ -364,7 +366,7 @@ static void __test_banned(int fd)
 		}
 
 		/* Trigger a reset, making sure we are detected as guilty */
-		hang = spin_sync(fd, 0, 0);
+		hang = spin_sync(fd, intel_ctx_0(fd), 0);
 		trigger_reset(fd);
 		igt_spin_free(fd, hang);
 
@@ -439,7 +441,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 	else
 		igt_require(i915_reset_control(fd, true));
 
-	hang = spin_sync(fd, 0, I915_EXEC_DEFAULT);
+	hang = spin_sync(fd, intel_ctx_0(fd), I915_EXEC_DEFAULT);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
 	check_wait(fd, hang->handle, wait, NULL);
@@ -500,7 +502,7 @@ static void test_inflight(int fd, unsigned int wait)
 		igt_debug("Starting %s on engine '%s'\n", __func__, e->name);
 		igt_require(i915_reset_control(fd, false));
 
-		hang = spin_sync(fd, 0, eb_ring(e));
+		hang = spin_sync(fd, intel_ctx_0(fd), eb_ring(e));
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -557,7 +559,7 @@ static void test_inflight_suspend(int fd)
 	obj[1].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 
-	hang = spin_sync(fd, 0, 0);
+	hang = spin_sync(fd, intel_ctx_0(fd), 0);
 	obj[0].handle = hang->handle;
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -588,13 +590,14 @@ static void test_inflight_suspend(int fd)
 	close(fd);
 }
 
-static uint32_t context_create_safe(int i915)
+static const intel_ctx_t *context_create_safe(int i915)
 {
 	struct drm_i915_gem_context_param param;
+	const intel_ctx_t *ctx = intel_ctx_create(i915, NULL);
 
 	memset(&param, 0, sizeof(param));
 
-	param.ctx_id = gem_context_create(i915);
+	param.ctx_id = ctx->id;
 	param.param = I915_CONTEXT_PARAM_BANNABLE;
 	gem_context_set_param(i915, &param);
 
@@ -602,7 +605,7 @@ static uint32_t context_create_safe(int i915)
 	param.value = 1;
 	gem_context_set_param(i915, &param);
 
-	return param.ctx_id;
+	return ctx;
 }
 
 static void test_inflight_contexts(int fd, unsigned int wait)
@@ -619,7 +622,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		struct drm_i915_gem_execbuffer2 execbuf;
 		unsigned int count;
 		igt_spin_t *hang;
-		uint32_t ctx[64];
+		const intel_ctx_t *ctx[64];
 		int fence[64];
 
 		fd = reopen_device(parent_fd);
@@ -637,7 +640,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		obj[1].handle = gem_create(fd, 4096);
 		gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 
-		hang = spin_sync(fd, 0, eb_ring(e));
+		hang = spin_sync(fd, intel_ctx_0(fd), eb_ring(e));
 		obj[0].handle = hang->handle;
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -647,7 +650,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 
 		count = 0;
 		for (unsigned int n = 0; n < ARRAY_SIZE(fence); n++) {
-			execbuf.rsvd1 = ctx[n];
+			execbuf.rsvd1 = ctx[n]->id;
 			if (__gem_execbuf_wr(fd, &execbuf))
 				break; /* small shared ring */
 			fence[n] = execbuf.rsvd2 >> 32;
@@ -669,7 +672,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		trigger_reset(fd);
 
 		for (unsigned int n = 0; n < ARRAY_SIZE(ctx); n++)
-			gem_context_destroy(fd, ctx[n]);
+			intel_ctx_destroy(fd, ctx[n]);
 
 		close(fd);
 	}
@@ -691,7 +694,7 @@ static void test_inflight_external(int fd)
 	fence = igt_cork_plug(&cork, fd);
 
 	igt_require(i915_reset_control(fd, false));
-	hang = __spin_poll(fd, 0, 0);
+	hang = __spin_poll(fd, intel_ctx_0(fd), 0);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -739,7 +742,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	fd = reopen_device(fd);
 	igt_require(gem_has_exec_fence(fd));
 	igt_require(i915_reset_control(fd, false));
-	hang = spin_sync(fd, 0, 0);
+	hang = spin_sync(fd, intel_ctx_0(fd), 0);
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = hang->handle;
@@ -774,7 +777,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 	close(fd);
 }
 
-static void reset_stress(int fd, uint32_t ctx0,
+static void reset_stress(int fd, const intel_ctx_t *ctx0,
 			 const char *name, unsigned int engine,
 			 unsigned int flags)
 {
@@ -799,7 +802,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 
 	igt_stats_init(&stats);
 	igt_until_timeout(5) {
-		uint32_t ctx = context_create_safe(fd);
+		const intel_ctx_t *ctx = context_create_safe(fd);
 		igt_spin_t *hang;
 		unsigned int i;
 
@@ -814,11 +817,11 @@ static void reset_stress(int fd, uint32_t ctx0,
 		 */
 		hang = spin_sync(fd, ctx0, engine);
 
-		execbuf.rsvd1 = ctx;
+		execbuf.rsvd1 = ctx->id;
 		for (i = 0; i < max; i++)
 			gem_execbuf(fd, &execbuf);
 
-		execbuf.rsvd1 = ctx0;
+		execbuf.rsvd1 = ctx0->id;
 		for (i = 0; i < max; i++)
 			gem_execbuf(fd, &execbuf);
 
@@ -836,17 +839,17 @@ static void reset_stress(int fd, uint32_t ctx0,
 		 * Verify that we are able to submit work after unwedging from
 		 * both contexts.
 		 */
-		execbuf.rsvd1 = ctx;
+		execbuf.rsvd1 = ctx->id;
 		for (i = 0; i < max; i++)
 			gem_execbuf(fd, &execbuf);
 
-		execbuf.rsvd1 = ctx0;
+		execbuf.rsvd1 = ctx0->id;
 		for (i = 0; i < max; i++)
 			gem_execbuf(fd, &execbuf);
 
 		gem_sync(fd, obj.handle);
 		igt_spin_free(fd, hang);
-		gem_context_destroy(fd, ctx);
+		intel_ctx_destroy(fd, ctx);
 	}
 	check_wait_elapsed(name, fd, &stats);
 	igt_stats_fini(&stats);
@@ -859,12 +862,12 @@ static void reset_stress(int fd, uint32_t ctx0,
  */
 static void test_reset_stress(int fd, unsigned int flags)
 {
-	uint32_t ctx0 = context_create_safe(fd);
+	const intel_ctx_t *ctx0 = context_create_safe(fd);
 
 	for_each_ring(e, fd)
 		reset_stress(fd, ctx0, e->name, eb_ring(e), flags);
 
-	gem_context_destroy(fd, ctx0);
+	intel_ctx_destroy(fd, ctx0);
 }
 
 /*
@@ -924,14 +927,14 @@ static void test_kms(int i915, igt_display_t *dpy)
 
 	test_inflight(i915, 0);
 	if (gem_has_contexts(i915)) {
-		uint32_t ctx = context_create_safe(i915);
+		const intel_ctx_t *ctx = context_create_safe(i915);
 
 		reset_stress(i915, ctx,
 			     "default", I915_EXEC_DEFAULT, 0);
 		reset_stress(i915, ctx,
 			     "default", I915_EXEC_DEFAULT, TEST_WEDGE);
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	*shared = 1;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
