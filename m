Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87710E753
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:41:41 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9631758047E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 04:41:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pc322-002j4O-2D
 for igt-dev@lists.freedesktop.org; Tue, 14 Mar 2023 12:41:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 12:41:27 +0100
Message-Id: <20230314114127.649447-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20230314114127.649447-1-mauro.chehab@linux.intel.com>
References: <20230314114127.649447-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] scripts/igt_doc.py: re-introduce it by
 calling test_list.py
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

Now that the class on a separate file, move the argument parser
to igt_doc.py.

Acked-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py   | 80 ++++++++++++++++++++++++++++++++++++++++++++
 scripts/test_list.py | 67 -------------------------------------
 2 files changed, 80 insertions(+), 67 deletions(-)
 create mode 100755 scripts/igt_doc.py

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
new file mode 100755
index 000000000000..547cb81bce02
--- /dev/null
+++ b/scripts/igt_doc.py
@@ -0,0 +1,80 @@
+#!/usr/bin/env python3
+# pylint: disable=C0301
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+## Copyright (C) 2023    Intel Corporation                 ##
+## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
+##                                                         ##
+## Allow keeping inlined test documentation and validate   ##
+## if the documentation is kept updated.                   ##
+
+"""Maintain test plan and test implementation documentation on IGT."""
+
+import argparse
+
+from test_list import TestList
+
+IGT_BUILD_PATH = 'build'
+IGT_RUNNER = 'runner/igt_runner'
+
+parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
+                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
+                                 epilog = 'If no action specified, assume --rest.')
+parser.add_argument("--config", required = True,
+                    help="JSON file describing the test plan template")
+parser.add_argument("--rest",
+                    help="Output documentation from the source files in REST file.")
+parser.add_argument("--per-test", action="store_true",
+                    help="Modifies ReST output to print subtests per test.")
+parser.add_argument("--to-json",
+                    help="Output test documentation in JSON format as TO_JSON file")
+parser.add_argument("--show-subtests", action="store_true",
+                    help="Shows the name of the documented subtests in alphabetical order.")
+parser.add_argument("--sort-field",
+                    help="modify --show-subtests to sort output based on SORT_FIELD value")
+parser.add_argument("--filter-field",
+                    help="modify --show-subtests to filter output based a regex given by FILTER_FIELD=~'regex'")
+parser.add_argument("--check-testlist", action="store_true",
+                    help="Compare documentation against IGT runner testlist.")
+parser.add_argument("--include-plan", action="store_true",
+                    help="Include test plans, if any.")
+parser.add_argument("--igt-build-path",
+                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
+                    default=IGT_BUILD_PATH)
+parser.add_argument("--gen-testlist",
+                    help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
+parser.add_argument("--igt-runner",
+                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
+                    default=IGT_RUNNER)
+parser.add_argument('--files', nargs='+',
+                    help="File name(s) to be processed")
+
+parse_args = parser.parse_args()
+
+tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
+                 parse_args.igt_build_path, parse_args.igt_runner)
+
+RUN = 0
+if parse_args.show_subtests:
+    RUN = 1
+    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
+
+if parse_args.check_testlist:
+    RUN = 1
+    tests.check_tests()
+
+if parse_args.gen_testlist:
+    RUN = 1
+    if not parse_args.sort_field:
+        sys.exit("Need a field to split the testlists")
+    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field, parse_args.filter_field)
+
+if parse_args.to_json:
+    RUN = 1
+    tests.print_json(parse_args.to_json)
+
+if not RUN or parse_args.rest:
+    if parse_args.per_test:
+        tests.print_rest_flat(parse_args.rest)
+    else:
+        tests.print_nested_rest(parse_args.rest)
diff --git a/scripts/test_list.py b/scripts/test_list.py
index 8eed875b0681..73c1794caec5 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -10,7 +10,6 @@
 
 """Maintain test plan and test implementation documentation on IGT."""
 
-import argparse
 import glob
 import json
 import os
@@ -22,9 +21,6 @@ MIN_PYTHON = (3, 6)
 if sys.version_info < MIN_PYTHON:
     sys.exit("Python %s.%s or later is required.\n" % MIN_PYTHON) # pylint: disable=C0209
 
-IGT_BUILD_PATH = 'build'
-IGT_RUNNER = 'runner/igt_runner'
-
 #
 # ancillary functions to sort dictionary hierarchy
 #
@@ -1071,66 +1067,3 @@ class TestList:
                 for sub in test_subtests[test]:
                     handler.write (f"{sub}\n")
                 print(f"{fname} created.")
-
-#
-# Main
-#
-
-parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
-                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
-                                 epilog = 'If no action specified, assume --rest.')
-parser.add_argument("--config", required = True,
-                    help="JSON file describing the test plan template")
-parser.add_argument("--rest",
-                    help="Output documentation from the source files in REST file.")
-parser.add_argument("--per-test", action="store_true",
-                    help="Modifies ReST output to print subtests per test.")
-parser.add_argument("--to-json",
-                    help="Output test documentation in JSON format as TO_JSON file")
-parser.add_argument("--show-subtests", action="store_true",
-                    help="Shows the name of the documented subtests in alphabetical order.")
-parser.add_argument("--sort-field",
-                    help="modify --show-subtests to sort output based on SORT_FIELD value")
-parser.add_argument("--filter-field",
-                    help="modify --show-subtests to filter output based a regex given by FILTER_FIELD=~'regex'")
-parser.add_argument("--check-testlist", action="store_true",
-                    help="Compare documentation against IGT runner testlist.")
-parser.add_argument("--include-plan", action="store_true",
-                    help="Include test plans, if any.")
-parser.add_argument("--igt-build-path",
-                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
-                    default=IGT_BUILD_PATH)
-parser.add_argument("--gen-testlist",
-                    help="Generate documentation at the GEN_TESTLIST directory, using SORT_FIELD to split the tests. Requires --sort-field.")
-parser.add_argument('--files', nargs='+',
-                    help="File name(s) to be processed")
-
-parse_args = parser.parse_args()
-
-tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
-                 IGT_BUILD_PATH, IGT_RUNNER)
-
-RUN = 0
-if parse_args.show_subtests:
-    RUN = 1
-    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
-
-if parse_args.check_testlist:
-    RUN = 1
-    tests.check_tests()
-
-if parse_args.gen_testlist:
-    RUN = 1
-    if not parse_args.sort_field:
-        sys.exit("Need a field to split the testlists")
-    tests.gen_testlist(parse_args.gen_testlist, parse_args.sort_field, parse_args.filter_field)
-
-if parse_args.to_json:
-    RUN = 1
-    tests.print_json(parse_args.to_json)
-
-if not RUN or parse_args.rest:
-    if parse_args.per_test:
-        tests.print_rest_flat(parse_args.rest)
-    else:
-        tests.print_nested_rest(parse_args.rest)
-- 
2.39.2
