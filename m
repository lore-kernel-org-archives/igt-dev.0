Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon,  7 Aug 2023 12:23:54 +0200
Message-ID: <20230807102352.4607-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230807102352.4607-5-janusz.krzysztofik@linux.intel.com>
References: <20230807102352.4607-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 1/3] kunit: Report the count of test suites in
 a module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 igt-dev@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

According to KTAP specification[1], results should always start from a
header that provides a TAP protocol version, followed by a test plan with
a count of items to be executed.  That pattern should be followed at each
nesting level.  In the current implementation of the top-most, i.e., test
suite level, those rules apply only for test suites built into the kernel,
executed and reported on boot.  Results submitted to dmesg from kunit test
modules loaded later are missing those top-level headers.

As a consequence, if a kunit test module provides more than one test suite
then, without the top level test plan, external tools that are parsing
dmesg for kunit test output are not able to tell how many test suites
should be expected and whether to continue parsing after complete output
from the first test suite is collected.

Submit the top-level headers also from the kunit test module notifier
initialization callback.

v3: Fix new name of a structure moved to kunit namespace not updated in
    executor_test functions (lkp@intel.com).
v2: Use kunit_exec_run_tests() (Mauro, Rae), but prevent it from
    emitting the headers when called on load of non-test modules.

[1] https://docs.kernel.org/dev-tools/ktap.html#

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rae Moar <rmoar@google.com>
---
 include/kunit/test.h      |  8 ++++++++
 lib/kunit/executor.c      | 42 +++++++++++++++++++++------------------
 lib/kunit/executor_test.c | 36 ++++++++++++++++++++++-----------
 lib/kunit/test.c          |  6 +++++-
 4 files changed, 60 insertions(+), 32 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 011e0d6bb506c..3d002e6b252f2 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -256,6 +256,12 @@ struct kunit_suite {
 	int suite_init_err;
 };
 
+/* Stores an array of suites, end points one past the end */
+struct kunit_suite_set {
+	struct kunit_suite * const *start;
+	struct kunit_suite * const *end;
+};
+
 /**
  * struct kunit - represents a running instance of a test.
  *
@@ -317,6 +323,8 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 
 void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
 
+void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin);
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
 #else
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index dc295150c4e57..5ef90c334eb0f 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -104,13 +104,7 @@ kunit_filter_glob_tests(const struct kunit_suite *const suite, const char *test_
 static char *kunit_shutdown;
 core_param(kunit_shutdown, kunit_shutdown, charp, 0644);
 
-/* Stores an array of suites, end points one past the end */
-struct suite_set {
-	struct kunit_suite * const *start;
-	struct kunit_suite * const *end;
-};
-
-static void kunit_free_suite_set(struct suite_set suite_set)
+static void kunit_free_suite_set(struct kunit_suite_set suite_set)
 {
 	struct kunit_suite * const *suites;
 
@@ -119,16 +113,17 @@ static void kunit_free_suite_set(struct suite_set suite_set)
 	kfree(suite_set.start);
 }
 
-static struct suite_set kunit_filter_suites(const struct suite_set *suite_set,
-					    const char *filter_glob,
-						char *filters,
-						char *filter_action,
-					    int *err)
+static struct kunit_suite_set
+kunit_filter_suites(const struct kunit_suite_set *suite_set,
+		    const char *filter_glob,
+		    char *filters,
+		    char *filter_action,
+		    int *err)
 {
 	int i, j, k;
 	int filter_count = 0;
 	struct kunit_suite **copy, **copy_start, *filtered_suite, *new_filtered_suite;
-	struct suite_set filtered = {NULL, NULL};
+	struct kunit_suite_set filtered = {NULL, NULL};
 	struct kunit_glob_filter parsed_glob;
 	struct kunit_attr_filter *parsed_filters = NULL;
 
@@ -230,17 +225,24 @@ static void kunit_handle_shutdown(void)
 
 }
 
-static void kunit_exec_run_tests(struct suite_set *suite_set)
+#endif
+
+void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
 {
 	size_t num_suites = suite_set->end - suite_set->start;
 
-	pr_info("KTAP version 1\n");
-	pr_info("1..%zu\n", num_suites);
+	if (builtin || num_suites) {
+		pr_info("KTAP version 1\n");
+		pr_info("1..%zu\n", num_suites);
+	}
 
 	__kunit_test_suites_init(suite_set->start, num_suites);
 }
 
-static void kunit_exec_list_tests(struct suite_set *suite_set, bool include_attr)
+#if IS_BUILTIN(CONFIG_KUNIT)
+
+static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
+				  bool include_attr)
 {
 	struct kunit_suite * const *suites;
 	struct kunit_case *test_case;
@@ -265,7 +267,9 @@ static void kunit_exec_list_tests(struct suite_set *suite_set, bool include_attr
 
 int kunit_run_all_tests(void)
 {
-	struct suite_set suite_set = {__kunit_suites_start, __kunit_suites_end};
+	struct kunit_suite_set suite_set = {
+		__kunit_suites_start, __kunit_suites_end,
+	};
 	int err = 0;
 	if (!kunit_enabled()) {
 		pr_info("kunit: disabled\n");
@@ -282,7 +286,7 @@ int kunit_run_all_tests(void)
 	}
 
 	if (!action_param)
-		kunit_exec_run_tests(&suite_set);
+		kunit_exec_run_tests(&suite_set, true);
 	else if (strcmp(action_param, "list") == 0)
 		kunit_exec_list_tests(&suite_set, false);
 	else if (strcmp(action_param, "list_attr") == 0)
diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index 3e0a1c99cb4e8..4084071d0eb5b 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -43,8 +43,10 @@ static void parse_filter_test(struct kunit *test)
 static void filter_suites_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[3] = {NULL, NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[2],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "suite1", dummy_test_cases);
@@ -67,8 +69,10 @@ static void filter_suites_test(struct kunit *test)
 static void filter_suites_test_glob_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[3] = {NULL, NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[2],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "suite1", dummy_test_cases);
@@ -94,8 +98,10 @@ static void filter_suites_test_glob_test(struct kunit *test)
 static void filter_suites_to_empty_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[3] = {NULL, NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[2],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "suite1", dummy_test_cases);
@@ -144,8 +150,10 @@ static struct kunit_case dummy_attr_test_cases[] = {
 static void filter_attr_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[3] = {NULL, NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[2],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "normal_suite", dummy_attr_test_cases);
@@ -179,8 +187,10 @@ static void filter_attr_test(struct kunit *test)
 static void filter_attr_empty_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[3] = {NULL, NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[2]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[2],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "suite1", dummy_attr_test_cases);
@@ -197,8 +207,10 @@ static void filter_attr_empty_test(struct kunit *test)
 static void filter_attr_skip_test(struct kunit *test)
 {
 	struct kunit_suite *subsuite[2] = {NULL};
-	struct suite_set suite_set = {.start = subsuite, .end = &subsuite[1]};
-	struct suite_set got;
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[1],
+	};
+	struct kunit_suite_set got;
 	int err = 0;
 
 	subsuite[0] = alloc_fake_suite(test, "suite", dummy_attr_test_cases);
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index cb9797fa6303f..8b2808068497f 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -736,7 +736,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
 #ifdef CONFIG_MODULES
 static void kunit_module_init(struct module *mod)
 {
-	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
+	struct kunit_suite_set suite_set = {
+		mod->kunit_suites, mod->kunit_suites + mod->num_kunit_suites,
+	};
+
+	kunit_exec_run_tests(&suite_set, false);
 }
 
 static void kunit_module_exit(struct module *mod)
-- 
2.41.0
