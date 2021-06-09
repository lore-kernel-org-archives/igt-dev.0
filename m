Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801296EC80
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id s14so16544780pfd.9
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:04 -0500
Message-Id: <20210609043035.102359-19-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 18/93] tests/i915/gem_exec_fence: Move the
 engine data into inter_engine_context
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

This will make iteration easier when we switch to intel_ctx_t.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_fence.c | 79 +++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c3a650d8..7e80b0aa 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2347,7 +2347,7 @@ struct inter_engine_context {
 		uint32_t context;
 	} iterations[9];
 
-	struct intel_engine_data *engines;
+	struct intel_engine_data engines;
 
 	struct inter_engine_batches {
 		void *increment_bb;
@@ -2415,7 +2415,7 @@ static void submit_timeline_execbuf(struct inter_engine_context *context,
 		execbuf->cliprects_ptr = to_user_pointer(&fence_list);
 	}
 
-	execbuf->flags |= context->engines->engines[run_engine_idx].flags;
+	execbuf->flags |= context->engines.engines[run_engine_idx].flags;
 
 	gem_execbuf(context->fd, execbuf);
 }
@@ -2660,12 +2660,12 @@ get_cs_timestamp_frequency(int fd)
 	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
 }
 
-static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd, struct intel_engine_data *engines)
+static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd)
 {
 	memset(context, 0, sizeof(*context));
 
 	context->fd = fd;
-	context->engines = engines;
+	context->engines = intel_init_engine_list(fd, 0);
 
 	context->wait_context = gem_context_clone_with_engines(fd, 0);
 	context->wait_timeline = syncobj_create(fd, 0);
@@ -2685,15 +2685,16 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 	gem_write(fd, context->wait_bb_handle, 0,
 		  context->wait_bb, context->wait_bb_len);
 
-	context->batches = calloc(engines->nengines, sizeof(*context->batches));
-	for (uint32_t e = 0; e < engines->nengines; e++) {
+	context->batches = calloc(context->engines.nengines,
+				  sizeof(*context->batches));
+	for (uint32_t e = 0; e < context->engines.nengines; e++) {
 		struct inter_engine_batches *batches = &context->batches[e];
 
 		batches->timeline = syncobj_create(fd, 0);
 
 		build_increment_engine_bb(
 			batches,
-			gem_engine_mmio_base(fd, engines->engines[e].name));
+			gem_engine_mmio_base(fd, context->engines.engines[e].name));
 		batches->increment_bb_handle = gem_create(fd, 4096);
 		gem_write(fd, batches->increment_bb_handle, 0,
 			  batches->increment_bb, batches->increment_bb_len);
@@ -2706,7 +2707,7 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 	{
 		uint64_t dword = 1;
 		gem_write(fd, context->engine_counter_object.handle,
-			  sizeof(dword) * (context->engines->nengines - 1),
+			  sizeof(dword) * (context->engines.nengines - 1),
 			  &dword, sizeof(dword));
 	}
 }
@@ -2724,7 +2725,7 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
 	gem_close(context->fd, context->wait_bb_handle);
 	free(context->wait_bb);
 
-	for (uint32_t e = 0; e < context->engines->nengines; e++) {
+	for (uint32_t e = 0; e < context->engines.nengines; e++) {
 		struct inter_engine_batches *batches = &context->batches[e];
 
 		syncobj_destroy(context->fd, batches->timeline);
@@ -2734,12 +2735,12 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
 	free(context->batches);
 }
 
-static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+static void test_syncobj_timeline_chain_engines(int fd)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd, engines);
+	setup_timeline_chain_engines(&ctx, fd);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2748,11 +2749,11 @@ static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data
 	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
-		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
 			uint32_t prev_prev_engine =
-				(engines->nengines + engine - 2) % engines->nengines;
+				(ctx.engines.nengines + engine - 2) % ctx.engines.nengines;
 			uint32_t prev_engine =
-				(engines->nengines + engine - 1) % engines->nengines;
+				(ctx.engines.nengines + engine - 1) % ctx.engines.nengines;
 			/*
 			 * Pick up the wait engine semaphore for the
 			 * first increment, then pick up the previous
@@ -2778,28 +2779,28 @@ static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data
 
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
-	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+	for (uint32_t i = 0; i < ctx.engines.nengines; i++)
 		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
-			  ctx.engines->engines[i].name, counter_output[i]);
+			  ctx.engines.engines[i].name, counter_output[i]);
 
 	/*
 	 * Verify that we get the fibonacci number expected (we start
 	 * at the sequence on the second number : 1).
 	 */
-	igt_assert_eq(counter_output[engines->nengines - 1],
-		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+	igt_assert_eq(counter_output[ctx.engines.nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * ctx.engines.nengines + 1));
 
 	munmap(counter_output, 4096);
 
 	teardown_timeline_chain_engines(&ctx);
 }
 
-static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+static void test_syncobj_stationary_timeline_chain_engines(int fd)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd, engines);
+	setup_timeline_chain_engines(&ctx, fd);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2808,11 +2809,11 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_
 	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
