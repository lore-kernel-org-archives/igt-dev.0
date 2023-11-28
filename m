Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F8510E4D0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 10:51:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.94.248.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7851D580E39
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 02:50:59 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r7vg9-0006MI-2B
 for igt-dev@lists.freedesktop.org; Tue, 28 Nov 2023 11:50:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Nov 2023 11:48:58 +0100
Message-ID: <20231128105054.24317-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
References: <20231128105054.24317-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] scripts/test_list.py: Fix trivial
 pylint issues
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

There are a couple of small issues pointed by pylint.
Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 20377b708f83..79b48813171b 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -14,7 +14,6 @@ import glob
 import json
 import os
 import re
-import subprocess
 import sys
 
 MIN_PYTHON = (3, 6)
@@ -337,7 +336,7 @@ class TestList:
                         for name in value.keys():
                             match_type = update.get("include-type", "subtest-match")
 
-                            self.read_testlist(update, match_type, field, item, testlist, name, cfg_path + value[name])
+                            self.read_testlist(match_type, field, testlist, name, cfg_path + value[name])
 
                     update["include"] = testlist
 
@@ -348,7 +347,7 @@ class TestList:
                         for name in value.keys():
                             match_type = update.get("exclude-type", "subtest-match")
 
-                            self.read_testlist(update, match_type, field, item, testlist, name, cfg_path + value[name])
+                            self.read_testlist(match_type, field, testlist, name, cfg_path + value[name])
 
                     update["exclude"] = testlist
 
@@ -452,7 +451,9 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
-    def read_testlist(self, update, match_type, field, item, testlist, name, filename):
+    def read_testlist(self, match_type, field, testlist, name, filename):
+
+        """ Read a list of tests with a common value from a file"""
 
         match_type_regex = set(["regex", "regex-ignorecase"])
         match_type_str = set(["subtest-match"])
@@ -514,9 +515,12 @@ class TestList:
         return False
 
     def update_testlist_field(self, subtest_dict):
-        expand = re.compile(",\s*")
 
-        for field in self.props.keys():
+        """process include and exclude rules used by test lists read from files"""
+
+        expand = re.compile(r",\s*")
+
+        for field in self.props.keys(): # pylint: disable=C0201,C0206
             if "_properties_" not in self.props[field]:
                 continue
 
@@ -524,7 +528,6 @@ class TestList:
             if not update:
                 continue
 
-            match_type = update.get("type", "subtest-match")
             default_value = update.get("default--if-not-excluded")
             append_value = update.get("append-value-if-not-excluded")
 
@@ -739,7 +742,7 @@ class TestList:
     # Output methods
     #
 
-    def print_rest_flat(self, filename = None, return_string = False):
+    def print_rest_flat(self, filename = None, return_string = False): # pylint: disable=R1710
 
         """Print tests and subtests ordered by tests"""
 
@@ -802,7 +805,7 @@ class TestList:
         else:
             return out
 
-    def get_spreadsheet(self, expand_fields = {}):
+    def get_spreadsheet(self, expand_fields = None):
 
         """
         Return a bidimentional array with the test contents.
@@ -811,6 +814,9 @@ class TestList:
         separate python file that would create a workbook's sheet.
         """
 
+        if not expand_fields:
+            expand_fields = {}
+
         expand_field_name = {}
         sheet = []
         row = 0
@@ -880,13 +886,12 @@ class TestList:
 
         return sheet
 
-    def print_nested_rest(self, filename = None, return_string = False):
+    def print_nested_rest(self, filename = None, return_string = False):  # pylint: disable=R1710
 
         """Print tests and subtests ordered by tests"""
 
         handler = None
         if filename:
-            original_stdout = sys.stdout
             handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
             sys.stdout = handler
 
@@ -1127,14 +1132,12 @@ class TestList:
         mandatory_fields = set()
         for field, item in self.props.items():
             if item["_properties_"].get("mandatory"):
-                    mandatory_fields.add(field)
+                mandatory_fields.add(field)
 
         doc_subtests = set()
 
         args_regex = re.compile(r'\<[^\>]+\>')
 
-        missing_mandatory_fields = False
-
         subtests = self.expand_dictionary(True)
         for subtest, data in sorted(subtests.items()):
             subtest = self.subtest_separator.join(subtest.split(self.subtest_separator)[:3])
@@ -1143,7 +1146,6 @@ class TestList:
             for field in mandatory_fields:
                 if field not in data:
                     print(f"Warning: {subtest} {field} documentation is missing")
-                    missing_mandatory_fields = True
 
             doc_subtests.add(subtest)
 
@@ -1162,7 +1164,7 @@ class TestList:
         if run_missing:
             for test_name in run_missing:
                 print(f'Warning: Missing documentation for {test_name}')
-            print(f'Please refer: docs/test_documentation.md for more details')
+            print('Please refer: docs/test_documentation.md for more details')
 
         if doc_uneeded or run_missing:
             sys.exit(1)
@@ -1408,7 +1410,7 @@ class TestList:
 
 
         # NOTE: currently, it uses a comma for multi-value delimitter
-        test_subtests = self.get_subtests(sort_field, ",\s*", with_order = True)
+        test_subtests = self.get_subtests(sort_field, r",\s*", with_order = True)
 
         if not os.path.exists(directory):
             os.makedirs(directory)
-- 
2.42.0
