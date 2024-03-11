Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67029C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B255112A59;
	Mon, 11 Mar 2024 13:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqORI78d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58411264E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162682; x=1741698682;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=g26eYLgfxhD9DPe7xiX5G1ysadHRrR9jzD/U+FoUHWc=;
 b=QqORI78dSYsVc48HCqMHQiT/EqarTSSzsKAkiSXS0fFpkoqoqxcQ7R6n
 aL2p1gWQv+ej1zAGK7BGpuHhUy+rf2ZTRRMVuzrKCFVDoyne0Oi0U372s
 kRE6HLhyQ/K6TiYjRqxo1Mh1p85NXHM5Rx6i85elMwnK38IABHsuxFGcM
 5XcJgL8nvDM28tfDzAv+EZDo+e52YDy1URpw2/+UIw9qslk21dnVGk5bZ
 SQ2pn2uwFabKKfW+ed2s4lAADXszVrDbclX2/WPUpAIRSCqnx70+xPZxN
 oonJDeHPZroXnzEcD4MvBuiRHD782j2nmxr3AgY0GqcFhwA67SfJYHnUB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30261088"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="30261088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15757714"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:11:21 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A00CB580DA0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 06:11:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rjfR0-000000047pH-2Xxc for igt-dev@lists.freedesktop.org;
 Mon, 11 Mar 2024 14:11:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] scripts/doc_to_xls.py: split code into a XLS conversion
 and main()
Date: Mon, 11 Mar 2024 14:11:16 +0100
Message-ID: <20240311131116.983384-1-mauro.chehab@linux.intel.com>
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
 scripts/doc_to_xls.py | 113 ++++++++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 48 deletions(-)

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
index 12c0223920ae..a4b1d9d8be1b 100755
--- a/scripts/doc_to_xls.py
+++ b/scripts/doc_to_xls.py
@@ -30,63 +30,80 @@ from openpyxl.styles import Font
 
 from test_list import TestList
 
-parser = argparse.ArgumentParser(description=__doc__,
-                                 formatter_class = argparse.RawDescriptionHelpFormatter,
-                                 epilog = EPILOG)
-parser.add_argument("--config", required = True,  nargs='+',
-                    help="JSON file describing the test plan template")
-parser.add_argument("--include-plan", action="store_true",
-                    help="Include test plans, if any.")
-parser.add_argument("--xls", required = True,
-                    help="Output XLS file.")
+def tests_to_xls(tests, fname):
+    """
+    Convert an array of IGT documentation tests into a XLS file
+    """
 
-parse_args = parser.parse_args()
+    wb = Workbook()
+    ws = None
 
-tests = []
-for config_file in parse_args.config:
-    # Implemented tests
-    tests.append(TestList(config_file, parse_args.include_plan))
+    expand_fields = {
+        "GPU excluded platform": "blocklist "
+    }
 
-wb = Workbook()
-ws = None
+    for row in range(len(tests)):
+        test = tests[row]
+        sheet_name = test.title
 
-expand_fields = {
-    "GPU excluded platform": "blocklist "
-}
+        if not ws:
+            ws = wb.active
+            ws.title = sheet_name
+        else:
+            ws = wb.create_sheet(sheet_name)
 
-for row in range(len(tests)):
-    test = tests[row]
-    sheet_name = test.title
+        sheet = test.get_spreadsheet(expand_fields)
 
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
+                c = ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
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
+
+        # Turn on auto-filter
+        ws.auto_filter.ref = ws.dimensions
+
+    wb.save(fname)
+
+######
+# Main
+######
+
+def main():
+
+    parser = argparse.ArgumentParser(description=__doc__,
+                                     formatter_class = argparse.RawDescriptionHelpFormatter,
+                                     epilog = EPILOG)
+    parser.add_argument("--config", required = True,  nargs='+',
+                        help="JSON file describing the test plan template")
+    parser.add_argument("--include-plan", action="store_true",
+                        help="Include test plans, if any.")
+    parser.add_argument("--xls", required = True,
+                        help="Output XLS file.")
+
+    parse_args = parser.parse_args()
+
+    tests = []
+    for config_file in parse_args.config:
+        # Implemented tests
+        tests.append(TestList(config_file, parse_args.include_plan))
+
+    tests_to_xls(tests, fname = parse_args.xls)
+
+if __name__ == '__main__':
+    main()
 
-wb.save(parse_args.xls)
-- 
2.43.2

