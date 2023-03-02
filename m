Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56B10E12B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 11:10:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Mar 2023 12:09:46 +0100
Message-Id: <20230302110947.548610-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 7/8] docs/testplan: Introduce new way for
 documenting IGT
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

Add custom targets to allow building the testplan documentation
for the Xe driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 docs/meson.build           |   1 +
 docs/testplan/meson.build  |  28 +++
 docs/testplan/testplan.css |   7 +
 meson_options.txt          |   4 +
 scripts/igt_doc.py         | 490 +++++++++++++++++++++++++++++++++----
 scripts/meson.build        |   2 +
 6 files changed, 479 insertions(+), 53 deletions(-)
 create mode 100644 docs/testplan/meson.build
 create mode 100644 docs/testplan/testplan.css

diff --git a/docs/meson.build b/docs/meson.build
index ead14c4015..01edf64f04 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1 +1,2 @@
 subdir('reference')
+subdir('testplan')
diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
new file mode 100644
index 0000000000..4b55ca6ae5
--- /dev/null
+++ b/docs/testplan/meson.build
@@ -0,0 +1,28 @@
+build_testplan = get_option('testplan')
+
+rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
+
+stylesheet = meson.current_source_dir() + '/testplan.css'
+
+if igt_doc_script.found()
+    # Xe test documentation
+    testplan = 'xe_tests'
+
+    rst = custom_target(testplan + '.rst',
+                        build_by_default : true,
+                        command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ],
+                        input : xe_test_config,
+                        output : testplan + '.rst'
+                        )
+    if rst2html.found()
+        custom_target(testplan + '.html',
+                      build_by_default : true,
+                      command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
+                      input : rst,
+                      output : testplan + '.html'
+                      )
+    endif
+endif
+
+build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
+build_info += 'Build html testplan documentation: @0@'.format(rst2html.found())
diff --git a/docs/testplan/testplan.css b/docs/testplan/testplan.css
new file mode 100644
index 0000000000..8aa7b7105c
--- /dev/null
+++ b/docs/testplan/testplan.css
@@ -0,0 +1,7 @@
+@import url(html4css1.css);
+
+.literal {
+	background: lightgrey;
+        color: darkblue;
+        font-size: 14px;
+}
diff --git a/meson_options.txt b/meson_options.txt
index d978813b4f..fb48ba780d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -20,6 +20,10 @@ option('man',
        type : 'feature',
        description : 'Build man pages')
 
+option('testplan',
+       type : 'feature',
+       description : 'Build testplan documentation pages in ReST and html')
+
 option('docs',
        type : 'feature',
        description : 'Build documentation')
diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index b7e3129d3f..f2227a9720 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0914,R0912,R0915
+# pylint: disable=C0301,R0902,R0914,R0912,R0915,R1702
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -11,26 +11,87 @@
 """Maintain test plan and test implementation documentation on IGT."""
 
 import argparse
+import glob
+import json
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
+"""
+
+    if (match := re.match(r"(.*)\b(\S+)", field)):
+        ret_str = match.group(1)
+        word = match.group(2)
+
+        if word.isupper():
+            ret_str += word
+        elif word == "of" or word == "off" or word == "on" or word =="description" or word == "todo":
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
+    else:
+        return field
 
 #
 # TestList class definition
@@ -107,19 +168,160 @@ class TestList:
     The wildcard arguments there need to be expanded. This is done by
     defining arg[1] to arg[n] at the same code comment that contains the
     SUBTEST as those variables are locally processed on each comment line.
-    """
 
