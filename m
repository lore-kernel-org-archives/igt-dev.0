Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C31B6EC0E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:01 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v23so209068ple.9
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:20 -0500
Message-Id: <20210401021243.4147604-8-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 07/30] tests/i915/gem_exec_fence: Convert to
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
 tests/i915/gem_exec_fence.c | 189 +++++++++++++++++++++---------------
 1 file changed, 113 insertions(+), 76 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index b7b3f8e3..84311d49 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -30,6 +30,7 @@
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
+#include "intel_ctx.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
@@ -55,7 +56,8 @@ struct sync_merge_data {
 #define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
-static void store(int fd, const struct intel_execution_engine2 *e,
+static void store(int fd, const intel_ctx_t *ctx,
+		  const struct intel_execution_engine2 *e,
 		  int fence, uint32_t target, unsigned offset_value)
 {
 	const int SCRATCH = 0;
@@ -71,6 +73,7 @@ static void store(int fd, const struct intel_execution_engine2 *e,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags | I915_EXEC_FENCE_IN;
+	execbuf.rsvd1 = ctx->id;
 	execbuf.rsvd2 = fence;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
@@ -118,7 +121,8 @@ static bool fence_busy(int fence)
 #define NONBLOCK 0x2
 #define WAIT 0x4
 
-static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
+static void test_fence_busy(int fd, const intel_ctx_t *ctx,
+			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -138,6 +142,7 @@ static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -214,7 +219,7 @@ static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
 	gem_quiescent_gpu(fd);
 }
 
-static void test_fence_busy_all(int fd, unsigned flags)
+static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 {
 	const struct intel_execution_engine2 *e;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -272,7 +277,7 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	i++;
 
 	all = -1;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		int fence, new;
 
 		if ((flags & HANG) == 0 &&
@@ -280,6 +285,7 @@ static void test_fence_busy_all(int fd, unsigned flags)
 			continue;
 
 		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
+		execbuf.rsvd1 = ctx->id;
 		execbuf.rsvd2 = -1;
 		gem_execbuf_wr(fd, &execbuf);
 		fence = execbuf.rsvd2 >> 32;
@@ -336,7 +342,8 @@ static unsigned int spin_hang(unsigned int flags)
 	return IGT_SPIN_NO_PREEMPTION | IGT_SPIN_INVALID_CS;
 }
 
-static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
+static void test_fence_await(int fd, const intel_ctx_t *ctx,
+			     const struct intel_execution_engine2 *e,
 			     unsigned flags)
 {
 	const struct intel_execution_engine2 *e2;
@@ -350,20 +357,21 @@ static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	spin = igt_spin_new(fd,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
-	__for_each_physical_engine(fd, e2) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (!gem_class_can_store_dword(fd, e->class))
 			continue;
 
 		if (flags & NONBLOCK) {
-			store(fd, e2, spin->out_fence, scratch, i);
+			store(fd, ctx, e2, spin->out_fence, scratch, i);
 		} else {
 			igt_fork(child, 1)
-				store(fd, e2, spin->out_fence, scratch, i);
+				store(fd, ctx, e2, spin->out_fence, scratch, i);
 		}
 
 		i++;
@@ -439,9 +447,10 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
         return handle;
 }
 
-static void test_submit_fence(int i915, unsigned int engine)
+static void test_submit_fence(int i915, const intel_ctx_t *ctx,
+			      const struct intel_execution_engine2 *e)
 {
-	const struct intel_execution_engine2 *e;
+	const struct intel_execution_engine2 *e2;
 
 	/*
 	 * Create a pair of interlocking batches, that ping pong
@@ -450,8 +459,9 @@ static void test_submit_fence(int i915, unsigned int engine)
 	 * switch to the other batch in order to advance.
 	 */
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e2) {
 		unsigned int offset = 24 << 20;
+		intel_ctx_t *tmp_ctx;
 		struct drm_i915_gem_exec_object2 obj = {
 			.offset = offset,
 			.flags = EXEC_OBJECT_PINNED,
@@ -467,17 +477,19 @@ static void test_submit_fence(int i915, unsigned int engine)
 		result = gem_mmap__device_coherent(i915, obj.handle,
 						   0, 4096, PROT_READ);
 
-		execbuf.flags = engine | I915_EXEC_FENCE_OUT;
+		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 		execbuf.batch_start_offset = 0;
+		execbuf.rsvd1 = ctx->id;
 		gem_execbuf_wr(i915, &execbuf);
 
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 		execbuf.rsvd2 >>= 32;
-		execbuf.flags = e->flags;
+		execbuf.flags = e2->flags;
 		execbuf.flags |= I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.batch_start_offset = offset;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, tmp_ctx);
 
 		gem_sync(i915, obj.handle);
 		gem_close(i915, obj.handle);
@@ -532,7 +544,9 @@ static uint32_t submitN_batches(int i915, uint32_t offset, int count)
         return handle;
 }
 
-static void test_submitN(int i915, unsigned int engine, int count)
+static void test_submitN(int i915, const intel_ctx_t *ctx,
+			 const struct intel_execution_engine2 *e,
+			 int count)
 {
 	unsigned int offset = 24 << 20;
 	unsigned int sz = ALIGN((count + 1) * 1024, 4096);
@@ -544,7 +558,8 @@ static void test_submitN(int i915, unsigned int engine, int count)
 	struct drm_i915_gem_execbuffer2 execbuf  = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = engine | I915_EXEC_FENCE_OUT,
+		.flags = e->flags | I915_EXEC_FENCE_OUT,
+		.rsvd1 = ctx->id,
 	};
 	uint32_t *result =
 		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
@@ -555,10 +570,11 @@ static void test_submitN(int i915, unsigned int engine, int count)
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	for (int i = 0; i < count; i++) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 		execbuf.batch_start_offset = (i + 1) * 1024;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, tmp_ctx);
 
 		execbuf.flags |= I915_EXEC_FENCE_SUBMIT;
 		execbuf.rsvd2 >>= 32;
@@ -594,7 +610,8 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	return err;
 }
 
-static void test_parallel(int i915, const struct intel_execution_engine2 *e)
+static void test_parallel(int i915, const intel_ctx_t *ctx,
+			  const struct intel_execution_engine2 *e)
 {
 	const struct intel_execution_engine2 *e2;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -608,6 +625,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 
 	fence = igt_cork_plug(&cork, i915),
 	spin = igt_spin_new(i915,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .fence = fence,
 			    .flags = (IGT_SPIN_FENCE_OUT |
@@ -615,7 +633,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 	close(fence);
 
 	/* Queue all secondaries */
-	__for_each_physical_engine(i915, e2) {
+	for_each_ctx_engine(i915, ctx, e2) {
 		struct drm_i915_gem_relocation_entry reloc = {
 			.target_handle = scratch,
 			.offset = sizeof(uint32_t),
@@ -632,6 +650,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 			.buffers_ptr = to_user_pointer(obj),
 			.buffer_count = ARRAY_SIZE(obj),
 			.flags = e2->flags | I915_EXEC_FENCE_SUBMIT,
+			.rsvd1 = ctx->id,
 			.rsvd2 = spin->out_fence,
 		};
 		uint32_t batch[16];
@@ -701,7 +720,8 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 	igt_spin_free(i915, spin);
 }
 
-static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
+static void test_concurrent(int i915, const intel_ctx_t *ctx,
+			    const struct intel_execution_engine2 *e)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct drm_i915_gem_relocation_entry reloc = {
@@ -721,10 +741,12 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = e->flags | I915_EXEC_FENCE_SUBMIT,
+		.rsvd1 = ctx->id,
 	};
 	IGT_CORK_FENCE(cork);
 	uint32_t batch[16];
 	igt_spin_t *spin;
+	intel_ctx_t *tmp_ctx;
 	uint32_t result;
 	int fence;
 	int i;
@@ -737,6 +759,7 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 
 	fence = igt_cork_plug(&cork, i915),
 	      spin = igt_spin_new(i915,
+				  .ctx = ctx,
 				  .engine = e->flags,
 				  .fence = fence,
 				  .flags = (IGT_SPIN_FENCE_OUT |
@@ -760,13 +783,14 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 	batch[++i] = MI_BATCH_BUFFER_END;
 	gem_write(i915, obj[1].handle, 0, batch, sizeof(batch));
 
-	execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+	tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+	execbuf.rsvd1 = tmp_ctx->id;
 	execbuf.rsvd2 = spin->out_fence;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 
 	gem_execbuf(i915, &execbuf);
-	gem_context_destroy(i915, execbuf.rsvd1);
+	intel_ctx_destroy(i915, tmp_ctx);
 	gem_close(i915, obj[1].handle);
 
 	/*
@@ -795,7 +819,7 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 	igt_spin_free(i915, spin);
 }
 
-static void test_submit_chain(int i915)
+static void test_submit_chain(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin, *sn;
@@ -806,8 +830,9 @@ static void test_submit_chain(int i915)
 	/* Check that we can simultaneously launch spinners on each engine */
 
 	fence = igt_cork_plug(&cork, i915);
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		spin = igt_spin_new(i915,
+				    .ctx = ctx,
 				    .engine = e->flags,
 				    .fence = fence,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -847,7 +872,8 @@ static uint32_t batch_create(int fd)
 	return handle;
 }
 
-static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
+static void test_keep_in_fence(int fd, const intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e)
 {
 	struct sigaction sa = { .sa_handler = alarm_handler };
 	struct drm_i915_gem_exec_object2 obj = {
@@ -857,13 +883,14 @@ static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = e->flags | I915_EXEC_FENCE_OUT,
+		.rsvd1 = ctx->id,
 	};
 	unsigned long count, last;
 	struct itimerval itv;
 	igt_spin_t *spin;
 	int fence;
 
-	spin = igt_spin_new(fd, .engine = e->flags);
+	spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
 
 	gem_execbuf_wr(fd, &execbuf);
 	fence = upper_32_bits(execbuf.rsvd2);
@@ -915,7 +942,8 @@ static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
 }
 
 #define EXPIRED 0x10000
-static void test_long_history(int fd, long ring_size, unsigned flags)
+static void test_long_history(int fd, const intel_ctx_t *ctx,
+			      long ring_size, unsigned flags)
 {
 	const uint32_t sz = 1 << 20;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -932,7 +960,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 		limit = ring_size / 3;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, e)
+	for_each_ctx_engine(fd, ctx, e)
 		engines[nengine++] = e->flags;
 	igt_require(nengine);
 
@@ -946,6 +974,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
 	execbuf.flags = I915_EXEC_FENCE_OUT;
+	execbuf.rsvd1 = ctx->id;
 
 	gem_execbuf_wr(fd, &execbuf);
 	all_fences = execbuf.rsvd2 >> 32;
@@ -956,7 +985,8 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	obj[0].handle = igt_cork_plug(&c, fd);
 
 	igt_until_timeout(5) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+		intel_ctx_t *tmp_ctx = intel_ctx_create(fd, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 
 		for (n = 0; n < nengine; n++) {
 			struct sync_merge_data merge;
@@ -977,7 +1007,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 			all_fences = merge.fence;
 		}
 
-		gem_context_destroy(fd, execbuf.rsvd1);
+		intel_ctx_destroy(fd, tmp_ctx);
 		if (!--limit)
 			break;
 	}
@@ -991,7 +1021,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
 	execbuf.rsvd2 = all_fences;
-	execbuf.rsvd1 = 0;
+	execbuf.rsvd1 = ctx->id;
 
 	for (s = 0; s < ring_size; s++) {
 		for (n = 0; n < nengine; n++) {
@@ -1257,7 +1287,7 @@ static void test_syncobj_signal(int fd)
 	syncobj_destroy(fd, fence.handle);
 }
 
-static void test_syncobj_wait(int fd)
+static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj;
@@ -1299,12 +1329,13 @@ static void test_syncobj_wait(int fd)
 	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 	n = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		obj.handle = gem_create(fd, 4096);
 		gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
 
 		/* Now wait upon the blocked engine */
 		execbuf.flags = I915_EXEC_FENCE_ARRAY | e->flags;
+		execbuf.rsvd1 = ctx->id;
 		execbuf.cliprects_ptr = to_user_pointer(&fence);
 		execbuf.num_cliprects = 1;
 		fence.flags = I915_EXEC_FENCE_WAIT;
@@ -1997,7 +2028,7 @@ static void test_syncobj_timeline_signal(int fd)
 static const char *test_syncobj_timeline_wait_desc =
 	"Verifies that waiting on a timeline syncobj point between engines"
 	" works";
-static void test_syncobj_timeline_wait(int fd)
+static void test_syncobj_timeline_wait(int fd, const intel_ctx_t *ctx)
 {
 	const uint32_t bbe[2] = {
 		MI_BATCH_BUFFER_END,
@@ -2046,12 +2077,13 @@ static void test_syncobj_timeline_wait(int fd)
 	gem_close(fd, obj.handle);
 
 	n = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		obj.handle = gem_create(fd, 4096);
 		gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
 
 		/* Now wait upon the blocked engine */
 		execbuf.flags = I915_EXEC_USE_EXTENSIONS | e->flags;
+		execbuf.rsvd1 = ctx->id,
 		execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
 		execbuf.num_cliprects = 0;
 		fence.flags = I915_EXEC_FENCE_WAIT;
@@ -2918,6 +2950,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_en
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int i915 = -1;
 
 	igt_fixture {
@@ -2925,6 +2958,10 @@ igt_main
 		igt_require_gem(i915);
 		igt_require(gem_has_exec_fence(i915));
 		gem_require_mmap_wc(i915);
+		if (gem_has_contexts(i915))
+			ctx = intel_ctx_create_all_physical(i915);
+		else
+			ctx = intel_ctx_0(i915);
 
 		gem_submission_print_method(i915);
 	}
@@ -2937,9 +2974,9 @@ igt_main
 		}
 
 		igt_subtest("basic-busy-all")
-			test_fence_busy_all(i915, 0);
+			test_fence_busy_all(i915, ctx, 0);
 		igt_subtest("basic-wait-all")
-			test_fence_busy_all(i915, WAIT);
+			test_fence_busy_all(i915, ctx, WAIT);
 
 		igt_fixture {
 			igt_stop_hang_detector();
@@ -2947,9 +2984,9 @@ igt_main
 		}
 
 		igt_subtest("busy-hang-all")
-			test_fence_busy_all(i915, HANG);
+			test_fence_busy_all(i915, ctx, HANG);
 		igt_subtest("wait-hang-all")
-			test_fence_busy_all(i915, WAIT | HANG);
+			test_fence_busy_all(i915, ctx, WAIT | HANG);
 
 		igt_fixture {
 			igt_disallow_hang(i915, hang);
@@ -2957,7 +2994,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_fixture {
 				igt_require(gem_class_can_store_dword(i915, e->class));
 			}
@@ -2968,42 +3005,42 @@ igt_main
 			}
 
 			igt_subtest_with_dynamic("basic-busy") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_busy(i915, e, 0);
+						test_fence_busy(i915, ctx, e, 0);
 				}
 			}
 			igt_subtest_with_dynamic("basic-wait") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_busy(i915, e, WAIT);
+						test_fence_busy(i915, ctx, e, WAIT);
 				}
 			}
 			igt_subtest_with_dynamic("basic-await") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_await(i915, e, 0);
+						test_fence_await(i915, ctx, e, 0);
 				}
 			}
 			igt_subtest_with_dynamic("nb-await") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_await(i915,
-								 e, NONBLOCK);
+						test_fence_await(i915, ctx, e,
+								 NONBLOCK);
 				}
 			}
 			igt_subtest_with_dynamic("keep-in-fence") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_keep_in_fence(i915, e);
+						test_keep_in_fence(i915, ctx, e);
 				}
 			}
 			igt_subtest_with_dynamic("parallel") {
 				igt_require(has_submit_fence(i915));
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name) {
 						igt_until_timeout(2)
-							test_parallel(i915, e);
+							test_parallel(i915, ctx, e);
 					}
 				}
 			}
