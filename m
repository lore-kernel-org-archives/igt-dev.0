Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510210E301
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A13A0580DAB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wwo-2U
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:40 +0100
Message-Id: <20230221083541.1079643-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] scripts/igt_doc.py: improve
 --show-subtests logic
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

Add command line parameters to improve --show-subtests:
1) to sort results of --show-subtest based on the contents of a field.
   This is useful, for instance, to check if all subtests have
   proper values for a given field.
2) to filter for an specific field value. This is interesting to be
   able to compare testlists with the expected documented test list.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 64 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 12a9ebfc0348..9280be743524 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0902,R0914,R0912,R0915
+# pylint: disable=C0301,R0902,R0914,R0912,R0915,R1702,C0302
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -632,11 +632,27 @@ class TestList:
     # Subtest list methods
     #
 
-    def get_subtests(self):
+    def get_subtests(self, sort_field = None, filter_field_expr = None):
 
         """Return an array with all subtests"""
 
-        subtests = []
+        subtests = {}
+        subtests[""] = []
+
+        if sort_field:
+            if sort_field.lower() not in self.field_list:
+                sys.exit(f"Field '{sort_field}' is not defined")
+            sort_field = self.field_list[sort_field.lower()]
+
+        if filter_field_expr:
+            if not (match := re.match(r"(.*)=~\s*(.*)", filter_field_expr)):
+                sys.exit(f"Filter field {filter_field_expr} is not at <field> =~ <regex> syntax")
+
+            field = match.group(1).strip().lower()
+            if field not in self.field_list:
+                sys.exit(f"Field '{field}' is not defined")
+            filter_field = self.field_list[field]
+            regex = re.compile("{0}".format(match.group(2).strip()), re.I) # pylint: disable=C0209
 
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
@@ -645,10 +661,26 @@ class TestList:
             test_name = re.sub(r'\.[ch]', '', test_name)
             test_name = "igt@" + test_name
 
-            subtest_array = self.expand_subtest(fname, test_name, test)
+            subtest_array = self.expand_subtest(fname, test_name, test, True)
 
             for subtest in subtest_array:
-                subtests.append(subtest["Summary"])
+                if filter_field_expr:
+                    if filter_field not in subtest:
+                        continue
+                    if not re.match(regex, subtest[filter_field]):
+                        continue
+
+                if sort_field:
+                    if sort_field in subtest:
+                        if subtest[sort_field] not in subtests:
+                            subtests[subtest[sort_field]] = []
+
+                        subtests[subtest[sort_field]].append(subtest["Summary"])
+                    else:
+                        subtests[""].append(subtest["Summary"])
+
+                else:
+                    subtests[""].append(subtest["Summary"])
 
         return subtests
 
@@ -659,7 +691,7 @@ class TestList:
 
         """Compare documented subtests with the IGT test list"""
 
-        doc_subtests = sorted(self.get_subtests())
+        doc_subtests = sorted(self.get_subtests()[""])
 
         for i in range(0, len(doc_subtests)): # pylint: disable=C0200
             doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
@@ -930,6 +962,10 @@ parser.add_argument("--to-json",
                     help="Output test documentation in JSON format as TO_JSON file")
 parser.add_argument("--show-subtests", action="store_true",
                     help="Shows the name of the documented subtests in alphabetical order.")
+parser.add_argument("--sort-field",
+                    help="modify --show-tests to sort output based on SORT_FIELD value")
+parser.add_argument("--filter-field",
+                    help="modify --show-tests to filter output based a regex given by FILTER_FIELD=~'regex'")
 parser.add_argument("--check-testlist", action="store_true",
                     help="Compare documentation against IGT runner testlist.")
 parser.add_argument("--igt-build-path",
@@ -945,8 +981,20 @@ tests = TestList(parse_args.config, parse_args.files)
 RUN = 0
 if parse_args.show_subtests:
     RUN = 1
-    for sub in tests.get_subtests():
-        print (sub)
+    if parse_args.sort_field:
+        test_subtests = tests.get_subtests(parse_args.sort_field, parse_args.filter_field)
+        for val_key in sorted(test_subtests.keys()):
+            if not test_subtests[val_key]:
+                continue
+            if val_key == "":
+                print("not defined:")
+            else:
+                print(f"{val_key}:")
+            for sub in test_subtests[val_key]:
+                print (f"  {sub}")
+    else:
+        for sub in tests.get_subtests(parse_args.sort_field, parse_args.filter_field)[""]:
+            print (sub)
 
 if parse_args.check_testlist:
     RUN = 1
-- 
2.39.2
