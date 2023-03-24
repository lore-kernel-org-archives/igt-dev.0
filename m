Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D8D10EB98
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 08:11:58 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Fri, 24 Mar 2023 09:11:20 +0100
Message-Id: <20230324081120.3355-6-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
References: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] Change logic of ktap parser to run on a
 thread
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c |  26 +++++----
 lib/igt_ktap.c | 148 ++++++++++++++++++++++++++++++++-----------------
 lib/igt_ktap.h |   5 +-
 3 files changed, 118 insertions(+), 61 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 21e801bd..45a0c6ed 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -758,7 +758,6 @@ int igt_kunit(const char *module_name, const char *opts)
 {
 	struct igt_ktest tst;
 	struct kmod_module *kunit_kmod;
-	char record[BUF_LEN + 1];
 	FILE *f;
 	bool is_builtin;
 	int ret;
@@ -771,12 +770,13 @@ int igt_kunit(const char *module_name, const char *opts)
 		return ret;
 	}
 
-	if (igt_ktest_begin(&tst) != 0) {
-		igt_warn("Unable to begin ktest for %s\n", module_name);
+	igt_fixture
+		if (igt_ktest_begin(&tst) != 0) {
+			igt_warn("Unable to begin ktest for %s\n", module_name);
 
-		igt_ktest_fini(&tst);
-		return ret;
-	}
+			igt_ktest_fini(&tst);
+			return ret;
+		}
 
 	if (tst.kmsg < 0) {
 		igt_warn("Could not open /dev/kmsg\n");
@@ -804,19 +804,25 @@ int igt_kunit(const char *module_name, const char *opts)
 
 	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
 
+	ktap_parser_start(f, is_builtin);
+
 	if (igt_kmod_load(module_name, opts) != 0) {
 		igt_warn("Unable to load %s module\n", module_name);
+		ret = ktap_parser_stop();
 		igt_fail(IGT_EXIT_FAILURE);
 	}
 
-	ret = igt_ktap_parser(f, record, is_builtin);
-	if (ret != 0)
-		ret = IGT_EXIT_ABORT;
 unload:
-	igt_ktest_end(&tst);
+	igt_fixture
+		igt_ktest_end(&tst);
 
 	igt_ktest_fini(&tst);
 
+	ret = ktap_parser_stop();
+
+	if (ret != 0)
+		ret = IGT_EXIT_ABORT;
+
 	if (ret == 0)
 		igt_success();
 
diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 117598fa..090f98b7 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -5,11 +5,16 @@
 
 #include <ctype.h>
 #include <limits.h>
+#include <libkmod.h>
+#include <pthread.h>
+#include <errno.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_ktap.h"
 
+
+
 static int log_to_end(enum igt_log_level level, FILE *f,
 		      char *record, const char *format, ...) __attribute__((format(printf, 4, 5)));
 
@@ -118,7 +123,10 @@ static int find_next_tap_subtest(FILE *fp, char *record, bool is_builtin)
 		igt_info("%s", version_rptr);
 
 		if (fgets(record, BUF_LEN, fp) == NULL) {
-			igt_warn("kmsg truncated: unknown error (%m)\n");
+			if (ferror(fp))
+				igt_warn("kmsg read failed: %s\n", strerror(errno));
+			else
+				igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
 	}
@@ -253,6 +261,13 @@ static int parse_kmsg_for_tap(FILE *fp, char *record, char *test_name)
 	return 1;
 }
 
+struct ktap_parser_args {
+	FILE *fp;
+	bool is_builtin;
+	volatile bool is_running;
+	int ret;
+} ktap_args;
+
 /**
  * igt_ktap_parser:
  * @fp: FILE pointer
@@ -264,71 +279,104 @@ static int parse_kmsg_for_tap(FILE *fp, char *record, char *test_name)
  *
  * Returns: IGT default codes
  */