@@ -3012,9 +3049,9 @@ igt_main
 				igt_require(has_submit_fence(i915));
 				igt_require(gem_scheduler_has_semaphores(i915));
 				igt_require(gem_scheduler_has_preemption(i915));
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_concurrent(i915, e);
+						test_concurrent(i915, ctx, e);
 				}
 			}
 
@@ -3023,9 +3060,9 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(i915));
 				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_submit_fence(i915, e->flags);
+						test_submit_fence(i915, ctx, e);
 				}
 			}
 
@@ -3034,9 +3071,9 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(i915));
 				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_submitN(i915, e->flags, 3);
+						test_submitN(i915, ctx, e, 3);
 				}
 			}
 
@@ -3045,15 +3082,15 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(i915));
 				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_submitN(i915, e->flags, 67);
+						test_submitN(i915, ctx, e, 67);
 				}
 			}
 
 			igt_subtest("submit-chain") {
 				igt_require(has_submit_fence(i915));
-				test_submit_chain(i915);
+				test_submit_chain(i915, ctx);
 			}
 
 			igt_fixture {
@@ -3069,27 +3106,27 @@ igt_main
 			}
 
 			igt_subtest_with_dynamic("busy-hang") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_busy(i915, e, HANG);
+						test_fence_busy(i915, ctx, e, HANG);
 				}
 			}
 			igt_subtest_with_dynamic("wait-hang") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_busy(i915, e, HANG | WAIT);
