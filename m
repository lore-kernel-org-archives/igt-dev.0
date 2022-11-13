Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F810E1F4
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Nov 2022 07:53:18 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Nov 2022 23:53:09 -0800
Message-Id: <20221113075309.32023-14-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
References: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 13/13] tests/i915/vm_bind: Add
 gem_shrink@vm_bind* subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add VM_BIND shrinker subtests.

v2: Do not blacklist vm_bind tests, add vm_bind_version assert

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_shrink.c      | 74 ++++++++++++++++++++++++++++++++++--
 tests/intel-ci/blacklist.txt |  2 +-
 2 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index e3e20dfc9..d8131382e 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -29,10 +29,13 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "i915/i915_vm_bind.h"
 #include "igt.h"
 #include "igt_gt.h"
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
+#include "igt_syncobj.h"
 
 #ifndef MADV_FREE
 #define MADV_FREE 8
@@ -229,6 +232,62 @@ static void hang(int fd, uint64_t alloc)
 	munmap(obj, obj_size);
 }
 
+static uint64_t gettime_ns(void)
+{
+	struct timespec current;
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
+}
+
+#define BATCH_VA	0xc0000000
+static void vm_bind(int fd, uint64_t alloc)
+{
+	struct drm_i915_gem_timeline_fence exec_fence = { };
+	struct drm_i915_gem_context_param param = {
+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
+		.value = 0,
+	};
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_execbuffer3 execbuf3;
+	uint32_t vm_id, handle, exec_syncobj;
+	struct intel_engine_data engines;
+	const intel_ctx_t *ctx;
+	uint64_t fence_value = 0;
+
+	vm_id = gem_vm_create_in_vm_bind_mode(fd);
+	ctx = intel_ctx_create_all_physical(fd);
+	param.ctx_id = ctx->id;
+	gem_context_set_param(fd, &param);
+	gem_context_set_vm(fd, ctx->id, vm_id);
+	(void)gem_context_get_vm(fd, ctx->id);
+	engines = intel_engine_list_for_ctx_cfg(fd, &ctx->cfg);
+
+	handle = gem_create(fd, alloc);
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+	i915_vm_bind(fd, vm_id, BATCH_VA, handle, 0, alloc, 0, 0);
+
+	exec_syncobj = syncobj_create(fd, 0);
+	exec_fence.handle = exec_syncobj;
+	exec_fence.flags = I915_TIMELINE_FENCE_SIGNAL;
+
+	memset(&execbuf3, 0, sizeof(execbuf3));
+	execbuf3.ctx_id = ctx->id;
+	execbuf3.engine_idx = engines.engines[0].flags;
+	execbuf3.batch_address = BATCH_VA;
+	execbuf3.fence_count = 1;
+	execbuf3.timeline_fences = to_user_pointer(&exec_fence);
+
+	gem_execbuf3(fd, &execbuf3);
+
+	igt_assert(syncobj_timeline_wait(fd, &exec_syncobj, &fence_value, 1,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+	gem_madvise(fd, handle, I915_MADV_DONTNEED);
+
+	syncobj_destroy(fd, exec_syncobj);
+	intel_ctx_destroy(fd, ctx);
+}
+
 static void userptr(int fd, uint64_t alloc, unsigned int flags)
 #define UDIRTY (1 << 0)
 {
@@ -418,6 +477,7 @@ igt_main
 		{ "execbufN", execbufN },
 		{ "execbufX", execbufX },
 		{ "hang", hang },
+		{ "vm_bind", vm_bind },
 		{ NULL },
 	};
 	const struct mode {
@@ -433,11 +493,11 @@ igt_main
 	};
 	uint64_t alloc_size = 0;
 	int num_processes = 0;
+	int fd;
 
 	igt_fixture {
 		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 		uint64_t mem_size = igt_get_total_ram_mb();
-		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
@@ -458,8 +518,6 @@ igt_main
 		alloc_size <<= 20;
 		igt_require_memory(num_processes, alloc_size,
 				   CHECK_SWAP | CHECK_RAM);
-
-		close(fd);
 	}
 
 	igt_subtest("reclaim")
@@ -467,9 +525,17 @@ igt_main
 
 	for(const struct test *t = tests; t->name; t++) {
 		for(const struct mode *m = modes; m->suffix; m++) {
-			igt_subtest_f("%s%s", t->name, m->suffix)
+			igt_subtest_f("%s%s", t->name, m->suffix) {
+				if (!strcmp(t->name, "vm_bind"))
+					igt_require(i915_vm_bind_version(fd) == 1);
+
 				run_test(num_processes, alloc_size,
 					 t->func, m->flags);
+			}
 		}
 	}
+
+	igt_fixture {
+		close(fd);
+	}
 }
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 0d3077301..080a49957 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -47,7 +47,7 @@ igt@gem_render_linear_blits@(?!.*basic).*
 igt@gem_render_tiled_blits@(?!.*basic).*
 igt@gem_reset_stats(@.*)?
 igt@gem_ringfill@(?!.*basic).*
-igt@gem_shrink@(?!reclaim$).*
+igt@gem_shrink@(get|pwrite|pread|mmap|execbuf|hang|vm_bind-oom)*.*
 igt@gem_softpin@.*(hang|S4).*
 igt@gem_streaming_writes(@.*)?
 igt@gem_sync@(?!.*basic).*
-- 
2.21.0.rc0.32.g243a4c7e27
