Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A2CC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 14:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B69F112AB6;
	Mon, 11 Mar 2024 14:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrA/kDQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD47A112AB6
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165982; x=1741701982;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=cX5hpUySEbTMqgpww84w0vU/q/wtPofQq8aOfFJFaXs=;
 b=OrA/kDQlor2f4ecBVVSkqpM2skahJR9nNFG7Fi8Q2Sf2BFTSRV/xlvRJ
 IbWgVNJ1g5dAKPh2P8PorWdY7IXmE96p2wq8pFQk2PulY0f/ln/kH6HTL
 xrXfiSx36i6sS3S7Gcv8y41SILusEik117c2LlIxPfuZzDxYkv+jYubQD
 mElj4Oabs+dLon3P2g3tntcY0tswNJS/knOQgmijqq/B1nixO4quoH+SN
 7RMHEOJL1hGiwkm/zrzJTIqMzBwmkd2dw3Q4I1z/KgRErIq1AeD2JNE1r
 cAbIXi9lCk81er32t00eMsvltC982X94Yn8L7M8MYV8f/+rm3tdl2gTDj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22350677"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="22350677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15820551"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:05:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B0171580CBC
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 07:05:19 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rjgHF-000000049Ex-2jbC for igt-dev@lists.freedesktop.org;
 Mon, 11 Mar 2024 15:05:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] scripts/doc_to_xls.py: split code into a XLS
 conversion and main()
Date: Mon, 11 Mar 2024 15:04:42 +0100
Message-ID: <20240311140515.988767-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Such change allows using the code on some other python script that
would be converting IGT doc test documentation into XLS files.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
v2:
  - use autopep8 to follow PEP8 coding style;
  - make pylint happy.

 scripts/doc_to_xls.py | 132 ++++++++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 56 deletions(-)

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
index 12c0223920ae..448ff18429b6 100755
--- a/scripts/doc_to_xls.py
+++ b/scripts/doc_to_xls.py
@@ -10,7 +10,15 @@
 
 """Write the contents of the testplan documentation to a XLS file."""
 
-EPILOG="""
+import argparse
+
+from openpyxl.styles import Font
+from openpyxl.utils import get_column_letter
+from openpyxl import Workbook
+
+from test_list import TestList
+
+EPILOG = """
 Examples:
 
 1. Create a XLS file with a single worksheet with Xe driver documentation:
@@ -22,71 +30,83 @@ Examples:
    scripts/doc_to_xls.py --config tests/kms_*json tests/*/*.json --xls igt_test_documentation.xls
 """
 
-import argparse
 
-from openpyxl import Workbook
-from openpyxl.utils import get_column_letter
-from openpyxl.styles import Font
+def tests_to_xls(tests, fname):
+    """
+    Convert an array of IGT documentation tests into a XLS file
+    """
 
-from test_list import TestList
+    wb = Workbook()
+    ws = None
 
-parser = argparse.ArgumentParser(description=__doc__,
-                                 formatter_class = argparse.RawDescriptionHelpFormatter,
-                                 epilog = EPILOG)
-parser.add_argument("--config", required = True,  nargs='+',
-                    help="JSON file describing the test plan template")
-parser.add_argument("--include-plan", action="store_true",
-                    help="Include test plans, if any.")
-parser.add_argument("--xls", required = True,
-                    help="Output XLS file.")
+    expand_fields = {
+        "GPU excluded platform": "blocklist "
+    }
 
-parse_args = parser.parse_args()
+    for row in range(len(tests)):
+        test = tests[row]
+        sheet_name = test.title
 
-tests = []
-for config_file in parse_args.config:
-    # Implemented tests
-    tests.append(TestList(config_file, parse_args.include_plan))
+        if not ws:
+            ws = wb.active
+            ws.title = sheet_name
+        else:
+            ws = wb.create_sheet(sheet_name)
 
-wb = Workbook()
-ws = None
+        sheet = test.get_spreadsheet(expand_fields)
 
-expand_fields = {
-    "GPU excluded platform": "blocklist "
-}
-
-for row in range(len(tests)):
-    test = tests[row]
-    sheet_name = test.title
-
-    if not ws:
-        ws = wb.active
-        ws.title = sheet_name
-    else:
-        ws = wb.create_sheet(sheet_name)
-
-    sheet = test.get_spreadsheet(expand_fields)
-
-    max_length = []
-    for col in range(len(sheet[row])):
-        max_length.append(0)
-
-    for row in range(len(sheet)):
+        max_length = []
         for col in range(len(sheet[row])):
-            c = ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
-            if row == 0:
-                c.font = Font(bold=True)
+            max_length.append(0)
 
-            if len(sheet[row][col]) > max_length[col]:
-                max_length[col] = len(sheet[row][col])
+        for row in range(len(sheet)):
+            for col in range(len(sheet[row])):
+                c = ws.cell(row=row + 1, column=col + 1, value=sheet[row][col])
+                if row == 0:
+                    c.font = Font(bold=True)
 
-    # Estimate column length
-    for col in range(len(sheet[0])):
-        column = get_column_letter(col + 1)
+                if len(sheet[row][col]) > max_length[col]:
+                    max_length[col] = len(sheet[row][col])
 
-        adjusted_width = (max_length[col] + 2) * 1.2
-        ws.column_dimensions[column].width = adjusted_width
+        # Estimate column length
+        for col in range(len(sheet[0])):
+            column = get_column_letter(col + 1)
 
-    # Turn on auto-filter
-    ws.auto_filter.ref = ws.dimensions
+            adjusted_width = (max_length[col] + 2) * 1.2
+            ws.column_dimensions[column].width = adjusted_width
 
-wb.save(parse_args.xls)
+        # Turn on auto-filter
+        ws.auto_filter.ref = ws.dimensions
+
+    wb.save(fname)
+
+######
+# Main
+######
+
+
+def main():
+    """Main program"""
+
+    parser = argparse.ArgumentParser(description=__doc__,
+                                     formatter_class=argparse.RawDescriptionHelpFormatter,
+                                     epilog=EPILOG)
+    parser.add_argument("--config", required=True,  nargs='+',
+                        help="JSON file describing the test plan template")
+    parser.add_argument("--include-plan", action="store_true",
+                        help="Include test plans, if any.")
+    parser.add_argument("--xls", required=True,
+                        help="Output XLS file.")
+
+    parse_args = parser.parse_args()
+
+    tests = []
+    for config_file in parse_args.config:
+        # Implemented tests
+        tests.append(TestList(config_file, parse_args.include_plan))
+
+    tests_to_xls(tests, fname=parse_args.xls)
+
+
+if __name__ == '__main__':
+    main()
-- 
2.43.2

