Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B9F10E6A8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 16:25:56 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 15:51:06 +0000
Message-Id: <20230906155108.2175876-7-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] benchmarks/gem_wsim: allow comments in
 workload description files
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

Lines starting with '#' are skipped.
If command line step separator (',') is encountered after '#'
it is replaced with ';' to not break parsing.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c  | 41 ++++++++++++++++++++++++++++++++---------
 benchmarks/wsim/README |  2 ++
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 0c1b58727..ec9fdc2d0 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -43,6 +43,7 @@
 #include <limits.h>
 #include <pthread.h>
 #include <math.h>
+#include <ctype.h>
 
 #include "drm.h"
 #include "drmtest.h"
@@ -94,6 +95,7 @@ enum w_type {
 	TERMINATE,
 	SSEU,
 	WORKINGSET,
+	SKIP,
 };
 
 struct dep_entry {
@@ -930,6 +932,12 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if (field) {
 			fstart = NULL;
 
+			/* line starting with # is a comment */
+			if (field[0] == '#') {
+				step.type = SKIP;
+				goto add_step;
+			}
+
 			if (!strcmp(field, "d")) {
 				int_field(DELAY, delay, tmp <= 0,
 					  "Invalid delay at step %u!\n");
@@ -1194,7 +1202,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if (field) {
 			fstart = NULL;
 
-			check_arg(strlen(field) != 1 ||
+			check_arg(!strlen(field) ||
+				  (strlen(field) > 1 && !isspace(field[1]) && field[1] != '#') ||
 				  (field[0] != '0' && field[0] != '1'),
 				  "Invalid wait boolean at step %u!\n",
 				  nr_steps);
@@ -1208,18 +1217,23 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		step.type = BATCH;
 
 add_step:
-		if (step.type == DELAY)
-			step.delay = __duration(step.delay, scale_time);
+		if (step.type == SKIP) {
+			if (verbose > 3)
+				printf("skipped STEP: %s\n", _token);
+		} else {
+			if (step.type == DELAY)
+				step.delay = __duration(step.delay, scale_time);
 
-		step.idx = nr_steps++;
-		step.request = -1;
-		steps = realloc(steps, sizeof(step) * nr_steps);
-		igt_assert(steps);
+			step.idx = nr_steps++;
+			step.request = -1;
+			steps = realloc(steps, sizeof(step) * nr_steps);
+			igt_assert(steps);
 
-		memcpy(&steps[nr_steps - 1], &step, sizeof(step));
+			memcpy(&steps[nr_steps - 1], &step, sizeof(step));
+		}
 
 		free(token);
-	}
+	} // while ((_token = strtok_r(tstart, ",", &tctx))) {
 
 	if (app_w) {
 		steps = realloc(steps, sizeof(step) *
@@ -2304,6 +2318,8 @@ static void *run_workload(void *data)
 			enum intel_engine_id engine = w->engine;
 			int do_sleep = 0;
 
+			igt_assert(w->type != SKIP);
+
 			if (w->type == DELAY) {
 				do_sleep = w->delay;
 			} else if (w->type == PERIOD) {
@@ -2543,6 +2559,13 @@ static char *load_workload_descriptor(char *filename)
 	close(infd);
 
 	for (i = 0; i < len; i++) {
+		/* '#' starts comment till end of line */
+		if (buf[i] == '#')
+			/* replace ',' in comments to not break parsing */
+			while (++i < len && buf[i] != '\n')
+				if (buf[i] == ',')
+					buf[i] = ';';
+
 		if (buf[i] == '\n')
 			buf[i] = ',';
 	}
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index 8c71f2fe6..e4fd61645 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -1,6 +1,8 @@
 Workload descriptor format
 ==========================
 
+Lines starting with '#' are treated as comments (do not create work step).
+
 ctx.engine.duration_us.dependency.wait,...
 <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
 B.<uint>
-- 
2.30.2
