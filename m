Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E128210E6AE
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 16:25:42 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 15:51:04 +0000
Message-Id: <20230906155108.2175876-5-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] benchmarks/gem_wsim: scale duration
 option fixes
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

Fixed range duration check when scale duration (-f) command line option
is provided + PERIOD step takes scale duration into account.
Moved duration parsing code from parse_workload to separate function.
Moved wsim_err, __duration definitions before parse_duration.
Moved unbound_duration from struct w_step to struct duration.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 109 +++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 48 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7b5e62a3b..f4024deb1 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -73,6 +73,7 @@ enum intel_engine_id {
 
 struct duration {
 	unsigned int min, max;
+	bool unbound_duration;
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
@@ -240,6 +240,19 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
 #define DEPSYNC		(1<<2)
 #define SSEU		(1<<3)
 
+static void __attribute__((format(printf, 1, 2)))
+wsim_err(const char *fmt, ...)
+{
+	va_list ap;
+
+	if (!verbose)
+		return;
+
+	va_start(ap, fmt);
+	vfprintf(stderr, fmt, ap);
+	va_end(ap);
+}
+
 static const char *ring_str_map[NUM_ENGINES] = {
 	[DEFAULT] = "DEFAULT",
 	[RCS] = "RCS",
@@ -429,17 +442,43 @@ out:
 	return ret;
 }
 
-static void __attribute__((format(printf, 1, 2)))
-wsim_err(const char *fmt, ...)
+static long __duration(long dur, double scale)
 {
-	va_list ap;
+	return round(scale * dur);
+}
 
-	if (!verbose)
-		return;
+static int
+parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, char *_desc)
+{
+	char *sep = NULL;
+	long tmpl;
 
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
+	if (_desc[0] == '*') {
+		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
+			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
+			return -1;
+		}
+		dur->unbound_duration = true;
+	} else {
+		tmpl = strtol(_desc, &sep, 10);
+		if (tmpl <= 0 || tmpl == LONG_MIN || tmpl == LONG_MAX)
+			return -1;
+
+		dur->min = __duration(tmpl, scale_dur);
+
+		if (sep && *sep == '-') {
+			tmpl = strtol(sep + 1, NULL, 10);
+			if (tmpl <= 0 || __duration(tmpl, scale_dur) <= dur->min ||
+			    tmpl == LONG_MIN || tmpl == LONG_MAX)
+				return -1;
+
+			dur->max = __duration(tmpl, scale_dur);
+		} else {
+			dur->max = dur->min;
+		}
+	}
+
+	return 0;
 }
 
 #define check_arg(cond, fmt, ...) \
@@ -855,11 +894,6 @@ static uint64_t engine_list_mask(const char *_str)
 static unsigned long
 allocate_working_set(struct workload *wrk, struct working_set *set);
 
-static long __duration(long dur, double scale)
-{
-	return round(scale * dur);
-}
-
 #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
 	if ((field = strtok_r(fstart, ".", &fctx))) { \
 		tmp = atoi(field); \
@@ -899,8 +933,14 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				int_field(DELAY, delay, tmp <= 0,
 					  "Invalid delay at step %u!\n");
 			} else if (!strcmp(field, "p")) {
-				int_field(PERIOD, period, tmp <= 0,
-					  "Invalid period at step %u!\n");
+				field = strtok_r(fstart, ".", &fctx);
+				if (field) {
+					tmp = atoi(field);
+					check_arg(tmp <= 0, "Invalid period at step %u!\n", nr_steps);
+					step.type = PERIOD;
+					step.period = __duration(tmp, scale_dur);
+					goto add_step;
+				}
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
 				while ((field = strtok_r(fstart, ".", &fctx))) {
@@ -1121,38 +1161,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		}
 
 		if ((field = strtok_r(fstart, ".", &fctx))) {
-			char *sep = NULL;
-			long int tmpl;
-
 			fstart = NULL;
 
-			if (field[0] == '*') {
-				check_arg(intel_gen(intel_get_drm_devid(fd)) < 8,
-					  "Infinite batch at step %u needs Gen8+!\n",
-					  nr_steps);
-				step.unbound_duration = true;
-			} else {
-				tmpl = strtol(field, &sep, 10);
-				check_arg(tmpl <= 0 || tmpl == LONG_MIN ||
-					  tmpl == LONG_MAX,
-					  "Invalid duration at step %u!\n",
-					  nr_steps);
-				step.duration.min = __duration(tmpl, scale_dur);
-
-				if (sep && *sep == '-') {
-					tmpl = strtol(sep + 1, NULL, 10);
-					check_arg(tmpl <= 0 ||
-						tmpl <= step.duration.min ||
-						tmpl == LONG_MIN ||
-						tmpl == LONG_MAX,
-						"Invalid duration range at step %u!\n",
-						nr_steps);
-					step.duration.max = __duration(tmpl,
-								       scale_dur);
-				} else {
-					step.duration.max = step.duration.min;
-				}
-			}
+			tmp = parse_duration(nr_steps, &step.duration, scale_dur, field);
+			check_arg(tmp < 0,
+				  "Invalid duration at step %u!\n", nr_steps);
 
 			valid++;
 		}
@@ -2172,7 +2185,7 @@ update_bb_start(struct workload *wrk, struct w_step *w)
 
 	/* ticks is inverted for MI_DO_COMPARE (less-than comparison) */
 	ticks = 0;
-	if (!w->unbound_duration)
+	if (!w->duration.unbound_duration)
 		ticks = ~ns_to_ctx_ticks(1000 * get_duration(wrk, w));
 
 	*w->bb_duration = ticks;
@@ -2349,7 +2362,7 @@ static void *run_workload(void *data)
 
 				igt_assert(t_idx >= 0 && t_idx < i);
 				igt_assert(wrk->steps[t_idx].type == BATCH);
-				igt_assert(wrk->steps[t_idx].unbound_duration);
+				igt_assert(wrk->steps[t_idx].duration.unbound_duration);
 
 				*wrk->steps[t_idx].bb_duration = 0xffffffff;
 				__sync_synchronize();
-- 
2.30.2
