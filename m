Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179DB10E671
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:21:28 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:26 +0000
Message-ID: <20230928174535.2074462-12-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/17] benchmarks/gem_wsim: introduce
 w_step_sync function
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

Added w_step_sync function for workload step synchronization.
Change will allow cleaner xe integration.

v2:
- correct indentation (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 87c68316d..7495ab297 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -245,6 +245,11 @@ static const char *ring_str_map[NUM_ENGINES] = {
 	[VECS] = "VECS",
 };
 
+static void w_step_sync(struct w_step *w)
+{
+	gem_sync(fd, w->obj[0].handle);
+}
+
 static int read_timestamp_frequency(int i915)
 {
 	int value = 0;
@@ -2104,7 +2109,7 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
 	igt_assert(target < wrk->nr_steps);
 	igt_assert(wrk->steps[target].type == BATCH);
 
-	gem_sync(fd, wrk->steps[target].obj[0].handle);
+	w_step_sync(&wrk->steps[target]);
 }
 
 static void
@@ -2163,7 +2168,7 @@ static void sync_deps(struct workload *wrk, struct w_step *w)
 		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 		igt_assert(wrk->steps[dep_idx].type == BATCH);
 
-		gem_sync(fd, wrk->steps[dep_idx].obj[0].handle);
+		w_step_sync(&wrk->steps[dep_idx]);
 	}
 }
 
@@ -2217,7 +2222,7 @@ static void *run_workload(void *data)
 
 				igt_assert(s_idx >= 0 && s_idx < i);
 				igt_assert(wrk->steps[s_idx].type == BATCH);
-				gem_sync(fd, wrk->steps[s_idx].obj[0].handle);
+				w_step_sync(&wrk->steps[s_idx]);
 				continue;
 			} else if (w->type == THROTTLE) {
 				throttle = w->throttle;
@@ -2308,7 +2313,7 @@ static void *run_workload(void *data)
 				break;
 
 			if (w->sync)
-				gem_sync(fd, w->obj[0].handle);
+				w_step_sync(w);
 
 			if (qd_throttle > 0) {
 				while (wrk->nrequest[engine] > qd_throttle) {
@@ -2317,7 +2322,7 @@ static void *run_workload(void *data)
 					s = igt_list_first_entry(&wrk->requests[engine],
 								 s, rq_link);
 
-					gem_sync(fd, s->obj[0].handle);
+					w_step_sync(s);
 
 					s->request = -1;
 					igt_list_del(&s->rq_link);
@@ -2349,7 +2354,7 @@ static void *run_workload(void *data)
 			continue;
 
 		w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
-		gem_sync(fd, w->obj[0].handle);
+		w_step_sync(w);
 	}
 
 	clock_gettime(CLOCK_MONOTONIC, &t_end);
-- 
2.42.0
