Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  1 Jun 2020 20:08:09 +0100
Message-Id: <20200601190809.1174616-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Try to spot
 unfairness
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

An important property for multi-client systems is that each client gets
a 'fair' allotment of system time. (Where fairness is at the whim of the
context properties, such as priorities.) This test forks N independent
clients (albeit they happen to share a single vm), and does an equal
amount of work in client and asserts that they take an equal amount of
time.

Though we have never claimed to have a completely fair scheduler, that
is what is expected.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/gem_exec_schedule.c | 224 +++++++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 56c638833..0ec21bf54 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -2495,6 +2495,227 @@ static void measure_semaphore_power(int i915)
 	rapl_close(&pkg);
 }
 
+static int read_timestamp_frequency(int i915)
+{
+	int value = 0;
+	drm_i915_getparam_t gp = {
+		.value = &value,
+		.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY,
+	};
+	ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
+	return value;
+}
+
+static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
+{
+	return (x + y - 1) / y;
+}
+
+static uint64_t ns_to_ticks(int i915, uint64_t ns)
+{
+	return div64_u64_round_up(ns * read_timestamp_frequency(i915),
+				  1000000000);
+}
+
+#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
+
+#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
+#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
+/* Opcodes for MI_MATH_INSTR */
+#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
+#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
+#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
+#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
+#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
+#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
+#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
+#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
+#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
+#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
+#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
+#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
+/* Registers used as operands in MI_MATH_INSTR */
+#define   MI_MATH_REG(x)                (x)
+#define   MI_MATH_REG_SRCA              0x20
+#define   MI_MATH_REG_SRCB              0x21
+#define   MI_MATH_REG_ACCU              0x31
+#define   MI_MATH_REG_ZF                0x32
+#define   MI_MATH_REG_CF                0x33
+
+#define MI_LOAD_REGISTER_REG    MI_INSTR(0x2A, 1)
+
+static void async_delay(int i915,
+			const struct intel_execution_engine2 *e,
+			uint32_t handle,
+			uint64_t addr,
+			uint64_t ns)
+{
+	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
+	const uint32_t base = gem_engine_mmio_base(i915, e->name);
+#define CS_GPR(x) (base + 0x600 + 8 * (x))
+#define TIMESTAMP (base + 0x3a8)
+	enum { START_TS, NOW_TS };
+	uint32_t *map, *cs, *jmp;
+
+	igt_require(base);
+
+	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
+
+	*cs++ = MI_LOAD_REGISTER_IMM;
+	*cs++ = CS_GPR(START_TS) + 4;
+	*cs++ = 0;
+	*cs++ = MI_LOAD_REGISTER_REG;
+	*cs++ = TIMESTAMP;
+	*cs++ = CS_GPR(START_TS);
+
+	if (offset_in_page(cs) & 4)
+		*cs++ = 0;
+	jmp = cs;
+
+	*cs++ = 0x5 << 23; /* MI_ARB_CHECK */
+
+	*cs++ = MI_LOAD_REGISTER_IMM;
+	*cs++ = CS_GPR(NOW_TS) + 4;
+	*cs++ = 0;
+	*cs++ = MI_LOAD_REGISTER_REG;
+	*cs++ = TIMESTAMP;
+	*cs++ = CS_GPR(NOW_TS);
+
+	*cs++ = MI_MATH(4);
+	*cs++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(NOW_TS));
+	*cs++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(START_TS));
+	*cs++ = MI_MATH_SUB;
+	*cs++ = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
+
+	*cs++ = 0x24 << 23 | (1 + use_64b); /* SRM */
+	*cs++ = CS_GPR(NOW_TS);
+	*cs++ = addr + 4000;
+	*cs++ = addr >> 32;
+
+	*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (1 + use_64b);
+	*cs++ = ~ns_to_ticks(i915, ns);
+	*cs++ = addr + 4000;
+	*cs++ = addr >> 32;
+
+	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | use_64b;
+	*cs++ = addr + offset_in_page(jmp);
+	*cs++ = addr >> 32;
+
+	munmap(map, 4096);
+}
+
+static struct drm_i915_gem_exec_object2
+timed_create(int i915, uint32_t ctx,
+	     const struct intel_execution_engine2 *e,
+	     uint64_t target_ns)
+{
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = batch_create(i915),
+		.flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+		.rsvd1 = ctx,
+		.flags = e->flags,
+	};
+
+	gem_execbuf(i915, &execbuf);
+	gem_sync(i915, obj.handle);
+
+	async_delay(i915, e, obj.handle, obj.offset, target_ns);
+
+	obj.flags |= EXEC_OBJECT_PINNED;
+	return obj;
+}
+
+static void fair_child(int i915, uint32_t ctx,
+		       const struct intel_execution_engine2 *e,
+		       uint64_t frame_ns,
+		       int timeout,
+		       unsigned long *out)
+{
+	const int batches_per_frame = 3;
+	struct drm_i915_gem_exec_object2 prev =
+		timed_create(i915, ctx, e, frame_ns / batches_per_frame);
+	struct drm_i915_gem_exec_object2 next =
+		timed_create(i915, ctx, e, frame_ns / batches_per_frame);
+	struct timespec tv = {};
+	unsigned long count = 0;
+
+	igt_nsec_elapsed(&tv);
+	igt_until_timeout(timeout) {
+		struct drm_i915_gem_execbuffer2 execbuf = {
+			.buffers_ptr = to_user_pointer(&next),
+			.buffer_count = 1,
+			.rsvd1 = ctx,
+			.flags = e->flags,
+		};
+
+		for (int n = 0; n < batches_per_frame; n++)
+			gem_execbuf(i915, &execbuf);
+
+		gem_sync(i915, prev.handle);
+		igt_swap(prev, next);
+		count++;
+	}
+	gem_sync(i915, prev.handle);
+	*out = igt_nsec_elapsed(&tv) / count;
+
+	gem_close(i915, next.handle);
+	gem_close(i915, prev.handle);
+}
+
+static int ul_cmp(const void *A, const void *B)
+{
+	const unsigned long *a = A, *b = B;
+
+	if (*a < *b)
+		return -1;
+	else if (*a > *b)
+		return 1;
+	else
+		return 0;
+}
+
+static void fairness(int i915,
+		     const struct intel_execution_engine2 *e,
+		     int timeout)
+{
+	const int frame_ns = 16666 * 1000;
+	unsigned long *result;
+
+	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
+
+	result = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+
+	for (int n = 2; n <= 16; n <<= 1) {
+		int nchild = n - 1; /* odd for easy medians */
+
+		memset(result, 0, nchild * sizeof(result[0]));
+		igt_fork(child, nchild) {
+			uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+
+
+			fair_child(i915, ctx, e, frame_ns / nchild,
+				   timeout, &result[child]);
+
+			gem_context_destroy(i915, ctx);
+		}
+		igt_waitchildren();
+
+		qsort(result, nchild, sizeof(*result), ul_cmp);
+		igt_info("%d clients, range: [%lu, %lu], median: %lu\n",
+			 nchild, result[0], result[nchild-1], result[nchild/2]);
+
+		igt_assert(4 * result[0] > 3 * result[nchild-1]);
+		igt_assert(3 * result[0] < 4 * result[nchild-1]);
+
+		igt_assert(4 * result[nchild/2] > 3 * frame_ns);
+		igt_assert(3 * result[nchild/2] < 4 * frame_ns);
+	}
+}
+
 #define test_each_engine(T, i915, e) \
 	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
 		igt_dynamic_f("%s", e->name)
@@ -2589,6 +2810,9 @@ igt_main
 		test_each_engine_store("promotion", fd, e)
 			promotion(fd, e->flags);
 
+		test_each_engine_store("fairness", fd, e)
+			fairness(fd, e, 3);
+
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(gem_scheduler_has_preemption(fd));
-- 
2.27.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
