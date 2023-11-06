Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Nov 2023 10:59:37 +0100
Message-ID: <20231106095935.7031-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
References: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/kunit: Split out reusable part of
 test case list gathering
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We are going to make use of kunit test case filtering feature, now also
available to modular builds.  That means we will no longer need to load
a kunit test module in background and parse its all test cases KTAP output
in parallel, only wait for the module to load with a filter for a specific
test case, then parse its KTAP output containing only result of that
single test case.

We already have a piece of code that just collects all results from KTAP
report, used for fetching the list of test cases from the module.  Move
that code to a separate function, ready for reuse as a parser of complete
results of a single test case.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 127 +++++++++++++++++++++++++++++++------------------
 1 file changed, 80 insertions(+), 47 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index e967c9bcdc..37591b7389 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -953,6 +953,73 @@ static void kunit_results_free(struct igt_list_head *results,
 	free(*suite_name);
 }
 
+static int kunit_kmsg_get_results(struct igt_list_head *results,
+				  struct igt_ktest *tst,
+				  const char *filter,
+				  const char *opts)
+{
+	char *suite_name = NULL, *case_name = NULL;
+	struct igt_ktap_results *ktap;
+	int flags, err;
+
+	if (igt_debug_on(tst->kmsg < 0))
+		return tst->kmsg;
+
+	if (igt_debug_on((flags = fcntl(tst->kmsg, F_GETFL, 0), flags < 0)))
+		return flags;
+
+	if (flags & O_NONBLOCK &&
+	    igt_debug_on((err = fcntl(tst->kmsg, F_SETFL, flags & ~O_NONBLOCK),
+			  err == -1)))
+		return -errno;
+
+	errno = 0;
+	if (igt_debug_on(lseek(tst->kmsg, 0, SEEK_END) == -1 && errno))
+		return -errno;
+
+	err = igt_debug_on(igt_kmod_load("kunit", filter));
+	if (err) {
+		/*
+		 * TODO: drop the following workaround, which is required by LTS
+		 *	 kernel v6.1 not capable of listing nor filtering test
+		 *	 cases when built as a module.
+		 * If loading the kunit module with required parameters fails
+		 * then assume that we are running on a kernel with missing test
+		 * case listing and filtering capabilities.  Don't fail but just
+		 * return with empty list of test cases, that should tell the
+		 * caller to use a legacy method of iterating over KTAP results
+		 * collected from blind execution of all Kunit test cases
+		 * provided by a Kunit test module.
+		 */
+		return 0;
+	}
+
+	err = igt_debug_on(modprobe(tst->kmod, opts));
+	if (err)
+		goto out_kmod_unload;
+
+	ktap = igt_ktap_alloc(results);
+	if (igt_debug_on(!ktap)) {
+		err = -ENOMEM;
+		goto out_remove_module;
+	}
+
+	do
+		igt_debug_on((err = kunit_kmsg_result_get(results, NULL, tst->kmsg, ktap),
+			      err && err != -EINPROGRESS));
+	while (err == -EINPROGRESS);
+
+	igt_ktap_free(ktap);
+
+	if (err)
+		kunit_results_free(results, &case_name, &suite_name);
+
+out_remove_module:
+	igt_debug_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
+out_kmod_unload:
+	return igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE)) ?: err;
+}
+
 static void __igt_kunit_legacy(struct igt_ktest *tst,
 			       const char *name,
 			       const char *opts)
@@ -1094,16 +1161,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
 {
 	char *suite_name = NULL, *case_name = NULL;
 	struct igt_ktap_result *r, *rn;
-	struct igt_ktap_results *ktap;
-	int flags, err;
-
-	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
-
-	igt_skip_on((flags = fcntl(tst->kmsg, F_GETFL, 0), flags < 0));
-	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags & ~O_NONBLOCK) == -1,
-		      "Could not set /dev/kmsg to blocking mode\n");
-
-	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
+	int err = 0;
 
 	/*
 	 * To get a list of test cases provided by a kunit test module, ask the
@@ -1112,44 +1170,22 @@ static void kunit_get_tests(struct igt_list_head *tests,
 	 * however, parsing a KTAP report -- something that we already can do
 	 * perfectly -- seems to be more safe than extracting a test case list
 	 * of unknown length from /dev/kmsg.
-	 *
-	 * TODO: drop the following workaround, which is required by LTS kernel
-	 *       v6.1 not capable of listing test cases when built as a module.
-	 * If loading the kunit module with required parameters fails then
-	 * assume that we are running on a kernel with missing test case listing
-	 * capabilities.  Dont's skip but just return with empty list of test
-	 * cases, that should tell the caller to use a legacy method of
-	 * iterating over KTAP results collected from blind execution of all
-	 * Kunit test cases provided by a Kunit test module.
 	 */
-	if (igt_debug_on(igt_kmod_load("kunit",
-				       "filter=module=none filter_action=skip")))
-		return;
-
-	igt_skip_on(modprobe(tst->kmod, opts));
+	igt_skip_on(kunit_kmsg_get_results(tests, tst,
+					   "filter=module=none filter_action=skip", opts));
 
-	ktap = igt_ktap_alloc(tests);
-	igt_require(ktap);
-
-	do
-		err = kunit_kmsg_result_get(tests, NULL, tst->kmsg, ktap);
-	while (err == -EINPROGRESS);
-
-	igt_ktap_free(ktap);
-
-	if (!err)
-		igt_list_for_each_entry_safe(r, rn, tests, link) {
-			if (igt_debug_on(r->code != IGT_EXIT_SKIP)) {
-				err = r->code ?: -EPROTO;
-				break;
-			}
+	igt_list_for_each_entry_safe(r, rn, tests, link) {
+		if (igt_debug_on(r->code != IGT_EXIT_SKIP)) {
+			err = r->code ?: -EPROTO;
+			break;
+		}
 
-			if (!filter)
-				continue;
+		if (!filter)
+			continue;
 
-			if (strcmp(r->suite_name, filter))
-				kunit_result_free(&r, &case_name, &suite_name);
-		}
+		if (strcmp(r->suite_name, filter))
+			kunit_result_free(&r, &case_name, &suite_name);
+	}
 
 	if (err) {
 		kunit_results_free(tests, &case_name, &suite_name);
@@ -1158,9 +1194,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
 		free(case_name);
 	}
 
-	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
-	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
-
 	igt_skip_on_f(err,
 		      "KTAP parser failed while getting a list of test cases\n");
 }
-- 
2.42.0
