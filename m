Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4E10E0A3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 10:58:08 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Aug 2023 10:24:54 +0000
Message-Id: <20230804102454.948216-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230804102454.948216-1-marcin.bernatowicz@linux.intel.com>
References: <20230804102454.948216-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_spin_batch: spin-fixed-duration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: mauro.chehab@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Basic test for xe_spin with fixed duration.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/xe/xe_spin_batch.c | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index 26f9daf36..bdad3bab9 100644
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
@@ -138,6 +140,60 @@ static void spin_all(int fd, int gt, int class)
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
+	struct xe_spin_opts spin_opts = {};
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
+	uint64_t duration_ns = NSEC_PER_SEC / 10; /* 100ms */
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	spin = xe_bo_map(fd, bo, bo_size);
+	spin_opts.addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
+	spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
+	xe_vm_bind_sync(fd, vm, bo, 0, spin_opts.addr, bo_size);
+	xe_spin_init(spin, &spin_opts);
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_opts.addr;
+
+	igt_gettime(&tv);
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	igt_info("%.0fms spin took %.1fms\n", duration_ns * 1e-6, igt_nsec_elapsed(&tv) * 1e-6);
+
+	xe_vm_unbind_sync(fd, vm, 0, spin_opts.addr, bo_size);
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
@@ -163,6 +219,9 @@ igt_main
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
