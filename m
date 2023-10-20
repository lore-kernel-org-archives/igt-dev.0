Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382D710E5B3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 14:11:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 84A4A580D4F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 07:11:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtqDj-000Zjy-0x
 for igt-dev@lists.freedesktop.org; Fri, 20 Oct 2023 16:11:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 16:11:22 +0200
Message-ID: <20231020141122.137376-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list.py: better handle list of
 tests
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

Not all test lists are regular expressions. Some are just
names. That's the case of IGT runner testlist files.

Add support for that.

In practice, this change will produce the same testlists
as before, but using a logic closer to what igt_runner()
does.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py             | 54 +++++++++++++++++++++++---------
 tests/intel/kms_test_config.json |  2 +-
 tests/intel/xe_test_config.json  |  1 +
 3 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index e54873f07e20..06215242107a 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -319,10 +319,6 @@ class TestList:
             self.props["Class"]["_properties_"]["level"] = 1
             self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
 
-        flags = 0
-        if self.config.get("case_insensitive_testlist", False):
-            flags |= re.IGNORECASE
-
         # Remove non-multilevel items, as we're only interested on
         # hierarchical item levels here
         for field, item in self.props.items():
@@ -337,7 +333,7 @@ class TestList:
                 testlist = {}
                 for value in item["_properties_"]["include"]:
                     for name in value.keys():
-                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
+                        self.read_testlist(field, item, testlist, name, cfg_path + value[name])
 
                 item["_properties_"]["include"] = testlist
 
@@ -346,7 +342,7 @@ class TestList:
                 testlist = {}
                 for value in item["_properties_"]["exclude"]:
                     for name in value.keys():
-                        self.read_testlist(testlist, name, cfg_path + value[name], flags)
+                        self.read_testlist(field, item, testlist, name, cfg_path + value[name])
 
                 item["_properties_"]["exclude"] = testlist
 
@@ -450,7 +446,22 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
-    def read_testlist(self, testlist, name, filename, flags):
+    def read_testlist(self, field, item, testlist, name, filename):
+
+        match_type = item["_properties_"].get("match-type", "subtest-match")
+
+        match_type_regex = set(["regex", "regex-ignorecase"])
+        match_type_str = set(["subtest-match"])
+        match_types = match_type_regex | match_type_str
+
+        if match_type not in match_types:
+            sys.exit(f"Error: invalid match type '{match_type}' for {field}")
+
+        if match_type == "regex":
+            flags = 0
+        elif match_type == "regex-ignorecase":
+            flags = re.IGNORECASE
+
         base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
         regex = re.compile(base.format(self.main_name, self.subtest_separator))
 
@@ -459,12 +470,25 @@ class TestList:
         with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
             for line in fp:
                 match = regex.match(line)
-                if match:
-                    test = match.group(1)
-                    subtest = match.group(2)
-                    if not subtest.endswith("$"):
-                        subtest += r"(\@.*)?$"
-                    testlist[name].append(re.compile(f"{test}{subtest}", flags))
+                if not match:
+                    continue
+
+                test = match.group(1)
+                subtest = match.group(2)
+                test_name = f"{test}{subtest}"
+
+                if match_type in match_type_regex:
+                    testlist[name].append(re.compile(test_name, flags))
+                    continue
+
+                subtests = test_name.split(self.subtest_separator)[:3]
+
+                prefix=""
+                for subtest in subtests:
+                    subtest = prefix + subtest
+                    prefix = subtest + self.subtest_separator
+
+                testlist[name].append(re.compile(f"{subtest}(@.*)?"))
 
     def __filter_subtest(self, test, subtest, field_not_found_value):
 
@@ -504,7 +528,7 @@ class TestList:
             for names, regex_array in self.props[field]["_properties_"]["include"].items():
                 name = set(re.split(",\s*", names))
                 for regex in regex_array:
-                    if regex.match(testname):
+                    if regex.fullmatch(testname):
                         values.update(name)
                         break
 
@@ -514,7 +538,7 @@ class TestList:
                 for names, regex_array in self.props[field]["_properties_"]["exclude"].items():
                     deleted_names = set(re.split(",\s*", names))
                     for regex in regex_array:
-                        if regex.match(testname):
+                        if regex.fullmatch(testname):
                             if sorted(deleted_names) == sorted(values):
                                 set_full_if_empty = False
                             values.discard(deleted_names)
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 40cf69dd0904..837380ee7fae 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -4,7 +4,6 @@
     "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
-    "case_insensitive_testlist": true,
     "fields": {
         "Category": {
             "_properties_": {
@@ -24,6 +23,7 @@
                 "_properties_": {
                     "description": "Defines what category of testlist it belongs",
                     "default-testlist": "FULL",
+                    "match-type": "subtest-match",
                     "include": [
                         { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 20faf73b7270..5fd7c888f274 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -33,6 +33,7 @@
                             "mandatory": true,
                             "description": "Defines what category of testlist it belongs",
                             "default-testlist": "FULL",
+                            "match-type": "subtest-match",
                             "include": [
                                 { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
                             ],
-- 
2.41.0
