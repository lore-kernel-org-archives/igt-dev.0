Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D896E964
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:50:57 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:58 +0200
Message-Id: <20191217094800.30687-9-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/11] runner/resultgen: Don't report
 subtest result if it has dynamic subtests
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index f93a673c..2c8a55da 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1155,6 +1155,22 @@ static void fill_from_journal(int fd,
 	fclose(f);
 }
 
+static void prune_subtests_with_dynamic_subtests(const char *binary,
+						 struct subtest_list *subtests,
+						 struct json_object *tests)
+{
+	char piglit_name[256];
+	size_t i;
+
+	for (i = 0; i < subtests->size; i++) {
+		if (subtests->subs[i].dynamic_size) {
+			generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
+			json_object_object_del(tests, piglit_name);
+		}
+
+	}
+}
+
 static bool stderr_contains_warnings(const char *beg, const char *end)
 {
 	struct match_needle needles[] = {
@@ -1225,8 +1241,10 @@ static void override_results(char *binary,
 
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
-		obj = get_or_create_json_object(tests, piglit_name);
-		override_result_single(obj);
+		if (subtests->subs[i].dynamic_size == 0) {
+			obj = get_or_create_json_object(tests, piglit_name);
+			override_result_single(obj);
+		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
@@ -1307,15 +1325,18 @@ static void add_to_totals(const char *binary,
 
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
-		test = get_or_create_json_object(results->tests, piglit_name);
-		if (!json_object_object_get_ex(test, "result", &resultobj)) {
-			fprintf(stderr, "Warning: No results set for %s\n", piglit_name);
-			return;
+
+		if (subtests->subs[i].dynamic_size == 0) {
+			test = get_or_create_json_object(results->tests, piglit_name);
+			if (!json_object_object_get_ex(test, "result", &resultobj)) {
+				fprintf(stderr, "Warning: No results set for %s\n", piglit_name);
+				return;
+			}
+			result = json_object_get_string(resultobj);
+			add_result_to_totals(emptystrtotal, result);
+			add_result_to_totals(roottotal, result);
+			add_result_to_totals(binarytotal, result);
 		}
-		result = json_object_get_string(resultobj);
-		add_result_to_totals(emptystrtotal, result);
-		add_result_to_totals(roottotal, result);
-		add_result_to_totals(binarytotal, result);
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
@@ -1362,6 +1383,8 @@ static bool parse_test_directory(int dirfd,
 		goto parse_output_end;
 	}
 
+	prune_subtests_with_dynamic_subtests(entry->binary, &subtests, results->tests);
+
 	override_results(entry->binary, &subtests, results->tests);
 	add_to_totals(entry->binary, &subtests, results);
 
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
