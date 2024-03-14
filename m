Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C545C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C2B10FA42;
	Thu, 14 Mar 2024 10:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPxFGRQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFDA10FA3B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=N2gFPPlVR8fZWeHvW6AZ773K7oC085I3fKFjGwOyGvM=;
 b=kPxFGRQFfz26052E65SIPltx/xcRI8d4bWxdqLYGFC6G3SSkfiH8qd3C
 kJva72l5KCcmfPoOGtlBHTHf5/eriV0XXC1LFCfoxgNlC+Uwx+U0BJIOX
 5S5tlpHsWV5eVZfaoX0tRYgyJ+M+/mcPJ9sV+DTzOBIchpIZD4IONKc0d
 ktQg9qlNPfhRTJsLdpV1EI9bvl8pC9sV48PHrV0WMIgA5buEqgT41s7YD
 fj5ycODbHwRtW/vzEHW+m919SNO+K5i699eXn7/ECBoNGXqYF0kxuo3oE
 ul09Xm36tiVc59sDa2KGG1V4Nczs7RW0NKGq+2jiTnykeuFVHmy9bv5le Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345270"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171353"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:20 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2E399580E6E;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVb-0v19; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 04/10] scripts/xls_to_doc.py: detect field removal
Date: Thu, 14 Mar 2024 11:29:13 +0100
Message-ID: <20240314103014.1170437-5-mauro.chehab@linux.intel.com>
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

Eventually, a field may have been removed. Add support for
detecting it at the write logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 5e79a725c1d3..a090dcffe98e 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -37,6 +37,8 @@ class FillTests(TestList):
         # Read current documentation
         TestList.__init__(self, config_path)
 
+        self.orig_doc = self.doc.copy()
+
         self.testname_regex = re.compile(r'^\s*(igt@[^\n\@]+)\@?(\S*)\s*')
         self.key_has_wildcard = re.compile(r'\%?arg\[(\d+)\]')
         self.field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
@@ -202,7 +204,8 @@ class FillTests(TestList):
 
                     content[i] = ""
 
-        content.insert(i, f' * {field}: {value}\n')
+        if value != "":
+            content.insert(i, f' * {field}: {value}\n')
 
     def parse_spreadsheet(self, fname, sheets=None):
         """
@@ -265,6 +268,8 @@ class FillTests(TestList):
 
             test_nr = self.tests[testname]["Test"]
 
+            doc_content = self.orig_doc[test_nr]
+
             for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
                 if "line" not in subtest_content:
                     print(f"Warning: didn't find where {subtest} is documented.")
@@ -280,26 +285,29 @@ class FillTests(TestList):
                         print(f"Warning: test {testname}, subtest {subtest} is not documented.")
                     continue
 
-                doc_content = self.doc[test_nr]["subtest"][subtest_nr]
+                doc_content = self.orig_doc[test_nr]["subtest"][subtest_nr]
 
-                # Handling wildcards is not easy. Let's just skip those
-                for field, value in sorted(subtest_content.items()):
-                    if field in ['line', 'subtest_nr']:
+                fields = set(subtest_content.keys()) | set(doc_content.keys())
+
+                for field in sorted(fields):
+                    if field not in self.props:
                         continue
 
                     if args.ignore_lists:
                         if field in self.ignore_fields:
                             continue
 
-                    doc_value = doc_content.get(field)
-                    if doc_value:
-                        if self.key_has_wildcard.search(doc_value):
-                            print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
-                            continue
-                        if doc_value == value:
-                            if self.verbose > 1:
-                                print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
-                            continue
+                    value = subtest_content.get(field, "")
+                    doc_value = doc_content.get(field, "")
+
+                    # Handling wildcards is not easy. Let's just skip those
+                    if self.key_has_wildcard.search(doc_value):
+                        print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
+                        continue
+                    if doc_value == value:
+                        if self.verbose > 1:
+                            print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
+                        continue
 
                     if self.verbose > 0:
                         print(f"Update {testname}@{subtest} field {field} on line {line}:")
-- 
2.43.2

