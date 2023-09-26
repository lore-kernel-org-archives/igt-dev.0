Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D525010E385
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 09:20:08 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 08:44:28 +0000
Message-ID: <20230926084451.1732748-14-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/14] benchmarks/gem_wsim: extract prepare
 working sets code to new function
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

No functional changes.
Extracted prepare_working_sets function from prepare_workload.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 106 +++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 48 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 55f8d9b1b..7703ca822 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1964,10 +1964,66 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 	return 0;
 }
 
-static int prepare_workload(unsigned int id, struct workload *wrk)
+static int prepare_working_sets(unsigned int id, struct workload *wrk)
 {
 	struct working_set **sets;
 	unsigned long total = 0;
+	struct w_step *w;
+	int i;
+
+	/*
+	 * Allocate working sets.
+	 */
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		if (w->type == WORKINGSET && !w->working_set.shared)
+			total += allocate_working_set(wrk, &w->working_set);
+	}
+
+	if (verbose > 2)
+		printf("%u: %lu bytes in working sets.\n", wrk->id, total);
+
+	/*
+	 * Map of working set ids.
+	 */
+	wrk->max_working_set_id = -1;
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		if (w->type == WORKINGSET &&
+		    w->working_set.id > wrk->max_working_set_id)
+			wrk->max_working_set_id = w->working_set.id;
+	}
+
+	sets = wrk->working_sets;
+	wrk->working_sets = calloc(wrk->max_working_set_id + 1,
+				   sizeof(*wrk->working_sets));
+	igt_assert(wrk->working_sets);
+
+	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
+		struct working_set *set;
+
+		if (w->type != WORKINGSET)
+			continue;
+
+		if (!w->working_set.shared) {
+			set = &w->working_set;
+		} else {
+			igt_assert(sets);
+
+			set = sets[w->working_set.id];
+			igt_assert(set->shared);
+			igt_assert(set->sizes);
+		}
+
+		wrk->working_sets[w->working_set.id] = set;
+	}
+
+	if (sets)
+		free(sets);
+
+	return 0;
+}
+
+static int prepare_workload(unsigned int id, struct workload *wrk)
+{
 	struct w_step *w;
 	int i, j;
 
@@ -2019,53 +2075,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 		}
 	}
 
-	/*
-	 * Allocate working sets.
-	 */
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == WORKINGSET && !w->working_set.shared)
-			total += allocate_working_set(wrk, &w->working_set);
-	}
-
-	if (verbose > 2)
-		printf("%u: %lu bytes in working sets.\n", wrk->id, total);
-
-	/*
-	 * Map of working set ids.
-	 */
-	wrk->max_working_set_id = -1;
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		if (w->type == WORKINGSET &&
-		    w->working_set.id > wrk->max_working_set_id)
-			wrk->max_working_set_id = w->working_set.id;
-	}
-
-	sets = wrk->working_sets;
-	wrk->working_sets = calloc(wrk->max_working_set_id + 1,
-				   sizeof(*wrk->working_sets));
-	igt_assert(wrk->working_sets);
-
-	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
-		struct working_set *set;
-
-		if (w->type != WORKINGSET)
-			continue;
-
-		if (!w->working_set.shared) {
-			set = &w->working_set;
-		} else {
-			igt_assert(sets);
-
-			set = sets[w->working_set.id];
-			igt_assert(set->shared);
-			igt_assert(set->sizes);
-		}
-
-		wrk->working_sets[w->working_set.id] = set;
-	}
-
-	if (sets)
-		free(sets);
+	prepare_working_sets(id, wrk);
 
 	/*
 	 * Allocate batch buffers.
-- 
2.42.0
