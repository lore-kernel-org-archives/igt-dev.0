Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D110E61D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1EE10580DBE
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6I-0044TT-07
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:42 +0200
Message-Id: <20230713075054.970457-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 02/14] scripts/test_list.py: make the
 class more generic
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

Currently, the class is meant to be used only on IGT. However, it
could also be used on other projects. It actually makes sense to
port it to the Kernel, in order to document KUnit and Kselftests.

Make the class more generic by allowing the constructor to pass
three additional arguments:
- The tag name for the test group ("TEST");
- The tag name for the subtest group ("SUBTEST");
- the prefix name for the tests;
- the separator between testa and subtests.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 4f580fb3de58..3fcf0900c0e5 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -101,8 +101,8 @@ class TestList:
 
     """
     Parse and handle test lists with test/subtest documentation, in the
-    form of C comments, with two meta-tags (TEST and SUBTEST), and a set of
-    `field: value` items:
+    form of C comments, with two meta-tags (by default, TEST and SUBTEST),
+    and a set of `field: value` items:
 
         /**
          * TEST: Check if new IGT test documentation logic functionality is working
@@ -246,7 +246,9 @@ class TestList:
     """
 
     def __init__(self, config_fname, include_plan = False, file_list = False,
-                 igt_build_path = None):
+                 igt_build_path = None,
+                 test_tag = "TEST", subtest_tag = "SUBTESTS?",
+                 main_name = "igt", subtest_separator = "@"):
         self.doc = {}
         self.test_number = 0
         self.config = None
@@ -259,6 +261,11 @@ class TestList:
         self.field_list = {}
         self.title = None
         self.filters = {}
+        self.subtest_separator = subtest_separator
+        self.main_name = main_name
+
+        if self.main_name:
+            self.main_name += subtest_separator
 
         driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
 
@@ -355,11 +362,13 @@ class TestList:
             if fname == '':
                 continue
 
-            self.__add_file_documentation(fname, implemented_class, field_re)
+            self.__add_file_documentation(fname, implemented_class, field_re,
+                                          test_tag, subtest_tag)
 
         if include_plan:
             for fname in self.plan_filenames:
-                self.__add_file_documentation(fname, planned_class, field_re)
+                self.__add_file_documentation(fname, planned_class, field_re,
+                                              test_tag, subtest_tag)
 
     #
     # ancillary methods
@@ -421,7 +430,7 @@ class TestList:
         for subtest in self.doc[test]["subtest"].keys():
             summary = test_name
             if self.doc[test]["subtest"][subtest]["Summary"] != '':
-                summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
+                summary += self.subtest_separator + self.doc[test]["subtest"][subtest]["Summary"]
             if not summary:
                 continue
 
@@ -551,7 +560,7 @@ class TestList:
 
             name = re.sub(r'.*/', '', fname)
             name = re.sub(r'\.[\w+]$', '', name)
-            name = "igt@" + name
+            name = self.main_name + name
 
             if not subtest_only:
                 test_dict[name] = {}
@@ -606,7 +615,7 @@ class TestList:
 
             name = re.sub(r'.*/', '', fname)
             name = re.sub(r'\.[ch]', '', name)
-            name = "igt@" + name
+            name = self.main_name + name
 
             tmp_subtest = self.expand_subtest(fname, name, test, False)
 
@@ -844,7 +853,7 @@ class TestList:
 
             test_name = re.sub(r'.*/', '', fname)
             test_name = re.sub(r'\.[ch]', '', test_name)
-            test_name = "igt@" + test_name
+            test_name = self.main_name + test_name
 
             subtest_array += self.expand_subtest(fname, test_name, test, True)
 
@@ -941,8 +950,8 @@ class TestList:
         args_regex = re.compile(r'\<[^\>]+\>')
 
         for subtest in self.get_subtests()[""]:
-            subtest = "@".join(subtest.split("@")[:3])
-            subtest = args_regex.sub(r'\\d+', subtest)
+            subtest = self.subtest_separator.join(subtest.split(self.subtest_separator)[:3])
+            subtest = re.sub(r'\<[^\>]+\>', r'\\d+', subtest)
             doc_subtests.add(subtest)
 
         doc_subtests = list(sorted(doc_subtests))
@@ -993,7 +1002,8 @@ class TestList:
     # File handling methods
     #
 
-    def __add_file_documentation(self, fname, implemented_class, field_re):
+    def __add_file_documentation(self, fname, implemented_class, field_re,
+                                 test_tag, subtest_tag):
 
         """Adds the contents of test/subtest documentation form a file"""
 
@@ -1007,6 +1017,9 @@ class TestList:
         cur_arg_element = 0
         has_test_or_subtest = 0
 
+        test_regex = re.compile(test_tag + r':\s*(.*)')
+        subtest_regex = re.compile('^' + subtest_tag + r':\s*(.*)')
+
         with open(fname, 'r', encoding='utf8') as handle:
             arg_ref = None
             current_test = ''
@@ -1041,7 +1054,7 @@ class TestList:
                     current_field = ''
 
                     # Check if it is a new TEST section
-                    match = re.match(r'^TEST:\s*(.*)', file_line)
+                    match = test_regex.match(file_line)
                     if match:
                         has_test_or_subtest = 1
                         current_test = self.test_number
@@ -1063,7 +1076,7 @@ class TestList:
                         continue
 
                 # Check if it is a new SUBTEST section
-                match = re.match(r'^SUBTESTS?:\s*(.*)', file_line)
+                match = subtest_regex.match(file_line)
                 if match:
                     has_test_or_subtest = 1
                     current_subtest = subtest_number
@@ -1228,7 +1241,7 @@ class TestList:
         """Generate testlists from the test documentation"""
 
         test_prefix = os.path.commonprefix(self.get_subtests()[""])
-        test_prefix = re.sub(r'^igt@', '', test_prefix)
+        test_prefix = re.sub(r'^' + self.main_name, '', test_prefix)
 
         # NOTE: currently, it uses a comma for multi-value delimitter
         test_subtests = self.get_subtests(sort_field, ",", with_order = True)
-- 
2.40.1
