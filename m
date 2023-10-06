Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE64A10E53F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 16:40:39 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:06:40 +0000
Message-ID: <20231006160654.3220198-7-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
References: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/17] benchmarks/gem_wsim: cleanups
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

Cleaning checkpatch.pl reported warnings/errors.
Removed unused fence_signal field from struct w_step.

v2:
- restored unnecessarily changed malloc (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 54 ++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 67d2bce18..c64397eae 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2017 Intel Corporation
  *
@@ -76,8 +77,7 @@ struct duration {
 	bool unbound;
 };
 
-enum w_type
-{
+enum w_type {
 	BATCH,
 	SYNC,
 	DELAY,
@@ -102,8 +102,7 @@ struct dep_entry {
 	int working_set; /* -1 = step dependecy, >= 0 working set id */
 };
 
-struct deps
-{
+struct deps {
 	int nr;
 	bool submit_fence;
 	struct dep_entry *list;
@@ -137,8 +136,7 @@ struct working_set {
 
 struct workload;
 
-struct w_step
-{
+struct w_step {
 	struct workload *wrk;
 
 	/* Workload step metadata */
@@ -155,7 +153,6 @@ struct w_step
 		int period;
 		int target;
 		int throttle;
-		int fence_signal;
 		int priority;
 		struct {
 			unsigned int engine_map_count;
@@ -194,8 +191,7 @@ struct ctx {
 	uint64_t sseu;
 };
 
-struct workload
-{
+struct workload {
 	unsigned int id;
 
 	unsigned int nr_steps;
@@ -807,6 +803,7 @@ static int add_buffers(struct working_set *set, char *str)
 
 	for (i = 0; i < add; i++) {
 		struct work_buffer_size *sz = &sizes[set->nr + i];
+
 		sz->min = min_sz;
 		sz->max = max_sz;
 		sz->size = 0;
@@ -899,13 +896,16 @@ parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, ch
 }
 
 #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
-	if ((field = strtok_r(fstart, ".", &fctx))) { \
-		tmp = atoi(field); \
-		check_arg(_COND_, _ERR_, nr_steps); \
-		step.type = _STEP_; \
-		step._FIELD_ = tmp; \
-		goto add_step; \
-	} \
+	do { \
+		field = strtok_r(fstart, ".", &fctx); \
+		if (field) { \
+			tmp = atoi(field); \
+			check_arg(_COND_, _ERR_, nr_steps); \
+			step.type = _STEP_; \
+			step._FIELD_ = tmp; \
+			goto add_step; \
+		} \
+	} while (0)
 
 static struct workload *
 parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
@@ -930,7 +930,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		valid = 0;
 		memset(&step, 0, sizeof(step));
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			if (!strcmp(field, "d")) {
@@ -941,6 +942,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid period at step %u!\n");
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -966,6 +968,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid sync target at step %u!\n");
 			} else if (!strcmp(field, "S")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(tmp <= 0 && nr == 0,
@@ -1002,6 +1005,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "M")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1032,6 +1036,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid terminate target at step %u!\n");
 			} else if (!strcmp(field, "X")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1056,6 +1061,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "B")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1075,6 +1081,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "b")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					check_arg(nr > 2,
 						  "Invalid bond format at step %u!\n",
@@ -1146,7 +1153,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			i = str_to_engine(field);
@@ -1158,7 +1166,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			step.engine = i;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			if (parse_duration(nr_steps, &step.duration, scale_dur, field))
@@ -1167,7 +1176,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			tmp = parse_dependencies(nr_steps, &step, field);
@@ -1177,7 +1187,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			check_arg(strlen(field) != 1 ||
@@ -2714,6 +2725,7 @@ int main(int argc, char **argv)
 
 	if (append_workload_arg) {
 		struct w_arg arg = { NULL, append_workload_arg, 0 };
+
 		app_w = parse_workload(&arg, flags, scale_dur, scale_time,
 				       NULL);
 		if (!app_w) {
-- 
2.42.0
