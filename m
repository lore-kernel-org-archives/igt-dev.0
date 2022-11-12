Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A50510E0B1
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Nov 2022 06:08:40 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Nov 2022 11:37:14 +0530
Message-Id: <20221112060714.1084199-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_exec_fence: Replacing
 custom spinner with igt_spin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Replace the custom spinner with igt_spin, possible now that igt_spin
can provide the out-fence. This has a major advantage, such as able to run
on any platform, including over the cmdparser.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_exec_fence.c | 108 +++++++++---------------------------
 1 file changed, 26 insertions(+), 82 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index e8d51a732..4b5a74490 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -25,10 +25,10 @@
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <sys/signal.h>
-
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_dummyload.h"
 #include "igt_store.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
@@ -40,11 +40,11 @@ IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
 
 #ifndef SYNC_IOC_MERGE
 struct sync_merge_data {
-	char    name[32];
-	int32_t fd2;
-	int32_t fence;
-	uint32_t        flags;
-	uint32_t        pad;
+	char     name[32];
+	int32_t  fd2;
+	int32_t  fence;
+	uint32_t flags;
+	uint32_t pad;
 };
 #define SYNC_IOC_MAGIC '>'
 #define SYNC_IOC_MERGE _IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
@@ -67,109 +67,53 @@ static bool fence_busy(int fence)
 #define HANG 0x1
 #define NONBLOCK 0x2
 #define WAIT 0x4
+#define NOT(n) !n
 
 static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    unsigned flags)
 {
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-	struct drm_i915_gem_exec_object2 obj;
-	struct drm_i915_gem_relocation_entry reloc;
-	struct drm_i915_gem_execbuffer2 execbuf;
-	struct timespec tv;
-	uint32_t *batch;
 	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
-	int fence, i, timeout;
-
-	if ((flags & HANG) == 0)
-		igt_require(gem_class_has_mutable_submission(fd, e->class));
+	struct timespec tv;
+	int fence, timeout;
+	igt_spin_t *spin;
 
 	gem_quiescent_gpu(fd);
 
-	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(&obj);
-	execbuf.buffer_count = 1;
-	execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
-	execbuf.rsvd1 = ctx->id;
-
-	memset(&obj, 0, sizeof(obj));
-	obj.handle = gem_create(fd, 4096);
-	obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
-
-	batch = gem_mmap__device_coherent(fd, obj.handle, 0, 4096, PROT_WRITE);
-	gem_set_domain(fd, obj.handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-
-	i = 0;
-	if ((flags & HANG) == 0)
-		batch[i++] = 0x5 << 23;
-
-	if (!ahnd) {
-		obj.relocs_ptr = to_user_pointer(&reloc);
-		obj.relocation_count = 1;
-		memset(&reloc, 0, sizeof(reloc));
-		reloc.target_handle = obj.handle; /* recurse */
-		reloc.presumed_offset = obj.offset;
-		reloc.offset = (i + 1) * sizeof(uint32_t);
-		reloc.delta = 0;
-		reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
-		reloc.write_domain = 0;
-	} else {
-		obj.flags |= EXEC_OBJECT_PINNED;
-	}
-
-	batch[i] = MI_BATCH_BUFFER_START;
-	if (gen >= 8) {
-		batch[i] |= 1 << 8 | 1;
-		batch[++i] = obj.offset;
-		batch[++i] = obj.offset >> 32;
-	} else if (gen >= 6) {
-		batch[i] |= 1 << 8;
-		batch[++i] = obj.offset;
-	} else {
-		batch[i] |= 2 << 6;
-		batch[++i] = obj.offset;
-		if (gen < 4) {
-			batch[i] |= 1;
-			reloc.delta = 1;
-		}
-	}
-	i++;
-
-	execbuf.rsvd2 = -1;
-	gem_execbuf_wr(fd, &execbuf);
-	fence = execbuf.rsvd2 >> 32;
-	igt_assert(fence != -1);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags,
+			    .flags = IGT_SPIN_FENCE_OUT |
+			    ((flags & HANG) ? IGT_SPIN_NO_PREEMPTION : 0));
 
-	igt_assert(gem_bo_busy(fd, obj.handle));
+	fence = spin->out_fence;
+	igt_assert(gem_bo_busy(fd, spin->handle));
 	igt_assert(fence_busy(fence));
 
 	timeout = 120;
 	if ((flags & HANG) == 0) {
-		*batch = MI_BATCH_BUFFER_END;
-		__sync_synchronize();
-		timeout = 1;
+		igt_spin_end(spin);
+		timeout = NOT(igt_run_in_simulation())?1:120;
 	}
-	munmap(batch, 4096);
 
 	if (flags & WAIT) {
 		struct pollfd pfd = { .fd = fence, .events = POLLIN };
 		igt_assert(poll(&pfd, 1, timeout*1000) == 1);
 	} else {
+		int elapsed_time;
 		memset(&tv, 0, sizeof(tv));
-		while (fence_busy(fence))
+		while (fence_busy(fence)) {
+			elapsed_time = igt_seconds_elapsed(&tv);
+			if (elapsed_time >= timeout)
+				igt_info("Elapsed time (%ds)\n", elapsed_time);
 			igt_assert(igt_seconds_elapsed(&tv) < timeout);
+		}
+		igt_info("Elapsed time (%ds)\n", igt_seconds_elapsed(&tv));
 	}
-
-	igt_assert(!gem_bo_busy(fd, obj.handle));
+	igt_assert(!gem_bo_busy(fd, spin->handle));
 	igt_assert_eq(sync_fence_status(fence),
 		      flags & HANG ? -EIO : SYNC_FENCE_OK);
 
-	close(fence);
-	gem_close(fd, obj.handle);
-	put_offset(ahnd, obj.handle);
+	igt_spin_free(fd, spin);
 	put_ahnd(ahnd);
-
 	gem_quiescent_gpu(fd);
 }
 
-- 
2.25.1
