Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3E10E341
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:27:52 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:21 +0200
Message-Id: <20230613072726.4164-6-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/10] Change logic of ktap parser to run on
 a thread
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The ktap parser should be listening and parsing messages as the tests
are executed, and not after the end of module load.

v1 -> v2:
- fix coding style
- remove usleep
- add error check logic
- follow the structure of igt_kselftests more closely

v2 -> v3:
- fixed sublevel issues by rewriting tap parser flow

v3 -> v4:
- fixed delimiter

- squashed lib/igt_kmod: fix nesting igt_fixture in igt_subtest
Fix the following issue:
	$ ./build/tests/drm_buddy
	Starting subtest: all-tests
	nesting igt_fixture in igt_subtest is invalid
	please refer to lib/igt_core documentation

- squashed lib/igt_kmod: place KUnit tests on a subtest
There's a hidden bug at KUnit implementation: as it doesn't
place tests inside a subtest, trying to use it with igt_main
causes a crash:

	$ ./build/tests/drm_mm --list
	skipping is allowed only in fixtures, subtests or igt_simple_main
	please refer to lib/igt_core documentation
	drm_mm: ../lib/igt_core.c:437: internal_assert: Assertion `0' failed.
	Received signal SIGABRT.
	Stack trace:
	 #0 [fatal_sig_handler+0x17b]
	 #1 [__sigaction+0x50]
	 #2 [__pthread_kill_implementation+0x114]
	 #3 [gsignal+0x1e]
	 #4 [abort+0xdf]
	 #5 [__assert_fail_base.cold+0xe]
	 #6 [__assert_fail+0x47]
	 #7 [internal_assert+0xe5]
	 #8 [igt_skip+0x169]
	 #9 [__igt_skip_check+0x1bb]
	 #10 [igt_ktest_begin+0xa6]
	 #11 [igt_kunit+0x70]
	 #12 [main+0x2a]
	 #13 [__libc_start_call_main+0x7a]
	 #14 [__libc_start_main+0x8b]
	 #15 [_start+0x25]

Fix it by using igt_subtests() before actually implememnting
KUnit logic.

After the patch, it should now report subtests:

	$ ./build/tests/drm_mm --list
	all-tests

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c |  51 +++++-
 lib/igt_ktap.c | 431 ++++++++++++++++++++++++++++++++++++++++---------
 lib/igt_ktap.h |  21 ++-
 3 files changed, 421 insertions(+), 82 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 21e801bde..73478f75e 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -754,14 +754,15 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
  *
  * Returns: IGT default codes
  */
-int igt_kunit(const char *module_name, const char *opts)
+static int __igt_kunit(const char *module_name, const char *opts)
 {
 	struct igt_ktest tst;
 	struct kmod_module *kunit_kmod;
-	char record[BUF_LEN + 1];
 	FILE *f;
 	bool is_builtin;
 	int ret;
+	struct ktap_test_results *results;
+	struct ktap_test_results_element *temp;
 
 	ret = IGT_EXIT_INVALID;
 
@@ -804,25 +805,63 @@ int igt_kunit(const char *module_name, const char *opts)
 
 	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
 
+	results = ktap_parser_start(f, is_builtin);
+
 	if (igt_kmod_load(module_name, opts) != 0) {
 		igt_warn("Unable to load %s module\n", module_name);
+		ret = ktap_parser_stop();
 		igt_fail(IGT_EXIT_FAILURE);
 	}
 
-	ret = igt_ktap_parser(f, record, is_builtin);
-	if (ret != 0)
-		ret = IGT_EXIT_ABORT;
+	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
+	{
+		if (READ_ONCE(results->head) != NULL) {
+			pthread_mutex_lock(&results->mutex);
+
+			igt_dynamic(results->head->test_name) {
+				if (READ_ONCE(results->head->passed))
+					igt_success();
+				else
+					igt_fail(IGT_EXIT_FAILURE);
+			}
+
+			temp = results->head;
+			results->head = results->head->next;
+			free(temp);
+
+			pthread_mutex_unlock(&results->mutex);
+		}
+	}
+
 unload:
 	igt_ktest_end(&tst);
 
 	igt_ktest_fini(&tst);
 
+	ret = ktap_parser_stop();
+
+	if (ret != 0)
+		ret = IGT_EXIT_ABORT;
+
 	if (ret == 0)
 		igt_success();
-
 	return ret;
 }
 
+int igt_kunit(const char *module_name, const char *opts)
+{
+	/*
+	 * We need to use igt_subtest here, as otherwise it may crash with:
+	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
+	 * if used on igt_main. This is also needed in order to provide
+	 * proper namespace for dynamic subtests, with is required for CI
+	 * and for documentation.
+	 */
+	igt_subtest_with_dynamic("all-tests")
+		return __igt_kunit(module_name, opts);
+	return 0;
+}
+
 static int open_parameters(const char *module_name)
 {
 	char path[256];
diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 117598faa..ecdcb8d83 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -5,11 +5,25 @@
 
 #include <ctype.h>
 #include <limits.h>
+#include <libkmod.h>
+#include <pthread.h>
+#include <errno.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_ktap.h"
 
+#define DELIMITER "-"
+
+struct ktap_parser_args {
+	FILE *fp;
+	bool is_builtin;
+	volatile bool is_running;
+	int ret;
+} ktap_args;
+
+static struct ktap_test_results results;
+
 static int log_to_end(enum igt_log_level level, FILE *f,
 		      char *record, const char *format, ...) __attribute__((format(printf, 4, 5)));
 
@@ -30,6 +44,14 @@ static int log_to_end(enum igt_log_level level, FILE *f,
 {
 	va_list args;
 	const char *lend;
+	int f_fd = fileno(f);
+
+	/* Cutoff after newline character, in order to not display garbage */
+	char *cutoff = strchr(record, '\n');
+	if (cutoff) {
+		if (cutoff - record < BUF_LEN)
+			cutoff[1] = '\0';
+	}
 
 	va_start(args, format);
 	igt_vlog(IGT_LOG_DOMAIN, level, format, args);
@@ -38,10 +60,29 @@ static int log_to_end(enum igt_log_level level, FILE *f,
 	lend = strchrnul(record, '\n');
 	while (*lend == '\0') {
 		igt_log(IGT_LOG_DOMAIN, level, "%s", record);
-		if (fgets(record, BUF_LEN, f) == NULL) {
+
+		while (read(f_fd, record, BUF_LEN) < 0) {
+			if (!READ_ONCE(ktap_args.is_running)) {
+				igt_warn("ktap parser stopped\n");
+				return -2;
+			}
+
+			if (errno == EINTR)
+				continue;
+
+			if (errno == EPIPE) {
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				return -2;
+			}
+
+			if (errno == EAGAIN)
+				/* No records available */
+				continue;
+
 			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
+
 		lend = strchrnul(record, '\n');
 	}
 	return 0;
@@ -65,7 +106,7 @@ static long lookup_value(const char *haystack, const char *needle)
 	if (needle_rptr == NULL)
 		return -1;
 
-	/* skip search string and whitespaces after it */
+	/* Skip search string and whitespaces after it */
 	needle_rptr += strlen(needle);
 
 	num = strtol(needle_rptr, &needle_end, 10);
@@ -79,6 +120,41 @@ static long lookup_value(const char *haystack, const char *needle)
 	return num > 0 ? num : 0;
 }
 
+/**
+ * tap_version_present:
+ * @record: buffer with tap data
+ * @print_info: whether tap version should be printed or not
+ *
+ * Returns:
+ * 0 if not found
+ * 1 if found
+ */
+static int tap_version_present(char* record, bool print_info)
+{
+	/*
+	 * "(K)TAP version XX" should be the first line on all (sub)tests as per
+	 * https://kernel.org/doc/html/latest/dev-tools/ktap.html#version-lines
+	 *
+	 * but actually isn't, as it currently depends on the KUnit module
+	 * being built-in, so we can't rely on it every time
+	 */
+	const char *version_rptr = strcasestr(record, "TAP version ");
+	char *cutoff;
+
+	if (version_rptr == NULL)
+		return 0;
+
+	/* Cutoff after newline character, in order to not display garbage */
+	cutoff = strchr(version_rptr, '\n');
+	if (cutoff)
+		cutoff[0] = '\0';
+
+	if (print_info)
+		igt_info("%s\n", version_rptr);
+
+	return 1;
+}
+
 /**
  * find_next_tap_subtest:
  * @fp: FILE pointer
@@ -91,11 +167,12 @@ static long lookup_value(const char *haystack, const char *needle)
  * -2 if there are problems while reading the file.
  * any other value corresponds to the amount of cases of the next (sub)test
  */
-static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
+static int find_next_tap_subtest(FILE *fp, char *record, char *test_name, bool is_builtin)
 {
-	const char *test_lookup_str, *subtest_lookup_str, *name_rptr, *version_rptr;
-	char test_name[BUF_LEN + 1];
+	const char *test_lookup_str, *subtest_lookup_str, *name_rptr;
 	long test_count;
+	int fp_fd = fileno(fp);
+	char *cutoff;
 
 	test_name[0] = '\0';
 	test_name[BUF_LEN] = '\0';
@@ -103,21 +180,28 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 	test_lookup_str = " subtest: ";
 	subtest_lookup_str = " test: ";
 
-	/*
-	 * "(K)TAP version XX" should be the first line on all (sub)tests as per
-	 * https://kernel.org/doc/html/latest/dev-tools/ktap.html#version-lines
-	 *
-	 * but actually isn't, as it currently depends on the KUnit module
-	 * being built-in, so we can't rely on it every time
-	 */
+	if (!tap_version_present(record, true))
+		return -1;
+
 	if (is_builtin) {
-		version_rptr = strcasestr(record, "TAP version ");
-		if (version_rptr == NULL)
-			return -1;
+		while (read(fp_fd, record, BUF_LEN) < 0) {
+			if (!READ_ONCE(ktap_args.is_running)) {
+				igt_warn("ktap parser stopped\n");
+				return -2;
+			}
+
+			if (errno == EINTR)
+				continue;
 
-		igt_info("%s", version_rptr);
+			if (errno == EPIPE) {
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				return -2;
+			}
+
+			if (errno == EAGAIN)
+				/* No records available */
+				continue;
 
-		if (fgets(record, BUF_LEN, fp) == NULL) {
 			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
@@ -134,22 +218,45 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 
 	if (name_rptr == NULL) {
 		if (!is_builtin)
-			/* we've probably found nothing */
+			/* We've probably found nothing */
 			return -1;
 		igt_info("Missing test name\n");
 	} else {
 		strncpy(test_name, name_rptr, BUF_LEN);
-		if (fgets(record, BUF_LEN, fp) == NULL) {
+		/* Cutoff after newline character, in order to not display garbage */
+		cutoff = strchr(test_name, '\n');
+		if (cutoff)
+			cutoff[0] = '\0';
+
+		while (read(fp_fd, record, BUF_LEN) < 0) {
+			if (!READ_ONCE(ktap_args.is_running)) {
+				igt_warn("ktap parser stopped\n");
+				return -2;
+			}
+
+			if (errno == EINTR)
+				continue;
+
+			if (errno == EPIPE) {
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				return -2;
+			}
+
+			if (errno == EAGAIN)
+				/* No records available */
+				continue;
+
 			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
-		/* now we can be sure we found tests */
+
+		/* Now we can be sure we found tests */
 		if (!is_builtin)
 			igt_info("KUnit is not built-in, skipping version check...\n");
 	}
 
 	/*
-	 * total test count will almost always appear as 0..N at the beginning
+	 * Total test count will almost always appear as 0..N at the beginning
 	 * of a run, so we use it to reliably identify a new run
 	 */
 	test_count = lookup_value(record, "..");
@@ -159,7 +266,7 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 		if (test_name[0] == '\0')
 			return 0;
 		if (log_to_end(IGT_LOG_INFO, fp, record,
-				"Running some tests in: %s",
+				"Running some tests in: %s\n",
 				test_name) < 0)
 			return -2;
 		return 0;
@@ -169,7 +276,7 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 	}
 
 	if (log_to_end(IGT_LOG_INFO, fp, record,
-			"Executing %ld tests in: %s",
+			"Executing %ld tests in: %s\n",
 			test_count, test_name) < 0)
 		return -2;
 
@@ -177,7 +284,7 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 }
 
 /**
- * find_next_tap_test:
+ * parse_kmsg_for_tap:
  * @fp: FILE pointer
  * @record: buffer used to read fp
  * @test_name: buffer to store the test name
@@ -225,7 +332,7 @@ static int parse_kmsg_for_tap(FILE *fp, char *record, char *test_name)
 
 	comment_start = strchrnul(lstart, '#');
 
-	/* check if we're still in a subtest */
+	/* Check if we're still in a subtest */
 	if (*comment_start != '\0') {
 		comment_start++;
 		value_parse_start = comment_start;
@@ -254,81 +361,255 @@ static int parse_kmsg_for_tap(FILE *fp, char *record, char *test_name)
 }
 
 /**
- * igt_ktap_parser:
+ * parse_tap_level:
  * @fp: FILE pointer
- * @record: buffer used to read fp
+ * @base_test_name: test_name from upper recursion level
+ * @test_count: test_count of this level
+ * @failed_tests: top level failed_tests pointer
+ * @found_tests: top level found_tests pointer
  * @is_builtin: whether the KUnit module is built-in or not
  *
- * This function parses the output of a ktap script and prints the test results,
- * as well as any other output to stdout.
- *
- * Returns: IGT default codes
+ * Returns:
+ * 0 if succeded
+ * -1 if error occurred
  */
-int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
+static int parse_tap_level(FILE *fp, char *base_test_name, int test_count, bool *failed_tests,
+			   bool *found_tests, bool is_builtin)
 {
+	int fp_fd = fileno(fp);
+	char record[BUF_LEN + 1];
+	struct ktap_test_results_element *r, *temp;
+	int internal_test_count;
 	char test_name[BUF_LEN + 1];
-	bool failed_tests, found_tests;
-	int sublevel = 0;
+	char base_test_name_for_next_level[BUF_LEN + 1];
 
-	test_name[0] = '\0';
-	test_name[BUF_LEN] = '\0';
+	for (int i = 0; i < test_count; i++) {
+		while (read(fp_fd, record, BUF_LEN) < 0) {
+			if (!READ_ONCE(ktap_args.is_running)) {
+				igt_warn("ktap parser stopped\n");
+				return -1;
+			}
 
-	failed_tests = false;
-	found_tests = false;
+			if (errno == EINTR)
+				continue;
 
-	while (sublevel >= 0) {
-		if (fgets(record, BUF_LEN, fp) == NULL) {
-			if (!found_tests)
-				igt_warn("kmsg truncated: unknown error (%m)\n");
-			break;
+			if (errno == EAGAIN)
+				/* No records available */
+				continue;
+
+			if (errno == EPIPE) {
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				return -1;
+			}
+
+			igt_warn("kmsg truncated: unknown error (%m)\n");
+			return -1;
 		}
 
-		switch (find_next_tap_subtest(fp, record, is_builtin)) {
-		case -2:
-			/* no more data to read */
-			return IGT_EXIT_FAILURE;
-		case -1:
-			/* no test found, so we keep parsing */
-			break;
-		case 0:
-			/*
-			 * tests found, but they're missing info, so we might
-			 * have read into test output
-			 */
-			found_tests = true;
-			sublevel++;
-			break;
-		default:
-			if (fgets(record, BUF_LEN, fp) == NULL) {
-				igt_warn("kmsg truncated: unknown error (%m)\n");
-				return -2;
+		/* Sublevel found */
+		if (tap_version_present(record, false))
+		{
+			internal_test_count = find_next_tap_subtest(fp, record, test_name,
+								    is_builtin);
+			switch (internal_test_count) {
+			case -2:
+				/* No more data to read */
+				return -1;
+			case -1:
+				/* No test found */
+				return -1;
+			case 0:
+				/* Tests found, but they're missing info */
+				*found_tests = true;
+				return -1;
+			default:
+				*found_tests = true;
+
+				memcpy(base_test_name_for_next_level, base_test_name, BUF_LEN);
+				if (strlen(base_test_name_for_next_level) < BUF_LEN - 1 &&
+				    base_test_name_for_next_level[0])
+					strncat(base_test_name_for_next_level, DELIMITER,
+						BUF_LEN - strlen(base_test_name_for_next_level));
+				memcpy(base_test_name_for_next_level + strlen(base_test_name_for_next_level),
+				       test_name, BUF_LEN - strlen(base_test_name_for_next_level));
+
+				if (parse_tap_level(fp, base_test_name_for_next_level,
+						    internal_test_count, failed_tests, found_tests,
+						    is_builtin) == -1)
+					return -1;
+				break;
 			}
-			found_tests = true;
-			sublevel++;
-			break;
 		}
 
 		switch (parse_kmsg_for_tap(fp, record, test_name)) {
 		case -2:
-			return IGT_EXIT_FAILURE;
+			return -1;
 		case -1:
-			sublevel--;
-			failed_tests = true;
-			igt_subtest(test_name)
-				igt_fail(IGT_EXIT_FAILURE);
+			*failed_tests = true;
+
+			r = malloc(sizeof(*r));
+
+			memcpy(r->test_name, base_test_name, BUF_LEN);
+			if (strlen(r->test_name) < BUF_LEN - 1)
+				if (r->test_name[0])
+					strncat(r->test_name, DELIMITER,
+						BUF_LEN - strlen(r->test_name));
+			memcpy(r->test_name + strlen(r->test_name), test_name,
+			       BUF_LEN - strlen(r->test_name));
+			r->test_name[BUF_LEN] = '\0';
+
+			r->passed = false;
+			r->next = NULL;
+
+			pthread_mutex_lock(&results.mutex);
+			if (results.head == NULL) {
+				results.head = r;
+			} else {
+				temp = results.head;
+				while (temp->next != NULL)
+					temp = temp->next;
+				temp->next = r;
+			}
+			pthread_mutex_unlock(&results.mutex);
+
 			test_name[0] = '\0';
 			break;
-		case 0: /* fallthrough */
-			igt_subtest(test_name)
-				igt_success();
+		case 0:
+			r = malloc(sizeof(*r));
+
+			memcpy(r->test_name, base_test_name, BUF_LEN);
+			if (strlen(r->test_name) < BUF_LEN - 1)
+				if (r->test_name[0])
+					strncat(r->test_name, DELIMITER,
+						BUF_LEN - strlen(r->test_name));
+			memcpy(r->test_name + strlen(r->test_name), test_name,
+			       BUF_LEN - strlen(r->test_name));
+			r->test_name[BUF_LEN] = '\0';
+
+			r->passed = true;
+			r->next = NULL;
+
+			pthread_mutex_lock(&results.mutex);
+			if (results.head == NULL) {
+				results.head = r;
+			} else {
+				temp = results.head;
+				while (temp->next != NULL)
+					temp = temp->next;
+				temp->next = r;
+			}
+			pthread_mutex_unlock(&results.mutex);
+
 			test_name[0] = '\0';
+			break;
 		default:
 			break;
 		}
 	}
+	return 0;
+}
+
+/**
+ * igt_ktap_parser:
+ *
+ * This function parses the output of a ktap script and passes it to main thread.
+ */
+void *igt_ktap_parser(void *unused)
+{
+	FILE *fp = ktap_args.fp;
+	int fp_fd = fileno(fp);
+	char record[BUF_LEN + 1];
+	bool is_builtin = ktap_args.is_builtin;
+	char test_name[BUF_LEN + 1];
+	bool failed_tests, found_tests;
+	int test_count;
+
+	failed_tests = false;
+	found_tests = false;
+
+	if (!READ_ONCE(ktap_args.is_running))
+		goto igt_ktap_parser_end;
+
+igt_ktap_parser_start:
+	test_name[0] = '\0';
+	test_name[BUF_LEN] = '\0';
+
+	while (read(fp_fd, record, BUF_LEN) < 0) {
+		if (!READ_ONCE(ktap_args.is_running)) {
+			igt_warn("ktap parser stopped\n");
+			goto igt_ktap_parser_end;
+		}
+
+		if (errno == EAGAIN)
+			/* No records available */
+			continue;
+
+		if (errno == EINTR)
+			continue;
+
+		if (errno == EPIPE) {
+			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+			goto igt_ktap_parser_end;
+		}
+	}
+
+	test_count = find_next_tap_subtest(fp, record, test_name, is_builtin);
+
+	switch (test_count) {
+	case -2:
+		/* Problems while reading the file */
+		goto igt_ktap_parser_end;
+	case -1:
+		/* No test found */
+		goto igt_ktap_parser_start;
+	case 0:
+		/* Tests found, but they're missing info */
+		found_tests = true;
+		goto igt_ktap_parser_end;
+	default:
+		found_tests = true;
+
+		if (parse_tap_level(fp, test_name, test_count, &failed_tests, &found_tests,
+				    is_builtin) == -1)
+			goto igt_ktap_parser_end;
+
+		break;
+	}
+
+	/* Parse topmost level */
+	test_name[0] = '\0';
+	parse_tap_level(fp, test_name, test_count, &failed_tests, &found_tests, is_builtin);
+
+igt_ktap_parser_end:
+	results.still_running = false;
 
 	if (failed_tests || !found_tests)
-		return IGT_EXIT_FAILURE;
+		ktap_args.ret = IGT_EXIT_FAILURE;
+	else
+		ktap_args.ret = IGT_EXIT_SUCCESS;
+
+	return NULL;
+}
+
+static pthread_t ktap_parser_thread;
+
+struct ktap_test_results *ktap_parser_start(FILE *fp, bool is_builtin)
+{
+	results.head = NULL;
+	pthread_mutex_init(&results.mutex, NULL);
+	results.still_running = true;
 
-	return IGT_EXIT_SUCCESS;
+	ktap_args.fp = fp;
+	ktap_args.is_builtin = is_builtin;
+	ktap_args.is_running = true;
+	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
+
+	return &results;
+}
+
+int ktap_parser_stop(void)
+{
+	ktap_args.is_running = false;
+	pthread_join(ktap_parser_thread, NULL);
+	return ktap_args.ret;
 }
diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
index b2f69df2d..34fe09572 100644
--- a/lib/igt_ktap.h
+++ b/lib/igt_ktap.h
@@ -26,6 +26,25 @@
 
 #define BUF_LEN 4096
 
-int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
+#include <pthread.h>
+
+void *igt_ktap_parser(void *unused);
+
+typedef struct ktap_test_results_element {
+	char test_name[BUF_LEN + 1];
+	bool passed;
+	struct ktap_test_results_element *next;
+} ktap_test_results_element;
+
+struct ktap_test_results {
+	ktap_test_results_element *head;
+	pthread_mutex_t mutex;
+	bool still_running;
+};
+
+
+
+struct ktap_test_results *ktap_parser_start(FILE *fp, bool is_builtin);
+int ktap_parser_stop(void);
 
 #endif /* IGT_KTAP_H */
-- 
2.34.1


