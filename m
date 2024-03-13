Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA1C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A777110F31A;
	Wed, 13 Mar 2024 07:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDFTyKry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11B710F19C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316699; x=1741852699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=jJ0MpwmJ7lWDDfBlk0PH09Er2hd3AJ2wpIh/eswdFKk=;
 b=MDFTyKryKYu1RdjWiXAt8b42bxCNbT8TXHSfIc7nlnAr/93yQQ5qPm8m
 FS9ukjBIGCHmh2r35zOSbUgaucVHLXC+FQObR8il5/Y5fZwSY7OULZX5r
 5MPp75lskiuLAVSILSn25WG9EdSZU0IDehImP9NV9Aveiujic0yLRt2Gu
 JA53MK1Bjd4gSQvlEOMYXY4NvJHZERDcUGGV/YutWfEFzH73LdJWXszlV
 mWwQCPYtEW7qD2mxhesg7SxTPaEHbLgn5jRFGPvEGxrJ7xxNa+GqPrKMW
 9ZHu7vzJvuzsvBFruxkyL4Qi/+o3/hxAeFE+cgq5u+/nfyP6xJjq+D7l7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5250204"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5250204"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12408529"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A10F3580E33;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004frf-2rXA; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 2/6] scripts/xls_to_doc.py: beautify its coding style
Date: Wed, 13 Mar 2024 08:56:05 +0100
Message-ID: <20240313075813.1114081-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
References: <20240313075813.1114081-1-mauro.chehab@linux.intel.com>
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

Use autopep8 and some manual adjustments to make pylint
happier.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 56 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index fdf98105cd4b..696fccd64a2b 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -1,10 +1,12 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,C0302,C0103,C0116,C0114,R0912,R0914,R0915,R1702,C0115,R0913
+# pylint: disable=C0301,R0912,R0913,R0914,R0915,C0116
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
 ## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
 
+"""Import contents of a XLS file into testplan documentation."""
+
 import argparse
 import json
 import os
@@ -15,12 +17,18 @@ from openpyxl import load_workbook
 
 from test_list import TestList
 
-EPILOG=""
+EPILOG = ""
 
 #
 # FillTests class definition
 #
+
+
 class FillTests(TestList):
+    """
+    Fill documentation source code test comments from a spreadsheet.
+    """
+
     def __init__(self, config_path):
         self.tests = {}
         self.spreadsheet_data = {}
@@ -65,9 +73,9 @@ class FillTests(TestList):
 
         for field, item in self.props.items():
             if "sublevel" in item["_properties_"]:
-                    update = self.props[field]["_properties_"].get("update-from-file")
-                    if update:
-                        self.ignore_fields.append(field)
+                update = item["_properties_"].get("update-from-file")
+                if update:
+                    self.ignore_fields.append(field)
 
     def add_field(self, dic, field, value):
         if field in dic and dic[field] != '':
@@ -79,7 +87,7 @@ class FillTests(TestList):
 
     def process_spreadsheet_sheet(self, sheet):
 
-        column_list=[]
+        column_list = []
         for cell in sheet[1]:
             column_list.append(cell.value)
 
@@ -112,7 +120,7 @@ class FillTests(TestList):
     def read_spreadsheet_file(self, fname, sheets):
 
         # Iterate the loop to read the cell values
-        wb = load_workbook(filename = fname)
+        wb = load_workbook(filename=fname)
 
         # Handle first "normal" sheets
         for sheet in wb:
@@ -127,7 +135,7 @@ class FillTests(TestList):
 
         current_field = None
         i = line
-        while 1:
+        while True:
             i += 1
             if i >= len(content):
                 break
@@ -177,7 +185,7 @@ class FillTests(TestList):
 
         content.insert(i, f' * {field}: {value}\n')
 
-    def parse_spreadsheet(self, fname, sheets = None):
+    def parse_spreadsheet(self, fname, sheets=None):
         if not os.path.isfile(fname):
             print(f'Warning: {fname} not found. Skipping spreadsheet parser')
             return
@@ -207,8 +215,6 @@ class FillTests(TestList):
 
     def update_test_file(self, testname, args):
         try:
-#            print(f"Updating {testname}")
-
             sourcename = self.tests[testname]["File"]
             with open(sourcename, 'r', encoding='utf8') as in_fp:
                 content = in_fp.read().splitlines(True)
@@ -235,11 +241,11 @@ class FillTests(TestList):
 
                 # Handling wildcards is not easy. Let's just skip those
                 for field, value in sorted(subtest_content.items()):
-                    if field in [ 'line', 'subtest_nr' ]:
+                    if field in ['line', 'subtest_nr']:
                         continue
 
                     if args.ignore_lists:
-                        if field in  self.ignore_fields:
+                        if field in self.ignore_fields:
                             continue
 
                     doc_value = doc_content.get(field)
@@ -283,7 +289,6 @@ class FillTests(TestList):
             print(f'Failed to write to {sourcename}')
 
     def update_test_files(self, args):
-
         """ Populate documentation """
 
         for testname in self.tests:
@@ -293,18 +298,20 @@ class FillTests(TestList):
 # Main
 ######
 
+
 def main():
     parser = argparse.ArgumentParser(description=__doc__,
-                                        formatter_class = argparse.ArgumentDefaultsHelpFormatter,
-                                        argument_default = argparse.SUPPRESS,
-                                        epilog = EPILOG)
-    parser.add_argument("--config", required = True,
+                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                     argument_default=argparse.SUPPRESS,
+                                     epilog=EPILOG)
+    parser.add_argument("--config", required=True,
                         help="JSON file describing the test plan template")
-    parser.add_argument("--xls", required = True,
+    parser.add_argument("--xls", required=True,
                         help="Input XLS file.")
-    parser.add_argument("--sheets", nargs = "*",
+    parser.add_argument("--sheets", nargs="*",
                         help="Input only some specific sheets from the XLS file.")
-    parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
+    parser.add_argument('--ignore-lists', action='store_false', default=True,
+                        help='Ignore fields that are updated via test lists')
 
     parse_args = parser.parse_args()
 
@@ -315,13 +322,14 @@ def main():
 
     fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
 
-    ## DEBUG: remove it later on
+    # DEBUG: remove it later on
     with open("fill_test.json", "w", encoding='utf8') as write_file:
-        json.dump(fill_test.tests, write_file, indent = 4)
+        json.dump(fill_test.tests, write_file, indent=4)
     with open("doc.json", "w", encoding='utf8') as write_file:
-        json.dump(fill_test.doc, write_file, indent = 4)
+        json.dump(fill_test.doc, write_file, indent=4)
 
     fill_test.update_test_files(parse_args)
 
+
 if __name__ == '__main__':
     main()
-- 
2.43.2

