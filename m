Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C2010E48A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:31:42 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:22 +0000
Message-ID: <20231005185745.3056219-5-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/17] benchmarks/gem_wsim: extract duration
 parsing code to new function
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

Moved code from parse_workload to separate function.

v2:
- keep "field" parameter name (instead of "_desc") (Tvrtko)
- emit error messages from parse_duration, caller returns NULL
  on parse_duration failure  (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 70 ++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 9d9cbd9c2..91410d42d 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -860,6 +860,44 @@ static long __duration(long dur, double scale)
 	return round(scale * dur);
 }
 
+static int
+parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, char *field)
+{
+	char *sep = NULL;
+	long tmpl;
+
+	if (field[0] == '*') {
+		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
+			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
+			return -1;
+		}
+		dur->unbound = true;
+	} else {
+		tmpl = strtol(field, &sep, 10);
+		if (tmpl <= 0 || tmpl == LONG_MIN || tmpl == LONG_MAX) {
+			wsim_err("Invalid duration at step %u!\n", nr_steps);
+			return -1;
+		}
+
+		dur->min = __duration(tmpl, scale_dur);
+
+		if (sep && *sep == '-') {
+			tmpl = strtol(sep + 1, NULL, 10);
+			if (tmpl <= 0 || __duration(tmpl, scale_dur) <= dur->min ||
+			    tmpl == LONG_MIN || tmpl == LONG_MAX) {
+				wsim_err("Invalid maximum duration at step %u!\n", nr_steps);
+				return -1;
+			}
+
+			dur->max = __duration(tmpl, scale_dur);
+		} else {
+			dur->max = dur->min;
+		}
+	}
+
+	return 0;
+}
+
 #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
 	if ((field = strtok_r(fstart, ".", &fctx))) { \
 		tmp = atoi(field); \
@@ -1121,38 +1159,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
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
-				step.duration.unbound = true;
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
-						__duration(tmpl, scale_dur) <= step.duration.min ||
-						tmpl == LONG_MIN ||
-						tmpl == LONG_MAX,
-						"Invalid maximum duration at step %u!\n",
-						nr_steps);
-					step.duration.max = __duration(tmpl,
-								       scale_dur);
-				} else {
-					step.duration.max = step.duration.min;
-				}
-			}
+			if (parse_duration(nr_steps, &step.duration, scale_dur, field))
+				return NULL;
 
 			valid++;
 		}
-- 
2.42.0
