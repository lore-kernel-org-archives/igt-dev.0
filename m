Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560A2732D9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Dec 2021 06:41:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  3 Dec 2021 07:40:49 +0100
Message-Id: <20211203064049.9953-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211203064049.9953-1-zbigniew.kempczynski@intel.com>
References: <20211203064049.9953-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] i915/gem_exec_fence: Allow wait_bb to
 run on !rcs
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

From Haswell up until gen12, only rcs supports all the registers and MI
commands required to build the wait batch; before Haswell MI does not
support the required MATH operations nor the predication. However, after
gen12 we may not always have rcs available and so require to run the
delay on other command streamers, which requires us to use the
appropriate mmio base for the alternate engine.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/i915/gem_exec_fence.c | 141 ++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 69 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 8859c81cd..9a6336ce9 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2490,13 +2490,6 @@ struct inter_engine_context {
 		void *write_ptrs[2];
 	} *batches;
 
-	void *wait_bb;
-	uint32_t wait_bb_len;
-	uint32_t wait_bb_handle;
-
-	void *jump_ptr;
-	void *timestamp2_ptr;
-
 	const intel_ctx_t *wait_ctx;
 	uint32_t wait_timeline;
 
@@ -2549,37 +2542,73 @@ static void submit_timeline_execbuf(struct inter_engine_context *context,
 	gem_execbuf(context->fd, execbuf);
 }
 
-static void build_wait_bb(struct inter_engine_context *context,
-			  uint64_t delay,
-			  uint64_t timestamp_frequency)
+static unsigned int offset_in_page(void *addr)
+{
+	return (uintptr_t)addr & 4095;
+}
+
+static uint64_t
+get_cs_timestamp_frequency(int fd)
 {
-	uint32_t *bb = context->wait_bb = calloc(1, 4096);
+	int cs_ts_freq = 0;
+	drm_i915_getparam_t gp;
+
+	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
+	gp.value = &cs_ts_freq;
+	if (igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
+		return cs_ts_freq;
+
+	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
+}
+
+static struct drm_i915_gem_exec_object2
+build_wait_bb(int i915,
+	      const struct intel_execution_engine2 *engine,
+	      uint64_t delay,
+	      struct drm_i915_gem_relocation_entry *relocs)
+{
+	const uint64_t timestamp_frequency = get_cs_timestamp_frequency(i915);
 	uint64_t wait_value =
 		0xffffffffffffffff - (delay * timestamp_frequency) / NSEC_PER_SEC;
+	struct drm_i915_gem_exec_object2 obj = {};
+	uint32_t mmio_base = gem_engine_mmio_base(i915, engine->name);
+	uint32_t *map, *bb;
+
+	igt_debug("%s wait_value=0x%"PRIx64", %x\n", engine->name, wait_value, mmio_base);
+	igt_assert(mmio_base);
+
+	obj.handle = gem_create(i915, 4096);
+	obj.relocs_ptr = to_user_pointer(memset(relocs, 0, sizeof(*relocs)));
+	obj.relocation_count = 1;
+	obj.offset = 64 << 20;
 
-	igt_debug("wait_value=0x%"PRIx64"\n", wait_value);
+	relocs->target_handle = obj.handle;
+	relocs->presumed_offset = obj.offset;
+
+	map = gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_WRITE);
+	bb = map;
 
 	*bb++ = MI_LOAD_REGISTER_IMM;
-	*bb++ = 0x2000 + HSW_CS_GPR(0);
+	*bb++ = mmio_base + HSW_CS_GPR(0);
 	*bb++ = wait_value & 0xffffffff;
 	*bb++ = MI_LOAD_REGISTER_IMM;
-	*bb++ = 0x2000 + HSW_CS_GPR(0) + 4;
+	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
 	*bb++ = wait_value >> 32;
 
 	*bb++ = MI_LOAD_REGISTER_REG;
-	*bb++ = 0x2000 + RING_TIMESTAMP;
-	*bb++ = 0x2000 + HSW_CS_GPR(1);
+	*bb++ = mmio_base + RING_TIMESTAMP;
+	*bb++ = mmio_base + HSW_CS_GPR(1);
 	*bb++ = MI_LOAD_REGISTER_IMM;
-	*bb++ = 0x2000 + HSW_CS_GPR(1) + 4;
+	*bb++ = mmio_base + HSW_CS_GPR(1) + 4;
 	*bb++ = 0;
 
-	context->timestamp2_ptr = bb;
-	*bb++ = MI_LOAD_REGISTER_REG;
-	*bb++ = 0x2000 + RING_TIMESTAMP;
-	*bb++ = 0x2000 + HSW_CS_GPR(2);
 	*bb++ = MI_LOAD_REGISTER_IMM;
-	*bb++ = 0x2000 + HSW_CS_GPR(2) + 4;
+	*bb++ = mmio_base + HSW_CS_GPR(2) + 4;
 	*bb++ = 0;
+	relocs->delta = offset_in_page(bb);
+	*bb++ = MI_LOAD_REGISTER_REG;
+	*bb++ = mmio_base + RING_TIMESTAMP;
+	*bb++ = mmio_base + HSW_CS_GPR(2);
 
 	*bb++ = MI_MATH(4);
 	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(2));
