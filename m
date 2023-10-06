Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E9810E0B0
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 16:40:55 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:06:43 +0000
Message-ID: <20231006160654.3220198-10-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
References: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/17] benchmarks/gem_wsim: allow comments
 in workload description files
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

v2:
- SKIP step type is not needed (Tvrtko)
v3:
- correct README comment (Tvrtko)
- removed hunk for trailing comments after BATCH step,
  as some other steps do not support it either (Tvrtko)
v4:
- correct out of bound access if file ends with hash (Tvrtko)
v5:
- updated comment (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c  | 22 +++++++++++++++++++++-
 benchmarks/wsim/README |  2 ++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 2a1991ca6..690566ecd 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -43,6 +43,7 @@
 #include <limits.h>
 #include <pthread.h>
 #include <math.h>
+#include <ctype.h>
 
 #include "drm.h"
 #include "drmtest.h"
@@ -813,6 +814,14 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 		if (field) {
 			fstart = NULL;
 
+			/* line starting with # is a comment */
+			if (field[0] == '#') {
+				if (verbose > 3)
+					printf("skipped line: %s\n", _token);
+				free(token);
+				continue;
+			}
+
 			if (!strcmp(field, "d")) {
 				int_field(DELAY, delay, tmp <= 0,
 					  "Invalid delay at step %u!\n");
@@ -2403,6 +2412,7 @@ static char *load_workload_descriptor(char *filename)
 	char *buf;
 	int infd, ret, i;
 	ssize_t len;
+	bool in_comment = false;
 
 	ret = stat(filename, &sbuf);
 	if (ret || !S_ISREG(sbuf.st_mode))
@@ -2419,8 +2429,18 @@ static char *load_workload_descriptor(char *filename)
 	close(infd);
 
 	for (i = 0; i < len; i++) {
-		if (buf[i] == '\n')
+		/*
+		 * Lines starting with '#' are skipped.
+		 * If command line step separator (',') is encountered after '#'
+		 * it is replaced with ';' to not break parsing.
+		 */
+		if (buf[i] == '#')
+			in_comment = true;
+		else if (buf[i] == '\n') {
 			buf[i] = ',';
+			in_comment = false;
+		} else if (in_comment && buf[i] == ',')
+			buf[i] = ';';
 	}
 
 	len--;
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index 8c71f2fe6..d4f3dd8ae 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -1,6 +1,8 @@
 Workload descriptor format
 ==========================
 
+Lines starting with '#' are treated as comments and will not create a work step.
+
 ctx.engine.duration_us.dependency.wait,...
 <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
 B.<uint>
-- 
2.42.0
