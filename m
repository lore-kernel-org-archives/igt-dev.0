Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed,  4 Mar 2020 13:24:57 +0000
Message-Id: <20200304132457.13258-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gem_wsim: Fix calibration for default and
 virtual engine
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

When providing engine calibrations on the command line, we need to apply
the one given for RCS to DEFAULT as well.

Also when load balancing is used we need to get calibration from one of
the real engines from the map which should provide a better match.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 50 +++++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index aaf3a16198df..a1bbcef031bb 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -111,8 +111,12 @@ struct bond {
 	enum intel_engine_id master;
 };
 
+struct workload;
+
 struct w_step
 {
+	struct workload *wrk;
+
 	/* Workload step metadata */
 	enum w_type type;
 	unsigned int context;
@@ -1140,17 +1144,37 @@ static unsigned int get_duration(struct workload *wrk, struct w_step *w)
 		       (dur->max + 1 - dur->min);
 }
 
-static unsigned long get_bb_sz(unsigned int duration, enum intel_engine_id engine)
+static struct ctx *
+__get_ctx(struct workload *wrk, const struct w_step *w)
 {
-	return ALIGN(duration * engine_calib_map[engine] * sizeof(uint32_t) /
-		nop_calibration_us, sizeof(uint32_t));
+	return &wrk->ctx_list[w->context * 2];
+}
+
+static unsigned long
+get_bb_sz(const struct w_step *w, unsigned int duration)
+{
+	enum intel_engine_id engine = w->engine;
+	struct ctx *ctx = __get_ctx(w->wrk, w);
+	unsigned long d;
+
+	if (ctx->engine_map && engine == DEFAULT)
+		/* Assume first engine calibration. */
+		engine = ctx->engine_map[0];
+
+	igt_assert(engine_calib_map[engine]);
+	d = ALIGN(duration * engine_calib_map[engine] * sizeof(uint32_t) /
+		  nop_calibration_us,
+		  sizeof(uint32_t));
+	igt_assert(d);
+
+	return d;
 }
 
 static void
 init_bb(struct w_step *w, unsigned int flags)
 {
 	const unsigned int arb_period =
-			get_bb_sz(w->preempt_us, w->engine) / sizeof(uint32_t);
+			get_bb_sz(w, w->preempt_us) / sizeof(uint32_t);
 	const unsigned int mmap_len = ALIGN(w->bb_sz, 4096);
 	unsigned int i;
 	uint32_t *ptr;
@@ -1295,12 +1319,6 @@ find_engine_in_map(struct ctx *ctx, enum intel_engine_id engine)
 	return 0;
 }
 
-static struct ctx *
-__get_ctx(struct workload *wrk, struct w_step *w)
-{
-	return &wrk->ctx_list[w->context * 2];
-}
-
 static void
 eb_update_flags(struct workload *wrk, struct w_step *w,
 		enum intel_engine_id engine, unsigned int flags)
@@ -1377,10 +1395,10 @@ alloc_step_batch(struct workload *wrk, struct w_step *w, unsigned int flags)
 
 	if (w->unbound_duration)
 		/* nops + MI_ARB_CHK + MI_BATCH_BUFFER_START */
-		w->bb_sz = max(PAGE_SIZE, get_bb_sz(w->preempt_us, w->engine)) +
+		w->bb_sz = max(PAGE_SIZE, get_bb_sz(w, w->preempt_us)) +
 			   (1 + 3) * sizeof(uint32_t);
 	else
-		w->bb_sz = get_bb_sz(w->duration.max, w->engine);
+		w->bb_sz = get_bb_sz(w, w->duration.max);
 
 	w->bb_handle = w->obj[j].handle = gem_create(fd, w->bb_sz + (w->unbound_duration ? 4096 : 0));
 	init_bb(w, flags);
@@ -1568,6 +1586,8 @@ prepare_workload(unsigned int id, struct workload *wrk, unsigned int flags)
 		int ctx = w->context * 2 + 1; /* Odd slots are special. */
 		int delta;
 
+		w->wrk = wrk;
+
 		if (ctx <= max_ctx)
 			continue;
 
@@ -2681,7 +2701,7 @@ do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine,
 	w->eb.batch_start_offset =
 		w->unbound_duration ?
 		0 :
-		ALIGN(w->bb_sz - get_bb_sz(get_duration(wrk, w), w->engine),
+		ALIGN(w->bb_sz - get_bb_sz(w, get_duration(wrk, w)),
 		      2 * sizeof(uint32_t));
 
 	for (i = 0; i < w->fence_deps.nr; i++) {
@@ -3331,6 +3351,8 @@ int main(int argc, char **argv)
 						goto err;
 					} else {
 						engine_calib_map[eng] = calib_val;
+						if (eng == RCS)
+							engine_calib_map[DEFAULT] = calib_val;
 						has_nop_calibration = true;
 					}
 				} else {
@@ -3444,7 +3466,7 @@ int main(int argc, char **argv)
 		bool missing = false;
 
 		for (i = 0; i < NUM_ENGINES; i++) {
-			if (i == DEFAULT || i == VCS)
+			if (i == VCS)
 				continue;
 
 			if (!engine_calib_map[i]) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
