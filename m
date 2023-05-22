Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9AB10E33A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:22:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3466E580DA8
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q16QH-00AbdE-1e
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 16:22:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 16:22:01 +0200
Message-Id: <20230522142201.2527800-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] scripts/doc_to_xls.py: add an script to
 generate a doc spreadsheet
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

Add a script to convert documentation to a spreadsheet.

The logic here can read multiple config files. It will retrieve
documentation from the files that are configured inside each input
JSON file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/doc_to_xls.py | 70 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100755 scripts/doc_to_xls.py

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
new file mode 100755
index 000000000000..1f33c1828ceb
--- /dev/null
+++ b/scripts/doc_to_xls.py
@@ -0,0 +1,70 @@
+#!/usr/bin/env python3
+# pylint: disable=C0103, C0200
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
+from openpyxl import Workbook
+
+from test_list import TestList
+
+parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
+                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
+                                 epilog = 'If no action specified, assume --rest.')
+parser.add_argument("--config", required = True,  nargs='+',
+                    help="JSON file describing the test plan template")
+parser.add_argument("--include-plan", action="store_true",
+                    help="Include test plans, if any.")
+parser.add_argument("--xls", required = True,
+                    help="Output XLS file.")
+
+parse_args = parser.parse_args()
+
+tests = []
+for config_file in parse_args.config:
+    # Implemented tests
+    tests.append(TestList(config_file, parse_args.include_plan))
+
+wb = Workbook()
+ws = None
+
+for row in range(len(tests)):
+    test = tests[row]
+    sheet_name = test.title
+
+    if not ws:
+        ws = wb.active
+        ws.title = sheet_name
+    else:
+        ws = wb.create_sheet(sheet_name)
+
+    sheet = test.get_spreadsheet()
+
+    max_length = []
+    for col in range(len(sheet[row])):
+        max_length.append(0)
+
+    for row in range(len(sheet)):
+        for col in range(len(sheet[row])):
+            ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
+            if len(sheet[row][col]) > max_length[col]:
+                max_length[col] = len(sheet[row][col])
+
+    col = 0
+    for c in ws.columns:
+        column = c[0].column_letter
+
+        adjusted_width = (max_length[col] + 2) * 1.2
+        ws.column_dimensions[column].width = adjusted_width
+
+        col += 1
+
+wb.save(parse_args.xls)
-- 
2.40.1
