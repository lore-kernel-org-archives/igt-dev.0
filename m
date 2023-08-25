Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C4210E69F
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 13:53:18 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:19:13 +0000
Message-Id: <20230825131913.600667-4-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230825131913.600667-1-marcin.bernatowicz@linux.intel.com>
References: <20230825131913.600667-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] [RFC] benchmarks/gem_wsim: added basic
 xe support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: joonas.lahtinen@intel.com, tvrtko.ursulin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added basic xe support with few examples.
Single binary handles both i915 and Xe devices,
but workload definitions differs between i915 and xe.
Xe does not use context abstraction, introduces new VM and Exec Queue
steps and BATCH step references exec queue.
For more details see wsim/README.
Some functionality is still missing: working sets,
load balancing (need some input if/how to do it in Xe - exec queues
width?).

The tool is handy for scheduling tests, we find it useful to verify vGPU
profiles defining different execution quantum/preemption timeout settings.

There is also some rationale for the tool in following thread:
https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/

With this patch it should be possible to run following on xe device:

gem_wsim -w benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim -c 36 -r 600

Best with drm debug logs disabled:

echo 0 > /sys/module/drm/parameters/debug

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c                         | 842 ++++++++++++++----
 benchmarks/wsim/README                        |  87 +-
 benchmarks/wsim/xe_cloud-gaming-60fps.wsim    |  25 +
 benchmarks/wsim/xe_example.wsim               |  28 +
 benchmarks/wsim/xe_example01.wsim             |  19 +
 benchmarks/wsim/xe_example_fence.wsim         |  23 +
 .../wsim/xe_media_load_balance_fhd26u7.wsim   |  63 ++
 7 files changed, 909 insertions(+), 178 deletions(-)
 create mode 100644 benchmarks/wsim/xe_cloud-gaming-60fps.wsim
 create mode 100644 benchmarks/wsim/xe_example.wsim
 create mode 100644 benchmarks/wsim/xe_example01.wsim
 create mode 100644 benchmarks/wsim/xe_example_fence.wsim
 create mode 100644 benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7b5e62a3b..a9dcb7e9f 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -42,6 +42,7 @@
 #include <limits.h>
 #include <pthread.h>
 #include <math.h>
+#include <ctype.h>
 
 #include "drm.h"
 #include "drmtest.h"
@@ -60,6 +61,12 @@
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
@@ -73,6 +80,7 @@ enum intel_engine_id {
 
 struct duration {
 	unsigned int min, max;
+	bool unbound_duration;
 };
 
 enum w_type
@@ -93,6 +101,9 @@ enum w_type
 	TERMINATE,
 	SSEU,
 	WORKINGSET,
+	VM,
+	EXEC_QUEUE,
+	SKIP,
 };
 
 struct dep_entry {
@@ -108,6 +119,10 @@ struct deps
 	struct dep_entry *list;
 };
 
+#define for_each_dep(__dep, __deps) \
+	for (int __i = 0; __i < __deps.nr && \
+	     (__dep = &__deps.list[__i]); ++__i)
+
 struct w_arg {
 	char *filename;
 	char *desc;
@@ -144,18 +159,18 @@ struct w_step
 	enum w_type type;
 	unsigned int context;
 	unsigned int engine;
+	unsigned int eq_idx;
 	struct duration duration;
-	bool unbound_duration;
 	struct deps data_deps;
 	struct deps fence_deps;
 	int emit_fence;
+
 	union {
 		int sync;
 		int delay;
 		int period;
 		int target;
 		int throttle;
-		int fence_signal;
 		int priority;
 		struct {
 			unsigned int engine_map_count;
@@ -168,21 +183,50 @@ struct w_step
 		};
 		int sseu;
 		struct working_set working_set;
+		struct vm *vm;
+		struct exec_queue *eq;
 	};
 
 	/* Implementation details */
 	unsigned int idx;
 	struct igt_list_head rq_link;
+
 	unsigned int request;
 	unsigned int preempt_us;
 
 	struct drm_i915_gem_execbuffer2 eb;
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_relocation_entry reloc[3];
+
+	struct drm_xe_exec exec;
+	size_t bb_size;
+	struct xe_spin *spin;
+	struct drm_xe_sync *syncs;
+
 	uint32_t bb_handle;
 	uint32_t *bb_duration;
 };
 
+struct vm {
+	uint32_t id;
+	bool compute_mode;
+	uint64_t ahnd;
+};
+
+struct exec_queue {
+	uint32_t id;
+	uint32_t vm_idx; /* index in workload.vm_list */
+	struct drm_xe_engine_class_instance hwe;
+	bool compute_mode; /* vm should also be in compute mode */
+	/* timeout applied when compute_mode == false*/
+	uint32_t job_timeout_ms;
+	/* todo: preempt, timeslice and other props */
+
+	/* for qd_throttle */
+	unsigned int nrequest;
+	struct igt_list_head requests;
+};
+
 struct ctx {
 	uint32_t id;
 	int priority;
@@ -218,7 +262,12 @@ struct workload
 	unsigned int nr_ctxs;
 	struct ctx *ctx_list;
 
-	struct working_set **working_sets; /* array indexed by set id */
+	unsigned int nr_vms;
+	struct vm *vm_list;
+	unsigned int nr_eqs;
+	struct exec_queue *eq_list;
+
+	struct working_set **working_sets;
 	int max_working_set_id;
 
 	int sync_timeline;
@@ -228,18 +277,49 @@ struct workload
 	unsigned int nrequest[NUM_ENGINES];
 };
 
+#define for_each_exec_queue(__eq, __wrk) \
+	for (int __i = 0; __i < (__wrk)->nr_eqs && \
+	     (__eq = &(__wrk)->eq_list[__i]); ++__i)
+
+#define for_each_vm(__vm, __wrk) \
+	for (int __i = 0; __i < (__wrk)->nr_vms && \
+	     (__vm = &(__wrk)->vm_list[__i]); ++__i)
+
 static unsigned int master_prng;
 
 static int verbose = 1;
-static int fd;
+static int fd = -1;
 static struct drm_i915_gem_context_param_sseu device_sseu = {
 	.slice_mask = -1 /* Force read on first use. */
 };
 
