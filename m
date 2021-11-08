Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE336E884
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 19:10:19 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Mon,  8 Nov 2021 11:04:57 -0800
Message-Id: <20211108190457.32198-3-matthew.brost@intel.com>
In-Reply-To: <20211108190457.32198-1-matthew.brost@intel.com>
References: <20211108190457.32198-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] i915/gem_exec_balancer: Test parallel execbuf
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
List-ID: <igt-dev@lists.freedesktop.org>

Add basic parallel execbuf submission test which more or less just
submits the same BB in loop a which does an atomic increment to a memory
location. The memory location is checked at the end for the correct
value. Different sections use various IOCTL options (e.g. fences,
location of BBs, etc...).

In addition to above sections, an additional section ensure the ordering
of parallel submission by submitting a spinning batch to 1 individual
engine, submit a parallel execbuf to all engines instances within the
class, verify none on parallel execbuf make to hardware, release
spinner, and finally verify everything has completed.

The parallel-ordering section assumes default timeslice / preemption
timeout values. If these values are changed the test may fail.

v2:
 (Daniele)
  - Add assert to ensure parallel & load_balance both not set in ctx lib
  - s/count/expected/g in check_bo()
  - use existing query library functions
  - clean up bb_per_execbuf / count usage
  - drop dead loop
  - add comment for parallel-ordering
  - don't declare loop variables inside loop

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/intel_ctx.c                |  30 ++-
 lib/intel_ctx.h                |   2 +
 lib/intel_reg.h                |   5 +
 tests/i915/gem_exec_balancer.c | 459 +++++++++++++++++++++++++++++++++
 4 files changed, 495 insertions(+), 1 deletion(-)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f28c15544..e19a54a89 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -83,6 +83,7 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 {
 	uint64_t ext_root = 0;
 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balance, GEM_MAX_ENGINES);
+	I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(parallel, GEM_MAX_ENGINES);
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
 	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
 	struct drm_i915_gem_context_create_ext_setparam persist_param;
@@ -117,7 +118,31 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 		unsigned num_logical_engines;
 		memset(&engines, 0, sizeof(engines));
 
