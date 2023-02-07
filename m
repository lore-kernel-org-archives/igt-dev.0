Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8301A10E10D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 10:10:53 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.3.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7DE4D580D24
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Feb 2023 02:10:37 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pPKvr-00Cg1b-1a
 for igt-dev@lists.freedesktop.org; Tue, 07 Feb 2023 11:10:35 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 11:10:34 +0100
Message-Id: <20230207101034.3021441-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230207101034.3021441-1-mauro.chehab@linux.intel.com>
References: <20230207101034.3021441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/1] scripts:igt-doc.py: add a parser to document
 tests inlined
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
 scripts/igt-doc.py | 516 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 516 insertions(+)
 create mode 100755 scripts/igt-doc.py

diff --git a/scripts/igt-doc.py b/scripts/igt-doc.py
new file mode 100755
index 000000000000..57a729624225
--- /dev/null
+++ b/scripts/igt-doc.py
@@ -0,0 +1,516 @@
+#!/usr/bin/env python3
+# pylint: disable=C0103,C0116,C0114,C0301,R0914,R0912,R0915,R1702,W0603,W0602
+# SPDX-License-Identifier: GPL-2.0
+
+## Copyright (C) 2023    Intel Corporation                 ##
+## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
+##                                                         ##
+## Allow keeping inlined test documentation and validate   ##
+## if the documentation is kept updated.                   ##
+
+import argparse
+import fileinput
+import re
+import subprocess
+import sys
+
+igt_build_path = 'build/'
+igt_runner = '/runner/igt_runner'
+
+# Fields that mat be inside TEST and SUBTEST macros
+fields = [
+    'Category',       # Hardware building block / Software building block / ...
+    'Sub-category',   # waitfence / dmabuf/ sysfs / debugfs / ...
+    'Coverered functionality', # basic test / ...
+    'Test type',      # functionality test / pereformance / stress
+    'Run type',       # BAT / workarouds / developer-specific / ...
+    'Issues?',        # Bug tracker issue(s)
+    'Platforms?',     # all / DG1 / DG2 / TGL / MTL / PVC / ATS-M / ...
+    'Platform requirements?',  # Any other specific platform requirements
+    'Depends on',     # some other IGT test, like igt@test@subtes
+    'Requirements?',  # other non-platform requirements
+    'Description']    # Description of the test
+
+doc = {}
+test_number = 0
+
+#
+# ReST print routines
+#
+
+def print_subtest(fname, test_name, test, subtest):
+    summary = test_name + '@' + doc[test]["subtest"][subtest]["Summary"]
+
+    if not summary:
+        return
+
+    num_vars = summary.count('%')
+
+    if num_vars == 0:
+        print()
+        print(summary)
+        print(len(summary) * '=')
+        print("")
+
+        for k in sorted(doc[test]["subtest"][subtest].keys()):
+            if k == 'Summary':
+                continue
+            if k == 'arg':
+                continue
+
+            if doc[test]["subtest"][subtest][k] == doc[test][k]:
+                continue
+
+            print(f":{k}:", doc[test]["subtest"][subtest][k])
+            print()
+
+            return
+
+    # Convert arguments into an array
+    arg_array = {}
+    arg_ref = doc[test]["subtest"][subtest]["arg"]
+
+    for n in doc[test]["arg"][arg_ref].keys():
+        arg_array[n] = []
+        if int(n) > num_vars:
+            continue
+
+        for el in sorted(doc[test]["arg"][arg_ref][n].keys()):
+            arg_array[n].append(el)
+
+    size = len(arg_array)
+
+    if size < num_vars:
+        sys.exit(f"{fname}:subtest {summary} needs {num_vars} arguments but only {size} are defined.")
+
+
+    for j in range(0, num_vars):
+        if arg_array[j] is None:
+            sys.exit(f"{fname}:subtest{summary} needs arg[{j}], but this is not defined.")
+
+
+    # convert numeric wildcards to string ones
+    summary = re.sub(r'%(d|ld|lld|i|u|lu|llu)','%s', summary)
+
+    pos = [ 0 ] * num_vars
+    args = [ 0 ] * num_vars
+    arg_map = [ 0 ] * num_vars
+
+    while 1:
+        for j in range(0, num_vars):
+            a = arg_array[j][pos[j]]
+            args[j] = a
+
+            if a in doc[test]["arg"][arg_ref][j]:
+                arg_map[j] = doc[test]["arg"][arg_ref][j][a]
+                if re.match(r"\<.*\>", doc[test]["arg"][arg_ref][j][a]):
+                    args[j] = "<" + a + ">"
+            else:
+                arg_map[j] = a
+
+        arg_summary = summary % tuple(args)
+
+        # Output the elements
+        print()
+        print(arg_summary)
+        print('=' * len(arg_summary))
+        print()
+
+        for field in sorted(doc[test]["subtest"][subtest].keys()):
+            if field == 'Summary':
+                continue
+            if field == 'arg':
+                continue
+
+            s = doc[test]["subtest"][subtest][field]
+            s = re.sub(r"%?\barg\[(\d+)\]", lambda m: arg_map[int(m.group(1)) - 1], s)
+            if s == doc[test][field]:
+                continue
+
+            print(f":{field}: %s\n" % s)
+
+        print()
+
+        # Increment variable inside the array
+        p = 0
+        while pos[p] + 1 >= len(arg_array[p]):
+            pos[p] = 0
+            p += 1
+            if p >= num_vars:
+                break
+
+        if p >= num_vars:
+            break
+
+        pos[p] += 1
+
+def print_test():
+    for test in sorted(doc.keys()):
+        fname = doc[test]["File"]
+
+        name = re.sub(r'.*tests/', '', fname)
+        name = re.sub(r'\.[ch]', '', name)
+        name = "igt@" + name
+
+        print(len(name) * '=')
+        print(name)
+        print(len(name) * '=')
+        print()
+
+        for field in sorted(doc[test].keys()):
+            if field == "subtest":
+                continue
+            if field == "arg":
+                continue
+
+            print(f":{field}: {doc[test][field]}")
+
+        for subtest in doc[test]["subtest"].keys():
+            print_subtest(fname, name, test, subtest)
+
+        print()
+        print()
+
+#
+# Get a list of subtests
+#
+
+def get_subtests():
+    subtests = []
+
+    for test in sorted(doc.keys()):
+        fname = doc[test]["File"]
+
+        test_name = re.sub(r'.*tests/', '', fname)
+        test_name = re.sub(r'\.[ch]', '', test_name)
+        test_name = "igt@" + test_name
+
+        for subtest in doc[test]["subtest"].keys():
+            summary = test_name + '@' + doc[test]["subtest"][subtest]["Summary"]
+
+            if not summary:
+                continue
+
+            num_vars = summary.count('%')
+
+            if num_vars == 0:
+                subtests.append(summary)
+            else:
+                # Convert arguments into an array
+                arg_array = {}
+                arg_ref = doc[test]["subtest"][subtest]["arg"]
+
+                for n in doc[test]["arg"][arg_ref].keys():
+                    arg_array[n] = []
+                    if int(n) > num_vars:
+                        continue
+
+                    for el in sorted(doc[test]["arg"][arg_ref][n].keys()):
+                        arg_array[n].append(el)
+
+                size = len(arg_array)
+
+                if size < num_vars:
+                    sys.exit(f"{fname}:subtest {summary} needs {num_vars} arguments but only {size} are defined.")
+
+                for j in range(0, num_vars):
+                    if arg_array[j] is None:
+                        sys.exit(f"{fname}:subtest{summary} needs arg[{j}], but this is not defined.")
+
+                # convert numeric wildcard,s to string ones
+                summary = re.sub('%(d|ld|lld|i|u|lu|llu)','%s', summary)
+
+                pos = [ 0 ] * num_vars
+                args = [ 0 ] * num_vars
+
+                while 1:
+                    for j in range(0, num_vars):
+                        a = arg_array[j][pos[j]]
+
+                        if re.match(r"\<.*\>", doc[test]["arg"][arg_ref][j][a]):
+                            args[j] = "<" + a + ">"
+                        else:
+                            args[j] = a
+
+                    arg_summary = summary % tuple(args)
+                    subtests.append(arg_summary)
+
+                    # Increment variable inside the array
+                    p = 0
+                    while pos[p] + 1 >= len(arg_array[p]):
+                        pos[p] = 0
+                        p += 1
+                        if p >= num_vars:
+                            break
+
+                    if p >= num_vars:
+                        break
+
+                    pos[p] += 1
+
+    return subtests
+
+#
+# Compare testlists from IGT with the documentation from source code
+#
+def check_tests():
+    global min_test_prefix
+
+    doc_subtests = sorted(get_subtests())
+
+    for i in range(0, len(doc_subtests)):
+        doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
+
+    # Get a list of tests from
+    result = subprocess.run([ f"{igt_build_path}/{igt_runner}",
+                            "-L", "-t",  min_test_prefix,
+                            f"{igt_build_path}/tests"],
+                            capture_output = True, text = True)
+    if result.returncode:
+        print( result.stdout)
+        print("Error:", result.stderr)
+        sys.exit(result.returncode)
+
+    run_subtests = sorted(result.stdout.splitlines())
+
+    # Compare arrays
+
+    run_missing = []
+    doc_uneeded = []
+
+    for t1 in doc_subtests:
+        found = False
+        for t2 in run_subtests:
+            if re.match(r'^' + t1 + r'$', t2):
+                found = True
+                break
+        if not found:
+            doc_uneeded.append(t1)
+
+    for t2 in run_subtests:
+        found = False
+        for t1 in doc_subtests:
+            if re.match(r'^' + t1 + r'$', t2):
+                found = True
+                break
+        if not found:
+            run_missing.append(t2)
+
+    if doc_uneeded:
+        print("Unused documentation")
+        for t in doc_uneeded:
+            print(t)
+
+    if run_missing:
+        if doc_uneeded:
+            print()
+        print("Missing documentation")
+        for t in run_missing:
+            print(t)
+
+#
+# Parse a filename, adding documentation inside the doc dictionary
+#
+
+def add_fname_to_dict(fname):
+    global test_number
+
+    current_test = None
+    current_subtest = None
+
+    handle_section = ''
+    current_field = ''
+    arg_number = 1
+    cur_arg = -1
+    cur_arg_element = 0
+
+    with open(fname, 'r', encoding='utf8') as handle:
+        arg_ref = None
+        current_test = ''
+        subtest_number = 0
+
+        for ln in handle:
+            if re.match(r'^\s*\*$', ln):
+                continue
+
+            if re.match(r'^\s*\*/$', ln):
+                handle_section = ''
+                current_subtest = None
+                arg_ref = None
+                cur_arg = -1
+
+                continue
+
+            if re.match(r'^\s*/\*\*$', ln):
+                handle_section = '1'
+                continue
+
+            if not handle_section:
+                continue
+
+            ln = re.sub(r'^\s*\*\s*', '', ln)
+
+            # Handle only known sections
+            if handle_section == '1':
+                current_field = ''
+
+                # Check if it is a new TEST section
+                if (match := re.match(r'^TEST:\s*(.*)', ln)):
+                    current_test = test_number
+                    test_number += 1
+
+                    handle_section = 'test'
+
+                    doc[current_test] = {}
+                    doc[current_test]["arg"] = {}
+                    doc[current_test]["Summary"] = match.group(1)
+                    doc[current_test]["File"] = fname
+                    doc[current_test]["subtest"] = {}
+                    current_subtest = None
+
+                    continue
+
+            # Check if it is a new SUBTEST section
+            if (match := re.match(r'^SUBTESTS?:\s*(.*)', ln)):
+                current_subtest = subtest_number
+                subtest_number += 1
+
+                current_field = ''
+                handle_section = 'subtest'
+
+                doc[current_test]["subtest"][current_subtest] = {}
+
+                doc[current_test]["subtest"][current_subtest]["Summary"] = match.group(1)
+                doc[current_test]["subtest"][current_subtest]["Description"] = ''
+
+                if not arg_ref:
+                    arg_ref = arg_number
+                    arg_number += 1
+                    doc[current_test]["arg"][arg_ref] = {}
+
+                doc[current_test]["subtest"][current_subtest]["arg"] = arg_ref
+
+                continue
+
+            # It is a known section. Parse its contents
+            if (match := re.match(field_re, ln)):
+                current_field = match.group(1).lower().capitalize()
+                v = match.group(2)
+
+                if handle_section == 'test':
+                    doc[current_test][current_field] = v
+                else:
+                    doc[current_test]["subtest"][current_subtest][current_field] = v
+
+                cur_arg = -1
+
+                continue
+
+            # Use hashes for arguments to avoid duplication
+            if (match := re.match(r'arg\[(\d+)\]:\s*(.*)', ln)):
+                current_field = ''
+                if arg_ref is None:
+                    sys.exit(f"{fname}:{fileinput.filelineno()}: arguments should be defined after one or more subtests, at the same comment")
+
+                cur_arg = int(match.group(1)) - 1
+                if cur_arg not in doc[current_test]["arg"][arg_ref]:
+                    doc[current_test]["arg"][arg_ref][cur_arg] = {}
+
+                cur_arg_element = match.group(2)
+
+                if match.group(2):
+                    # Should be used only for numeric values
+                    doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = "<" + match.group(2) + ">"
+
+                continue
+
+            if (match := re.match(r'\@(\S+):\s*(.*)', ln)):
+                if cur_arg >= 0:
+                    current_field = ''
+                    if arg_ref is None:
+                        sys.exit(f"{fname}:{fileinput.filelineno()}: arguments should be defined after one or more subtests, at the same comment")
+
+                    cur_arg_element = match.group(1)
+                    doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = match.group(2)
+
+                else:
+                    print(f"{fname}: Warning: invalid argument: @%s: %s" %
+                          (match.group(1), match.group(2)))
+
+                continue
+
+            # Handle multi-line field contents
+            if current_field:
+                if (match := re.match(r'\s*(.*)', ln)):
+                    if handle_section == 'test':
+                        doc[current_test][current_field] += " " + \
+                            match.group(1)
+                    else:
+                        doc[current_test]["subtest"][current_subtest][current_field] += " " + \
+                            match.group(1)
+
+                continue
+
+            # Handle multi-line argument contents
+            if cur_arg >= 0 and arg_ref is not None:
+                if (match := re.match(r'\s*\*?\s*(.*)', ln)):
+                    v = match.group(1)
+
+                    if (match := re.match(r'(.*)>$', doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element])):
+                        doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = '<' + v + ">"
+                    else:
+                        doc[current_test]["arg"][arg_ref][cur_arg][cur_arg_element] = v
+
+                continue
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
+                    default=igt_build_path)
+parser.add_argument('--files', nargs='+',
+                    help="File name(s) to be processed")
+
+parse_args = parser.parse_args()
+
+field_re = re.compile(r"(" + '|'.join(fields) + r'):\s*(.*)', re.I)
+
+min_test_prefix = ''
+
+for filename in parse_args.files:
+    # Dynamically build a test prefix from the file name
+    prefix = re.sub(r'.*tests/', '', filename)
+    prefix = r'igt\@' + re.sub(r'(.*/).*', r'\1', prefix)
+
+    if min_test_prefix == '':
+        min_test_prefix = prefix
+    elif len(prefix) < len(min_test_prefix):
+        min_test_prefix = prefix
+
+    add_fname_to_dict(filename)
+
+run = 0
+if parse_args.show_subtests:
+    run = 1
+    subtests = get_subtests()
+
+    for subtest in subtests:
+        print (subtest)
+
+if parse_args.check_testlist:
+    run = 1
+    check_tests()
+
+if not run or parse_args.rest:
+    print_test()
-- 
2.39.0
