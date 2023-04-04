Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA110E42D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 17:18:04 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.6.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BDEC85804D9
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 10:18:03 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjkID-000yB2-0G
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 19:18:01 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 19:17:58 +0200
Message-Id: <20230404171758.231305-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list.py: make filtering logic
 more generic
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

Allow multiple filter filters and filter also print outputs,
except for the json one.

After the patch, applying multiple filters and display per-test
documentation, for instance, could be done with commands like:

  ./scripts/igt_doc.py --config tests/xe/*.json --filter-field \
	 Sub-category=~execbuf run\ type=~bat --per-test

The filter will now be applied to all possible outputs of the
script.

Requested-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py   | 12 ++++--
 scripts/test_list.py | 89 +++++++++++++++++++++++++++++++-------------
 2 files changed, 72 insertions(+), 29 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 547cb81bce02..4af0f045d13d 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -32,8 +32,8 @@ parser.add_argument("--show-subtests", action="store_true",
                     help="Shows the name of the documented subtests in alphabetical order.")
 parser.add_argument("--sort-field",
                     help="modify --show-subtests to sort output based on SORT_FIELD value")
-parser.add_argument("--filter-field",
-                    help="modify --show-subtests to filter output based a regex given by FILTER_FIELD=~'regex'")
+parser.add_argument("--filter-field", nargs='*',
+                    help="filter subtests based on regular expressions given by FILTER_FIELD=~'regex'")
 parser.add_argument("--check-testlist", action="store_true",
                     help="Compare documentation against IGT runner testlist.")
 parser.add_argument("--include-plan", action="store_true",
@@ -54,10 +54,14 @@ parse_args = parser.parse_args()
 tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
                  parse_args.igt_build_path, parse_args.igt_runner)
 
+if parse_args.filter_field:
+    for filter_expr in parse_args.filter_field:
+        tests.add_filter(filter_expr)
+
 RUN = 0
 if parse_args.show_subtests:
     RUN = 1
-    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
+    tests.show_subtests(parse_args.sort_field)
 
 if parse_args.check_testlist:
     RUN = 1
@@ -67,7 +71,7 @@ if parse_args.gen_testlist:
     RUN = 1
     if not parse_args.sort_field:
         sys.exit("Need a field to split the testlists")
-    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field, parse_args.filter_field)
+    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field)
 
 if parse_args.to_json:
     RUN = 1
diff --git a/scripts/test_list.py b/scripts/test_list.py
index 075f44d5e604..cddbd333acba 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -258,6 +258,7 @@ class TestList:
         self.level_count = 0
         self.field_list = {}
         self.title = None
+        self.filters = {}
 
         driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
 
@@ -385,6 +386,23 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
+    def __filter_subtest(self, test, subtest, field_not_found_value):
+
+        """ Apply filter criteria to subtests """
+
+        for filter_field, regex in self.filters.items():
+            if filter_field in subtest:
+                if not re.match(regex, subtest[filter_field]):
+                    return True
+            elif filter_field in test:
+                if not re.match(regex, test[filter_field]):
+                    return True
+            else:
+                return field_not_found_value
+
+        # None of the filtering rules were applied
+        return False
+
     def expand_subtest(self, fname, test_name, test, allow_inherit):
 
         """Expand subtest wildcards providing an array with subtests"""
@@ -394,7 +412,7 @@ class TestList:
         for subtest in self.doc[test]["subtest"].keys():
             summary = test_name
             if self.doc[test]["subtest"][subtest]["Summary"] != '':
-                 summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
+                summary += '@' + self.doc[test]["subtest"][subtest]["Summary"]
             if not summary:
                 continue
 
@@ -533,6 +551,9 @@ class TestList:
 
             subtest_array = self.expand_subtest(fname, name, test, subtest_only)
             for subtest in subtest_array:
+                if self.__filter_subtest(test, subtest, True):
+                    continue
+
                 summary = subtest["Summary"]
 
                 dic[summary] = {}
@@ -571,6 +592,19 @@ class TestList:
             name = re.sub(r'\.[ch]', '', name)
             name = "igt@" + name
 
+            tmp_subtest = self.expand_subtest(fname, name, test, False)
+
+            # Get subtests first, to avoid displaying tests with
+            # all filtered subtests
+            subtest_array = []
+            for subtest in tmp_subtest:
+                if self.__filter_subtest(self.doc[test], subtest, True):
+                    continue
+                subtest_array.append(subtest)
+
+            if not subtest_array:
+                continue
+
             print(len(name) * '=')
             print(name)
             print(len(name) * '=')
@@ -584,9 +618,8 @@ class TestList:
 
                 print(f":{field}: {self.doc[test][field]}")
 
-            subtest_array = self.expand_subtest(fname, name, test, False)
-
             for subtest in subtest_array:
+
                 print()
                 print(subtest["Summary"])
                 print(len(subtest["Summary"]) * '=')
@@ -709,11 +742,28 @@ class TestList:
         with open(out_fname, "w", encoding='utf8') as write_file:
             json.dump(test_dict, write_file, indent = 4)
 
+    #
+    # Add filters
+    #
+    def add_filter(self, filter_field_expr):
+
+        """ Add a filter criteria for output data """
+
+        match = re.match(r"(.*)=~\s*(.*)", filter_field_expr)
+        if not match:
+            sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
+        field = match.group(1).strip().lower()
+        if field not in self.field_list:
+            sys.exit(f"Field '{field}' is not defined")
+        filter_field = self.field_list[field]
+        regex = re.compile("{0}".format(match.group(2).strip()), re.I) # pylint: disable=C0209
+        self.filters[filter_field] = regex
+
     #
     # Subtest list methods
     #
 
-    def get_subtests(self, sort_field = None, filter_field_expr = None):
+    def get_subtests(self, sort_field = None):
 
         """Return an array with all subtests"""
 
@@ -725,17 +775,6 @@ class TestList:
                 sys.exit(f"Field '{sort_field}' is not defined")
             sort_field = self.field_list[sort_field.lower()]
 
-        if filter_field_expr:
-            match = re.match(r"(.*)=~\s*(.*)", filter_field_expr)
-            if not match:
-                sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
-
-            field = match.group(1).strip().lower()
-            if field not in self.field_list:
-                sys.exit(f"Field '{field}' is not defined")
-            filter_field = self.field_list[field]
-            regex = re.compile("{0}".format(match.group(2).strip()), re.I) # pylint: disable=C0209
-
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
 
@@ -746,11 +785,8 @@ class TestList:
             subtest_array = self.expand_subtest(fname, test_name, test, True)
 
             for subtest in subtest_array:
-                if filter_field_expr:
-                    if filter_field not in subtest:
-                        continue
-                    if not re.match(regex, subtest[filter_field]):
-                        continue
+                if self.__filter_subtest(test, subtest, True):
+                    continue
 
                 if sort_field:
                     if sort_field in subtest:
@@ -776,6 +812,9 @@ class TestList:
         if not self.igt_build_path or not self.igt_runner:
             sys.exit("Need the IGT build path and igt_runner executable file name")
 
+        if self.filters:
+            print("NOTE: test checks are affected by filters")
+
         doc_subtests = sorted(self.get_subtests()[""])
 
         for i in range(0, len(doc_subtests)): # pylint: disable=C0200
@@ -1035,12 +1074,12 @@ class TestList:
                 sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (self.config_fname, file_line))
 
-    def show_subtests(self, sort_field, filter_field):
+    def show_subtests(self, sort_field):
 
         """Show subtests, allowing sort and filter a field """
 
         if sort_field:
-            test_subtests = self.get_subtests(sort_field, filter_field)
+            test_subtests = self.get_subtests(sort_field)
             for val_key in sorted(test_subtests.keys()):
                 if not test_subtests[val_key]:
                     continue
@@ -1051,17 +1090,17 @@ class TestList:
                     for sub in test_subtests[val_key]:
                         print (f"  {sub}")
         else:
-            for sub in self.get_subtests(sort_field, filter_field)[""]:
+            for sub in self.get_subtests(sort_field)[""]:
                 print (sub)
 
-    def gen_testlist(self, directory, sort_field, filter_field):
+    def gen_testlist(self, directory, sort_field):
 
         """Generate testlists from the test documentation"""
 
         test_prefix = os.path.commonprefix(self.get_subtests()[""])
         test_prefix = re.sub(r'^igt@', '', test_prefix)
 
-        test_subtests = self.get_subtests(sort_field, filter_field)
+        test_subtests = self.get_subtests(sort_field)
 
         for test in test_subtests.keys():  # pylint: disable=C0201,C0206
             if not test_subtests[test]:
-- 
2.39.2
