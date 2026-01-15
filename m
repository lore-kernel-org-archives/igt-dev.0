Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E3DD46607
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 17:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526A10E7BC;
	Thu, 15 Jan 2026 17:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/ix2vL2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB3010E7BC
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 17:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768499903; x=1800035903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbx2yvxsZflCGNFbARE/K6VYyhfQGVWQpb6r/DZRtrQ=;
 b=n/ix2vL2CbOXvO+anFkJHnt7ojgSvKmYA33qAHQuaZo9gFVJwMmUnFiT
 Pix2hRpMp2azSNQ6edQEXIcTQDbag3Y4z2IiqJz2zzIkElyvL9brdOtCs
 1r85XsgJAY4/AfYAEdRO75iT+/ruXyegtb2+8YzYby0FPjNwRxi0JnMjB
 6H4Rka/FlHQKU+19uZz/FqX4j/WvTAK0psmlTxuRyijJU5cFRPXVUMP8g
 RqsC9x0FegbgsnIPkBwek41qC0VAk570T0vDJXQ4LTyUCXDy6Uv04PaCK
 hcG+kgT5IPxcwTzArrHxsAcvBjp3PNj4SeMuRtI1edEB9oswZ3g8ooEG6 g==;
X-CSE-ConnectionGUID: uDmMol8sTC2SJkO08NR7uA==
X-CSE-MsgGUID: y+Cae+m8TEiKwMAKfvGZ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69017165"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69017165"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:23 -0800
X-CSE-ConnectionGUID: dX4bC5/4QZCVOrhdhw46QA==
X-CSE-MsgGUID: SM/+7YWsRSqAdNCrP1tIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204627179"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:22 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/4] runner: Use Jansson in resultgen instead of
 json-c
Date: Thu, 15 Jan 2026 18:58:07 +0100
Message-ID: <20260115175811.179898-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
References: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ryszard Knop <ryszard.knop@intel.com>

The json-c library has a hard limit of 2GB of its output. While normally
it's not a problem, some very verbose edge cases make the results.json
output go past that limit.

Jansson has a similar API, can work with files over 2GB and, according
to JSON library and benchmarks, is slightly slower but uses less RAM to
serialize its output. Jansson 2.12+ (released in 2018) is required.

This commit also updates tests to use Jansson, but they need data fixups
to pass (in the next commit).

v2: rebase on current top (Kamil)

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/meson.build         |  10 +-
 runner/resultgen.c         | 384 ++++++++++++++++++-------------------
 runner/resultgen.h         |   2 +-
 runner/runner_json_tests.c | 129 +++++--------
 runner/runner_tests.c      |  61 +++---
 5 files changed, 270 insertions(+), 316 deletions(-)

diff --git a/runner/meson.build b/runner/meson.build
index ca27e69c5..61beb79c6 100644
--- a/runner/meson.build
+++ b/runner/meson.build
@@ -16,8 +16,8 @@ runner_test_sources = [ 'runner_tests.c' ]
 runner_json_test_sources = [ 'runner_json_tests.c' ]
 runner_kmemleak_test_sources = [ 'runner_kmemleak_test.c' ]
 
-jsonc = dependency('json-c', required: build_runner)
-runner_deps = [jsonc, glib]
+jansson = dependency('jansson', required: build_runner, version: '>=2.12')
+runner_deps = [jansson, glib]
 runner_c_args = []
 
 liboping = dependency('liboping', required: get_option('oping'))
@@ -26,7 +26,7 @@ if liboping.found()
 	runner_c_args += '-DHAVE_OPING=1'
 endif
 
