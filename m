Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0610E6A3
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:21:05 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:32 +0000
Message-ID: <20230928174535.2074462-18-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 17/17] benchmarks/gem_wsim: added basic xe
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added basic xe support. Single binary handles both i915 and Xe devices.

Some functionality is still missing: working sets, bonding.

The tool is handy for scheduling tests, we find it useful to verify vGPU
profiles defining different execution quantum/preemption timeout
settings.

There is also some rationale for the tool in following thread:
https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/

With this patch it should be possible to run following on xe device:

gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600

Best with drm debug logs disabled:

echo 0 > /sys/module/drm/parameters/debug

v2: minimizing divergence - same workload syntax for both drivers,
    so most existing examples should run on xe unmodified (Tvrtko)
    This version creates one common VM per workload.
    Explicit VM management, compute mode will come in next patchset.

v3:
- use calloc in parse_workload for struct workload,
  to allow cleanups in fini_workload
- grouped xe specific fields (Tvrtko)
- moved is_xe boolean next to fd (Tvrtko)
- use xe_ prefix for Xe specific things (Tvrtko)
- left throttling untouched (Tvrtko)
- parse errors vs silent skips on not implemented steps (Tvrtko)
- need to think on better engine handling in next version
- add 'Xe and i915 differences' section to README (Tvrtko)
  for now no data dependency implemented, left -1 <=> f-1
  to not modify examples (maybe too optimistic assumption?)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c  | 430 +++++++++++++++++++++++++++++++++++++++--
 benchmarks/wsim/README |  15 +-
 2 files changed, 432 insertions(+), 13 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index d447dced4..68c3b2cb0 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -62,6 +62,12 @@
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
 
+#include "igt_syncobj.h"
+#include "intel_allocator.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
+
 enum intel_engine_id {
 	DEFAULT,
 	RCS,
@@ -185,11 +191,31 @@ struct w_step {
 			struct drm_i915_gem_relocation_entry reloc[3];
 			uint32_t *bb_duration;
 		} i915;
+		struct {
+			struct drm_xe_exec exec;
+			struct {
+				struct xe_spin spin;
+				uint64_t vm_sync;
+				uint64_t exec_sync;
+			} *data;
+			struct drm_xe_sync *syncs;
+		} xe;
 	};
 	uint32_t bb_handle;
 	size_t bb_size;
 };
 
