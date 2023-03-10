Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF34E10E1F8
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:41:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:09 +0100
Message-Id: <20230310194125.14781-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/19] scripts/igt_doc.py: dynamically
 create fields array from a JSON file
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
 scripts/igt_doc.py | 494 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 429 insertions(+), 65 deletions(-)
 mode change 100644 => 100755 scripts/igt_doc.py

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
old mode 100644
new mode 100755
index d21f87dc71..425240b2f7
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0914,R0912,R0915
+# pylint: disable=C0301,R0902,R0914,R0912,R0915
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -11,27 +11,87 @@
 """Maintain test plan and test implementation documentation on IGT."""
 
 import argparse
+import glob
 import json
+import os
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
+# ancillary functions to sort dictionary hierarchy
+#
+def _sort_per_level(item):
+    if "level" not in item[1]["_properties_"]:
+        return item[0]
+
+    return "%05d_%05d_%s" % (item[1]["_properties_"]["level"], item[1]["_properties_"]["sublevel"], item[0])   # pylint: disable=C0209
+
+def _sort_using_array(item, array):
+    ret_str = ''
+    for field in array:
+        if field in item[1]:
+            ret_str += '_' + field + '_' + item[1][field]
+
+    if ret_str == '':
+        ret_str="________"
+
+    return ret_str
+
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
@@ -48,13 +108,7 @@ class TestList:
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
@@ -108,18 +162,186 @@ class TestList:
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
+    def __init__(self, config_fname, include_plan, file_list):
         self.doc = {}
         self.test_number = 0
         self.min_test_prefix = ''
+        self.config = None
+        self.filenames = file_list
+        self.plan_filenames = []
+        self.props = {}
+        self.config_fname = config_fname
+        self.level_count = 0
+        self.field_list = {}
+        self.title = None
+
+        driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
+
+        implemented_class = None
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
+                    sublevel = item["_properties_"]["sublevel"]
+                    if sublevel > sublevel_count[level - 1]:
+                        sublevel_count[level - 1] = sublevel
+
+                field_lc = field.lower()
+                self.field_list[field_lc] = field
+                field_plural = plural(field_lc)
+                if field_lc != field_plural:
+                    self.field_list[field_plural] = field
+
+            if include_plan:
+                self.props["Class"] = {}
+                self.props["Class"]["_properties_"] = {}
+                self.props["Class"]["_properties_"]["level"] = 1
+                self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
+
+            # Remove non-multilevel items, as we're only interested on
+            # hierarchical item levels here
+            for field, item in self.props.items():
+                if "sublevel" in item["_properties_"]:
+                    level = item["_properties_"]["level"]
+                    if sublevel_count[level - 1] == 1:
+                        del item["_properties_"]["level"]
+                        del item["_properties_"]["sublevel"]
+            del self.props["_properties_"]
+
+            has_implemented = False
+            if not self.filenames:
+                self.filenames = []
+                files = self.config["files"]
+                for cfg_file in files:
+                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                    for fname in glob.glob(cfg_file):
+                        self.filenames.append(fname)
+                        has_implemented = True
+
+            has_planned = False
+            if include_plan and "planning_files" in self.config:
+                implemented_class = "Implemented"
+                files = self.config["planning_files"]
+                for cfg_file in files:
+                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                    for fname in glob.glob(cfg_file):
+                        self.plan_filenames.append(fname)
+                        has_planned = True
+
+        planned_class = None
+        if has_implemented:
+            if has_planned:
+                planned_class = "Planned"
+                self.title = "Planned and implemented tests for "
+            else:
+                self.title = "Implemented tests for "
+        else:
+            if has_planned:
+                self.title = "Planned tests for "
+            else:
+                sys.exit("Need file names to be processed")
+
+        self.title += driver_name + " driver"
+
+        # Parse files, expanding wildcards
+        field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
+
+        for fname in self.filenames:
+            if fname == '':
+                continue
+
+            self.__add_file_documentation(fname, implemented_class, field_re)
+
+        if include_plan:
+            for fname in self.plan_filenames:
+                self.__add_file_documentation(fname, planned_class, field_re)
 
     #
     # ancillary methods
     #
 
-    def expand_subtest(self, fname, test_name, test):
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
+    def expand_subtest(self, fname, test_name, test, allow_inherit):
 
         """Expand subtest wildcards providing an array with subtests"""
 
@@ -145,11 +367,13 @@ class TestList:
                     if k == 'arg':
                         continue
 
-                    if self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
-                        continue
+                    if not allow_inherit:
+                        if k in self.doc[test] and self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
+                            continue
 
                     subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
-                    subtest_array.append(subtest_dict)
+
+                subtest_array.append(subtest_dict)
 
                 continue
 
