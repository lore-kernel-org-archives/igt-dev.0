Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D9610E48E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:32:37 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:35 +0000
Message-ID: <20231005185745.3056219-18-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
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

v4:
- corrected engines mappings for xe (Tvrtko)
  "M.1.VCS,B.1,1.DEFAULT.1000.0.1" should use VCS
- verified engines selection works on MTL (Tvrtko)
- prevent misuse combinations of fence and implicit data deps (Tvrtko)
  ex. "f,1.DEFAULT.1000.-1.0" should fail
      "f,1.DEFAULT.1000.f-1.0" is valid
- corrected error messages (Tvrtko)
- moved wsim_err up to be accessible from parse_dependencies
- missing xe_device_put (Tvrtko)
- left fini_workload cleanup for separate patch
- README updates

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c  | 487 +++++++++++++++++++++++++++++++++++++++--
 benchmarks/wsim/README |  23 +-
 2 files changed, 483 insertions(+), 27 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index e86519614..ecbeb9175 100644
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
@@ -185,10 +191,31 @@ struct w_step {
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
 };
 
+struct xe_vm {
+	uint32_t id;
+	bool compute_mode;
+	uint64_t ahnd;
+};
+
+struct xe_exec_queue {
+	uint32_t id;
+	unsigned int nr_hwes;
+	struct drm_xe_engine_class_instance *hwe_list;
+};
+
 struct ctx {
 	uint32_t id;
 	int priority;
@@ -198,6 +225,13 @@ struct ctx {
 	struct bond *bonds;
 	bool load_balance;
 	uint64_t sseu;
+	struct {
+		/* reference to vm */
+		struct xe_vm *vm;
+		/* exec queues */
+		unsigned int nr_queues;
+		struct xe_exec_queue *queue_list;
+	} xe;
 };
 
 struct workload {
@@ -221,6 +255,11 @@ struct workload {
 	unsigned int nr_ctxs;
 	struct ctx *ctx_list;
 
+	struct {
+		unsigned int nr_vms;
+		struct xe_vm *vm_list;
+	} xe;
+
 	struct working_set **working_sets; /* array indexed by set id */
 	int max_working_set_id;
 
@@ -246,6 +285,7 @@ static unsigned int master_prng;
 
 static int verbose = 1;
 static int fd;
+static bool is_xe;
 static struct drm_i915_gem_context_param_sseu device_sseu = {
 	.slice_mask = -1 /* Force read on first use. */
 };
@@ -266,7 +306,10 @@ static const char *ring_str_map[NUM_ENGINES] = {
 
 static void w_step_sync(struct w_step *w)
 {
-	gem_sync(fd, w->i915.obj[0].handle);
+	if (is_xe)
+		igt_assert(syncobj_wait(fd, &w->xe.syncs[0].handle, 1, INT64_MAX, 0, NULL));
+	else
+		gem_sync(fd, w->i915.obj[0].handle);
 }
 
 static int read_timestamp_frequency(int i915)
@@ -354,6 +397,19 @@ parse_working_set_deps(struct workload *wrk,
 	return 0;
 }
 
+static void __attribute__((format(printf, 1, 2)))
+wsim_err(const char *fmt, ...)
+{
+	va_list ap;
+
+	if (!verbose)
+		return;
+
+	va_start(ap, fmt);
+	vfprintf(stderr, fmt, ap);
+	va_end(ap);
+}
+
 static int
 parse_dependency(unsigned int nr_steps, struct w_step *w, char *str)
 {
@@ -374,11 +430,18 @@ parse_dependency(unsigned int nr_steps, struct w_step *w, char *str)
 
 		break;
 	case 's':
+		/* no submit fence in xe */
+		if (is_xe) {
+			wsim_err("Submit fences are not supported with xe\n");
+			return -1;
+		}
 		submit_fence = true;
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
@@ -448,19 +511,6 @@ out:
 	return ret;
 }
 
-static void __attribute__((format(printf, 1, 2)))
-wsim_err(const char *fmt, ...)
-{
-	va_list ap;
-
-	if (!verbose)
-		return;
-
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
-}
-
 #define check_arg(cond, fmt, ...) \
 { \
 	if (cond) { \
@@ -488,7 +538,17 @@ static struct intel_engine_data *query_engines(void)
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
@@ -581,6 +641,46 @@ get_engine(enum intel_engine_id engine)
 	return ci;
 }
 
+static struct drm_xe_engine_class_instance
+xe_get_engine(enum intel_engine_id engine)
+{
+	struct drm_xe_engine_class_instance hwe = {}, *hwe1;
+	bool found_physical = false;
+
+	switch (engine) {
+	case RCS:
+		hwe.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+		break;
+	case BCS:
+		hwe.engine_class = DRM_XE_ENGINE_CLASS_COPY;
+		break;
+	case VCS1:
+		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		break;
+	case VCS2:
+		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		hwe.engine_instance = 1;
+		break;
+	case VECS:
+		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		break;
+	default:
+		igt_assert(0);
+	};
+
+	xe_for_each_hw_engine(fd, hwe1) {
+		if (hwe.engine_class == hwe1->engine_class &&
+		    hwe.engine_instance  == hwe1->engine_instance) {
+			hwe = *hwe1;
+			found_physical = true;
+			break;
+		}
+	}
+
+	igt_assert(found_physical);
+	return hwe;
+}
+
 static int parse_engine_map(struct w_step *step, const char *_str)
 {
 	char *token, *tctx = NULL, *tstart = (char *)_str;
@@ -855,6 +955,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Priority step is not implemented with xe yet.\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -881,6 +987,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "S")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("SSEU step is not implemented with xe yet.\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(tmp <= 0 && nr == 0,
@@ -994,6 +1106,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "b")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Bonding is not implemented with xe yet.\n");
+					free(token);
+					return NULL;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					check_arg(nr > 2,
 						  "Invalid bond format at step %u!\n",
@@ -1028,6 +1146,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			} else if (!strcmp(field, "w") || !strcmp(field, "W")) {
 				unsigned int nr = 0;
 
+				if (is_xe) {
+					wsim_err("Working sets are not implemented with xe yet.\n");
+					free(token);
+					return NULL;
+				}
+
 				step.working_set.shared = field[0] == 'W';
 
 				while ((field = strtok_r(fstart, ".", &fctx))) {
@@ -1484,6 +1608,31 @@ get_ctxid(struct workload *wrk, struct w_step *w)
 	return wrk->ctx_list[w->context].id;
 }
 
+static struct xe_exec_queue *
+xe_get_eq(struct workload *wrk, const struct w_step *w)
+{
+	struct ctx *ctx = __get_ctx(wrk, w);
+	struct xe_exec_queue *eq;
+
+	if (ctx->engine_map) {
+		igt_assert_eq(ctx->xe.nr_queues, 1);
+		igt_assert(ctx->xe.queue_list[0].id);
+		eq = &ctx->xe.queue_list[0];
+	} else {
+		igt_assert(w->engine >= 0 && w->engine < ctx->xe.nr_queues);
+		igt_assert(ctx->xe.queue_list[w->engine].id);
+		eq = &ctx->xe.queue_list[w->engine];
+	}
+
+	return eq;
+}
+
+static struct xe_vm *
+xe_get_vm(struct workload *wrk, const struct w_step *w)
+{
+	return wrk->xe.vm_list;
+}
+
 static uint32_t alloc_bo(int i915, unsigned long size)
 {
 	return gem_create(i915, size);
@@ -1557,6 +1706,71 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
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
+	w->bb_handle = xe_bo_create_flags(fd, vm->id, PAGE_SIZE,
+				visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
+	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
+	w->xe.exec.address =
+		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, PAGE_SIZE,
+						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
+	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, PAGE_SIZE);
+	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
+				   .preempt = (w->preempt_us > 0),
+				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
+								1000LL * get_duration(wrk, w)));
+	w->xe.exec.exec_queue_id = eq->id;
+	w->xe.exec.num_batch_buffer = 1;
+	/* always at least one out fence */
+	w->xe.exec.num_syncs = 1;
+	/* count syncs */
+	for_each_dep(dep, w->data_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
+		igt_assert(wrk->steps[dep_idx].type == BATCH);
+
+		w->xe.exec.num_syncs++;
+	}
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
+	for_each_dep(dep, w->data_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
+		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+	}
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
+		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+	}
+	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
+}
+
 static bool set_priority(uint32_t ctx_id, int prio)
 {
 	struct drm_i915_gem_context_param param = {
@@ -1739,6 +1953,9 @@ static void measure_active_set(struct workload *wrk)
 
 		batch_sizes += 4096;
 
+		if (is_xe)
+			continue;
+
 		for_each_dep(dep, w->data_deps) {
 			struct dep_entry _dep = *dep;
 
@@ -1782,6 +1999,31 @@ static void measure_active_set(struct workload *wrk)
 
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
+		.num_placements = eq->nr_hwes,
+		.instances = to_user_pointer(eq->hwe_list),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+
+	eq->id = create.exec_queue_id;
+}
+
 static void allocate_contexts(unsigned int id, struct workload *wrk)
 {
 	int max_ctx = -1;
@@ -1984,6 +2226,140 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 	return 0;
 }
 
+static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
+{
+	struct xe_exec_queue *eq;
+	struct w_step *w;
+	struct ctx *ctx;
+	unsigned int i;
+
+	/* shortcut, create one vm */
+	wrk->xe.nr_vms = 1;
+	wrk->xe.vm_list = calloc(wrk->xe.nr_vms, sizeof(struct xe_vm));
+	wrk->xe.vm_list->compute_mode = false;
+	xe_vm_create_(wrk->xe.vm_list);
+	wrk->xe.vm_list->ahnd = intel_allocator_open(fd, wrk->xe.vm_list->id,
+						     INTEL_ALLOCATOR_RELOC);
+
+	for_each_ctx_ctx_idx(ctx, wrk, ctx_idx) {
+		/* link with vm */
+		ctx->xe.vm = wrk->xe.vm_list;
+		for_each_w_step(w, wrk) {
+			if (w->context != ctx_idx)
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
+
+		/* create exec queue for each referenced engine */
+		if (ctx->engine_map) {
+			ctx->xe.nr_queues = 1;
+			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
+			igt_assert(ctx->xe.queue_list);
+			eq = &ctx->xe.queue_list[ctx->xe.nr_queues - 1];
+			eq->nr_hwes = ctx->engine_map_count;
+			eq->hwe_list = calloc(eq->nr_hwes, sizeof(*eq->hwe_list));
+			for (i = 0; i < eq->nr_hwes; ++i) {
+				eq->hwe_list[i] = xe_get_engine(ctx->engine_map[i]);
+
+				/* check no mixing classes and no duplicates */
+				for (int j = 0; j < i; ++j) {
+					if (eq->hwe_list[j].engine_class !=
+					    eq->hwe_list[i].engine_class) {
+						free(eq->hwe_list);
+						eq->nr_hwes = 0;
+						wsim_err("Mixing of engine class not supported!\n");
+						return 1;
+					}
+
+					if (eq->hwe_list[j].engine_instance ==
+					    eq->hwe_list[i].engine_instance) {
+						free(eq->hwe_list);
+						eq->nr_hwes = 0;
+						wsim_err("Duplicate engine entry!\n");
+						return 1;
+					}
+				}
+
+				if (verbose > 3)
+					printf("%u ctx[%d] %s [%u:%u:%u]\n",
+						id, ctx_idx, ring_str_map[ctx->engine_map[i]],
+						eq->hwe_list[i].engine_class,
+						eq->hwe_list[i].engine_instance,
+						eq->hwe_list[i].gt_id);
+			}
+
+			xe_exec_queue_create_(ctx, eq);
+		} else {
+			int engine_classes[NUM_ENGINES] = {};
+
+			ctx->xe.nr_queues = NUM_ENGINES;
+			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
+
+			for_each_w_step(w, wrk) {
+				if (w->context != ctx_idx)
+					continue;
+				if (w->type == BATCH)
+					engine_classes[w->engine]++;
+			}
+
+			for (i = 0; i < NUM_ENGINES; i++) {
+				if (engine_classes[i]) {
+					eq = &ctx->xe.queue_list[i];
+					eq->nr_hwes = 1;
+					eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
+
+					if (i == DEFAULT) {
+						struct drm_xe_engine_class_instance *hwe;
+
+						/* select first available engine */
+						xe_for_each_hw_engine(fd, hwe) {
+							eq->hwe_list[0] = *hwe;
+							break;
+						}
+					} else if (i == VCS) {
+						eq->hwe_list[0] = xe_get_engine(VCS1);
+					} else {
+						eq->hwe_list[0] = xe_get_engine(i);
+					}
+
+					if (verbose > 3)
+						printf("%u ctx[%d] %s [%u:%u:%u]\n",
+							id, ctx_idx, ring_str_map[i],
+							eq->hwe_list[0].engine_class,
+							eq->hwe_list[0].engine_instance,
+							eq->hwe_list[0].gt_id);
+
+					xe_exec_queue_create_(ctx, eq);
+				}
+				engine_classes[i] = 0;
+			}
+		}
+	}
+
+	/* create syncobjs for SW_FENCE */
+	for_each_w_step(w, wrk)
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
@@ -2051,7 +2427,11 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 	allocate_contexts(id, wrk);
 
-	ret = prepare_contexts(id, wrk);
+	if (is_xe)
+		ret = xe_prepare_contexts(id, wrk);
+	else
+		ret = prepare_contexts(id, wrk);
+
 	if (ret)
 		return ret;
 
@@ -2104,7 +2484,10 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		if (w->type != BATCH)
 			continue;
 
-		alloc_step_batch(wrk, w);
+		if (is_xe)
+			xe_alloc_step_batch(wrk, w);
+		else
+			alloc_step_batch(wrk, w);
 	}
 
 	measure_active_set(wrk);
@@ -2154,6 +2537,24 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
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
+		xe_spin_init_opts(&w->xe.data->spin,
+				  .addr = w->xe.exec.address,
+				  .preempt = (w->preempt_us > 0),
+				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
+								1000LL * get_duration(wrk, w)));
+	xe_exec(fd, &w->xe.exec);
+}
+
 static void
 do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
 {
@@ -2280,6 +2681,10 @@ static void *run_workload(void *data)
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
@@ -2311,7 +2716,10 @@ static void *run_workload(void *data)
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
@@ -2343,7 +2751,10 @@ static void *run_workload(void *data)
 			if (throttle > 0)
 				w_sync_to(wrk, w, w->idx - throttle);
 
-			do_eb(wrk, w, engine);
+			if (is_xe)
+				do_xe_exec(wrk, w);
+			else
+				do_eb(wrk, w, engine);
 
 			if (w->request != -1) {
 				igt_list_del(&w->rq_link);
@@ -2389,6 +2800,10 @@ static void *run_workload(void *data)
 				break;
 
 			if (w->emit_fence > 0) {
+				if (is_xe) {
+					igt_assert(w->type == SW_FENCE);
+					syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
+				}
 				close(w->emit_fence);
 				w->emit_fence = -1;
 			}
@@ -2403,6 +2818,23 @@ static void *run_workload(void *data)
 		w_step_sync(w);
 	}
 
+	if (is_xe) {
+		for_each_w_step(w, wrk) {
+			if (w->type == BATCH) {
+				w_step_sync(w);
+				syncobj_destroy(fd, w->xe.syncs[0].handle);
+				free(w->xe.syncs);
+				xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, w->xe.exec.address,
+						  PAGE_SIZE);
+				gem_munmap(w->xe.data, PAGE_SIZE);
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
@@ -2629,8 +3061,12 @@ int main(int argc, char **argv)
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
@@ -2653,6 +3089,10 @@ int main(int argc, char **argv)
 	if (verbose > 1)
 		printf("Using device %s\n", drm_dev);
 
+	is_xe = is_xe_device(fd);
+	if (is_xe)
+		xe_device_get(fd);
+
 	if (!nr_w_args) {
 		wsim_err("No workload descriptor(s)!\n");
 		goto err;
@@ -2772,5 +3212,8 @@ int main(int argc, char **argv)
 out:
 	exitcode = EXIT_SUCCESS;
 err:
+	if (is_xe)
+		xe_device_put(fd);
+
 	return exitcode;
 }
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index d4f3dd8ae..e43813335 100644
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
@@ -148,7 +161,7 @@ Submit fences have the identical syntax as the sync fences with the lower-case
 Here VCS1 and VCS2 batches will only be submitted for executing once the RCS
 batch enters the GPU.
 
-Context priority
+Context priority (i915 only)
 ----------------
 
   P.1.-1
@@ -213,7 +226,7 @@ Example:
 
 This enables load balancing for context number one.
 
-Engine bonds
+Engine bonds (i915 only)
 ------------
 
 Engine bonds are extensions on load balanced contexts. They allow expressing
@@ -261,7 +274,7 @@ then look like:
   2.DEFAULT.1000.s-1.0
   a.-3
 
-Context SSEU configuration
+Context SSEU configuration (i915 only)
 --------------------------
 
   S.1.1
@@ -281,7 +294,7 @@ Slice mask of -1 has a special meaning of "all slices". Otherwise any integer
 can be specifying as the slice mask, but beware any apart from 1 and -1 can make
 the workload not portable between different GPUs.
 
-Working sets
+Working sets (i915 only)
 ------------
 
 When used plainly workload steps can create implicit data dependencies by
-- 
2.42.0
