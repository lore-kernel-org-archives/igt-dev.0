Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6910E0D5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 05:42:27 +0000 (UTC)
Received: from linux.intel.com (mwrzeszc-mobl1.ger.corp.intel.com
 [10.252.27.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CC017580B9E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:42:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phl3I-00B50c-2b
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 07:42:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 07:42:11 +0200
Message-Id: <20230330054221.2640814-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/12] scripts/igt_doc.py: move
 show_subtests logic to the class
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

Simplify the main code and avoid warnings about global vars with
pylint by moving its code to a separate function.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/igt_doc.py | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 67ab7984dd11..cc2768ae0847 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -1018,6 +1018,25 @@ class TestList:
                 sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
                          (self.config_fname, file_line))
 
+    def show_subtests(self, sort_field, filter_field):
+
+        """Show subtests, allowing sort and filter a field """
+
+        if sort_field:
+            test_subtests = tests.get_subtests(sort_field, filter_field)
+            for val_key in sorted(test_subtests.keys()):
+                if not test_subtests[val_key]:
+                    continue
+                if val_key == "":
+                    print("not defined:")
+                else:
+                    print(f"{val_key}:")
+                    for sub in test_subtests[val_key]:
+                        print (f"  {sub}")
+        else:
+            for sub in tests.get_subtests(sort_field, filter_field)[""]:
+                print (sub)
+
 #
 # Main
 #
@@ -1056,20 +1075,7 @@ tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files)
 RUN = 0
 if parse_args.show_subtests:
     RUN = 1
-    if parse_args.sort_field:
-        test_subtests = tests.get_subtests(parse_args.sort_field, parse_args.filter_field)
-        for val_key in sorted(test_subtests.keys()):
-            if not test_subtests[val_key]:
-                continue
-            if val_key == "":
-                print("not defined:")
-            else:
-                print(f"{val_key}:")
-            for sub in test_subtests[val_key]:
-                print (f"  {sub}")
-    else:
-        for sub in tests.get_subtests(parse_args.sort_field, parse_args.filter_field)[""]:
-            print (sub)
+    tests.show_subtests(parse_args.sort_field, parse_args.filter_field)
 
 if parse_args.check_testlist:
     RUN = 1
-- 
2.39.2
