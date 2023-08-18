Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AF010E4E3
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 10:55:19 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 10:21:56 +0000
Message-Id: <20230818102156.2335320-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230818102156.2335320-1-marcin.bernatowicz@linux.intel.com>
References: <20230818102156.2335320-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/xe_spin_batch:
 spin-fixed-duration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Basic test for xe_spin with fixed duration.

v2: Added assert for expected spinner duration. (Zbyszek)
A median of 5x100ms spins duration is computed, which should
satisfy CI runs, although better accuracy is achieved with
disabled logging (echo 0 > /sys/module/drm/parameters/debug).

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/xe/xe_spin_batch.c | 72 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index 26f9daf36..6dcd89558 100644
--- a/tests/xe/xe_spin_batch.c
+++ b/tests/xe/xe_spin_batch.c
@@ -1,8 +1,10 @@
 #include "igt.h"
+#include "igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 /**
  * TEST: Tests for spin batch submissons.
@@ -138,6 +140,73 @@ static void spin_all(int fd, int gt, int class)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: spin-fixed-duration
+ * Description: Basic test which validates the functionality of xe_spin with fixed duration.
+ * Run type: FULL
+ */
+static void xe_spin_fixed_duration(int fd)
+{
+	uint64_t ahnd;
+	uint32_t vm;
+	unsigned int exec_queue;
+	uint32_t bo;
+	size_t bo_size;
+	struct xe_spin *spin;
+	uint64_t spin_addr;
+	struct drm_xe_sync sync = {
+		.handle = syncobj_create(fd, 0),
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct timespec tv;
+	const uint64_t duration_ns = NSEC_PER_SEC / 10; /* 100ms */
+	double elapsed_ms;
+	int i;
+	igt_stats_t stats;
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	spin = xe_bo_map(fd, bo, bo_size);
+	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
+	xe_vm_bind_sync(fd, vm, bo, 0, spin_addr, bo_size);
+	xe_spin_init_opts(spin, .addr = spin_addr,
+				.preempt = true,
+				.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns));
+	exec.address = spin_addr;
+	exec.exec_queue_id = exec_queue;
+
+#define NSAMPLES 5
+	igt_stats_init_with_size(&stats, NSAMPLES);
+	for (i = 0; i < NSAMPLES; ++i) {
+		igt_gettime(&tv);
+		xe_exec(fd, &exec);
+		xe_spin_wait_started(spin);
+		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
+		syncobj_reset(fd, &sync.handle, 1);
+		igt_debug("i=%d %.2fms\n", i, stats.values_f[i]);
+	}
+	elapsed_ms = igt_stats_get_median(&stats);
+	igt_info("%.0fms spin took %.2fms (median)\n", duration_ns * 1e-6, elapsed_ms);
+	igt_assert(elapsed_ms < duration_ns * 1.5e-6 && elapsed_ms > duration_ns * 0.5e-6);
+
+	xe_vm_unbind_sync(fd, vm, 0, spin_addr, bo_size);
+	syncobj_destroy(fd, sync.handle);
+	gem_munmap(spin, bo_size);
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -163,6 +232,9 @@ igt_main
 				spin_all(fd, gt, class);
 	}
 
+	igt_subtest("spin-fixed-duration")
+		xe_spin_fixed_duration(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.30.2
