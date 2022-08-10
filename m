Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33890AF23B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 13:55:46 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 15:55:28 +0200
Message-Id: <20220810135530.992455-2-ryszard.knop@intel.com>
In-Reply-To: <20220810135530.992455-1-ryszard.knop@intel.com>
References: <20220810135530.992455-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] runner: Use Jansson in resultgen
 instead of json-c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The json-c library has a hard limit of 2GB of its output. While normally
it's not a problem, some very verbose edge cases make the results.json
output go past that limit.

Jansson has a similar API, can work with files over 2GB and, according
to JSON library and benchmarks, is slightly slower but uses less RAM to
serialize its output. Jansson 2.12+ (released in 2018) is required.

This commit also updates tests to use Jansson, but they need data fixups
to pass (in the next commit).

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/meson.build         |  12 +-
 runner/resultgen.c         | 349 +++++++++++++++++--------------------
 runner/resultgen.h         |   2 +-
 runner/runner_json_tests.c | 129 +++++---------
 runner/runner_tests.c      |  60 +++----
 5 files changed, 247 insertions(+), 305 deletions(-)

diff --git a/runner/meson.build b/runner/meson.build
index c3927af5..4e25f70a 100644
--- a/runner/meson.build
+++ b/runner/meson.build
@@ -13,8 +13,8 @@ results_sources = [ 'results.c' ]
 runner_test_sources = [ 'runner_tests.c' ]
 runner_json_test_sources = [ 'runner_json_tests.c' ]
 
-jsonc = dependency('json-c', required: build_runner)
-runner_deps = [jsonc, glib]
+jansson = dependency('jansson', required: build_runner, version: '>=2.12')
+runner_deps = [jansson, glib]
 runner_c_args = []
 
 liboping = dependency('liboping', required: get_option('oping'))
@@ -23,11 +23,11 @@ if liboping.found()
 	runner_c_args += '-DHAVE_OPING=1'
 endif
 
-if not build_tests and jsonc.found()
+if not build_tests and jansson.found()
 	error('Building test runner requires building tests')
 endif
 
-if jsonc.found()
+if jansson.found()
 	subdir('testdata')
 
 	runnerlib = static_library('igt_runner', runnerlib_sources,
@@ -60,14 +60,14 @@ if jsonc.found()
 				 c_args : '-DTESTDATA_DIRECTORY="@0@"'.format(testdata_dir),
 				 link_with : runnerlib,
 				 install : false,
-				 dependencies : [igt_deps, jsonc])
+				 dependencies : [igt_deps, jansson])
 	test('runner', runner_test, timeout : 300)
 
 	runner_json_test = executable('runner_json_test', runner_json_test_sources,
 				      c_args : '-DJSON_TESTS_DIRECTORY="@0@"'.format(join_paths(meson.current_source_dir(), 'json_tests_data')),
 				      link_with : runnerlib,
 				      install : false,
-				      dependencies : [igt_deps, jsonc])
+				      dependencies : [igt_deps, jansson])
 	test('runner_json', runner_json_test, timeout : 300)
 
 	build_info += 'Build test runner: true'
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 479d6d4f..eda31267 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -5,10 +5,9 @@
 #include <string.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
-#include <json.h>
+#include <jansson.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
@@ -40,9 +39,9 @@ struct subtest_list
 
 struct results
 {
-	struct json_object *tests;
-	struct json_object *totals;
-	struct json_object *runtimes;
+	struct json_t *tests;
+	struct json_t *totals;
+	struct json_t *runtimes;
 };
 
 static void add_dynamic_subtest(struct subtest *subtest, char *dynamic)
@@ -257,61 +256,54 @@ static void parse_subtest_result(const char *subtest,
 	parse_result_string(resultstring, linelen - (resultstring - line), result, time);
 }
 
-static struct json_object *get_or_create_json_object(struct json_object *base,
-						     const char *key)
+static struct json_t *get_or_create_json_object(struct json_t *base, const char *key)
 {
-	struct json_object *ret;
+	struct json_t *ret = json_object_get(base, key);
 
-	if (json_object_object_get_ex(base, key, &ret))
+	if (ret)
 		return ret;
 
-	ret = json_object_new_object();
-	json_object_object_add(base, key, ret);
+	ret = json_object();
+	json_object_set_new(base, key, ret);
 
 	return ret;
 }
 
-static void set_result(struct json_object *obj, const char *result)
+static void set_result(struct json_t *obj, const char *result)
 {
-	if (result)
-		json_object_object_add(obj, "result",
-				       json_object_new_string(result));
+	if (!result)
+		return;
+
+	json_object_set_new(obj, "result", json_string(result));
 }
 