+static bool is_xe;
+
 #define SYNCEDCLIENTS	(1<<1)
 #define DEPSYNC		(1<<2)
 #define SSEU		(1<<3)
 
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
+#define check_arg(cond, fmt, ...) \
+{ \
+	if (cond) { \
+		wsim_err(fmt, __VA_ARGS__); \
+		return NULL; \
+	} \
+}
+
 static const char *ring_str_map[NUM_ENGINES] = {
 	[DEFAULT] = "DEFAULT",
 	[RCS] = "RCS",
@@ -250,6 +330,14 @@ static const char *ring_str_map[NUM_ENGINES] = {
 	[VECS] = "VECS",
 };
 
+static void w_sync(int fd_, struct w_step *w)
+{
+	if (is_xe)
+		igt_assert(syncobj_wait(fd_, &w->syncs[0].handle, 1, INT64_MAX, 0, NULL));
+	else
+		gem_sync(fd_, w->obj[0].handle);
+}
+
 static int read_timestamp_frequency(int i915)
 {
 	int value = 0;
@@ -351,15 +439,23 @@ parse_dependency(unsigned int nr_steps, struct w_step *w, char *str)
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
@@ -429,25 +525,120 @@ out:
 	return ret;
 }
 
-static void __attribute__((format(printf, 1, 2)))
-wsim_err(const char *fmt, ...)
+static long __duration(long dur, double scale)
 {
-	va_list ap;
+	return round(scale * dur);
+}
 
-	if (!verbose)
-		return;
+static int
+parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, char *_desc)
+{
+	char *sep = NULL;
+	long int tmpl;
 
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
+	if (_desc[0] == '*') {
+		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
+			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
+			return -1;
+		}
+		dur->unbound_duration = true;
+	} else {
+		tmpl = strtol(_desc, &sep, 10);
+		if (tmpl <= 0 || tmpl == LONG_MIN || tmpl == LONG_MAX) {
+			return -1;
+		}
+		dur->min = __duration(tmpl, scale_dur);
+
+		if (sep && *sep == '-') {
+			tmpl = strtol(sep + 1, NULL, 10);
+			if (tmpl <= 0 || __duration(tmpl, scale_dur) <= dur->min ||
+			    tmpl == LONG_MIN || tmpl == LONG_MAX) {
+				return -1;
+			}
+			dur->max = __duration(tmpl, scale_dur);
+		} else {
+			dur->max = dur->min;
+		}
+	}
+
+	return 0;
 }
 
