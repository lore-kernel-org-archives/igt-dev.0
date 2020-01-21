Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D1F6EC9C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 15:05:37 +0000 (UTC)
From: Anna Karas <anna.karas@intel.com>
Date: Tue, 21 Jan 2020 17:04:00 +0200
Message-Id: <20200121150400.15207-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
References: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] Distinguish particular engines during
 calculating nop calibration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Extend handling -n parameter by accepting multiple values of per
engine nop calibration. Add raw numbers handling to set default
calibration values. Print copyable and pastable string with
calibrations. Allow to switch between calculating in parallel
or doing it sequentially.

Accepted input values:
-n 123456
All calibrations will be set to 123456.

-n ENG=value,ENG2=value2,value3
i.e.
-n RCS=123456,BCS=345678,999999
RCS engine's value is set to 123456, BCS engine's value is set to
345678, 999999 is copied to rest of engines. All engines must be set;
you can either provide values for each of the engines, or you can set
specific values and provide a default value for the others.

-n value,ENG1=value1,ENG2=value2
First, value is copied to all engines, then value1 overrides ENG1, and
finally value2 overrides ENG2.

New output follows the pattern:
Nop calibrations for 1000us delay is: <eng1>=<v1>,<eng2>=<v2>,...
So you can easily copy-paste it to the next invocation.

Switching between calculation modes:
Run program with -T parameter to calculate calibrations in parallel.
The calculations are performed sequentially by default.

v2: Get rid of trailing whitespaces. Skip DEFAULT and VCS engines
when printing out calibrations. Reject them in the string passed
to -n. Re-align rest of help text. Fix accepting unknown engines.

Signed-off-by: Anna Karas <anna.karas@intel.com>
---
 benchmarks/gem_wsim.c | 293 +++++++++++++++++++++++++++++++++---------
 1 file changed, 235 insertions(+), 58 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 9156fdc9..ae5d5670 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -23,6 +23,7 @@
  */
 
 #include <unistd.h>
+#include <stdbool.h>
 #include <stdlib.h>
 #include <stdint.h>
 #include <stdio.h>
@@ -55,6 +56,7 @@
 #include "i915/gem_mman.h"
 
 #include "ewma.h"
