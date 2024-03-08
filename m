Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69223C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 10:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138710E9CC;
	Fri,  8 Mar 2024 10:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktgeC0No";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57E210E9CC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709892578; x=1741428578;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=RVPh+o6xw7AVM6H10VC5peW9/I8KWD4lcDNlBiFvZDQ=;
 b=ktgeC0No98HZoaMdm2LveJof7O9O0bXlKCRm/zDszNPCezYyBEA23gLt
 RPN0PXjyhd6lYP2NwKHNxeTdnNM+C4908AK8+UPQx7sVLWSorK7eZ7AQA
 fyubpispS+H9cQVqzJpe8zRhfve8cnC0/YPttD7nCpCFSYbBsDiJsfgsU
 tsZ/K8z2J3jBT0onkBDL5J183+2gbTU/z4g3TteqxCdgs+fkuF3FcPk1H
 RcH7xCW6qCHw9V28vTe9hKAfgbB2yRYfoTW7d45fY52da9Uf7qxT2L2fT
 ZsS7uojMhIftFobJ2nQU0fCNNEV7ry2DKsLReEKjHbwxxyWyKhCixjbmQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8427393"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8427393"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10429890"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:38 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DFE71580E0F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 02:09:36 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1riXAV-00000003pHx-07EX for igt-dev@lists.freedesktop.org;
 Fri, 08 Mar 2024 11:09:35 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] scripts/xls_to_doc.py: ignore fields filled by
 lists by default
Date: Fri,  8 Mar 2024 11:07:44 +0100
Message-ID: <20240308100933.912014-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
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

Currently, some parmeters like Run Type are imported from files.
Don't add documentation for them by default, preserving the way
it was originally meant to be filled.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 91440ac6291f..510ab54276ba 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -24,6 +24,7 @@ class FillTests(TestList):
     def __init__(self, config_path):
         self.tests = {}
         self.spreadsheet_data = {}
+        self.ignore_fields = []
 
         TestList.__init__(self, config_path)
 
@@ -62,6 +63,12 @@ class FillTests(TestList):
 
                 self.tests[testname]["subtests"][subtest] = subtest_dict
 
+        for field, item in self.props.items():
+            if "sublevel" in item["_properties_"]:
+                    update = self.props[field]["_properties_"].get("update-from-file")
+                    if update:
+                        self.ignore_fields.append(field)
+
     def add_field(self, dic, field, value):
         if field in dic and dic[field] != '':
             fields = sorted(dic[field].split(", "))
@@ -198,7 +205,7 @@ class FillTests(TestList):
             for key, value in row.items():
                 self.tests[testname]["subtests"][subtest][key] = value
 
-    def update_test_file(self, testname):
+    def update_test_file(self, testname, args):
         try:
 #            print(f"Updating {testname}")
 
@@ -230,6 +237,11 @@ class FillTests(TestList):
                 for field, value in sorted(subtest_content.items()):
                     if field in [ 'line', 'subtest_nr' ]:
                         continue
+
+                    if args.ignore_lists:
+                        if field in  self.ignore_fields:
+                            continue
+
                     doc_value = doc_content.get(field)
                     if doc_value:
                         if self.key_has_wildcard.search(doc_value):
@@ -270,19 +282,20 @@ class FillTests(TestList):
         except EnvironmentError:
             print(f'Failed to write to {sourcename}')
 
-    def update_test_files(self):
+    def update_test_files(self, args):
 
         """ Populate documentation """
 
         for testname in self.tests:
-            self.update_test_file(testname)
+            self.update_test_file(testname, args)
 
 ######
 # Main
 ######
 
 parser = argparse.ArgumentParser(description=__doc__,
-                                    formatter_class = argparse.RawDescriptionHelpFormatter,
+                                    formatter_class = argparse.ArgumentDefaultsHelpFormatter,
+                                    argument_default = argparse.SUPPRESS,
                                     epilog = EPILOG)
 parser.add_argument("--config", required = True,
                     help="JSON file describing the test plan template")
@@ -290,11 +303,15 @@ parser.add_argument("--xls", required = True,
                     help="Input XLS file.")
 parser.add_argument("--sheets", nargs = "*",
                     help="Input only some specific sheets from the XLS file.")
+parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
 
 parse_args = parser.parse_args()
 
 fill_test = FillTests(parse_args.config)
 
+if "sheets" not in parse_args:
+    parse_args.sheets = None
+
 fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
 
 ## DEBUG: remove it later on
@@ -304,4 +321,4 @@ with open("doc.json", "w", encoding='utf8') as write_file:
     json.dump(fill_test.doc, write_file, indent = 4)
 
 
-fill_test.update_test_files()
+fill_test.update_test_files(parse_args)
-- 
2.43.2

