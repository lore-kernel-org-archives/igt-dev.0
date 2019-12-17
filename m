Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82E6E964
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:54 +0200
Message-Id: <20191217094800.30687-5-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 05/11] runner/resultgen: Extrude dynamic
 subtest result texts
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The first dynamic part now starts its reported output at the beginning
of its subtest's output, and the last dynamic part ends its reported
output at the end of its subtest's output.

v2: Rebase

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 64 ++++++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 4a5d329c..ed61b922 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -431,17 +431,18 @@ static int find_subtest_idx(struct matches matches,
 	return find_subtest_idx_limited(matches, bufend, linekey, pattern, subtest_name, 0, matches.size);
 }
 
-static const char *find_subtest_begin_limit(struct matches matches,
-					    int begin_idx,
-					    int result_idx,
-					    const char *buf,
-					    const char *bufend)
+static const char *find_subtest_begin_limit_limited(struct matches matches,
+						    int begin_idx,
+						    int result_idx,
+						    const char *buf,
+						    const char *bufend,
+						    int first_idx)
 {
 	/* No matching output at all, include everything */
-	if (begin_idx < 0 && result_idx < 0)
+	if (begin_idx < first_idx && result_idx < first_idx)
 		return buf;
 
-	if (begin_idx < 0) {
+	if (begin_idx < first_idx) {
 		/*
 		 * Subtest didn't start, but we have the
 		 * result. Probably because an igt_fixture
@@ -450,37 +451,48 @@ static const char *find_subtest_begin_limit(struct matches matches,
 		 * We go backwards one match from the result match,
 		 * and start from the next line.
 		 */
-		if (result_idx > 0)
+		if (result_idx > first_idx)
 			return next_line(matches.items[result_idx - 1].where, bufend);
 		else
 			return buf;
 	}
 
 	/* Include all non-special output before the beginning line. */
-	if (begin_idx == 0)
+	if (begin_idx <= first_idx)
 		return buf;
 
 	return next_line(matches.items[begin_idx - 1].where, bufend);
 }
 
-static const char *find_subtest_end_limit(struct matches matches,
-					  int begin_idx,
-					  int result_idx,
-					  const char *buf,
-					  const char *bufend)
+static const char *find_subtest_begin_limit(struct matches matches,
+					    int begin_idx,
+					    int result_idx,
+					    const char *buf,
+					    const char *bufend)
+{
+	return find_subtest_begin_limit_limited(matches, begin_idx, result_idx, buf, bufend, 0);
+}
+
+static const char *find_subtest_end_limit_limited(struct matches matches,
+						  int begin_idx,
+						  int result_idx,
+						  const char *buf,
+						  const char *bufend,
+						  int first_idx,
+						  int last_idx)
 {
 	int k;
 
 	/* No matching output at all, include everything */
-	if (begin_idx < 0 && result_idx < 0)
+	if (begin_idx < first_idx && result_idx < first_idx)
 		return bufend;
 
-	if (result_idx < 0) {
+	if (result_idx < first_idx) {
 		/*
 		 * Incomplete result. Include all output up to the
 		 * next starting subtest, or the result of one.
 		 */
-		for (k = begin_idx + 1; k < matches.size; k++) {
+		for (k = begin_idx + 1; k < last_idx; k++) {
 			if (matches.items[k].what == STARTING_SUBTEST ||
 			    matches.items[k].what == SUBTEST_RESULT)
 				return matches.items[k].where;
@@ -490,12 +502,21 @@ static const char *find_subtest_end_limit(struct matches matches,
 	}
 
 	/* Include all non-special output to the next match, whatever it is. */
-	if (result_idx < matches.size - 1)
+	if (result_idx < last_idx - 1)
 		return matches.items[result_idx + 1].where;
 
 	return bufend;
 }
 
+static const char *find_subtest_end_limit(struct matches matches,
+					  int begin_idx,
+					  int result_idx,
+					  const char *buf,
+					  const char *bufend)
+{
+	return find_subtest_end_limit_limited(matches, begin_idx, result_idx, buf, bufend, 0, matches.size);
+}
+
 static void process_dynamic_subtest_output(const char *piglit_name,
 					   const char *igt_version,
 					   size_t igt_version_len,
@@ -538,8 +559,8 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 
 		dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
 
-		dynbeg = find_subtest_begin_limit(matches, k, dyn_result_idx, beg, end);
-		dynend = find_subtest_end_limit(matches, k, dyn_result_idx, beg, end);
+		dynbeg = find_subtest_begin_limit_limited(matches, k, dyn_result_idx, beg, end, begin_idx + 1);
+		dynend = find_subtest_end_limit_limited(matches, k, dyn_result_idx, beg, end, begin_idx + 1, result_idx);
 
 		generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
 
@@ -938,8 +959,7 @@ static bool fill_from_dmesg(int fd,
 			}
 		}
 		append_line(&dmesg, &dmesglen, formatted);
-		if (current_test != NULL)
-			append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
+		append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
 		free(formatted);
 	}
 	free(line);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
