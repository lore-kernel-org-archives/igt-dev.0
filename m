Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Dec 2022 12:02:42 +0000
Message-Id: <20221202120242.425128-2-matthew.auld@intel.com>
In-Reply-To: <20221202120242.425128-1-matthew.auld@intel.com>
References: <20221202120242.425128-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/gem_exec_balancer:
 exercise dmabuf import
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With parallel submission it should be easy to get a fence array as the
output fence. Try importing this into dma-buf reservation object, to see
if anything explodes.

v2: (Kamil)
 - Use ifdef __linux__ for linux headers
 - Add igt_describe() for new test

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7532
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_exec_balancer.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 4300dbd1..d7acdca1 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -27,6 +27,7 @@
 #include <sys/signal.h>
 #include <poll.h>
 
+#include "dmabuf_sync_file.h"
 #include "i915/gem.h"
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_create.h"
@@ -2856,6 +2857,7 @@ static void logical_sort_siblings(int i915,
 #define PARALLEL_SUBMIT_FENCE		(0x1 << 3)
 #define PARALLEL_CONTEXTS		(0x1 << 4)
 #define PARALLEL_VIRTUAL		(0x1 << 5)
+#define PARALLEL_OUT_FENCE_DMABUF	(0x1 << 6)
 
 static void parallel_thread(int i915, unsigned int flags,
 			    struct i915_engine_class_instance *siblings,
@@ -2871,6 +2873,8 @@ static void parallel_thread(int i915, unsigned int flags,
 	uint32_t target_bo_idx = 0;
 	uint32_t first_bb_idx = 1;
 	intel_ctx_cfg_t cfg;
+	uint32_t dmabuf_handle;
+	int dmabuf;
 
 	igt_assert(bb_per_execbuf < 32);
 
@@ -2924,11 +2928,20 @@ static void parallel_thread(int i915, unsigned int flags,
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.rsvd1 = ctx->id;
 
+	if (flags & PARALLEL_OUT_FENCE_DMABUF) {
+		dmabuf_handle = gem_create(i915, 4096);
+		dmabuf = prime_handle_to_fd(i915, dmabuf_handle);
+	}
+
 	for (n = 0; n < PARALLEL_BB_LOOP_COUNT; ++n) {
 		execbuf.flags &= ~0x3full;
 		gem_execbuf_wr(i915, &execbuf);
 
 		if (flags & PARALLEL_OUT_FENCE) {
+			if (flags & PARALLEL_OUT_FENCE_DMABUF)
+				dmabuf_import_sync_file(dmabuf, DMA_BUF_SYNC_WRITE,
+							execbuf.rsvd2 >> 32);
+
 			igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32,
 						      1000), 0);
 			igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -2959,6 +2972,11 @@ static void parallel_thread(int i915, unsigned int flags,
 	if (fence)
 		close(fence);
 
+	if (flags & PARALLEL_OUT_FENCE_DMABUF) {
+		gem_close(i915, dmabuf_handle);
+		close(dmabuf);
+	}
+
 	check_bo(i915, obj[target_bo_idx].handle,
 		 bb_per_execbuf * PARALLEL_BB_LOOP_COUNT, true);
 
@@ -3420,6 +3438,11 @@ igt_main
 		igt_subtest("parallel-out-fence")
 			parallel(i915, PARALLEL_OUT_FENCE);
 
+		igt_describe("Regression test to check that dmabuf imported sync file can handle fence array");
+		igt_subtest("parallel-dmabuf-import-out-fence")
+			parallel(i915, PARALLEL_OUT_FENCE |
+				 PARALLEL_OUT_FENCE_DMABUF);
+
 		igt_subtest("parallel-keep-in-fence")
 			parallel(i915, PARALLEL_OUT_FENCE | PARALLEL_IN_FENCE);
 
-- 
2.38.1
