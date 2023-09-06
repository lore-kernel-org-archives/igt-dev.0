Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317B510E5FF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 10:53:07 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 11:05:40 +0200
Message-ID: <20230906090819.226410-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906090819.226410-1-mauro.chehab@linux.intel.com>
References: <20230906090819.226410-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v2 1/5] test_list.py: add support for reading
 testlist regular expressions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

If defined, use testlist and blocklist files to update the
fields that use it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 75 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 4cd976c8d4e8..a8ea4f973e87 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -260,6 +260,8 @@ class TestList:
         self.igt_build_path = igt_build_path
         self.level_count = 0
         self.field_list = {}
+        self.testlist = {}
+        self.blocklist = {}
         self.title = None
         self.filters = {}
         self.subtest_separator = subtest_separator
@@ -327,6 +329,23 @@ class TestList:
                 if sublevel_count[level - 1] == 1:
                     del item["_properties_"]["level"]
                     del item["_properties_"]["sublevel"]
+
+            # Read testlist files if any
+            if "testlists" in item["_properties_"]:
+                testlist = {}
+                for name in item["_properties_"]["testlists"].keys():
+                    self.read_testlist(testlist, name, cfg_path + item["_properties_"]["testlists"][name])
+
+                item["_properties_"]["testlist"] = testlist
+
+            # Read blocklist files if any
+            if "blocklists" in item["_properties_"]:
+                blocklist = {}
+                for name in item["_properties_"]["blocklists"].keys():
+                    self.read_testlist(blocklist, name, cfg_path + item["_properties_"]["blocklists"][name])
+
+                item["_properties_"]["blocklist"] = blocklist
+
         if "_properties_" in self.props:
             del self.props["_properties_"]
 
@@ -427,6 +446,19 @@ class TestList:
 
             self.__add_field(key, sublevel, hierarchy_level, field[key])
 
+    def read_testlist(self, testlist, name, filename):
+        base = r"^\s*({}[^\s\{}]+)(\S*)\s*(\#.*)?$"
+        regex = re.compile(base.format(self.main_name, self.subtest_separator))
+
+        testlist[name] = []
+        with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
+            for line in fp:
+                match = regex.match(line)
+                if match:
+                    test = match.group(1)
+                    subtest = match.group(2)
+                    testlist[name].append(re.compile(f"{test}{subtest}"))
+
     def __filter_subtest(self, test, subtest, field_not_found_value):
 
         """ Apply filter criteria to subtests """
@@ -444,6 +476,45 @@ class TestList:
         # None of the filtering rules were applied
         return False
 
+    def update_testlist_field(self, subtest_dict):
+        for field in self.props.keys():
+            if "_properties_" not in self.props[field]:
+                continue
+
+            if "testlist" not in self.props[field]["_properties_"]:
+                continue
+
+            testname = subtest_dict["_summary_"]
+
+            value = subtest_dict.get(field)
+            if value:
+                values = set(re.split(",\s*", value))
+            else:
+                values = set()
+
+            for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
+                name = set(re.split(",\s*", names))
+                for regex in regex_array:
+                    if regex.match(testname):
+                        values.update(name)
+                        break
+
+            # If test is at a global blocklist, ignore it
+            set_full_if_empty = True
+            if "blocklist" in self.props[field]["_properties_"]:
+                for names, regex_array in self.props[field]["_properties_"]["testlist"].items():
+                    deleted_names = set(re.split(",\s*", names))
+                    for regex in regex_array:
+                        if regex.match(testname):
+                            if sorted(deleted_names) == sorted(values):
+                                set_full_if_empty = False
+                            values.discard(deleted_names)
+
+            if set_full_if_empty and not values:
+                values = set(["FULL"])
+
+            subtest_dict[field] = ", ".join(sorted(values))
+
     def expand_subtest(self, fname, test_name, test, allow_inherit, with_lines = False, with_subtest_nr = False):
 
         """Expand subtest wildcards providing an array with subtests"""
@@ -476,6 +547,8 @@ class TestList:
 
                     subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
 
+                self.update_testlist_field(subtest_dict)
+
                 if with_lines:
                     subtest_dict["line"] = file_ln
 
@@ -549,6 +622,8 @@ class TestList:
 
                     subtest_dict[field] = sub_field
 
+                self.update_testlist_field(subtest_dict)
+
                 if with_lines:
                     subtest_dict["line"] = file_ln
 
-- 
2.41.0
