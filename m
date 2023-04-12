Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58710E520
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:50:38 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8F93B580D5D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 05:50:37 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:50:32 +0200
Message-Id: <20230412125033.120215-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412125033.120215-1-mauro.chehab@linux.intel.com>
References: <20230412125033.120215-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] scripts/igt_doc.py: don't depend on
 igt_runner anymore
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

There's no need to actually call IGT runner to get test lists.

Remove such dependency, in order to speedup --check.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build |  7 ++----
 scripts/igt_doc.py        | 10 +++-----
 scripts/test_list.py      | 53 ++++++++++++++++++++++++++-------------
 3 files changed, 41 insertions(+), 29 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index ea9f6eeb7038..3347f61876ef 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -11,11 +11,8 @@ xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 check_testlist = []
 if build_tests
 	doc_dependencies = test_executables
-	if jsonc.found()
-		# Check if documentation matches the actual tests
-		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
-		doc_dependencies += runner
-	endif
+	# Check if documentation matches the actual tests
+	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
 else
 	doc_dependencies = []
 endif
diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 8fa5af15033e..01df35f98ace 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -16,7 +16,6 @@ import sys
 from test_list import TestList
 
 IGT_BUILD_PATH = 'build'
-IGT_RUNNER = 'runner/igt_runner'
 
 parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
                                  formatter_class = argparse.ArgumentDefaultsHelpFormatter,
@@ -36,24 +35,21 @@ parser.add_argument("--sort-field",
 parser.add_argument("--filter-field",
                     help="modify --show-subtests to filter output based a regex given by FILTER_FIELD=~'regex'")
 parser.add_argument("--check-testlist", action="store_true",
-                    help="Compare documentation against IGT runner testlist.")
+                    help="Compare documentation against IGT built tests.")
 parser.add_argument("--include-plan", action="store_true",
                     help="Include test plans, if any.")
 parser.add_argument("--igt-build-path",
-                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
+                    help="Path to the IGT build directory. Used by --check-testlist.",
                     default=IGT_BUILD_PATH)
 parser.add_argument("--gen-testlist",
                     help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
-parser.add_argument("--igt-runner",
-                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
-                    default=IGT_RUNNER)
 parser.add_argument('--files', nargs='+',
                     help="File name(s) to be processed")
 
 parse_args = parser.parse_args()
 
 tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
-                 parse_args.igt_build_path, parse_args.igt_runner)
+                 parse_args.igt_build_path)
 
 RUN = 0
 if parse_args.show_subtests:
diff --git a/scripts/test_list.py b/scripts/test_list.py
index d1b9a2794967..287351e717b3 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -245,7 +245,7 @@ class TestList:
     """
 
     def __init__(self, config_fname, include_plan = False, file_list = False,
-                 igt_build_path = None, igt_runner = None):
+                 igt_build_path = None):
         self.doc = {}
         self.test_number = 0
         self.config = None
@@ -254,7 +254,6 @@ class TestList:
         self.props = {}
         self.config_fname = config_fname
         self.igt_build_path = igt_build_path
-        self.igt_runner = igt_runner
         self.level_count = 0
         self.field_list = {}
         self.title = None
@@ -766,6 +765,38 @@ class TestList:
 
         return subtests
 
+    def __get_testlist(self, name):
+        match = re.match(r"(.*/)?(.*)\.c$", name)
+        if not match:
+            return []
+
+        basename = "igt@" + match.group(2)
+
+        fname = os.path.join(self.igt_build_path, "tests", match.group(2))
+        if not os.path.isfile(fname):
+            print(f"Error: file {fname} doesn't exist.")
+            sys.exit(1)
+        try:
+            result = subprocess.run([ fname, "--list-subtests" ],
+                                    check = True,
+                                    stdout = subprocess.PIPE,
+                                    universal_newlines=True)
+            subtests = result.stdout.splitlines()
+
+            return [basename  + "@" + i for i in subtests]
+        except subprocess.CalledProcessError:
+            # Handle it as a test using igt_simple_main
+            return [basename]
+
+    def get_testlist(self):
+
+        """ Return a list of tests as reported by --list-subtests """
+        tests = []
+        for name in self.filenames:
+            tests += self.__get_testlist(name)
+
+        return sorted(tests)
+
     #
     # Validation methods
     #
@@ -773,28 +804,16 @@ class TestList:
 
         """Compare documented subtests with the IGT test list"""
 
-        if not self.igt_build_path or not self.igt_runner:
-            sys.exit("Need the IGT build path and igt_runner executable file name")
+        if not self.igt_build_path:
+            sys.exit("Need the IGT build path")
 
         doc_subtests = sorted(self.get_subtests()[""])
 
         for i in range(0, len(doc_subtests)): # pylint: disable=C0200
             doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
 
-        test_prefix = os.path.commonprefix(doc_subtests)
-
         # Get a list of tests from
-        try:
-            result = subprocess.run([ f"{self.igt_build_path}/{self.igt_runner}",
-                                    "-L", "-t",  test_prefix,
-                                    f"{self.igt_build_path}/tests"], check = True,
-                                    stdout=subprocess.PIPE, universal_newlines=True)
-        except subprocess.CalledProcessError as sub_err:
-            print(sub_err.stderr)
-            print("Error:", sub_err)
-            sys.exit(1)
-
-        run_subtests = sorted(result.stdout.splitlines())
+        run_subtests = self.get_testlist()
 
         # Compare arrays
 
-- 
2.39.2
