Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6322310E162
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:41:41 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A4A3E580D55
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 04:41:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pc322-002j4C-21
 for igt-dev@lists.freedesktop.org; Tue, 14 Mar 2023 12:41:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 12:41:23 +0100
Message-Id: <20230314114127.649447-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230314114127.649447-1-mauro.chehab@linux.intel.com>
References: <20230314114127.649447-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] scripts/igt_doc.py: move show_subtests
 logic to the class
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
