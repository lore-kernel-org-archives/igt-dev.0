Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3541C10E121
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C05F6580DC2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wwl-2R
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:39 +0100
Message-Id: <20230221083541.1079643-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] scripts/igt_doc.py: add support to
 produce hierarchical output
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

Internally, the JSON dictionary allows specifying fields on
a hierarchical way. Add support to also print the documentation
using it.

While here, also allow specifying a file name for the ReST output.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 199 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 173 insertions(+), 26 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index a1d3a0350499..12a9ebfc0348 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -20,6 +20,26 @@ import sys
 IGT_BUILD_PATH = 'build'
 IGT_RUNNER = 'runner/igt_runner'
 
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
 #
 # Ancillary logic to allow plurals on fields
 #
@@ -242,6 +262,7 @@ class TestList:
                     if sublevel_count[level - 1] == 1:
                         del item["_properties_"]["level"]
                         del item["_properties_"]["sublevel"]
+            del self.props["_properties_"]
 
             if not self.filenames:
                 self.filenames = []
@@ -294,7 +315,7 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
-    def expand_subtest(self, fname, test_name, test):
+    def expand_subtest(self, fname, test_name, test, allow_inherit):
 
         """Expand subtest wildcards providing an array with subtests"""
 
@@ -320,11 +341,13 @@ class TestList:
                     if k == 'arg':
                         continue
 
-                    if k in self.doc[test] and self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
-                        continue
+                    if not allow_inherit:
+                        if k in self.doc[test] and self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
+                            continue
 
                     subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
-                    subtest_array.append(subtest_dict)
+
+                subtest_array.append(subtest_dict)
 
                 continue
 
@@ -385,9 +408,11 @@ class TestList:
 
                     sub_field = self.doc[test]["subtest"][subtest][field]
                     sub_field = re.sub(r"%?\barg\[(\d+)\]", lambda m: arg_map[int(m.group(1)) - 1], sub_field) # pylint: disable=W0640
-                    if field in self.doc[test]:
-                        if sub_field in self.doc[test][field] and sub_field == self.doc[test][field]:
-                            continue
+
+                    if not allow_inherit:
+                        if field in self.doc[test]:
+                            if sub_field in self.doc[test][field] and sub_field == self.doc[test][field]:
+                                continue
 
                     subtest_dict[field] = sub_field
 
@@ -408,9 +433,9 @@ class TestList:
 
         return subtest_array
 
-    def expand_dictionary(self):
+    def expand_dictionary(self, subtest_only):
 
-        """ prepares a dictonary with subtest arguments expanded """
+        """ prepares a dictionary with subtest arguments expanded """
 
         test_dict = {}
 
@@ -421,26 +446,31 @@ class TestList:
             name = re.sub(r'\.[ch]', '', name)
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
 
@@ -448,9 +478,15 @@ class TestList:
     # Output methods
     #
 
-    def print_test(self):
+    def print_rest_flat(self, filename):
 
-        """Print tests and subtests"""
+        """Print tests and subtests ordered by tests"""
+
+        handler = None
+        if filename:
+            original_stdout = sys.stdout
+            handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
+            sys.stdout = handler
 
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
@@ -472,7 +508,7 @@ class TestList:
 
                 print(f":{field}: {self.doc[test][field]}")
 
-            subtest_array = self.expand_subtest(fname, name, test)
+            subtest_array = self.expand_subtest(fname, name, test, False)
 
             for subtest in subtest_array:
                 print()
@@ -493,10 +529,101 @@ class TestList:
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
             json.dump(test_dict, write_file, indent = 4)
@@ -663,7 +790,22 @@ class TestList:
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
@@ -780,8 +922,10 @@ parser = argparse.ArgumentParser(description = "Print formatted kernel documenta
                                  epilog = 'If no action specified, assume --rest.')
 parser.add_argument("--config", required = True,
                     help="JSON file describing the test plan template")
-parser.add_argument("--rest", action="store_true",
-                    help="Generate documentation from the source files, in ReST file format.")
+parser.add_argument("--rest",
+                    help="Output documentation from the source files in REST file.")
+parser.add_argument("--per-test", action="store_true",
+                    help="Modifies ReST output to print subtests per test.")
 parser.add_argument("--to-json",
                     help="Output test documentation in JSON format as TO_JSON file")
 parser.add_argument("--show-subtests", action="store_true",
@@ -813,4 +957,7 @@ if parse_args.to_json:
     tests.print_json(parse_args.to_json)
 
 if not RUN or parse_args.rest:
-    tests.print_test()
+    if parse_args.per_test:
+        tests.print_rest_flat(parse_args.rest)
+    else:
+        tests.print_nested_rest(parse_args.rest)
-- 
2.39.2
