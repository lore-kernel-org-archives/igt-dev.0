Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC07892ED
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 09:56:45 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 14 Feb 2022 15:26:41 +0530
Message-Id: <20220214095641.27508-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/gem_reset_stats: Test for shared
 reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added new subtest shared_reset_domain:
The test submits non-preemptible requests to all RCS+CCS or multi CCS engines,
kills one and expects the rest to survive.One of those engines is reset
by submitting a hang then expects all dependent engines to be reset.
It checks the status of victimized context after reset.

v2:Modified code for all engines.

Issue:
After reset of target engine, the status of the contexts of other
engines are not consistent, they are either showing as victimized or
noerror but expected is for dependent engines, contexts should be
as victimized but for others as no error.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_reset_stats.c | 108 ++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 627a10ab..cad13898 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -39,19 +39,19 @@
 #include <sys/mman.h>
 #include <time.h>
 #include <signal.h>
-
+#include <poll.h>
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
 static uint32_t devid;
 
 struct local_drm_i915_reset_stats {
@@ -74,6 +74,22 @@ static void sync_gpu(void)
 	gem_quiescent_gpu(device);
 }
 
+static void context_unban(int fd, unsigned ctx)
+{
+	struct drm_i915_gem_context_param param = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_BANNABLE,
+		.value = 0,
+	};
+
+	gem_context_set_param(fd, &param);
+}
+
+static bool fence_busy(int fence)
+{
+	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
+}
+
 static int noop(int fd, uint32_t ctx, const struct intel_execution_ring *e)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -696,6 +712,63 @@ static void test_params(void)
 	close(fd);
 }
 
+/* Test tries to check the status of victimised contexts when one of the dependent engines tries to reset*/
+static void
+test_sh_re_domain(const intel_ctx_t *base_ctx,
+		const struct intel_execution_engine2 *e)
+{
+	const struct intel_execution_engine2 *e2;
+	const intel_ctx_t *ctx[GEM_MAX_ENGINES+1];
+	int ahnd[GEM_MAX_ENGINES+1];
+	igt_spin_t *spin[GEM_MAX_ENGINES+1];
+	int num_engines = 0;
+
+	for_each_ctx_engine(device, base_ctx, e2) {
+		if (e2->flags == e->flags)
+			continue;
+
+		ctx[num_engines] = intel_ctx_create_for_engine(device, e2->class, e2->instance);
+		context_unban(device, ctx[num_engines]->id);
+		ahnd[num_engines] = get_reloc_ahnd(device, ctx[num_engines]->id);
+		spin[num_engines] = igt_spin_new(device, .ahnd = ahnd[num_engines], .ctx = ctx[num_engines],
+				.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT);
+
+		/*Checks status of contexts*/
+		assert_reset_status(device, device, ctx[num_engines]->id, RS_NO_ERROR);
+		num_engines++;
+	}
+	ctx[num_engines] = intel_ctx_create_for_engine(device, e->class, e->instance);
+	ahnd[num_engines] = get_reloc_ahnd(device, ctx[num_engines]->id);
+	spin[num_engines] = igt_spin_new(device, .ahnd = ahnd[num_engines], .ctx = ctx[num_engines],
+			.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT);
+
+	/* Status of context which is going to be reset*/
+	assert_reset_status(device, device, ctx[num_engines]->id, RS_NO_ERROR);
+
+	num_engines++;
+	usleep(50 * 1000);
+
+	/*Waits until engine gets reset*/
+	sync_fence_wait(spin[num_engines-1]->out_fence, -1);
+
+	for (int n = 0; n < num_engines-1; n++) {
+		if (n == num_engines-1)
+			igt_assert(!fence_busy(spin[n]->out_fence));
+		else {
+			/* checks for victimized contexts*/
+			assert_reset_status(device, device, ctx[n]->id, RS_BATCH_ACTIVE);
+
+			igt_assert(fence_busy(spin[n]->out_fence));
+		}
+	}
+	for (int n = 0; n < num_engines; n++) {
+		igt_spin_end(spin[n]);
+		intel_ctx_destroy(device, ctx[n]);
+		put_ahnd(ahnd[n]);
+		igt_spin_free(device, spin[n]);
+	}
+}
+
 static const struct intel_execution_ring *
 next_engine(int fd, const struct intel_execution_ring *e)
 {
@@ -835,6 +908,37 @@ igt_main
 			RUN_TEST(defer_hangcheck(e));
 	}
 
+	igt_subtest_group {
+		const struct intel_execution_engine2 *e2;
+		const intel_ctx_t *ctx;
+		igt_hang_t hang = {};
+		struct gem_engine_properties saved_params[GEM_MAX_ENGINES];
+		int num_engines = 0;
+		intel_ctx_cfg_t cfg = {};
+
+		igt_fixture{
+			gem_require_contexts(device);
+			cfg = intel_ctx_cfg_all_physical(device);
+			ctx = intel_ctx_create(device, &cfg);
+
+			igt_disallow_hang(device, hang);
+			hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+
+			for_each_physical_engine(device, e2) {
+				saved_params[num_engines].engine = e2;
+				saved_params[num_engines].preempt_timeout = 500;
+				saved_params[num_engines].heartbeat_interval = 2500;
+				gem_engine_properties_configure(device, saved_params + num_engines++);
+			}
+		}
+
+		igt_subtest_with_dynamic("shared-reset-domain") {
+			for_each_ctx_engine(device, ctx, e2) {
+				igt_dynamic_f("%s", e2->name)
+					test_sh_re_domain(ctx, e2);
+			}
+		}
+	}
 	igt_fixture {
 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
 		close(device);
-- 
2.35.0
