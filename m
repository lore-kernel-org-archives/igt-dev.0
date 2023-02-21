Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90910E121
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 95998580697
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wwc-2H
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:36 +0100
Message-Id: <20230221083541.1079643-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] scripts/igt_doc.py: add JSON file output
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

At least for debugging purposes, it is interesting to see how the
script is parsing the input files and expanding wildcards on a more
condensed way. So, add support to output the dictionary contents
into a json file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index c8bd4054f638..d21f87dc7183 100644
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -11,6 +11,7 @@
 """Maintain test plan and test implementation documentation on IGT."""
 
 import argparse
+import json
 import re
 import subprocess
 import sys
@@ -231,6 +232,42 @@ class TestList:
 
         return subtest_array
 
+    def expand_dictionary(self):
+
+        """ prepares a dictonary with subtest arguments expanded """
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
+            test_dict[name] = {}
+
+            for field in self.doc[test]:
+                if field == "subtest":
+                    continue
+                if field == "arg":
+                    continue
+
+                test_dict[name][field] = self.doc[test][field]
+
+            subtest_array = self.expand_subtest(fname, name, test)
+            for subtest in subtest_array:
+                summary = subtest["Summary"]
+                test_dict[name][summary] = {}
+                for field in sorted(subtest.keys()):
+                    if field == 'Summary':
+                        continue
+                    if field == 'arg':
+                        continue
+                    test_dict[name][summary][field] = subtest[field]
+
+        return test_dict
+
     #
     # Output methods
     #
@@ -280,6 +317,14 @@ class TestList:
             print()
             print()
 
+    def print_json(self, out_fname):
+
+        """Adds the contents of test/subtest documentation form a file"""
+        test_dict = self.expand_dictionary()
+
+        with open(out_fname, "w", encoding='utf8') as write_file:
+            json.dump(test_dict, write_file, indent=4)
+
     #
     # Subtest list methods
     #
@@ -541,6 +586,8 @@ parser = argparse.ArgumentParser(description = "Print formatted kernel documenta
                                  epilog = 'If no action specified, assume --rest.')
 parser.add_argument("--rest", action="store_true",
                     help="Generate documentation from the source files, in ReST file format.")
+parser.add_argument("--to-json",
+                    help="Output test documentation in JSON format as TO_JSON file")
 parser.add_argument("--show-subtests", action="store_true",
                     help="Shows the name of the documented subtests in alphabetical order.")
 parser.add_argument("--check-testlist", action="store_true",
@@ -570,5 +617,9 @@ if parse_args.check_testlist:
     RUN = 1
     tests.check_tests()
 
+if parse_args.to_json:
+    RUN = 1
+    tests.print_json(parse_args.to_json)
+
 if not RUN or parse_args.rest:
     tests.print_test()
-- 
2.39.2
