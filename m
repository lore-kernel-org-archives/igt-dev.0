Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6ABC54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96BC11202A;
	Fri, 15 Mar 2024 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrIyBbe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76C311202A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710492626; x=1742028626;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=AuOtIyJ6I44b83XbhQCbSAdj2aQMObjJCoMwkcJyZOw=;
 b=CrIyBbe5e1a4Pm3YEwazcbsLt9g4lsUCuppzejx7bdbiBDxrnUakikf+
 05k7eRUEU0xfZbRWNFIgO0PuyhJ4Yy30YEYM3fqZRz/o+i5uM2fvMjRET
 Q5CM0SjFkPM3tGkCryKOwAGDQbD+kY+oPJOEpjQblSfiiiIvTTdpQufhZ
 VESdg94idXmxC/ZButiFliKsY+Pc4QBAF7OuF6aHzxyFKTOtak/ieRqTw
 xGQ7DhhBqofqSx25rdbRUJe4Z1dJ/G4XsH0k3gPqDYsWaMqUh+9puXt9n
 LZvSa69NKLb7RXQUvMOkaeNpFMzV4eS5+8tSbKRIMJb4uf/wulQiqRfCQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16807282"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16807282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="35737974"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:50:25 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BA6EA580E15
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 01:50:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rl3Gg-0000000551T-3JwW for igt-dev@lists.freedesktop.org;
 Fri, 15 Mar 2024 09:50:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 11/10] scripts/xls_to_doc.py: make pylint happy
Date: Fri, 15 Mar 2024 09:50:18 +0100
Message-ID: <20240315085018.1210934-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240314103014.1170437-11-mauro.chehab@linux.intel.com>
References: <20240314103014.1170437-11-mauro.chehab@linux.intel.com>
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

Pylint is too picky. Still, it is useful to run it, as sometimes
it could point to real issues.

So, let's make it happy by:
- disabling R0902, which is one of those "too many" warnings
  (IMO, it doesn't make sense to limit the number of times some
  thing can be used inside a code;

- disabling another warning about not using .items(). On that
  particular case, IMO it will make the code less clearer for
  reviewers and future maintainership, e. g.:

	test_nr = self.tests[testname].get("Test")

  and similar occurrences for self.tests[testname] is a lot clearer
  than:

	for testname, value in self.tests.items():
		...
		test_nr = value.get("Test")
		...
		value["subtests"][subtest][k] = val

	(and other similar occurrences)

  ok, a better name than "value" might help, but still the
  obvious choice would be "test", "test_testname" and such,
  which just makes the code more obfuscated.

  So, ignore the warning for good.

- remove a blank line before a docstring comment;

- remove a currently unused argument from update_files;

- fix indent on a single line.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 6492c5d8337a..50ae56477647 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# pylint: disable=C0301,R0912,R0913,R0914,R0915,R1702
+# pylint: disable=C0301,R0902,R0912,R0913,R0914,R0915,R1702
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 ## Copyright (C) 2023    Intel Corporation                 ##
@@ -97,7 +97,6 @@ class FillTests(TestList):
         dic[field] = value
 
     def process_spreadsheet_sheet(self, sheet):
-
         """
         Convert a single sheet into a dictionary.
 
@@ -299,7 +298,7 @@ class FillTests(TestList):
 
         print("Handling common information on test from subtests")
 
-        for testname in self.tests:
+        for testname in self.tests:                  # pylint: disable=C0206
             # Get common properties
             common = {}
             test_nr = self.tests[testname].get("Test")
@@ -363,7 +362,7 @@ class FillTests(TestList):
             for k, val in common.items():
                 self.doc[test_nr][k] = val
 
-    def update_test_file(self, testname, args):
+    def update_test_file(self, testname):
         """
         Update a C source file using the contents of self.tests as
         the source of data to be filled at the igt_doc documentation
@@ -419,7 +418,7 @@ class FillTests(TestList):
 
                 for field in sorted(fields):
                     if field not in self.update_fields:
-                            continue
+                        continue
 
                     value = subtest_content.get(field, "")
                     doc_value = doc_content.get(field, "")
@@ -472,7 +471,7 @@ class FillTests(TestList):
         except EnvironmentError:
             print(f'Failed to write to {sourcename}')
 
-    def update_test_files(self, args):
+    def update_test_files(self):
         """
         Populate all test files with the documentation from self.tests.
         """
@@ -481,7 +480,7 @@ class FillTests(TestList):
             print("Update source files")
 
         for testname in self.tests:
-            self.update_test_file(testname, args)
+            self.update_test_file(testname)
 
 ######
 # Main
@@ -525,7 +524,7 @@ def main():
         with open("doc.json", "w", encoding='utf8') as write_file:
             json.dump(fill_test.doc, write_file, indent=4)
 
-    fill_test.update_test_files(parse_args)
+    fill_test.update_test_files()
 
 
 if __name__ == '__main__':
-- 
2.43.2

