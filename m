Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB61C10E621
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 69196580BEE
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6I-0044UA-0j
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:54 +0200
Message-Id: <20230713075054.970457-15-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 14/14] scripts/test_list.py: better
 handle internal fields
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

Be more consistent when dealing with internal fields:
- use _foo_ notation for them;
- skip them using a list instead of hardcoding values.

This should help maintaining this file, if we need to add
more internal fields.

PS.: I opted to use a list for the internal fields, even
checking if an element there takes O(n), as the number of
internal fields is very small. We could instead use a set(),
which is O(1) at the average case, but, as the number of
elements is really small, it won't bring any real benefit.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 72 ++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 8c45a8f2aaeb..50724435b7c5 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -265,6 +265,8 @@ class TestList:
         self.subtest_separator = subtest_separator
         self.main_name = main_name
 
+        self.internal_fields =  [ '_summary_', '_arg_', '_subtest_line_' ]
+
         # Exclusive or: either one is needed
         if bool(config_fname) == bool(config_dict):
             sys.exit("Error: either config filename or config dict shall be used")
@@ -456,7 +458,7 @@ class TestList:
                 continue
 
             num_vars = summary.count('%')
-            file_ln = self.doc[test]["subtest_line"][subtest]
+            file_ln = self.doc[test]["_subtest_line_"][subtest]
 
             # Handle trivial case: no wildcards
             if num_vars == 0:
@@ -465,7 +467,7 @@ class TestList:
                 subtest_dict["_summary_"] = summary
 
                 for k in sorted(self.doc[test]["subtest"][subtest].keys()):
-                    if k in [ '_summary_', 'arg', 'subtest_line' ]:
+                    if k in self.internal_fields:
                         continue
 
                     if not allow_inherit:
@@ -488,14 +490,14 @@ class TestList:
 
             # Convert subtest arguments into an array
             arg_array = {}
-            arg_ref = self.doc[test]["subtest"][subtest]["arg"]
+            arg_ref = self.doc[test]["subtest"][subtest]["_arg_"]
 
-            for arg_k in self.doc[test]["arg"][arg_ref].keys():
+            for arg_k in self.doc[test]["_arg_"][arg_ref].keys():
                 arg_array[arg_k] = []
                 if int(arg_k) > num_vars:
                     continue
 
-                for arg_el in sorted(self.doc[test]["arg"][arg_ref][arg_k].keys()):
+                for arg_el in sorted(self.doc[test]["_arg_"][arg_ref][arg_k].keys()):
                     arg_array[arg_k].append(arg_el)
 
             size = len(arg_array)
@@ -520,9 +522,9 @@ class TestList:
                     arg_val = arg_array[j][pos[j]]
                     args[j] = arg_val
 
-                    if arg_val in self.doc[test]["arg"][arg_ref][j]:
-                        arg_map[j] = self.doc[test]["arg"][arg_ref][j][arg_val]
-                        if re.match(r"\<.*\>", self.doc[test]["arg"][arg_ref][j][arg_val]):
+                    if arg_val in self.doc[test]["_arg_"][arg_ref][j]:
+                        arg_map[j] = self.doc[test]["_arg_"][arg_ref][j][arg_val]
+                        if re.match(r"\<.*\>", self.doc[test]["_arg_"][arg_ref][j][arg_val]):
                             args[j] = "<" + arg_val + ">"
                     else:
                         arg_map[j] = arg_val
@@ -534,7 +536,7 @@ class TestList:
                 subtest_dict["_summary_"] = arg_summary
 
                 for field in sorted(self.doc[test]["subtest"][subtest].keys()):
-                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
+                    if field in self.internal_fields:
                         continue
 
                     sub_field = self.doc[test]["subtest"][subtest][field]
@@ -587,9 +589,7 @@ class TestList:
                 test_dict[name] = {}
 
                 for field in self.doc[test]:
-                    if field == "subtest":
-                        continue
-                    if field == "arg":
+                    if field in self.internal_fields:
                         continue
 
                     test_dict[name][field] = self.doc[test][field]
@@ -606,7 +606,7 @@ class TestList:
 
                 dic[summary] = {}
                 for field in sorted(subtest.keys()):
-                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
+                    if field in self.internal_fields:
                         continue
                     dic[summary][field] = subtest[field]
 
@@ -651,11 +651,7 @@ class TestList:
             for field in sorted(self.doc[test].keys()):
                 if field == "subtest":
                     continue
-                if field == "arg":
-                    continue
-                if field == "_summary_":
-                    continue
-                if field == "subtest_line":
+                if field in self.internal_fields:
                     continue
 
                 out += f":{field}: {self.doc[test][field]}\n"