-if jsonc.found() and build_tests
+if jansson.found() and build_tests
 	subdir('testdata')
 
 	runnerlib = static_library('igt_runner', runnerlib_sources,
@@ -66,14 +66,14 @@ if jsonc.found() and build_tests
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
 
 	runner_kmemleak_test = executable('runner_kmemleak_test',
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1f7e79f24..29fc5cbb1 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -6,10 +6,9 @@
 #include <string.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
-#include <json.h>
+#include <jansson.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
@@ -42,9 +41,9 @@ struct subtest_list
 
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
@@ -259,61 +258,54 @@ static void parse_subtest_result(const char *subtest,
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
+	struct json_t *timeobj = get_or_create_json_object(obj, "time");
 
-	json_object_object_add(timeobj, "__type__",
-			       json_object_new_string("TimeAttribute"));
-	json_object_object_add(timeobj, "start",
-			       json_object_new_double(0.0));
-	json_object_object_add(timeobj, "end",
-			       json_object_new_double(time));
+	json_object_set_new(timeobj, "__type__", json_string("TimeAttribute"));
+	json_object_set_new(timeobj, "start", json_real(0.0));
+	json_object_set_new(timeobj, "end", json_real(time));
 }
 
 struct match_item
@@ -398,7 +390,7 @@ static bool is_subtest_result_line(const char *needle, const char *line, const c
 	if (line >= bufend || *line++ != ':')
 		return false;
 
-	if (line >= bufend || *line++ != ' ')
+	if (line >= bufend || *line != ' ')
 		return false;
 
 	return true;
@@ -409,15 +401,15 @@ static void free_matches(struct matches *matches)
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
 
 	/*
-	 * Test output may be garbage; strings passed to json-c need to be
+	 * Test output may be garbage; strings passed to jansson need to be
 	 * UTF-8 encoded so any non-ASCII characters are converted to their
 	 * UTF-8 representation, which requires 2 bytes per character.
 	 */
@@ -437,19 +429,18 @@ static struct json_object *new_escaped_json_string(const char *buf, size_t len)
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
@@ -605,7 +596,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 					   const char *beg,
 					   const char *end,
 					   const char *key,
-					   struct json_object *tests,
+					   struct json_t *tests,
 					   struct subtest *subtest)
 {
 	size_t k;
@@ -622,7 +613,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 	}
 
 	for (k = begin_idx + 1; k < result_idx; k++) {
-		struct json_object *current_dynamic_test = NULL;
+		struct json_t *current_dynamic_test = NULL;
 		int dyn_result_idx;
 		char dynamic_name[256];
 		char dynamic_piglit_name[256];
@@ -646,11 +637,10 @@ static void process_dynamic_subtest_output(const char *piglit_name,
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
 
@@ -669,11 +659,11 @@ static void process_dynamic_subtest_output(const char *piglit_name,
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
@@ -689,14 +679,14 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 
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
@@ -740,8 +730,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 
-		json_object_object_add(current_test, key,
-				       new_escaped_json_string(buf, statbuf.st_size));
+		json_object_set_new(current_test, key, escaped_json_stringn(buf, statbuf.st_size));
 		add_igt_version(current_test, igt_version, igt_version_len);
 
 		return true;
@@ -764,12 +753,11 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
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
@@ -961,24 +949,22 @@ static void generate_formatted_dmesg_line(char *message,
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
@@ -986,7 +972,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 	for (i = 0; i < subtests->size; i++) {
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
-		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
+		if (!json_object_get(current_test, "dmesg")) {
 			add_dmesg(current_test, "", 0, NULL, 0);
 		}
 
@@ -994,7 +980,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 			generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
-			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
+			if (!json_object_get(current_test, "dmesg")) {
 				add_dmesg(current_test, "", 0, NULL, 0);
 			}
 		}
@@ -1006,7 +992,7 @@ static bool fill_from_dmesg(int fd,
 			    struct settings *settings,
 			    char *binary,
 			    struct subtest_list *subtests,
-			    struct json_object *tests)
+			    struct json_t *tests)
 {
 	char *line = NULL;
 	char *warnings = NULL, *dynamic_warnings = NULL;
@@ -1014,8 +1000,8 @@ static bool fill_from_dmesg(int fd,
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
@@ -1189,15 +1175,15 @@ static void fill_from_journal(int fd,
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
 
@@ -1222,7 +1208,7 @@ static void fill_from_journal(int fd,
 				char piglit_name[256];
 				char *p = strchr(line, '(');
 				double time = 0.0;
-				struct json_object *obj;
+				struct json_t *obj;
 
 				generate_piglit_name(entry->binary, last_subtest, piglit_name, sizeof(piglit_name));
 				obj = get_or_create_json_object(tests, piglit_name);
@@ -1248,7 +1234,7 @@ static void fill_from_journal(int fd,
 	if (subtests->size && (exitcode == IGT_EXIT_ABORT || exitcode == GRACEFUL_EXITCODE)) {
 		char *last_subtest = subtests->subs[subtests->size - 1].name;
 		char subtest_piglit_name[256];
-		struct json_object *subtest_obj;
+		struct json_t *subtest_obj;
 
 		generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
 		subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
@@ -1259,7 +1245,7 @@ static void fill_from_journal(int fd,
 	if (subtests->size == 0) {
 		char *subtestname = NULL;
 		char piglit_name[256];
-		struct json_object *obj;
+		struct json_t *obj;
 		const char *result = has_timeout ? "timeout" : result_from_exitcode(exitcode);
 
 		/*
@@ -1296,9 +1282,9 @@ struct comms_context
 {
 	comms_state_t state;
 
-	struct json_object *binaryruntimeobj;
-	struct json_object *current_test;
-	struct json_object *current_dynamic_subtest;
+	struct json_t *binaryruntimeobj;
+	struct json_t *current_test;
+	struct json_t *current_dynamic_subtest;
 	char *current_subtest_name;
 	char *current_dynamic_subtest_name;
 
@@ -1365,10 +1351,10 @@ static void comms_inject_subtest_end_log(struct comms_context *context,
 
 static void comms_finish_subtest(struct comms_context *context)
 {
-	json_object_object_add(context->current_test, "out",
-			       new_escaped_json_string(context->outbuf + context->outidx, context->outbuflen - context->outidx));
-	json_object_object_add(context->current_test, "err",
-			       new_escaped_json_string(context->errbuf + context->outidx, context->errbuflen - context->erridx));
+	json_object_set_new(context->current_test, "out",
+			    escaped_json_stringn(context->outbuf + context->outidx, context->outbuflen - context->outidx));
+	json_object_set_new(context->current_test, "err",
+			    escaped_json_stringn(context->errbuf + context->outidx, context->errbuflen - context->erridx));
 
 	if (context->igt_version)
 		add_igt_version(context->current_test, context->igt_version, strlen(context->igt_version));
@@ -1388,10 +1374,10 @@ static void comms_finish_subtest(struct comms_context *context)
 
 static void comms_finish_dynamic_subtest(struct comms_context *context)
 {
-	json_object_object_add(context->current_dynamic_subtest, "out",
-			       new_escaped_json_string(context->outbuf + context->dynoutidx, context->outbuflen - context->dynoutidx));
-	json_object_object_add(context->current_dynamic_subtest, "err",
-			       new_escaped_json_string(context->errbuf + context->dynerridx, context->errbuflen - context->dynerridx));
+	json_object_set_new(context->current_dynamic_subtest, "out",
+			    escaped_json_stringn(context->outbuf + context->dynoutidx, context->outbuflen - context->dynoutidx));
+	json_object_set_new(context->current_dynamic_subtest, "err",
+			    escaped_json_stringn(context->errbuf + context->dynerridx, context->errbuflen - context->dynerridx));
 
 	if (context->igt_version)
 		add_igt_version(context->current_dynamic_subtest, context->igt_version, strlen(context->igt_version));
@@ -1918,7 +1904,7 @@ static bool result_is_requested(struct job_list_entry *entry,
 static void prune_subtests(struct settings *settings,
 			   struct job_list_entry *entry,
 			   struct subtest_list *subtests,
-			   struct json_object *tests)
+			   struct json_t *tests)
 {
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
@@ -1932,7 +1918,7 @@ static void prune_subtests(struct settings *settings,
 
 		if (settings->prune_mode == PRUNE_KEEP_DYNAMIC) {
 			if (subtests->subs[i].dynamic_size)
-				json_object_object_del(tests, piglit_name);
+				json_object_del(tests, piglit_name);
 
 			continue;
 		}
@@ -1941,7 +1927,7 @@ static void prune_subtests(struct settings *settings,
 
 		if (settings->prune_mode == PRUNE_KEEP_REQUESTED &&
 		    !result_is_requested(entry, subtests->subs[i].name, NULL)) {
-			json_object_object_del(tests, piglit_name);
+			json_object_del(tests, piglit_name);
 		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
@@ -1950,7 +1936,7 @@ static void prune_subtests(struct settings *settings,
 			     !result_is_requested(entry, subtests->subs[i].name, subtests->subs[i].dynamic_names[k]))) {
 				generate_piglit_name_for_dynamic(piglit_name, subtests->subs[i].dynamic_names[k],
 								 dynamic_piglit_name, sizeof(dynamic_piglit_name));
-				json_object_object_del(tests, dynamic_piglit_name);
+				json_object_del(tests, dynamic_piglit_name);
 			}
 		}
 	}
@@ -1985,40 +1971,42 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
 	return found;
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
+	json_object_set_new(obj, "out",
+			    json_string("This test didn't produce any output. "
+					"The machine probably rebooted ungracefully.\n"));
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
+	if ((textobj = json_object_get(obj, "dmesg-warnings")))
 		dmesgwarns = true;
 
 	if (!strcmp(result, "pass") &&
@@ -2040,9 +2028,9 @@ static void override_result_single(struct json_object *obj)
 
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
@@ -2068,52 +2056,51 @@ static void override_results(char *binary,
 	}
 }
 
-static struct json_object *get_totals_object(struct json_object *totals,
-					     const char *key)
+static struct json_t *get_totals_object(struct json_t *totals, const char *key)
 {
-	struct json_object *obj = NULL;
+	struct json_t *obj = json_object_get(totals, key);
 
-	if (json_object_object_get_ex(totals, key, &obj))
+	if (obj)
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
+static void add_result_to_totals(struct json_t *totals,
 				 const char *result)
 {
-	json_object *numobj = NULL;
+	struct json_t *numobj = json_object_get(totals, result);
 	int old;
 
-	if (!json_object_object_get_ex(totals, result, &numobj)) {
+	if (!numobj) {
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
@@ -2126,11 +2113,12 @@ static void add_to_totals(const char *binary,
 
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
@@ -2140,12 +2128,12 @@ static void add_to_totals(const char *binary,
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
+			result = json_string_value(resultobj);
 			add_result_to_totals(emptystrtotal, result);
 			add_result_to_totals(roottotal, result);
 			add_result_to_totals(binarytotal, result);
@@ -2155,12 +2143,13 @@ static void add_to_totals(const char *binary,
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
@@ -2257,7 +2246,7 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 				   struct results *results)
 {
 	struct subtest_list subtests = {};
-	struct json_object *current_test;
+	struct json_t *current_test;
 	size_t i;
 
 	if (entry->subtest_count == 0) {
@@ -2268,10 +2257,10 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
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
@@ -2279,10 +2268,10 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
 
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
 
@@ -2290,22 +2279,22 @@ static void try_add_notrun_results(const struct job_list_entry *entry,
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
-	struct json_object *obj, *elapsed, *arr;
+	struct json_t *obj, *elapsed, *arr;
 	struct results results;
 	int testdirfd, fd;
 	size_t i;
@@ -2323,13 +2312,12 @@ struct json_object *generate_results_json(int dirfd)
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
@@ -2338,31 +2326,35 @@ struct json_object *generate_results_json(int dirfd)
 		if (r > 0 && buf[r - 1] == '\n')
 			r--;
 
-		json_object_object_add(obj, "uname",
-				       new_escaped_json_string(buf, r));
+		json_object_set_new(obj, "uname", escaped_json_stringn(buf, r));
 		close(fd);
 	}
 
-	arr = json_object_new_array();
+	arr = json_array();
 	for (i = 0; i < settings.cmdline.argc; i++)
-		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
-	json_object_object_add(obj, "cmdline", arr);
+		json_array_append_new(arr,
+				      escaped_json_stringn(settings.cmdline.argv[i],
+							   strlen(settings.cmdline.argv[i])));
+
+	json_object_set_new(obj, "cmdline", arr);
+
+	elapsed = json_object();
+	json_object_set_new(elapsed, "__type__", json_string("TimeAttribute"));
 
-	elapsed = json_object_new_object();
-	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
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
+
+	json_object_set_new(obj, "time_elapsed", elapsed);
 
 	create_result_root_nodes(obj, &results);
 
@@ -2406,21 +2398,21 @@ struct json_object *generate_results_json(int dirfd)
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
+		json_object_set_new(aborttest, "out",
+				    escaped_json_stringn(buf, s));
+		json_object_set_new(aborttest, "err",
+				    json_string(""));
+		json_object_set_new(aborttest, "dmesg",
+				    json_string(""));
+		json_object_set_new(aborttest, "result",
+				    json_string("fail"));
 
 		add_to_totals("runner", &abortsub, &results);
 
@@ -2436,9 +2428,8 @@ struct json_object *generate_results_json(int dirfd)
 
 bool generate_results(int dirfd)
 {
-	struct json_object *obj = generate_results_json(dirfd);
-	const char *json_string;
-	int resultsfd;
+	struct json_t *obj = generate_results_json(dirfd);
+	int resultsfd, status;
 
 	if (obj == NULL)
 		return false;
@@ -2449,23 +2440,20 @@ bool generate_results(int dirfd)
 		return false;
 	}
 
-	json_string = json_object_to_json_string_ext(obj, JSON_C_TO_STRING_PRETTY);
+	status = json_dumpfd(obj, resultsfd, JSON_INDENT(4));
 
-	if (json_string == NULL) {
+	if (status) {
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
+
+	return status == 0;
 }
 
 bool generate_results_path(char *resultspath)
diff --git a/runner/resultgen.h b/runner/resultgen.h
index ab0bf1082..3bc3bafe5 100644
--- a/runner/resultgen.h
+++ b/runner/resultgen.h
@@ -6,6 +6,6 @@
 bool generate_results(int dirfd);
 bool generate_results_path(char *resultspath);
 
-struct json_object *generate_results_json(int dirfd);
+struct json_t *generate_results_json(int dirfd);
 
 #endif
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 38439ccaa..b3a6068e4 100644
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
+			json_array_get(two, i));
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
+	igt_assert_f(referenceobj, "JSON loading error for %s/%s:%d:%d - %s\n",
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
index 908979982..798fee8ef 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -4,7 +4,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-#include <json.h>
+#include <jansson.h>
 
 #include "igt.h"
 #include "runnercomms.h"
@@ -34,20 +34,21 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
 /* The total number of test binaries in runner/testdata/ */
 #define NUM_TESTDATA_BINARIES 8
 
-static const char *igt_get_result(struct json_object *tests, const char* testname)
+static const char *igt_get_result(struct json_t *tests, const char *testname)
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
+static void igt_assert_no_result_for(struct json_t *tests, const char *testname)
 {
-	struct json_object *obj;
-	igt_assert(!json_object_object_get_ex(tests, testname, &obj));
+	struct json_t *obj;
+
+	igt_assert(!(obj = json_object_get(tests, testname)));
 }
 
 
@@ -1807,7 +1808,7 @@ int igt_main()
 
 		igt_subtest("dynamic-subtests-in-testlist") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "--test-list", filename,
@@ -1829,7 +1830,7 @@ int igt_main()
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			/* Check that the dynamic subtest we didn't request is not reported */
 			igt_assert_no_result_for(tests, "igt@dynamic@dynamic-subtest@failing");
@@ -1837,7 +1838,7 @@ int igt_main()
 			/* Check that the dynamic subtest we did request is */
 			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture() {
@@ -1958,7 +1959,7 @@ int igt_main()
 
 		igt_subtest("dynamic-subtest-failure-should-not-cause-warn") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "-t", "^dynamic$",
@@ -1976,11 +1977,11 @@ int igt_main()
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			igt_assert_eqstr(igt_get_result(tests, "igt@dynamic@dynamic-subtest@passing"), "pass");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture() {
@@ -2004,7 +2005,7 @@ int igt_main()
 
 		igt_subtest("execute-abort-simple") {
 			struct execute_state state;
-			struct json_object *results, *tests;
+			struct json_t *results, *tests;
 			const char *argv[] = { "runner",
 					       "--allow-non-root",
 					       "-t", "^abort-simple$",
@@ -2022,11 +2023,11 @@ int igt_main()
 			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 				     "Results parsing failed\n");
 
-			igt_assert(json_object_object_get_ex(results, "tests", &tests));
+			igt_assert(tests = json_object_get(results, "tests"));
 
 			igt_assert_eqstr(igt_get_result(tests, "igt@abort-simple"), "abort");
 
-			igt_assert_eq(json_object_put(results), 1);
+			json_decref(results);
 		}
 
 		igt_fixture() {
@@ -2052,7 +2053,7 @@ int igt_main()
 
 			igt_subtest_f("execute-abort%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner",
 						       "--allow-non-root",
 						       "-t", "^abort$",
@@ -2071,7 +2072,7 @@ int igt_main()
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort@a-subtest"), "pass");
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort@b-subtest"), "abort");
@@ -2081,7 +2082,7 @@ int igt_main()
 				else
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort@c-subtest"), "notrun");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture() {
@@ -2108,7 +2109,7 @@ int igt_main()
 
 			igt_subtest_f("execute-abort-fixture%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "-t", "^abort-fixture$",
@@ -2126,7 +2127,7 @@ int igt_main()
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				if (multiple) {
 					/*
@@ -2141,7 +2142,7 @@ int igt_main()
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "notrun");
 				}
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture() {
@@ -2175,7 +2176,7 @@ int igt_main()
 
 			igt_subtest_f("execute-abort-fixture-testlist%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "--test-list", filename,
@@ -2193,7 +2194,7 @@ int igt_main()
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				if (multiple) /* multiple mode = no notruns */
 					igt_assert_no_result_for(tests, "igt@abort-fixture@a-subtest");
@@ -2203,7 +2204,7 @@ int igt_main()
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-fixture@b-subtest"), "abort");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture() {
@@ -2231,7 +2232,7 @@ int igt_main()
 
 			igt_subtest_f("execute-abort-dynamic%s", multiple ? "-multiple" : "") {
 				struct execute_state state;
-				struct json_object *results, *tests;
+				struct json_t *results, *tests;
 				const char *argv[] = { "runner", multiple ? "--multiple-mode" : "--sync",
 						       "--allow-non-root",
 						       "-t", "^abort-dynamic$",
@@ -2249,7 +2250,7 @@ int igt_main()
 				igt_assert_f((results = generate_results_json(dirfd)) != NULL,
 					     "Results parsing failed\n");
 
-				igt_assert(json_object_object_get_ex(results, "tests", &tests));
+				igt_assert(tests = json_object_get(results, "tests"));
 
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@a-subtest@dynamic-1"), "pass");
 				igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@b-subtest@dynamic-1"), "pass");
@@ -2262,7 +2263,7 @@ int igt_main()
 				else
 					igt_assert_eqstr(igt_get_result(tests, "igt@abort-dynamic@c-subtest"), "notrun");
 
-				igt_assert_eq(json_object_put(results), 1);
+				json_decref(results);
 			}
 
 			igt_fixture() {
-- 
2.52.0

