Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4A6E96D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:52 +0200
Message-Id: <20191217094800.30687-3-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 03/11] runner/resultgen: Extract finding
 begin/end pointers for test output to helpers
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

v2: Rebase

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 211 +++++++++++++++++++++++----------------------
 1 file changed, 109 insertions(+), 102 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index e14a31b8..f91c6884 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -431,6 +431,71 @@ static int find_subtest_idx(struct matches matches,
 	return find_subtest_idx_limited(matches, bufend, linekey, pattern, subtest_name, 0, matches.size);
 }
 
+static const char *find_subtest_begin_limit(struct matches matches,
+					    int begin_idx,
+					    int result_idx,
+					    const char *buf,
+					    const char *bufend)
+{
+	/* No matching output at all, include everything */
+	if (begin_idx < 0 && result_idx < 0)
+		return buf;
+
+	if (begin_idx < 0) {
+		/*
+		 * Subtest didn't start, but we have the
+		 * result. Probably because an igt_fixture
+		 * made it fail/skip.
+		 *
+		 * We go backwards one match from the result match,
+		 * and start from the next line.
+		 */
+		if (result_idx > 0)
+			return next_line(matches.items[result_idx - 1].where, bufend);
+		else
+			return buf;
+	}
+
+	/* Include all non-special output before the beginning line. */
+	if (begin_idx == 0)
+		return buf;
+
+	return next_line(matches.items[begin_idx - 1].where, bufend);
+}
+
+static const char *find_subtest_end_limit(struct matches matches,
+					  int begin_idx,
+					  int result_idx,
+					  const char *buf,
+					  const char *bufend)
+{
+	int k;
+
+	/* No matching output at all, include everything */
+	if (begin_idx < 0 && result_idx < 0)
+		return bufend;
+
+	if (result_idx < 0) {
+		/*
+		 * Incomplete result. Include all output up to the
+		 * next starting subtest, or the result of one.
+		 */
+		for (k = begin_idx + 1; k < matches.size; k++) {
+			if (matches.items[k].what == STARTING_SUBTEST ||
+			    matches.items[k].what == SUBTEST_RESULT)
+				return matches.items[k].where;
+		}
+
+		return bufend;
+	}
+
+	/* Include all non-special output to the next match, whatever it is. */
+	if (result_idx < matches.size - 1)
+		return matches.items[result_idx + 1].where;
+
+	return bufend;
+}
+
 static bool fill_from_output(int fd, const char *binary, const char *key,
 			     struct subtest_list *subtests,
 			     struct json_object *tests)
@@ -505,54 +570,8 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		begin_idx = find_subtest_idx(matches, bufend, STARTING_SUBTEST, PATTERN_BEGIN, subtests->subs[i].name);
 		result_idx = find_subtest_idx(matches, bufend, SUBTEST_RESULT, PATTERN_RESULT, subtests->subs[i].name);
 
-		if (begin_idx < 0 && result_idx < 0) {
-			/* No output at all */
-			beg = buf;
-			end = bufend;
-		} else if (begin_idx < 0) {
-			/*
-			 * Subtest didn't start, but we have the
-			 * result. Probably because an igt_fixture
-			 * made it fail/skip.
-			 *
-			 * Start the output right after the previous
-			 * subtest result/start.
-			 */
-			if (result_idx > 0)
-				beg = next_line(matches.items[result_idx - 1].where, bufend);
-			else
-				beg = buf;
-		} else {
-			/* Stretch output beginning backwards */
-			if (begin_idx == 0)
-				beg = buf;
-			else
-				beg = next_line(matches.items[begin_idx - 1].where, bufend);
-		}
-
-		if (result_idx < 0 && begin_idx < 0) {
-			/* No output at all: Already handled above */
-		} else if (result_idx < 0) {
-			/*
-			 * Incomplete result. Include output up to the
-			 * next starting subtest or result.
-			 */
-			for (k = begin_idx + 1; k < matches.size; k++) {
-				if (matches.items[k].what == STARTING_SUBTEST ||
-				    matches.items[k].what == SUBTEST_RESULT)
-					break;
-			}
-			if (k < matches.size)
-				end = matches.items[k].where;
-			else
-				end = bufend;
-		} else {
-			/* Stretch output to the next starting subtest or result. */
-			if (result_idx < matches.size - 1)
-				end = matches.items[result_idx + 1].where;
-			else
-				end = bufend;
-		}
+		beg = find_subtest_begin_limit(matches, begin_idx, result_idx, buf, bufend);
+		end = find_subtest_end_limit(matches, begin_idx, result_idx, buf, bufend);
 
 		json_object_object_add(current_test, key,
 				       json_object_new_string_len(beg, end - beg));
