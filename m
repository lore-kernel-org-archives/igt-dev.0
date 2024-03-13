Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E295C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 07:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A06710F6C6;
	Wed, 13 Mar 2024 07:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjlrHE/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF82E10F6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710316714; x=1741852714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=kGcwmJZ3f3Sd/IafPHyqXK26LkFH4w7E7zJVdZSqraE=;
 b=hjlrHE/tXGE5Tl0kojdLEQF6bv5Nb+rsaDn4E+rPknnKqP6mn+RBIogy
 QM/8uEDUCr2yjQDW5hanSNvs6WoeK1IOQFlpr2G5vhaKkLVHJv4nX/IJ5
 Q29f9UB9v8u4SNhMIGjK8VQ9EJrxXOyWaBDkwURrUU0yFvsynEOjsNbbi
 GmyXuRKQGJmfUzEbs23dxQcfNkW1YRhKE6ajUEu+zk6Vz+t4ZtjWuTUDf
 4rsTiYGCQMDj3AZSQCrkBuZ+Mq9yqkMwVsxgU/uQkjT6CGsedpm+P5Sam
 az31iijjeFCfZ/S9DXl/nDCbQWtDhmnNiBdSHxcI/gS8Wz1NDLHR7F84F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="27538845"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="27538845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11921926"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 00:58:18 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9D177580E15;
 Wed, 13 Mar 2024 00:58:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rkJV9-00000004frc-2n2z; Wed, 13 Mar 2024 08:58:15 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 1/6] scripts/xls_to_doc.py: use a main() function
Date: Wed, 13 Mar 2024 08:56:04 +0100
Message-ID: <20240313075813.1114081-2-mauro.chehab@linux.intel.com>
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

Move the main code to a function, called only when the script
is executed directly from command line.

That allows the method to be re-used by other scripts if needed.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 47 +++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 510ab54276ba..fdf98105cd4b 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -293,32 +293,35 @@ class FillTests(TestList):
 # Main
 ######
 
-parser = argparse.ArgumentParser(description=__doc__,
-                                    formatter_class = argparse.ArgumentDefaultsHelpFormatter,
-                                    argument_default = argparse.SUPPRESS,
-                                    epilog = EPILOG)
-parser.add_argument("--config", required = True,
-                    help="JSON file describing the test plan template")
-parser.add_argument("--xls", required = True,
-                    help="Input XLS file.")
-parser.add_argument("--sheets", nargs = "*",
-                    help="Input only some specific sheets from the XLS file.")
-parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
+def main():
+    parser = argparse.ArgumentParser(description=__doc__,
+                                        formatter_class = argparse.ArgumentDefaultsHelpFormatter,
+                                        argument_default = argparse.SUPPRESS,
+                                        epilog = EPILOG)
+    parser.add_argument("--config", required = True,
+                        help="JSON file describing the test plan template")
+    parser.add_argument("--xls", required = True,
+                        help="Input XLS file.")
+    parser.add_argument("--sheets", nargs = "*",
+                        help="Input only some specific sheets from the XLS file.")
+    parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
 
-parse_args = parser.parse_args()
+    parse_args = parser.parse_args()
 
-fill_test = FillTests(parse_args.config)
+    fill_test = FillTests(parse_args.config)
 
-if "sheets" not in parse_args:
-    parse_args.sheets = None
+    if "sheets" not in parse_args:
+        parse_args.sheets = None
 
-fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
+    fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
 
-## DEBUG: remove it later on
-with open("fill_test.json", "w", encoding='utf8') as write_file:
-    json.dump(fill_test.tests, write_file, indent = 4)
-with open("doc.json", "w", encoding='utf8') as write_file:
-    json.dump(fill_test.doc, write_file, indent = 4)
+    ## DEBUG: remove it later on
+    with open("fill_test.json", "w", encoding='utf8') as write_file:
+        json.dump(fill_test.tests, write_file, indent = 4)
+    with open("doc.json", "w", encoding='utf8') as write_file:
+        json.dump(fill_test.doc, write_file, indent = 4)
 
+    fill_test.update_test_files(parse_args)
 
-fill_test.update_test_files(parse_args)
+if __name__ == '__main__':
+    main()
-- 
2.43.2