-#define check_arg(cond, fmt, ...) \
-{ \
-	if (cond) { \
-		wsim_err(fmt, __VA_ARGS__); \
-		return NULL; \
-	} \
+/* v.compute_mode - 0 | 1 */
+static int
+parse_vm(unsigned int nr_steps, struct w_step *w, char *_desc)
+{
+	struct vm _vm = {};
+	char *field, *ctx = NULL;
+
+	/* skip v. part */
+	igt_assert(_desc && _desc[0] == 'v' && _desc[1] == '.');
+
+	if ((field = strtok_r(_desc + 2, ".", &ctx)))
+		_vm.compute_mode = (atoi(field) == 1);
+
+	w->vm = malloc(sizeof(_vm));
+	*w->vm = _vm;
+
+	return 0;
+}
+
+/* e.vm_idx.class.instance.compute_mode<0|1>.job_timeout_ms
+
+   class - int - corresponding to RCS, BCS, VCS, VECS, CCS
+   instance - int  -1 = virtual, >=0 instance id
+*/
+static int
+parse_exec_queue(unsigned int nr_steps, struct w_step *w, char *_desc)
+{
+	struct exec_queue eq = {};
+	int id;
+	char *field, *ctx = NULL;
+
+	/* skip e. part */
+	igt_assert(_desc && _desc[0] == 'e' && _desc[1] == '.');
+
+	/* vm_idx */
+	if ((field = strtok_r(_desc + 2, ".", &ctx)))
+		id = atoi(field);
+
+	if (id < 0) {
+		wsim_err("Invalid vm index at step %u!\n", nr_steps);
+		return -1;
+	}
+	eq.vm_idx = id;
+
+	/* class */
+	if ((field = strtok_r(0, ".", &ctx)))
+		id = atoi(field);
+
+	if (id < 0 || id > 255) {
+		wsim_err("Invalid engine class at step %u!\n", nr_steps);
+		return -1;
+	}
+	eq.hwe.engine_class = id;
+
+	/* instance -1 - virtual, >= 0 - instance id */
+	if ((field = strtok_r(0, ".", &ctx)))
+		id = atoi(field);
+
+	if (id < -1 || id > 255) {
+		wsim_err("Invalid engine instance at step %u!\n", nr_steps);
+		return -1;
+	}
+	eq.hwe.engine_instance = id;
+
+	if ((field = strtok_r(0, ".", &ctx)))
+		eq.compute_mode = (atoi(field) == 1);
+
+	/* 0 - default, > 0 timeout */
+	if ((field = strtok_r(0, ".", &ctx)))
+		eq.job_timeout_ms = atoi(field);
+
+	w->eq = malloc(sizeof(eq));
+	*w->eq = eq;
+
+	return 0;
 }
 
 static int str_to_engine(const char *str)
@@ -855,11 +1046,6 @@ static uint64_t engine_list_mask(const char *_str)
 static unsigned long
 allocate_working_set(struct workload *wrk, struct working_set *set);
 
-static long __duration(long dur, double scale)
-{
-	return round(scale * dur);
-}
-
 #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
 	if ((field = strtok_r(fstart, ".", &fctx))) { \
 		tmp = atoi(field); \
@@ -895,14 +1081,42 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if ((field = strtok_r(fstart, ".", &fctx))) {
 			fstart = NULL;
 
-			if (!strcmp(field, "d")) {
+			/* line starting with # is a comment */
+			if (field[0] == '#') {
+				step.type = SKIP;
+				goto add_step;
+			}
+
+			if (!strcmp(field, "v")) {
+				tmp = parse_vm(nr_steps, &step, _token);
+				check_arg(tmp < 0, "Invalid vm at step %u!\n", nr_steps);
+				step.type = VM;
+				goto add_step;
+			} else if (!strcmp(field, "e")) {
+				tmp = parse_exec_queue(nr_steps, &step, _token);
+				check_arg(tmp < 0, "Invalid exec queue at step %u!\n", nr_steps);
+				step.type = EXEC_QUEUE;
+				goto add_step;
+			} else if (!strcmp(field, "d")) {
 				int_field(DELAY, delay, tmp <= 0,
 					  "Invalid delay at step %u!\n");
 			} else if (!strcmp(field, "p")) {
-				int_field(PERIOD, period, tmp <= 0,
-					  "Invalid period at step %u!\n");
+				/* not using int_field macro to handle scale_dur */
+				if ((field = strtok_r(fstart, ".", &fctx))) {
+					tmp = atoi(field);
+					check_arg(tmp <= 0, "Invalid period at step %u!\n", nr_steps);
+					step.type = PERIOD;
+					step.period = __duration(tmp, scale_dur);
+					goto add_step;
+				}
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
+
+				if (is_xe) {
+					step.type = SKIP;
+					goto add_step;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -928,6 +1142,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid sync target at step %u!\n");
 			} else if (!strcmp(field, "S")) {
 				unsigned int nr = 0;
+				if (is_xe) {
+					step.type = SKIP;
+					goto add_step;
+				}
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(tmp <= 0 && nr == 0,
@@ -964,6 +1183,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "M")) {
 				unsigned int nr = 0;
+				if (is_xe) {
+					step.type = SKIP;
+					goto add_step;
+				}
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -996,7 +1219,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				unsigned int nr = 0;
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
-					check_arg(nr == 0 && tmp <= 0,
+					check_arg(nr == 0 && (is_xe ? tmp < 0 : tmp <= 0),
 						  "Invalid context at step %u!\n",
 						  nr_steps);
 					check_arg(nr == 1 && tmp < 0,
@@ -1018,6 +1241,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "B")) {
 				unsigned int nr = 0;
+				if (is_xe) {
+					step.type = SKIP;
+					goto add_step;
+				}
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1037,6 +1264,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "b")) {
 				unsigned int nr = 0;
+				if (is_xe) {
+					step.type = SKIP;
+					goto add_step;
+				}
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					check_arg(nr > 2,
 						  "Invalid bond format at step %u!\n",
@@ -1101,19 +1332,22 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			}
 
 			tmp = atoi(field);
-			check_arg(tmp < 0, "Invalid ctx id at step %u!\n",
+			check_arg(tmp < 0, "Invalid %s id at step %u!\n",
+				  (is_xe ? "exec queue" : "ctx"),
 				  nr_steps);
 			step.context = tmp;
+			step.eq_idx = tmp;
 
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		/* engine desc in BATCH type is i915 specific */
+		if (!is_xe && (field = strtok_r(fstart, ".", &fctx))) {
 			fstart = NULL;
 
 			i = str_to_engine(field);
 			check_arg(i < 0,
-				  "Invalid engine id at step %u!\n", nr_steps);
+				"Invalid engine id at step %u!\n", nr_steps);
 
 			valid++;
 
@@ -1121,38 +1355,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		}
 
 		if ((field = strtok_r(fstart, ".", &fctx))) {
-			char *sep = NULL;
-			long int tmpl;
-
 			fstart = NULL;
 
-			if (field[0] == '*') {
-				check_arg(intel_gen(intel_get_drm_devid(fd)) < 8,
-					  "Infinite batch at step %u needs Gen8+!\n",
-					  nr_steps);
-				step.unbound_duration = true;
-			} else {
-				tmpl = strtol(field, &sep, 10);
-				check_arg(tmpl <= 0 || tmpl == LONG_MIN ||
-					  tmpl == LONG_MAX,
-					  "Invalid duration at step %u!\n",
-					  nr_steps);
-				step.duration.min = __duration(tmpl, scale_dur);
-
-				if (sep && *sep == '-') {
-					tmpl = strtol(sep + 1, NULL, 10);
-					check_arg(tmpl <= 0 ||
-						tmpl <= step.duration.min ||
-						tmpl == LONG_MIN ||
-						tmpl == LONG_MAX,
-						"Invalid duration range at step %u!\n",
-						nr_steps);
-					step.duration.max = __duration(tmpl,
-								       scale_dur);
-				} else {
-					step.duration.max = step.duration.min;
-				}
-			}
+			tmp = parse_duration(nr_steps, &step.duration, scale_dur, field);
+			check_arg(tmp < 0,
+				  "Invalid duration at step %u!\n", nr_steps);
 
 			valid++;
 		}
@@ -1170,7 +1377,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if ((field = strtok_r(fstart, ".", &fctx))) {
 			fstart = NULL;
 
-			check_arg(strlen(field) != 1 ||
+			check_arg(!strlen(field) ||
+				  (strlen(field) > 1 && !isspace(field[1]) && field[1] != '#') ||
 				  (field[0] != '0' && field[0] != '1'),
 				  "Invalid wait boolean at step %u!\n",
 				  nr_steps);
@@ -1179,23 +1387,28 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		check_arg(valid != 5, "Invalid record at step %u!\n", nr_steps);
+		check_arg(valid != (is_xe ? 4 : 5), "Invalid record at step %u!\n", nr_steps);
 
 		step.type = BATCH;
 
 add_step:
-		if (step.type == DELAY)
-			step.delay = __duration(step.delay, scale_time);
+		if (step.type == SKIP) {
+			if (verbose > 3)
+				printf("skipped STEP: %s\n", _token);
+		} else {
+			if (step.type == DELAY)
+				step.delay = __duration(step.delay, scale_time);
 
-		step.idx = nr_steps++;
-		step.request = -1;
-		steps = realloc(steps, sizeof(step) * nr_steps);
-		igt_assert(steps);
+			step.idx = nr_steps++;
+			step.request = -1;
+			steps = realloc(steps, sizeof(step) * nr_steps);
+			igt_assert(steps);
 
-		memcpy(&steps[nr_steps - 1], &step, sizeof(step));
+			memcpy(&steps[nr_steps - 1], &step, sizeof(step));
+		}
 
 		free(token);
-	}
+	} // while ((_token = strtok_r(tstart, ",", &tctx))) {
 
 	if (app_w) {
 		steps = realloc(steps, sizeof(step) *
@@ -1211,7 +1424,7 @@ add_step:
 		nr_steps += app_w->nr_steps;
 	}
 
-	wrk = malloc(sizeof(*wrk));
+	wrk = calloc(1, sizeof(*wrk));
 	igt_assert(wrk);
 
 	wrk->nr_steps = nr_steps;
@@ -1370,6 +1583,24 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
 	return &wrk->ctx_list[w->context];
 }
 
+static struct exec_queue *
+get_eq(struct workload *wrk, const struct w_step *w)
+{
+	igt_assert(w->eq_idx < wrk->nr_eqs);
+
+	return &wrk->eq_list[w->eq_idx];
+}
+
+static struct vm *
+get_vm(struct workload *wrk, const struct w_step *w)
+{
+	uint32_t vm_idx = get_eq(wrk, w)->vm_idx;
+
+	igt_assert(vm_idx < wrk->nr_vms);
+
+	return &wrk->vm_list[vm_idx];
+}
+
 static uint32_t mmio_base(int i915, enum intel_engine_id engine, int gen)
 {
 	const char *name;
@@ -1554,7 +1785,7 @@ static uint32_t alloc_bo(int i915, unsigned long size)
 }
 
 static void
-alloc_step_batch(struct workload *wrk, struct w_step *w)
+i915_alloc_step_batch(struct workload *wrk, struct w_step *w)
 {
 	enum intel_engine_id engine = w->engine;
 	unsigned int j = 0;
@@ -1622,6 +1853,68 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 #endif
 }
 
+static void
+xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
+{
+	struct vm *vm = get_vm(wrk, w);
+	struct exec_queue *eq = get_eq(wrk, w);
+	struct dep_entry *dep;
+	int i;
+
+	w->bb_size = ALIGN(sizeof(*w->spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	w->bb_handle = xe_bo_create(fd, 0, vm->id, w->bb_size);
+	w->spin = xe_bo_map(fd, w->bb_handle, w->bb_size);
+	w->exec.address = intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
+							0, ALLOC_STRATEGY_LOW_TO_HIGH);
+	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->exec.address, w->bb_size);
+	xe_spin_init_opts(w->spin, .addr = w->exec.address,
+				   .preempt = (w->preempt_us > 0),
+				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe.gt_id,
+								1000 * get_duration(wrk, w)));
+	w->exec.exec_queue_id = eq->id;
+	w->exec.num_batch_buffer = 1;
+	/* always at least one out fence */
+	w->exec.num_syncs = 1;
+	/* count syncs */
+	igt_assert_eq(0, w->data_deps.nr);
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
+		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
+			   wrk->steps[dep_idx].type == BATCH);
+
+		w->exec.num_syncs++;
+	}
+	w->syncs = calloc(w->exec.num_syncs, sizeof(*w->syncs));
+	/* fill syncs */
+	i = 0;
+	/* out fence */
+	w->syncs[i].handle = syncobj_create(fd, 0);
+	w->syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL;
+	/* in fence(s) */
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
+			   wrk->steps[dep_idx].type == BATCH);
+		igt_assert(wrk->steps[dep_idx].syncs && wrk->steps[dep_idx].syncs[0].handle);
+
+		w->syncs[i].handle = wrk->steps[dep_idx].syncs[0].handle;
+		w->syncs[i++].flags = DRM_XE_SYNC_SYNCOBJ;
+	}
+	w->exec.syncs = to_user_pointer(w->syncs);
+}
+
+static void
+alloc_step_batch(struct workload *wrk, struct w_step *w)
+{
+	if (is_xe)
+		xe_alloc_step_batch(wrk, w);
+	else
+		i915_alloc_step_batch(wrk, w);
+}
+
 static bool set_priority(uint32_t ctx_id, int prio)
 {
 	struct drm_i915_gem_context_param param = {
@@ -1848,20 +2141,77 @@ static void measure_active_set(struct workload *wrk)
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
 
-static int prepare_workload(unsigned int id, struct workload *wrk)
+static int xe_prepare_vms_eqs(unsigned int id, struct workload *wrk)
+{
+	struct w_step *w;
+	int i, j;
+
+	/* Create vms - should be done before exec queues */
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		if (w->type != VM)
+			continue;
+		wrk->nr_vms++;
+	}
+	igt_assert(wrk->nr_vms);
+	wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
+
+	for (j = 0 /*vm_idx*/, i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		struct vm *vm_;
+
+		if (w->type != VM)
+			continue;
+		vm_ = &wrk->vm_list[j];
+		*vm_ = *w->vm;
+		vm_->id = xe_vm_create(fd, 0 /*flags*/, 0 /*ext*/);
+		vm_->ahnd = intel_allocator_open(fd, vm_->id, INTEL_ALLOCATOR_RELOC);
+		j++;
+	}
+
+	/* Create exec queues */
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		if (w->type != EXEC_QUEUE)
+			continue;
+		wrk->nr_eqs++;
+	}
+	igt_assert(wrk->nr_eqs);
+	wrk->eq_list = calloc(wrk->nr_eqs, sizeof(struct exec_queue));
+
+	for (j = 0 /*eq_idx*/, i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		struct exec_queue *eq;
+		struct vm *vm_;
+
+		if (w->type != EXEC_QUEUE)
+			continue;
+		eq = &(wrk->eq_list[j]);
+		*eq = *w->eq;
+		vm_ = get_vm(wrk, w);
+		igt_assert(vm_);
+		igt_assert(eq->hwe.engine_instance >= 0);
+		eq->id = xe_exec_queue_create(fd, vm_->id, &eq->hwe, 0 /*ext*/);
+		/* init request list */
+		IGT_INIT_LIST_HEAD(&eq->requests);
+		eq->nrequest = 0;
+		j++;
+	}
+
+	/* create syncobjs for SW_FENCE */
+	for (j = 0, i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++)
+		if (w->type == SW_FENCE) {
+			w->syncs = calloc(1, sizeof(struct drm_xe_sync));
+			w->syncs[0].handle = syncobj_create(fd, 0);
+			w->syncs[0].flags = DRM_XE_SYNC_SYNCOBJ;
+		}
+
+	return 0;
+}
+
+static int i915_prepare_ctxs(unsigned int id, struct workload *wrk)
 {
-	struct working_set **sets;
-	unsigned long total = 0;
 	uint32_t share_vm = 0;
 	int max_ctx = -1;
 	struct w_step *w;
 	int i, j;
 
-	wrk->id = id;
-	wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
-	wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
-	wrk->run = true;
-
 	/*
 	 * Pre-scan workload steps to allocate context list storage.
 	 */
@@ -2050,6 +2400,25 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 	if (share_vm)
 		vm_destroy(fd, share_vm);
 
+	return 0;
+}
+
+static int prepare_workload(unsigned int id, struct workload *wrk)
+{
+	struct w_step *w;
+	int i, j;
+
+	wrk->id = id;
+	wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->run = true;
+
+	if (is_xe) {
+		xe_prepare_vms_eqs(id, wrk);
+	} else {
+		i915_prepare_ctxs(id, wrk);
+	}
+
 	/* Record default preemption. */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == BATCH)
@@ -2070,75 +2439,89 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		for (j = i + 1; j < wrk->nr_steps; j++) {
 			w2 = &wrk->steps[j];
 
-			if (w2->context != w->context)
-				continue;
-			else if (w2->type == PREEMPTION)
-				break;
-			else if (w2->type != BATCH)
-				continue;
+			if (is_xe) {
+				if (w2->eq_idx != w->eq_idx)
+					continue;
+				else if (w2->type == PREEMPTION)
+					break;
+				else if (w2->type != BATCH)
+					continue;
+			} else {
+				if (w2->context != w->context)
+					continue;
+				else if (w2->type == PREEMPTION)
+					break;
+				else if (w2->type != BATCH)
+					continue;
+			}
 
 			w2->preempt_us = w->period;
 		}
 	}
 