@@ -574,68 +593,56 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		 * the subtest output.
 		 */
 		if (result_idx < 0) {
-			/* If the subtest itself is incomplete, stop at the next start of a subtest */
+			/* If the subtest itself is incomplete, stop at the next start/end of a subtest */
 			for (result_idx = begin_idx + 1;
 			     result_idx < matches.size;
 			     result_idx++) {
-				if (matches.items[result_idx].what == STARTING_SUBTEST)
+				if (matches.items[result_idx].what == STARTING_SUBTEST ||
+				    matches.items[result_idx].what == SUBTEST_RESULT)
 					break;
 			}
 		}
 
 		for (k = begin_idx + 1; k < result_idx; k++) {
-			if (matches.items[k].what == STARTING_DYNAMIC_SUBTEST) {
-				struct json_object *current_dynamic_test = NULL;
-				int dyn_result_idx = -1;
-				char dynamic_name[256];
-				char dynamic_piglit_name[256];
-				const char *dynbeg, *dynend;
-
-				if (sscanf(matches.items[k].where + strlen(STARTING_DYNAMIC_SUBTEST), "%s", dynamic_name) != 1) {
-					/* Cannot parse name, just ignore this one */
-					continue;
-				}
-
-				dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
-
-				if (k == 0)
-					dynbeg = beg;
-				else
-					dynbeg = next_line(matches.items[k - 1].where, end);
-
-				if (dyn_result_idx < 0) {
-					if (k < matches.size - 1)
-						dynend = matches.items[k + 1].where;
-					else
-						dynend = end;
-				} else {
-					if (dyn_result_idx < matches.size - 1)
-						dynend = matches.items[dyn_result_idx + 1].where;
-					else
-						dynend = end;
-				}
-
-				generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
-
-				add_dynamic_subtest(&subtests->subs[i], strdup(dynamic_name));
-				current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
-
-				json_object_object_add(current_dynamic_test, key,
-						       json_object_new_string_len(dynbeg, dynend - dynbeg));
-				add_igt_version(current_dynamic_test, igt_version, igt_version_len);
-
-				if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
-					const char *dynresulttext;
-					double dyntime;
-
-					parse_subtest_result(dynamic_name,
-							     DYNAMIC_SUBTEST_RESULT,
-							     &dynresulttext, &dyntime,
-							     dyn_result_idx < 0 ? NULL : matches.items[dyn_result_idx].where,
-							     dynend);
-					set_result(current_dynamic_test, dynresulttext);
-					set_runtime(current_dynamic_test, dyntime);
-				}
+			struct json_object *current_dynamic_test = NULL;
+			int dyn_result_idx = -1;
+			char dynamic_name[256];
+			char dynamic_piglit_name[256];
+			const char *dynbeg, *dynend;
+
+			if (matches.items[k].what != STARTING_DYNAMIC_SUBTEST)
+				continue;
+
+			if (sscanf(matches.items[k].where + strlen(STARTING_DYNAMIC_SUBTEST), "%s", dynamic_name) != 1) {
+				/* Cannot parse name, just ignore this one */
+				continue;
+			}
+
+			dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
+
+			dynbeg = find_subtest_begin_limit(matches, k, dyn_result_idx, beg, end);
+			dynend = find_subtest_end_limit(matches, k, dyn_result_idx, beg, end);
+
+			generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
+
+			add_dynamic_subtest(&subtests->subs[i], strdup(dynamic_name));
+			current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
+
+			json_object_object_add(current_dynamic_test, key,
+					       json_object_new_string_len(dynbeg, dynend - dynbeg));
+			add_igt_version(current_dynamic_test, igt_version, igt_version_len);
+
+			if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
+				const char *dynresulttext;
+				double dyntime;
+
+				parse_subtest_result(dynamic_name,
+						     DYNAMIC_SUBTEST_RESULT,
+						     &dynresulttext, &dyntime,
+						     dyn_result_idx < 0 ? NULL : matches.items[dyn_result_idx].where,
+						     dynend);
+				set_result(current_dynamic_test, dynresulttext);
+				set_runtime(current_dynamic_test, dyntime);
 			}
 		}
 	}
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
