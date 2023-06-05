Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE8210E28D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:47:57 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Mon,  5 Jun 2023 12:47:11 +0200
Message-Id: <20230605104716.5678-4-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/igt_kmod: add compatibility for
 KUnit
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
Cc: Isabella Basso <isabbasso@riseup.net>
List-ID: <igt-dev@lists.freedesktop.org>

From: Isabella Basso <isabbasso@riseup.net>

This adds functions for both executing the tests as well as parsing (K)TAP
kmsg output, as per the KTAP spec [1].

[1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html

v1 -> v2:
- refactor igt_kunit function and ktap parser so that we have only one
  parser that we call only once (code size is now less than half the
  size as v1)
- add lookup_value helper
- fix parsing problems
v2 -> v3:
- move ktap parsing functions to own file
- rename to ktap_parser
- get rid of unneeded pointers in igt_kunit
- change return values to allow for subsequent call to igt_kselftests if
  needed
- add docs to parsing functions and helpers
- switch to line buffering
- add line buffering logging helper
- fix kunit module handling
- fix parsing of version lines
- use igt_subtest blocks to improve output handling on the CI
- fix output handling during crashes

Signed-off-by: Isabella Basso <isabbasso@riseup.net>

v3 -> v4:
- handle igt_ktap_parser fail with IGT_EXIT_ABORT code

v4 -> v5:
- added missing newlines in igt_warn
- removed setvbuf

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c  |  79 ++++++++++++
 lib/igt_kmod.h  |   2 +
 lib/igt_ktap.c  | 334 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_ktap.h  |  31 +++++
 lib/meson.build |   1 +
 5 files changed, 447 insertions(+)
 create mode 100644 lib/igt_ktap.c
 create mode 100644 lib/igt_ktap.h

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 26d58e29..21e801bd 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -29,6 +29,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_kmod.h"
+#include "igt_ktap.h"
 #include "igt_sysfs.h"
 #include "igt_taints.h"
 
@@ -744,6 +745,84 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	kmod_module_info_free_list(pre);
 }
 
