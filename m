Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Apr 2020 16:05:00 +0100
Message-Id: <20200429150500.588743-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200429145113.588577-1-chris@chris-wilson.co.uk>
References: <20200429145113.588577-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] perf: Flush the work between rounds of
 gen8-unprivileged-single-ctx-counter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Wait until the GPU is idle before starting a fresh round of probing
gen8-unprivileged-single-ctx-counter. This avoids building up a huge
backlog of render copies, hogging buffers and stale contexts, and
invoking the oomkiller.

v2: Release everything before starting again.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/perf.c b/tests/perf.c
index 74fc8fd87..7bde46af8 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3762,19 +3762,9 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			igt_assert_eq(ret, 0);
 
 			ret = memcmp(src[0].bo->virtual, dst[0].bo->virtual, 4 * width * height);
-			if (ret != 0) {
-				accumulator_print(&accumulator, "total");
-				/* This needs to be investigated... From time
-				 * to time, the work we kick off doesn't seem
-				 * to happen. WTH?? */
-				exit(EAGAIN);
-			}
-
 			drm_intel_bo_unmap(src[0].bo);
 			drm_intel_bo_unmap(dst[0].bo);
 
-			igt_assert_eq(accumulator.deltas[2 + 26], width * height);
-
 			for (int i = 0; i < ARRAY_SIZE(src); i++) {
 				drm_intel_bo_unreference(src[i].bo);
 				drm_intel_bo_unreference(dst[i].bo);
@@ -3787,6 +3777,17 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			drm_intel_gem_context_destroy(context1);
 			drm_intel_bufmgr_destroy(bufmgr);
 			__perf_close(stream_fd);
+			gem_quiescent_gpu(drm_fd);
+
+			if (ret != 0) {
+				accumulator_print(&accumulator, "total");
+				/* This needs to be investigated... From time
+				 * to time, the work we kick off doesn't seem
+				 * to happen. WTH?? */
+				exit(EAGAIN);
+			}
+
+			igt_assert_eq(accumulator.deltas[2 + 26], width * height);
 		}
 
 		child_ret = igt_wait_helper(&child);
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
