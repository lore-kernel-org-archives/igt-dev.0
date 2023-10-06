Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0410E53B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 16:40:45 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:06:41 +0000
Message-ID: <20231006160654.3220198-8-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
References: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/17] benchmarks/gem_wsim: reposition
 repeat_start variable
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

No need for repeat_start in struct workload.
It's now a variable in run_workload function scope.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index c64397eae..24b51ec8a 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -209,8 +209,6 @@ struct workload {
 	uint32_t bb_prng;
 	uint32_t bo_prng;
 
-	struct timespec repeat_start;
-
 	unsigned int nr_ctxs;
 	struct ctx *ctx_list;
 
@@ -2280,7 +2278,7 @@ static void sync_deps(struct workload *wrk, struct w_step *w)
 static void *run_workload(void *data)
 {
 	struct workload *wrk = (struct workload *)data;
-	struct timespec t_start, t_end;
+	struct timespec t_start, t_end, repeat_start;
 	struct w_step *w;
 	int throttle = -1;
 	int qd_throttle = -1;
@@ -2294,7 +2292,7 @@ static void *run_workload(void *data)
 	     count++) {
 		unsigned int cur_seqno = wrk->sync_seqno;
 
-		clock_gettime(CLOCK_MONOTONIC, &wrk->repeat_start);
+		clock_gettime(CLOCK_MONOTONIC, &repeat_start);
 
 		for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
 		     i++, w++) {
@@ -2308,7 +2306,7 @@ static void *run_workload(void *data)
 				int elapsed;
 
 				clock_gettime(CLOCK_MONOTONIC, &now);
-				elapsed = elapsed_us(&wrk->repeat_start, &now);
+				elapsed = elapsed_us(&repeat_start, &now);
 				do_sleep = w->period - elapsed;
 				time_tot += elapsed;
 				if (elapsed < time_min)
-- 
2.42.0
