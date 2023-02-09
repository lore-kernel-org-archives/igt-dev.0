Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8F810EA59
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 11:57:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.4.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EB5D6580931
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 03:57:18 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pQ5YD-00Db5G-0F
 for igt-dev@lists.freedesktop.org; Thu, 09 Feb 2023 12:57:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 12:57:12 +0100
Message-Id: <20230209115712.3240666-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230209115712.3240666-1-mauro.chehab@linux.intel.com>
References: <20230209115712.3240666-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/1] scripts:igt-doc.py: add a parser to
 document tests inlined
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

Tests need to be documentation, as otherwise its goal will be
lost with time. Keeping documentation out of the sources is also
not such a good idea, as they tend to bitrot.

So, add a script to allow keeping the documentation inlined, and
add tools to verify if the documentation has gaps.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 487 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 487 insertions(+)
 create mode 100755 scripts/igt_doc.py

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
new file mode 100755
index 000000000000..292d99c1ef92
--- /dev/null
+++ b/scripts/igt_doc.py
@@ -0,0 +1,487 @@
+#!/usr/bin/env python3
+# pylint: disable=C0301,R0914,R0912,R0915
+# SPDX-License-Identifier: GPL-2.0
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
+import fileinput
+import re
+import subprocess
+import sys
+
+IGT_BUILD_PATH = 'build/'
+IGT_RUNNER = '/runner/igt_runner'
+
+# Fields that mat be inside TEST and SUBTEST macros
+fields = [
+    'Category',       # Hardware building block / Software building block / ...
+    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
+    'Coverered functionality', # basic test / ...
+    'Test type',      # functionality test / pereformance / stress
+    'Run type',       # BAT / workarouds / stress / developer-specific / ...
+    'Issues?',        # Bug tracker issue(s)
+    'Platforms?',     # all / DG1 / DG2 / TGL / MTL / PVC / ATS-M / ...
+    'Platform requirements?',  # Any other specific platform requirements
+    'Depends on',     # some other IGT test, like igt@test@subtes
+    'Requirements?',  # other non-platform requirements
+    'Description']    # Description of the test
+
+#
+# Expand subtests
+#
+
+class TestList:
+    """Parse and handle test lists with test/subtest documentation."""
+    def __init__(self):
+        self.doc = {}
+        self.test_number = 0
+        self.min_test_prefix = ''
+
+    def expand_subtest(self, fname, test_name, test):
+        """Expand subtest wildcards providing an array with subtests"""
+        subtest_array = []
+
+        for subtest in self.doc[test]["subtest"].keys():
+            summary = test_name + '@' + self.doc[test]["subtest"][subtest]["Summary"]
+
+            if not summary:
+                continue
+
+            num_vars = summary.count('%')
+
+            if num_vars == 0:
+                subtest_dict = {}
+
+                # Trivial case: no need to expand anything
+                subtest_dict["Summary"] = summary
+
+                for k in sorted(self.doc[test]["subtest"][subtest].keys()):
+                    if k == 'Summary':
+                        continue
+                    if k == 'arg':
+                        continue
+
+                    if self.doc[test]["subtest"][subtest][k] == self.doc[test][k]:
+                        continue
+
+                    subtest_dict[k] = self.doc[test]["subtest"][subtest][k]
+                    subtest_array.append(subtest_dict)
+
+                continue
+
+            # Handle summaries with wildcards
+
+            # Convert arguments into an array
+            arg_array = {}
+            arg_ref = self.doc[test]["subtest"][subtest]["arg"]
+
+            for arg_k in self.doc[test]["arg"][arg_ref].keys():
+                arg_array[arg_k] = []
+                if int(arg_k) > num_vars:
+                    continue
+
+                for arg_el in sorted(self.doc[test]["arg"][arg_ref][arg_k].keys()):
+                    arg_array[arg_k].append(arg_el)
+
+            size = len(arg_array)
+
+            if size < num_vars:
+                sys.exit(f"{fname}:subtest {summary} needs {num_vars} arguments but only {size} are defined.")
+
+            for j in range(0, num_vars):
+                if arg_array[j] is None:
+                    sys.exit(f"{fname}:subtest{summary} needs arg[{j}], but this is not defined.")
+
+
+            # convert numeric wildcards to string ones
+            summary = re.sub(r'%(d|ld|lld|i|u|lu|llu)','%s', summary)
+
+            pos = [ 0 ] * num_vars
+            args = [ 0 ] * num_vars
+            arg_map = [ 0 ] * num_vars
+
+            while 1:
+                for j in range(0, num_vars):
+                    arg_val = arg_array[j][pos[j]]
+                    args[j] = arg_val
+
+                    if arg_val in self.doc[test]["arg"][arg_ref][j]:
+                        arg_map[j] = self.doc[test]["arg"][arg_ref][j][arg_val]
+                        if re.match(r"\<.*\>", self.doc[test]["arg"][arg_ref][j][arg_val]):
+                            args[j] = "<" + arg_val + ">"
+                    else:
+                        arg_map[j] = arg_val
+
+                arg_summary = summary % tuple(args)
+
+                # Store the element
+                subtest_dict = {}
+                subtest_dict["Summary"] = arg_summary
+
+                for field in sorted(self.doc[test]["subtest"][subtest].keys()):
+                    if field == 'Summary':
+                        continue
+                    if field == 'arg':
+                        continue
+
+                    sub_field = self.doc[test]["subtest"][subtest][field]
+                    sub_field = re.sub(r"%?\barg\[(\d+)\]", lambda m: arg_map[int(m.group(1)) - 1], sub_field) # pylint: disable=W0640
+                    if sub_field == self.doc[test][field]:
+                        continue
+
+                    subtest_dict[field] = sub_field
+
+                subtest_array.append(subtest_dict)
+
+                # Increment variable inside the array
+                arr_pos = 0
+                while pos[arr_pos] + 1 >= len(arg_array[arr_pos]):
+                    pos[arr_pos] = 0
+                    arr_pos += 1
+                    if arr_pos >= num_vars:
+                        break
+
+                if arr_pos >= num_vars:
+                    break
+
+                pos[arr_pos] += 1
+
+        return subtest_array
+
+    #
+    # ReST print routines
+    #
+
+    def print_test(self):
+        """Print tests and subtests"""
+        for test in sorted(self.doc.keys()):
+            fname = self.doc[test]["File"]
+
+            name = re.sub(r'.*tests/', '', fname)
+            name = re.sub(r'\.[ch]', '', name)
+            name = "igt@" + name
+
+            print(len(name) * '=')
+            print(name)
+            print(len(name) * '=')
+            print()
+
+            for field in sorted(self.doc[test].keys()):
+                if field == "subtest":
+                    continue
+                if field == "arg":
+                    continue
+
+                print(f":{field}: {self.doc[test][field]}")
+
+            subtest_array = self.expand_subtest(fname, name, test)
+
+            for subtest in subtest_array:
+                print()
+                print(subtest["Summary"])
+                print(len(subtest["Summary"]) * '=')
+                print("")
+
+                for field in sorted(subtest.keys()):
+                    if field == 'Summary':
+                        continue
+                    if field == 'arg':
+                        continue
+
+                    print(f":{field}:", subtest[field])
+
+                print()
+
+            print()
+            print()
+
+    #
+    # Get a list of subtests
+    #
+
+    def get_subtests(self):
+        """Return an array with all subtests"""
+        subtests = []
+
+        for test in sorted(self.doc.keys()):
+            fname = self.doc[test]["File"]
+
+            test_name = re.sub(r'.*tests/', '', fname)
+            test_name = re.sub(r'\.[ch]', '', test_name)
+            test_name = "igt@" + test_name
+
+            subtest_array = self.expand_subtest(fname, test_name, test)
+
+            for subtest in subtest_array:
+                subtests.append(subtest["Summary"])
+
+        return subtests
+
+    #
+    # Compare testlists from IGT with the documentation from source code
+    #
+    def check_tests(self):
+        """Compare documented subtests with the IGT test list"""
+        doc_subtests = sorted(self.get_subtests())
+
+        for i in range(0, len(doc_subtests)): # pylint: disable=C0200
+            doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
+
+        # Get a list of tests from
+        result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",  # pylint: disable=W1510
+                                "-L", "-t",  self.min_test_prefix,
+                                f"{IGT_BUILD_PATH}/tests"],
+                                capture_output = True, text = True)
+        if result.returncode:
+            print( result.stdout)
+            print("Error:", result.stderr)
+            sys.exit(result.returncode)
+
+        run_subtests = sorted(result.stdout.splitlines())
+
+        # Compare arrays
+
+        run_missing = []
+        doc_uneeded = []
+
+        for doc_test in doc_subtests:
+            found = False
+            for run_test in run_subtests:
+                if re.match(r'^' + doc_test + r'$', run_test):
+                    found = True
+                    break
+            if not found:
+                doc_uneeded.append(doc_test)
+
+        for run_test in run_subtests:
+            found = False
+            for doc_test in doc_subtests:
+                if re.match(r'^' + doc_test + r'$', run_test):
+                    found = True
+                    break
+            if not found:
+                run_missing.append(run_test)
+
+        if doc_uneeded:
+            print("Unused documentation")
+            for test_name in doc_uneeded:
+                print(test_name)
+
+        if run_missing:
+            if doc_uneeded:
+                print()
+            print("Missing documentation")
+            for test_name in run_missing:
+                print(test_name)
+
+    #
+    # Parse a filename, adding documentation inside the doc dictionary
+    #
+
+    def add_file_documentation(self, fname):
+        """Adds the contents of test/subtest documentation form a file"""
+        current_test = None
+        current_subtest = None
+
+        handle_section = ''
+        current_field = ''
+        arg_number = 1
+        cur_arg = -1
+        cur_arg_element = 0
+
+        prefix = re.sub(r'.*tests/', '', filename)
+        prefix = r'igt\@' + re.sub(r'(.*/).*', r'\1', prefix)
+
+        if self.min_test_prefix == '':
+            self.min_test_prefix = prefix
+        elif len(prefix) < len(self.min_test_prefix):
+            self.min_test_prefix = prefix
+
+        with open(fname, 'r', encoding='utf8') as handle:
+            arg_ref = None
+            current_test = ''
+            subtest_number = 0
+
+            for file_line in handle:
+                if re.match(r'^\s*\*$', file_line):
+                    continue
+
+                if re.match(r'^\s*\*/$', file_line):
+                    handle_section = ''
+                    current_subtest = None
+                    arg_ref = None
+                    cur_arg = -1
+
+                    continue
+
+                if re.match(r'^\s*/\*\*$', file_line):
+                    handle_section = '1'
+                    continue
+
+                if not handle_section:
+                    continue
+
+                file_line = re.sub(r'^\s*\*\s*', '', file_line)
+
+                # Handle only known sections
+                if handle_section == '1':
+                    current_field = ''
+
+                    # Check if it is a new TEST section
+                    if (match := re.match(r'^TEST:\s*(.*)', file_line)):
+                        current_test = self.test_number
+                        self.test_number += 1
+
+                        handle_section = 'test'
+
+                        self.doc[current_test] = {}
+                        self.doc[current_test]["arg"] = {}
+                        self.doc[current_test]["Summary"] = match.group(1)
+                        self.doc[current_test]["File"] = fname
+                        self.doc[current_test]["subtest"] = {}
+                        current_subtest = None
+
+                        continue
+
+                # Check if it is a new SUBTEST section
+                if (match := re.match(r'^SUBTESTS?:\s*(.*)', file_line)):
+                    current_subtest = subtest_number
+                    subtest_number += 1
+
+                    current_field = ''
+                    handle_section = 'subtest'
+
+                    self.doc[current_test]["subtest"][current_subtest] = {}
+
+                    self.doc[current_test]["subtest"][current_subtest]["Summary"] = match.group(1)
+                    self.doc[current_test]["subtest"][current_subtest]["Description"] = ''
+
+                    if not arg_ref:
+                        arg_ref = arg_number
+                        arg_number += 1
+                        self.doc[current_test]["arg"][arg_ref] = {}
+
+                    self.doc[current_test]["subtest"][current_subtest]["arg"] = arg_ref
+
+                    continue
+
+                # It is a known section. Parse its contents
+                if (match := re.match(field_re, file_line)):
+                    current_field = match.group(1).lower().capitalize()
+                    match_val = match.group(2)
+
+                    if handle_section == 'test':
+                        self.doc[current_test][current_field] = match_val
+                    else:
+                        self.doc[current_test]["subtest"][current_subtest][current_field] = match_val
+
+                    cur_arg = -1
+
+                    continue
+
+                # Use hashes for arguments to avoid duplication
+                if (match := re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)):
+                    current_field = ''
+                    if arg_ref is None:
+                        sys.exit(f"{fname}:{fileinput.filelineno()}: arguments should be defined after one or more subtests, at the same comment")
+
+                    cur_arg = int(match.group(1)) - 1
+                    if cur_arg not in self.doc[current_test]["arg"][arg_ref]:
+                        self.doc[current_test]["arg"][arg_ref][cur_arg] = {}
+
+                    cur_arg_element = match.group(2)
+
+                    if match.group(2):
+                        # Should be used only for numeric values
+                        self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = "<" + match.group(2) + ">"
+
+                    continue
+
+                if (match := re.match(r'\@(\S+):\s*(.*)', file_line)):
+                    if cur_arg >= 0:
+                        current_field = ''
+                        if arg_ref is None:
+                            sys.exit(f"{fname}:{fileinput.filelineno()}: arguments should be defined after one or more subtests, at the same comment")
+
+                        cur_arg_element = match.group(1)
+                        self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(2)
+
+                    else:
+                        print(f"{fname}: Warning: invalid argument: @%s: %s" %
+                            (match.group(1), match.group(2)))
+
+                    continue
+
+                # Handle multi-line field contents
+                if current_field:
+                    if (match := re.match(r'\s*(.*)', file_line)):
+                        if handle_section == 'test':
+                            self.doc[current_test][current_field] += " " + \
+                                match.group(1)
+                        else:
+                            self.doc[current_test]["subtest"][current_subtest][current_field] += " " + \
+                                match.group(1)
+
+                    continue
+
+                # Handle multi-line argument contents
+                if cur_arg >= 0 and arg_ref is not None:
+                    if (match := re.match(r'\s*\*?\s*(.*)', file_line)):
+                        match_val = match.group(1)
+
+                        match = re.match(r'^(\<.*)\>$',self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element])
+                        if match:
+                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(1) + ' ' + match_val + ">"
+                        else:
+                            self.doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] += ' ' + match_val
+
+                    continue
+
+#
+# Main: parse the files and fill %doc struct
+#
+
+parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
+                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
+                                 epilog = 'If no action specified, assume --rest.')
+parser.add_argument("--rest", action="store_true",
+                    help="Generate documentation from the source files, in ReST file format.")
+parser.add_argument("--show-subtests", action="store_true",
+                    help="Shows the name of the documented subtests in alphabetical order.")
+parser.add_argument("--check-testlist", action="store_true",
+                    help="Compare documentation against IGT runner testlist.")
+parser.add_argument("--igt-build-path",
+                    help="Path where the IGT runner is sitting. Used by --check-testlist.",
+                    default=IGT_BUILD_PATH)
+parser.add_argument('--files', nargs='+', required=True,
+                    help="File name(s) to be processed")
+
+parse_args = parser.parse_args()
+
+field_re = re.compile(r"(" + '|'.join(fields) + r'):\s*(.*)', re.I)
+
+tests = TestList()
+
+for filename in parse_args.files:
+    tests.add_file_documentation(filename)
+
+RUN = 0
+if parse_args.show_subtests:
+    RUN = 1
+
+    for sub in tests.get_subtests():
+        print (sub)
+
+if parse_args.check_testlist:
+    RUN = 1
+    tests.check_tests()
+
+if not RUN or parse_args.rest:
+    tests.print_test()
-- 
2.39.0