+struct xe_vm {
+	uint32_t id;
+	bool compute_mode;
+	uint64_t ahnd;
+};
+
+struct xe_exec_queue {
+	uint32_t id;
+	struct drm_xe_engine_class_instance hwe;
+};
+
 struct ctx {
 	uint32_t id;
 	int priority;
@@ -199,6 +225,12 @@ struct ctx {
 	struct bond *bonds;
 	bool load_balance;
 	uint64_t sseu;
+	struct {
+		/* reference to vm */
+		struct xe_vm *vm;
+		/* queue for each class */
+		struct xe_exec_queue queues[NUM_ENGINES];
+	} xe;
 };
 
 struct workload {
@@ -222,6 +254,11 @@ struct workload {
 	unsigned int nr_ctxs;
 	struct ctx *ctx_list;
 
+	struct {
+		unsigned int nr_vms;
+		struct xe_vm *vm_list;
+	} xe;
+
 	struct working_set **working_sets; /* array indexed by set id */
 	int max_working_set_id;
 
@@ -232,10 +269,24 @@ struct workload {
 	unsigned int nrequest[NUM_ENGINES];
 };
 
+#define for_each_ctx(__ctx, __wrk) \
+	for (int __i = 0; __i < (__wrk)->nr_ctxs && \
+	     (__ctx = &(__wrk)->ctx_list[__i]); ++__i)
+
+#define for_each_xe_exec_queue(__eq, __ctx) \
+		for (int __j = 0; __j < NUM_ENGINES && \
+		     ((__eq) = &((__ctx)->xe.queues[__j])); ++__j) \
+			for_if((__eq)->id > 0)
+
+#define for_each_xe_vm(__vm, __wrk) \
+	for (int __i = 0; __i < (__wrk)->xe.nr_vms && \
+	     (__vm = &(__wrk)->xe.vm_list[__i]); ++__i)
+
 static unsigned int master_prng;
 
 static int verbose = 1;
 static int fd;
+static bool is_xe;
 static struct drm_i915_gem_context_param_sseu device_sseu = {
 	.slice_mask = -1 /* Force read on first use. */
 };
@@ -256,7 +307,10 @@ static const char *ring_str_map[NUM_ENGINES] = {
 
 static void w_step_sync(struct w_step *w)
 {
-	gem_sync(fd, w->i915.obj[0].handle);
+	if (is_xe)
+		igt_assert(syncobj_wait(fd, &w->xe.syncs[0].handle, 1, INT64_MAX, 0, NULL));
+	else
+		gem_sync(fd, w->i915.obj[0].handle);
 }
 
 static int read_timestamp_frequency(int i915)
@@ -360,15 +414,23 @@ parse_dependency(unsigned int nr_steps, struct w_step *w, char *str)
 		if (entry.target > 0 || ((int)nr_steps + entry.target) < 0)
 			return -1;
 
-		add_dep(&w->data_deps, entry);
+		/* only fence deps in xe, let f-1 <==> -1 */
+		if (is_xe)
+			add_dep(&w->fence_deps, entry);
+		else
+			add_dep(&w->data_deps, entry);
 
 		break;
 	case 's':
-		submit_fence = true;
+		/* no submit fence in xe ? */
+		if (!is_xe)
+			submit_fence = true;
 		/* Fall-through. */
 	case 'f':
-		/* Multiple fences not yet supported. */
-		igt_assert_eq(w->fence_deps.nr, 0);
+		/* xe supports multiple fences */
+		if (!is_xe)
+			/* Multiple fences not yet supported. */
+			igt_assert_eq(w->fence_deps.nr, 0);
 
 		entry.target = atoi(++str);
 		if (entry.target > 0 || ((int)nr_steps + entry.target) < 0)
@@ -478,7 +540,17 @@ static struct intel_engine_data *query_engines(void)
 	if (engines.nengines)
 		return &engines;
 
-	engines = intel_engine_list_of_physical(fd);
+	if (is_xe) {
+		struct drm_xe_engine_class_instance *hwe;
+
+		xe_for_each_hw_engine(fd, hwe) {
+			engines.engines[engines.nengines].class = hwe->engine_class;
+			engines.engines[engines.nengines].instance = hwe->engine_instance;
+			engines.nengines++;
+		}
+	} else
+		engines = intel_engine_list_of_physical(fd);
+
 	igt_assert(engines.nengines);
 	return &engines;
 }
@@ -571,6 +643,40 @@ get_engine(enum intel_engine_id engine)
 	return ci;
 }
 
+static struct drm_xe_engine_class_instance
+xe_get_engine(enum intel_engine_id engine)
+{
+	struct drm_xe_engine_class_instance ci = {};
+
+	switch (engine) {
+	case DEFAULT:
+	case RCS:
+		ci.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+		ci.engine_instance = 0;
+		break;
+	case BCS:
+		ci.engine_class = DRM_XE_ENGINE_CLASS_COPY;
+		ci.engine_instance = 0;
+		break;
+	case VCS1:
+		ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		ci.engine_instance = 0;
+		break;
+	case VCS2:
+		ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		ci.engine_instance = 1;
+		break;
+	case VECS:
+		ci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		ci.engine_instance = 0;
+		break;
+	default:
+		igt_assert(0);
+	};
+
+	return ci;
+}
+
 static int parse_engine_map(struct w_step *step, const char *_str)
 {
 	char *token, *tctx = NULL, *tstart = (char *)_str;
@@ -845,6 +951,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Priority step is not implemented yet :(\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -871,6 +983,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "S")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("SSEU step is not implemented yet :(\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(tmp <= 0 && nr == 0,
@@ -984,6 +1102,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "b")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Bonding is not implemented yet :(\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					check_arg(nr > 2,
 						  "Invalid bond format at step %u!\n",
@@ -1018,6 +1142,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "w") || !strcmp(field, "W")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Working sets are not implemented yet :(\n");
+					free(token);
+					return NULL;
+				}
+
 				step.working_set.shared = field[0] == 'W';
 
 				while ((field = strtok_r(fstart, ".", &fctx))) {
@@ -1136,7 +1266,7 @@ add_step:
 		nr_steps += app_w->nr_steps;
 	}
 
-	wrk = malloc(sizeof(*wrk));
+	wrk = calloc(1, sizeof(*wrk));
 	igt_assert(wrk);
 
 	wrk->nr_steps = nr_steps;
@@ -1297,6 +1427,20 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
 	return &wrk->ctx_list[w->context];
 }
 
+static struct xe_exec_queue *
+xe_get_eq(struct workload *wrk, const struct w_step *w)
+{
+	igt_assert(w->engine >= 0 && w->engine < NUM_ENGINES);
+
+	return &__get_ctx(wrk, w)->xe.queues[w->engine];
+}
+
+static struct xe_vm *
+xe_get_vm(struct workload *wrk, const struct w_step *w)
+{
+	return wrk->xe.vm_list;
+}
+
 static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
 {
 	const char *name;
@@ -1549,6 +1693,62 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 #endif
 }
 
+static void
+xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
+{
+	struct xe_vm *vm = xe_get_vm(wrk, w);
+	struct xe_exec_queue *eq = xe_get_eq(wrk, w);
+	struct dep_entry *dep;
+	int i;
+
+	w->bb_size = ALIGN(sizeof(*w->xe.data) + xe_cs_prefetch_size(fd),
+			   xe_get_default_alignment(fd));
+	w->bb_handle = xe_bo_create_flags(fd, vm->id, w->bb_size,
+				visible_vram_if_possible(fd, eq->hwe.gt_id));
+	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
+	w->xe.exec.address =
+		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
+						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
+	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
+	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
+				   .preempt = (w->preempt_us > 0),
+				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe.gt_id,
+								1000LL * get_duration(wrk, w)));
+	w->xe.exec.exec_queue_id = eq->id;
+	w->xe.exec.num_batch_buffer = 1;
+	/* always at least one out fence */
+	w->xe.exec.num_syncs = 1;
+	/* count syncs */
+	igt_assert_eq(0, w->data_deps.nr);
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
+		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
+			   wrk->steps[dep_idx].type == BATCH);
+
+		w->xe.exec.num_syncs++;
+	}
+	w->xe.syncs = calloc(w->xe.exec.num_syncs, sizeof(*w->xe.syncs));
+	/* fill syncs */
+	i = 0;
+	/* out fence */
+	w->xe.syncs[i].handle = syncobj_create(fd, 0);
+	w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	/* in fence(s) */
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
+			   wrk->steps[dep_idx].type == BATCH);
+		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
+
+		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+	}
+	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
+}
+
 static bool set_priority(uint32_t ctx_id, int prio)
 {
 	struct drm_i915_gem_context_param param = {
@@ -1774,6 +1974,61 @@ static void measure_active_set(struct workload *wrk)
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
 
+static void xe_vm_create_(struct xe_vm *vm)
+{
+	uint32_t flags = 0;
+
+	if (vm->compute_mode)
+		flags |= DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			 DRM_XE_VM_CREATE_COMPUTE_MODE;
+
+	vm->id = xe_vm_create(fd, flags, 0);
+}
+
+static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
+{
+	struct drm_xe_exec_queue_create create = {
+		.vm_id = ctx->xe.vm->id,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&eq->hwe),
+	};
+	struct drm_xe_engine_class_instance *eci = NULL;
+
+	if (ctx->load_balance && eq->hwe.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE) {
+		struct drm_xe_engine_class_instance *hwe;
+		int i;
+
+		for (i = 0; i < ctx->engine_map_count; ++i)
+			igt_assert(ctx->engine_map[i] == VCS || ctx->engine_map[i] == VCS1 ||
+				   ctx->engine_map[i] == VCS2);
+
+		eci = calloc(16, sizeof(struct drm_xe_engine_class_instance));
+		create.num_placements = 0;
+		xe_for_each_hw_engine(fd, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
+			    hwe->gt_id != 0)
+				continue;
+
+			igt_assert(create.num_placements < 16);
+			eci[create.num_placements++] = *hwe;
+		}
+		igt_assert(create.num_placements);
+		create.instances = to_user_pointer(eci);
+
+		if (verbose > 3)
+			printf("num_placements=%d class=%d gt=%d\n", create.num_placements,
+				eq->hwe.engine_class, eq->hwe.gt_id);
+	}
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+
+	if (eci)
+		free(eci);
+
+	eq->id = create.exec_queue_id;
+}
+
 static void allocate_contexts(unsigned int id, struct workload *wrk)
 {
 	int max_ctx = -1;
@@ -1978,6 +2233,77 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 	return 0;
 }
 
