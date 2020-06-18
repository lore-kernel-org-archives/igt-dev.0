Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:43 +0100
Message-Id: <20200618104747.24005-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/11] gem_wsim: Log max and active working
 set sizes in verbose mode
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
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is useful to know how much memory workload is allocating.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 benchmarks/gem_wsim.c | 100 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 95 insertions(+), 5 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 2d6d0a6a7b4b..8788f752121b 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -874,7 +874,8 @@ static uint64_t engine_list_mask(const char *_str)
 	return mask;
 }
 
-static void allocate_working_set(struct workload *wrk, struct working_set *set);
+static unsigned long
+allocate_working_set(struct workload *wrk, struct working_set *set);
 
 static long __duration(long dur, double scale)
 {
@@ -1294,8 +1295,14 @@ add_step:
 	 * Allocate shared working sets.
 	 */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == WORKINGSET && w->working_set.shared)
-			allocate_working_set(wrk, &w->working_set);
+		if (w->type == WORKINGSET && w->working_set.shared) {
+			unsigned long total =
+				allocate_working_set(wrk, &w->working_set);
+
+			if (verbose > 1)
+				printf("%u: %lu bytes in shared working set %u\n",
+				       wrk->id, total, w->working_set.id);
+		}
 	}
 
 	wrk->max_working_set_id = -1;
@@ -1750,8 +1757,10 @@ get_buffer_size(struct workload *wrk, const struct work_buffer_size *sz)
 		       (sz->max + 1 - sz->min);
 }
 
-static void allocate_working_set(struct workload *wrk, struct working_set *set)
+static unsigned long
+allocate_working_set(struct workload *wrk, struct working_set *set)
 {
+	unsigned long total = 0;
 	unsigned int i;
 
 	set->handles = calloc(set->nr, sizeof(*set->handles));
@@ -1760,7 +1769,82 @@ static void allocate_working_set(struct workload *wrk, struct working_set *set)
 	for (i = 0; i < set->nr; i++) {
 		set->sizes[i].size = get_buffer_size(wrk, &set->sizes[i]);
 		set->handles[i] = alloc_bo(fd, set->sizes[i].size);
+		total += set->sizes[i].size;
+	}
+
+	return total;
+}
+
+static bool
+find_dep(struct dep_entry *deps, unsigned int nr, struct dep_entry dep)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++) {
+		if (deps[i].working_set == dep.working_set &&
+		    deps[i].target == dep.target)
+			return true;
 	}
+
+	return false;
+}
+
+static void measure_active_set(struct workload *wrk)
+{
+	unsigned long total = 0, batch_sizes = 0;
+	struct dep_entry *deps = NULL;
+	unsigned int nr = 0, i, j;
+	struct w_step *w;
+
+	if (verbose < 3)
+		return;
+
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		if (w->type != BATCH)
+			continue;
+
+		batch_sizes += w->bb_sz;
+
+		for (j = 0; j < w->data_deps.nr; j++) {
+			struct dep_entry *dep = &w->data_deps.list[j];
+			struct dep_entry _dep = *dep;
+
+			if (dep->working_set == -1 && dep->target < 0) {
+				int idx = w->idx + dep->target;
+
+				igt_assert(idx >= 0 && idx < w->idx);
+				igt_assert(wrk->steps[idx].type == BATCH);
+
+				_dep.target = wrk->steps[idx].obj[0].handle;
+			}
+
+			if (!find_dep(deps, nr, _dep)) {
+				if (dep->working_set == -1) {
+					total += 4096;
+				} else {
+					struct working_set *set;
+
+					igt_assert(dep->working_set <=
+						   wrk->max_working_set_id);
+
+					set = wrk->working_sets[dep->working_set];
+					igt_assert(set->nr);
+					igt_assert(dep->target < set->nr);
+					igt_assert(set->sizes[dep->target].size);
+
+					total += set->sizes[dep->target].size;
+				}
+
+				deps = realloc(deps, (nr + 1) * sizeof(*deps));
+				deps[nr++] = *dep;
+			}
+		}
+	}
+
+	free(deps);
+
+	printf("%u: %lu bytes active working set in %u buffers. %lu in batch buffers.\n",
+	       wrk->id, total, nr, batch_sizes);
 }
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
@@ -1768,6 +1852,7 @@ static void allocate_working_set(struct workload *wrk, struct working_set *set)
 static int prepare_workload(unsigned int id, struct workload *wrk)
 {
 	struct working_set **sets;
+	unsigned long total = 0;
 	uint32_t share_vm = 0;
 	int max_ctx = -1;
 	struct w_step *w;
@@ -2008,9 +2093,12 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 	 */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == WORKINGSET && !w->working_set.shared)
-			allocate_working_set(wrk, &w->working_set);
+			total += allocate_working_set(wrk, &w->working_set);
 	}
 
+	if (verbose > 2)
+		printf("%u: %lu bytes in working sets.\n", wrk->id, total);
+
 	/*
 	 * Map of working set ids.
 	 */
@@ -2058,6 +2146,8 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		alloc_step_batch(wrk, w);
 	}
 
+	measure_active_set(wrk);
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
