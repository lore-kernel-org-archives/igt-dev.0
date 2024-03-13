Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7E5C54E60
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E158910F6CA;
	Wed, 13 Mar 2024 07:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMvBSKd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D7310F6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316713; x=1741852713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=0qQUVdb1yHAsbTH7J/zEvjh+fVQoRiOvhJstZZU4enU=;
 b=iMvBSKd1jPNO9wTmVwNthrFwbnY5YmuE+sZYbbg6J+0M2nCV80P52dtW
 Zhcblm0UICe16FXtiNOrGrwDQvHktgjMK21I+WSkdv9o7swiZ6r0tcr5D
 gEWZL/7PNe98TnmgFFV4RMaNXUeZ0bUd58Ve+YzrQOtYCEHqEZl3qmOAS
 BNEnOvuPgUirp5X8vRB7ZEF5qPkw2NLmElrn9CxwTqhr79gb+VmfOmd8s
 tp/K9Yg8DJiTCMU3/tcxXPzfQZmIZHd6sPBkrk80mq60+sDDj8x1W7i5D
 4FEBlQ/pCetz7+LOjOGPL9XTslSo+eZ5Sbf43MfsqnK70zuw19pVkq7XT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27538847"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27538847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11921928"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AE25A580E6E;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004fro-378h; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 5/6] scripts/xls_to_doc.py: document all functions
Date: Wed, 13 Mar 2024 08:56:08 +0100
Message-ID: <20240313075813.1114081-6-mauro.chehab@linux.intel.com>
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

Add a short description of what function does.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 47 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index cf2cfe2fe233..477a1561ee16 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0912,R0913,R0914,R0915,C0116
+# pylint: disable=C0301,R0912,R0913,R0914,R0915
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -77,6 +77,10 @@ class FillTests(TestList):
                     self.ignore_fields.append(field)
 
     def add_field(self, dic, field, value):
+        """
+        Add a value to a field, alphabetically sorting it.
+        """
+
         if field in dic and dic[field] != '':
             fields = sorted(dic[field].split(", "))
             fields.append(value)
@@ -86,6 +90,13 @@ class FillTests(TestList):
 
     def process_spreadsheet_sheet(self, sheet):
 
+        """
+        Convert a single sheet into a dictionary.
+
+        Please notice that an empty row means to ignore the rest of the
+        sheet.
+        """
+
         column_list = []
         for cell in sheet[1]:
             column_list.append(cell.value)
@@ -117,6 +128,10 @@ class FillTests(TestList):
                 i += 1
 
     def read_spreadsheet_file(self, fname, sheets):
+        """
+        Read a XLS file, processing all sheets and returing a dict with
+        all lines from all sheets altogether.
+        """
 
         # Iterate the loop to read the cell values
         wb = load_workbook(filename=fname)
@@ -131,6 +146,9 @@ class FillTests(TestList):
         return self.spreadsheet_data
 
     def change_value(self, content, subtest, line, field, value):
+        """
+        Change the contents of a source file to update its documentation.
+        """
 
         current_field = None
         i = line
@@ -185,6 +203,21 @@ class FillTests(TestList):
         content.insert(i, f' * {field}: {value}\n')
 
     def parse_spreadsheet(self, fname, sheets=None):
+        """
+        Convert a spreadsheet file into a recursive dictionary.
+
+        It assumes that the first column at the parsed sheets will contain
+        an IGT test name in the format:
+
+            igt@<testname>@<subtest>
+
+        And the other columns will have the field name at the first line.
+
+        On success, it will return a dictionary with this format:
+
+           self.tests[testname]["subtests"][subtest][field] = value
+        """
+
         if not os.path.isfile(fname):
             print(f'Warning: {fname} not found. Skipping spreadsheet parser')
             return
@@ -213,6 +246,12 @@ class FillTests(TestList):
                 self.tests[testname]["subtests"][subtest][key] = value
 
     def update_test_file(self, testname, args):
+        """
+        Update a C source file using the contents of self.tests as
+        the source of data to be filled at the igt_doc documentation
+        comments.
+        """
+
         try:
             sourcename = self.tests[testname]["File"]
             with open(sourcename, 'r', encoding='utf8') as in_fp:
@@ -288,7 +327,9 @@ class FillTests(TestList):
             print(f'Failed to write to {sourcename}')
 
     def update_test_files(self, args):
-        """ Populate documentation """
+        """
+        Populate all test files with the documentation from self.tests.
+        """
 
         for testname in self.tests:
             self.update_test_file(testname, args)
@@ -299,6 +340,8 @@ class FillTests(TestList):
 
 
 def main():
+    """Main program"""
+
     parser = argparse.ArgumentParser(description=__doc__)
     parser.add_argument("--config", required=True,
                         help="JSON file describing the test plan template")
-- 
2.43.2