-		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
 			uint32_t prev_prev_engine =
-				(engines->nengines + engine - 2) % engines->nengines;
+				(ctx.engines.nengines + engine - 2) % ctx.engines.nengines;
 			uint32_t prev_engine =
-				(engines->nengines + engine - 1) % engines->nengines;
+				(ctx.engines.nengines + engine - 1) % ctx.engines.nengines;
 			/*
 			 * Pick up the wait engine semaphore for the
 			 * first increment, then pick up the previous
@@ -2844,23 +2845,23 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_
 
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
-	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+	for (uint32_t i = 0; i < ctx.engines.nengines; i++)
 		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
-			  ctx.engines->engines[i].name, counter_output[i]);
-	igt_assert_eq(counter_output[engines->nengines - 1],
-		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+			  ctx.engines.engines[i].name, counter_output[i]);
+	igt_assert_eq(counter_output[ctx.engines.nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * ctx.engines.nengines + 1));
 
 	munmap(counter_output, 4096);
 
 	teardown_timeline_chain_engines(&ctx);
 }
 
-static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+static void test_syncobj_backward_timeline_chain_engines(int fd)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd, engines);
+	setup_timeline_chain_engines(&ctx, fd);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2869,11 +2870,11 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_en
 	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
-		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
 			uint32_t prev_prev_engine =
-				(engines->nengines + engine - 2) % engines->nengines;
+				(ctx.engines.nengines + engine - 2) % ctx.engines.nengines;
 			uint32_t prev_engine =
-				(engines->nengines + engine - 1) % engines->nengines;
+				(ctx.engines.nengines + engine - 1) % ctx.engines.nengines;
 			/*
 			 * Pick up the wait engine semaphore for the
 			 * first increment, then pick up the previous
@@ -2905,11 +2906,11 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_en
 
 	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
 
-	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+	for (uint32_t i = 0; i < ctx.engines.nengines; i++)
 		igt_debug("engine %i (%s)\t= %016"PRIx64"\n", i,
-			  ctx.engines->engines[i].name, counter_output[i]);
-	igt_assert_eq(counter_output[engines->nengines - 1],
-		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+			  ctx.engines.engines[i].name, counter_output[i]);
+	igt_assert_eq(counter_output[ctx.engines.nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * ctx.engines.nengines + 1));
 
 	munmap(counter_output, 4096);
 
@@ -3217,13 +3218,13 @@ igt_main
 			}
 
 			igt_subtest("syncobj-timeline-chain-engines")
-				test_syncobj_timeline_chain_engines(i915, &engines);
+				test_syncobj_timeline_chain_engines(i915);
 
 			igt_subtest("syncobj-stationary-timeline-chain-engines")
-				test_syncobj_stationary_timeline_chain_engines(i915, &engines);
+				test_syncobj_stationary_timeline_chain_engines(i915);
 
 			igt_subtest("syncobj-backward-timeline-chain-engines")
-				test_syncobj_backward_timeline_chain_engines(i915, &engines);
+				test_syncobj_backward_timeline_chain_engines(i915);
 		}
 
 		igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
