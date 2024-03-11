Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C94BC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7210E9F1;
	Mon, 11 Mar 2024 13:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsqpGsfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07D710E9F1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162145; x=1741698145;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=kGcwmJZ3f3Sd/IafPHyqXK26LkFH4w7E7zJVdZSqraE=;
 b=PsqpGsfId/AGHQsh9ko20mv2u53OX8329EfJWeMbShJ3YjJhHSw+6Y7F
 AxFE9QNuXIIiFwAg4usTZ3aUt6ZcGCCpeRTCwZ4ODh9ukxluRLjWCZKDc
 Vkm0Tzchmni7ku0cbCI/ms2rhEWAFmRsfU+8vOBemupatNMkeAoz//MrR
 mh64/2tUwHVcjdy0IZTFZDXrgA4Imo9GpnZ42FGMpA9u5/pnPXpA5PDmt
 joUXTllickNKK9iasLkDoulIeDRgpwmJ/DERR/JpbZC0+Mt331p3+DUz9
 h0Pk1t6iG9P/Gg13xph74BVXm1NN380GChjMW4K6CSjJmLNE3W/ipdgWD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15960231"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15960231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11156280"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:02:25 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2197F580CBC
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 06:02:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rjfIM-000000047ci-0S2h for igt-dev@lists.freedesktop.org;
 Mon, 11 Mar 2024 14:02:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] scripts/xls_to_doc.py: use a main() function
Date: Mon, 11 Mar 2024 14:02:20 +0100
Message-ID: <20240311130220.982606-1-mauro.chehab@linux.intel.com>
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

