Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0426EAB9
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2020 13:41:32 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 31 Jul 2020 16:41:20 +0300
Message-Id: <20200731134120.156288-6-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200731134120.156288-1-lionel.g.landwerlin@intel.com>
References: <20200731134120.156288-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/i915/gem_exec_fence: add engine
 chaining tests
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

Those tests are meant to verify the ordering while messing around with
the timeline points.

v2: Add munmap() (Chris)

v3: Rebase
    Drop gem_context_set_all_engines()
    Fix subtest require on number of engines

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/intel_reg.h             |   2 +
 tests/i915/gem_exec_fence.c | 635 ++++++++++++++++++++++++++++++++++++
 2 files changed, 637 insertions(+)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 0a9ee34c..ac1fc6cb 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2596,6 +2596,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 /* Batch */
 #define MI_BATCH_BUFFER		((0x30 << 23) | 1)
 #define MI_BATCH_BUFFER_START	(0x31 << 23)
+#define MI_BATCH_BUFFER_START_GEN8 ((0x31 << 13) | 1)
+#define   MI_BATCH_PREDICATE       (1 << 15) /* HSW+ on RCS only*/
 #define MI_BATCH_BUFFER_END	(0xA << 23)
 #define MI_COND_BATCH_BUFFER_END	(0x36 << 23)
 #define MI_DO_COMPARE                   (1 << 21)
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 97439b4b..403fe081 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2220,6 +2220,617 @@ static void test_syncobj_timeline_repeat(int fd)
 	free(values);
 }
 
