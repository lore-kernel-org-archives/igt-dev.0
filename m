Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C1A10E6AF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 16:25:48 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 15:51:05 +0000
Message-Id: <20230906155108.2175876-6-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/8] benchmarks/gem_wsim: cleanups
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
calloc vs malloc in parse_workload for struct workload.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 56 ++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index f4024deb1..0c1b58727 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright © 2017 Intel Corporation
  *
@@ -76,8 +77,7 @@ struct duration {
 	bool unbound_duration;
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
@@ -846,6 +842,7 @@ static int add_buffers(struct working_set *set, char *str)
 
 	for (i = 0; i < add; i++) {
 		struct work_buffer_size *sz = &sizes[set->nr + i];
+
 		sz->min = min_sz;
 		sz->max = max_sz;
 		sz->size = 0;
@@ -895,13 +892,16 @@ static unsigned long
 allocate_working_set(struct workload *wrk, struct working_set *set);
 
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
@@ -926,7 +926,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		valid = 0;
 		memset(&step, 0, sizeof(step));
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			if (!strcmp(field, "d")) {
@@ -943,6 +944,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				}
 			} else if (!strcmp(field, "P")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -968,6 +970,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid sync target at step %u!\n");
 			} else if (!strcmp(field, "S")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(tmp <= 0 && nr == 0,
@@ -1004,6 +1007,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "M")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1034,6 +1038,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 					  "Invalid terminate target at step %u!\n");
 			} else if (!strcmp(field, "X")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1058,6 +1063,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "B")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					tmp = atoi(field);
 					check_arg(nr == 0 && tmp <= 0,
@@ -1077,6 +1083,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				goto add_step;
 			} else if (!strcmp(field, "b")) {
 				unsigned int nr = 0;
+
 				while ((field = strtok_r(fstart, ".", &fctx))) {
 					check_arg(nr > 2,
 						  "Invalid bond format at step %u!\n",
@@ -1148,7 +1155,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			i = str_to_engine(field);
@@ -1160,7 +1168,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			step.engine = i;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			tmp = parse_duration(nr_steps, &step.duration, scale_dur, field);
@@ -1170,7 +1179,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			tmp = parse_dependencies(nr_steps, &step, field);
@@ -1180,7 +1190,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 			valid++;
 		}
 
-		if ((field = strtok_r(fstart, ".", &fctx))) {
+		field = strtok_r(fstart, ".", &fctx);
+		if (field) {
 			fstart = NULL;
 
 			check_arg(strlen(field) != 1 ||
@@ -1224,7 +1235,7 @@ add_step:
 		nr_steps += app_w->nr_steps;
 	}
 
-	wrk = malloc(sizeof(*wrk));
+	wrk = calloc(1, sizeof(*wrk));
 	igt_assert(wrk);
 
 	wrk->nr_steps = nr_steps;
@@ -2717,6 +2728,7 @@ int main(int argc, char **argv)
 
 	if (append_workload_arg) {
 		struct w_arg arg = { NULL, append_workload_arg, 0 };
+
 		app_w = parse_workload(&arg, flags, scale_dur, scale_time,
 				       NULL);
 		if (!app_w) {
-- 
2.30.2