+static int xe_prepare_vms_contexts_syncobjs(unsigned int id, struct workload *wrk)
+{
+	int engine_classes[NUM_ENGINES] = {};
+	struct w_step *w;
+	int i, j;
+
+	/* shortcut, create one vm */
+	wrk->xe.nr_vms = 1;
+	wrk->xe.vm_list = calloc(wrk->xe.nr_vms, sizeof(struct xe_vm));
+	wrk->xe.vm_list->compute_mode = false;
+	xe_vm_create_(wrk->xe.vm_list);
+	wrk->xe.vm_list->ahnd = intel_allocator_open(fd, wrk->xe.vm_list->id, INTEL_ALLOCATOR_RELOC);
+
+	/* create exec queues of each referenced engine class */
+	for (j = 0; j < wrk->nr_ctxs; j++) {
+		struct ctx *ctx = &wrk->ctx_list[j];
+		/* link with vm */
+		ctx->xe.vm = wrk->xe.vm_list;
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->context != j)
+				continue;
+			if (w->type == ENGINE_MAP) {
+				ctx->engine_map = w->engine_map;
+				ctx->engine_map_count = w->engine_map_count;
+			} else if (w->type == LOAD_BALANCE) {
+				if (!ctx->engine_map) {
+					wsim_err("Load balancing needs an engine map!\n");
+					return 1;
+				}
+				if (intel_gen(intel_get_drm_devid(fd)) < 11) {
+					wsim_err("Load balancing needs relative mmio support, gen11+!\n");
+					return 1;
+				}
+				ctx->load_balance = w->load_balance;
+			}
+		}
+		/* create exec queue for each referenced engine */
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->context != j)
+				continue;
+			if (w->type == BATCH)
+				engine_classes[w->engine]++;
+		}
+		for (i = 0; i < NUM_ENGINES; i++) {
+			if (engine_classes[i]) {
+				if (verbose > 3)
+					printf("%u ctx[%d] eq(%s) load_balance=%d\n",
+						id, j, ring_str_map[i], ctx->load_balance);
+				if (i == VCS) {
+					ctx->xe.queues[i].hwe.engine_class =
+						xe_get_engine(VCS1).engine_class;
+					ctx->xe.queues[i].hwe.engine_instance = 1;
+				} else
+					ctx->xe.queues[i].hwe = xe_get_engine(i);
+				xe_exec_queue_create_(ctx, &ctx->xe.queues[i]);
+			}
+			engine_classes[i] = 0;
+		}
+	}
+
+	/* create syncobjs for SW_FENCE */
+	for (j = 0, i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++)
+		if (w->type == SW_FENCE) {
+			w->xe.syncs = calloc(1, sizeof(struct drm_xe_sync));
+			w->xe.syncs[0].handle = syncobj_create(fd, 0);
+			w->xe.syncs[0].flags = DRM_XE_SYNC_SYNCOBJ;
+		}
+
+	return 0;
+}
+
 static void prepare_working_sets(unsigned int id, struct workload *wrk)
 {
 	struct working_set **sets;
@@ -2047,7 +2373,11 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 	allocate_contexts(id, wrk);
 
-	ret = prepare_contexts(id, wrk);
+	if (is_xe)
+		ret = xe_prepare_vms_contexts_syncobjs(id, wrk);
+	else
+		ret = prepare_contexts(id, wrk);
+
 	if (ret)
 		return ret;
 
@@ -2101,7 +2431,10 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		if (w->type != BATCH)
 			continue;
 
-		alloc_step_batch(wrk, w);
+		if (is_xe)
+			xe_alloc_step_batch(wrk, w);
+		else
+			alloc_step_batch(wrk, w);
 	}
 
 	measure_active_set(wrk);
