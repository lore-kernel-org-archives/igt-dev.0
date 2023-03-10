Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C610E0B6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:41:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:08 +0100
Message-Id: <20230310194125.14781-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/19] scripts/igt_doc.py: add JSON file
 output
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
---
 scripts/igt_doc.py | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index c8bd4054f6..d21f87dc71 100644
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
2.34.1