-		if (cfg->load_balance) {
+		igt_assert(!(cfg->parallel && cfg->load_balance));
+
+		if (cfg->parallel) {
+			memset(&parallel, 0, sizeof(parallel));
+
+			num_logical_engines = 1;
+
+			parallel.base.name =
+				I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT;
+
+			engines.engines[0].engine_class =
+				I915_ENGINE_CLASS_INVALID;
+			engines.engines[0].engine_instance =
+				I915_ENGINE_CLASS_INVALID_NONE;
+
+			parallel.num_siblings = cfg->num_engines;
+			parallel.width = cfg->width;
+			for (i = 0; i < cfg->num_engines * cfg->width; i++) {
+				igt_assert_eq(cfg->engines[0].engine_class,
+					      cfg->engines[i].engine_class);
+				parallel.engines[i] = cfg->engines[i];
+			}
+
+			engines.extensions = to_user_pointer(&parallel);
+		} else if (cfg->load_balance) {
 			memset(&balance, 0, sizeof(balance));
 
 			/* In this case, the first engine is the virtual
@@ -127,6 +152,9 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 			igt_assert(cfg->num_engines + 1 <= GEM_MAX_ENGINES);
 			num_logical_engines = cfg->num_engines + 1;
 
+			balance.base.name =
+				I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
+
 			engines.engines[0].engine_class =
 				I915_ENGINE_CLASS_INVALID;
 			engines.engines[0].engine_instance =
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 9649f6d96..89c65fcd3 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -46,7 +46,9 @@ typedef struct intel_ctx_cfg {
 	uint32_t vm;
 	bool nopersist;
 	bool load_balance;
+	bool parallel;
 	unsigned int num_engines;
+	unsigned int width;
 	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
 } intel_ctx_cfg_t;
 
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index c447525a0..44b0d480f 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2642,6 +2642,11 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 #define STATE3D_COLOR_FACTOR	((0x3<<29)|(0x1d<<24)|(0x01<<16))
 
+/* Atomics */
+#define MI_ATOMIC			((0x2f << 23) | 2)
+#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
+#define   MI_ATOMIC_ADD                 (0x7 << 8)
+
 /* Batch */
 #define MI_BATCH_BUFFER		((0x30 << 23) | 1)
 #define MI_BATCH_BUFFER_START	(0x31 << 23)
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index e4e5cda4a..6866d281d 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -25,8 +25,10 @@
 #include <sched.h>
 #include <sys/ioctl.h>
 #include <sys/signal.h>
+#include <poll.h>
 
 #include "i915/gem.h"
+#include "i915/gem_engine_topology.h"
 #include "i915/gem_create.h"
 #include "i915/gem_vm.h"
 #include "igt.h"
@@ -2752,6 +2754,376 @@ static void nohangcheck(int i915)
 	close(params);
 }
 
+static void check_bo(int i915, uint32_t handle, unsigned int expected,
+		     bool wait)
+{
+	uint32_t *map;
+
+	map = gem_mmap__cpu(i915, handle, 0, 4096, PROT_READ);
+	if (wait)
+		gem_set_domain(i915, handle, I915_GEM_DOMAIN_CPU,
+			       I915_GEM_DOMAIN_CPU);
+	igt_assert_eq(map[0], expected);
+	munmap(map, 4096);
+}
+
+static struct drm_i915_query_engine_info *query_engine_info(int i915)
+{
+	struct drm_i915_query_engine_info *engines;
+
+#define QUERY_SIZE	0x4000
+	engines = malloc(QUERY_SIZE);
+	igt_assert(engines);
+	memset(engines, 0, QUERY_SIZE);
+	igt_assert(!__gem_query_engines(i915, engines, QUERY_SIZE));
+#undef QUERY_SIZE
+
+	return engines;
+}
+
+/* This function only works if siblings contains all instances of a class */
+static void logical_sort_siblings(int i915,
+				  struct i915_engine_class_instance *siblings,
+				  unsigned int count)
+{
+	struct i915_engine_class_instance *sorted;
+	struct drm_i915_query_engine_info *engines;
+	unsigned int i, j;
+
+	sorted = calloc(count, sizeof(*sorted));
+	igt_assert(sorted);
+
+	engines = query_engine_info(i915);
+
+	for (j = 0; j < count; ++j) {
+		for (i = 0; i < engines->num_engines; ++i) {
+			if (siblings[j].engine_class ==
+			    engines->engines[i].engine.engine_class &&
+			    siblings[j].engine_instance ==
+			    engines->engines[i].engine.engine_instance) {
+				uint16_t logical_instance =
+					engines->engines[i].logical_instance;
+
+				igt_assert(logical_instance < count);
+				igt_assert(!sorted[logical_instance].engine_class);
+				igt_assert(!sorted[logical_instance].engine_instance);
+
+				sorted[logical_instance] = siblings[j];
+				break;
+			}
+		}
+		igt_assert(i != engines->num_engines);
+	}
+
+	memcpy(siblings, sorted, sizeof(*sorted) * count);
+	free(sorted);
+	free(engines);
+}
+
+#define PARALLEL_BB_FIRST		(0x1 << 0)
+#define PARALLEL_OUT_FENCE		(0x1 << 1)
+#define PARALLEL_IN_FENCE		(0x1 << 2)
+#define PARALLEL_SUBMIT_FENCE		(0x1 << 3)
+#define PARALLEL_CONTEXTS		(0x1 << 4)
+#define PARALLEL_VIRTUAL		(0x1 << 5)
+
+static void parallel_thread(int i915, unsigned int flags,
+			    struct i915_engine_class_instance *siblings,
+			    unsigned int count, unsigned int bb_per_execbuf)
+{
+	const intel_ctx_t *ctx = NULL;
+	int n, i, j, fence = 0;
+	uint32_t batch[16];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_exec_object2 obj[32];
+#define PARALLEL_BB_LOOP_COUNT	512
+	const intel_ctx_t *ctxs[PARALLEL_BB_LOOP_COUNT];
+	uint32_t target_bo_idx = 0;
+	uint32_t first_bb_idx = 1;
+	intel_ctx_cfg_t cfg;
+
+	igt_assert(bb_per_execbuf < 32);
+
+	if (flags & PARALLEL_BB_FIRST) {
+		target_bo_idx = bb_per_execbuf;
+		first_bb_idx = 0;
+	}
+
+	igt_assert(count >= bb_per_execbuf &&
+		   count % bb_per_execbuf == 0);
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.parallel = true;
+	cfg.num_engines = count / bb_per_execbuf;
+	cfg.width = bb_per_execbuf;
+	if (flags & PARALLEL_VIRTUAL) {
+		for (i = 0; i < cfg.width; ++i)
+			for (j = 0; j < cfg.num_engines; ++j)
+				memcpy(cfg.engines + i * cfg.num_engines + j,
+				       siblings + j * cfg.width + i,
+				       sizeof(*siblings));
+	} else {
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
+	}
+	ctx = intel_ctx_create(i915, &cfg);
+
+	i = 0;
+	batch[i] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
+		MI_ATOMIC_ADD;
+#define TARGET_BO_OFFSET	(0x1 << 16)
+	batch[++i] = TARGET_BO_OFFSET;
+	batch[++i] = 0;
+	batch[++i] = 1;
+	batch[++i] = MI_BATCH_BUFFER_END;
+
+	memset(obj, 0, sizeof(obj));
+	obj[target_bo_idx].offset = TARGET_BO_OFFSET;
+	obj[target_bo_idx].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+	obj[target_bo_idx].handle = gem_create(i915, 4096);
+
+	for (i = first_bb_idx; i < bb_per_execbuf + first_bb_idx; ++i) {
+		obj[i].handle = gem_create(i915, 4096);
+		gem_write(i915, obj[i].handle, 0, batch,
+			  sizeof(batch));
+	}
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.buffer_count = bb_per_execbuf + 1;
+	execbuf.flags |= I915_EXEC_HANDLE_LUT;
+	if (flags & PARALLEL_BB_FIRST)
+		execbuf.flags |= I915_EXEC_BATCH_FIRST;
+	if (flags & PARALLEL_OUT_FENCE)
+		execbuf.flags |= I915_EXEC_FENCE_OUT;
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.rsvd1 = ctx->id;
+
+	for (n = 0; n < PARALLEL_BB_LOOP_COUNT; ++n) {
+		execbuf.flags &= ~0x3full;
+		gem_execbuf_wr(i915, &execbuf);
+
+		if (flags & PARALLEL_OUT_FENCE) {
+			igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32,
+						      1000), 0);
+			igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
+
+			if (fence)
+				close(fence);
+			fence = execbuf.rsvd2 >> 32;
+
+			if (flags & PARALLEL_SUBMIT_FENCE) {
+				execbuf.flags |=
+					I915_EXEC_FENCE_SUBMIT;
+				execbuf.rsvd2 >>= 32;
+			} else if (flags &  PARALLEL_IN_FENCE) {
+				execbuf.flags |=
+					I915_EXEC_FENCE_IN;
+				execbuf.rsvd2 >>= 32;
+			} else {
+				execbuf.rsvd2 = 0;
+			}
+		}
+
+		if (flags & PARALLEL_CONTEXTS) {
+			ctxs[n] = ctx;
+			ctx = intel_ctx_create(i915, &cfg);
+			execbuf.rsvd1 = ctx->id;
+		}
+	}
+	if (fence)
+		close(fence);
+
+	check_bo(i915, obj[target_bo_idx].handle,
+		 bb_per_execbuf * PARALLEL_BB_LOOP_COUNT, true);
+
+	intel_ctx_destroy(i915, ctx);
+	for (i = 0; flags & PARALLEL_CONTEXTS &&
+	     i < PARALLEL_BB_LOOP_COUNT; ++i) {
+		intel_ctx_destroy(i915, ctxs[i]);
+	}
+	for (i = 0; i < bb_per_execbuf + 1; ++i)
+		gem_close(i915, obj[i].handle);
+}
+
+static void parallel(int i915, unsigned int flags)
+{
+	int class;
+
+	for (class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int count, bb_per_execbuf;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 2) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+		bb_per_execbuf = count;
+
+		parallel_thread(i915, flags, siblings,
+				count, bb_per_execbuf);
+
+		free(siblings);
+	}
+}
+
+static void parallel_balancer(int i915, unsigned int flags)
+{
+	int class;
+
+	for (class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int bb_per_execbuf;
+		unsigned int count;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 4) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+
+		for (bb_per_execbuf = 2; count / bb_per_execbuf > 1;
+		     ++bb_per_execbuf) {
+			igt_fork(child, count / bb_per_execbuf)
+				parallel_thread(i915,
+						flags | PARALLEL_VIRTUAL,
+						siblings,
+						count,
+						bb_per_execbuf);
+			igt_waitchildren();
+		}
+
+		free(siblings);
+	}
+}
+
+static bool fence_busy(int fence)
+{
+	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
+}
+
+/*
+ * Ensure a parallel submit actually runs on HW in parallel by putting on a
+ * spinner on 1 engine, doing a parallel submit, and parallel submit is blocked
+ * behind spinner.
+ */
+static void parallel_ordering(int i915, unsigned int flags)
+{
+	int class;
+
+	for (class = 0; class < 32; class++) {
+		const intel_ctx_t *ctx = NULL, *spin_ctx = NULL;
+		struct i915_engine_class_instance *siblings;
+		unsigned int count;
+		int i = 0, fence = 0;
+		uint32_t batch[16];
+		struct drm_i915_gem_execbuffer2 execbuf;
+		struct drm_i915_gem_exec_object2 obj[32];
+		igt_spin_t *spin;
+		intel_ctx_cfg_t cfg;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 2) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+
+		memset(&cfg, 0, sizeof(cfg));
+		cfg.parallel = true;
+		cfg.num_engines = 1;
+		cfg.width = count;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
+
+		ctx = intel_ctx_create(i915, &cfg);
+
+		batch[i] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
+			MI_ATOMIC_ADD;
+		batch[++i] = TARGET_BO_OFFSET;
+		batch[++i] = 0;
+		batch[++i] = 1;
+		batch[++i] = MI_BATCH_BUFFER_END;
+
+		memset(obj, 0, sizeof(obj));
+		obj[0].offset = TARGET_BO_OFFSET;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[0].handle = gem_create(i915, 4096);
+
+		for (i = 1; i < count + 1; ++i) {
+			obj[i].handle = gem_create(i915, 4096);
+			gem_write(i915, obj[i].handle, 0, batch,
+				  sizeof(batch));
+		}
+
+		memset(&execbuf, 0, sizeof(execbuf));
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.buffer_count = count + 1;
+		execbuf.flags |= I915_EXEC_HANDLE_LUT;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+		execbuf.flags |= I915_EXEC_FENCE_OUT;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx->id;
+
+		/* Block parallel submission */
+		spin_ctx = ctx_create_engines(i915, siblings, count);
+		spin = __igt_spin_new(i915,
+				      .ctx = spin_ctx,
+				      .engine = 0,
+				      .flags = IGT_SPIN_FENCE_OUT |
+				      IGT_SPIN_NO_PREEMPTION);
+
+		/* Wait for spinners to start */
+		usleep(5 * 10000);
+		igt_assert(fence_busy(spin->out_fence));
+
+		/* Submit parallel execbuf */
+		gem_execbuf_wr(i915, &execbuf);
+		fence = execbuf.rsvd2 >> 32;
+
+		/*
+		 * Wait long enough for timeslcing to kick in but not
+		 * preemption. Spinner + parallel execbuf should be
+		 * active. Assuming default timeslice / preemption values, if
+		 * these are changed it is possible for the test to fail.
+		 */
+		usleep(25 * 10000);
+		igt_assert(fence_busy(spin->out_fence));
+		igt_assert(fence_busy(fence));
+		check_bo(i915, obj[0].handle, 0, false);
+
+		/*
+		 * End spinner and wait for spinner + parallel execbuf
+		 * to compelte.
+		 */
+		igt_spin_end(spin);
+		igt_assert_eq(sync_fence_wait(fence, 1000), 0);
+		igt_assert_eq(sync_fence_status(fence), 1);
+		check_bo(i915, obj[0].handle, count, true);
+		close(fence);
+
+		/* Clean up */
+		intel_ctx_destroy(i915, ctx);
+		intel_ctx_destroy(i915, spin_ctx);
+		for (i = 0; i < count + 1; ++i)
+			gem_close(i915, obj[i].handle);
+		free(siblings);
+		igt_spin_free(i915, spin);
+	}
+}
+
 static bool has_persistence(int i915)
 {
 	struct drm_i915_gem_context_param p = {
@@ -2786,6 +3158,61 @@ static bool has_load_balancer(int i915)
 	return err == 0;
 }
 
+static bool has_logical_mapping(int i915)
+{
+	struct drm_i915_query_engine_info *engines;
+	unsigned int i;
+
+	engines = query_engine_info(i915);
+
+	for (i = 0; i < engines->num_engines; ++i)
+		if (!(engines->engines[i].flags &
+		     I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE)) {
+			free(engines);
+			return false;
+		}
+
+	free(engines);
+	return true;
+}
+
+static bool has_parallel_execbuf(int i915)
+{
+	intel_ctx_cfg_t cfg = {
+		.parallel = true,
+		.num_engines = 1,
+	};
+	const intel_ctx_t *ctx = NULL;
+	int err;
+
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int count;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 2) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+
+		cfg.width = count;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
+		free(siblings);
+
+		err = __intel_ctx_create(i915, &cfg, &ctx);
+		intel_ctx_destroy(i915, ctx);
+
+		return err == 0;
+	}
+
+	return false;
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -2886,6 +3313,38 @@ igt_main
 		igt_stop_hang_detector();
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(has_logical_mapping(i915));
+			igt_require(has_parallel_execbuf(i915));
+		}
+
+		igt_subtest("parallel-ordering")
+			parallel_ordering(i915, 0);
+
+		igt_subtest("parallel")
+			parallel(i915, 0);
+
+		igt_subtest("parallel-bb-first")
+			parallel(i915, PARALLEL_BB_FIRST);
+
+		igt_subtest("parallel-out-fence")
+			parallel(i915, PARALLEL_OUT_FENCE);
+
+		igt_subtest("parallel-keep-in-fence")
+			parallel(i915, PARALLEL_OUT_FENCE | PARALLEL_IN_FENCE);
+
+		igt_subtest("parallel-keep-submit-fence")
+			parallel(i915, PARALLEL_OUT_FENCE |
+				 PARALLEL_SUBMIT_FENCE);
+
+		igt_subtest("parallel-contexts")
+			parallel(i915, PARALLEL_CONTEXTS);
+
+		igt_subtest("parallel-balancer")
+			parallel_balancer(i915, 0);
+	}
+
 	igt_subtest_group {
 		igt_hang_t  hang;
 
-- 
2.32.0
