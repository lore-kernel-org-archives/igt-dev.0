Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF21C10E125
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 21:14:26 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:14:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <20220421211409.GG55612@unerlige-ril-10.165.21.154>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
 <20220421145211.464313-7-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220421145211.464313-7-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/gem_reset_stats: Test for
 shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: krishnaiah.bommu@intel.com, igt-dev@lists.freedesktop.org,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 08:22:11PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Added new subtest shared_reset_domain:
>The test submits non-preemptible requests to all engines,
>kills one and expects the rest to survive.
>If one of those engines reset is RCS/CCS or multi-CCS
>then expects only dependent engines to be reset.
>It checks the status of context after reset.
>Result:
>1.If engine reset is one among dependent engines
>then contexts of dependent engines to be victimized and
>rest to be of noerror.
>2.If engine reset is of non dependent engines then all
>the contexts are of noerror.
>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> tests/i915/gem_reset_stats.c | 162 +++++++++++++++++++++++++++++++++++
> 1 file changed, 162 insertions(+)
>
>diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
>index 627a10ab..960dcebc 100644
>--- a/tests/i915/gem_reset_stats.c
>+++ b/tests/i915/gem_reset_stats.c
>@@ -39,12 +39,14 @@
> #include <sys/mman.h>
> #include <time.h>
> #include <signal.h>
>+#include <poll.h>
>
> #include "i915/gem.h"
> #include "i915/gem_create.h"
> #include "i915/gem_ring.h"
> #include "igt.h"
> #include "igt_sysfs.h"
>+#include "sw_sync.h"
>
> #define RS_NO_ERROR      0
> #define RS_BATCH_ACTIVE  (1 << 0)
>@@ -63,12 +65,61 @@ struct local_drm_i915_reset_stats {
> 	__u32 pad;
> };
>
>+struct spin_ctx {
>+	unsigned int class;
>+	unsigned int instance;
>+	const intel_ctx_t *ctx;
>+	int ahnd;
>+	igt_spin_t *spin;
>+};
>+
> #define MAX_FD 32
>
> #define GET_RESET_STATS_IOCTL DRM_IOWR(DRM_COMMAND_BASE + 0x32, struct local_drm_i915_reset_stats)
>
> static int device;
>
>+static bool __enable_hangcheck(int dir, bool state)
>+{
>+	return igt_sysfs_set(dir, "enable_hangcheck", state ? "1" : "0");
>+}
>+
>+static void enable_hangcheck(int i915, bool state)
>+{
>+	int dir;
>+
>+	dir = igt_params_open(i915);
>+	if (dir < 0) /* no parameters, must be default! */
>+		return;
>+
>+	__enable_hangcheck(dir, state);
>+	close(dir);
>+}
>+
>+static void set_unbannable(int i915, uint32_t ctx)
>+{
>+	struct drm_i915_gem_context_param p = {
>+		.ctx_id = ctx,
>+		.param = I915_CONTEXT_PARAM_BANNABLE,
>+	};
>+
>+	gem_context_set_param(i915, &p);
>+}
>+
>+static void
>+create_spinner(int i915,  const intel_ctx_cfg_t *base_cfg, struct spin_ctx *_spin,
>+		int engine_flag, int prio, unsigned int flags)
>+{
>+	_spin->ctx = intel_ctx_create(i915, base_cfg);
>+	set_unbannable(i915, _spin->ctx->id);
>+	gem_context_set_priority(i915, _spin->ctx->id, prio);
>+	_spin->ahnd = get_reloc_ahnd(i915, _spin->ctx->id);
>+
>+	_spin->spin = igt_spin_new(i915, .ahnd = _spin->ahnd,
>+			.ctx = _spin->ctx, .engine = engine_flag, .flags = flags);
>+	igt_spin_busywait_until_started(_spin->spin);
>+}
>+
> static void sync_gpu(void)
> {
> 	gem_quiescent_gpu(device);
>@@ -764,6 +815,87 @@ static bool gem_has_reset_stats(int fd)
> 	return false;
> }
>
>+static void test_shared_reset_domain(const intel_ctx_cfg_t *base_cfg,
>+		const struct intel_execution_engine2 *e)
>+{
>+	struct spin_ctx  __spin_ctx[GEM_MAX_ENGINES + 1];
>+	const struct intel_execution_engine2 *e2;
>+	struct gem_engine_properties params;
>+	int target_index = 0;
>+	int n_e = 0;
>+
>+	sync_gpu();
>+
>+	params.engine = e;
>+	params.preempt_timeout = 1;
>+	params.heartbeat_interval = 250;
>+	gem_engine_properties_configure(device, &params);
>+
>+	for_each_ctx_cfg_engine(device, base_cfg, e2) {
>+		if (e2->flags == e->flags)
>+			target_index = n_e;
>+
>+		__spin_ctx[n_e].class = e2->class;
>+		__spin_ctx[n_e].instance = e2->instance;
>+
>+		/* Submits non preemptible workloads to all engines. */
>+		create_spinner(device, base_cfg, &__spin_ctx[n_e], e2->flags, -1023,
>+				IGT_SPIN_NO_PREEMPTION | IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT);
>+
>+		/* Checks the status of contexts submitted to engines. */
>+		assert_reset_status(device, device, __spin_ctx[n_e].ctx->id, RS_NO_ERROR);
>+
>+		n_e++;
>+	}
>+
>+	/* Submits preemptible workload to engine to be reset. */
>+	create_spinner(device, base_cfg, &__spin_ctx[n_e], e->flags, 1023, IGT_SPIN_POLL_RUN);
>+
>+	/* Checks the status of preemptible context. */
>+	assert_reset_status(device, device, __spin_ctx[n_e].ctx->id, RS_NO_ERROR);
>+
>+	igt_spin_free(device, __spin_ctx[n_e].spin);
>+	igt_assert_eq(sync_fence_wait(__spin_ctx[target_index].spin->out_fence, -1), 0);
>+
>+	/* Checks the status of context after reset. */
>+	assert_reset_status(device, device, __spin_ctx[target_index].ctx->id, RS_BATCH_ACTIVE);
>+
>+	for (int n = 0; n < n_e; n++) {
>+		/*
>+		 * If engine reset is RCS/CCS(dependent engines), then all the other
>+		 * contexts of RCS/CCS instances are victimised and rest contexts
>+		 * is of no error else if engine reset is not CCS/RCS then all the
>+		 * contexts should be of no error.
>+		 */
>+		struct spin_ctx *s = &__spin_ctx[n];
>+
>+		igt_debug("Checking reset status for %d:%d\n", s->class, s->instance);
>+		if (n == target_index)
>+			continue;
>+		if ((e->class == I915_ENGINE_CLASS_COMPUTE ||
>+		     e->class == I915_ENGINE_CLASS_RENDER) &&
>+		    (s->class == I915_ENGINE_CLASS_COMPUTE ||
>+		     s->class == I915_ENGINE_CLASS_RENDER)) {
>+			igt_assert_eq(sync_fence_wait(s->spin->out_fence, -1), 0);
>+			assert_reset_status(device, device, s->ctx->id, RS_BATCH_ACTIVE);
>+		} else {
>+			assert_reset_status(device, device, s->ctx->id, RS_NO_ERROR);
>+		}
>+	}
>+
>+	/* Cleanup. */
>+	for (int i = 0; i < n_e; i++) {
>+		igt_spin_free(device, __spin_ctx[i].spin);
>+		intel_ctx_destroy(device, __spin_ctx[i].ctx);
>+		put_ahnd(__spin_ctx[i].ahnd);
>+	}
>+	intel_ctx_destroy(device, __spin_ctx[n_e].ctx);
>+	put_ahnd(__spin_ctx[n_e].ahnd);
>+
>+	sync_gpu();
>+	gem_engine_properties_restore(device, &params);
>+}
>+
> #define RUN_TEST(...) do { sync_gpu(); __VA_ARGS__; sync_gpu(); } while (0)
> #define RUN_CTX_TEST(...) do { check_context(e); RUN_TEST(__VA_ARGS__); } while (0)
>
>@@ -778,6 +910,7 @@ igt_main
> 		device = drm_open_driver(DRIVER_INTEL);
> 		devid = intel_get_drm_devid(device);
>
>+		enable_hangcheck(device, true);
> 		has_reset_stats = gem_has_reset_stats(device);
>
> 		igt_assert(igt_params_set(device, "reset", "%d", 1 /* only global reset */));
>@@ -835,6 +968,35 @@ igt_main
> 			RUN_TEST(defer_hangcheck(e));
> 	}
>
>+	igt_subtest_group {
>+		const struct intel_execution_engine2 *e2;
>+		int num_gts;
>+
>+		igt_fixture {
>+			gem_require_contexts(device);
>+			igt_allow_hang(device, 0, 0);
>+			igt_assert(igt_params_set(device, "reset", "%u", -1));
>+			enable_hangcheck(device, false);
>+
>+			num_gts = igt_sysfs_get_num_gts(device);
>+		}
>+		igt_subtest_with_dynamic("shared-reset-domain") {
>+			/*Test runs for each gt*/
>+			for (int gt = 0; gt < num_gts; gt++) {
>+				intel_ctx_cfg_t cfg = {};
>+
>+				cfg = intel_ctx_cfg_for_gt(device, gt);

I see this is now pulling in the gt specific patches too and I believe 
Ashutosh mentioned that some of them need corresponding i915 patches 
too.

There is way you can avoid that for now. You can drop all lines with 
num_gts (drop the for loop as well). Then you can use this:

cfg = intel_ctx_cfg_all_physical(device);

That should simplify this series to just this one patch. Once the gt 
specific patches are merged along with kernel changes, you can go back 
to iterating over gts.

With those changes, this is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>+
>+				for_each_ctx_cfg_engine(device, &cfg, e2) {
>+					igt_dynamic_f("%s", e2->name)
>+						test_shared_reset_domain(&cfg, e2);
>+				}
>+			}
>+		}
>+		igt_fixture {
>+			enable_hangcheck(device, true);
>+		}
>+	}
> 	igt_fixture {
> 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
> 		close(device);
>-- 
>2.25.1
>
