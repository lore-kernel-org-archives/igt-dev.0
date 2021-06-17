Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D356E2DC
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:13:09 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so6684505pjn.1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:13:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:12:10 -0500
Message-Id: <20210617191256.577244-4-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/79] tests/i915/gem_exec_fence: Convert to
 intel_ctx_t (v2)
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

v2 (Jason Ekstrand):
 - Pass the context config to gem_submission_measure()

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_fence.c | 244 +++++++++++++++++++++---------------
 1 file changed, 141 insertions(+), 103 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index a86be17b1..ef1bb0ca9 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -31,6 +31,7 @@
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
+#include "intel_ctx.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
@@ -56,7 +57,8 @@ struct sync_merge_data {
 #define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
-static void store(int fd, const struct intel_execution_engine2 *e,
+static void store(int fd, const intel_ctx_t *ctx,
+		  const struct intel_execution_engine2 *e,
 		  int fence, uint32_t target, unsigned offset_value)
 {
 	const int SCRATCH = 0;
@@ -72,6 +74,7 @@ static void store(int fd, const struct intel_execution_engine2 *e,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 2;
 	execbuf.flags = e->flags | I915_EXEC_FENCE_IN;
+	execbuf.rsvd1 = ctx->id;
 	execbuf.rsvd2 = fence;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
@@ -119,7 +122,8 @@ static bool fence_busy(int fence)
 #define NONBLOCK 0x2
 #define WAIT 0x4
 
-static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
+static void test_fence_busy(int fd, const intel_ctx_t *ctx,
+			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -139,6 +143,7 @@ static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -215,7 +220,7 @@ static void test_fence_busy(int fd, const struct intel_execution_engine2 *e,
 	gem_quiescent_gpu(fd);
 }
 
-static void test_fence_busy_all(int fd, unsigned flags)
+static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 {
 	const struct intel_execution_engine2 *e;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -273,7 +278,7 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	i++;
 
 	all = -1;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		int fence, new;
 
 		if ((flags & HANG) == 0 &&
@@ -281,6 +286,7 @@ static void test_fence_busy_all(int fd, unsigned flags)
 			continue;
 
 		execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
+		execbuf.rsvd1 = ctx->id;
 		execbuf.rsvd2 = -1;
 		gem_execbuf_wr(fd, &execbuf);
 		fence = execbuf.rsvd2 >> 32;
@@ -337,7 +343,8 @@ static unsigned int spin_hang(unsigned int flags)
 	return IGT_SPIN_NO_PREEMPTION | IGT_SPIN_INVALID_CS;
 }
 
-static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
+static void test_fence_await(int fd, const intel_ctx_t *ctx,
+			     const struct intel_execution_engine2 *e,
 			     unsigned flags)
 {
 	const struct intel_execution_engine2 *e2;
@@ -351,20 +358,21 @@ static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	spin = igt_spin_new(fd,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
-	__for_each_physical_engine(fd, e2) {
+	for_each_ctx_engine(fd, ctx, e2) {
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
@@ -440,9 +448,10 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
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
@@ -451,8 +460,9 @@ static void test_submit_fence(int i915, unsigned int engine)
 	 * switch to the other batch in order to advance.
 	 */
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e2) {
 		unsigned int offset = 24 << 20;
+		const intel_ctx_t *tmp_ctx;
 		struct drm_i915_gem_exec_object2 obj = {
 			.offset = offset,
 			.flags = EXEC_OBJECT_PINNED,
@@ -468,17 +478,19 @@ static void test_submit_fence(int i915, unsigned int engine)
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
@@ -533,7 +545,9 @@ static uint32_t submitN_batches(int i915, uint32_t offset, int count)
         return handle;
 }
 
-static void test_submitN(int i915, unsigned int engine, int count)
+static void test_submitN(int i915, const intel_ctx_t *ctx,
+			 const struct intel_execution_engine2 *e,
+			 int count)
 {
 	unsigned int offset = 24 << 20;
 	unsigned int sz = ALIGN((count + 1) * 1024, 4096);
@@ -545,7 +559,8 @@ static void test_submitN(int i915, unsigned int engine, int count)
 	struct drm_i915_gem_execbuffer2 execbuf  = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = engine | I915_EXEC_FENCE_OUT,
+		.flags = e->flags | I915_EXEC_FENCE_OUT,
+		.rsvd1 = ctx->id,
 	};
 	uint32_t *result =
 		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
@@ -556,10 +571,11 @@ static void test_submitN(int i915, unsigned int engine, int count)
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	for (int i = 0; i < count; i++) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 		execbuf.batch_start_offset = (i + 1) * 1024;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, tmp_ctx);
 
 		execbuf.flags |= I915_EXEC_FENCE_SUBMIT;
 		execbuf.rsvd2 >>= 32;
@@ -595,7 +611,8 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	return err;
 }
 
-static void test_parallel(int i915, const struct intel_execution_engine2 *e)
+static void test_parallel(int i915, const intel_ctx_t *ctx,
+			  const struct intel_execution_engine2 *e)
 {
 	const struct intel_execution_engine2 *e2;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -609,6 +626,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 
 	fence = igt_cork_plug(&cork, i915),
 	spin = igt_spin_new(i915,
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .fence = fence,
 			    .flags = (IGT_SPIN_FENCE_OUT |
@@ -616,7 +634,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 	close(fence);
 
 	/* Queue all secondaries */
-	__for_each_physical_engine(i915, e2) {
+	for_each_ctx_engine(i915, ctx, e2) {
 		struct drm_i915_gem_relocation_entry reloc = {
 			.target_handle = scratch,
 			.offset = sizeof(uint32_t),
@@ -633,6 +651,7 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 			.buffers_ptr = to_user_pointer(obj),
 			.buffer_count = ARRAY_SIZE(obj),
 			.flags = e2->flags | I915_EXEC_FENCE_SUBMIT,
+			.rsvd1 = ctx->id,
 			.rsvd2 = spin->out_fence,
 		};
 		uint32_t batch[16];
@@ -702,7 +721,8 @@ static void test_parallel(int i915, const struct intel_execution_engine2 *e)
 	igt_spin_free(i915, spin);
 }
 
-static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
+static void test_concurrent(int i915, const intel_ctx_t *ctx,
+			    const struct intel_execution_engine2 *e)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct drm_i915_gem_relocation_entry reloc = {
@@ -722,10 +742,12 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = e->flags | I915_EXEC_FENCE_SUBMIT,
+		.rsvd1 = ctx->id,
 	};
 	IGT_CORK_FENCE(cork);
 	uint32_t batch[16];
 	igt_spin_t *spin;
+	const intel_ctx_t *tmp_ctx;
 	uint32_t result;
 	int fence;
 	int i;
@@ -738,6 +760,7 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 
 	fence = igt_cork_plug(&cork, i915),
 	      spin = igt_spin_new(i915,
+				  .ctx = ctx,
 				  .engine = e->flags,
 				  .fence = fence,
 				  .flags = (IGT_SPIN_FENCE_OUT |
@@ -761,13 +784,14 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
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
@@ -796,7 +820,7 @@ static void test_concurrent(int i915, const struct intel_execution_engine2 *e)
 	igt_spin_free(i915, spin);
 }
 
-static void test_submit_chain(int i915)
+static void test_submit_chain(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin, *sn;
@@ -807,8 +831,9 @@ static void test_submit_chain(int i915)
 	/* Check that we can simultaneously launch spinners on each engine */
 
 	fence = igt_cork_plug(&cork, i915);
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		spin = igt_spin_new(i915,
+				    .ctx = ctx,
 				    .engine = e->flags,
 				    .fence = fence,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -848,7 +873,8 @@ static uint32_t batch_create(int fd)
 	return handle;
 }
 
-static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
+static void test_keep_in_fence(int fd, const intel_ctx_t *ctx,
+			       const struct intel_execution_engine2 *e)
 {
 	struct sigaction sa = { .sa_handler = alarm_handler };
 	struct drm_i915_gem_exec_object2 obj = {
@@ -858,13 +884,14 @@ static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
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
@@ -916,7 +943,8 @@ static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
 }
 
 #define EXPIRED 0x10000
-static void test_long_history(int fd, long ring_size, unsigned flags)
+static void test_long_history(int fd, const intel_ctx_t *ctx,
+			      long ring_size, unsigned flags)
 {
 	const uint32_t sz = 1 << 20;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -933,7 +961,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 		limit = ring_size / 3;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, e)
+	for_each_ctx_engine(fd, ctx, e)
 		engines[nengine++] = e->flags;
 	igt_require(nengine);
 
@@ -947,6 +975,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
 	execbuf.flags = I915_EXEC_FENCE_OUT;
+	execbuf.rsvd1 = ctx->id;
 
 	gem_execbuf_wr(fd, &execbuf);
 	all_fences = execbuf.rsvd2 >> 32;
@@ -957,7 +986,8 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	obj[0].handle = igt_cork_plug(&c, fd);
 
 	igt_until_timeout(5) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+		const intel_ctx_t *tmp_ctx = intel_ctx_create(fd, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 
 		for (n = 0; n < nengine; n++) {
 			struct sync_merge_data merge;
@@ -978,7 +1008,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 			all_fences = merge.fence;
 		}
 
-		gem_context_destroy(fd, execbuf.rsvd1);
+		intel_ctx_destroy(fd, tmp_ctx);
 		if (!--limit)
 			break;
 	}
@@ -992,7 +1022,7 @@ static void test_long_history(int fd, long ring_size, unsigned flags)
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
 	execbuf.rsvd2 = all_fences;
-	execbuf.rsvd1 = 0;
+	execbuf.rsvd1 = ctx->id;
 
 	for (s = 0; s < ring_size; s++) {
 		for (n = 0; n < nengine; n++) {
@@ -1258,7 +1288,7 @@ static void test_syncobj_signal(int fd)
 	syncobj_destroy(fd, fence.handle);
 }
 
-static void test_syncobj_wait(int fd)
+static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj;
@@ -1300,12 +1330,13 @@ static void test_syncobj_wait(int fd)
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
@@ -1998,7 +2029,7 @@ static void test_syncobj_timeline_signal(int fd)
 static const char *test_syncobj_timeline_wait_desc =
 	"Verifies that waiting on a timeline syncobj point between engines"
 	" works";
-static void test_syncobj_timeline_wait(int fd)
+static void test_syncobj_timeline_wait(int fd, const intel_ctx_t *ctx)
 {
 	const uint32_t bbe[2] = {
 		MI_BATCH_BUFFER_END,
@@ -2025,7 +2056,7 @@ static void test_syncobj_timeline_wait(int fd)
 
 	gem_quiescent_gpu(fd);
 
-	spin = igt_spin_new(fd, .engine = ALL_ENGINES);
+	spin = igt_spin_new(fd, .ctx = ctx, .engine = ALL_ENGINES);
 
 	memset(&timeline_fences, 0, sizeof(timeline_fences));
 	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
@@ -2047,12 +2078,13 @@ static void test_syncobj_timeline_wait(int fd)
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
@@ -2342,9 +2374,10 @@ static void test_syncobj_timeline_multiple_ext_nodes(int fd)
 
 struct inter_engine_context {
 	int fd;
+	const intel_ctx_cfg_t *cfg;
 
 	struct {
-		uint32_t context;
+		const intel_ctx_t *ctx;
 	} iterations[9];
 
 	struct intel_engine_data engines;
@@ -2368,7 +2401,7 @@ struct inter_engine_context {
 	void *jump_ptr;
 	void *timestamp2_ptr;
 
-	uint32_t wait_context;
+	const intel_ctx_t *wait_ctx;
 	uint32_t wait_timeline;
 
 	struct drm_i915_gem_exec_object2 engine_counter_object;
@@ -2496,7 +2529,7 @@ static void wait_engine(struct inter_engine_context *context,
 		.buffers_ptr = to_user_pointer(&objects[0]),
 		.buffer_count = 2,
 		.flags = I915_EXEC_HANDLE_LUT,
-		.rsvd1 = context->wait_context,
+		.rsvd1 = context->wait_ctx->id,
 		.batch_len = context->wait_bb_len,
 	};
 
@@ -2563,7 +2596,7 @@ static void build_increment_engine_bb(struct inter_engine_batches *batch,
 }
 
 static void increment_engine(struct inter_engine_context *context,
-			     uint32_t gem_context,
+			     const intel_ctx_t *ctx,
 			     uint32_t read0_engine_idx,
 			     uint32_t read1_engine_idx,
 			     uint32_t write_engine_idx,
@@ -2586,7 +2619,7 @@ static void increment_engine(struct inter_engine_context *context,
 		.buffers_ptr = to_user_pointer(&objects[0]),
 		.buffer_count = ARRAY_SIZE(objects),
 		.flags = I915_EXEC_HANDLE_LUT,
-		.rsvd1 = gem_context,
+		.rsvd1 = ctx->id,
 		.batch_len = batch->increment_bb_len,
 	};
 
@@ -2660,24 +2693,26 @@ get_cs_timestamp_frequency(int fd)
 	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
 }
 
-static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd)
+static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd,
+					 const intel_ctx_cfg_t *cfg)
 {
 	memset(context, 0, sizeof(*context));
 
 	context->fd = fd;
-	context->engines = intel_init_engine_list(fd, 0);
+	context->cfg = cfg;
+	context->engines = intel_engine_list_for_ctx_cfg(fd, cfg);
 	igt_require(context->engines.nengines > 1);
 
-	context->wait_context = gem_context_clone_with_engines(fd, 0);
+	context->wait_ctx = intel_ctx_create(fd, cfg);
 	context->wait_timeline = syncobj_create(fd, 0);
 
 	context->engine_counter_object.handle = gem_create(fd, 4096);
 
 	for (uint32_t i = 0; i < ARRAY_SIZE(context->iterations); i++) {
-		context->iterations[i].context = gem_context_clone_with_engines(fd, 0);
+		context->iterations[i].ctx = intel_ctx_create(fd, context->cfg);
 
 		/* Give a different priority to all contexts. */
-		gem_context_set_priority(fd, context->iterations[i].context,
+		gem_context_set_priority(fd, context->iterations[i].ctx->id,
 					 I915_CONTEXT_MAX_USER_PRIORITY - ARRAY_SIZE(context->iterations) + i);
 	}
 
@@ -2718,10 +2753,10 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
 	gem_close(context->fd, context->engine_counter_object.handle);
 
 	for (uint32_t i = 0; i < ARRAY_SIZE(context->iterations); i++) {
-		gem_context_destroy(context->fd, context->iterations[i].context);
+		intel_ctx_destroy(context->fd, context->iterations[i].ctx);
 	}
 
-	gem_context_destroy(context->fd, context->wait_context);
+	intel_ctx_destroy(context->fd, context->wait_ctx);
 	syncobj_destroy(context->fd, context->wait_timeline);
 	gem_close(context->fd, context->wait_bb_handle);
 	free(context->wait_bb);
@@ -2736,12 +2771,12 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
 	free(context->batches);
 }
 
-static void test_syncobj_timeline_chain_engines(int fd)
+static void test_syncobj_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd);
+	setup_timeline_chain_engines(&ctx, fd, cfg);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2767,7 +2802,7 @@ static void test_syncobj_timeline_chain_engines(int fd)
 				iter == 0 && engine == 0 ?
 				1 : (engine == 0 ? iter : (iter + 1));
 
-			increment_engine(&ctx, ctx.iterations[iter].context,
+			increment_engine(&ctx, ctx.iterations[iter].ctx,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
@@ -2796,12 +2831,12 @@ static void test_syncobj_timeline_chain_engines(int fd)
 	teardown_timeline_chain_engines(&ctx);
 }
 
-static void test_syncobj_stationary_timeline_chain_engines(int fd)
+static void test_syncobj_stationary_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd);
+	setup_timeline_chain_engines(&ctx, fd, cfg);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2833,7 +2868,7 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd)
 				iter == 0 && engine == 0 ?
 				1 : 10;
 
-			increment_engine(&ctx, ctx.iterations[iter].context,
+			increment_engine(&ctx, ctx.iterations[iter].ctx,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
@@ -2857,12 +2892,12 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd)
 	teardown_timeline_chain_engines(&ctx);
 }
 
-static void test_syncobj_backward_timeline_chain_engines(int fd)
+static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
 {
 	struct inter_engine_context ctx;
 	uint64_t *counter_output;
 
-	setup_timeline_chain_engines(&ctx, fd);
+	setup_timeline_chain_engines(&ctx, fd, cfg);
 
 	/*
 	 * Delay all the other operations by making them depend on an
@@ -2894,7 +2929,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd)
 				iter == 0 && engine == 0 ?
 				1 : 1;
 
-			increment_engine(&ctx, ctx.iterations[iter].context,
+			increment_engine(&ctx, ctx.iterations[iter].ctx,
 					 prev_prev_engine /* read0 engine */,
 					 prev_engine /* read1 engine */,
 					 engine /* write engine */,
@@ -2921,6 +2956,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int i915 = -1;
 
 	igt_fixture {
@@ -2928,6 +2964,7 @@ igt_main
 		igt_require_gem(i915);
 		igt_require(gem_has_exec_fence(i915));
 		gem_require_mmap_wc(i915);
+		ctx = intel_ctx_create_all_physical(i915);
 
 		gem_submission_print_method(i915);
 	}
@@ -2940,19 +2977,19 @@ igt_main
 		}
 
 		igt_subtest("basic-busy-all")
-			test_fence_busy_all(i915, 0);
+			test_fence_busy_all(i915, ctx, 0);
 		igt_subtest("basic-wait-all")
-			test_fence_busy_all(i915, WAIT);
+			test_fence_busy_all(i915, ctx, WAIT);
 
 		igt_fixture {
 			igt_stop_hang_detector();
-			hang = igt_allow_hang(i915, 0, 0);
+			hang = igt_allow_hang(i915, ctx->id, 0);
 		}
 
 		igt_subtest("busy-hang-all")
-			test_fence_busy_all(i915, HANG);
+			test_fence_busy_all(i915, ctx, HANG);
 		igt_subtest("wait-hang-all")
-			test_fence_busy_all(i915, WAIT | HANG);
+			test_fence_busy_all(i915, ctx, WAIT | HANG);
 
 		igt_fixture {
 			igt_disallow_hang(i915, hang);
@@ -2960,7 +2997,7 @@ igt_main
 	}
 
 	igt_subtest_group {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_fixture {
 				igt_require(gem_class_can_store_dword(i915, e->class));
 			}
@@ -2971,42 +3008,42 @@ igt_main
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
@@ -3015,9 +3052,9 @@ igt_main
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
 
@@ -3026,9 +3063,9 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(i915));
 				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_submit_fence(i915, e->flags);
+						test_submit_fence(i915, ctx, e);
 				}
 			}
 
@@ -3037,9 +3074,9 @@ igt_main
 				igt_require(gem_scheduler_has_preemption(i915));
 				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name)
-						test_submitN(i915, e->flags, 3);
+						test_submitN(i915, ctx, e, 3);
 				}
 			}
 
@@ -3048,15 +3085,15 @@ igt_main
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
@@ -3072,27 +3109,27 @@ igt_main
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
@@ -3105,7 +3142,8 @@ igt_main
 		long ring_size = 0;
 
 		igt_fixture {
-			ring_size = gem_submission_measure(i915, NULL, ALL_ENGINES);
+			ring_size = gem_submission_measure(i915, &ctx->cfg,
+							   ALL_ENGINES);
 			igt_info("Ring size: %ld batches\n", ring_size);
 			igt_require(ring_size);
 
@@ -3113,10 +3151,10 @@ igt_main
 		}
 
 		igt_subtest("long-history")
-			test_long_history(i915, ring_size, 0);
+			test_long_history(i915, ctx, ring_size, 0);
 
 		igt_subtest("expired-history")
-			test_long_history(i915, ring_size, EXPIRED);
+			test_long_history(i915, ctx, ring_size, EXPIRED);
 	}
 
 	igt_subtest_group { /* syncobj */
@@ -3142,7 +3180,7 @@ igt_main
 			test_syncobj_signal(i915);
 
 		igt_subtest("syncobj-wait")
-			test_syncobj_wait(i915);
+			test_syncobj_wait(i915, ctx);
 
 		igt_subtest("syncobj-export")
 			test_syncobj_export(i915);
@@ -3190,7 +3228,7 @@ igt_main
 
 		igt_describe(test_syncobj_timeline_wait_desc);
 		igt_subtest("syncobj-timeline-wait")
-			test_syncobj_timeline_wait(i915);
+			test_syncobj_timeline_wait(i915, ctx);
 
 		igt_describe(test_syncobj_timeline_export_desc);
 		igt_subtest("syncobj-timeline-export")
@@ -3215,13 +3253,13 @@ igt_main
 			}
 
 			igt_subtest("syncobj-timeline-chain-engines")
-				test_syncobj_timeline_chain_engines(i915);
+				test_syncobj_timeline_chain_engines(i915, &ctx->cfg);
 
 			igt_subtest("syncobj-stationary-timeline-chain-engines")
-				test_syncobj_stationary_timeline_chain_engines(i915);
+				test_syncobj_stationary_timeline_chain_engines(i915, &ctx->cfg);
 
 			igt_subtest("syncobj-backward-timeline-chain-engines")
-				test_syncobj_backward_timeline_chain_engines(i915);
+				test_syncobj_backward_timeline_chain_engines(i915, &ctx->cfg);
 		}
 
 		igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
