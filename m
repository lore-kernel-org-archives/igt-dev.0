Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:39 +0100
Message-Id: <20200618104747.24005-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/11] gem_wsim: Show workload timing stats
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

Show average/min/max workload iteration and dropped period stats when 'p'
command is used.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index dc47470c621d..dd0b2e260a5a 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2117,7 +2117,8 @@ static void *run_workload(void *data)
 	struct w_step *w;
 	int throttle = -1;
 	int qd_throttle = -1;
-	int count;
+	int count, missed = 0;
+	unsigned long time_tot = 0, time_min = ULONG_MAX, time_max = 0;
 	int i;
 
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
@@ -2137,12 +2138,19 @@ static void *run_workload(void *data)
 				do_sleep = w->delay;
 			} else if (w->type == PERIOD) {
 				struct timespec now;
+				int elapsed;
 
 				clock_gettime(CLOCK_MONOTONIC, &now);
-				do_sleep = w->period -
-					   elapsed_us(&wrk->repeat_start, &now);
+				elapsed = elapsed_us(&wrk->repeat_start, &now);
+				do_sleep = w->period - elapsed;
+				time_tot += elapsed;
+				if (elapsed < time_min)
+					time_min = elapsed;
+				if (elapsed > time_max)
+					time_max = elapsed;
 				if (do_sleep < 0) {
-					if (verbose > 1)
+					missed++;
+					if (verbose > 2)
 						printf("%u: Dropped period @ %u/%u (%dus late)!\n",
 						       wrk->id, count, i, do_sleep);
 					continue;
@@ -2296,6 +2304,9 @@ static void *run_workload(void *data)
 		printf("%c%u: %.3fs elapsed (%d cycles, %.3f workloads/s).",
 		       wrk->background ? ' ' : '*', wrk->id,
 		       t, count, count / t);
+		if (time_tot)
+			printf(" Time avg/min/max=%lu/%lu/%luus; %u missed.",
+			       time_tot / count, time_min, time_max, missed);
 		putchar('\n');
 	}
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
