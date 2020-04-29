Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Apr 2020 15:51:13 +0100
Message-Id: <20200429145113.588577-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf: Flush the work between rounds of
 gen8-unprivileged-single-ctx-counter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Wait until the GPU is idle before starting a fresh round of probing
gen8-unprivileged-single-ctx-counter. This avoids building up a huge
backlog of render copies, hogging buffers and stale contexts, and
invoking the oomkiller.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/perf.c b/tests/perf.c
index 74fc8fd87..2d23a02c6 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3787,6 +3787,7 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 			drm_intel_gem_context_destroy(context1);
 			drm_intel_bufmgr_destroy(bufmgr);
 			__perf_close(stream_fd);
+			gem_quiescent_gpu(drm_fd);
 		}
 
 		child_ret = igt_wait_helper(&child);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
