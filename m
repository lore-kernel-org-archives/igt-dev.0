Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  4 Feb 2020 15:24:56 +0000
Message-Id: <20200204152456.1137083-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Cover all engines for
 nohangcheck
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

No engine can be missed when verifying that a rogue user cannot cause a
denial-of-service with nohangcheck.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_ctx_exec.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index b1ae65774..2a16357a4 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -42,6 +42,7 @@
 
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
+#include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Test context batch buffer execution.");
 
@@ -203,9 +204,9 @@ static bool __enable_hangcheck(int dir, bool state)
 
 static void nohangcheck_hostile(int i915)
 {
-	int64_t timeout = NSEC_PER_SEC / 2;
-	igt_spin_t *spin;
+	int64_t timeout = MSEC_PER_SEC / 2;
 	igt_hang_t hang;
+	int fence = -1;
 	uint32_t ctx;
 	int err = 0;
 	int dir;
@@ -223,16 +224,35 @@ static void nohangcheck_hostile(int i915)
 
 	igt_require(__enable_hangcheck(dir, false));
 
-	spin = igt_spin_new(i915, ctx, .flags = IGT_SPIN_NO_PREEMPTION);
+	for_each_physical_engine(e, i915) {
+		igt_spin_t *spin;
+
+		spin = igt_spin_new(i915, ctx,
+				    .engine = eb_ring(e),
+				    .flags = (IGT_SPIN_NO_PREEMPTION |
+					      IGT_SPIN_FENCE_OUT));
+
+		igt_assert(spin->out_fence != -1);
+		if (fence < 0) {
+			fence = spin->out_fence;
+			spin->out_fence = -1;
+		} else {
+			int new;
+
+			new = sync_fence_merge(fence, spin->out_fence);
+			close(fence);
+
+			fence = new;
+		}
+	}
 	gem_context_destroy(i915, ctx);
+	igt_assert(fence != -1);
 
-	if (gem_wait(i915, spin->handle, &timeout)) {
+	if (sync_fence_wait(fence, timeout)) {
 		igt_debugfs_dump(i915, "i915_engine_info");
 		err = -ETIME;
 	}
 
-	igt_spin_free(i915, spin);
-
 	__enable_hangcheck(dir, true);
 	gem_quiescent_gpu(i915);
 	igt_disallow_hang(i915, hang);
@@ -240,6 +260,9 @@ static void nohangcheck_hostile(int i915)
 	igt_assert_f(err == 0,
 		     "Hostile unpreemptable context was not cancelled immediately upon closure\n");
 
+	igt_assert_eq(sync_fence_status(fence), -EIO);
+	close(fence);
+
 	close(dir);
 }
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