-int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
+void *igt_ktap_parser(void *unused)
 {
+	FILE *fp = ktap_args.fp;
+	char record[BUF_LEN + 1];
+	bool is_builtin = ktap_args.is_builtin;
+
 	char test_name[BUF_LEN + 1];
 	bool failed_tests, found_tests;
 	int sublevel = 0;
 
-	test_name[0] = '\0';
-	test_name[BUF_LEN] = '\0';
-
 	failed_tests = false;
 	found_tests = false;
 
-	while (sublevel >= 0) {
-		if (fgets(record, BUF_LEN, fp) == NULL) {
-			if (!found_tests)
-				igt_warn("kmsg truncated: unknown error (%m)\n");
-			break;
-		}
+igt_ktap_parser_start:
+	while (ktap_args.is_running) {
+		test_name[0] = '\0';
+		test_name[BUF_LEN] = '\0';
 
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
+		while(!feof(fp)) {
 			if (fgets(record, BUF_LEN, fp) == NULL) {
-				igt_warn("kmsg truncated: unknown error (%m)\n");
-				return -2;
+				if (ferror(fp))
+					igt_warn("kmsg read failed: %s\n", strerror(errno));
+
+				if (!ktap_args.is_running)
+					return NULL;
 			}
-			found_tests = true;
-			sublevel++;
-			break;
 		}
 
-		switch (parse_kmsg_for_tap(fp, record, test_name)) {
-		case -2:
-			return IGT_EXIT_FAILURE;
-		case -1:
-			sublevel--;
-			failed_tests = true;
-			igt_subtest(test_name)
-				igt_fail(IGT_EXIT_FAILURE);
-			test_name[0] = '\0';
-			break;
-		case 0: /* fallthrough */
-			igt_subtest(test_name)
-				igt_success();
-			test_name[0] = '\0';
-		default:
-			break;
+		while (sublevel >= 0) {
+			switch (find_next_tap_subtest(fp, record, is_builtin)) {
+			case -2:
+				/* no more data to read */
+				goto igt_ktap_parser_start;
+			case -1:
+				/* no test found, so we keep parsing */
+				break;
+			case 0:
+				/*
+				 * tests found, but they're missing info, so we might
+				 * have read into test output
+				 */
+				found_tests = true;
+				sublevel++;
+				break;
+			default:
+				if (fgets(record, BUF_LEN, fp) == NULL) {
+					if (ferror(fp))
+						igt_warn("kmsg read failed: %s\n", strerror(errno));
+					else
+						igt_warn("kmsg truncated: unknown error (%m)\n");
+					goto igt_ktap_parser_start;
+				}
+				found_tests = true;
+				sublevel++;
+				break;
+			}
+
+			switch (parse_kmsg_for_tap(fp, record, test_name)) {
+			case -2:
+				goto igt_ktap_parser_start;
+			case -1:
+				sublevel--;
+				failed_tests = true;
+				igt_subtest(test_name)
+					igt_fail(IGT_EXIT_FAILURE);
+				test_name[0] = '\0';
+				break;
+			case 0: /* fallthrough */
+				igt_subtest(test_name)
+					igt_success();
+				test_name[0] = '\0';
+			default:
+				break;
+			}
 		}
 	}
 
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
+void ktap_parser_start(FILE *fp, bool is_builtin)
+{
+	ktap_args.fp = fp;
+	ktap_args.is_builtin = is_builtin;
+	ktap_args.is_running = true;
+	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
+}
 
-	return IGT_EXIT_SUCCESS;
+int ktap_parser_stop(void)
+{
+	ktap_args.is_running = false;
+	pthread_join(ktap_parser_thread, NULL);
+	return ktap_args.ret;
 }
diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
index b2f69df2..ee6689c1 100644
--- a/lib/igt_ktap.h
+++ b/lib/igt_ktap.h
@@ -26,6 +26,9 @@
 
 #define BUF_LEN 4096
 
-int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
+void *igt_ktap_parser(void *unused);
+
+void ktap_parser_start(FILE *fp, bool is_builtin);
+int ktap_parser_stop(void);
 
 #endif /* IGT_KTAP_H */
-- 
2.34.1