-static void add_runtime(struct json_object *obj, double time)
+static void add_runtime(struct json_t *obj, double time)
 {
 	double oldtime;
-	struct json_object *timeobj = get_or_create_json_object(obj, "time");
-	struct json_object *oldend;
+	struct json_t *timeobj = get_or_create_json_object(obj, "time");
+	struct json_t *oldend;
 
-	json_object_object_add(timeobj, "__type__",
-			       json_object_new_string("TimeAttribute"));
-	json_object_object_add(timeobj, "start",
-			       json_object_new_double(0.0));
+	json_object_set_new(timeobj, "__type__", json_string("TimeAttribute"));
+	json_object_set_new(timeobj, "start", json_real(0.0));
 
-	if (!json_object_object_get_ex(timeobj, "end", &oldend)) {
-		json_object_object_add(timeobj, "end",
-				       json_object_new_double(time));
+	if (!(oldend = json_object_get(timeobj, "end"))) {
+		json_object_set_new(timeobj, "end", json_real(time));
 		return;
 	}
 
 	/* Add the runtime to the existing runtime. */
-	oldtime = json_object_get_double(oldend);
+	oldtime = json_real_value(oldend);
 	time += oldtime;
-	json_object_object_add(timeobj, "end",
-			       json_object_new_double(time));
+	json_object_set_new(timeobj, "end", json_real(time));
 }
 
-static void set_runtime(struct json_object *obj, double time)
+static void set_runtime(struct json_t *obj, double time)
 {
-	struct json_object *timeobj = get_or_create_json_object(obj, "time");
-
-	json_object_object_add(timeobj, "__type__",
-			       json_object_new_string("TimeAttribute"));
-	json_object_object_add(timeobj, "start",
-			       json_object_new_double(0.0));
-	json_object_object_add(timeobj, "end",
-			       json_object_new_double(time));
+	struct json_t *timeobj = get_or_create_json_object(obj, "time");
+
+	json_object_set_new(timeobj, "__type__", json_string("TimeAttribute"));
+	json_object_set_new(timeobj, "start", json_real(0.0));
+	json_object_set_new(timeobj, "end", json_real(time));
 }
 
 struct match_item
@@ -396,7 +388,7 @@ static bool is_subtest_result_line(const char *needle, const char *line, const c
 	if (line >= bufend || *line++ != ':')
 		return false;
 
-	if (line >= bufend || *line++ != ' ')
+	if (line >= bufend || *line != ' ')
 		return false;
 
 	return true;
@@ -407,9 +399,9 @@ static void free_matches(struct matches *matches)
 	free(matches->items);
 }
 
-static struct json_object *new_escaped_json_string(const char *buf, size_t len)
+static struct json_t *escaped_json_stringn(const char *buf, size_t len)
 {
-	struct json_object *obj;
+	struct json_t *obj;
 	char *str = NULL;
 	size_t strsize = 0;
 	size_t i;
@@ -435,19 +427,18 @@ static struct json_object *new_escaped_json_string(const char *buf, size_t len)
 		}
 	}
 
-	obj = json_object_new_string_len(str, strsize);
+	obj = json_stringn(str, strsize);
 	free(str);
 
 	return obj;
 }
 