@@ -2151,6 +2484,23 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
 	w_step_sync(&wrk->steps[target]);
 }
 
+static void do_xe_exec(struct workload *wrk, struct w_step *w)
+{
+	struct xe_exec_queue *eq = xe_get_eq(wrk, w);
+
+	igt_assert(w->emit_fence <= 0);
+	if (w->emit_fence == -1)
+		syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
+
+	/* update duration if random */
+	if (w->duration.max != w->duration.min)
+		xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
+					   .preempt = (w->preempt_us > 0),
+					   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe.gt_id,
+								1000LL * get_duration(wrk, w)));
+	xe_exec(fd, &w->xe.exec);
+}
+
 static void
 do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
 {
@@ -2276,6 +2626,10 @@ static void *run_workload(void *data)
 					sw_sync_timeline_create_fence(wrk->sync_timeline,
 								      cur_seqno + w->idx);
 				igt_assert(w->emit_fence > 0);
+				if (is_xe)
+					/* Convert sync file to syncobj */
+					syncobj_import_sync_file(fd, w->xe.syncs[0].handle,
+								 w->emit_fence);
 				continue;
 			} else if (w->type == SW_FENCE_SIGNAL) {
 				int tgt = w->idx + w->target;
@@ -2307,7 +2661,10 @@ static void *run_workload(void *data)
 				igt_assert(wrk->steps[t_idx].type == BATCH);
 				igt_assert(wrk->steps[t_idx].duration.unbound);
 
-				*wrk->steps[t_idx].i915.bb_duration = 0xffffffff;
+				if (is_xe)
+					xe_spin_end(&wrk->steps[t_idx].xe.data->spin);
+				else
+					*wrk->steps[t_idx].i915.bb_duration = 0xffffffff;
 				__sync_synchronize();
 				continue;
 			} else if (w->type == SSEU) {
@@ -2339,7 +2696,10 @@ static void *run_workload(void *data)
 			if (throttle > 0)
 				w_sync_to(wrk, w, i - throttle);
 
-			do_eb(wrk, w, engine);
+			if (is_xe)
+				do_xe_exec(wrk, w);
+			else
+				do_eb(wrk, w, engine);
 
 			if (w->request != -1) {
 				igt_list_del(&w->rq_link);
@@ -2383,6 +2743,10 @@ static void *run_workload(void *data)
 		for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
 		     i++, w++) {
 			if (w->emit_fence > 0) {
+				if (is_xe) {
+					igt_assert(w->type == SW_FENCE);
+					syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
+				}
 				close(w->emit_fence);
 				w->emit_fence = -1;
 			}
@@ -2397,6 +2761,23 @@ static void *run_workload(void *data)
 		w_step_sync(w);
 	}
 
+	if (is_xe) {
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->type == BATCH) {
+				w_step_sync(w);
+				syncobj_destroy(fd, w->xe.syncs[0].handle);
+				free(w->xe.syncs);
+				xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, w->xe.exec.address,
+						  w->bb_size);
+				gem_munmap(w->xe.data, w->bb_size);
+				gem_close(fd, w->bb_handle);
+			} else if (w->type == SW_FENCE) {
+				syncobj_destroy(fd, w->xe.syncs[0].handle);
+				free(w->xe.syncs);
+			}
+		}
+	}
+
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
 
 	if (wrk->print_stats) {
@@ -2416,6 +2797,23 @@ static void *run_workload(void *data)
 
 static void fini_workload(struct workload *wrk)
 {
+	if (is_xe) {
+		struct xe_exec_queue *eq;
+		struct xe_vm *vm;
+		struct ctx *ctx;
+
+		for_each_ctx(ctx, wrk)
+			for_each_xe_exec_queue(eq, ctx) {
+				xe_exec_queue_destroy(fd, eq->id);
+				eq->id = 0;
+			}
+		for_each_xe_vm(vm, wrk) {
+			put_ahnd(vm->ahnd);
+			xe_vm_destroy(fd, vm->id);
+		}
+		free(wrk->xe.vm_list);
+		wrk->xe.nr_vms = 0;
+	}
 	free(wrk->steps);
 	free(wrk);
 }
@@ -2623,8 +3021,12 @@ int main(int argc, char **argv)
 		ret = igt_device_find_first_i915_discrete_card(&card);
 		if (!ret)
 			ret = igt_device_find_integrated_card(&card);
+		if (!ret)
+			ret = igt_device_find_first_xe_discrete_card(&card);
+		if (!ret)
+			ret = igt_device_find_xe_integrated_card(&card);
 		if (!ret) {
-			wsim_err("No device filter specified and no i915 devices found!\n");
+			wsim_err("No device filter specified and no intel devices found!\n");
 			return EXIT_FAILURE;
 		}
 	}
