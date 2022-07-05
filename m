Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C86D10E04C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jul 2022 10:37:46 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Jul 2022 12:35:51 +0200
Message-Id: <20220705103551.3720180-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rps: Check impact of fence
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
 tests/i915/i915_pm_rps.c | 101 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index b37f15c2..d931ed78 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -37,6 +37,7 @@
 #include <sys/wait.h>
 
 #include "i915/gem.h"
+#include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
@@ -614,14 +615,98 @@ static void waitboost(int fd, bool reset)
 	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
 }
 
+static uint64_t __fence_order(int i915,
+			      struct drm_i915_gem_exec_object2 *obj,
+			      struct drm_i915_gem_execbuffer2 *eb,
+			      uint64_t flags0, uint64_t flags1)
+{
+	struct timespec tv;
+
+	gem_quiescent_gpu(i915);
+	igt_gettime(&tv);
+
+	obj->flags = flags0;
+	gem_execbuf(i915, eb);
+	obj->flags = flags1;
+	gem_execbuf(i915, eb);
+	gem_sync(i915, obj->handle);
+
+	return igt_nsec_elapsed(&tv);
+}
+
+static void fence_order(int i915)
+{
+	const uint64_t sz = 1 << 20;
+	struct drm_i915_gem_exec_object2 obj[2] = {
+		{ .handle = gem_create(i915, 4096) },
+		{ .handle = gem_create(i915, sz) },
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(obj),
+		.buffer_count = ARRAY_SIZE(obj),
+	};
+	uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint64_t wr, rw;
+	int min, max;
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
+	__fence_order(i915, &obj[0], &execbuf, 0, 0);
+
+	wr = __fence_order(i915, &obj[0], &execbuf, EXEC_OBJECT_WRITE, 0);
+	igt_info("Write-then-read: %.1fus\n", wr * 1e-3);
+
+	rw = __fence_order(i915, &obj[0], &execbuf, 0, EXEC_OBJECT_WRITE);
+	igt_info("Read-then-write: %.1fus\n", rw * 1e-3);
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
@@ -683,6 +768,10 @@ igt_main
 	igt_subtest("waitboost")
 		waitboost(drm_fd, false);
 
+	/* Checks if the order of fences does not affect waitboosting */
+	igt_subtest("fence-order")
+		fence_order(drm_fd);
+
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang = igt_allow_hang(drm_fd, 0, 0);
-- 
2.25.1