-static void add_igt_version(struct json_object *testobj,
+static void add_igt_version(struct json_t *testobj,
 			    const char *igt_version,
 			    size_t igt_version_len)
 {
 	if (igt_version)
-		json_object_object_add(testobj, "igt-version",
-				       new_escaped_json_string(igt_version, igt_version_len));
+		json_object_set_new(testobj, "igt-version", escaped_json_stringn(igt_version, igt_version_len));
 }
 
 enum subtest_find_pattern {
@@ -603,7 +594,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 					   const char *beg,
 					   const char *end,
 					   const char *key,
-					   struct json_object *tests,
+					   struct json_t *tests,
 					   struct subtest *subtest)
 {
 	size_t k;
@@ -620,7 +611,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 	}
 
 	for (k = begin_idx + 1; k < result_idx; k++) {
-		struct json_object *current_dynamic_test = NULL;
+		struct json_t *current_dynamic_test = NULL;
 		int dyn_result_idx;
 		char dynamic_name[256];
 		char dynamic_piglit_name[256];
@@ -644,11 +635,10 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 		add_dynamic_subtest(subtest, strdup(dynamic_name));
 		current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
 
-		json_object_object_add(current_dynamic_test, key,
-				       new_escaped_json_string(dynbeg, dynend - dynbeg));
+		json_object_set_new(current_dynamic_test, key, escaped_json_stringn(dynbeg, dynend - dynbeg));
 		add_igt_version(current_dynamic_test, igt_version, igt_version_len);
 
-		if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
+		if (!json_object_get(current_dynamic_test, "result")) {
 			const char *dynresulttext;
 			double dyntime;
 
@@ -667,11 +657,11 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 			 * attribute this status to our subsubtest.
 			 */
 			if (!strcmp(dynresulttext, "incomplete")) {
-				struct json_object *parent_subtest;
+				struct json_t *parent_subtest;
 
-				if (json_object_object_get_ex(tests, piglit_name, &parent_subtest) &&
-				    json_object_object_get_ex(parent_subtest, "result", &parent_subtest)) {
-					const char *resulttext = json_object_get_string(parent_subtest);
+				if ((parent_subtest = json_object_get(tests, piglit_name)) &&
+				    (parent_subtest = json_object_get(parent_subtest, "result"))) {
+					const char *resulttext = json_string_value(parent_subtest);
 
 					if (!strcmp(resulttext, "abort") ||
 					    !strcmp(resulttext, "notrun"))
@@ -687,14 +677,14 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 
 static bool fill_from_output(int fd, const char *binary, const char *key,
 			     struct subtest_list *subtests,
-			     struct json_object *tests)
+			     struct json_t *tests)
 {
 	char *buf, *bufend, *nullchr;
 	struct stat statbuf;
 	char piglit_name[256];
 	char *igt_version = NULL;
 	size_t igt_version_len = 0;
-	struct json_object *current_test = NULL;
+	struct json_t *current_test = NULL;
 	struct match_needle needles[] = {
 		{ STARTING_SUBTEST, NULL },
 		{ SUBTEST_RESULT, is_subtest_result_line },
@@ -738,8 +728,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 
-		json_object_object_add(current_test, key,
-				       new_escaped_json_string(buf, statbuf.st_size));
+		json_object_set_new(current_test, key, escaped_json_stringn(buf, statbuf.st_size));
 		add_igt_version(current_test, igt_version, igt_version_len);
 
 		return true;
@@ -762,12 +751,11 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		beg = find_subtest_begin_limit(matches, begin_idx, result_idx, buf, bufend);
 		end = find_subtest_end_limit(matches, begin_idx, result_idx, buf, bufend);
 
-		json_object_object_add(current_test, key,
-				       new_escaped_json_string(beg, end - beg));
+		json_object_set_new(current_test, key, escaped_json_stringn(beg, end - beg));
 
 		add_igt_version(current_test, igt_version, igt_version_len);
 
-		if (!json_object_object_get_ex(current_test, "result", NULL)) {
+		if (!json_object_get(current_test, "result")) {
 			parse_subtest_result(subtests->subs[i].name,
 					     SUBTEST_RESULT,
 					     &resulttext, &time,
@@ -917,24 +905,22 @@ static void generate_formatted_dmesg_line(char *message,
 	*f = '\0';
 }
 
-static void add_dmesg(struct json_object *obj,
+static void add_dmesg(struct json_t *obj,
 		      const char *dmesg, size_t dmesglen,
 		      const char *warnings, size_t warningslen)
 {
-	json_object_object_add(obj, "dmesg",
-			       new_escaped_json_string(dmesg, dmesglen));
+	json_object_set_new(obj, "dmesg", escaped_json_stringn(dmesg, dmesglen));
 
-	if (warnings) {
-		json_object_object_add(obj, "dmesg-warnings",
-				       new_escaped_json_string(warnings, warningslen));
-	}
+	if (warnings)
+		json_object_set_new(obj, "dmesg-warnings",
+				    escaped_json_stringn(warnings, warningslen));
 }
 
-static void add_empty_dmesgs_where_missing(struct json_object *tests,
+static void add_empty_dmesgs_where_missing(struct json_t *tests,
 					   char *binary,
 					   struct subtest_list *subtests)
 {
-	struct json_object *current_test;
+	struct json_t *current_test;
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
 	size_t i, k;
@@ -942,7 +928,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
-		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
+		if (!json_object_get(current_test, "dmesg")) {
 			add_dmesg(current_test, "", 0, NULL, 0);
 		}
 
@@ -950,7 +936,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
-			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
+			if (!json_object_get(current_test, "dmesg")) {
 				add_dmesg(current_test, "", 0, NULL, 0);
 			}
 		}
@@ -962,7 +948,7 @@ static bool fill_from_dmesg(int fd,
 			    struct settings *settings,
 			    char *binary,
 			    struct subtest_list *subtests,
-			    struct json_object *tests)
+			    struct json_t *tests)
 {
 	char *line = NULL;
 	char *warnings = NULL, *dynamic_warnings = NULL;
@@ -970,8 +956,8 @@ static bool fill_from_dmesg(int fd,
 	size_t linelen = 0;
 	size_t warningslen = 0, dynamic_warnings_len = 0;
 	size_t dmesglen = 0, dynamic_dmesg_len = 0;
-	struct json_object *current_test = NULL;
-	struct json_object *current_dynamic_test = NULL;
+	struct json_t *current_test = NULL;
+	struct json_t *current_dynamic_test = NULL;
 	FILE *f = fdopen(fd, "r");
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
@@ -1135,15 +1121,15 @@ static void fill_from_journal(int fd,
 	char timeoutline[] = "timeout:";
 	int exitcode = INCOMPLETE_EXITCODE;
 	bool has_timeout = false;
-	struct json_object *tests = results->tests;
-	struct json_object *runtimes = results->runtimes;
+	struct json_t *tests = results->tests;
+	struct json_t *runtimes = results->runtimes;
 
 	while ((read = getline(&line, &linelen, f)) > 0) {
 		if (read >= strlen(exitline) && !memcmp(line, exitline, strlen(exitline))) {
 			char *p = strchr(line, '(');
 			char piglit_name[256];
 			double time = 0.0;
-			struct json_object *obj;
+			struct json_t *obj;
 
 			exitcode = atoi(line + strlen(exitline));
 
@@ -1168,7 +1154,7 @@ static void fill_from_journal(int fd,
 				char piglit_name[256];
 				char *p = strchr(line, '(');
 				double time = 0.0;
-				struct json_object *obj;
+				struct json_t *obj;
 
 				generate_piglit_name(entry->binary, last_subtest, piglit_name, sizeof(piglit_name));
 				obj = get_or_create_json_object(tests, piglit_name);
@@ -1194,7 +1180,7 @@ static void fill_from_journal(int fd,
 	if (subtests->size && (exitcode == IGT_EXIT_ABORT || exitcode == GRACEFUL_EXITCODE)) {
 		char *last_subtest = subtests->subs[subtests->size - 1].name;
 		char subtest_piglit_name[256];
-		struct json_object *subtest_obj;
+		struct json_t *subtest_obj;
 
 		generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
 		subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
@@ -1205,7 +1191,7 @@ static void fill_from_journal(int fd,
 	if (subtests->size == 0) {
 		char *subtestname = NULL;
 		char piglit_name[256];
-		struct json_object *obj;
+		struct json_t *obj;
 		const char *result = has_timeout ? "timeout" : result_from_exitcode(exitcode);
 
 		/*
@@ -1251,7 +1237,7 @@ static bool result_is_requested(struct job_list_entry *entry,
 static void prune_subtests(struct settings *settings,
 			   struct job_list_entry *entry,
 			   struct subtest_list *subtests,
-			   struct json_object *tests)
+			   struct json_t *tests)
 {
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
@@ -1265,7 +1251,7 @@ static void prune_subtests(struct settings *settings,
 
 		if (settings->prune_mode == PRUNE_KEEP_DYNAMIC) {
 			if (subtests->subs[i].dynamic_size)
-				json_object_object_del(tests, piglit_name);
+				json_object_del(tests, piglit_name);
 
 			continue;
 		}
@@ -1274,7 +1260,7 @@ static void prune_subtests(struct settings *settings,
 
 		if (settings->prune_mode == PRUNE_KEEP_REQUESTED &&
 		    !result_is_requested(entry, subtests->subs[i].name, NULL)) {
-			json_object_object_del(tests, piglit_name);
+			json_object_del(tests, piglit_name);
 		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
@@ -1283,7 +1269,7 @@ static void prune_subtests(struct settings *settings,
 			     !result_is_requested(entry, subtests->subs[i].name, subtests->subs[i].dynamic_names[k]))) {
 				generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 								 dynamic_piglit_name, sizeof(dynamic_piglit_name));
-				json_object_object_del(tests, dynamic_piglit_name);
+				json_object_del(tests, dynamic_piglit_name);
 			}
 		}
 	}
@@ -1313,40 +1299,41 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
 	return false;
 }
 
-static bool json_field_has_data(struct json_object *obj, const char *key)
+static bool json_field_has_data(struct json_t *obj, const char *key)
 {
-	struct json_object *field;
+	struct json_t *field;
 
-	if (json_object_object_get_ex(obj, key, &field))
-		return strcmp(json_object_get_string(field), "");
+	if ((field = json_object_get(obj, key)))
+		return strcmp(json_string_value(field), "");
 
 	return false;
 }
 
-static void override_completely_empty_results(struct json_object *obj)
+static void override_completely_empty_results(struct json_t *obj)
 {
 	if (json_field_has_data(obj, "out") ||
 	    json_field_has_data(obj, "err") ||
 	    json_field_has_data(obj, "dmesg"))
 		return;
 
-	json_object_object_add(obj, "out",
-			       json_object_new_string("This test didn't produce any output. "
-						      "The machine probably rebooted ungracefully.\n"));
+	json_object_set_new(obj, "out", json_string("This test didn't produce any output. "
+						    "The machine probably rebooted ungracefully.\n"));
 	set_result(obj, "incomplete");
 }
 
-static void override_result_single(struct json_object *obj)
+static void override_result_single(struct json_t *obj)
 {
 	const char *errtext = "", *result = "";
-	struct json_object *textobj;
+	struct json_t *textobj;
 	bool dmesgwarns = false;
 
-	if (json_object_object_get_ex(obj, "err", &textobj))
-		errtext = json_object_get_string(textobj);
-	if (json_object_object_get_ex(obj, "result", &textobj))
-		result = json_object_get_string(textobj);
-	if (json_object_object_get_ex(obj, "dmesg-warnings", &textobj))
+	if ((textobj = json_object_get(obj, "err")))
+		errtext = json_string_value(textobj);
+
+	if ((textobj = json_object_get(obj, "result")))
+		result = json_string_value(textobj);
+
+	if (json_object_get(obj, "dmesg-warnings"))
 		dmesgwarns = true;
 
 	if (!strcmp(result, "pass") &&
@@ -1368,9 +1355,9 @@ static void override_result_single(struct json_object *obj)
 
 static void override_results(char *binary,
 			     struct subtest_list *subtests,
-			     struct json_object *tests)
+			     struct json_t *tests)
 {
-	struct json_object *obj;
+	struct json_t *obj;
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
 	size_t i, k;
@@ -1396,52 +1383,50 @@ static void override_results(char *binary,
 	}
 }
 
-static struct json_object *get_totals_object(struct json_object *totals,
-					     const char *key)
+static struct json_t *get_totals_object(struct json_t *totals, const char *key)
 {
-	struct json_object *obj = NULL;
+	struct json_t *obj = NULL;
 
-	if (json_object_object_get_ex(totals, key, &obj))
+	if ((obj = json_object_get(totals, key)))
 		return obj;
 
-	obj = json_object_new_object();
-	json_object_object_add(totals, key, obj);
-
-	json_object_object_add(obj, "crash", json_object_new_int(0));
-	json_object_object_add(obj, "pass", json_object_new_int(0));
-	json_object_object_add(obj, "dmesg-fail", json_object_new_int(0));
-	json_object_object_add(obj, "dmesg-warn", json_object_new_int(0));
-	json_object_object_add(obj, "skip", json_object_new_int(0));
-	json_object_object_add(obj, "incomplete", json_object_new_int(0));
-	json_object_object_add(obj, "abort", json_object_new_int(0));
-	json_object_object_add(obj, "timeout", json_object_new_int(0));
-	json_object_object_add(obj, "notrun", json_object_new_int(0));
-	json_object_object_add(obj, "fail", json_object_new_int(0));
-	json_object_object_add(obj, "warn", json_object_new_int(0));
+	obj = json_object();
+	json_object_set_new(totals, key, obj);
+
+	json_object_set_new(obj, "crash", json_integer(0));
+	json_object_set_new(obj, "pass", json_integer(0));
+	json_object_set_new(obj, "dmesg-fail", json_integer(0));
+	json_object_set_new(obj, "dmesg-warn", json_integer(0));
+	json_object_set_new(obj, "skip", json_integer(0));
+	json_object_set_new(obj, "incomplete", json_integer(0));
+	json_object_set_new(obj, "abort", json_integer(0));
+	json_object_set_new(obj, "timeout", json_integer(0));
+	json_object_set_new(obj, "notrun", json_integer(0));
+	json_object_set_new(obj, "fail", json_integer(0));
+	json_object_set_new(obj, "warn", json_integer(0));
 
 	return obj;
 }
 
-static void add_result_to_totals(struct json_object *totals,
-				 const char *result)
+static void add_result_to_totals(struct json_t *totals, const char *result)
 {
-	json_object *numobj = NULL;
-	int old;
+	struct json_t *numobj = NULL;
+	json_int_t old;
 
-	if (!json_object_object_get_ex(totals, result, &numobj)) {
+	if (!(numobj = json_object_get(totals, result))) {
 		fprintf(stderr, "Warning: Totals object without count for %s\n", result);
 		return;
 	}
 
-	old = json_object_get_int(numobj);
-	json_object_object_add(totals, result, json_object_new_int(old + 1));
+	old = json_integer_value(numobj);
+	json_object_set_new(totals, result, json_integer(old + 1));
 }
 
 static void add_to_totals(const char *binary,
 			  struct subtest_list *subtests,
 			  struct results *results)
 {
-	struct json_object *test, *resultobj, *emptystrtotal, *roottotal, *binarytotal;
+	struct json_t *test, *resultobj, *emptystrtotal, *roottotal, *binarytotal;
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
 	const char *result;
@@ -1454,11 +1439,12 @@ static void add_to_totals(const char *binary,
 
 	if (subtests->size == 0) {
 		test = get_or_create_json_object(results->tests, piglit_name);
-		if (!json_object_object_get_ex(test, "result", &resultobj)) {
+		if (!(resultobj = json_object_get(test, "result"))) {
 			fprintf(stderr, "Warning: No results set for %s\n", piglit_name);
 			return;
 		}
-		result = json_object_get_string(resultobj);
+
+		result = json_string_value(resultobj);
 		add_result_to_totals(emptystrtotal, result);
 		add_result_to_totals(roottotal, result);
 		add_result_to_totals(binarytotal, result);
@@ -1468,12 +1454,13 @@ static void add_to_totals(const char *binary,
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 
-		if (json_object_object_get_ex(results->tests, piglit_name, &test)) {
-			if (!json_object_object_get_ex(test, "result", &resultobj)) {
+		if ((test = json_object_get(results->tests, piglit_name))) {
+			if (!(resultobj = json_object_get(test, "result"))) {
 				fprintf(stderr, "Warning: No results set for %s\n", piglit_name);
 				return;
 			}
-			result = json_object_get_string(resultobj);
+
+			result = json_string_value(resultobj);
 			add_result_to_totals(emptystrtotal, result);
 			add_result_to_totals(roottotal, result);
 			add_result_to_totals(binarytotal, result);
@@ -1483,12 +1470,13 @@ static void add_to_totals(const char *binary,
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 
-			if (json_object_object_get_ex(results->tests, dynamic_piglit_name, &test)) {
-				if (!json_object_object_get_ex(test, "result", &resultobj)) {
+			if ((test = json_object_get(results->tests, dynamic_piglit_name))) {
+				if (!(resultobj = json_object_get(test, "result"))) {
 					fprintf(stderr, "Warning: No results set for %s\n", dynamic_piglit_name);
 					return;
 				}
-				result = json_object_get_string(resultobj);
+
+				result = json_string_value(resultobj);
 				add_result_to_totals(emptystrtotal, result);
 				add_result_to_totals(roottotal, result);
 				add_result_to_totals(binarytotal, result);
@@ -1542,7 +1530,7 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 				   struct results *results)
 {
 	struct subtest_list subtests = {};
-	struct json_object *current_test;
+	struct json_t *current_test;
 	size_t i;
 
 	if (entry->subtest_count == 0) {
@@ -1553,10 +1541,10 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 			return;
 		generate_piglit_name(entry->binary, NULL, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(results->tests, piglit_name);
-		json_object_object_add(current_test, "out", json_object_new_string(""));
-		json_object_object_add(current_test, "err", json_object_new_string(""));
-		json_object_object_add(current_test, "dmesg", json_object_new_string(""));
-		json_object_object_add(current_test, "result", json_object_new_string("notrun"));
+		json_object_set_new(current_test, "out", json_string(""));
+		json_object_set_new(current_test, "err", json_string(""));
+		json_object_set_new(current_test, "dmesg", json_string(""));
+		json_object_set_new(current_test, "result", json_string("notrun"));
 	}
 
 	for (i = 0; i < entry->subtest_count; i++) {
@@ -1564,10 +1552,10 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 
 		generate_piglit_name(entry->binary, entry->subtests[i], piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(results->tests, piglit_name);
-		json_object_object_add(current_test, "out", json_object_new_string(""));
-		json_object_object_add(current_test, "err", json_object_new_string(""));
-		json_object_object_add(current_test, "dmesg", json_object_new_string(""));
-		json_object_object_add(current_test, "result", json_object_new_string("notrun"));
+		json_object_set_new(current_test, "out", json_string(""));
+		json_object_set_new(current_test, "err", json_string(""));
+		json_object_set_new(current_test, "dmesg", json_string(""));
+		json_object_set_new(current_test, "result", json_string("notrun"));
 		add_subtest(&subtests, strdup(entry->subtests[i]));
 	}
 
@@ -1575,22 +1563,22 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 	free_subtests(&subtests);
 }
 
-static void create_result_root_nodes(struct json_object *root,
+static void create_result_root_nodes(struct json_t *root,
 				     struct results *results)
 {
-	results->tests = json_object_new_object();
-	json_object_object_add(root, "tests", results->tests);
-	results->totals = json_object_new_object();
-	json_object_object_add(root, "totals", results->totals);
-	results->runtimes = json_object_new_object();
-	json_object_object_add(root, "runtimes", results->runtimes);
+	results->tests = json_object();
+	json_object_set_new(root, "tests", results->tests);
+	results->totals = json_object();
+	json_object_set_new(root, "totals", results->totals);
+	results->runtimes = json_object();
+	json_object_set_new(root, "runtimes", results->runtimes);
 }
 
-struct json_object *generate_results_json(int dirfd)
+struct json_t *generate_results_json(int dirfd)
 {
 	struct settings settings;
 	struct job_list job_list;
-	struct json_object *obj, *elapsed;
+	struct json_t *obj, *elapsed;
 	struct results results;
 	int testdirfd, fd;
 	size_t i;
@@ -1608,13 +1596,12 @@ struct json_object *generate_results_json(int dirfd)
 		return NULL;
 	}
 
-	obj = json_object_new_object();
-	json_object_object_add(obj, "__type__", json_object_new_string("TestrunResult"));
-	json_object_object_add(obj, "results_version", json_object_new_int(10));
-	json_object_object_add(obj, "name",
-			       settings.name ?
-			       json_object_new_string(settings.name) :
-			       json_object_new_string(""));
+	obj = json_object();
+	json_object_set_new(obj, "__type__", json_string("TestrunResult"));
+	json_object_set_new(obj, "results_version", json_integer(10));
+	json_object_set_new(obj, "name", settings.name ?
+					 json_string(settings.name) :
+					 json_string(""));
 
 	if ((fd = openat(dirfd, "uname.txt", O_RDONLY)) >= 0) {
 		char buf[128];
@@ -1623,26 +1610,25 @@ struct json_object *generate_results_json(int dirfd)
 		if (r > 0 && buf[r - 1] == '\n')
 			r--;
 
-		json_object_object_add(obj, "uname",
-				       new_escaped_json_string(buf, r));
+		json_object_set_new(obj, "uname", escaped_json_stringn(buf, r));
 		close(fd);
 	}
 
-	elapsed = json_object_new_object();
-	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
+	elapsed = json_object();
+	json_object_set_new(elapsed, "__type__", json_string("TimeAttribute"));
 	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
 		char buf[128] = {};
 		read(fd, buf, sizeof(buf));
-		json_object_object_add(elapsed, "start", json_object_new_double(atof(buf)));
+		json_object_set_new(elapsed, "start", json_real(atof(buf)));
 		close(fd);
 	}
 	if ((fd = openat(dirfd, "endtime.txt", O_RDONLY)) >= 0) {
 		char buf[128] = {};
 		read(fd, buf, sizeof(buf));
-		json_object_object_add(elapsed, "end", json_object_new_double(atof(buf)));
+		json_object_set_new(elapsed, "end", json_real(atof(buf)));
 		close(fd);
 	}
-	json_object_object_add(obj, "time_elapsed", elapsed);
+	json_object_set_new(obj, "time_elapsed", elapsed);
 
 	create_result_root_nodes(obj, &results);
 
@@ -1679,21 +1665,17 @@ struct json_object *generate_results_json(int dirfd)
 		char buf[4096];
 		char piglit_name[] = "igt@runner@aborted";
 		struct subtest_list abortsub = {};
-		struct json_object *aborttest = get_or_create_json_object(results.tests, piglit_name);
+		struct json_t *aborttest = get_or_create_json_object(results.tests, piglit_name);
 		ssize_t s;
 
 		add_subtest(&abortsub, strdup("aborted"));
 
 		s = read(fd, buf, sizeof(buf));
 
-		json_object_object_add(aborttest, "out",
-				       new_escaped_json_string(buf, s));
-		json_object_object_add(aborttest, "err",
-				       json_object_new_string(""));
-		json_object_object_add(aborttest, "dmesg",
-				       json_object_new_string(""));
-		json_object_object_add(aborttest, "result",
-				       json_object_new_string("fail"));
+		json_object_set_new(aborttest, "out", escaped_json_stringn(buf, s));
+		json_object_set_new(aborttest, "err", json_string(""));
+		json_object_set_new(aborttest, "dmesg", json_string(""));
+		json_object_set_new(aborttest, "result", json_string("fail"));
 
 		add_to_totals("runner", &abortsub, &results);
 
@@ -1709,9 +1691,8 @@ struct json_object *generate_results_json(int dirfd)
 
 bool generate_results(int dirfd)
 {
-	struct json_object *obj = generate_results_json(dirfd);
-	const char *json_string;
-	int resultsfd;
+	struct json_t *obj = generate_results_json(dirfd);
+	int resultsfd, status;
 
 	if (obj == NULL)
 		return false;
@@ -1722,23 +1703,19 @@ bool generate_results(int dirfd)
 		return false;
 	}
 
-	json_string = json_object_to_json_string_ext(obj, JSON_C_TO_STRING_PRETTY);
+	status = json_dumpfd(obj, resultsfd, JSON_INDENT(4));
 
-	if (json_string == NULL) {
+	if (status != 0) {
 		fprintf(stderr, "resultgen: Failed to create json representation of the results.\n");
 		fprintf(stderr, "           This usually means that the results are too big\n");
 		fprintf(stderr, "           to fit in the memory as the text representation\n");
 		fprintf(stderr, "           is being created.\n\n");
 		fprintf(stderr, "           Either something was spamming the logs or your\n");
 		fprintf(stderr, "           system is very low on free mem.\n");
-
-		close(resultsfd);
-		return false;
 	}
 
-	write(resultsfd, json_string, strlen(json_string));
 	close(resultsfd);
-	return true;
+	return status == 0;
 }
 
 bool generate_results_path(char *resultspath)
diff --git a/runner/resultgen.h b/runner/resultgen.h
index ab0bf108..3bc3bafe 100644
--- a/runner/resultgen.h
+++ b/runner/resultgen.h
@@ -6,6 +6,6 @@
 bool generate_results(int dirfd);
 bool generate_results_path(char *resultspath);
 
-struct json_object *generate_results_json(int dirfd);
+struct json_t *generate_results_json(int dirfd);
 
 #endif
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 7253c906..9f487855 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -2,122 +2,85 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 
-#include <json.h>
+#include <jansson.h>
 
 #include "igt.h"
 #include "resultgen.h"
 
 static char testdatadir[] = JSON_TESTS_DIRECTORY;
 
-static struct json_object *read_json(int fd)
-{
-	struct json_object *obj;
-	struct json_tokener *tok = json_tokener_new();
-	enum json_tokener_error err;
-	char buf[512];
-	ssize_t s;
-
-	do {
-		s = read(fd, buf, sizeof(buf));
-		obj = json_tokener_parse_ex(tok, buf, s);
-	} while ((err = json_tokener_get_error(tok)) == json_tokener_continue);
-
-	igt_assert_eq(err, json_tokener_success);
-
-	json_tokener_free(tok);
-	return obj;
-}
-
-static void compare(struct json_object *one,
-		    struct json_object *two);
+static void compare(struct json_t *one,
+		    struct json_t *two);
 
-static void compare_objects(struct json_object *one,
-			    struct json_object *two)
+static void compare_objects(struct json_t *one, struct json_t *two)
 {
-	json_object_iter iter;
-	struct json_object *subobj;
-
-	json_object_object_foreachC(one, iter) {
-		igt_debug("Key %s\n", iter.key);
-
-		igt_assert(json_object_object_get_ex(two, iter.key, &subobj));
+	const char *key;
+	json_t *one_value, *two_value;
 
-		compare(iter.val, subobj);
+	json_object_foreach(one, key, one_value) {
+		igt_debug("Key %s\n", key);
+		igt_assert(two_value = json_object_get(two, key));
+		compare(one_value, two_value);
 	}
 }
 
-static void compare_arrays(struct json_object *one,
-			   struct json_object *two)
+static void compare_arrays(struct json_t *one, struct json_t *two)
 {
-	size_t i;
-
-	for (i = 0; i < json_object_array_length(one); i++) {
+	for (size_t i = 0; i < json_array_size(one); i++) {
 		igt_debug("Array index %zd\n", i);
-		compare(json_object_array_get_idx(one, i),
-			json_object_array_get_idx(two, i));
+		compare(json_array_get(one, i),
+		        json_array_get(two, i));
 	}
 }
 
-static bool compatible_types(struct json_object *one,
-			     struct json_object *two)
+static bool compatible_types(struct json_t *one, struct json_t *two)
 {
 	/*
-	 * A double of value 0.0 gets written as "0", which gets read
-	 * as an int.
+	 * Numbers should be compatible with each other. A double of
+	 * value 0.0 gets written as "0", which gets read as an int.
 	 */
-	json_type onetype = json_object_get_type(one);
-	json_type twotype = json_object_get_type(two);
-
-	switch (onetype) {
-	case json_type_boolean:
-	case json_type_string:
-	case json_type_object:
-	case json_type_array:
-	case json_type_null:
-		return onetype == twotype;
-		break;
-	case json_type_double:
-	case json_type_int:
-		return twotype == json_type_double || twotype == json_type_int;
-		break;
-	}
+	if (json_is_number(one))
+		return json_is_number(two);
+
+	if (json_is_boolean(one))
+		return json_is_boolean(two);
 
-	igt_assert(!"Cannot be reached");
-	return false;
+	return json_typeof(one) == json_typeof(two);
 }
 
-static void compare(struct json_object *one,
-		    struct json_object *two)
+static void compare(struct json_t *one,
+		    struct json_t *two)
 {
 	igt_assert(compatible_types(one, two));
 
-	switch (json_object_get_type(one)) {
-	case json_type_boolean:
-		igt_assert_eq(json_object_get_boolean(one), json_object_get_boolean(two));
+	switch (json_typeof(one)) {
+	case JSON_NULL:
+	case JSON_TRUE:
+	case JSON_FALSE:
+		/* These values are singletons: */
+		igt_assert(one == two);
 		break;
-	case json_type_double:
-	case json_type_int:
+	case JSON_REAL:
+	case JSON_INTEGER:
 		/*
 		 * A double of value 0.0 gets written as "0", which
 		 * gets read as an int. Both yield 0.0 with
 		 * json_object_get_double(). Comparing doubles with ==
 		 * considered crazy but it's good enough.
 		 */
-		igt_assert(json_object_get_double(one) == json_object_get_double(two));
+		igt_assert_eq_double(json_number_value(one), json_number_value(two));
 		break;
-	case json_type_string:
-		igt_assert(!strcmp(json_object_get_string(one), json_object_get_string(two)));
+	case JSON_STRING:
+		igt_assert(!strcmp(json_string_value(one), json_string_value(two)));
 		break;
-	case json_type_object:
-		igt_assert_eq(json_object_object_length(one), json_object_object_length(two));
+	case JSON_OBJECT:
+		igt_assert_eq(json_object_size(one), json_object_size(two));
 		compare_objects(one, two);
 		break;
-	case json_type_array:
-		igt_assert_eq(json_object_array_length(one), json_object_array_length(two));
+	case JSON_ARRAY:
+		igt_assert_eq(json_array_size(one), json_array_size(two));
 		compare_arrays(one, two);
 		break;
-	case json_type_null:
-		break;
 	default:
 		igt_assert(!"Cannot be reached");
 	}
@@ -127,7 +90,8 @@ static void run_results_and_compare(int dirfd, const char *dirname)
 {
 	int testdirfd = openat(dirfd, dirname, O_RDONLY | O_DIRECTORY);
 	int reference;
-	struct json_object *resultsobj, *referenceobj;
+	struct json_t *resultsobj, *referenceobj;
+	struct json_error_t error;
 
 	igt_assert_fd(testdirfd);
 
@@ -137,14 +101,15 @@ static void run_results_and_compare(int dirfd, const char *dirname)
 	close(testdirfd);
 
 	igt_assert_fd(reference);
-	referenceobj = read_json(reference);
+	referenceobj = json_loadfd(reference, 0, &error);
 	close(reference);
-	igt_assert(referenceobj != NULL);
+	igt_assert_f(referenceobj != NULL, "JSON loading error for %s/%s:%d:%d - %s\n",
+		     dirname, "reference.json", error.line, error.column, error.text);
 
 	igt_debug("Root object\n");
 	compare(resultsobj, referenceobj);
-	igt_assert_eq(json_object_put(resultsobj), 1);
-	igt_assert_eq(json_object_put(referenceobj), 1);
+	json_decref(resultsobj);
+	json_decref(referenceobj);
 }
 
 static const char *dirnames[] = {
diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 8fe86978..e36ab103 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -4,7 +4,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-#include <json.h>
+#include <jansson.h>
 
 #include "igt.h"
 
@@ -33,20 +33,20 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
 /* The total number of test binaries in runner/testdata/ */
 #define NUM_TESTDATA_BINARIES 8
 
-static const char *igt_get_result(struct json_object *tests, const char* testname)
+static const char *igt_get_result(struct json_t *tests, const char* testname)
 {
-	struct json_object *obj;
+	struct json_t *obj;
 
-	igt_assert(json_object_object_get_ex(tests, testname, &obj));
-	igt_assert(json_object_object_get_ex(obj, "result", &obj));
+	igt_assert(obj = json_object_get(tests, testname));
+	igt_assert(obj = json_object_get(obj, "result"));
 
-	return json_object_get_string(obj);
+	return json_string_value(obj);
 }
 
-static void igt_assert_no_result_for(struct json_object *tests, const char* testname)
+static void igt_assert_no_result_for(struct json_t *tests, const char* testname)
 {
-	struct json_object *obj;
-	igt_assert(!json_object_object_get_ex(tests, testname, &obj));
+	struct json_t *obj;
+	igt_assert(!(obj = json_object_get(tests, testname)));
 }
 
 
@@ -1552,7 +1552,7 @@ igt_main
 
 		igt_subtest("dynamic-subtests-in-testlist") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "--test-list", filename,
@@ -1574,7 +1574,7 @@ igt_main
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			/* Check that the dynamic subtest we didn't request is not reported */
 			igt_assert_no_result_for(tests, "igt@dynamic@dynamic-subtest@failing");
@@ -1582,7 +1582,7 @@ igt_main
 			/* Check that the dynamic subtest we did request is */
 			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture {
@@ -1608,7 +1608,7 @@ igt_main
 
 		igt_subtest("dynamic-subtest-failure-should-not-cause-warn") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "-t", "^dynamic$",
@@ -1626,11 +1626,11 @@ igt_main
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture {
@@ -1654,7 +1654,7 @@ igt_main
 
 		igt_subtest("execute-abort-simple") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "-t", "^abort-simple$",
@@ -1672,11 +1672,11 @@ igt_main
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			igt_assert_eqstr(igt_get_result(tests, "igt@abort-simple"), "abort");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture {
@@ -1702,7 +1702,7 @@ igt_main
 
 			igt_subtest_f("execute-abort%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner",
 						       "--allow-non-root",
 						       "-t", "^abort$",
@@ -1721,7 +1721,7 @@ igt_main
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort@a-subtest"), "pass");
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort@b-subtest"), "abort");
@@ -1731,7 +1731,7 @@ igt_main
 				else
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort@c-subtest"), "notrun");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture {
@@ -1758,7 +1758,7 @@ igt_main
 
 			igt_subtest_f("execute-abort-fixture%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "-t", "^abort-fixture$",
@@ -1776,7 +1776,7 @@ igt_main
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				if (multiple) {
 					/*
@@ -1791,7 +1791,7 @@ igt_main
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "notrun");
 				}
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture {
@@ -1825,7 +1825,7 @@ igt_main
 
 			igt_subtest_f("execute-abort-fixture-testlist%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "--test-list", filename,
@@ -1843,7 +1843,7 @@ igt_main
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				if (multiple) /* multiple mode = no notruns */
 					igt_assert_no_result_for(tests, "igt@abort-fixture@a-subtest");
@@ -1853,7 +1853,7 @@ igt_main
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "abort");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture {
@@ -1881,7 +1881,7 @@ igt_main
 
 			igt_subtest_f("execute-abort-dynamic%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "-t", "^abort-dynamic$",
@@ -1899,7 +1899,7 @@ igt_main
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@a-subtest@dynamic-1"), "pass");
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@b-subtest@dynamic-1"), "pass");
@@ -1912,7 +1912,7 @@ igt_main
 				else
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@c-subtest"), "notrun");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture {
-- 
2.37.1
