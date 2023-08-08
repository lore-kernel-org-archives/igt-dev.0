Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCE10E106
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 11:38:58 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 13:38:42 +0200
Message-Id: <20230808113842.3213560-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] i915/gem_exec_await: Avoid DG2 conflicts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

DG2 is restricted in what contexts/engines can be run concurrently, if
we submit a non-preemptible context on both rcs/ccs it will only run one
at a time. Progress (heartbeats) along ccs will be blocked by rcs, and
vice versa. This is independent of the ccs switch holdout w/a.
Since this is not required for constructing a wide set of active fences
(a fence is active until it has been signaled, whether it is running on
HW or waiting to run is irrelevant to the signal state), refactor the
context construction to be favourable for DG2.

v2: fixed include order, added comment about op placeholder

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5892
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
[ahajda: adjust to upstream driver]
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_exec_await.c | 181 ++++++++++++++++--------------------
 1 file changed, 81 insertions(+), 100 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 53b7bac2f96..0652b649b11 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -25,12 +25,24 @@
 #include <sys/ioctl.h>
 #include <sys/signal.h>
 
+#include "drmtest.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
-#include "igt.h"
+#include "i915/gem_engine_topology.h"
+#include "i915/gem_mman.h"
+#include "i915/gem_submission.h"
+#include "i915/gem_vm.h"
+#include "igt_aux.h"
+#include "igt_core.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
+#include "igt_types.h"
 #include "igt_vgem.h"