+#include "i915/gem_engine_topology.h"
 
 enum intel_engine_id {
 	DEFAULT,
@@ -240,7 +242,8 @@ struct workload
 
 struct intel_mmio_data mmio_data;
 static const unsigned int nop_calibration_us = 1000;
-static unsigned long nop_calibration;
+static bool has_nop_calibration = false;
+static bool sequential = true;
 
 static unsigned int master_prng;
 
@@ -281,6 +284,55 @@ static const char *ring_str_map[NUM_ENGINES] = {
 	[VECS] = "VECS",
 };
 
+/* stores calibrations for particular engines */
+static unsigned long engine_calib_map[NUM_ENGINES];
+
+static enum intel_engine_id
+ci_to_engine_id(int class, int instance)
+{
+	static const struct {
+		int class;
+		int instance;
+		unsigned int id;
+	} map[] = {
+		{ I915_ENGINE_CLASS_RENDER, 0, RCS },
+		{ I915_ENGINE_CLASS_COPY, 0, BCS },
+		{ I915_ENGINE_CLASS_VIDEO, 0, VCS1 },
+		{ I915_ENGINE_CLASS_VIDEO, 1, VCS2 },
+		{ I915_ENGINE_CLASS_VIDEO, 2, VCS2 }, /* FIXME/ICL */
+		{ I915_ENGINE_CLASS_VIDEO_ENHANCE, 0, VECS },
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(map); i++) {
+		if (class == map[i].class && instance == map[i].instance)
+			return map[i].id;
+	}
+	return -1;
+}
+
+static void
+apply_unset_calibrations(unsigned long raw_number)
+{
+	for (int i = 0; i < NUM_ENGINES; i++)
+		engine_calib_map[i] += engine_calib_map[i] ? 0 : raw_number;
+
+	has_nop_calibration = true;
+}
+
+static void
+print_engines_calibrations(void)
+{
+	printf("Nop calibrations for %uus delay is: ", nop_calibration_us);
+
+	/* skip DEFAULT and VCS engines */
+	for (int i = 1; i < NUM_ENGINES; i++) {
+		if (i != 3) printf("%s%s=%lu", i - 1 > 0 ? "," : "", ring_str_map[i], engine_calib_map[i]);
+	}
+	printf("\n");
+}
+
 static int
 parse_dependencies(unsigned int nr_steps, struct w_step *w, char *_desc)
 {
@@ -1082,17 +1134,17 @@ static unsigned int get_duration(struct workload *wrk, struct w_step *w)
 		       (dur->max + 1 - dur->min);
 }
 
-static unsigned long get_bb_sz(unsigned int duration)
+static unsigned long get_bb_sz(unsigned int duration, enum intel_engine_id engine)
 {
-	return ALIGN(duration * nop_calibration * sizeof(uint32_t) /
-		     nop_calibration_us, sizeof(uint32_t));
+	return ALIGN(duration * engine_calib_map[engine] * sizeof(uint32_t) /
+		nop_calibration_us, sizeof(uint32_t));
 }
 
 static void
 init_bb(struct w_step *w, unsigned int flags)
 {
 	const unsigned int arb_period =
-			get_bb_sz(w->preempt_us) / sizeof(uint32_t);
+			get_bb_sz(w->preempt_us, w->engine) / sizeof(uint32_t);
 	const unsigned int mmap_len = ALIGN(w->bb_sz, 4096);
 	unsigned int i;
 	uint32_t *ptr;
@@ -1319,10 +1371,11 @@ alloc_step_batch(struct workload *wrk, struct w_step *w, unsigned int flags)
 
 	if (w->unbound_duration)
 		/* nops + MI_ARB_CHK + MI_BATCH_BUFFER_START */
-		w->bb_sz = max(PAGE_SIZE, get_bb_sz(w->preempt_us)) +
+		w->bb_sz = max(PAGE_SIZE, get_bb_sz(w->preempt_us, w->engine)) +
 			   (1 + 3) * sizeof(uint32_t);
 	else
-		w->bb_sz = get_bb_sz(w->duration.max);
+		w->bb_sz = get_bb_sz(w->duration.max, w->engine);
+
 	w->bb_handle = w->obj[j].handle = gem_create(fd, w->bb_sz + (w->unbound_duration ? 4096 : 0));
 	init_bb(w, flags);
 	w->obj[j].relocation_count = terminate_bb(w, flags);
@@ -2622,7 +2675,7 @@ do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine,
 	w->eb.batch_start_offset =
 		w->unbound_duration ?
 		0 :
-		ALIGN(w->bb_sz - get_bb_sz(get_duration(wrk, w)),
+		ALIGN(w->bb_sz - get_bb_sz(get_duration(wrk, w), w->engine),
 		      2 * sizeof(uint32_t));
 
 	for (i = 0; i < w->fence_deps.nr; i++) {
@@ -2899,15 +2952,18 @@ static void fini_workload(struct workload *wrk)
 	free(wrk);
 }
 
-static unsigned long calibrate_nop(unsigned int tolerance_pct)
+static unsigned long calibrate_nop(unsigned int tolerance_pct, struct intel_execution_engine2 *engine)
 {
 	const uint32_t bbe = 0xa << 23;
 	unsigned int loops = 17;
 	unsigned int usecs = nop_calibration_us;
 	struct drm_i915_gem_exec_object2 obj = {};
-	struct drm_i915_gem_execbuffer2 eb =
-		{ .buffer_count = 1, .buffers_ptr = (uintptr_t)&obj};
-	long size, last_size;
+	struct drm_i915_gem_execbuffer2 eb = {
+		.buffer_count = 1,
+		.buffers_ptr = (uintptr_t)&obj,
+		.flags = engine->flags
+	};
+	unsigned long size, last_size;
 	struct timespec t_0, t_end;
 
 	clock_gettime(CLOCK_MONOTONIC, &t_0);
@@ -2939,6 +2995,77 @@ static unsigned long calibrate_nop(unsigned int tolerance_pct)
 	return size / sizeof(uint32_t);
 }
 
+static void
+calibrate_sequentially(void)
+{
+	struct intel_execution_engine2 *engine;
+	enum intel_engine_id eng_id;
+
+	__for_each_physical_engine(fd, engine) {
+		eng_id = ci_to_engine_id(engine->class, engine->instance);
+		igt_assert(eng_id >= 0);
+		engine_calib_map[eng_id] = calibrate_nop(fd, engine);
+	}
+}
+
+struct thread_data {
+	struct intel_execution_engine2 *eng;
+	pthread_t thr;
+	unsigned long calib;
+};
+
+static void *
+engine_calibration_thread(void *data)
+{
+	struct thread_data *thr_d = (struct thread_data *) data;
+
+	thr_d->calib = calibrate_nop(fd, thr_d->eng);
+	return NULL;
+}
+
+static void
+calibrate_in_parallel(void)
+{
+	struct thread_data *thr_d = malloc(NUM_ENGINES * sizeof(*thr_d));
+	struct intel_execution_engine2 *engine;
+	enum intel_engine_id id;
+	int ret;
+
+	__for_each_physical_engine(fd, engine) {
+		id = ci_to_engine_id(engine->class, engine->instance);
+		thr_d[id].eng = engine;
+		ret = pthread_create(&thr_d[id].thr, NULL, engine_calibration_thread, &thr_d[id]);
+		igt_assert_eq(ret, 0);
+	}
+
+	__for_each_physical_engine(fd, engine) {
+		id = ci_to_engine_id(engine->class, engine->instance);
+		igt_assert(id >= 0);
+
+		ret = pthread_join(thr_d[id].thr, NULL);
+		igt_assert_eq(ret, 0);
+		engine_calib_map[id] = thr_d[id].calib;
+	}
+
+	free(thr_d);
+}
+
+static void
+calibrate_engines(void)
+{
+	if (sequential)
+		calibrate_sequentially();
+	else
+		calibrate_in_parallel();
+
+	has_nop_calibration = true;
+
+	if (verbose > 1)
+		print_engines_calibrations();
+
+}
+
+
 static void print_help(void)
 {
 	unsigned int i;
@@ -2951,50 +3078,53 @@ static void print_help(void)
 "be provided when running the simulation in subsequent invocations.\n"
 "\n"
 "Options:\n"
-"  -h              This text.\n"
-"  -q              Be quiet - do not output anything to stdout.\n"
-"  -n <n>          Nop calibration value.\n"
-"  -t <n>          Nop calibration tolerance percentage.\n"
-"                  Use when there is a difficulty obtaining calibration with the\n"
-"                  default settings.\n"
-"  -I <n>          Initial randomness seed.\n"
-"  -p <n>          Context priority to use for the following workload on the\n"
-"                  command line.\n"
-"  -w <desc|path>  Filename or a workload descriptor.\n"
-"                  Can be given multiple times.\n"
-"  -W <desc|path>  Filename or a master workload descriptor.\n"
-"                  Only one master workload can be optinally specified in which\n"
-"                  case all other workloads become background ones and run as\n"
-"                  long as the master.\n"
-"  -a <desc|path>  Append a workload to all other workloads.\n"
-"  -r <n>          How many times to emit the workload.\n"
-"  -c <n>          Fork N clients emitting the workload simultaneously.\n"
-"  -x              Swap VCS1 and VCS2 engines in every other client.\n"
-"  -b <n>          Load balancing to use.\n"
-"                  Available load balancers are:"
+"  -h                This text.\n"
+"  -q                Be quiet - do not output anything to stdout.\n"
+"  -n <n |           Nop calibration value - single value is set to all engines\n"
+"  e1=v1,e2=v2,n...> without specified value; you can also specify calibrations for\n"
+"                    particular engines.\n"
+"  -t <n>            Nop calibration tolerance percentage.\n"
+"  -T                Disable sequential calibration and perform calibration in parallel.\n"
+"                    Use when there is a difficulty obtaining calibration with the\n"
+"                    default settings.\n"
+"  -I <n>            Initial randomness seed.\n"
+"  -p <n>            Context priority to use for the following workload on the\n"
+"                    command line.\n"
+"  -w <desc|path>    Filename or a workload descriptor.\n"
+"                    Can be given multiple times.\n"
+"  -W <desc|path>    Filename or a master workload descriptor.\n"
+"                    Only one master workload can be optinally specified in which\n"
+"                    case all other workloads become background ones and run as\n"
+"                    long as the master.\n"
+"  -a <desc|path>    Append a workload to all other workloads.\n"
+"  -r <n>            How many times to emit the workload.\n"
+"  -c <n>            Fork N clients emitting the workload simultaneously.\n"
+"  -x                Swap VCS1 and VCS2 engines in every other client.\n"
+"  -b <n>            Load balancing to use.\n"
+"                    Available load balancers are:"
 	);
 
 	for (i = 0; i < ARRAY_SIZE(all_balancers); i++) {
 		igt_assert(all_balancers[i].desc);
 		printf(
-"                     %s (%u): %s\n",
+"                       %s (%u): %s\n",
 		       all_balancers[i].name, all_balancers[i].id,
 		       all_balancers[i].desc);
 	}
 	puts(
-"                  Balancers can be specified either as names or as their id\n"
-"                  number as listed above.\n"
-"  -2              Remap VCS2 to BCS.\n"
-"  -R              Round-robin initial VCS assignment per client.\n"
-"  -H              Send heartbeat on synchronisation points with seqno based\n"
-"                  balancers. Gives better engine busyness view in some cases.\n"
-"  -s              Turn on small SSEU config for the next workload on the\n"
-"                  command line. Subsequent -s switches it off.\n"
-"  -S              Synchronize the sequence of random batch durations between\n"
-"                  clients.\n"
-"  -G              Global load balancing - a single load balancer will be shared\n"
-"                  between all clients and there will be a single seqno domain.\n"
-"  -d              Sync between data dependencies in userspace."
+"                     Balancers can be specified either as names or as their id\n"
+"                     number as listed above.\n"
+"  -2                 Remap VCS2 to BCS.\n"
+"  -R                 Round-robin initial VCS assignment per client.\n"
+"  -H                 Send heartbeat on synchronisation points with seqno based\n"
+"                     balancers. Gives better engine busyness view in some cases.\n"
+"  -s                 Turn on small SSEU config for the next workload on the\n"
+"                     command line. Subsequent -s switches it off.\n"
+"  -S                 Synchronize the sequence of random batch durations between\n"
+"                     clients.\n"
+"  -G                 Global load balancing - a single load balancer will be shared\n"
+"                     between all clients and there will be a single seqno domain.\n"
+"  -d                 Sync between data dependencies in userspace."
 	);
 }
 
@@ -3117,6 +3247,10 @@ int main(int argc, char **argv)
 	int prio = 0;
 	double t;
 	int i, c;
+	char *subopts, *value;
+	enum intel_engine_id eng;
+	int raw_number = 0;
+	long calib_val;
 
 	/*
 	 * Open the device via the low-level API so we can do the GPU quiesce
@@ -3134,7 +3268,7 @@ int main(int argc, char **argv)
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   "hqv2RsSHxGdc:n:r:w:W:a:t:b:p:I:")) != -1) {
+			   "Thqv2RsSHxGdc:n:r:w:W:a:t:b:p:I:")) != -1) {
 		switch (c) {
 		case 'W':
 			if (master_workload >= 0) {
@@ -3163,8 +3297,53 @@ int main(int argc, char **argv)
 		case 't':
 			tolerance_pct = strtol(optarg, NULL, 0);
 			break;
+		case 'T':
+			sequential = false;
+			break;
+
 		case 'n':
-			nop_calibration = strtol(optarg, NULL, 0);
+			subopts = optarg;
+			while (*subopts != '\0') {
+				eng = getsubopt(&subopts, (char **)ring_str_map, &value);
+				if (!value) {
+					wsim_err("No calibration value for engine has been provided.\n");
+					goto err;
+				}
+
+				calib_val = atol(value);
+
+				if (!calib_val) {
+					wsim_err("An unsupported engine has been provided.\n");
+					goto err;
+				}
+
+				switch (eng) {
+				/* skip DEFAULT and VCS engines */
+				case DEFAULT:
+				case VCS:
+					wsim_err("An unsupported engine has been provided.\n");
+					goto err;
+				case RCS:
+				case BCS:
+				case VCS1 ... VECS:
+					engine_calib_map[eng] = calib_val;
+					has_nop_calibration = true;
+					break;
+				default:
+					/* raw number was given - two cases:
+					 * raw number is already set */
+					if (raw_number) {
+						wsim_err("Default engine calibration provided more than once.\n");
+						goto err;
+					}
+					else if (!raw_number) {
+						/* raw number has been set for the first time */
+						raw_number = calib_val;
+						apply_unset_calibrations(raw_number);
+					}
+					break;
+				}
+			}
 			break;
 		case 'r':
 			repeat = strtol(optarg, NULL, 0);
@@ -3242,14 +3421,13 @@ int main(int argc, char **argv)
 		goto err;
 	}
 
-	if (!nop_calibration) {
-		if (verbose > 1)
-			printf("Calibrating nop delay with %u%% tolerance...\n",
+	if (!has_nop_calibration) {
+		if (verbose > 1) {
+			printf("Calibrating nop delays with %u%% tolerance...\n",
 				tolerance_pct);
-		nop_calibration = calibrate_nop(tolerance_pct);
-		if (verbose)
-			printf("Nop calibration for %uus delay is %lu.\n",
-			       nop_calibration_us, nop_calibration);
+		}
+
+		calibrate_engines();
 
 		goto out;
 	}
@@ -3309,8 +3487,7 @@ int main(int argc, char **argv)
 
 	if (verbose > 1) {
 		printf("Random seed is %u.\n", master_prng);
-		printf("Using %lu nop calibration for %uus delay.\n",
-		       nop_calibration, nop_calibration_us);
+		print_engines_calibrations();
 		printf("%u client%s.\n", clients, clients > 1 ? "s" : "");
 		if (flags & SWAPVCS)
 			printf("Swapping VCS rings between clients.\n");
-- 
2.19.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