@@ -2594,52 +2623,47 @@ static void build_wait_bb(struct inter_engine_context *context,
 	*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
 
 	*bb++ = MI_LOAD_REGISTER_REG;
-	*bb++ = 0x2000 + HSW_CS_GPR(4);
-	*bb++ = 0x2000 + MI_PREDICATE_RESULT_1;
+	*bb++ = mmio_base + HSW_CS_GPR(4);
+	*bb++ = mmio_base + MI_PREDICATE_RESULT_1;
 
 	*bb++ = MI_BATCH_BUFFER_START | MI_BATCH_PREDICATE | 1;
-	context->jump_ptr = bb;
-	*bb++ = 0;
-	*bb++ = 0;
+	relocs->offset = offset_in_page(bb);
+	*bb++ = obj.offset + relocs->delta;
+	*bb++ = obj.offset >> 32;
 
 	*bb++ = MI_BATCH_BUFFER_END;
 
-	context->wait_bb_len = ALIGN((void *) bb - context->wait_bb, 8);
+	munmap(map, 4096);
+	return obj;
 }
 
-static void wait_engine(struct inter_engine_context *context,
+static void wait_engine(int i915,
+			struct inter_engine_context *context,
 			uint32_t run_engine_idx,
 			uint32_t signal_syncobj,
 			uint64_t signal_value)
 {
-	struct drm_i915_gem_relocation_entry relocs[1];
+	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 objects[2] = {
 		context->engine_counter_object,
-		{
-			.handle = context->wait_bb_handle,
-			.relocs_ptr = to_user_pointer(&relocs),
-			.relocation_count = ARRAY_SIZE(relocs),
-		},
+		build_wait_bb(i915,
+			      &context->engines.engines[run_engine_idx],
+			      20 * 1000 * 1000ull /* 20ms */,
+			      &reloc),
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&objects[0]),
 		.buffer_count = 2,
-		.flags = I915_EXEC_HANDLE_LUT,
 		.rsvd1 = context->wait_ctx->id,
-		.batch_len = context->wait_bb_len,
+		.flags = I915_EXEC_NO_RELOC,
+		.batch_len = 4096,
 	};
 
-	memset(&relocs, 0, sizeof(relocs));
-
-	/* MI_BATCH_BUFFER_START */
-	relocs[0].target_handle = 1;
-	relocs[0].delta = context->timestamp2_ptr - context->wait_bb;
-	relocs[0].offset = context->jump_ptr - context->wait_bb;
-	relocs[0].presumed_offset = -1;
-
 	submit_timeline_execbuf(context, &execbuf, run_engine_idx,
 				0, 0,
 				signal_syncobj, signal_value);
+
+	gem_close(i915, objects[1].handle);
 }
 
 static void build_increment_engine_bb(struct inter_engine_batches *batch,
@@ -2775,20 +2799,6 @@ static uint64_t fib(uint32_t iters)
 	return last_value;
 }
 
-static uint64_t
-get_cs_timestamp_frequency(int fd)
-{
-	int cs_ts_freq = 0;
-	drm_i915_getparam_t gp;
-
-	gp.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY;
-	gp.value = &cs_ts_freq;
-	if (igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp) == 0)
-		return cs_ts_freq;
-
-	igt_skip("Kernel with PARAM_CS_TIMESTAMP_FREQUENCY support required\n");
-}
-
 static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd,
 					 const intel_ctx_cfg_t *cfg)
 {
@@ -2812,11 +2822,6 @@ static void setup_timeline_chain_engines(struct inter_engine_context *context, i
 					 I915_CONTEXT_MAX_USER_PRIORITY - ARRAY_SIZE(context->iterations) + i);
 	}
 
-	build_wait_bb(context, 20 * 1000 * 1000ull /* 20ms */, get_cs_timestamp_frequency(fd));
-	context->wait_bb_handle = gem_create(fd, 4096);
-	gem_write(fd, context->wait_bb_handle, 0,
-		  context->wait_bb, context->wait_bb_len);
-
 	context->batches = calloc(context->engines.nengines,
 				  sizeof(*context->batches));
 	for (uint32_t e = 0; e < context->engines.nengines; e++) {
@@ -2854,8 +2859,6 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
 
 	intel_ctx_destroy(context->fd, context->wait_ctx);
 	syncobj_destroy(context->fd, context->wait_timeline);
-	gem_close(context->fd, context->wait_bb_handle);
-	free(context->wait_bb);
 
 	for (uint32_t e = 0; e < context->engines.nengines; e++) {
 		struct inter_engine_batches *batches = &context->batches[e];
@@ -2878,7 +2881,7 @@ static void test_syncobj_timeline_chain_engines(int fd, const intel_ctx_cfg_t *c
 	 * Delay all the other operations by making them depend on an
 	 * active wait on the RCS.
 	 */
-	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+	wait_engine(fd, &ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
 		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
@@ -2938,7 +2941,7 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, const intel_c
 	 * Delay all the other operations by making them depend on an
 	 * active wait on the RCS.
 	 */
-	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+	wait_engine(fd, &ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
 		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
@@ -2999,7 +3002,7 @@ static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx
 	 * Delay all the other operations by making them depend on an
 	 * active wait on the RCS.
 	 */
-	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+	wait_engine(fd, &ctx, 0, ctx.wait_timeline, 1);
 
 	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
 		for (uint32_t engine = 0; engine < ctx.engines.nengines; engine++) {
-- 
2.26.0