+#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
+
+/* #define MI_LOAD_REGISTER_MEM	   (MI_INSTR(0x29, 1) */
+/* #define MI_LOAD_REGISTER_MEM_GEN8  MI_INSTR(0x29, 2) */
+
+#define MI_LOAD_REGISTER_REG       MI_INSTR(0x2A, 1)
+
+#define MI_STORE_REGISTER_MEM      MI_INSTR(0x24, 1)
+#define MI_STORE_REGISTER_MEM_GEN8 MI_INSTR(0x24, 2)
+
+#define MI_MATH(x)                 MI_INSTR(0x1a, (x) - 1)
+#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
+/* Opcodes for MI_MATH_INSTR */
+#define   MI_MATH_NOOP			MI_MATH_INSTR(0x00,  0x0, 0x0)
+#define   MI_MATH_LOAD(op1, op2)	MI_MATH_INSTR(0x80,  op1, op2)
+#define   MI_MATH_LOADINV(op1, op2)	MI_MATH_INSTR(0x480, op1, op2)
+#define   MI_MATH_ADD			MI_MATH_INSTR(0x100, 0x0, 0x0)
+#define   MI_MATH_SUB			MI_MATH_INSTR(0x101, 0x0, 0x0)
+#define   MI_MATH_AND			MI_MATH_INSTR(0x102, 0x0, 0x0)
+#define   MI_MATH_OR			MI_MATH_INSTR(0x103, 0x0, 0x0)
+#define   MI_MATH_XOR			MI_MATH_INSTR(0x104, 0x0, 0x0)
+#define   MI_MATH_STORE(op1, op2)	MI_MATH_INSTR(0x180, op1, op2)
+#define   MI_MATH_STOREINV(op1, op2)	MI_MATH_INSTR(0x580, op1, op2)
+/* Registers used as operands in MI_MATH_INSTR */
+#define   MI_MATH_REG(x)		(x)
+#define   MI_MATH_REG_SRCA		0x20
+#define   MI_MATH_REG_SRCB		0x21
+#define   MI_MATH_REG_ACCU		0x31
+#define   MI_MATH_REG_ZF		0x32
+#define   MI_MATH_REG_CF		0x33
+
+#define HSW_CS_GPR(n)                   (0x600 + 8*(n))
+#define RING_TIMESTAMP                  (0x358)
+#define MI_PREDICATE_RESULT_1           (0x41c)
+
+struct inter_engine_context {
+	int fd;
+
+	struct {
+		uint32_t context;
+	} iterations[9];
+
+	struct intel_engine_data *engines;
+
+	struct inter_engine_batches {
+		void *increment_bb;
+		uint32_t increment_bb_len;
+		uint32_t increment_bb_handle;
+
+		uint32_t timeline;
+
+		void *read0_ptrs[2];
+		void *read1_ptrs[2];
+		void *write_ptrs[2];
+	} *batches;
+
+	void *wait_bb;
+	uint32_t wait_bb_len;
+	uint32_t wait_bb_handle;
+
+	void *jump_ptr;
+	void *timestamp2_ptr;
+
+	uint32_t wait_context;
+	uint32_t wait_timeline;
+
+	struct drm_i915_gem_exec_object2 engine_counter_object;
+};
+
+static void submit_timeline_execbuf(struct inter_engine_context *context,
+				    struct drm_i915_gem_execbuffer2 *execbuf,
+				    uint32_t run_engine_idx,
+				    uint32_t wait_syncobj,
+				    uint64_t wait_value,
+				    uint32_t signal_syncobj,
+				    uint64_t signal_value)
+{
+	uint64_t values[2] = { 0, };
+	struct drm_i915_gem_exec_fence fences[2] = { 0, };
+	struct drm_i915_gem_execbuffer_ext_timeline_fences fence_list = {
+		.base = {
+			.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES,
+		},
+		.handles_ptr = to_user_pointer(fences),
+		.values_ptr = to_user_pointer(values),
+	};
+
+	if (wait_syncobj) {
+		fences[fence_list.fence_count] = (struct drm_i915_gem_exec_fence) {
+			.handle = wait_syncobj,
+			.flags = I915_EXEC_FENCE_WAIT,
+		};
+		values[fence_list.fence_count] = wait_value;
+		fence_list.fence_count++;
+	}
+
+	if (signal_syncobj) {
+		fences[fence_list.fence_count] = (struct drm_i915_gem_exec_fence) {
+			.handle = signal_syncobj,
+			.flags = I915_EXEC_FENCE_SIGNAL,
+		};
+		values[fence_list.fence_count] = signal_value;
+		fence_list.fence_count++;
+	}
+
+	if (wait_syncobj || signal_syncobj) {
+		execbuf->flags |= I915_EXEC_USE_EXTENSIONS;
+		execbuf->cliprects_ptr = to_user_pointer(&fence_list);
+	}
+
+	execbuf->flags |= context->engines->engines[run_engine_idx].flags;
+
+	gem_execbuf(context->fd, execbuf);
+}
+
+static void build_wait_bb(struct inter_engine_context *context,
+			  uint64_t delay,
+			  uint64_t timestamp_frequency)
+{
+	uint32_t *bb = context->wait_bb = calloc(1, 4096);
+	uint64_t wait_value =
+		0xffffffffffffffff - (delay * timestamp_frequency) / NSEC_PER_SEC;
+
+	igt_debug("wait_value=0x%lx\n", wait_value);
+
+	*bb++ = MI_LOAD_REGISTER_IMM;
+	*bb++ = 0x2000 + HSW_CS_GPR(0);
+	*bb++ = wait_value & 0xffffffff;
+	*bb++ = MI_LOAD_REGISTER_IMM;
+	*bb++ = 0x2000 + HSW_CS_GPR(0) + 4;
+	*bb++ = wait_value >> 32;
+
+	*bb++ = MI_LOAD_REGISTER_REG;
+	*bb++ = 0x2000 + RING_TIMESTAMP;
+	*bb++ = 0x2000 + HSW_CS_GPR(1);
+	*bb++ = MI_LOAD_REGISTER_IMM;
+	*bb++ = 0x2000 + HSW_CS_GPR(1) + 4;
+	*bb++ = 0;
+
+	context->timestamp2_ptr = bb;
+	*bb++ = MI_LOAD_REGISTER_REG;
+	*bb++ = 0x2000 + RING_TIMESTAMP;
+	*bb++ = 0x2000 + HSW_CS_GPR(2);
+	*bb++ = MI_LOAD_REGISTER_IMM;
+	*bb++ = 0x2000 + HSW_CS_GPR(2) + 4;
+	*bb++ = 0;
+
+	*bb++ = MI_MATH(4);
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(2));
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+	*bb++ = MI_MATH_SUB;
+	*bb++ = MI_MATH_STORE(MI_MATH_REG(3), MI_MATH_REG_ACCU);
+
+	*bb++ = MI_MATH(4);
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(3));
+	*bb++ = MI_MATH_ADD;
+	*bb++ = MI_MATH_STOREINV(MI_MATH_REG(4), MI_MATH_REG_CF);
+
+	*bb++ = MI_LOAD_REGISTER_REG;
+	*bb++ = 0x2000 + HSW_CS_GPR(4);
+	*bb++ = 0x2000 + MI_PREDICATE_RESULT_1;
+
+	*bb++ = MI_BATCH_BUFFER_START | MI_BATCH_PREDICATE | 1;
+	context->jump_ptr = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+
+	*bb++ = MI_BATCH_BUFFER_END;
+
+	context->wait_bb_len = ALIGN((void *) bb - context->wait_bb, 8);
+}
+
+static void wait_engine(struct inter_engine_context *context,
+			uint32_t run_engine_idx,
+			uint32_t signal_syncobj,
+			uint64_t signal_value)
+{
+	struct drm_i915_gem_relocation_entry relocs[1];
+	struct drm_i915_gem_exec_object2 objects[2] = {
+		context->engine_counter_object,
+		{
+			.handle = context->wait_bb_handle,
+			.relocs_ptr = to_user_pointer(&relocs),
+			.relocation_count = ARRAY_SIZE(relocs),
+		},
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&objects[0]),
+		.buffer_count = 2,
+		.flags = I915_EXEC_HANDLE_LUT,
+		.rsvd1 = context->wait_context,
+		.batch_len = context->wait_bb_len,
+	};
+
+	memset(&relocs, 0, sizeof(relocs));
+
+	/* MI_BATCH_BUFFER_START */
+	relocs[0].target_handle = 1;
+	relocs[0].delta = context->timestamp2_ptr - context->wait_bb;
+	relocs[0].offset = context->jump_ptr - context->wait_bb;
+	relocs[0].presumed_offset = -1;
+
+	submit_timeline_execbuf(context, &execbuf, run_engine_idx,
+				0, 0,
+				signal_syncobj, signal_value);
+}
+
+static void build_increment_engine_bb(struct inter_engine_batches *batch,
+				      uint32_t mmio_base)
+{
+	uint32_t *bb = batch->increment_bb = calloc(1, 4096);
+
+	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(0);
+	batch->read0_ptrs[0] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
+	batch->read0_ptrs[1] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+
+	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(1);
+	batch->read1_ptrs[0] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+	*bb++ = MI_LOAD_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(1) + 4;
+	batch->read1_ptrs[1] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+
+	*bb++ = MI_MATH(4);
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+	*bb++ = MI_MATH_ADD;
+	*bb++ = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
+
+	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(0);
+	batch->write_ptrs[0] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+	*bb++ = MI_STORE_REGISTER_MEM_GEN8;
+	*bb++ = mmio_base + HSW_CS_GPR(0) + 4;
+	batch->write_ptrs[1] = bb;
+	*bb++ = 0;
+	*bb++ = 0;
+
+	*bb++ = MI_BATCH_BUFFER_END;
+
+	batch->increment_bb_len = ALIGN((void *) bb - batch->increment_bb, 8);
+}
+
+static void increment_engine(struct inter_engine_context *context,
+			     uint32_t gem_context,
+			     uint32_t read0_engine_idx,
+			     uint32_t read1_engine_idx,
+			     uint32_t write_engine_idx,
+			     uint32_t wait_syncobj,
+			     uint64_t wait_value,
+			     uint32_t signal_syncobj,
+			     uint64_t signal_value)
+{
+	struct inter_engine_batches *batch = &context->batches[write_engine_idx];
+	struct drm_i915_gem_relocation_entry relocs[3 * 2];
+	struct drm_i915_gem_exec_object2 objects[2] = {
+		context->engine_counter_object,
+		{
+			.handle = batch->increment_bb_handle,
+			.relocs_ptr = to_user_pointer(relocs),
+			.relocation_count = ARRAY_SIZE(relocs),
+		},
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&objects[0]),
+		.buffer_count = ARRAY_SIZE(objects),
+		.flags = I915_EXEC_HANDLE_LUT,
+		.rsvd1 = gem_context,
+		.batch_len = batch->increment_bb_len,
+	};
+
+	memset(relocs, 0, sizeof(relocs));
+
+	/* MI_LOAD_REGISTER_MEM */
+	relocs[0].target_handle = 0;
+	relocs[0].delta = read0_engine_idx * 8;
+	relocs[0].offset = batch->read0_ptrs[0] - batch->increment_bb;
+	relocs[0].presumed_offset = -1;
+	relocs[1].target_handle = 0;
+	relocs[1].delta = read0_engine_idx * 8 + 4;
+	relocs[1].offset = batch->read0_ptrs[1] - batch->increment_bb;
+	relocs[1].presumed_offset = -1;
+
+	/* MI_LOAD_REGISTER_MEM */
+	relocs[2].target_handle = 0;
+	relocs[2].delta = read1_engine_idx * 8;
+	relocs[2].offset = batch->read1_ptrs[0] - batch->increment_bb;
+	relocs[2].presumed_offset = -1;
+	relocs[3].target_handle = 0;
+	relocs[3].delta = read1_engine_idx * 8 + 4;
+	relocs[3].offset = batch->read1_ptrs[1] - batch->increment_bb;
+	relocs[3].presumed_offset = -1;
+
+	/* MI_STORE_REGISTER_MEM */
+	relocs[4].target_handle = 0;
+	relocs[4].delta = write_engine_idx * 8;
+	relocs[4].offset = batch->write_ptrs[0] - batch->increment_bb;
+	relocs[4].presumed_offset = -1;
+	relocs[5].target_handle = 0;
+	relocs[5].delta = write_engine_idx * 8 + 4;
+	relocs[5].offset = batch->write_ptrs[1] - batch->increment_bb;
+	relocs[5].presumed_offset = -1;
+
+	submit_timeline_execbuf(context, &execbuf, write_engine_idx,
+				wait_syncobj, wait_value,
+				signal_syncobj, signal_value);
+
+	context->engine_counter_object = objects[0];
+}
+
+static uint64_t fib(uint32_t iters)
+{
+	uint64_t last_value = 0;
+	uint64_t value = 1;
+	uint32_t i = 0;
+
+	while (i < iters) {
+		uint64_t new_value = value + last_value;
+
+		last_value = value;
+		value = new_value;
+		i++;
+	}
+
+	return last_value;
+}
+
+static uint64_t
+get_cs_timestamp_frequency(int fd)
+{
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
+static void setup_timeline_chain_engines(struct inter_engine_context *context, int fd, struct intel_engine_data *engines)
+{
+	memset(context, 0, sizeof(*context));
+
+	context->fd = fd;
+	context->engines = engines;
+
+	context->wait_context = gem_context_create(fd);
+	context->wait_timeline = syncobj_create(fd, 0);
+
+	context->engine_counter_object.handle = gem_create(fd, 4096);
+
+	for (uint32_t i = 0; i < ARRAY_SIZE(context->iterations); i++) {
+		context->iterations[i].context = gem_context_clone_with_engines(fd, 0);
+
+		/* Give a different priority to all contexts. */
+		gem_context_set_priority(fd, context->iterations[i].context,
+					 I915_CONTEXT_MAX_USER_PRIORITY - ARRAY_SIZE(context->iterations) + i);
+	}
+
+	build_wait_bb(context, 20 * 1000 * 1000ull /* 20ms */, get_cs_timestamp_frequency(fd));
+	context->wait_bb_handle = gem_create(fd, 4096);
+	gem_write(fd, context->wait_bb_handle, 0,
+		  context->wait_bb, context->wait_bb_len);
+
+	context->batches = calloc(engines->nengines, sizeof(*context->batches));
+	for (uint32_t e = 0; e < engines->nengines; e++) {
+		struct inter_engine_batches *batches = &context->batches[e];
+
+		batches->timeline = syncobj_create(fd, 0);
+
+		build_increment_engine_bb(
+			batches,
+			gem_engine_mmio_base(fd, engines->engines[e].name));
+		batches->increment_bb_handle = gem_create(fd, 4096);
+		gem_write(fd, batches->increment_bb_handle, 0,
+			  batches->increment_bb, batches->increment_bb_len);
+	}
+
+	for (uint32_t i = 0; i < 10; i++)
+		igt_debug("%u = %lu\n", i, fib(i));
+
+	/* Bootstrap the fibonacci sequence */
+	{
+		uint64_t dword = 1;
+		gem_write(fd, context->engine_counter_object.handle,
+			  sizeof(dword) * (context->engines->nengines - 1),
+			  &dword, sizeof(dword));
+	}
+}
+
+static void teardown_timeline_chain_engines(struct inter_engine_context *context)
+{
+	gem_close(context->fd, context->engine_counter_object.handle);
+
+	for (uint32_t i = 0; i < ARRAY_SIZE(context->iterations); i++) {
+		gem_context_destroy(context->fd, context->iterations[i].context);
+	}
+
+	gem_context_destroy(context->fd, context->wait_context);
+	syncobj_destroy(context->fd, context->wait_timeline);
+	gem_close(context->fd, context->wait_bb_handle);
+	free(context->wait_bb);
+
+	for (uint32_t e = 0; e < context->engines->nengines; e++) {
+		struct inter_engine_batches *batches = &context->batches[e];
+
+		syncobj_destroy(context->fd, batches->timeline);
+		gem_close(context->fd, batches->increment_bb_handle);
+		free(batches->increment_bb);
+	}
+	free(context->batches);
+}
+
+static void test_syncobj_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+{
+	struct inter_engine_context ctx;
+	uint64_t *counter_output;
+
+	setup_timeline_chain_engines(&ctx, fd, engines);
+
+	/*
+	 * Delay all the other operations by making them depend on an
+	 * active wait on the RCS.
+	 */
+	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+
+	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
+		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+			uint32_t prev_prev_engine =
+				(engines->nengines + engine - 2) % engines->nengines;
+			uint32_t prev_engine =
+				(engines->nengines + engine - 1) % engines->nengines;
+			/*
+			 * Pick up the wait engine semaphore for the
+			 * first increment, then pick up the previous
+			 * engine's timeline.
+			 */
+			uint32_t wait_syncobj =
+				iter == 0 && engine == 0 ?
+				ctx.wait_timeline : ctx.batches[prev_engine].timeline;
+			uint32_t wait_value =
+				iter == 0 && engine == 0 ?
+				1 : (engine == 0 ? iter : (iter + 1));
+
+			increment_engine(&ctx, ctx.iterations[iter].context,
+					 prev_prev_engine /* read0 engine */,
+					 prev_engine /* read1 engine */,
+					 engine /* write engine */,
+					 wait_syncobj, wait_value,
+					 ctx.batches[engine].timeline, iter + 1);
+		}
+	}
+
+	gem_sync(fd, ctx.engine_counter_object.handle);
+
+	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
+
+	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+		igt_debug("engine %i (%s)\t= %016lx\n", i,
+			  ctx.engines->engines[i].name, counter_output[i]);
+
+	/*
+	 * Verify that we get the fibonacci number expected (we start
+	 * at the sequence on the second number : 1).
+	 */
+	igt_assert_eq(counter_output[engines->nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+
+	munmap(counter_output, 4096);
+
+	teardown_timeline_chain_engines(&ctx);
+}
+
+static void test_syncobj_stationary_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+{
+	struct inter_engine_context ctx;
+	uint64_t *counter_output;
+
+	setup_timeline_chain_engines(&ctx, fd, engines);
+
+	/*
+	 * Delay all the other operations by making them depend on an
+	 * active wait on the RCS.
+	 */
+	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+
+	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
+		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+			uint32_t prev_prev_engine =
+				(engines->nengines + engine - 2) % engines->nengines;
+			uint32_t prev_engine =
+				(engines->nengines + engine - 1) % engines->nengines;
+			/*
+			 * Pick up the wait engine semaphore for the
+			 * first increment, then pick up the previous
+			 * engine's timeline.
+			 */
+			uint32_t wait_syncobj =
+				iter == 0 && engine == 0 ?
+				ctx.wait_timeline : ctx.batches[prev_engine].timeline;
+			/*
+			 * Always signal the value 10. Because the
+			 * signal operations are submitted in order,
+			 * we should always pickup the right
+			 * dma-fence.
+			 */
+			uint32_t wait_value =
+				iter == 0 && engine == 0 ?
+				1 : 10;
+
+			increment_engine(&ctx, ctx.iterations[iter].context,
+					 prev_prev_engine /* read0 engine */,
+					 prev_engine /* read1 engine */,
+					 engine /* write engine */,
+					 wait_syncobj, wait_value,
+					 ctx.batches[engine].timeline, 10);
+		}
+	}
+
+	gem_sync(fd, ctx.engine_counter_object.handle);
+
+	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
+
+	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+		igt_debug("engine %i (%s)\t= %016lx\n", i,
+			  ctx.engines->engines[i].name, counter_output[i]);
+	igt_assert_eq(counter_output[engines->nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+
+	munmap(counter_output, 4096);
+
+	teardown_timeline_chain_engines(&ctx);
+}
+
+static void test_syncobj_backward_timeline_chain_engines(int fd, struct intel_engine_data *engines)
+{
+	struct inter_engine_context ctx;
+	uint64_t *counter_output;
+
+	setup_timeline_chain_engines(&ctx, fd, engines);
+
+	/*
+	 * Delay all the other operations by making them depend on an
+	 * active wait on the RCS.
+	 */
+	wait_engine(&ctx, 0, ctx.wait_timeline, 1);
+
+	for (uint32_t iter = 0; iter < ARRAY_SIZE(ctx.iterations); iter++) {
+		for (uint32_t engine = 0; engine < engines->nengines; engine++) {
+			uint32_t prev_prev_engine =
+				(engines->nengines + engine - 2) % engines->nengines;
+			uint32_t prev_engine =
+				(engines->nengines + engine - 1) % engines->nengines;
+			/*
+			 * Pick up the wait engine semaphore for the
+			 * first increment, then pick up the previous
+			 * engine's timeline.
+			 */
+			uint32_t wait_syncobj =
+				iter == 0 && engine == 0 ?
+				ctx.wait_timeline : ctx.batches[prev_engine].timeline;
+			/*
+			 * Always signal the value 10. Because the
+			 * signal operations are submitted in order,
+			 * we should always pickup the right
+			 * dma-fence.
+			 */
+			uint32_t wait_value =
+				iter == 0 && engine == 0 ?
+				1 : 1;
+
+			increment_engine(&ctx, ctx.iterations[iter].context,
+					 prev_prev_engine /* read0 engine */,
+					 prev_engine /* read1 engine */,
+					 engine /* write engine */,
+					 wait_syncobj, wait_value,
+					 ctx.batches[engine].timeline, ARRAY_SIZE(ctx.iterations) - iter);
+		}
+	}
+
+	gem_sync(fd, ctx.engine_counter_object.handle);
+
+	counter_output = gem_mmap__wc(fd, ctx.engine_counter_object.handle, 0, 4096, PROT_READ);
+
+	for (uint32_t i = 0; i < ctx.engines->nengines; i++)
+		igt_debug("engine %i (%s)\t= %016lx\n", i,
+			  ctx.engines->engines[i].name, counter_output[i]);
+	igt_assert_eq(counter_output[engines->nengines - 1],
+		      fib(ARRAY_SIZE(ctx.iterations) * engines->nengines + 1));
+
+	munmap(counter_output, 4096);
+
+	teardown_timeline_chain_engines(&ctx);
+}
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
@@ -2497,6 +3108,30 @@ igt_main
 		igt_subtest("syncobj-timeline-repeat")
 			test_syncobj_timeline_repeat(i915);
 
+		igt_subtest_group { /* syncobj timeline engine chaining */
+			struct intel_engine_data engines;
+
+			igt_fixture {
+				/*
+				 * We need support for MI_ALU on all
+				 * engines which seems to be there
+				 * only on Gen8+
+				 */
+				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+				engines = intel_init_engine_list(i915, 0);
+				igt_require(engines.nengines > 1);
+			}
+
+			igt_subtest("syncobj-timeline-chain-engines")
+				test_syncobj_timeline_chain_engines(i915, &engines);
+
+			igt_subtest("syncobj-stationary-timeline-chain-engines")
+				test_syncobj_stationary_timeline_chain_engines(i915, &engines);
+
+			igt_subtest("syncobj-backward-timeline-chain-engines")
+				test_syncobj_backward_timeline_chain_engines(i915, &engines);
+		}
+
 		igt_fixture {
 			igt_stop_hang_detector();
 		}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