@@ -210,8 +434,11 @@ class TestList:
 
                     sub_field = self.doc[test]["subtest"][subtest][field]
                     sub_field = re.sub(r"%?\barg\[(\d+)\]", lambda m: arg_map[int(m.group(1)) - 1], sub_field) # pylint: disable=W0640
-                    if sub_field == self.doc[test][field]:
-                        continue
+
+                    if not allow_inherit:
+                        if field in self.doc[test]:
+                            if sub_field in self.doc[test][field] and sub_field == self.doc[test][field]:
+                                continue
 
                     subtest_dict[field] = sub_field
 
@@ -232,9 +459,9 @@ class TestList:
 
         return subtest_array
 
-    def expand_dictionary(self):
+    def expand_dictionary(self, subtest_only):
 
-        """ prepares a dictonary with subtest arguments expanded """
+        """ prepares a dictionary with subtest arguments expanded """
 
         test_dict = {}
 
@@ -242,29 +469,34 @@ class TestList:
             fname = self.doc[test]["File"]
 
             name = re.sub(r'.*tests/', '', fname)
-            name = re.sub(r'\.[ch]', '', name)
+            name = re.sub(r'\.[\w+]$', '', name)
             name = "igt@" + name
 
-            test_dict[name] = {}
+            if not subtest_only:
+                test_dict[name] = {}
 
-            for field in self.doc[test]:
-                if field == "subtest":
-                    continue
-                if field == "arg":
-                    continue
+                for field in self.doc[test]:
+                    if field == "subtest":
+                        continue
+                    if field == "arg":
+                        continue
 
-                test_dict[name][field] = self.doc[test][field]
+                    test_dict[name][field] = self.doc[test][field]
+                dic = test_dict[name]
+            else:
+                dic = test_dict
 
-            subtest_array = self.expand_subtest(fname, name, test)
+            subtest_array = self.expand_subtest(fname, name, test, subtest_only)
             for subtest in subtest_array:
                 summary = subtest["Summary"]
-                test_dict[name][summary] = {}
+
+                dic[summary] = {}
                 for field in sorted(subtest.keys()):
                     if field == 'Summary':
                         continue
                     if field == 'arg':
                         continue
-                    test_dict[name][summary][field] = subtest[field]
+                    dic[summary][field] = subtest[field]
 
         return test_dict
 
@@ -272,9 +504,20 @@ class TestList:
     # Output methods
     #
 
-    def print_test(self):
+    def print_rest_flat(self, filename):
+
+        """Print tests and subtests ordered by tests"""
 
-        """Print tests and subtests"""
+        handler = None
+        if filename:
+            original_stdout = sys.stdout
+            handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
+            sys.stdout = handler
+
+        print("=" * len(self.title))
+        print(self.title)
+        print("=" * len(self.title))
+        print()
 
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
@@ -296,7 +539,7 @@ class TestList:
 
                 print(f":{field}: {self.doc[test][field]}")
 
-            subtest_array = self.expand_subtest(fname, name, test)
+            subtest_array = self.expand_subtest(fname, name, test, False)
 
             for subtest in subtest_array:
                 print()
@@ -317,13 +560,109 @@ class TestList:
             print()
             print()
 
+        if handler:
+            handler.close()
+            sys.stdout = original_stdout
+
+    def print_nested_rest(self, filename):
+
+        """Print tests and subtests ordered by tests"""
+
+        handler = None
+        if filename:
+            original_stdout = sys.stdout
+            handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
+            sys.stdout = handler
+
+        print("=" * len(self.title))
+        print(self.title)
+        print("=" * len(self.title))
+        print()
+
+        # Identify the sort order for the fields
+        fields_order = []
+        fields = sorted(self.props.items(), key = _sort_per_level)
+        for item in fields:
+            fields_order.append(item[0])
+
+        # Receives a flat subtest dictionary, with wildcards expanded
+        subtest_dict = self.expand_dictionary(True)
+
+        subtests = sorted(subtest_dict.items(),
+                          key = lambda x: _sort_using_array(x, fields_order))
+
+        # Use the level markers below
+        level_markers='=-^_~:.`"*+#'
+
+        # Print the data
+        old_fields = [ '' ] * len(fields_order)
+
+        for subtest, fields in subtests:
+            # Check what level has different message
+            marker = 0
+            for cur_level in range(0, len(fields_order)):  # pylint: disable=C0200
+                field = fields_order[cur_level]
+                if not "level" in self.props[field]["_properties_"]:
+                    continue
+                if field in fields:
+                    if old_fields[cur_level] != fields[field]:
+                        break
+                    marker += 1
+
+            # print hierarchy
+            for i in range(cur_level, len(fields_order)):
+                if not "level" in self.props[fields_order[i]]["_properties_"]:
+                    continue
+                if not fields_order[i] in fields:
+                    continue
+
+                if marker >= len(level_markers):
+                    sys.exit(f"Too many levels: {marker}, maximum limit is {len(level_markers):}")
+
+                title_str = fields_order[i] + ": " + fields[fields_order[i]]
+
+                print(title_str)
+                print(level_markers[marker] * len(title_str))
+                print()
+                marker += 1
+
+            print()
+            print("``" + subtest + "``")
+            print()
+
+            # print non-hierarchy fields
+            for field in fields_order:
+                if "level" in self.props[field]["_properties_"]:
+                    continue
+
+                if field in fields:
+                    print(f":{field}: {fields[field]}")
+
+            # Store current values
+            for i in range(cur_level, len(fields_order)):
+                field = fields_order[i]
+                if not "level" in self.props[field]["_properties_"]:
+                    continue
+                if field in fields:
+                    old_fields[i] = fields[field]
+                else:
+                    old_fields[i] = ''
+
+            print()
+
+        if handler:
+            handler.close()
+            sys.stdout = original_stdout
+
     def print_json(self, out_fname):
 
         """Adds the contents of test/subtest documentation form a file"""
