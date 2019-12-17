Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3F26E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:51 +0200
Message-Id: <20191217094800.30687-2-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 02/11] runner/resultgen: Extract finding
 begin/end lines for a subtest to a helper
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

v2: Use an enum to select a pattern string for asprintf (Arek)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 106 +++++++++++++++++++++++++--------------------
 1 file changed, 58 insertions(+), 48 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 31bc0bb1..e14a31b8 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -376,6 +376,61 @@ static void add_igt_version(struct json_object *testobj,
 
 }
 
+enum subtest_find_pattern {
+	PATTERN_BEGIN,
+	PATTERN_RESULT,
+};
+
+static int find_subtest_idx_limited(struct matches matches,
+				    const char *bufend,
+				    const char *linekey,
+				    enum subtest_find_pattern pattern,
+				    const char *subtest_name,
+				    int first,
+				    int last)
+{
+	char *full_line;
+	int line_len;
+	int k;
+
+	switch (pattern) {
+	case PATTERN_BEGIN:
+		line_len = asprintf(&full_line, "%s%s\n", linekey, subtest_name);
+		break;
+	case PATTERN_RESULT:
+		line_len = asprintf(&full_line, "%s%s: ", linekey, subtest_name);
+		break;
+	default:
+		assert(!"Unknown pattern");
+	}
+
+	if (line_len < 0)
+		return -1;
+
+	for (k = first; k < last; k++)
+		if (matches.items[k].what == linekey &&
+		    !memcmp(matches.items[k].where,
+			    full_line,
+			    min(line_len, bufend - matches.items[k].where)))
+			break;
+
+	free(full_line);
+
+	if (k == last)
+		k = -1;
+
+	return k;
+}
+
+static int find_subtest_idx(struct matches matches,
+			    const char *bufend,
+			    const char *linekey,
+			    enum subtest_find_pattern pattern,
+			    const char *subtest_name)
+{
+	return find_subtest_idx_limited(matches, bufend, linekey, pattern, subtest_name, 0, matches.size);
+}
+
 static bool fill_from_output(int fd, const char *binary, const char *key,
 			     struct subtest_list *subtests,
 			     struct json_object *tests)
@@ -439,44 +494,16 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 	matches = find_matches(buf, bufend, needles);
 
 	for (i = 0; i < subtests->size; i++) {
-		char *this_sub_begin, *this_sub_result;
 		int begin_idx = -1, result_idx = -1;
 		const char *resulttext;
 		const char *beg, *end;
 		double time;
-		int begin_len;
-		int result_len;
 
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 
-		begin_len = asprintf(&this_sub_begin, "%s%s\n", STARTING_SUBTEST, subtests->subs[i].name);
-		result_len = asprintf(&this_sub_result, "%s%s: ", SUBTEST_RESULT, subtests->subs[i].name);
-
-		if (begin_len < 0 || result_len < 0) {
-			fprintf(stderr, "Failure generating strings\n");
-			return false;
-		}
-
-		for (k = 0; k < matches.size; k++) {
-			if (matches.items[k].what == STARTING_SUBTEST &&
-			    !memcmp(matches.items[k].where,
-				    this_sub_begin,
-				    min(begin_len, bufend - matches.items[k].where))) {
-				beg = matches.items[k].where;
-				begin_idx = k;
-			}
-			if (matches.items[k].what == SUBTEST_RESULT &&
-			    !memcmp(matches.items[k].where,
-				    this_sub_result,
-				    min(result_len, bufend - matches.items[k].where))) {
-				end = matches.items[k].where;
-				result_idx = k;
-			}
-		}
-
-		free(this_sub_begin);
-		free(this_sub_result);
+		begin_idx = find_subtest_idx(matches, bufend, STARTING_SUBTEST, PATTERN_BEGIN, subtests->subs[i].name);
+		result_idx = find_subtest_idx(matches, bufend, SUBTEST_RESULT, PATTERN_RESULT, subtests->subs[i].name);
 
 		if (begin_idx < 0 && result_idx < 0) {
 			/* No output at all */
@@ -562,31 +589,14 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 				int dyn_result_idx = -1;
 				char dynamic_name[256];
 				char dynamic_piglit_name[256];
-				char *this_dyn_result;
-				int dyn_result_len;
 				const char *dynbeg, *dynend;
-				int n;
 
 				if (sscanf(matches.items[k].where + strlen(STARTING_DYNAMIC_SUBTEST), "%s", dynamic_name) != 1) {
 					/* Cannot parse name, just ignore this one */
 					continue;
 				}
 
-				dyn_result_len = asprintf(&this_dyn_result, "%s%s: ", DYNAMIC_SUBTEST_RESULT, dynamic_name);
-				if (dyn_result_len < 0)
-					continue;
-
-				for (n = k + 1; n < result_idx; n++) {
-					if (matches.items[n].what == DYNAMIC_SUBTEST_RESULT &&
-					    !memcmp(matches.items[n].where,
-						    this_dyn_result,
-						    min(dyn_result_len, bufend - matches.items[n].where))) {
-						dyn_result_idx = n;
-						break;
-					}
-				}
-
-				free(this_dyn_result);
+				dyn_result_idx = find_subtest_idx_limited(matches, end, DYNAMIC_SUBTEST_RESULT, PATTERN_RESULT, dynamic_name, k, result_idx);
 
 				if (k == 0)
 					dynbeg = beg;
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
