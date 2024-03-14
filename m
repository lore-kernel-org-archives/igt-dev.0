Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E420C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7F10FA39;
	Thu, 14 Mar 2024 10:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhS2k/Am";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D362010FA35
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412222; x=1741948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=hWpDcyiHOF+eE1qdTBlZ0qEOvsAORqB6OJUd1IenbYU=;
 b=BhS2k/Am4I23uuwuDH3aiVKgKyWNhNqCpb94m2hkagwc1+ePzvH+lmpm
 sSGdFs9yjBmU/ea4I3Kq8EouM/wl2uC32MKMc2NtvjruHWyXNB6+gstMY
 XCWc0I5TeV4zu969heczqeD0w6HTlYb/mAEHDKH8qPljCF+AB91pFu5d0
 uOqDQL7Cyrz9T0LnBoVspAT49UZmbzhv1rk6daAX9TzsQcXjpgbsZeENf
 m1DT6eElnOb+jaP1PrfQxB4uLi1etqjVpkfrF3R4U+tPgrJv7zBxxTtia
 f5HJuXNp2ACFE0kpi483lnTepu+Sxd35kJaISYlGlg837/1TLWfBS7Ka7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5345274"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5345274"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43171359"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:30:21 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 45BBB580F06;
 Thu, 14 Mar 2024 03:30:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkiLq-00000004uVq-1HGW; Thu, 14 Mar 2024 11:30:18 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 09/10] scripts/xls_to_doc.py: better handle common
 attributes
Date: Thu, 14 Mar 2024 11:29:18 +0100
Message-ID: <20240314103014.1170437-10-mauro.chehab@linux.intel.com>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 03feae5834d7..60f7536c8839 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -31,9 +31,10 @@ class FillTests(TestList):
     def __init__(self, config_path, verbose):
         self.tests = {}
         self.spreadsheet_data = {}
-        self.ignore_fields = []
         self.verbose = verbose
 
+        self.update_fields = []
+
         # Read current documentation
         TestList.__init__(self, config_path)
 
@@ -78,7 +79,9 @@ class FillTests(TestList):
             if "sublevel" in item["_properties_"]:
                 update = item["_properties_"].get("update-from-file")
                 if update:
-                    self.ignore_fields.append(field)
+                    continue
+
+            self.update_fields.append(field)
 
     def add_field(self, dic, field, value):
         """
@@ -276,8 +279,22 @@ class FillTests(TestList):
 
             test_nr = self.tests[testname]["Test"]
 
+            # Update common fields
             doc_content = self.orig_doc[test_nr]
+            fields = set(self.doc[test_nr].keys()) | set(doc_content.keys())
 
+            for field in sorted(fields):
+                if field not in self.update_fields:
+                    continue
+
+                value = self.doc[test_nr].get(field, "")
+                doc_value = doc_content.get(field, "")
+
+                if doc_value == value:
+                    continue
+
+
+            # Update subtest fields
             for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
                 if "line" not in subtest_content:
                     print(f"Warning: didn't find where {subtest} is documented.")
@@ -298,11 +315,7 @@ class FillTests(TestList):
                 fields = set(subtest_content.keys()) | set(doc_content.keys())
 
                 for field in sorted(fields):
-                    if field not in self.props:
-                        continue
-
-                    if args.ignore_lists:
-                        if field in self.ignore_fields:
+                    if field not in self.update_fields:
                             continue
 
                     value = subtest_content.get(field, "")
-- 
2.43.2

