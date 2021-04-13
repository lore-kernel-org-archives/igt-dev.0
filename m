Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93946E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:03 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id j7so7493917plx.2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:23 -0500
Message-Id: <20210413035350.261794-48-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 47/74] tests/i915/gem_exec_latency: Convert
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

---
 tests/i915/gem_exec_latency.c | 120 +++++++++++++++++++---------------
 1 file changed, 66 insertions(+), 54 deletions(-)

diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index e6466965..663d1bad 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -58,9 +58,11 @@ static unsigned int ring_size;
 static double rcs_clock;
 static struct intel_mmio_data mmio_data;
 
-static void poll_ring(int fd, const struct intel_execution_engine2 *e)
+static void poll_ring(int fd, const intel_ctx_t *ctx,
+		      const struct intel_execution_engine2 *e)
 {
 	const struct igt_spin_factory opts = {
+		.ctx = ctx,
 		.engine = e->flags,
 		.flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FAST,
 	};
@@ -100,7 +102,7 @@ static void poll_ring(int fd, const struct intel_execution_engine2 *e)
 }
 
 #define TIMESTAMP (0x358)
-static void latency_on_ring(int fd,
+static void latency_on_ring(int fd, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
@@ -127,6 +129,7 @@ static void latency_on_ring(int fd,
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags;
 	execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[1].handle = gem_create(fd, 4096);
@@ -249,7 +252,7 @@ static void latency_on_ring(int fd,
 	gem_close(fd, obj[2].handle);
 }
 
-static void latency_from_ring(int fd,
+static void latency_from_ring(int fd, const intel_ctx_t *base_ctx,
 			      const struct intel_execution_engine2 *e,
 			      unsigned flags)
 {
@@ -262,17 +265,17 @@ static void latency_from_ring(int fd,
 	const unsigned int repeats = ring_size / 2;
 	const struct intel_execution_engine2 *other;
 	uint32_t *map, *results;
-	uint32_t ctx[2] = {};
+	const intel_ctx_t *ctx[2] = {base_ctx, base_ctx};
 	int i, j;
 
 	igt_require(mmio_base);
 
 	if (flags & PREEMPT) {
-		ctx[0] = gem_context_clone_with_engines(fd, 0);
-		gem_context_set_priority(fd, ctx[0], -1023);
+		ctx[0] = intel_ctx_create(fd, &base_ctx->cfg);
+		gem_context_set_priority(fd, ctx[0]->id, -1023);
 
-		ctx[1] = gem_context_clone_with_engines(fd, 0);
-		gem_context_set_priority(fd, ctx[1], 1023);
+		ctx[1] = intel_ctx_create(fd, &base_ctx->cfg);
+		gem_context_set_priority(fd, ctx[1]->id, 1023);
 	}
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -280,7 +283,7 @@ static void latency_from_ring(int fd,
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags;
 	execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
-	execbuf.rsvd1 = ctx[1];
+	execbuf.rsvd1 = ctx[1]->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[1].handle = gem_create(fd, 4096);
@@ -308,7 +311,7 @@ static void latency_from_ring(int fd,
 	reloc.presumed_offset = obj[1].offset;
 	reloc.target_handle = flags & CORK ? 1 : 0;
 
-	__for_each_physical_engine(fd, other) {
+	for_each_ctx_engine(fd, base_ctx, other) {
 		igt_spin_t *spin = NULL;
 		IGT_CORK_HANDLE(c);
 
@@ -318,7 +321,7 @@ static void latency_from_ring(int fd,
 
 		if (flags & PREEMPT)
 			spin = __igt_spin_new(fd,
-					      .ctx_id = ctx[0],
+					      .ctx = ctx[0],
 					      .engine = e->flags);
 
 		if (flags & CORK) {
@@ -402,12 +405,13 @@ static void latency_from_ring(int fd,
 	gem_close(fd, obj[2].handle);
 
 	if (flags & PREEMPT) {
-		gem_context_destroy(fd, ctx[1]);
-		gem_context_destroy(fd, ctx[0]);
+		intel_ctx_destroy(fd, ctx[1]);
+		intel_ctx_destroy(fd, ctx[0]);
 	}
 }
 
-static void execution_latency(int i915, const struct intel_execution_engine2 *e)
+static void execution_latency(int i915, const intel_ctx_t *ctx,
+			      const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4095),
@@ -416,6 +420,7 @@ static void execution_latency(int i915, const struct intel_execution_engine2 *e)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = e->flags | I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT,
+		.rsvd1 = ctx->id,
 	};
 	const uint32_t mmio_base = gem_engine_mmio_base(i915, e->name);
 	const unsigned int cs_timestamp = mmio_base + 0x358;
@@ -488,7 +493,8 @@ static void execution_latency(int i915, const struct intel_execution_engine2 *e)
 	gem_close(i915, obj.handle);
 }
 
-static void wakeup_latency(int i915, const struct intel_execution_engine2 *e)
+static void wakeup_latency(int i915, const intel_ctx_t *ctx,
+			   const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4095),
@@ -497,6 +503,7 @@ static void wakeup_latency(int i915, const struct intel_execution_engine2 *e)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = e->flags | I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT,
+		.rsvd1 = ctx->id,
 	};
 	const uint32_t mmio_base = gem_engine_mmio_base(i915, e->name);
 	const unsigned int cs_timestamp = mmio_base + 0x358;
@@ -597,7 +604,8 @@ static bool __spin_wait(int fd, igt_spin_t *spin)
  * Test whether RT thread which hogs the CPU a lot can submit work with
  * reasonable latency.
  */
-static void rthog_latency_on_ring(int fd, const struct intel_execution_engine2 *e)
+static void rthog_latency_on_ring(int fd, const intel_ctx_t *ctx,
+				  const struct intel_execution_engine2 *e)
 {
 	const char *passname[] = {
 		"warmup",
@@ -613,6 +621,7 @@ static void rthog_latency_on_ring(int fd, const struct intel_execution_engine2 *
 #define NPASS ARRAY_SIZE(passname)
 #define MMAP_SZ (64 << 10)
 	const struct igt_spin_factory opts = {
+		.ctx = ctx,
 		.engine = e->flags,
 		.flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FAST,
 	};
@@ -735,7 +744,7 @@ static void rthog_latency_on_ring(int fd, const struct intel_execution_engine2 *
 	munmap(results, MMAP_SZ);
 }
 
-static void context_switch(int i915,
+static void context_switch(int i915, const intel_ctx_t *ctx,
 			   const struct intel_execution_engine2 *e,
 			   unsigned int flags)
 {
@@ -745,17 +754,17 @@ static void context_switch(int i915,
 	uint32_t *cs, *bbe, *results, v;
 	const uint32_t mmio_base = gem_engine_mmio_base(i915, e->name);
 	struct igt_mean mean;
-	uint32_t ctx[2];
+	const intel_ctx_t *tmp_ctx[2];
 
 	igt_require(mmio_base);
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
 
-	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		ctx[i] = gem_context_clone_with_engines(i915, 0);
+	for (int i = 0; i < ARRAY_SIZE(tmp_ctx); i++)
+		tmp_ctx[i] = intel_ctx_create(i915, &ctx->cfg);
 
 	if (flags & PREEMPT) {
-		gem_context_set_priority(i915, ctx[0], -1023);
-		gem_context_set_priority(i915, ctx[1], +1023);
+		gem_context_set_priority(i915, tmp_ctx[0]->id, -1023);
+		gem_context_set_priority(i915, tmp_ctx[1]->id, +1023);
 	}
 
 	memset(obj, 0, sizeof(obj));
@@ -815,14 +824,14 @@ static void context_switch(int i915,
 	v = 0;
 	igt_mean_init(&mean);
 	igt_until_timeout(5) {
-		eb.rsvd1 = ctx[0];
+		eb.rsvd1 = tmp_ctx[0]->id;
 		eb.batch_start_offset = 0;
 		gem_execbuf(i915, &eb);
 
 		while (results[0] == v)
 			igt_assert(gem_bo_busy(i915, obj[1].handle));
 
-		eb.rsvd1 = ctx[1];
+		eb.rsvd1 = tmp_ctx[1]->id;
 		eb.batch_start_offset = 64 * sizeof(*cs);
 		gem_execbuf(i915, &eb);
 
@@ -843,8 +852,8 @@ static void context_switch(int i915,
 	for (int i = 0; i < ARRAY_SIZE(obj); i++)
 		gem_close(i915, obj[i].handle);
 
-	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		gem_context_destroy(i915, ctx[i]);
+	for (int i = 0; i < ARRAY_SIZE(tmp_ctx); i++)
+		intel_ctx_destroy(i915, tmp_ctx[i]);
 }
 
 static double clockrate(int i915, int reg)
@@ -879,20 +888,22 @@ static double clockrate(int i915, int reg)
 	return (r_end - r_start) * 1e9 / elapsed;
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int device = -1;
 
 	igt_fixture {
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 		gem_require_mmap_wc(device);
+		ctx = intel_ctx_create_all_physical(device);
 
 		gem_submission_print_method(device);
 
@@ -914,31 +925,31 @@ igt_main
 		igt_fixture
 			igt_require(intel_gen(intel_get_drm_devid(device)) >= 7);
 
-		test_each_engine("rthog-submit", device, e)
-			rthog_latency_on_ring(device, e);
+		test_each_engine("rthog-submit", device, ctx, e)
+			rthog_latency_on_ring(device, ctx, e);
 
-		test_each_engine("dispatch", device, e)
-			latency_on_ring(device, e, 0);
-		test_each_engine("dispatch-queued", device, e)
-			latency_on_ring(device, e, CORK);
+		test_each_engine("dispatch", device, ctx, e)
+			latency_on_ring(device, ctx, e, 0);
+		test_each_engine("dispatch-queued", device, ctx, e)
+			latency_on_ring(device, ctx, e, CORK);
 
-		test_each_engine("live-dispatch", device, e)
-			latency_on_ring(device, e, LIVE);
-		test_each_engine("live-dispatch-queued", device, e)
-			latency_on_ring(device, e, LIVE | CORK);
+		test_each_engine("live-dispatch", device, ctx, e)
+			latency_on_ring(device, ctx, e, LIVE);
+		test_each_engine("live-dispatch-queued", device, ctx, e)
+			latency_on_ring(device, ctx, e, LIVE | CORK);
 
-		test_each_engine("poll", device, e)
-			poll_ring(device, e);
+		test_each_engine("poll", device, ctx, e)
+			poll_ring(device, ctx, e);
 
-		test_each_engine("synchronisation", device, e)
-			latency_from_ring(device, e, 0);
-		test_each_engine("synchronisation-queued", device, e)
-			latency_from_ring(device, e, CORK);
+		test_each_engine("synchronisation", device, ctx, e)
+			latency_from_ring(device, ctx, e, 0);
+		test_each_engine("synchronisation-queued", device, ctx, e)
+			latency_from_ring(device, ctx, e, CORK);
 
-		test_each_engine("execution-latency", device, e)
-			execution_latency(device, e);
-		test_each_engine("wakeup-latency", device, e)
-			wakeup_latency(device, e);
+		test_each_engine("execution-latency", device, ctx, e)
+			execution_latency(device, ctx, e);
+		test_each_engine("wakeup-latency", device, ctx, e)
+			wakeup_latency(device, ctx, e);
 
 		igt_subtest_group {
 			igt_fixture {
@@ -946,17 +957,18 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(device));
 			}
 
-			test_each_engine("preemption", device, e)
-				latency_from_ring(device, e, PREEMPT);
-			test_each_engine("context-switch", device, e)
-				context_switch(device, e, 0);
-			test_each_engine("context-preempt", device, e)
-				context_switch(device, e, PREEMPT);
+			test_each_engine("preemption", device, ctx, e)
+				latency_from_ring(device, ctx, e, PREEMPT);
+			test_each_engine("context-switch", device, ctx, e)
+				context_switch(device, ctx, e, 0);
+			test_each_engine("context-preempt", device, ctx, e)
+				context_switch(device, ctx, e, PREEMPT);
 		}
 	}
 
 	igt_fixture {
 		intel_register_access_fini(&mmio_data);
+		intel_ctx_destroy(device, ctx);
 		close(device);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