-	/*
-	 * Scan for SSEU control steps.
-	 */
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == SSEU) {
-			get_device_sseu();
-			break;
+	if (!is_xe) {
+		struct working_set **sets;
+		unsigned long total = 0;
+
+		/*
+		* Scan for SSEU control steps.
+		*/
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->type == SSEU) {
+				get_device_sseu();
+				break;
+			}
 		}
-	}
 
-	/*
-	 * Allocate working sets.
-	 */
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == WORKINGSET && !w->working_set.shared)
-			total += allocate_working_set(wrk, &w->working_set);
-	}
+		/*
+		* Allocate working sets.
+		*/
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->type == WORKINGSET && !w->working_set.shared)
+				total += allocate_working_set(wrk, &w->working_set);
+		}
 
-	if (verbose > 2)
-		printf("%u: %lu bytes in working sets.\n", wrk->id, total);
+		if (verbose > 2)
+			printf("%u: %lu bytes in working sets.\n", wrk->id, total);
 
-	/*
-	 * Map of working set ids.
-	 */
-	wrk->max_working_set_id = -1;
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == WORKINGSET &&
-		    w->working_set.id > wrk->max_working_set_id)
-			wrk->max_working_set_id = w->working_set.id;
-	}
+		/*
+		* Map of working set ids.
+		*/
+		wrk->max_working_set_id = -1;
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->type == WORKINGSET &&
+			w->working_set.id > wrk->max_working_set_id)
+				wrk->max_working_set_id = w->working_set.id;
+		}
 
