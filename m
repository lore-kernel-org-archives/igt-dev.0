Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Sat,  5 Aug 2023 00:52:23 +0200
Message-ID: <20230804225220.8005-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
References: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 2/3] kunit: Make 'list' action available to
 kunit test modules
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

Results from kunit tests reported via dmesg may be interleaved with other
kernel messages.  When parsing dmesg for modular kunit results in real
time, external tools, e.g., Intel GPU tools (IGT), may want to insert
their own test name markers into dmesg at the start of each test, before
any kernel message related to that test appears there, so existing upper
level test result parsers have no doubt which test to blame for a specific
kernel message.  Unfortunately, kunit reports names of tests only at their
completion (with the exeption of a not standarized "# Subtest: <name>"
header above a test plan of each test suite or parametrized test).

External tools could be able to insert their own "start of the test"
markers with test names included if they new those names in advance.
Test names could be learned from a list if provided by a kunit test
module.

There exists a feature of listing kunit tests without actually executing
them, but it is now limited to configurations with the kunit module built
in and covers only built-in tests, already available at boot time.
Moreover, switching from list to normal mode requires reboot.  If that
feature was also available when kunit is built as a module, userspace
could load the module with action=list parameter, load some kunit test
modules they are interested in and learn about the list of tests provided
by those modules, then unload them, reload the kunit module in normal mode
and execute the tests with their lists already known.

Extend kunit module notifier initialization callback with a processing
path for only listing the tests provided by a module if the kunit action
parameter is set to "list" or "list_attr".  For user convenience, make the
kunit.action parameter visible in sysfs.

v2: Don't use a different format, use kunit_exec_list_tests() (Rae),
  - refresh on top of new attributes patches, handle newly introduced
    kunit.action=list_attr case (Rae).

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Rae Moar <rmoar@google.com>
---
 include/kunit/test.h |  2 ++
 lib/kunit/executor.c | 28 +++++++++++++++++-----------
 lib/kunit/test.c     | 18 +++++++++++++++---
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 3d002e6b252f2..6a338a3267ed5 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -309,6 +309,7 @@ static inline void kunit_set_failure(struct kunit *test)
 }
 
 bool kunit_enabled(void);
+const char *kunit_action(void);
 
 void kunit_init_test(struct kunit *test, const char *name, char *log);
 
@@ -324,6 +325,7 @@ int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_
 void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
 
 void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin);
+void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr);
 
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index bd6f3b5dc47f7..b3878a34c35a5 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -13,22 +13,29 @@
 extern struct kunit_suite * const __kunit_suites_start[];
 extern struct kunit_suite * const __kunit_suites_end[];
 
+static char *action_param;
+
+module_param_named(action, action_param, charp, 0400);
+MODULE_PARM_DESC(action,
+		 "Changes KUnit executor behavior, valid values are:\n"
+		 "<none>: run the tests like normal\n"
+		 "'list' to list test names instead of running them.\n"
+		 "'list_attr' to list test names and attributes instead of running them.\n");
+
+const char *kunit_action(void)
+{
+	return action_param;
+}
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 
 static char *filter_glob_param;
-static char *action_param;
 static char *filter_param;
 static char *filter_action_param;
 
 module_param_named(filter_glob, filter_glob_param, charp, 0);
 MODULE_PARM_DESC(filter_glob,
 		"Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test");
-module_param_named(action, action_param, charp, 0);
-MODULE_PARM_DESC(action,
-		 "Changes KUnit executor behavior, valid values are:\n"
-		 "<none>: run the tests like normal\n"
-		 "'list' to list test names instead of running them.\n"
-		 "'list_attr' to list test names and attributes instead of running them.\n");
 module_param_named(filter, filter_param, charp, 0);
 MODULE_PARM_DESC(filter,
 		"Filter which KUnit test suites/tests run at boot-time using attributes, e.g. speed>slow");
@@ -228,10 +235,7 @@ void kunit_exec_run_tests(struct kunit_suite_set *suite_set, bool builtin)
 	__kunit_test_suites_init(suite_set->start, num_suites);
 }
 
-#if IS_BUILTIN(CONFIG_KUNIT)
-
-static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
-				  bool include_attr)
+void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr)
 {
 	struct kunit_suite * const *suites;
 	struct kunit_case *test_case;
@@ -254,6 +258,8 @@ static void kunit_exec_list_tests(struct kunit_suite_set *suite_set,
 	}
 }
 
+#if IS_BUILTIN(CONFIG_KUNIT)
+
 int kunit_run_all_tests(void)
 {
 	struct kunit_suite_set suite_set = {
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 8b2808068497f..5232a43737826 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -739,13 +739,25 @@ static void kunit_module_init(struct module *mod)
 	struct kunit_suite_set suite_set = {
 		mod->kunit_suites, mod->kunit_suites + mod->num_kunit_suites,
 	};
-
-	kunit_exec_run_tests(&suite_set, false);
+	const char *action = kunit_action();
+
+	if (!action)
+		kunit_exec_run_tests(&suite_set, false);
+	else if (!strcmp(action, "list"))
+		kunit_exec_list_tests(&suite_set, false);
+	else if (!strcmp(action, "list_attr"))
+		kunit_exec_list_tests(&suite_set, true);
+	else
+		pr_err("kunit: unknown action '%s'\n", action);
 }
 
 static void kunit_module_exit(struct module *mod)
 {
-	__kunit_test_suites_exit(mod->kunit_suites, mod->num_kunit_suites);
+	const char *action = kunit_action();
+
+	if (!action)
+		__kunit_test_suites_exit(mod->kunit_suites,
+					 mod->num_kunit_suites);
 }
 
 static int kunit_module_notify(struct notifier_block *nb, unsigned long val,
-- 
2.41.0
