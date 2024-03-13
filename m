Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA761C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634A810E4DE;
	Wed, 13 Mar 2024 07:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3Rz0EId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3679110F6C6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316699; x=1741852699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=Zx2SuHl14nDjdhJGM/lFEXFUaSz/2fDUFBWeyiA3TRQ=;
 b=a3Rz0EIdxsfyWKwm1WylGGKVkcsUSYmgTVuBSg7VyNjAkAizVy56G85z
 FNy9RVyOTzHc2PIPUN5NlzfKTmjltS+KCKH8v73FNYza/JC2IOVSlcLhB
 nAnRNAnXgmbexr9MBmI/ls9ud4juYTUIbtTjNY/XhLdFrKMpuo7cRWqLQ
 +7bGzVFQKby7z2zqf8Q8X5yeGgNBmEC9cvU+zBA+4KQkKDf+j8g/fLXnO
 YZfuR4Db1Ev9AiwSBbrSfGiBVkN8Mgolmu4gR9rpgKRuh9x3XJeVByR9r
 Z+nf/5uB1OUjhF05hjq+RorYSOmdpTCC0U6D58OT124VjmzDVNFzX3/Sb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5250206"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5250206"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12408535"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:19 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B7979580D14;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004frr-3CYN; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 6/6] scripts/xls_to_doc.py: don't be verbose by default
Date: Wed, 13 Mar 2024 08:56:09 +0100
Message-ID: <20240313075813.1114081-7-mauro.chehab@linux.intel.com>
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

Add a verbosity parameter to hide messages used mostly for debugging
purposes, as, on several cases, the output may be misleading.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 477a1561ee16..a7eaeead1a49 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0912,R0913,R0914,R0915
+# pylint: disable=C0301,R0912,R0913,R0914,R0915,R1702
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -28,11 +28,13 @@ class FillTests(TestList):
     Fill documentation source code test comments from a spreadsheet.
     """
 
-    def __init__(self, config_path):
+    def __init__(self, config_path, verbose):
         self.tests = {}
         self.spreadsheet_data = {}
         self.ignore_fields = []
+        self.verbose = verbose
 
+        # Read current documentation
         TestList.__init__(self, config_path)
 
         self.testname_regex = re.compile(r'^\s*(igt@[^\n\@]+)\@?(\S*)\s*')
@@ -236,7 +238,7 @@ class FillTests(TestList):
                 subtest = ''
 
             if testname not in self.tests:
-                print(f"Ignoring {test}, as test is not documented.")
+                print(f"Warning: {testname} file is not present at JSON config file.")
                 continue
 
             if subtest not in self.tests[testname]["subtests"]:
@@ -272,7 +274,10 @@ class FillTests(TestList):
                 subtest_nr = subtest_content['subtest_nr']
 
                 if subtest_nr not in self.doc[test_nr]["subtest"]:
-                    print(f"Error: missing subtest {subtest_nr} at {self.doc[test_nr]['subtest']}")
+                    if self.verbose:
+                        print(f"Error: missing subtest {subtest_nr} at {self.doc[test_nr]['subtest']}")
+                    else:
+                        print(f"Warning: test {testname}, subtest {subtest} is not documented.")
                     continue
 
                 doc_content = self.doc[test_nr]["subtest"][subtest_nr]
@@ -292,11 +297,13 @@ class FillTests(TestList):
                             print(f"Warning: {subtest} field {field} has wildcards.")
                             continue
                         if doc_value == value:
-                            print(f"{testname}@{subtest} field {field}: Value unchanged. Ignoring it")
+                            if self.verbose > 1:
+                                print(f"{testname}@{subtest} field {field}: Value unchanged. Ignoring it")
                             continue
 
-                    print(f"Update {testname}@{subtest} field {field} on line {line}:")
-                    print(f"  Change from {doc_value} to {value}")
+                    if self.verbose > 0:
+                        print(f"Update {testname}@{subtest} field {field} on line {line}:")
+                        print(f"  Change from {doc_value} to {value}")
 
                     # Just in case, handle continuation lines
                     value = re.sub(r"\n", "\n *   ", value)
@@ -320,7 +327,9 @@ class FillTests(TestList):
 
         # Write changes
         try:
-            print(f"Writing to {sourcename}")
+            if self.verbose:
+                print(f"Writing to {sourcename}")
+
             with open(sourcename, 'w', encoding='utf8') as out_fp:
                 out_fp.write("".join(content))
         except EnvironmentError:
@@ -331,6 +340,9 @@ class FillTests(TestList):
         Populate all test files with the documentation from self.tests.
         """
 
+        if self.verbose == 0:
+            print("Update source files")
+
         for testname in self.tests:
             self.update_test_file(testname, args)
 
@@ -353,11 +365,11 @@ def main():
                         help='Ignore fields that are updated via test lists')
     parser.add_argument("--store-json", action="store_true",
                         help="Generate JSON files with documentation. Useful for debugging purposes.")
-
+    parser.add_argument('-v', '--verbose', action='count', default=0)
 
     parse_args = parser.parse_args()
 
-    fill_test = FillTests(parse_args.config)
+    fill_test = FillTests(parse_args.config, parse_args.verbose)
 
     fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
 
-- 
2.43.2