+    This script needs a configuration file, in JSON format, describing the
+    fields which will be parsed for TEST and/or SUBTEST tags.
+
+    An exemple of such file is:
+
+    {
+        "files": [ "tests/driver/*.c" ],
+        "fields": {
+            "Category": {
+                "_properties_": {
+                    "is_field": true,
+                    "description": "Contains the major group for the tested functionality"
+                },
+                "Hardware": {
+                    "Sub-category": {
+                        "_properties_": {
+                            "is_field": true,
+                            "description": "Contains the minor group of the functionality"
+                        }
+                    }
+                },
+                "Software building block": {
+                    "Type": {
+                        "_properties_": {
+                            "is_field": true,
+                            "description": "Contains the minor group of the functionality"
+                        }
+                    }
+                }
+            },
+            "Description" : {
+                "_properties_": {
+                    "is_field": true,
+                    "description": "Provides a description for the test/subtest."
+                }
+            }
+        }
+    }
+
+    On such structure, entries having ["_properties_"]["is_field"] == true
+    are fields. When this is not found (or it is False), it indicates a
+    possible value.
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
+    """
 
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
+                if "is_field" not in item["_properties_"]:
+                    continue
+                if "sublevel" in item["_properties_"]:
+                    level = item["_properties_"]["level"]
+                    sublevel_count[level - 1] += 1
+                if item["_properties_"]["is_field"]:
+                    lc = field.lower()
+                    self.field_list[lc] = field
+                    pl = plural(lc)
+                    if lc != pl:
+                        self.field_list[pl] = field
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
+            if not self.filenames:
+                self.filenames = []
+                files = self.config["files"]
+                for f in files:
+                    f = os.path.realpath(os.path.dirname(config_fname)) + "/" + f
+                    for fname in glob.glob(f):
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
+                    if "is_field" in self.props[name][key]:
+                        if self.props[name][key]["is_field"]:
+                            sublevel += 1
+                            hierarchy_level += 1
+                            if "sublevel" in self.props[name][key]:
+                                if self.props[name][key]["sublevel"] != sublevel:
+                                    sys.exit(f"Error: config defined {name} as sublevel {self.props[key]['sublevel']}, but wants to redefine as sublevel {sublevel}")
+
+                            self.props[name][key]["level"] = self.level_count
+                            self.props[name][key]["sublevel"] = sublevel
+                    continue
+            else:
+                self.level_count += 1
+
+            self.__add_field(key, sublevel, hierarchy_level, field[key])
+
+    def expand_subtest(self, fname, test_name, test, allow_inherit):
 
         """Expand subtest wildcards providing an array with subtests"""
 
@@ -145,11 +347,13 @@ class TestList:
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
 
@@ -210,8 +414,11 @@ class TestList:
 
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
 
@@ -232,14 +439,63 @@ class TestList:
 
         return subtest_array
 
+    def expand_dictionary(self, subtest_only):
+
+        """ prepares a dictionary with subtest arguments expanded """
+
+        test_dict = {}
+
+        for test in self.doc:                   # pylint: disable=C0206
+            fname = self.doc[test]["File"]
+
+            name = re.sub(r'.*tests/', '', fname)
+            name = re.sub(r'\.[ch]', '', name)
+            name = "igt@" + name
+
+            if not subtest_only:
+                test_dict[name] = {}
+
+                for field in self.doc[test]:
+                    if field == "subtest":
+                        continue
+                    if field == "arg":
+                        continue
+
+                    test_dict[name][field] = self.doc[test][field]
+                dic = test_dict[name]
+            else:
+                dic = test_dict
+
+            subtest_array = self.expand_subtest(fname, name, test, subtest_only)
+            for subtest in subtest_array:
+                summary = subtest["Summary"]
+
+                dic[summary] = {}
+                for field in sorted(subtest.keys()):
+                    if field == 'Summary':
+                        continue
+                    if field == 'arg':
+                        continue
+                    dic[summary][field] = subtest[field]
+
+        return test_dict
+
     #
     # Output methods
     #
 
-    def print_test(self):
+    def print_rest_flat(self, filename):
 
         """Print tests and subtests ordered by tests"""
 
+        original_stdout = sys.stdout
+        f = None
+
+        if filename:
+            f = open(filename, "w", encoding='utf8')
+
+            sys.stdout = f
+
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
 
@@ -260,7 +516,7 @@ class TestList:
 
                 print(f":{field}: {self.doc[test][field]}")
 
-            subtest_array = self.expand_subtest(fname, name, test)
+            subtest_array = self.expand_subtest(fname, name, test, False)
 
             for subtest in subtest_array:
                 print()
@@ -281,6 +537,107 @@ class TestList:
             print()
             print()
 
+        if f:
+            f.close()
+        sys.stdout = original_stdout
+
+    def print_nested_rest(self, filename):
+
+        """Print tests and subtests ordered by tests"""
+
+        original_stdout = sys.stdout
+        f = None
+
+        if filename:
+            f = open(filename, "w", encoding='utf8')
+
+            sys.stdout = f
+
+        """Print tests and subtests using fields hierarchy"""
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
+            for cur_level in range(0, len(fields_order)):  # pylint: disable=C0200
+                field = fields_order[cur_level]
+                if not "level" in self.props[field]["_properties_"]:
+                    continue
+                if field in fields:
+                    if old_fields[cur_level] != fields[field]:
+                        break
+
+            # print hierarchy
+            for i in range(cur_level, len(fields_order)):
+                if not "level" in self.props[fields_order[i]]["_properties_"]:
+                    continue
+                if not fields_order[i] in fields:
+                    continue
+                marker = self.props[fields_order[i]]["_properties_"]["sublevel"]
+
+                title_str = fields_order[i] + ": " + fields[fields_order[i]]
+
+                if marker >= len(level_markers):
+                    sys.exit(f"Too many levels: {marker}, maximum limit is {len(level_markers):}")
+
+                print(title_str)
+                print(level_markers[marker] * len(title_str))
+                print()
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
+        if f:
+            f.close()
+        sys.stdout = original_stdout
+
+    def print_json(self, out_fname):
+
+        """Adds the contents of test/subtest documentation form a file"""
+
+        # Receives a dictionary with tests->subtests with expanded subtests
+        test_dict = self.expand_dictionary(False)
+
+        with open(out_fname, "w", encoding='utf8') as write_file:
+            json.dump(test_dict, write_file, indent = 4)
+
     #
     # Subtest list methods
     #
@@ -298,7 +655,7 @@ class TestList:
             test_name = re.sub(r'\.[ch]', '', test_name)
             test_name = "igt@" + test_name
 
-            subtest_array = self.expand_subtest(fname, test_name, test)
+            subtest_array = self.expand_subtest(fname, test_name, test, False)
 
             for subtest in subtest_array:
                 subtests.append(subtest["Summary"])
@@ -318,14 +675,15 @@ class TestList:
             doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
 
         # Get a list of tests from
-        result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",  # pylint: disable=W1510
-                                "-L", "-t",  self.min_test_prefix,
-                                f"{IGT_BUILD_PATH}/tests"],
-                                capture_output = True, text = True)
-        if result.returncode:
-            print( result.stdout)
-            print("Error:", result.stderr)
-            sys.exit(result.returncode)
+        try:
+            result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
+                                    "-L", "-t",  self.min_test_prefix,
+                                    f"{IGT_BUILD_PATH}/tests"], check = True,
+                                    capture_output = True, text = True)
+        except subprocess.CalledProcessError as sub_err:
+            print(sub_err.stderr)
+            print("Error:", sub_err)
+            sys.exit(1)
 
         run_subtests = sorted(result.stdout.splitlines())
 
@@ -368,7 +726,7 @@ class TestList:
     # File handling methods
     #
 
-    def add_file_documentation(self, fname, field_re):
+    def __add_file_documentation(self, fname, field_re):
 
         """Adds the contents of test/subtest documentation form a file"""
 
@@ -443,7 +801,22 @@ class TestList:
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
@@ -459,7 +832,7 @@ class TestList:
 
                 # It is a known section. Parse its contents
                 if (match := re.match(field_re, file_line)):
-                    current_field = match.group(1).lower().capitalize()
+                    current_field = self.field_list[match.group(1).lower()]
                     match_val = match.group(2)
 
                     if handle_section == 'test':
@@ -506,17 +879,19 @@ class TestList:
 
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
 
@@ -529,8 +904,9 @@ class TestList:
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
@@ -540,8 +916,14 @@ class TestList:
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
+parser.add_argument("--to-json",
+                    help="Output test documentation in JSON format as TO_JSON file")
 parser.add_argument("--show-subtests", action="store_true",
                     help="Shows the name of the documented subtests in alphabetical order.")
 parser.add_argument("--check-testlist", action="store_true",
@@ -549,17 +931,12 @@ parser.add_argument("--check-testlist", action="store_true",
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
@@ -571,5 +948,12 @@ if parse_args.check_testlist:
     RUN = 1
     tests.check_tests()
 
+if parse_args.to_json:
+    RUN = 1
+    tests.print_json(parse_args.to_json)
+
 if not RUN or parse_args.rest:
-    tests.print_test()
+    if parse_args.per_test:
+        tests.print_rest_flat(parse_args.rest)
+    else:
+        tests.print_nested_rest(parse_args.rest)
diff --git a/scripts/meson.build b/scripts/meson.build
index 342972e660..9ab3376e84 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -11,3 +11,5 @@ if build_tests
 		install_data(prog, install_dir : bindir, install_mode : 'r-xr-xr-x')
 	endforeach
 endif
+
+igt_doc_script = find_program('igt_doc.py')
-- 
2.34.1
