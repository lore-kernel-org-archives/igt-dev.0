Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A5510E671
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:19:28 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:17 +0000
Message-ID: <20230928174535.2074462-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/17] benchmarks/gem_wsim: reposition the
 unbound duration boolean
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

All duration info is now in struct duration of w_step.

v2:
- rename unbound_duration to unbound (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7b5e62a3b..42690d3d0 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -73,6 +73,7 @@ enum intel_engine_id {
 
 struct duration {
 	unsigned int min, max;
+	bool unbound;
 };
 
 enum w_type
@@ -145,7 +146,6 @@ struct w_step
 	unsigned int context;
 	unsigned int engine;
 	struct duration duration;
-	bool unbound_duration;
 	struct deps data_deps;
 	struct deps fence_deps;
 	int emit_fence;
@@ -1130,7 +1130,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				check_arg(intel_gen(intel_get_drm_devid(fd)) < 8,
 					  "Infinite batch at step %u needs Gen8+!\n",
 					  nr_steps);
-				step.unbound_duration = true;
+				step.duration.unbound = true;
 			} else {
 				tmpl = strtol(field, &sep, 10);
 				check_arg(tmpl <= 0 || tmpl == LONG_MIN ||
@@ -2172,8 +2172,8 @@ update_bb_start(struct workload *wrk, struct w_step *w)
 
 	/* ticks is inverted for MI_DO_COMPARE (less-than comparison) */
 	ticks = 0;
-	if (!w->unbound_duration)
-		ticks = ~ns_to_ctx_ticks(1000 * get_duration(wrk, w));
+	if (!w->duration.unbound)
+		ticks = ~ns_to_ctx_ticks(1000LL * get_duration(wrk, w));
 
 	*w->bb_duration = ticks;
 }
@@ -2349,7 +2349,7 @@ static void *run_workload(void *data)
 
 				igt_assert(t_idx >= 0 && t_idx < i);
 				igt_assert(wrk->steps[t_idx].type == BATCH);
-				igt_assert(wrk->steps[t_idx].unbound_duration);
+				igt_assert(wrk->steps[t_idx].duration.unbound);
 
 				*wrk->steps[t_idx].bb_duration = 0xffffffff;
 				__sync_synchronize();
-- 
2.42.0