-        test_dict = self.expand_dictionary()
+
+        # Receives a dictionary with tests->subtests with expanded subtests
+        test_dict = self.expand_dictionary(False)
 
         with open(out_fname, "w", encoding='utf8') as write_file:
-            json.dump(test_dict, write_file, indent=4)
+            json.dump(test_dict, write_file, indent = 4)
 
     #
     # Subtest list methods
@@ -412,7 +751,7 @@ class TestList:
     # File handling methods
     #
 
-    def add_file_documentation(self, fname):
+    def __add_file_documentation(self, fname, implemented_class, field_re):
 
         """Adds the contents of test/subtest documentation form a file"""
 
@@ -475,6 +814,9 @@ class TestList:
                         self.doc[current_test]["Summary"] = match.group(1)
                         self.doc[current_test]["File"] = fname
                         self.doc[current_test]["subtest"] = {}
+
+                        if implemented_class:
+                            self.doc[current_test]["Class"] = implemented_class
                         current_subtest = None
 
                         continue
@@ -487,7 +829,22 @@ class TestList:
                     current_field = ''
                     handle_section = 'subtest'
 
+                    # subtests inherit properties from the tests
                     self.doc[current_test]["subtest"][current_subtest] = {}
+                    for field in self.doc[current_test].keys():
+                        if field == "arg":
+                            continue
+                        if field == "summary":
+                            continue
+                        if field == "File":
+                            continue
+                        if field == "subtest":
+                            continue
+                        if field == "_properties_":
+                            continue
+                        if field == "Description":
+                            continue
+                        self.doc[current_test]["subtest"][current_subtest][field] = self.doc[current_test][field]
 
                     self.doc[current_test]["subtest"][current_subtest]["Summary"] = match.group(1)
                     self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
@@ -503,7 +860,7 @@ class TestList:
 
                 # It is a known section. Parse its contents
                 if (match := re.match(field_re, file_line)):
-                    current_field = match.group(1).lower().capitalize()
+                    current_field = self.field_list[match.group(1).lower()]
                     match_val = match.group(2)
 
                     if handle_section == 'test':
@@ -550,17 +907,19 @@ class TestList:
 
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
 
@@ -573,8 +932,9 @@ class TestList:
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
@@ -584,28 +944,29 @@ class TestList:
 parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
                                  formatter_class = argparse.ArgumentDefaultsHelpFormatter,
                                  epilog = 'If no action specified, assume --rest.')
-parser.add_argument("--rest", action="store_true",
-                    help="Generate documentation from the source files, in ReST file format.")
+parser.add_argument("--config", required = True,
+                    help="JSON file describing the test plan template")
+parser.add_argument("--rest",
+                    help="Output documentation from the source files in REST file.")
+parser.add_argument("--per-test", action="store_true",
+                    help="Modifies ReST output to print subtests per test.")
 parser.add_argument("--to-json",
                     help="Output test documentation in JSON format as TO_JSON file")
 parser.add_argument("--show-subtests", action="store_true",
                     help="Shows the name of the documented subtests in alphabetical order.")
 parser.add_argument("--check-testlist", action="store_true",
                     help="Compare documentation against IGT runner testlist.")
+parser.add_argument("--include-plan", action="store_true",
+                    help="Include test plans, if any.")
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
+tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files)
 
 RUN = 0
 if parse_args.show_subtests:
@@ -622,4 +983,7 @@ if parse_args.to_json:
     tests.print_json(parse_args.to_json)
 
 if not RUN or parse_args.rest:
-    tests.print_test()
+    if parse_args.per_test:
+        tests.print_rest_flat(parse_args.rest)
+    else:
+        tests.print_nested_rest(parse_args.rest)
-- 
2.34.1
