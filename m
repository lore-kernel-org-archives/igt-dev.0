Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224510E323
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 07:12:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B10C4580D7B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 00:12:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJ7Xj-0035s2-1p
 for igt-dev@lists.freedesktop.org; Tue, 11 Jul 2023 09:12:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 09:12:12 +0200
Message-Id: <20230711071213.737377-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
References: <20230711071213.737377-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] scripts/igt_doc.py: pass a single file
 when checking docs
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of passing a directory with several *.testlist files,
pass intel-ci.testlist, which should contain already everything.

That makes the script a lot more generic, as there won't be any
real dependencies from IGT related to the check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build  |  2 +-
 scripts/igt_doc.py         |  6 +++---
 scripts/test_list.py       | 42 +++++++++++++++++++-------------------
 tests/intel-ci/meson.build |  2 +-
 4 files changed, 26 insertions(+), 26 deletions(-)
 mode change 100755 => 100644 scripts/test_list.py

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index e838f2eb1540..b388a04b20ea 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -16,7 +16,7 @@ if build_tests
 	# Check if documentation matches the actual tests and tests can run
 	if not meson.is_cross_build()
 		build_info += 'Will Check if documentation is in sync with testlist'
-		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+		check_testlist = [ '--check-testlist', '--built-testlist', built_testlist.full_path() ]
 	else
 		warning('WARNING: Will not check if documentation is in sync with testlist')
 	endif
diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 38e2bdee4f2a..c02029e03a31 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -38,8 +38,8 @@ parser.add_argument("--check-testlist", action="store_true",
                     help="Compare documentation against IGT built tests.")
 parser.add_argument("--include-plan", action="store_true",
                     help="Include test plans, if any.")
-parser.add_argument("--igt-build-path",
-                    help="Path to the IGT build directory. Used by --check-testlist.",
+parser.add_argument("--built-testlist",
+                    help="Testlist generated at build time. Used by --check-testlist.",
                     default=IGT_BUILD_PATH)
 parser.add_argument("--gen-testlist",
                     help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
@@ -49,7 +49,7 @@ parser.add_argument('--files', nargs='+',
 parse_args = parser.parse_args()
 
 tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
-                 parse_args.igt_build_path)
+                 parse_args.built_testlist)
 
 if parse_args.filter_field:
     for filter_expr in parse_args.filter_field:
diff --git a/scripts/test_list.py b/scripts/test_list.py
old mode 100755
new mode 100644
index 8dca7fc7c49e..1fd27ef560a7
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -246,7 +246,7 @@ class TestList:
     """
 
     def __init__(self, config_fname, include_plan = False, file_list = False,
-                 igt_build_path = None,
+                 built_testlist = None,
                  test_tag = "TEST", subtest_tag = "SUBTESTS?",
                  main_name = "igt", subtest_separator = "@"):
         self.doc = {}
@@ -256,7 +256,7 @@ class TestList:
         self.plan_filenames = []
         self.props = {}
         self.config_fname = config_fname
-        self.igt_build_path = igt_build_path
+        self.built_testlist = built_testlist
         self.level_count = 0
         self.field_list = {}
         self.title = None
@@ -852,7 +852,7 @@ class TestList:
             fname = self.doc[test]["File"]
 
             test_name = re.sub(r'.*/', '', fname)
-            test_name = re.sub(r'\.[ch]', '', test_name)
+            test_name = re.sub(r'\.[ch]\s*', '', test_name)
             test_name = self.main_name + test_name
 
             subtest_array += self.expand_subtest(fname, test_name, test, True)
@@ -918,29 +918,15 @@ class TestList:
 
         return subtests
 
-    def get_testlist(self):
-
-        """ Return a list of tests as reported by --list-subtests """
-        tests = []
-        for name in self.filenames:
-            fname = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
-            fname = os.path.join(self.igt_build_path, "tests", fname)
-
-            with open(fname, 'r', encoding='utf8') as handle:
-                for line in handle:
-                    tests.append(line.rstrip("\n"))
-
-        return sorted(tests)
-
     #
     # Validation methods
     #
     def check_tests(self):
 
-        """Compare documented subtests with the IGT test list"""
+        """Compare documented subtests with the test list"""
 
-        if not self.igt_build_path:
-            sys.exit("Need the IGT build path")
+        if not self.built_testlist:
+            sys.exit("Need the build path where the exec files are located")
 
         if self.filters:
             print("NOTE: test checks are affected by filters")
@@ -957,7 +943,21 @@ class TestList:
         doc_subtests = list(sorted(doc_subtests))
 
         # Get a list of tests from
-        run_subtests = self.get_testlist()
+        tests = set()
+        for name in self.filenames:
+            test = self.main_name + re.sub(r"\.c$", "", name.split('/')[-1])
+            tests.add(test)
+
+        run_subtests = []
+        with open(self.built_testlist, 'r', encoding='utf8') as handle:
+            for line in handle:
+                name = line.rstrip("\n")
+                if name in tests:
+                    run_subtests.append(name)
+                else:
+                    result = name.rsplit(self.subtest_separator, 1)[0]
+                    if name in tests:
+                        run_subtests.append(name)
 
         # Compare arrays
 
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index a1ec517f8da1..e984fcb817aa 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -9,7 +9,7 @@ intelci_files = [
   'xe.blocklist.txt',
 ]
 
-custom_target('intel-ci.testlist',
+built_testlist = custom_target('intel-ci.testlist',
               build_by_default : true,
               command : ['sort', testlist_files],
               install : true,
-- 
2.40.1