+/**
+ * igt_kunit:
+ * @module_name: the name of the module
+ * @opts: options to load the module
+ *
+ * Loads the test module, parses its (k)tap dmesg output, then unloads it
+ *
+ * Returns: IGT default codes
+ */
+int igt_kunit(const char *module_name, const char *opts)
+{
+	struct igt_ktest tst;
+	struct kmod_module *kunit_kmod;
+	char record[BUF_LEN + 1];
+	FILE *f;
+	bool is_builtin;
+	int ret;
+
+	ret = IGT_EXIT_INVALID;
+
+	/* get normalized module name */
+	if (igt_ktest_init(&tst, module_name) != 0) {
+		igt_warn("Unable to initialize ktest for %s\n", module_name);
+		return ret;
+	}
+
+	if (igt_ktest_begin(&tst) != 0) {
+		igt_warn("Unable to begin ktest for %s\n", module_name);
+
+		igt_ktest_fini(&tst);
+		return ret;
+	}
+
+	if (tst.kmsg < 0) {
+		igt_warn("Could not open /dev/kmsg\n");
+		goto unload;
+	}
+
+	if (lseek(tst.kmsg, 0, SEEK_END)) {
+		igt_warn("Could not seek the end of /dev/kmsg\n");
+		goto unload;
+	}
+
+	f = fdopen(tst.kmsg, "r");
+
+	if (f == NULL) {
+		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer\n");
+		goto unload;
+	}
+
+	/* The KUnit module is required for running any KUnit tests */
+	if (igt_kmod_load("kunit", NULL) != 0 ||
+	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
+		igt_warn("Unable to load KUnit\n");
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+
+	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
+
+	if (igt_kmod_load(module_name, opts) != 0) {
+		igt_warn("Unable to load %s module\n", module_name);
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+
+	ret = igt_ktap_parser(f, record, is_builtin);
+	if (ret != 0)
+		ret = IGT_EXIT_ABORT;
+unload:
+	igt_ktest_end(&tst);
+
+	igt_ktest_fini(&tst);
+
+	if (ret == 0)
+		igt_success();
+
+	return ret;
+}
+
 static int open_parameters(const char *module_name)
 {
 	char path[256];
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index ff59f1ec..ce17c714 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -71,6 +71,8 @@ static inline int igt_xe_driver_unload(void)
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
 
+int igt_kunit(const char *module_name, const char *opts);
+
 void igt_kselftests(const char *module_name,
 		    const char *module_options,
 		    const char *result_option,
diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
new file mode 100644
index 00000000..117598fa
--- /dev/null
+++ b/lib/igt_ktap.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Isabella Basso do Amaral <isabbasso@riseup.net>
+ */
+
+#include <ctype.h>
+#include <limits.h>
+
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_ktap.h"
+
+static int log_to_end(enum igt_log_level level, FILE *f,
+		      char *record, const char *format, ...) __attribute__((format(printf, 4, 5)));
+
+/**
+ * log_to_end:
+ * @level: #igt_log_level
+ * @record: record to store the read data
+ * @format: format string
+ * @...: optional arguments used in the format string
+ *
+ * This is an altered version of the generic structured logging helper function
+ * igt_log capable of reading to the end of a given line.
+ *
+ * Returns: 0 for success, or -2 if there's an error reading from the file
+ */
+static int log_to_end(enum igt_log_level level, FILE *f,
+		      char *record, const char *format, ...)
+{
+	va_list args;
+	const char *lend;
+
+	va_start(args, format);
+	igt_vlog(IGT_LOG_DOMAIN, level, format, args);
+	va_end(args);
+
+	lend = strchrnul(record, '\n');
+	while (*lend == '\0') {
+		igt_log(IGT_LOG_DOMAIN, level, "%s", record);
+		if (fgets(record, BUF_LEN, f) == NULL) {
+			igt_warn("kmsg truncated: unknown error (%m)\n");
+			return -2;
+		}
+		lend = strchrnul(record, '\n');
+	}
+	return 0;
+}
+
+/**
+ * lookup_value:
+ * @haystack: the string to search in
+ * @needle: the string to search for
+ *
+ * Returns: the value of the needle in the haystack, or -1 if not found.
+ */
+static long lookup_value(const char *haystack, const char *needle)
+{
+	const char *needle_rptr;
+	char *needle_end;
+	long num;
+
+	needle_rptr = strcasestr(haystack, needle);
+
+	if (needle_rptr == NULL)
+		return -1;
+
+	/* skip search string and whitespaces after it */
+	needle_rptr += strlen(needle);
+
+	num = strtol(needle_rptr, &needle_end, 10);
+
+	if (needle_rptr == needle_end)
+		return -1;
+
+	if (num == LONG_MIN || num == LONG_MAX)
+		return 0;
+
+	return num > 0 ? num : 0;
+}
+
+/**
+ * find_next_tap_subtest:
+ * @fp: FILE pointer
+ * @record: buffer used to read fp
+ * @is_builtin: whether KUnit is built-in or not
+ *
+ * Returns:
+ * 0 if there's missing information
+ * -1 if not found
+ * -2 if there are problems while reading the file.
+ * any other value corresponds to the amount of cases of the next (sub)test
+ */
+static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
+{
+	const char *test_lookup_str, *subtest_lookup_str, *name_rptr, *version_rptr;
+	char test_name[BUF_LEN + 1];
+	long test_count;
+
+	test_name[0] = '\0';
+	test_name[BUF_LEN] = '\0';
+
+	test_lookup_str = " subtest: ";
+	subtest_lookup_str = " test: ";
+
+	/*
+	 * "(K)TAP version XX" should be the first line on all (sub)tests as per
+	 * https://kernel.org/doc/html/latest/dev-tools/ktap.html#version-lines
+	 *
+	 * but actually isn't, as it currently depends on the KUnit module
+	 * being built-in, so we can't rely on it every time
+	 */
+	if (is_builtin) {
+		version_rptr = strcasestr(record, "TAP version ");
+		if (version_rptr == NULL)
+			return -1;
+
+		igt_info("%s", version_rptr);
+
+		if (fgets(record, BUF_LEN, fp) == NULL) {
+			igt_warn("kmsg truncated: unknown error (%m)\n");
+			return -2;
+		}
+	}
+
+	name_rptr = strcasestr(record, test_lookup_str);
+	if (name_rptr != NULL) {
+		name_rptr += strlen(test_lookup_str);
+	} else {
+		name_rptr = strcasestr(record, subtest_lookup_str);
+		if (name_rptr != NULL)
+			name_rptr += strlen(subtest_lookup_str);
+	}
+
+	if (name_rptr == NULL) {
+		if (!is_builtin)
+			/* we've probably found nothing */
+			return -1;
+		igt_info("Missing test name\n");
+	} else {
+		strncpy(test_name, name_rptr, BUF_LEN);
+		if (fgets(record, BUF_LEN, fp) == NULL) {
+			igt_warn("kmsg truncated: unknown error (%m)\n");
+			return -2;
+		}
+		/* now we can be sure we found tests */
+		if (!is_builtin)
+			igt_info("KUnit is not built-in, skipping version check...\n");
+	}
+
+	/*
+	 * total test count will almost always appear as 0..N at the beginning
+	 * of a run, so we use it to reliably identify a new run
+	 */
+	test_count = lookup_value(record, "..");
+
+	if (test_count <= 0) {
+		igt_info("Missing test count\n");
+		if (test_name[0] == '\0')
+			return 0;
+		if (log_to_end(IGT_LOG_INFO, fp, record,
+				"Running some tests in: %s",
+				test_name) < 0)
+			return -2;
+		return 0;
+	} else if (test_name[0] == '\0') {
+		igt_info("Running %ld tests...\n", test_count);
+		return 0;
+	}
+
+	if (log_to_end(IGT_LOG_INFO, fp, record,
+			"Executing %ld tests in: %s",
+			test_count, test_name) < 0)
+		return -2;
+
+	return test_count;
+}
+
+/**
+ * find_next_tap_test:
+ * @fp: FILE pointer
+ * @record: buffer used to read fp
+ * @test_name: buffer to store the test name
+ *
+ * Returns:
+ * 1 if no results were found
+ * 0 if a test succeded
+ * -1 if a test failed
+ * -2 if there are problems reading the file
+ */
+static int parse_kmsg_for_tap(FILE *fp, char *record, char *test_name)
+{
+	const char *lstart, *ok_lookup_str, *nok_lookup_str,
+	      *ok_rptr, *nok_rptr, *comment_start, *value_parse_start;
+	char *test_name_end;
+
+	ok_lookup_str = "ok ";
+	nok_lookup_str = "not ok ";
+
+	lstart = strchrnul(record, ';');
+
+	if (*lstart == '\0') {
+		igt_warn("kmsg truncated: output malformed (%m)\n");
+		return -2;
+	}
+
+	lstart++;
+	while (isspace(*lstart))
+		lstart++;
+
+	nok_rptr = strstr(lstart, nok_lookup_str);
+	if (nok_rptr != NULL) {
+		nok_rptr += strlen(nok_lookup_str);
+		while (isdigit(*nok_rptr) || isspace(*nok_rptr) || *nok_rptr == '-')
+			nok_rptr++;
+		test_name_end = strncpy(test_name, nok_rptr, BUF_LEN);
+		while (!isspace(*test_name_end))
+			test_name_end++;
+		*test_name_end = '\0';
+		if (log_to_end(IGT_LOG_WARN, fp, record,
+			       "%s", lstart) < 0)
+			return -2;
+		return -1;
+	}
+
+	comment_start = strchrnul(lstart, '#');
+
+	/* check if we're still in a subtest */
+	if (*comment_start != '\0') {
+		comment_start++;
+		value_parse_start = comment_start;
+
+		if (lookup_value(value_parse_start, "fail: ") > 0) {
+			if (log_to_end(IGT_LOG_WARN, fp, record,
+				       "%s", lstart) < 0)
+				return -2;
+			return -1;
+		}
+	}
+
+	ok_rptr = strstr(lstart, ok_lookup_str);
+	if (ok_rptr != NULL) {
+		ok_rptr += strlen(ok_lookup_str);
+		while (isdigit(*ok_rptr) || isspace(*ok_rptr) || *ok_rptr == '-')
+			ok_rptr++;
+		test_name_end = strncpy(test_name, ok_rptr, BUF_LEN);
+		while (!isspace(*test_name_end))
+			test_name_end++;
+		*test_name_end = '\0';
+		return 0;
+	}
+
+	return 1;
+}
+
+/**
+ * igt_ktap_parser:
+ * @fp: FILE pointer
+ * @record: buffer used to read fp
+ * @is_builtin: whether the KUnit module is built-in or not
+ *
+ * This function parses the output of a ktap script and prints the test results,
+ * as well as any other output to stdout.
+ *
+ * Returns: IGT default codes
+ */
+int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
+{
+	char test_name[BUF_LEN + 1];
+	bool failed_tests, found_tests;
+	int sublevel = 0;
+
+	test_name[0] = '\0';
+	test_name[BUF_LEN] = '\0';
+
+	failed_tests = false;
+	found_tests = false;
+
+	while (sublevel >= 0) {
+		if (fgets(record, BUF_LEN, fp) == NULL) {
+			if (!found_tests)
+				igt_warn("kmsg truncated: unknown error (%m)\n");
+			break;
+		}
+
+		switch (find_next_tap_subtest(fp, record, is_builtin)) {
+		case -2:
+			/* no more data to read */
+			return IGT_EXIT_FAILURE;
+		case -1:
+			/* no test found, so we keep parsing */
+			break;
+		case 0:
+			/*
+			 * tests found, but they're missing info, so we might
+			 * have read into test output
+			 */
+			found_tests = true;
+			sublevel++;
+			break;
+		default:
+			if (fgets(record, BUF_LEN, fp) == NULL) {
+				igt_warn("kmsg truncated: unknown error (%m)\n");
+				return -2;
+			}
+			found_tests = true;
+			sublevel++;
+			break;
+		}
+
+		switch (parse_kmsg_for_tap(fp, record, test_name)) {
+		case -2:
+			return IGT_EXIT_FAILURE;
+		case -1:
+			sublevel--;
+			failed_tests = true;
+			igt_subtest(test_name)
+				igt_fail(IGT_EXIT_FAILURE);
+			test_name[0] = '\0';
+			break;
+		case 0: /* fallthrough */
+			igt_subtest(test_name)
+				igt_success();
+			test_name[0] = '\0';
+		default:
+			break;
+		}
+	}
+
+	if (failed_tests || !found_tests)
+		return IGT_EXIT_FAILURE;
+
+	return IGT_EXIT_SUCCESS;
+}
diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
new file mode 100644
index 00000000..b2f69df2
--- /dev/null
+++ b/lib/igt_ktap.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright © 2022 Isabella Basso do Amaral <isabbasso@riseup.net>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef IGT_KTAP_H
+#define IGT_KTAP_H
+
+#define BUF_LEN 4096
+
+int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
+
+#endif /* IGT_KTAP_H */
diff --git a/lib/meson.build b/lib/meson.build
index 55efdc83..1b33ea91 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -88,6 +88,7 @@ lib_sources = [
 	'igt_store.c',
 	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
+	'igt_ktap.c',
 	'igt_panfrost.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
-- 
2.34.1