@@ -2647,6 +3049,10 @@ int main(int argc, char **argv)
 	if (verbose > 1)
 		printf("Using device %s\n", drm_dev);
 
+	is_xe = is_xe_device(fd);
+	if (is_xe)
+		xe_device_get(fd);
+
 	if (!nr_w_args) {
 		wsim_err("No workload descriptor(s)!\n");
 		goto err;
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index d4f3dd8ae..38f305ba0 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -88,6 +88,19 @@ Batch durations can also be specified as infinite by using the '*' in the
 duration field. Such batches must be ended by the terminate command ('T')
 otherwise they will cause a GPU hang to be reported.
 
+Xe and i915 differences
+------------------------
+
+There are differences between Xe and i915, like not allowing a BO list to
+be passed to an exec (and create implicit syncs). For more details see:
+https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_exec.c
+
+Currently following batch steps are equal on Xe:
+1.1000.-2.0 <==> 1.1000.f-2.0
+and will create explicit sync fence dependency (via syncobjects).
+
+The data dependency need to wait for working sets implementation.
+
 Sync (fd) fences
 ----------------
 
@@ -131,7 +144,7 @@ runnable. When the second RCS batch completes the standalone fence is signaled
 which allows the two VCS batches to be executed. Finally we wait until the both
 VCS batches have completed before starting the (optional) next iteration.
 
-Submit fences
+Submit fences (i915 only)
 -------------
 
 Submit fences are a type of input fence which are signalled when the originating
-- 
2.42.0
