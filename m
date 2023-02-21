Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B72E10E10F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9A1AE580C20
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wwf-2L
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:37 +0100
Message-Id: <20230221083541.1079643-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] scripts/igt_doc.py: dynamically create
 fields array from a JSON file
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

Defining TEST/SUBTEST fields is not an easy task, and may change with
time. So, place them into a JSON file, together with the files that
are implements the test scope.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 239 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 197 insertions(+), 42 deletions(-)
 mode change 100644 => 100755 scripts/igt_doc.py

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
old mode 100644
new mode 100755
index d21f87dc7183..3f061a5fcfd3
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0914,R0912,R0915
+# pylint: disable=C0301,R0902,R0914,R0912,R0915
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -11,27 +11,66 @@
 """Maintain test plan and test implementation documentation on IGT."""
 
 import argparse
+import glob
 import json
 import re
 import subprocess
 import sys
 
-IGT_BUILD_PATH = 'build/'
+IGT_BUILD_PATH = 'build'
 IGT_RUNNER = 'runner/igt_runner'
 
-# Fields that mat be inside TEST and SUBTEST macros
-fields = [
-    'Category',       # Hardware building block / Software building block / ...
-    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
-    'Functionality',  # basic test / ...
-    'Test category',  # functionality test / pereformance / stress
-    'Run type',       # BAT / workarouds / stress / developer-specific / ...
-    'Issue',          # Bug tracker issue(s)
-    'GPU excluded platforms',     # none / DG1 / DG2 / TGL / MTL / PVC / ATS-M / ...
-    'GPU requirements',  # Any other specific platform requirements
-    'Depends on',     # some other IGT test, like igt@test@subtes
-    'Test requirements',  # other non-platform requirements
-    'Description']    # Description of the test
+#
+# Ancillary logic to allow plurals on fields
+#
+# As suggested at https://stackoverflow.com/questions/18902608/generating-the-plural-form-of-a-noun/19018986
+#
+
+def plural(field):
+
+    """
+    Poor man's conversion to plural.
+
+    It should cover usual English plural rules, although it is not meant
+    to cover exceptions (except for a few ones that could be useful on actual
+    fields).
+
+    """
+
+    if (match := re.match(r"(.*)\b(\S+)", field)):
+        ret_str = match.group(1)
+        word = match.group(2)
+
+        if word.isupper():
+            ret_str += word
+        elif word in ["of", "off", "on", "description", "todo"]:
+            ret_str += word
+        elif word.endswith('ed'):
+            ret_str += word
+        elif word[-1:] in ['s', 'x', 'z']:
+            ret_str += word + 'es'
+        elif word[-2:] in ['sh', 'ch']:
+            ret_str += word + 'es'
+        elif word.endswith('fe'):
+            ret_str += word[:-2] + 'ves'
+        elif word.endswith('f'):
+            ret_str += word[:-1] + 'ves'
+        elif word.endswith('y'):
+            ret_str += word[:-1] + 'ies'
+        elif word.endswith('o'):
+            ret_str += word + 'es'
+        elif word.endswith('us'):
+            ret_str += word[:-2] + 'i'
+        elif word.endswith('on'):
+            ret_str += word[:-2] + 'a'
+        elif word.endswith('an'):
+            ret_str += word[:-2] + 'en'
+        else:
+            ret_str += word + 's'
+
+        return ret_str
+
+    return field
 
 #
 # TestList class definition
@@ -48,13 +87,7 @@ class TestList:
          * Category: Software build block
          * Sub-category: documentation
          * Functionality: test documentation
-         * Test category: ReST generation
-         * Run type: IGT kunit test
          * Issue: none
-         * GPU excluded platforms: none
-         * GPU requirements: none
-         * Depends on: @igt@deadbeef@basic
-         * Test requirements: Need python3 to run it
          * Description: Complete description of this test
          *
          * SUBTEST: foo
@@ -108,17 +141,138 @@ class TestList:
     The wildcard arguments there need to be expanded. This is done by
     defining arg[1] to arg[n] at the same code comment that contains the
     SUBTEST as those variables are locally processed on each comment line.
