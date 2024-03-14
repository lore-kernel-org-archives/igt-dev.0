Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0BDC5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802D810FA40;
	Thu, 14 Mar 2024 10:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3f5+iLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F2C10FA41
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412224; x=1741948224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=UlKZ8J99SX6BE2xON3/brbS1wxfq15zxq1CHvkVk6Z0=;
 b=a3f5+iLiN+f2TW3UIvl/yIBJVrfzq5TwWmBZ3y4ah4DFTyFaCdWAxuXX
 KUd7hYDh9Ufk5yVmVUlL4RFG72TngtIGYwPE6DthfEKp/Z8Z5j7Pt+JP8
 OXY1V9EMOxCPubrJbsfI+m/qWLa3LeBzzF7bULRuVHeShTEy1DHtxukfl
 bkzVBragSqt8RRSyC93xNRmzFTyBWPZ2xeipXmThxm1lWgLgPTxe9+Y2b
 uxAwCE1ysS5+MjnM2wAu/RdKdJCBUcUmgndnZ9RP+SxHqEveK91Hv5Swk
 nVrQKV8XZ/ggAdu6+P4Xo5sPAmLdQ7u9pos3mCVZRuzGztag+ab8SV0Oz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5087658"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5087658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12132011"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3E7A1580F05;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVu-1Lly; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 10/10] scripts/xls_to_doc.py: add a logic to simplify
 tags
Date: Thu, 14 Mar 2024 11:29:19 +0100
Message-ID: <20240314103014.1170437-11-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

When there are common fields at the test and they were updated,
reflect the changes at the test level if all subtests have equal
values at the same field(s).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 133 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 121 insertions(+), 12 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 60f7536c8839..6492c5d8337a 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -8,6 +8,7 @@
 """Import contents of a XLS file into testplan documentation."""
 
 import argparse
+import copy
 import json
 import os
 import re
@@ -38,7 +39,7 @@ class FillTests(TestList):
         # Read current documentation
         TestList.__init__(self, config_path)
 
-        self.orig_doc = self.doc.copy()
+        self.orig_doc = copy.deepcopy(self.doc)
 
         self.testname_regex = re.compile(r'^\s*(igt@[^\n\@]+)\@?(\S*)\s*')
         self.key_has_wildcard = re.compile(r'\%?arg\[(\d+)\]')
@@ -152,11 +153,26 @@ class FillTests(TestList):
 
         return self.spreadsheet_data
 
-    def change_value(self, content, subtest, line, field, value):
+    def change_value(self, content, test, subtest, line, field, value):
         """
         Change the contents of a source file to update its documentation.
         """
 
+        if test:
+            line = 0
+            while True:
+                line += 1
+                if line >= len(content):
+                    break
+
+                file_line = content[line]
+
+                match = re.match(r'^\s*\* ?TEST:\s*(.*)', file_line)
+                if match:
+                    break
+
+            line += 1
+
         current_field = None
         found_line = None
         i = line
@@ -173,11 +189,14 @@ class FillTests(TestList):
             file_line = re.sub(r'^\s*\* ?', '', file_line)
 
             match = re.match(r'^SUBTESTS?:\s*(.*)', file_line)
-            if match and match.group(1) != subtest:
-                break
+            if match:
+                if subtest and match.group(1) != subtest:
+                    break
+                if test:
+                    break
 
             match = re.match(r'^TEST:\s*(.*)', file_line)
-            if match and match.group(1) != subtest:
+            if match:
                 break
 
             match = re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)
@@ -208,11 +227,22 @@ class FillTests(TestList):
 
                     content[i] = ""
 
-        if value != "":
-            if found_line:
+        if i > len(content):
+            if test:
+                print(f"Warning: coun't find doc string for test {subtest}, field {field}")
+            else:
+                print(f"Warning: coun't find doc string for subtest {subtest}, field {field} on line {line}")
+
+            return
+
+        if found_line:
+            if value != "":
                 content[found_line] = f' * {field}: {value}\n'
-                return
+            else:
+                content[found_line] = ""
+            return
 
+        if value != "":
             if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
                 i -= 1
 
@@ -261,6 +291,78 @@ class FillTests(TestList):
             for key, value in row.items():
                 self.tests[testname]["subtests"][subtest][key] = value
 