+						test_fence_busy(i915, ctx, e, HANG | WAIT);
 				}
 			}
 			igt_subtest_with_dynamic("await-hang") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_await(i915, e, HANG);
+						test_fence_await(i915, ctx, e, HANG);
 				}
 			}
 			igt_subtest_with_dynamic("nb-await-hang") {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_fence_await(i915, e, NONBLOCK | HANG);
+						test_fence_await(i915, ctx, e, NONBLOCK | HANG);
 				}
 			}
 			igt_fixture {
@@ -3110,10 +3147,10 @@ igt_main
 		}
 
 		igt_subtest("long-history")
-			test_long_history(i915, ring_size, 0);
+			test_long_history(i915, ctx, ring_size, 0);
 
 		igt_subtest("expired-history")
-			test_long_history(i915, ring_size, EXPIRED);
+			test_long_history(i915, ctx, ring_size, EXPIRED);
 	}
 
 	igt_subtest_group { /* syncobj */
@@ -3139,7 +3176,7 @@ igt_main
 			test_syncobj_signal(i915);
 
 		igt_subtest("syncobj-wait")
-			test_syncobj_wait(i915);
+			test_syncobj_wait(i915, ctx);
 
 		igt_subtest("syncobj-export")
 			test_syncobj_export(i915);
@@ -3187,7 +3224,7 @@ igt_main
 
 		igt_describe(test_syncobj_timeline_wait_desc);
 		igt_subtest("syncobj-timeline-wait")
-			test_syncobj_timeline_wait(i915);
+			test_syncobj_timeline_wait(i915, ctx);
 
 		igt_describe(test_syncobj_timeline_export_desc);
 		igt_subtest("syncobj-timeline-export")
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