+
+    This script needs a configuration file, in JSON format, describing the
+    fields which will be parsed for TEST and/or SUBTEST tags.
+
+    An example of such file is:
+
+    {
+        "files": [ "tests/driver/*.c" ],
+        "fields": {
+            "Category": {
+                "Sub-category": {
+                    "Functionality": {
+                    }
+                }
+            },
+            "Issue": {
+                "_properties_": {
+                    "description": "If the test is used to solve an issue, point to the URL containing the issue."
+                }
+            },
+            "Description" : {
+                "_properties_": {
+                    "description": "Provides a description for the test/subtest."
+                }
+            }
+        }
+    }
+
+    So, the above JSON config file expects tags like those:
+
+    TEST: foo
+    Description: foo
+
+    SUBTEST: bar
+    Category: Hardware
+    Sub-category: EU
+    Description: test bar on EU
+
+    SUBTEST: foobar
+    Category: Software
+    Type: ioctl
+    Description: test ioctls
     """
 
-    def __init__(self):
+    def __init__(self, config_fname, file_list):
         self.doc = {}
         self.test_number = 0
         self.min_test_prefix = ''
+        self.config = None
+        self.filenames = file_list
+        self.props = {}
+        self.config_fname = config_fname
+        self.level_count = 0
+        self.field_list = {}
+
+        with open(config_fname, 'r', encoding='utf8') as handle:
+            self.config = json.load(handle)
+
+            self.__add_field(None, 0, 0, self.config["fields"])
+
+            sublevel_count = [ 0 ] * self.level_count
+
+            for field, item in self.props.items():
+                if "sublevel" in item["_properties_"]:
+                    level = item["_properties_"]["level"]
+                    sublevel_count[level - 1] += 1
+                field_lc = field.lower()
+                self.field_list[field_lc] = field
+                field_plural = plural(field_lc)
+                if field_lc != field_plural:
+                    self.field_list[field_plural] = field
+
+            # Remove non-multilevel items, as we're only interested on
+            # hierarchical item levels here
+            for field, item in self.props.items():
+                if "sublevel" in item["_properties_"]:
+                    level = item["_properties_"]["level"]
+                    if sublevel_count[level - 1] == 1:
+                        del item["_properties_"]["level"]
+                        del item["_properties_"]["sublevel"]
+
+            if not self.filenames:
+                self.filenames = []
+                files = self.config["files"]
+                for cfg_file in files:
+                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                    for fname in glob.glob(cfg_file):
+                        self.filenames.append(fname)
+
+        if not self.filenames:
+            sys.exit("Need file names to be processed")
+
+        # Parse files, expanding wildcards
+        field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
+
+        for fname in self.filenames:
+            self.__add_file_documentation(fname, field_re)
 
     #
     # ancillary methods
     #
 
+    def __add_field(self, name, sublevel, hierarchy_level, field):
+
+        """ Flatten config fields into a non-hierarchical dictionary """
+
+        for key in field:
+            if key not in self.props:
+                self.props[key] = {}
+                self.props[key]["_properties_"] = {}
+
+            if name:
+                if key == "_properties_":
+                    if key not in self.props:
+                        self.props[key] = {}
+                    self.props[name][key].update(field[key])
+
+                    sublevel += 1
+                    hierarchy_level += 1
+                    if "sublevel" in self.props[name][key]:
+                        if self.props[name][key]["sublevel"] != sublevel:
+                            sys.exit(f"Error: config defined {name} as sublevel {self.props[key]['sublevel']}, but wants to redefine as sublevel {sublevel}")
+
+                    self.props[name][key]["level"] = self.level_count
+                    self.props[name][key]["sublevel"] = sublevel
+
+                    continue
+            else:
+                self.level_count += 1
+
+            self.__add_field(key, sublevel, hierarchy_level, field[key])
+
     def expand_subtest(self, fname, test_name, test):
 
         """Expand subtest wildcards providing an array with subtests"""
@@ -145,7 +299,7 @@ class TestList:
                     if k == 'arg':
                         continue
 
-                    if self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
+                    if k in self.doc[test] and self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
                         continue
 
                     subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
@@ -210,8 +364,9 @@ class TestList:
 
                     sub_field = self.doc[test]["subtest"][subtest][field]
                     sub_field = re.sub(r"%?\barg\[(\d+)\]", lambda m: arg_map[int(m.group(1)) - 1], sub_field) # pylint: disable=W0640
-                    if sub_field == self.doc[test][field]:
-                        continue
+                    if field in self.doc[test]:
+                        if sub_field in self.doc[test][field] and sub_field == self.doc[test][field]:
+                            continue
 
                     subtest_dict[field] = sub_field
 
@@ -323,7 +478,7 @@ class TestList:
         test_dict = self.expand_dictionary()
 
         with open(out_fname, "w", encoding='utf8') as write_file:
-            json.dump(test_dict, write_file, indent=4)
+            json.dump(test_dict, write_file, indent = 4)
 
     #
     # Subtest list methods
@@ -412,7 +567,7 @@ class TestList:
     # File handling methods
     #
 
-    def add_file_documentation(self, fname):
+    def __add_file_documentation(self, fname, field_re):
 
         """Adds the contents of test/subtest documentation form a file"""
 
@@ -503,7 +658,7 @@ class TestList:
 
                 # It is a known section. Parse its contents
                 if (match := re.match(field_re, file_line)):
-                    current_field = match.group(1).lower().capitalize()
+                    current_field = self.field_list[match.group(1).lower()]
                     match_val = match.group(2)
 
                     if handle_section == 'test':
@@ -550,17 +705,19 @@ class TestList:
 
                 if (match := re.match(r'^(.*):', file_line)):
                     sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized field '%s'. Need to add at %s" %
-                            (match.group(1), fname))
+                            (match.group(1), self.config_fname))
 
                 # Handle multi-line field contents
                 if current_field:
                     if (match := re.match(r'\s*(.*)', file_line)):
                         if handle_section == 'test':
-                            self.doc[current_test][current_field] += " " + \
-                                match.group(1)
+                            dic = self.doc[current_test]
                         else:
-                            self.doc[current_test]["subtest"][current_subtest][current_field] += " " + \
-                                match.group(1)
+                            dic = self.doc[current_test]["subtest"][current_subtest]
+
+                        if dic[current_field] != '':
+                            dic[current_field] += " "
+                        dic[current_field] += match.group(1)
 
                     continue
 
@@ -573,8 +730,9 @@ class TestList:
                         if match:
                             self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(1) + ' ' + match_val + ">"
                         else:
-                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += ' ' + match_val
-
+                            if self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] != '':
+                                self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += ' '
+                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += match_val
                     continue
 
 #
@@ -584,6 +742,8 @@ class TestList:
 parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
                                  formatter_class = argparse.ArgumentDefaultsHelpFormatter,
                                  epilog = 'If no action specified, assume --rest.')
+parser.add_argument("--config", required = True,
+                    help="JSON file describing the test plan template")
 parser.add_argument("--rest", action="store_true",
                     help="Generate documentation from the source files, in ReST file format.")
 parser.add_argument("--to-json",
@@ -595,17 +755,12 @@ parser.add_argument("--check-testlist", action="store_true",
 parser.add_argument("--igt-build-path",
                     help="Path where the IGT runner is sitting. Used by --check-testlist.",
                     default=IGT_BUILD_PATH)
-parser.add_argument('--files', nargs='+', required=True,
+parser.add_argument('--files', nargs='+',
                     help="File name(s) to be processed")
 
 parse_args = parser.parse_args()
 
-field_regex = re.compile(r"(" + '|'.join(fields) + r'):\s*(.*)', re.I)
-
-tests = TestList()
-
-for filename in parse_args.files:
-    tests.add_file_documentation(filename, field_regex)
+tests = TestList(parse_args.config, parse_args.files)
 
 RUN = 0
 if parse_args.show_subtests:
-- 
2.39.2
