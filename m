Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D0410E933
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 15:56:32 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LPk2z59KlzDrfk
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 15:48:11 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 12:47:52 -0300
Message-Id: <20220617154753.30175-2-isabbasso@riseup.net>
In-Reply-To: <20220617154753.30175-1-isabbasso@riseup.net>
References: <20220617154753.30175-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] igt_kmod: add compatibility for KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 leandro.ribeiro@collabora.com, David Gow <davidgow@google.com>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, brendanhiggins@google.com,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This adds functions for both executing the tests as well as parsing (K)TAP
kmsg output, as per the KTAP spec [1].

[1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 lib/igt_kmod.c | 269 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kmod.h |   3 +
 2 files changed, 272 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index dfdcfcc5..d38cd221 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -25,6 +25,7 @@
 #include <signal.h>
 #include <errno.h>
 #include <sys/utsname.h>
+#include <limits.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
@@ -32,6 +33,8 @@
 #include "igt_sysfs.h"
 #include "igt_taints.h"
 
+#define BUF_LEN 4096
+
 /**
  * SECTION:igt_kmod
  * @short_description: Wrappers around libkmod for module loading/unloading
@@ -372,6 +375,272 @@ static void *strdup_realloc(char *origptr, const char *strdata)
 	return newptr;
 }
 
+static void find_next_tap_subtest(char *record, int *ret, bool is_subtest)
+{
+	char test_count_ptr[12];
+	const char *test_search_str, *ver_search_str, *lend,
+	      *ver_res_ptr, *test_res_ptr;
+	int test_count_strlen;
+	long test_count;
+
+	/* total tests will appear as 0..N at the beginning of a run */
+	test_search_str = "..";
+	ver_search_str = "TAP version ";
+
+	ver_res_ptr = strstr(record, ver_search_str);
+	test_res_ptr = strstr(record, test_search_str);
+
+	*ret = -1;
+
+	if (test_res_ptr == NULL)
+		return;
+
+	test_res_ptr += strlen(test_search_str);
+	lend = strchrnul(test_res_ptr, '\n');
+	/* in case line > 4096 */
+	if (*lend == '\0') {
+		igt_info("%s\n", record);
+		return;
+	}
+
+	test_count_strlen = (int)(lend - test_res_ptr);
+	if (test_count_strlen > sizeof(test_count_ptr) - 1)
+		return;
+	strncpy(test_count_ptr, test_res_ptr, test_count_strlen);
+
+	test_count_ptr[test_count_strlen] = '\0';
+	test_count = strtol(test_count_ptr, NULL, 10);
+	if (test_count == LONG_MIN || test_count == LONG_MAX)
+		return;
+
+	/* "(K)TAP version XX" should be the first line on all (sub)tests as per
+	 * https://www.kernel.org/doc/html/latest/dev-tools/ktap.html#version-lines
+	 * but actually isn't, as it currently depends on who writes the test
+	 * to print this */
+	if (ver_res_ptr == NULL)
+		igt_info("Missing test version string\n");
+
+	if (is_subtest)
+		igt_info("running %d subtests...\n", (int)test_count);
+	else
+		igt_info("running %d tests...\n", (int)test_count);
+
+	*ret = (int)test_count;
+	return;
+}
+
+static void print_tap(int fd, char *record, int *sublevel, bool *failed_tests)
+{
+	const char *test_fail_search_str;
+	ssize_t r;
+	/* for each sublevel we have 2 spaces indent */
+	const int indent_len = (*sublevel + 1) * 2;;
+
+	test_fail_search_str = "not ok ";
+
+	for (; *sublevel > 0;) {
+		const char *lend, *test_fail_res, *lstart, *i_end;
+		int *ret, retval, llen;
+
+		ret = &retval;
+
+		lend = strchrnul(record, '\n');
+
+		if (*lend != '\0')
+			lseek(fd, (int)(lend - record), SEEK_CUR);
+
+		r = read(fd, record, BUF_LEN);
+
+		if (r <= 0) {
+			switch (errno) {
+			case EINTR:
+				continue;
+			case EPIPE:
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				continue;
+			case !EAGAIN:
+				igt_warn("kmsg truncated: unknown error (%m)\n");
+			default:
+				break;
+			}
+			break;
+		}
+
+		find_next_tap_subtest(record, ret, true);
+		if (*ret != -1) {
+			(*sublevel)++;
+			print_tap(fd, record, sublevel, failed_tests);
+		}
+
+		lend = strchrnul(record, '\n');
+
+		/* in case line > 4096 */
+		if (*lend == '\0') {
+			igt_info("%s\n", record);
+			continue;
+		}
+
+		lstart = strchrnul(record, ';');
+
+		/* check if we're still in a subtest */
+		if (*lstart == '\0') {
+			igt_warn("kmsg truncated: output malformed (%m)\n");
+			igt_fail(IGT_EXIT_FAILURE);
+		} else {
+			lstart++;
+			i_end = lstart;
+			while (isspace(*i_end))
+				i_end++;
+			llen = (int)(i_end - lstart);
+			if (llen != indent_len)
+				break;
+		}
+
+		test_fail_res = strstr(record, test_fail_search_str);
+		if (test_fail_res != NULL) {
+			igt_warn("kmsg> %.*s\n",
+				 (int)(lend - lstart) - 1, lstart);
+			*failed_tests = true;
+			continue;
+		}
+
+		igt_info("kmsg> %.*s\n",
+			 (int)(lend - lstart) - 1, lstart);
+	}
+	(*sublevel)--;
+}
+
+static void parse_kmsg_for_tap(int fd)
+{
+	char record[BUF_LEN + 1];
+	int test_sublevel;
+	bool failed_tests, skip, found_tests;
+
+	test_sublevel = 0;
+
+	skip = true;
+	failed_tests = false;
+	found_tests = false;
+
+	if (fd == -1) {
+		igt_warn("Unable to retrieve kernel log (from /dev/kmsg)\n");
+		return;
+	}
+
+	record[BUF_LEN] = '\0';
+
+	while (true) {
+		const char *lend;
+		int *ret, retval;
+		ssize_t r;
+		ret = &retval;
+
+		lend = strchrnul(record, '\n');
+
+		if (!skip && *lend != '\0')
+			lseek(fd, (int) (lend - record), SEEK_CUR);
+
+		r = read(fd, record, BUF_LEN);
+
+		if (!skip)
+			lend = strchrnul(record, '\n');
+		else
+			skip = false;
+
+		if (r <= 0) {
+			switch (errno) {
+			case EINTR:
+				continue;
+			case EPIPE:
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				continue;
+			case !EAGAIN:
+				igt_warn("kmsg truncated: unknown error (%m)\n");
+			default:
+				break;
+			}
+			break;
+		}
+
+		find_next_tap_subtest(record, ret, false);
+		if (*ret != -1) {
+			found_tests = true;
+			test_sublevel++;
+			print_tap(fd, record, &test_sublevel, &failed_tests);
+		}
+	}
+
+	if (failed_tests || !found_tests)
+		igt_fail(IGT_EXIT_FAILURE);
+	else
+		igt_success();
+}
+
+/**
+ * igt_kunit: tests a kunit module
+ * @mod_name: the name of the module
+ * @options: options to load the module
+ * @req_mods: array with additional dependencies to run the KUnit test
+ * @req_mod_len: size of req_mods array
+ *
+ * Loads the kunit module, parses its dmesg output, then unloads it
+ */
+void igt_kunit(const char *mod_name, const char *options,
+	       const char **req_mods, int req_mod_len)
+{
+	int kmsg_fd, cmi = 0;
+	struct igt_kselftest tst;
+	const char *norm_name;
+
+	/* get normalized module name */
+	igt_require(igt_kselftest_init(&tst, mod_name) == 0);
+
+	norm_name = kmod_module_get_name(tst.kmod);
+
+	if (!igt_kmod_is_loaded(norm_name)) {
+		for (cmi = 0; cmi < req_mod_len; cmi++) {
+			if (igt_kmod_load(req_mods[cmi], NULL))
+				goto unload;
+		}
+
+		/* The kunit module is required for running any kunit tests */
+		if (!igt_kmod_is_loaded("kunit"))
+			igt_require(igt_kmod_load("kunit", NULL) == 0);
+
+	} else {
+		/* Unload module if loaded (maybe previous run bailed out?) */
+		igt_kmod_unload(mod_name, 0);
+	}
+
+	kmsg_fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+
+	if (kmsg_fd < 0) {
+		igt_warn("Could not open /dev/kmsg");
+		goto unload;
+	}
+
+	if (lseek(kmsg_fd, 0, SEEK_END)) {
+		igt_warn("Could not seek the end of /dev/kmsg");
+		close(kmsg_fd);
+		goto unload;
+	}
+
+	igt_require(igt_kmod_load(mod_name, options) == 0);
+
+	parse_kmsg_for_tap(kmsg_fd);
+
+	igt_kmod_unload(mod_name, 0);
+
+	close(kmsg_fd);
+unload:
+	for (cmi--; cmi >= 0; cmi--) {
+		igt_kmod_unload(req_mods[cmi], 0);
+	}
+
+	if (igt_kmod_is_loaded("kunit"))
+		igt_require(igt_kmod_load("kunit", NULL) == 0);
+}
+
 /**
  * igt_i915_driver_load:
  * @opts: options to pass to i915 driver
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index f98dd29f..6d8b5968 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -38,6 +38,9 @@ int igt_kmod_unload(const char *mod_name, unsigned int flags);
 
 int igt_audio_driver_unload(char **whom);
 
+void igt_kunit(const char *mod_name, const char *options,
+	       const char **req_mods, int req_mod_len);
+
 int igt_i915_driver_load(const char *opts);
 int igt_i915_driver_unload(void);
 int __igt_i915_driver_unload(char **whom);
-- 
2.36.1
