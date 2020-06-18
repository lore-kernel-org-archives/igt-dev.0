Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:41 +0100
Message-Id: <20200618104747.24005-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 05/11] gem_wsim: Support random buffer sizes
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

See README for more details.

v2:
 * No need to mess with flags. (Chris)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c  | 69 +++++++++++++++++++++++++++++++++---------
 benchmarks/wsim/README |  4 +++
 2 files changed, 59 insertions(+), 14 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 23b81d181df3..a387e180c242 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -117,12 +117,18 @@ struct bond {
 	enum intel_engine_id master;
 };
 
+struct work_buffer_size {
+	unsigned long size;
+	unsigned long min;
+	unsigned long max;
+};
+
 struct working_set {
 	int id;
 	bool shared;
 	unsigned int nr;
 	uint32_t *handles;
-	unsigned long *sizes;
+	struct work_buffer_size *sizes;
 };
 
 struct workload;
@@ -203,6 +209,7 @@ struct workload
 	bool print_stats;
 
 	uint32_t bb_prng;
+	uint32_t bo_prng;
 
 	struct timespec repeat_start;
 
@@ -779,10 +786,12 @@ static int add_buffers(struct working_set *set, char *str)
 	 * 4m
 	 * 4g
 	 * 10n4k - 10 4k batches
+	 * 4096-16k - random size in range
 	 */
-	unsigned long *sizes, size;
+	struct work_buffer_size *sizes;
+	unsigned long min_sz, max_sz;
+	char *n, *max = NULL;
 	int add, i;
-	char *n;
 
 	n = index(str, 'n');
 	if (n) {
@@ -795,16 +804,34 @@ static int add_buffers(struct working_set *set, char *str)
 		add = 1;
 	}
 
-	size = parse_size(str);
-	if (!size)
+	n = index(str, '-');
+	if (n) {
+		*n = 0;
+		max = ++n;
+	}
+
+	min_sz = parse_size(str);
+	if (!min_sz)
 		return -1;
 
+	if (max) {
+		max_sz = parse_size(max);
+		if (!max_sz)
+			return -1;
+	} else {
+		max_sz = min_sz;
+	}
+
 	sizes = realloc(set->sizes, (set->nr + add) * sizeof(*sizes));
 	if (!sizes)
 		return -1;
 
-	for (i = 0; i < add; i++)
-		sizes[set->nr + i] = size;
+	for (i = 0; i < add; i++) {
+		struct work_buffer_size *sz = &sizes[set->nr + i];
+		sz->min = min_sz;
+		sz->max = max_sz;
+		sz->size = 0;
+	}
 
 	set->nr += add;
 	set->sizes = sizes;
@@ -846,7 +873,7 @@ static uint64_t engine_list_mask(const char *_str)
 	return mask;
 }
 
-static void allocate_working_set(struct working_set *set);
+static void allocate_working_set(struct workload *wrk, struct working_set *set);
 
 #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
 	if ((field = strtok_r(fstart, ".", &fctx))) { \
@@ -1203,6 +1230,7 @@ add_step:
 	wrk->sseu = arg->sseu;
 	wrk->max_working_set_id = -1;
 	wrk->working_sets = NULL;
+	wrk->bo_prng = (flags & SYNCEDCLIENTS) ? master_prng : rand();
 
 	free(desc);
 
@@ -1256,7 +1284,7 @@ add_step:
 	 */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == WORKINGSET && w->working_set.shared)
-			allocate_working_set(&w->working_set);
+			allocate_working_set(wrk, &w->working_set);
 	}
 
 	wrk->max_working_set_id = -1;
@@ -1533,7 +1561,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 
 			igt_assert(set->nr);
 			igt_assert(entry->target < set->nr);
-			igt_assert(set->sizes[entry->target]);
+			igt_assert(set->sizes[entry->target].size);
 
 			dep_handle = set->handles[entry->target];
 		}
@@ -1701,15 +1729,27 @@ static size_t sizeof_engines_bond(int count)
 			engines[count]);
 }
 
-static void allocate_working_set(struct working_set *set)
+static unsigned long
+get_buffer_size(struct workload *wrk, const struct work_buffer_size *sz)
+{
+	if (sz->min == sz->max)
+		return sz->min;
+	else
+		return sz->min + hars_petruska_f54_1_random(&wrk->bo_prng) %
+		       (sz->max + 1 - sz->min);
+}
+
+static void allocate_working_set(struct workload *wrk, struct working_set *set)
 {
 	unsigned int i;
 
 	set->handles = calloc(set->nr, sizeof(*set->handles));
 	igt_assert(set->handles);
 
-	for (i = 0; i < set->nr; i++)
-		set->handles[i] = alloc_bo(fd, set->sizes[i]);
+	for (i = 0; i < set->nr; i++) {
+		set->sizes[i].size = get_buffer_size(wrk, &set->sizes[i]);
+		set->handles[i] = alloc_bo(fd, set->sizes[i].size);
+	}
 }
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
@@ -1724,6 +1764,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 	wrk->id = id;
 	wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
 	wrk->run = true;
 
 	/*
@@ -1956,7 +1997,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 	 */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == WORKINGSET && !w->working_set.shared)
-			allocate_working_set(&w->working_set);
+			allocate_working_set(wrk, &w->working_set);
 	}
 
 	/*
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index 3d9143226740..8c71f2fe6579 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -307,11 +307,15 @@ For size a byte size can be given, or suffix 'k', 'm' or 'g' can be used (case
 insensitive). Prefix in the format of "<int>n<size>" can also be given to create
 multiple objects of the same size.
 
+Ranges can also be specified using the <min>-<max> syntax.
+
 Examples:
 
   w.1.4k - Working set 1 with a single 4KiB object in it.
   W.2.2M/32768 - Working set 2 with one 2MiB and one 32768 byte object.
   w.3.10n4k/2n20000 - Working set 3 with ten 4KiB and two 20000 byte objects.
+  w.4.4n4k-1m - Working set 4 with four objects of random size between 4KiB and
+		1MiB.
 
 Working set objects can be referenced as data dependency targets using the new
 'r'/'w' syntax. Simple example:
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
