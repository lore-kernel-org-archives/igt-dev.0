Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192710E13E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 12:59:14 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue,  8 Feb 2022 18:29:11 +0530
Message-Id: <20220208125911.8824-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 RFC ] tests/gem_reset_stats: Test for shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, matthew.d.roper@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added new subtest shared_reset_domain:
The test submits non-preemptible requests to all RCS+CCS or multi CCS engines,
kills one and expects the rest to survive.One of those engines is reset
by submitting a hang then expects all dependent engines to be reset.
It checks the status of victimized context after reset.

Issue: Passing for first 2 instances of CCS and then failing for next instances.
Need to work on it as it is due to dependency between engines.
ToDo : modify code to execute for all engines

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_reset_stats.c | 103 ++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 627a10ab..c919c006 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -39,19 +39,20 @@
 #include <sys/mman.h>
 #include <time.h>
 #include <signal.h>
-
+#include "igt_gt.c"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "sw_sync.h"
 
 #define RS_NO_ERROR      0
 #define RS_BATCH_ACTIVE  (1 << 0)
 #define RS_BATCH_PENDING (1 << 1)
 #define RS_UNKNOWN       (1 << 2)
 
-
+static unsigned long reset_timeout_ms = 640;
 static uint32_t devid;
 
 struct local_drm_i915_reset_stats {
@@ -74,6 +75,17 @@ static void sync_gpu(void)
 	gem_quiescent_gpu(device);
 }
 
+static int wait_for_status(int fence, int timeout)
+{
+	int err;
+
+	err = sync_fence_wait(fence, timeout);
+	if (err)
+		return err;
+
+	return sync_fence_status(fence);
+}
+
 static int noop(int fd, uint32_t ctx, const struct intel_execution_ring *e)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -464,6 +476,72 @@ static void test_unrelated_ctx(const struct intel_execution_ring *e)
 	close(fd1);
 	close(fd2);
 }
+/* Test tries to check the status of victimised contexts when one of the dependent engines tries to reset*/
+static void
+test_sh_re_domain(const intel_ctx_cfg_t *cfg,
+			   unsigned int engine_flags)
+{
+	const struct intel_execution_engine2 *other;
+	igt_spin_t *spin;
+	const intel_ctx_t *base_ctx;
+	const intel_ctx_t *ctx;
+	uint64_t ahnd;
+	int i915;
+	int fence = -1;
+	igt_hang_t hang;
+
+	i915 = gem_reopen_driver(device);
+	base_ctx = intel_ctx_create(i915, cfg);
+	ahnd =  get_reloc_ahnd(i915, base_ctx->id);
+
+	/* Creates a spin batch for RCS+CCS combination or multi CCS*/
+	for_each_ctx_engine(i915, base_ctx, other) {
+		if (other->flags == engine_flags || other->class != I915_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = base_ctx,
+				   .engine = other->flags,
+				   .flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT);
+
+		assert_reset_status(i915, i915, base_ctx->id, RS_NO_ERROR);
+
+		if (fence < 0) {
+			fence = spin->out_fence;
+		} else {
+			int tmp;
+
+			tmp = sync_fence_merge(fence, spin->out_fence);
+			close(fence);
+			close(spin->out_fence);
+
+			fence = tmp;
+		}
+		spin->out_fence = -1;
+	}
+
+	put_ahnd(ahnd);
+	igt_require(fence != -1);
+	ctx = intel_ctx_create(i915, &base_ctx->cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+
+	/*Checks the context status of the engine which is going to be reset*/
+	assert_reset_status(i915, i915, ctx->id, RS_NO_ERROR);
+
+	/*Injects a hang on the engine for reset*/
+	hang = igt_hang_ctx(i915, ctx->id, engine_flags, 0);
+	igt_post_hang_ring(i915, hang);
+
+	/*Checks the status of victimized context of dependent engine*/
+	assert_reset_status(i915, i915, base_ctx->id, RS_BATCH_ACTIVE);
+
+	sync_gpu();
+	igt_assert_eq(wait_for_status(fence, reset_timeout_ms), -EIO);
+	close(fence);
+	igt_spin_end(spin);
+	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
+	close(i915);
+}
 
 static int get_reset_count(int fd, int ctx)
 {
@@ -834,6 +912,27 @@ igt_main
 		igt_subtest_f("defer-hangcheck-%s", e->name)
 			RUN_TEST(defer_hangcheck(e));
 	}
+	igt_subtest_group {
+		const struct intel_execution_engine2 *e2;
+		const intel_ctx_t *ctx;
+		igt_hang_t hang = {};
+
+		igt_fixture{
+			gem_require_contexts(device);
+			ctx = intel_ctx_create_all_physical(device);
+			igt_disallow_hang(device, hang);
+			hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+		}
+
+		igt_subtest_with_dynamic_f("shared-reset-domain") {
+			for_each_ctx_engine(device, ctx, e2) {
+				if (e2->class == I915_ENGINE_CLASS_COMPUTE ||
+						e2->class == I915_ENGINE_CLASS_RENDER)
+				  igt_dynamic_f("%s", e2->name)
+					 test_sh_re_domain(&ctx->cfg, e2->flags);
+			}
+		}
+	}
 
 	igt_fixture {
 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
-- 
2.35.0
