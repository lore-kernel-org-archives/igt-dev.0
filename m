Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C56E96C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:53 +0200
Message-Id: <20191217094800.30687-4-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 04/11] runner/resultgen: Hoist handling
 of dynamic subtest output to a helper
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
 runner/resultgen.c | 136 ++++++++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 58 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index f91c6884..4a5d329c 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -496,6 +496,75 @@ static const char *find_subtest_end_limit(struct matches matches,
 	return bufend;
 }
 
+static void process_dynamic_subtest_output(const char *piglit_name,
+					   const char *igt_version,
+					   size_t igt_version_len,
+					   struct matches matches,
+					   int begin_idx,
+					   int result_idx,
+					   const char *beg,
+					   const char *end,
+					   const char *key,
+					   struct json_object *tests,
+					   struct subtest *subtest)
+{
+	size_t k;
+
+	if (result_idx < 0) {
+		/* If the subtest itself is incomplete, stop at the next start/end of a subtest */
+		for (result_idx = begin_idx + 1;
+		     result_idx < matches.size;
+		     result_idx++) {
+			if (matches.items[result_idx].what == STARTING_SUBTEST ||
+			    matches.items[result_idx].what == SUBTEST_RESULT)
+				break;
+		}
+	}
+
+	for (k = begin_idx + 1; k < result_idx; k++) {
+		struct json_object *current_dynamic_test = NULL;
+		int dyn_result_idx = -1;
+		char dynamic_name[256];
+		char dynamic_piglit_name[256];
+		const char *dynbeg, *dynend;
+
+		if (matches.items[k].what != STARTING_DYNAMIC_SUBTEST)
+			continue;
+
+		if (sscanf(matches.items[k].where + strlen(STARTING_DYNAMIC_SUBTEST), "%s", dynamic_name) != 1) {
+			/* Cannot parse name, just ignore this one */
+			continue;
+		}
+
+		dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
+
+		dynbeg = find_subtest_begin_limit(matches, k, dyn_result_idx, beg, end);
+		dynend = find_subtest_end_limit(matches, k, dyn_result_idx, beg, end);
+
+		generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
+
+		add_dynamic_subtest(subtest, strdup(dynamic_name));
+		current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
+
+		json_object_object_add(current_dynamic_test, key,
+				       json_object_new_string_len(dynbeg, dynend - dynbeg));
+		add_igt_version(current_dynamic_test, igt_version, igt_version_len);
+
+		if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
+			const char *dynresulttext;
+			double dyntime;
+
+			parse_subtest_result(dynamic_name,
+					     DYNAMIC_SUBTEST_RESULT,
+					     &dynresulttext, &dyntime,
+					     dyn_result_idx < 0 ? NULL : matches.items[dyn_result_idx].where,
+					     dynend);
+			set_result(current_dynamic_test, dynresulttext);
+			set_runtime(current_dynamic_test, dyntime);
+		}
+	}
+}
+
 static bool fill_from_output(int fd, const char *binary, const char *key,
 			     struct subtest_list *subtests,
 			     struct json_object *tests)
@@ -514,7 +583,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		NULL
 	};
 	struct matches matches = {};
-	size_t i, k;
+	size_t i;
 
 	if (fstat(fd, &statbuf))
 		return false;
@@ -588,63 +657,14 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 			set_runtime(current_test, time);
 		}
 
-		/*
-		 * Look for dynamic subtests: If any, they are within
-		 * the subtest output.
-		 */
-		if (result_idx < 0) {
-			/* If the subtest itself is incomplete, stop at the next start/end of a subtest */
-			for (result_idx = begin_idx + 1;
-			     result_idx < matches.size;
-			     result_idx++) {
-				if (matches.items[result_idx].what == STARTING_SUBTEST ||
-				    matches.items[result_idx].what == SUBTEST_RESULT)
-					break;
-			}
-		}
-
-		for (k = begin_idx + 1; k < result_idx; k++) {
-			struct json_object *current_dynamic_test = NULL;
-			int dyn_result_idx = -1;
-			char dynamic_name[256];
-			char dynamic_piglit_name[256];
-			const char *dynbeg, *dynend;
-
-			if (matches.items[k].what != STARTING_DYNAMIC_SUBTEST)
-				continue;
-
-			if (sscanf(matches.items[k].where + strlen(STARTING_DYNAMIC_SUBTEST), "%s", dynamic_name) != 1) {
-				/* Cannot parse name, just ignore this one */
-				continue;
-			}
-
-			dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
-
-			dynbeg = find_subtest_begin_limit(matches, k, dyn_result_idx, beg, end);
-			dynend = find_subtest_end_limit(matches, k, dyn_result_idx, beg, end);
-
-			generate_piglit_name_for_dynamic(piglit_name, dynamic_name, dynamic_piglit_name, sizeof(dynamic_piglit_name));
-
-			add_dynamic_subtest(&subtests->subs[i], strdup(dynamic_name));
-			current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
-
-			json_object_object_add(current_dynamic_test, key,
-					       json_object_new_string_len(dynbeg, dynend - dynbeg));
-			add_igt_version(current_dynamic_test, igt_version, igt_version_len);
-
-			if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
-				const char *dynresulttext;
-				double dyntime;
-
-				parse_subtest_result(dynamic_name,
-						     DYNAMIC_SUBTEST_RESULT,
-						     &dynresulttext, &dyntime,
-						     dyn_result_idx < 0 ? NULL : matches.items[dyn_result_idx].where,
-						     dynend);
-				set_result(current_dynamic_test, dynresulttext);
-				set_runtime(current_dynamic_test, dyntime);
-			}
-		}
+		process_dynamic_subtest_output(piglit_name,
+					       igt_version, igt_version_len,
+					       matches,
+					       begin_idx, result_idx,
+					       beg, end,
+					       key,
+					       tests,
+					       &subtests->subs[i]);
 	}
 
 	free_matches(&matches);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
