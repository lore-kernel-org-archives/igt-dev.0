Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E2CC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7C510F6C7;
	Wed, 13 Mar 2024 07:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ7qByQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97C10F6C6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316712; x=1741852712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=vhRWIhUidyNl547CaQbH1RTtyJBjqHsf0FxVmue9HaU=;
 b=NJ7qByQN96x5X3WI7TB3Ckivt2Xz2/okehJJxCCybwQgJj98mrzYy6in
 Dpx0U4xuH72Q8tl8YW4Jar6HyxAAVFCABT26xHMv0Mw9Eu+t5PPV0c0ad
 Wd/0RwGizCE4wNwFo067uEJhagG2ZVA7EoB5C07UlEBaqmuPvHkLtq9ej
 q91S2D/eaePz57+C9rjdm0VYBllOpaPEY+nxLtYWvTjqyJxvRd16Zoqd/
 fZNIrJyi766UEiJsh9MrHVGtBHIZ4L64PtO0BFCpClQMHYZ4ehVFwAEZE
 8zIOCe6BqD5CHuAJwq9YV6JtE95uJT+kH7E4iAPwJbj2tJ0dGBPAhEXWd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27538844"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27538844"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11921924"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A7528580E3B;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004fri-2wxU; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 3/6] scripts/xls_to_doc.py: cleanup argparse logic
Date: Wed, 13 Mar 2024 08:56:06 +0100
Message-ID: <20240313075813.1114081-4-mauro.chehab@linux.intel.com>
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

- add a new parameter to optionally generate JSON debug files;
- don't use default formatter;
- don't use args SUPRESS;
- don't use an empty epilog.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 696fccd64a2b..7ea92a344aff 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -17,8 +17,6 @@ from openpyxl import load_workbook
 
 from test_list import TestList
 
-EPILOG = ""
-
 #
 # FillTests class definition
 #
@@ -300,10 +298,7 @@ class FillTests(TestList):
 
 
 def main():
-    parser = argparse.ArgumentParser(description=__doc__,
-                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter,
-                                     argument_default=argparse.SUPPRESS,
-                                     epilog=EPILOG)
+    parser = argparse.ArgumentParser(description=__doc__)
     parser.add_argument("--config", required=True,
                         help="JSON file describing the test plan template")
     parser.add_argument("--xls", required=True,
@@ -312,21 +307,24 @@ def main():
                         help="Input only some specific sheets from the XLS file.")
     parser.add_argument('--ignore-lists', action='store_false', default=True,
                         help='Ignore fields that are updated via test lists')
+    parser.add_argument("--store-json", action="store_true",
+                        help="Generate JSON files with documentation. Useful for debugging purposes.")
+
 
     parse_args = parser.parse_args()
 
     fill_test = FillTests(parse_args.config)
 
-    if "sheets" not in parse_args:
-        parse_args.sheets = None
-
     fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
 
-    # DEBUG: remove it later on
-    with open("fill_test.json", "w", encoding='utf8') as write_file:
-        json.dump(fill_test.tests, write_file, indent=4)
-    with open("doc.json", "w", encoding='utf8') as write_file:
-        json.dump(fill_test.doc, write_file, indent=4)
+    if "store_json" in parse_args:
+        print("Generating fill_test.json debug file")
+        with open("fill_test.json", "w", encoding='utf8') as write_file:
+            json.dump(fill_test.tests, write_file, indent=4)
+
+        print("Generating doc.json debug file")
+        with open("doc.json", "w", encoding='utf8') as write_file:
+            json.dump(fill_test.doc, write_file, indent=4)
 
     fill_test.update_test_files(parse_args)
 
-- 
2.43.2