+#include "intel_chipset.h"
+#include "intel_ctx.h"
+#include "intel_gpu_commands.h"
+#include "ioctl_wrappers.h"
+
 /**
  * TEST: gem exec await
  * Category: Infrastructure
@@ -66,7 +78,7 @@ static void xchg_obj(void *array, unsigned i, unsigned j)
 }
 
 #define CONTEXTS 0x1
-static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
+static void wide(int fd, intel_ctx_cfg_t *cfg, int ring_size,
 		 int timeout, unsigned int flags)
 {
 	const struct intel_execution_engine2 *engine;
@@ -75,7 +87,6 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	struct {
 		struct drm_i915_gem_exec_object2 *obj;
 		struct drm_i915_gem_exec_object2 exec[2];
-		struct drm_i915_gem_relocation_entry reloc;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		const intel_ctx_t *ctx;
 		uint32_t *cmd;
@@ -83,9 +94,13 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
+	const intel_ctx_t *ctx;
 	unsigned long count;
 	double time;
-	uint64_t ahnd = get_reloc_ahnd(fd, 0); /* just offset provider */
+
+	__gem_vm_create(fd, &cfg->vm);
+	if (__intel_ctx_create(fd, cfg, &ctx))
+		ctx = intel_ctx_0(fd);
 
 	nengine = 0;
 	for_each_ctx_engine(fd, ctx, engine) {
@@ -102,7 +117,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	igt_assert(exec);
 
 	igt_require_memory(nengine*(2 + ring_size), 4096, CHECK_RAM);
-	obj = calloc(nengine*ring_size + 1, sizeof(*obj));
+	obj = calloc(nengine * (ring_size  + 1) + 1, sizeof(*obj));
 	igt_assert(obj);
 
 	for (unsigned e = 0; e < nengine; e++) {
@@ -111,69 +126,63 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		for (unsigned n = 0; n < ring_size; n++)  {
 			exec[e].obj[n].handle = gem_create(fd, 4096);
 			exec[e].obj[n].flags = EXEC_OBJECT_WRITE;
-			exec[e].obj[n].offset = get_offset(ahnd, exec[e].obj[n].handle,
-							   4096, 0);
-			if (ahnd)
-				exec[e].obj[n].flags |= EXEC_OBJECT_PINNED;
-
-			obj[e*ring_size + n].handle = exec[e].obj[n].handle;
-			obj[e*ring_size + n].offset = exec[e].obj[n].offset;
+			obj[e * ring_size + n] = exec[e].obj[n];
 		}
 
 		exec[e].execbuf.buffers_ptr = to_user_pointer(exec[e].exec);
-		exec[e].execbuf.buffer_count = 1;
-		exec[e].execbuf.flags = (engines[e] |
-					 I915_EXEC_NO_RELOC |
-					 I915_EXEC_HANDLE_LUT);
+		exec[e].execbuf.buffer_count = 2;
+		exec[e].execbuf.flags = engines[e];
+		exec[e].execbuf.rsvd1 = ctx->id;
 
 		if (flags & CONTEXTS) {
-			exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+			exec[e].ctx = intel_ctx_create(fd, cfg);
 			exec[e].execbuf.rsvd1 = exec[e].ctx->id;
-		} else {
-			exec[e].execbuf.rsvd1 = ctx->id;
 		}
 
-		exec[e].exec[0].handle = gem_create(fd, 4096);
-		exec[e].exec[0].offset = get_offset(ahnd, exec[e].exec[0].handle,
-						    4096, 0);
-		if (ahnd)
-			exec[e].exec[0].flags = EXEC_OBJECT_PINNED;
-
-		exec[e].cmd = gem_mmap__device_coherent(fd, exec[e].exec[0].handle,
-							0, 4096, PROT_WRITE);
-
-		gem_set_domain(fd, exec[e].exec[0].handle,
-			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
-		exec[e].cmd[0] = MI_BATCH_BUFFER_END;
-
-		gem_execbuf(fd, &exec[e].execbuf);
-		exec[e].exec[1] = exec[e].exec[0];
-		exec[e].execbuf.buffer_count = 2;
-
-		exec[e].reloc.target_handle = 1; /* recurse */
-		exec[e].reloc.offset = sizeof(uint32_t);
-		exec[e].reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
-		if (gen < 4)
-			exec[e].reloc.delta = 1;
-
-		exec[e].exec[1].relocs_ptr = to_user_pointer(&exec[e].reloc);
-		exec[e].exec[1].relocation_count = !ahnd ? 1 : 0;
+		exec[e].exec[1].handle = gem_create(fd, 4096);
+		obj[nengine * ring_size + e] = exec[e].exec[1];
 	}
 
-	obj[nengine*ring_size].handle = gem_create(fd, 4096);
-	gem_write(fd, obj[nengine*ring_size].handle, 0, &bbe, sizeof(bbe));
-
-	obj[nengine*ring_size].offset = get_offset(ahnd, obj[nengine*ring_size].handle,
-						   4096, 0);
-	if (ahnd)
-		obj[nengine*ring_size].flags |= EXEC_OBJECT_PINNED;
+	obj[nengine * (ring_size + 1)].handle = gem_create(fd, 4096);
+	gem_write(fd, obj[nengine * (ring_size + 1)].handle, 0,
+		  &bbe, sizeof(bbe));
 
 	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(&obj[nengine*ring_size]);
-	execbuf.buffer_count = 1;
-	gem_execbuf(fd, &execbuf); /* tag the object as a batch in the GTT */
 	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.buffer_count = nengine*ring_size + 1;
+	execbuf.buffer_count = nengine * (ring_size + 1) + 1;
+	execbuf.rsvd1 = ctx->id;
+	gem_execbuf(fd, &execbuf); /* tag the object as a batch in the GTT */
+	for (unsigned e = 0; e < nengine; e++) {
+		uint64_t address;
+		uint32_t *cs;
+
+		for (unsigned n = 0; n < ring_size; n++) {
+			obj[e * ring_size + n].flags |= EXEC_OBJECT_PINNED;
+			exec[e].obj[n] = obj[e * ring_size + n];
+		}
+		exec[e].exec[1] = obj[nengine * ring_size + e];
+		exec[e].exec[1].flags |= EXEC_OBJECT_PINNED;
+		address = exec[e].exec[1].offset;
+
+		exec[e].cmd = gem_mmap__device_coherent(fd, exec[e].exec[1].handle,
+							0, 4096, PROT_WRITE);
+		cs = exec[e].cmd;
+
+		*cs++ = MI_NOOP; /* placeholder for MI_ARB_CHECK */
+		if (gen >= 8) {
+			*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
+			*cs++ = address;
+			*cs++ = address >> 32;
+		} else if (gen >= 6) {
+			*cs++ = MI_BATCH_BUFFER_START | 1 << 8;
+			*cs++ = address;
+		} else {
+			*cs++ = MI_BATCH_BUFFER_START | 2 << 6;
+			if (gen < 4)
+				address |= 1;
+			*cs++ = address;
+		}
+	}
 
 	intel_detect_and_clear_missed_interrupts(fd);
 
@@ -182,42 +191,22 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	igt_until_timeout(timeout) {
 		struct timespec start, now;
 		for (unsigned e = 0; e < nengine; e++) {
-			uint64_t address;
-			int i;
-
 			if (flags & CONTEXTS) {
 				intel_ctx_destroy(fd, exec[e].ctx);
-				exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+				exec[e].ctx = intel_ctx_create(fd, cfg);
 				exec[e].execbuf.rsvd1 = exec[e].ctx->id;
 			}
 
-			exec[e].reloc.presumed_offset = exec[e].exec[1].offset;
-			address = (exec[e].reloc.presumed_offset +
-				   exec[e].reloc.delta);
 			gem_set_domain(fd, exec[e].exec[1].handle,
 				       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
+			exec[e].cmd[0] = MI_ARB_CHECK;
 
-			i = 0;
-			exec[e].cmd[i] = MI_BATCH_BUFFER_START;
-			if (gen >= 8) {
-				exec[e].cmd[i] |= 1 << 8 | 1;
-				exec[e].cmd[++i] = address;
-				exec[e].cmd[++i] = address >> 32;
-			} else if (gen >= 6) {
-				exec[e].cmd[i] |= 1 << 8;
-				exec[e].cmd[++i] = address;
-			} else {
-				exec[e].cmd[i] |= 2 << 6;
-				exec[e].cmd[++i] = address;
-			}
-
-			exec[e].exec[0] = obj[nengine*ring_size];
+			exec[e].exec[0] = obj[nengine * (ring_size + 1)];
 			gem_execbuf(fd, &exec[e].execbuf);
 
 			for (unsigned n = 0; n < ring_size; n++) {
 				exec[e].exec[0] = exec[e].obj[n];
 				gem_execbuf(fd, &exec[e].execbuf);
-				exec[e].obj[n].offset = exec[e].exec[0].offset;
 			}
 		}
 
@@ -225,10 +214,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		for (unsigned e = 0; e < nengine; e++) {
-			execbuf.flags = (engines[e] |
-					 I915_EXEC_NO_RELOC |
-					 I915_EXEC_HANDLE_LUT);
-			execbuf.rsvd1 = ctx->id;
+			execbuf.flags = engines[e];
 			gem_execbuf(fd, &execbuf);
 		}
 		clock_gettime(CLOCK_MONOTONIC, &now);
@@ -245,43 +231,40 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	igt_info("%s: %'lu cycles: %.3fus\n",
 		 __func__, count, time*1e6 / count);
 
-	gem_close(fd, obj[nengine*ring_size].handle);
+	for (unsigned n = 0; n < nengine * (ring_size + 1) + 1; n++)
+		gem_close(fd, obj[n].handle);
 	free(obj);
 
 	for (unsigned e = 0; e < nengine; e++) {
 		if (flags & CONTEXTS)
 			intel_ctx_destroy(fd, exec[e].ctx);
 
-		for (unsigned n = 0; n < ring_size; n++) {
-			gem_close(fd, exec[e].obj[n].handle);
-			put_offset(ahnd, exec[e].obj[n].handle);
-		}
-		free(exec[e].obj);
-
 		munmap(exec[e].cmd, 4096);
-		gem_close(fd, exec[e].exec[1].handle);
-		put_offset(ahnd, exec[e].exec[1].handle);
+		free(exec[e].obj);
 	}
 	free(exec);
-	put_ahnd(ahnd);
+
+	intel_ctx_destroy(fd, ctx);
+	__gem_vm_destroy(fd, cfg->vm);
+	cfg->vm = 0;
 }
 
 #define TIMEOUT 20
 
 igt_main
 {
+	intel_ctx_cfg_t cfg;
 	int ring_size = 0;
-	int device = -1;
-	const intel_ctx_t *ctx;
+	igt_fd_t(device);
 
 	igt_fixture {
 
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 		gem_submission_print_method(device);
-		ctx = intel_ctx_create_all_physical(device);
+		cfg = intel_ctx_cfg_all_physical(device);
 
-		ring_size = gem_submission_measure(device, &ctx->cfg, ALL_ENGINES);
+		ring_size = gem_submission_measure(device, &cfg, ALL_ENGINES);
 
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size > 0);
@@ -290,16 +273,14 @@ igt_main
 	}
 
 	igt_subtest("wide-all")
-		wide(device, ctx, ring_size, TIMEOUT, 0);
+		wide(device, &cfg, ring_size, TIMEOUT, 0);
 
 	igt_subtest("wide-contexts") {
 		gem_require_contexts(device);
-		wide(device, ctx, ring_size, TIMEOUT, CONTEXTS);
+		wide(device, &cfg, ring_size, TIMEOUT, CONTEXTS);
 	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		intel_ctx_destroy(device, ctx);
-		drm_close_driver(device);
 	}
 }
-- 
2.34.1
