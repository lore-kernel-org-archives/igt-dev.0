Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34411AA1C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 08:09:17 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Jul 2022 10:08:28 +0200
Message-Id: <20220707080828.3861607-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] i915/i915_pm_rps: Check impact of fence
 ordering on waitboosting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Currently the wait boost heuristic is evaluated at the start of each
fence wait for a series within dma-resv. There is no strict ordering of
fences defined by dma-resv, and so it turns out that the same operation
under different circumstances can result in different heuristics being
applied, and dramatic performance variations in user applications.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/6284
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
---
v2:
  - Introduced batch_create() with arbitration points to prevent hangs
  - Added engine-order subtest
  - Added reporting of GPU frequency
  - Changed runtimes and switched prints from us to ms

 tests/i915/i915_pm_rps.c | 266 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 260 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index b37f15c2..fd0e8078 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -37,8 +37,10 @@
 #include <sys/wait.h>

 #include "i915/gem.h"
+#include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_dummyload.h"
+#include "igt_perf.h"
 #include "igt_sysfs.h"

 IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
@@ -614,14 +616,259 @@ static void waitboost(int fd, bool reset)
 	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
 }

+static uint32_t batch_create(int i915, uint64_t sz)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	const uint32_t chk = 0x5 << 23;
+	uint32_t handle = gem_create(i915, sz);
+
+	for (uint64_t pg = 4096; pg + 4096 < sz; pg += 4096)
+		gem_write(i915, handle, pg, &chk, sizeof(chk));
+
+	gem_write(i915, handle, sz - sizeof(bbe), &bbe, sizeof(bbe));
+
+	return handle;
+}
+
+static uint64_t __fence_order(int i915,
+			      struct drm_i915_gem_exec_object2 *obj,
+			      struct drm_i915_gem_execbuffer2 *eb,
+			      uint64_t flags0, uint64_t flags1,
+			      double *outf)
+{
+	uint64_t before[2], after[2];
+	struct timespec tv;
+	int fd;
+
+	gem_quiescent_gpu(i915);
+	fd = perf_i915_open(i915, I915_PMU_ACTUAL_FREQUENCY);
+
+	igt_gettime(&tv);
+
+	obj->flags = flags0;
+	gem_execbuf(i915, eb);
+
+	obj->flags = flags1;
+	gem_execbuf(i915, eb);
+
+	read(fd, before, sizeof(before));
+	gem_sync(i915, obj->handle);
+	read(fd, after, sizeof(after));
+	close(fd);
+
+	after[0] -= before[0];
+	after[1] -= before[1];
+
+	*outf = 1e9 * after[0] / after[1];
+	return igt_nsec_elapsed(&tv);
+}
+
+static void fence_order(int i915)
+{
+	const uint64_t sz = 512ull << 20;
+	struct drm_i915_gem_exec_object2 obj[2] = {
+		{ .handle = gem_create(i915, 4096) },
+		{ .handle = batch_create(i915, sz) },
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(obj),
+		.buffer_count = ARRAY_SIZE(obj),
+	};
+	uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint64_t wr, rw;
+	int min, max;
+	double freq;
+	int sysfs;
+
+	/*
+	 * Check the order of fences found during GEM_WAIT does not affect
+	 * waitboosting.
+	 *
+	 * Internally, implicit fences are tracked within a dma-resv which
+	 * imposes no order on the individually fences tracked within. Since
+	 * there is no defined order, the sequence of waits (and the associated
+	 * waitboosts) is also undefined, undermining the consistency of the
+	 * waitboost heuristic.
+	 *
+	 * In particular, we can influence the sequence of fence storage
+	 * within dma-resv by mixing read/write semantics for implicit fences.
+	 * We can exploit this property of dma-resv to exercise that no matter
+	 * the stored order, the heuristic is applied consistently for the
+	 * user's GEM_WAIT ioctl.
+	 */
+
+	sysfs = igt_sysfs_open(i915);
+	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
+	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
+	igt_require(max > min);
+
+	/* Only allow ourselves to upclock via waitboosting */
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%d", max);
+
+	gem_write(i915, obj[1].handle, sz - sizeof(bbe), &bbe, sizeof(bbe));
+
+	/* Warm up to bind the vma */
+	__fence_order(i915, &obj[0], &execbuf, 0, 0, &freq);
+
+	wr = __fence_order(i915, &obj[0], &execbuf, EXEC_OBJECT_WRITE, 0, &freq);
+	igt_info("Write-then-read: %.2fms @ %.3fMHz\n", wr * 1e-6, freq);
+
+	rw = __fence_order(i915, &obj[0], &execbuf, 0, EXEC_OBJECT_WRITE, &freq);
+	igt_info("Read-then-write: %.2fms @ %.3fMHz\n", rw * 1e-6, freq);
+
+	gem_close(i915, obj[0].handle);
+	gem_close(i915, obj[1].handle);
+
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", max);
+
+	igt_assert(4 * rw > 3 * wr && 4 * wr > 3 * rw);
+}
+
+static uint64_t __engine_order(int i915,
+			       struct drm_i915_gem_exec_object2 *obj,
+			       struct drm_i915_gem_execbuffer2 *eb,
+			       unsigned int *engines0,
+			       unsigned int *engines1,
+			       unsigned int num_engines,
+			       double *outf)
+{
+	uint64_t before[2], after[2];
+	struct timespec tv;
+	int fd;
+
+	gem_quiescent_gpu(i915);
+	fd = perf_i915_open(i915, I915_PMU_ACTUAL_FREQUENCY);
+
+	igt_gettime(&tv);
+
+	obj->flags = EXEC_OBJECT_WRITE;
+	for (unsigned int n = 0; n < num_engines; n++) {
+		eb->flags &= ~63ull;
+		eb->flags |= engines0[n];
+		gem_execbuf_wr(i915, eb);
+	}
+
+	obj->flags = 0;
+	for (unsigned int n = 0; n < num_engines; n++) {
+		eb->flags &= ~63ull;
+		eb->flags |= engines1[n];
+		gem_execbuf(i915, eb);
+	}
+
+	read(fd, before, sizeof(before));
+	gem_sync(i915, obj->handle);
+	read(fd, after, sizeof(after));
+	close(fd);
+
+	after[0] -= before[0];
+	after[1] -= before[1];
+
+	*outf = 1e9 * after[0] / after[1];
+	return igt_nsec_elapsed(&tv);
+}
+
+static void engine_order(int i915)
+{
+	const uint64_t sz = 512ull << 20;
+	struct drm_i915_gem_exec_object2 obj[2] = {
+		{ .handle = gem_create(i915, 4096) },
+		{ .handle = batch_create(i915, sz) },
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(obj),
+		.buffer_count = ARRAY_SIZE(obj),
+	};
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	const struct intel_execution_engine2 *e;
+	unsigned int engines[2], reverse[2];
+	uint64_t forward, backward, both;
+	unsigned int num_engines;
+	const intel_ctx_t *ctx;
+	int min, max;
+	double freq;
+	int sysfs;
+
+	/*
+	 * Check the order of fences found during GEM_WAIT does not affect
+	 * waitboosting. (See fence_order())
+	 *
+	 * Another way we can manipulate the order of fences within the
+	 * dma-resv is through repeated use of the same contexts.
+	 */
+
+	num_engines = 0;
+	ctx = intel_ctx_create_all_physical(i915);
+	for_each_ctx_engine(i915, ctx, e) {
+		/*
+		 * Avoid using the cmdparser as it will try to allocate
+		 * a new shadow batch for each submission -> oom
+		 */
+		if (!gem_engine_has_mutable_submission(i915, e->class))
+			continue;
+
+		engines[num_engines++] = e->flags;
+		if (num_engines == ARRAY_SIZE(engines))
+			break;
+	}
+	igt_require(num_engines > 1);
+	for (unsigned int n = 0; n < num_engines; n++)
+		reverse[n] = engines[num_engines - n - 1];
+	execbuf.rsvd1 = ctx->id;
+
+	sysfs = igt_sysfs_open(i915);
+	min = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
+	max = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
+	igt_require(max > min);
+
+	/* Only allow ourselves to upclock via waitboosting */
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%d", max);
+
+	gem_write(i915, obj[1].handle, sz - sizeof(bbe), &bbe, sizeof(bbe));
+
+	/* Warm up to bind the vma */
+	gem_execbuf(i915, &execbuf);
+
+	forward = __engine_order(i915, &obj[0], &execbuf,
+				 engines, engines, num_engines,
+				 &freq);
+	igt_info("Forwards: %.2fms @ %.3fMhz\n", forward * 1e-6, freq);
+
+	backward = __engine_order(i915, &obj[0], &execbuf,
+				  reverse, reverse, num_engines,
+				  &freq);
+	igt_info("Backwards: %.2fms @ %.3fMhz\n", backward * 1e-6, freq);
+
+	both = __engine_order(i915, &obj[0], &execbuf,
+			      engines, reverse, num_engines,
+			      &freq);
+	igt_info("Bidirectional: %.2fms @ %.3fMhz\n", both * 1e-6, freq);
+
+	gem_close(i915, obj[0].handle);
+	gem_close(i915, obj[1].handle);
+	intel_ctx_destroy(i915, ctx);
+
+	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
+	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", max);
+
+	igt_assert(4 * forward > 3 * backward && 4 * backward > 3 * forward);
+	igt_assert(4 * forward > 3 * both && 4 * both > 3 * forward);
+}
+
 static void pm_rps_exit_handler(int sig)
 {
-	if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
-		writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
-		writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-	} else {
-		writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-		writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	if (sysfs_files[MAX].filp) {
+		if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
+			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
+		} else {
+			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
+			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+		}
 	}

 	if (lh.igt_proc.running)
@@ -683,6 +930,13 @@ igt_main
 	igt_subtest("waitboost")
 		waitboost(drm_fd, false);

+	/* Checks if the order of fences does not affect waitboosting */
+	igt_subtest("fence-order")
+		fence_order(drm_fd);
+
+	igt_subtest("engine-order")
+		engine_order(drm_fd);
+
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang = igt_allow_hang(drm_fd, 0, 0);
--
2.25.1