-	sets = wrk->working_sets;
-	wrk->working_sets = calloc(wrk->max_working_set_id + 1,
-				   sizeof(*wrk->working_sets));
-	igt_assert(wrk->working_sets);
+		sets = wrk->working_sets;
+		wrk->working_sets = calloc(wrk->max_working_set_id + 1,
+					sizeof(*wrk->working_sets));
+		igt_assert(wrk->working_sets);
 
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		struct working_set *set;
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			struct working_set *set;
 
-		if (w->type != WORKINGSET)
-			continue;
+			if (w->type != WORKINGSET)
+				continue;
 
-		if (!w->working_set.shared) {
-			set = &w->working_set;
-		} else {
-			igt_assert(sets);
+			if (!w->working_set.shared) {
+				set = &w->working_set;
+			} else {
+				igt_assert(sets);
 
-			set = sets[w->working_set.id];
-			igt_assert(set->shared);
-			igt_assert(set->sizes);
+				set = sets[w->working_set.id];
+				igt_assert(set->shared);
+				igt_assert(set->sizes);
+			}
+
+			wrk->working_sets[w->working_set.id] = set;
 		}
 
-		wrk->working_sets[w->working_set.id] = set;
+		if (sets)
+			free(sets);
 	}
 
-	if (sets)
-		free(sets);
-
 	/*
 	 * Allocate batch buffers.
 	 */
@@ -2149,7 +2532,9 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		alloc_step_batch(wrk, w);
 	}
 
-	measure_active_set(wrk);
+	if (!is_xe) {
+		measure_active_set(wrk);
+	}
 
 	return 0;
 }
@@ -2172,7 +2557,7 @@ update_bb_start(struct workload *wrk, struct w_step *w)
 
 	/* ticks is inverted for MI_DO_COMPARE (less-than comparison) */
 	ticks = 0;
-	if (!w->unbound_duration)
+	if (!w->duration.unbound_duration)
 		ticks = ~ns_to_ctx_ticks(1000 * get_duration(wrk, w));
 
 	*w->bb_duration = ticks;
@@ -2193,7 +2578,32 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
 	igt_assert(target < wrk->nr_steps);
 	igt_assert(wrk->steps[target].type == BATCH);
 
-	gem_sync(fd, wrk->steps[target].obj[0].handle);
+	w_sync(fd, &wrk->steps[target]);
+}
+
+static void do_xe_exec(struct workload *wrk, struct w_step *w)
+{
+	struct exec_queue *eq = get_eq(wrk, w);
+
+	igt_assert(w->emit_fence <= 0);
+	if (w->emit_fence == -1)
+		syncobj_reset(fd, &w->syncs[0].handle, 1);
+
+	/* update duration if random */
+	if (w->duration.max != w->duration.min)
+		xe_spin_init_opts(w->spin, .addr = w->exec.address,
+					   .preempt = (w->preempt_us > 0),
+					   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe.gt_id,
+								1000LL * get_duration(wrk, w)));
+	xe_exec(fd, &w->exec);
+
+	/* for qd_throttle */
+	if (w->rq_link.prev != NULL || w->rq_link.next != NULL) {
+		igt_list_del(&w->rq_link);
+		eq->nrequest--;
+	}
+	igt_list_add_tail(&w->rq_link, &eq->requests);
+	eq->nrequest++;
 }
 
 static void
@@ -2252,7 +2662,7 @@ static void sync_deps(struct workload *wrk, struct w_step *w)
 		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 		igt_assert(wrk->steps[dep_idx].type == BATCH);
 
-		gem_sync(fd, wrk->steps[dep_idx].obj[0].handle);
+		w_sync(fd, &wrk->steps[dep_idx]);
 	}
 }
 
@@ -2280,6 +2690,8 @@ static void *run_workload(void *data)
 			enum intel_engine_id engine = w->engine;
 			int do_sleep = 0;
 