+    def simplify_doc_strings(self):
+        """
+        Group common properties at TEST level if all subtests have identical
+        values for such property.
+        """
+
+        print("Handling common information on test from subtests")
+
+        for testname in self.tests:
+            # Get common properties
+            common = {}
+            test_nr = self.tests[testname].get("Test")
+            for key, value in self.doc[test_nr].items():
+                # Ignore description when checking common fields
+                if key.lower() == "description":
+                    continue
+
+                if key in self.update_fields:
+                    common[key] = value
+
+            # Step 1: verify common items
+            first = True
+            for subtest in sorted(list(self.tests[testname]["subtests"].keys())):
+                if subtest.count("@") > 1:
+                    print(f"Warning: don't simplify dynamic subtest: {testname}{subtest}")
+                    continue
+
+                # Store common items
+                subtest_fields = sorted(self.tests[testname]["subtests"][subtest].keys())
+                for k in subtest_fields:
+                    # Ignore description when checking common fields
+                    if k.lower() == "description":
+                        continue
+
+                    # Ignore internal fields
+                    if k not in self.update_fields:
+                        continue
+
+                    val = self.tests[testname]["subtests"][subtest][k]
+                    val = val.strip()
+                    val = re.sub(r" +", " ", val)
+                    val = re.sub(r"([^\.])\s?\n\s*([A-Z])", r"\1.\n\2", val)
+                    self.tests[testname]["subtests"][subtest][k] = val
+
+                    if first and val != '':
+                        common[k] = val
+                    else:
+                        if k not in common:
+                            continue
+                        if common[k] != val:
+                            del common[k]
+
+                first = False
+
+                # Remove keys that aren't common to all subtests
+                for k in list(common.keys()):
+                    if k not in subtest_fields:
+                        del common[k]
+
+            # Step 2: drop common items from subtests
+            for subtest, fields in list(self.tests[testname]["subtests"].items()):
+                for k, val in list(fields.items()):
+                    if k not in common:
+                        continue
+
+                    if val == common[k]:
+                        self.tests[testname]["subtests"][subtest][k] = ""
+
+            # Step 3: store the modified common properties
+            for k, val in common.items():
+                self.doc[test_nr][k] = val
+
     def update_test_file(self, testname, args):
         """
         Update a C source file using the contents of self.tests as
@@ -293,6 +395,7 @@ class FillTests(TestList):
                 if doc_value == value:
                     continue
 
+                self.change_value(content, True, testname, 0, field, value)
 
             # Update subtest fields
             for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
@@ -300,7 +403,6 @@ class FillTests(TestList):
                     print(f"Warning: didn't find where {subtest} is documented.")
                     continue
 
-                line = subtest_content['line']
                 subtest_nr = subtest_content['subtest_nr']
 
                 if subtest_nr not in self.doc[test_nr]["subtest"]:
@@ -310,6 +412,7 @@ class FillTests(TestList):
                         print(f"Warning: test {testname}, subtest {subtest} is not documented.")
                     continue
 
+                line = self.doc[test_nr]["_subtest_line_"][subtest_nr]
                 doc_content = self.orig_doc[test_nr]["subtest"][subtest_nr]
 
                 fields = set(subtest_content.keys()) | set(doc_content.keys())
@@ -342,7 +445,7 @@ class FillTests(TestList):
                     # Just in case, handle continuation lines
                     value = re.sub(r"\n", "\n *   ", value)
 
-                    self.change_value(content, subtest, line, field, value)
+                    self.change_value(content, False, subtest, line, field, value)
 
                     # Update line numbers after insert
                     skip = True
@@ -391,7 +494,7 @@ def main():
     parser = argparse.ArgumentParser(description=__doc__)
     parser.add_argument("--config", required=True,
                         help="JSON file describing the test plan template")
-    parser.add_argument("--xls", required=True,
+    parser.add_argument("--xls",
                         help="Input XLS file.")
     parser.add_argument("--sheets", nargs="*",
                         help="Input only some specific sheets from the XLS file.")
@@ -399,13 +502,19 @@ def main():
                         help='Ignore fields that are updated via test lists')
     parser.add_argument("--store-json", action="store_true",
                         help="Generate JSON files with documentation. Useful for debugging purposes.")
+    parser.add_argument("--simplify", action="store_true",
+                        help="Run a simplify logic to cleanup TEST common fields.")
     parser.add_argument('-v', '--verbose', action='count', default=0)
 
     parse_args = parser.parse_args()
 
     fill_test = FillTests(parse_args.config, parse_args.verbose)
 
-    fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
+    if parse_args.xls:
+        fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
+
+    if parse_args.simplify:
+        fill_test.simplify_doc_strings()
 
     if "store_json" in parse_args:
         print("Generating fill_test.json debug file")
-- 
2.43.2

