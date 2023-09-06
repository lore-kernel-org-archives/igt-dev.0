Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043E210E1B9
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 16:26:03 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 15:51:07 +0000
Message-Id: <20230906155108.2175876-8-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] benchmarks/gem_wsim: extract
 prepare_ctxs function, add w_sync
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

Some code reorganization, no functional changes.
Extracted prepare_ctxs function from prepare_workload.
Added w_sync abstraction for workload step synchronization.
Changes will allow cleaner xe integration.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 145 ++++++++++++++++++++++++------------------
 1 file changed, 82 insertions(+), 63 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index ec9fdc2d0..d807a9d7d 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -261,6 +261,11 @@ static const char *ring_str_map[NUM_ENGINES] = {
 	[VECS] = "VECS",
 };
 
+static void w_sync(int fd_, struct w_step *w)
+{
+	gem_sync(fd_, w->obj[0].handle);
+}
+
 static int read_timestamp_frequency(int i915)
 {
 	int value = 0;
@@ -1886,20 +1891,13 @@ static void measure_active_set(struct workload *wrk)
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
 
-static int prepare_workload(unsigned int id, struct workload *wrk)
+static int prepare_ctxs(unsigned int id, struct workload *wrk)
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
@@ -2088,6 +2086,21 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
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
+	prepare_ctxs(id, wrk);
+
 	/* Record default preemption. */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == BATCH)
@@ -2108,75 +2121,81 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		for (j = i + 1; j < wrk->nr_steps; j++) {
 			w2 = &wrk->steps[j];
 
-			if (w2->context != w->context)
-				continue;
-			else if (w2->type == PREEMPTION)
+				if (w2->context != w->context)
+					continue;
+
+			if (w2->type == PREEMPTION)
 				break;
-			else if (w2->type != BATCH)
+			if (w2->type != BATCH)
 				continue;
 
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
+	{
+		struct working_set **sets;
+		unsigned long total = 0;
+
+		/*
+		 * Scan for SSEU control steps.
+		 */
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
+		 * Allocate working sets.
+		 */
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
+		 * Map of working set ids.
+		 */
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
@@ -2231,7 +2250,7 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
 	igt_assert(target < wrk->nr_steps);
 	igt_assert(wrk->steps[target].type == BATCH);
 
-	gem_sync(fd, wrk->steps[target].obj[0].handle);
+	w_sync(fd, &wrk->steps[target]);
 }
 
 static void
@@ -2290,7 +2309,7 @@ static void sync_deps(struct workload *wrk, struct w_step *w)
 		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 		igt_assert(wrk->steps[dep_idx].type == BATCH);
 
-		gem_sync(fd, wrk->steps[dep_idx].obj[0].handle);
+		w_sync(fd, &wrk->steps[dep_idx]);
 	}
 }
 
@@ -2346,7 +2365,7 @@ static void *run_workload(void *data)
 
 				igt_assert(s_idx >= 0 && s_idx < i);
 				igt_assert(wrk->steps[s_idx].type == BATCH);
-				gem_sync(fd, wrk->steps[s_idx].obj[0].handle);
+				w_sync(fd, &wrk->steps[s_idx]);
 				continue;
 			} else if (w->type == THROTTLE) {
 				throttle = w->throttle;
@@ -2437,7 +2456,7 @@ static void *run_workload(void *data)
 				break;
 
 			if (w->sync)
-				gem_sync(fd, w->obj[0].handle);
+				w_sync(fd, w);
 
 			if (qd_throttle > 0) {
 				while (wrk->nrequest[engine] > qd_throttle) {
@@ -2446,7 +2465,7 @@ static void *run_workload(void *data)
 					s = igt_list_first_entry(&wrk->requests[engine],
 								 s, rq_link);
 
-					gem_sync(fd, s->obj[0].handle);
+						w_sync(fd, s);
 
 					s->request = -1;
 					igt_list_del(&s->rq_link);
@@ -2471,7 +2490,7 @@ static void *run_workload(void *data)
 				w->emit_fence = -1;
 			}
 		}
-	}
+	} // main loop
 
 	for (i = 0; i < NUM_ENGINES; i++) {
 		if (!wrk->nrequest[i])
-- 
2.30.2