+			igt_assert(w->type != SKIP);
+
 			if (w->type == DELAY) {
 				do_sleep = w->delay;
 			} else if (w->type == PERIOD) {
@@ -2306,7 +2718,7 @@ static void *run_workload(void *data)
 
 				igt_assert(s_idx >= 0 && s_idx < i);
 				igt_assert(wrk->steps[s_idx].type == BATCH);
-				gem_sync(fd, wrk->steps[s_idx].obj[0].handle);
+				w_sync(fd, &wrk->steps[s_idx]);
 				continue;
 			} else if (w->type == THROTTLE) {
 				throttle = w->throttle;
@@ -2320,6 +2732,9 @@ static void *run_workload(void *data)
 					sw_sync_timeline_create_fence(wrk->sync_timeline,
 								      cur_seqno + w->idx);
 				igt_assert(w->emit_fence > 0);
+				if (is_xe)
+					/* Convert sync file to syncobj */
+					syncobj_import_sync_file(fd, w->syncs[0].handle, w->emit_fence);
 				continue;
 			} else if (w->type == SW_FENCE_SIGNAL) {
 				int tgt = w->idx + w->target;
@@ -2349,9 +2764,12 @@ static void *run_workload(void *data)
 
 				igt_assert(t_idx >= 0 && t_idx < i);
 				igt_assert(wrk->steps[t_idx].type == BATCH);
-				igt_assert(wrk->steps[t_idx].unbound_duration);
+				igt_assert(wrk->steps[t_idx].duration.unbound_duration);
 
-				*wrk->steps[t_idx].bb_duration = 0xffffffff;
+				if (is_xe)
+					xe_spin_end(wrk->steps[t_idx].spin);
+				else
+					*wrk->steps[t_idx].bb_duration = 0xffffffff;
 				__sync_synchronize();
 				continue;
 			} else if (w->type == SSEU) {
@@ -2365,7 +2783,9 @@ static void *run_workload(void *data)
 				   w->type == ENGINE_MAP ||
 				   w->type == LOAD_BALANCE ||
 				   w->type == BOND ||
-				   w->type == WORKINGSET) {
+				   w->type == WORKINGSET ||
+				   w->type == VM ||
+				   w->type == EXEC_QUEUE) {
 				   /* No action for these at execution time. */
 				continue;
 			}
@@ -2383,34 +2803,54 @@ static void *run_workload(void *data)
 			if (throttle > 0)
 				w_sync_to(wrk, w, i - throttle);
 
-			do_eb(wrk, w, engine);
+			if (is_xe)
+				do_xe_exec(wrk, w);
+			else {
+				do_eb(wrk, w, engine);
 
-			if (w->request != -1) {
-				igt_list_del(&w->rq_link);
-				wrk->nrequest[w->request]--;
+				if (w->request != -1) {
+					igt_list_del(&w->rq_link);
+					wrk->nrequest[w->request]--;
+				}
+				w->request = engine;
+				igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
+				wrk->nrequest[engine]++;
 			}
-			w->request = engine;
-			igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
-			wrk->nrequest[engine]++;
 
 			if (!wrk->run)
 				break;
 
 			if (w->sync)
-				gem_sync(fd, w->obj[0].handle);
+				w_sync(fd, w);
 
 			if (qd_throttle > 0) {
-				while (wrk->nrequest[engine] > qd_throttle) {
-					struct w_step *s;
+				if (is_xe) {
+					struct exec_queue *eq = get_eq(wrk, w);
 
-					s = igt_list_first_entry(&wrk->requests[engine],
-								 s, rq_link);
+					while (eq->nrequest > qd_throttle) {
+						struct w_step *s;
 
-					gem_sync(fd, s->obj[0].handle);
+						s = igt_list_first_entry(&eq->requests, s, rq_link);
 
-					s->request = -1;
-					igt_list_del(&s->rq_link);
-					wrk->nrequest[engine]--;
+						w_sync(fd, s);
+
+						igt_list_del(&s->rq_link);
+						eq->nrequest--;
+					}
+				} else {
+					while (wrk->nrequest[engine] > qd_throttle) {
+						struct w_step *s;
+
+						s = igt_list_first_entry(&wrk->requests[engine],
+									s, rq_link);
+
+						w_sync(fd, s);
+						// gem_sync(fd, s->obj[0].handle);
+
+						s->request = -1;
+						igt_list_del(&s->rq_link);
+						wrk->nrequest[engine]--;
+					}
 				}
 			}
 		}
@@ -2427,18 +2867,51 @@ static void *run_workload(void *data)
 		for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
 		     i++, w++) {
 			if (w->emit_fence > 0) {
-				close(w->emit_fence);
-				w->emit_fence = -1;
+				if (is_xe) {
+					igt_assert(w->type == SW_FENCE);
+					close(w->emit_fence);
+					w->emit_fence = -1;
+					syncobj_reset(fd, &w->syncs[0].handle, 1);
+				} else {
+					close(w->emit_fence);
+					w->emit_fence = -1;
+				}
 			}
 		}
-	}
+	} // main loop
 
-	for (i = 0; i < NUM_ENGINES; i++) {
-		if (!wrk->nrequest[i])
-			continue;
+	if (is_xe) {
+		struct exec_queue *eq;
 
-		w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
-		gem_sync(fd, w->obj[0].handle);
+		for_each_exec_queue(eq, wrk) {
+			if (eq->nrequest) {
+				w = igt_list_last_entry(&eq->requests, w, rq_link);
+				w_sync(fd, w);
+			}
+		}
+
+		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+			if (w->type == BATCH) {
+				w_sync(fd, w);
+				syncobj_destroy(fd, w->syncs[0].handle);
+				free(w->syncs);
+				xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0, w->exec.address, w->bb_size);
+				gem_munmap(w->spin, w->bb_size);
+				gem_close(fd, w->bb_handle);
+			} else if (w->type == SW_FENCE) {
+				syncobj_destroy(fd, w->syncs[0].handle);
+				free(w->syncs);
+			}
+		}
+	}
+	else {
+		for (i = 0; i < NUM_ENGINES; i++) {
+			if (!wrk->nrequest[i])
+				continue;
+
+			w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
+			w_sync(fd, w);
+		}
 	}
 
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
@@ -2460,6 +2933,21 @@ static void *run_workload(void *data)
 
 static void fini_workload(struct workload *wrk)
 {
+	if (is_xe) {
+		struct exec_queue *eq;
+		struct vm *vm_;
+
+		for_each_exec_queue(eq, wrk)
+			xe_exec_queue_destroy(fd, eq->id);
+		free(wrk->eq_list);
+		wrk->nr_eqs = 0;
+		for_each_vm(vm_, wrk) {
+			put_ahnd(vm_->ahnd);
+			xe_vm_destroy(fd, vm_->id);
+		}
+		free(wrk->vm_list);
+		wrk->nr_vms = 0;
+	}
 	free(wrk->steps);
 	free(wrk);
 }
@@ -2519,6 +3007,13 @@ static char *load_workload_descriptor(char *filename)
 	close(infd);
 
 	for (i = 0; i < len; i++) {
+		/* '#' starts comment till end of line */
+		if (buf[i] == '#')
+			/* replace ',' in comments to not break parsing */
+			while (++i < len && buf[i] != '\n')
+				if (buf[i] == ',')
+					buf[i] = ';';
+
 		if (buf[i] == '\n')
 			buf[i] = ',';
 	}
