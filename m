Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D75A10E292
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:48:04 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Mon,  5 Jun 2023 12:47:16 +0200
Message-Id: <20230605104716.5678-9-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] lib/igt_kmod: fix nesting igt_fixture
 in igt_subtest
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

Fix the following issue:
	$ ./build/tests/drm_buddy
	Starting subtest: all-tests
	nesting igt_fixture in igt_subtest is invalid
	please refer to lib/igt_core documentation

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_kmod.c | 80 ++++++++++++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 42 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index c62eb97a..2c0cc026 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -772,47 +772,45 @@ static int __igt_kunit(const char *module_name, const char *opts)
 		return ret;
 	}
 
-	igt_fixture {
-		if (igt_ktest_begin(&tst) != 0) {
-			igt_warn("Unable to begin ktest for %s\n", module_name);
+	if (igt_ktest_begin(&tst) != 0) {
+		igt_warn("Unable to begin ktest for %s\n", module_name);
 
-			igt_ktest_fini(&tst);
-			return ret;
-		}
+		igt_ktest_fini(&tst);
+		return ret;
+	}
 
-		if (tst.kmsg < 0) {
-			igt_warn("Could not open /dev/kmsg\n");
-			goto unload;
-		}
+	if (tst.kmsg < 0) {
+		igt_warn("Could not open /dev/kmsg\n");
+		goto unload;
+	}
 
-		if (lseek(tst.kmsg, 0, SEEK_END)) {
-			igt_warn("Could not seek the end of /dev/kmsg\n");
-			goto unload;
-		}
+	if (lseek(tst.kmsg, 0, SEEK_END)) {
+		igt_warn("Could not seek the end of /dev/kmsg\n");
+		goto unload;
+	}
 
-		f = fdopen(tst.kmsg, "r");
+	f = fdopen(tst.kmsg, "r");
 
-		if (f == NULL) {
-			igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer\n");
-			goto unload;
-		}
+	if (f == NULL) {
+		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer\n");
+		goto unload;
+	}
 
-		/* The KUnit module is required for running any KUnit tests */
-		if (igt_kmod_load("kunit", NULL) != 0 ||
-		    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
-			igt_warn("Unable to load KUnit\n");
-			igt_fail(IGT_EXIT_FAILURE);
-		}
+	/* The KUnit module is required for running any KUnit tests */
+	if (igt_kmod_load("kunit", NULL) != 0 ||
+	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) != 0) {
+		igt_warn("Unable to load KUnit\n");
+		igt_fail(IGT_EXIT_FAILURE);
+	}
 
-		is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
+	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
 
-		results = ktap_parser_start(f, is_builtin);
+	results = ktap_parser_start(f, is_builtin);
 
-		if (igt_kmod_load(module_name, opts) != 0) {
-			igt_warn("Unable to load %s module\n", module_name);
-			ret = ktap_parser_stop();
-			igt_fail(IGT_EXIT_FAILURE);
-		}
+	if (igt_kmod_load(module_name, opts) != 0) {
+		igt_warn("Unable to load %s module\n", module_name);
+		ret = ktap_parser_stop();
+		igt_fail(IGT_EXIT_FAILURE);
 	}
 
 	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
@@ -820,7 +818,7 @@ static int __igt_kunit(const char *module_name, const char *opts)
 		if (READ_ONCE(results->head) != NULL) {
 			pthread_mutex_lock(&results->mutex);
 
-			igt_subtest(results->head->test_name) {
+			igt_dynamic(results->head->test_name) {
 				if (READ_ONCE(results->head->passed))
 					igt_success();
 				else
@@ -836,19 +834,17 @@ static int __igt_kunit(const char *module_name, const char *opts)
 	}
 
 unload:
-	igt_fixture {
-		igt_ktest_end(&tst);
+	igt_ktest_end(&tst);
 
-		igt_ktest_fini(&tst);
+	igt_ktest_fini(&tst);
 
-		ret = ktap_parser_stop();
+	ret = ktap_parser_stop();
 
-		if (ret != 0)
-			ret = IGT_EXIT_ABORT;
+	if (ret != 0)
+		ret = IGT_EXIT_ABORT;
 
-		if (ret == 0)
-			igt_success();
-	}
+	if (ret == 0)
+		igt_success();
 	return ret;
 }
 
-- 
2.34.1