@@ -666,7 +662,7 @@ class TestList:
                 out += len(subtest["_summary_"]) * '=' + "\n\n"
 
                 for field in sorted(subtest.keys()):
-                    if field in [ '_summary_', 'arg', 'subtest_line' ]:
+                    if field in self.internal_fields:
                         continue
 
                     out += f":{field}:" + subtest[field] + "\n"
@@ -1081,11 +1077,11 @@ class TestList:
                         handle_section = 'test'
 
                         self.doc[current_test] = {}
-                        self.doc[current_test]["arg"] = {}
+                        self.doc[current_test]["_arg_"] = {}
                         self.doc[current_test]["_summary_"] = match.group(1)
                         self.doc[current_test]["File"] = fname
                         self.doc[current_test]["subtest"] = {}
-                        self.doc[current_test]["subtest_line"] = {}
+                        self.doc[current_test]["_subtest_line_"] = {}
 
                         if implemented_class:
                             self.doc[current_test]["Class"] = implemented_class
@@ -1106,9 +1102,7 @@ class TestList:
                     # subtests inherit properties from the tests
                     self.doc[current_test]["subtest"][current_subtest] = {}
                     for field in self.doc[current_test].keys():
-                        if field == "arg":
-                            continue
-                        if field == "summary":
+                        if field in self.internal_fields:
                             continue
                         if field == "File":
                             continue
@@ -1122,14 +1116,14 @@ class TestList:
 
                     self.doc[current_test]["subtest"][current_subtest]["_summary_"] = match.group(1)
                     self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
-                    self.doc[current_test]["subtest_line"][current_subtest] = file_ln
+                    self.doc[current_test]["_subtest_line_"][current_subtest] = file_ln
 
                     if not arg_ref:
                         arg_ref = arg_number
                         arg_number += 1
-                        self.doc[current_test]["arg"][arg_ref] = {}
+                        self.doc[current_test]["_arg_"][arg_ref] = {}
 
-                    self.doc[current_test]["subtest"][current_subtest]["arg"] = arg_ref
+                    self.doc[current_test]["subtest"][current_subtest]["_arg_"] = arg_ref
 
                     continue
 
@@ -1159,14 +1153,14 @@ class TestList:
                         sys.exit(f"{fname}:{file_ln + 1}: arguments should be defined after one or more subtests, at the same comment")
 
                     cur_arg = int(match.group(1)) - 1
-                    if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
-                        self.doc[current_test]["arg"][arg_ref][cur_arg] = {}
+                    if cur_arg not in self.doc[current_test]["_arg_"][arg_ref]:
+                        self.doc[current_test]["_arg_"][arg_ref][cur_arg] = {}
 
                     cur_arg_element = match.group(2)
 
                     if match.group(2):
                         # Should be used only for numeric values
-                        self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = "<" + match.group(2) + ">"
+                        self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] = "<" + match.group(2) + ">"
 
                     continue
 
@@ -1178,7 +1172,7 @@ class TestList:
                             sys.exit(f"{fname}:{file_ln + 1}: arguments should be defined after one or more subtests, at the same comment")
 
                         cur_arg_element = match.group(1)
-                        self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(2)
+                        self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] = match.group(2)
 
                     else:
                         print(f"{fname}:{file_ln + 1}: Warning: invalid argument: @%s: %s" %
@@ -1191,14 +1185,14 @@ class TestList:
                 if match:
                     cur_arg = int(match.group(1)) - 1
 
-                    if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
-                        self.doc[current_test]["arg"][arg_ref][cur_arg] = {}
+                    if cur_arg not in self.doc[current_test]["_arg_"][arg_ref]:
+                        self.doc[current_test]["_arg_"][arg_ref][cur_arg] = {}
 
                     values = match.group(2).replace(" ", "").split(",")
                     for split_val in values:
                         if split_val == "":
                             continue
-                        self.doc[current_test]["arg"][arg_ref][cur_arg][split_val] = split_val
+                        self.doc[current_test]["_arg_"][arg_ref][cur_arg][split_val] = split_val
 
                     continue
 
@@ -1222,13 +1216,13 @@ class TestList:
                     if match:
                         match_val = match.group(1)
 
-                        match = re.match(r'^(\<.*)\>$',self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element])
+                        match = re.match(r'^(\<.*)\>$',self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element])
                         if match:
-                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(1) + ' ' + match_val + ">"
+                            self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] = match.group(1) + ' ' + match_val + ">"
                         else:
-                            if self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] != '':
-                                self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += ' '
-                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += match_val
+                            if self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] != '':
+                                self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] += ' '
+                            self.doc[current_test]["_arg_"][arg_ref][cur_arg][cur_arg_element] += match_val
                     continue
 
                 file_line.rstrip(r"\n")
-- 
2.40.1