@@ -2562,7 +3057,7 @@ int main(int argc, char **argv)
 	int prio = 0;
 	double t;
 	int i, c, ret;
-	char *drm_dev;
+	char *drm_dev = NULL;
 
 	master_prng = time(NULL);
 
@@ -2660,8 +3155,12 @@ int main(int argc, char **argv)
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
@@ -2676,6 +3175,7 @@ int main(int argc, char **argv)
 	}
 
 	fd = open(drm_dev, O_RDWR);
+
 	if (fd < 0) {
 		wsim_err("Failed to open '%s'! (%s)\n",
 			 drm_dev, strerror(errno));
@@ -2684,6 +3184,10 @@ int main(int argc, char **argv)
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
index 8c71f2fe6..ddfefff47 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -1,6 +1,9 @@
 Workload descriptor format
 ==========================
 
+Lines starting with '#' are treated as comments (do not create work step).
+
+# i915
 ctx.engine.duration_us.dependency.wait,...
 <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
 B.<uint>
@@ -11,6 +14,23 @@ b.<uint>.<str>[|<str>].<str>
 w|W.<uint>.<str>[/<str>]...
 f
 
+# xe
+Xe does not use context abstraction and adds additional work step types
+for VM (v.) and exec queue (e.) creation.
+Each v. and e. step creates array entry (in workload's VM and Exec Queue arrays).
+Batch step references the exec queue on which it is to be executed.
+Exec queue reference (eq_idx) is the index (0-based) in workload's exec queue array.
+VM reference (vm_idx) is the index (0-based) in workload's VM array.
+
+v.compute_mode
+v.<0|1>
+e.vm_idx.class.instance.compute_mode.job_timeout_ms,...
+e.<uint>.<uint 0=RCS,1=BCS,2=VCS,3=VECS,4=CCS>.<int>.<0|1>.<uint>,...
+eq_idx.duration_us.dependency.wait,...
+<uint>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
+d|p|s|t|q|a|T.<int>,...
+f
+
 For duration a range can be given from which a random value will be picked
 before every submit. Since this and seqno management requires CPU access to
 objects, care needs to be taken in order to ensure the submit queue is deep
@@ -27,21 +47,22 @@ Additional workload steps are also supported:
  'q' - Throttle to n max queue depth.
  'f' - Create a sync fence.
  'a' - Advance the previously created sync fence.
- 'B' - Turn on context load balancing.
- 'b' - Set up engine bonds.
- 'M' - Set up engine map.
- 'P' - Context priority.
- 'S' - Context SSEU configuration.
+ 'B' - Turn on context load balancing. (i915 only)
+ 'b' - Set up engine bonds. (i915 only)
+ 'M' - Set up engine map. (i915 only)
+ 'P' - Context priority. (i915 only)
+ 'S' - Context SSEU configuration. (i915 only)
  'T' - Terminate an infinite batch.
- 'w' - Working set. (See Working sets section.)
- 'W' - Shared working set.
- 'X' - Context preemption control.
+ 'w' - Working set. (See Working sets section.) (i915 only)
+ 'W' - Shared working set. (i915 only)
+ 'X' - Context preemption control. (i915 only)
 
 Engine ids: DEFAULT, RCS, BCS, VCS, VCS1, VCS2, VECS
 
 Example (leading spaces must not be present in the actual file):
 ----------------------------------------------------------------
 
+# i915
   1.VCS1.3000.0.1
   1.RCS.500-1000.-1.0
   1.RCS.3700.0.0
@@ -51,6 +72,25 @@ Example (leading spaces must not be present in the actual file):
   1.VCS2.600.-1.1
   p.16000
 
+# xe equivalent
+  #VM: v.compute_mode
+  v.0
+  #EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
+  e.0.2.0.0.0 # VCS1
+  e.0.0.0.0.0 # RCS
+  e.0.2.1.0.0 # VCS2
+  e.0.0.0.0.0 # second RCS exec queue
+  #BATCH: eq_idx.duration.dependency.wait
+  0.3000.0.1       # 1.VCS1.3000.0.1
+  1.500-1000.-1.0  # 1.RCS.500-1000.-1.0
+  3.3700.0.0       # 1.RCS.3700.0.0
+  1.1000.-2.1      # 1.RCS.1000.-2.0
+  2.2300.-2.0      # 1.VCS2.2300.-2.0
+  3.4700.-1.0      # 1.RCS.4700.-1.0
+  2.600.-1.1       # 1.VCS2.600.-1.1
+  p.16000
+
+
 The above workload described in human language works like this:
 
   1.   A batch is sent to the VCS1 engine which will be executing for 3ms on the
@@ -76,16 +116,30 @@ Multiple dependencies can be given separated by forward slashes.
 
 Example:
 
+# i915
   1.VCS1.3000.0.1
   1.RCS.3700.0.0
   1.VCS2.2300.-1/-2.0
 
+# xe
+  v.0
+  e.0.2.0.0.0
+  e.0.0.0.0.0
+  e.0.2.1.0.0.0
+  0.3000.0.1
+  1.3700.0.0
+  2.2300.-1/-2.0
+
 I this case the last step has a data dependency on both first and second steps.
 
 Batch durations can also be specified as infinite by using the '*' in the
 duration field. Such batches must be ended by the terminate command ('T')
 otherwise they will cause a GPU hang to be reported.
 
+Note: On Xe Batch dependencies are expressed with syncobjects,
+so there is no difference between f-1 and -1
+ex. 1.1000.-2.0 is same as 1.1000.f-2.0.
+
 Sync (fd) fences
 ----------------
 
@@ -114,6 +168,7 @@ VCS1 and VCS2 batches will have a sync fence dependency on the RCS batch.
 
 Example:
 
+# i915
   1.RCS.500-1000.0.0
   f
   2.VCS1.3000.f-1.0
@@ -123,13 +178,27 @@ Example:
   s.-4
   s.-4
 
+# xe equivalent
+  v.0
+  e.0.0.0.0.0    # RCS
+  e.0.2.0.0.0    # VCS1
+  e.0.2.1.0.0    # VCS2
+  0.500-1000.0.0
+  f
+  1.3000.f-1.0
+  2.3000.f-2.0
+  0.500-1000.0.1
+  a.-4
+  s.-4
+  s.-4
+
 VCS1 and VCS2 batches have an input sync fence dependecy on the standalone fence
 created at the second step. They are submitted ahead of time while still not
 runnable. When the second RCS batch completes the standalone fence is signaled
 which allows the two VCS batches to be executed. Finally we wait until the both
 VCS batches have completed before starting the (optional) next iteration.
 
-Submit fences
+Submit fences (i915 only?)
 -------------
 
 Submit fences are a type of input fence which are signalled when the originating
diff --git a/benchmarks/wsim/xe_cloud-gaming-60fps.wsim b/benchmarks/wsim/xe_cloud-gaming-60fps.wsim
new file mode 100644
index 000000000..9fdf15e27
--- /dev/null
+++ b/benchmarks/wsim/xe_cloud-gaming-60fps.wsim
@@ -0,0 +1,25 @@
+#w.1.10n8m
+#w.2.3n16m
+#1.RCS.500-1500.r1-0-4/w2-0.0
+#1.RCS.500-1500.r1-5-9/w2-1.0
+#1.RCS.500-1500.r2-0-1/w2-2.0
+#M.2.VCS
+#B.2
+#3.RCS.500-1500.r2-2.0
+#2.DEFAULT.2000-4000.-1.0
+#4.VCS1.250-750.-1.1
+#p.16667
+#
+#xe
+v.0
+e.0.0.0.0.0 # 1.RCS.500-1500.r1-0-4/w2-0.0
+e.0.2.0.0.0 # 2.DEFAULT.2000-4000.-1.0
+e.0.0.0.0.0 # 3.RCS.500-1500.r2-2.0
+e.0.2.1.0.0 # 4.VCS1.250-750.-1.1
+0.500-1500.0.0
+0.500-1500.0.0
+0.500-1500.0.0
+2.500-1500.-2.0 # #3.RCS.500-1500.r2-2.0
+1.2000-4000.-1.0
+3.250-750.-1.1
+p.16667
diff --git a/benchmarks/wsim/xe_example.wsim b/benchmarks/wsim/xe_example.wsim
new file mode 100644
index 000000000..3fa620932
--- /dev/null
+++ b/benchmarks/wsim/xe_example.wsim
@@ -0,0 +1,28 @@
+#i915
+#1.VCS1.3000.0.1
+#1.RCS.500-1000.-1.0
+#1.RCS.3700.0.0
+#1.RCS.1000.-2.0
+#1.VCS2.2300.-2.0
+#1.RCS.4700.-1.0
+#1.VCS2.600.-1.1
+#p.16000
+#
+#xe
+#
+#VM: v.compute_mode
+v.0
+#EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
+e.0.2.0.0.0 # VCS1
+e.0.0.0.0.0 # RCS
+e.0.2.1.0.0 # VCS2
+e.0.0.0.0.0 # second RCS exec_queue
+#BATCH: eq_idx.duration.dependency.wait
+0.3000.0.1       # 1.VCS1.3000.0.1
+1.500-1000.-1.0  # 1.RCS.500-1000.-1.0
+3.3700.0.0       # 1.RCS.3700.0.0
+1.1000.-2.1      # 1.RCS.1000.-2.0
+2.2300.-2.0      # 1.VCS2.2300.-2.0
+3.4700.-1.0      # 1.RCS.4700.-1.0
+2.600.-1.1       # 1.VCS2.600.-1.1
+p.16000
diff --git a/benchmarks/wsim/xe_example01.wsim b/benchmarks/wsim/xe_example01.wsim
new file mode 100644
index 000000000..496905371
--- /dev/null
+++ b/benchmarks/wsim/xe_example01.wsim
@@ -0,0 +1,19 @@
+#VM: v.compute_mode
+v.0
+#EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
+e.0.0.0.0.0
+e.0.2.0.0.0
+e.0.1.0.0.0
+#BATCH: eq_idx.duration.dependency.wait
+# B1 - 10ms batch on BCS0
+2.10000.0.0
+# B2 - 10ms batch on RCS0; waits on B1
+0.10000.0.0
+# B3 - 10ms batch on VECS0; waits on B2
+1.10000.0.0
+# B4 - 10ms batch on BCS0
+2.10000.0.0
+# B5 - 10ms batch on RCS0; waits on B4
+0.10000.-1.0
+# B6 - 10ms batch on VECS0; waits on B5; wait on batch fence out
+1.10000.-1.1
diff --git a/benchmarks/wsim/xe_example_fence.wsim b/benchmarks/wsim/xe_example_fence.wsim
new file mode 100644
index 000000000..4f810d64e
--- /dev/null
+++ b/benchmarks/wsim/xe_example_fence.wsim
@@ -0,0 +1,23 @@
+#i915
+#1.RCS.500-1000.0.0
+#f
+#2.VCS1.3000.f-1.0
+#2.VCS2.3000.f-2.0
+#1.RCS.500-1000.0.1
+#a.-4
+#s.-4
+#s.-4
+#
+#xe
+v.0
+e.0.0.0.0.0
+e.0.2.0.0.0
+e.0.2.1.0.0
+0.500-1000.0.0
+f
+1.3000.f-1.0
+2.3000.f-2.0
+0.500-1000.0.1
+a.-4
+s.-4
+s.-4
diff --git a/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim b/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim
new file mode 100644
index 000000000..2214914eb
--- /dev/null
+++ b/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim
@@ -0,0 +1,63 @@
+# https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/
+#i915
+#M.3.VCS
+#B.3
+#1.VCS1.1200-1800.0.0
+#1.VCS1.1900-2100.0.0
+#2.RCS.1500-2000.-1.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.1500-2000.-1.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.200-400.-1.0
+#2.RCS.1500-2000.0.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.1500-2000.-1.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.200-400.-1.0
+#2.RCS.1500-2000.0.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.1500-2000.-1.0
+#3.VCS.1400-1800.-1.1
+#1.VCS1.1900-2100.-1.0
+#2.RCS.1500-2000.-1.0
+#2.RCS.1500-2000.0.0
+#3.VCS.1400-1800.-1.1
+#
+#xe
+#
+#M.3.VCS ??
+#B.3     ??
+v.0
+e.0.2.0.0.0 # 1.VCS1
+e.0.0.0.0.0 # 2.RCS
+e.0.2.1.0.0 # 3.VCS - no load balancing yet always VCS2
+0.1200-1800.0.0
+0.1900-2100.0.0
+1.1500-2000.-1.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.1500-2000.-1.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.200-400.-1.0
+1.1500-2000.0.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.1500-2000.-1.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.200-400.-1.0
+1.1500-2000.0.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.1500-2000.-1.0
+2.1400-1800.-1.1
+0.1900-2100.-1.0
+1.1500-2000.-1.0
+1.1500-2000.0.0
+2.1400-1800.-1.1
-- 
2.30.2
