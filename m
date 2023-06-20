Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7C10E28B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 08:55:29 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.7.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CCB32580BF0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 01:55:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qBX92-00GiTY-1O
 for igt-dev@lists.freedesktop.org; Tue, 20 Jun 2023 10:55:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:55:22 +0200
Message-Id: <20230620085522.3984101-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
References: <20230620085522.3984101-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] scripts/test_list.py: produce
 alphabetically ordered testlists
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

Before start handling the subtest arrays, order it, in order
it alphabetically.

This should produce a better ordered testlist.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 59 +++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 76fdcf3dbb4f..a55d2977c7c3 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -838,6 +838,7 @@ class TestList:
                     if "order" in self.props[sort_field]["_properties_"]:
                         order = self.props[sort_field]["_properties_"]["order"]
 
+        subtest_array = []
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
 
@@ -845,44 +846,46 @@ class TestList:
             test_name = re.sub(r'\.[ch]', '', test_name)
             test_name = "igt@" + test_name
 
-            subtest_array = self.expand_subtest(fname, test_name, test, True)
+            subtest_array += self.expand_subtest(fname, test_name, test, True)
 
-            for subtest in subtest_array:
-                if self.__filter_subtest(test, subtest, True):
-                    continue
+        subtest_array.sort(key = lambda x : x.get('Summary'))
 
-                if sort_field:
-                    if sort_field in subtest:
-                        if expand:
-                            test_list = subtest[sort_field].split(expand)
-                            test_list = [s.strip() for s in test_list]
+        for subtest in subtest_array:
+            if self.__filter_subtest(test, subtest, True):
+                continue
 
-                            for test_elem in test_list:
-                                if test_elem not in subtests:
-                                    subtests[test_elem] = []
-                                if order:
-                                    subtests[test_elem].append((subtest["Summary"], test_list))
-                                else:
-                                    subtests[test_elem].append(subtest["Summary"])
-                        else:
-                            if subtest[sort_field] not in subtests:
-                                subtests[subtest[sort_field]] = []
-                                if order:
-                                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
-                                else:
-                                    subtests[subtest[sort_field]].append(subtest["Summary"])
+            if sort_field:
+                if sort_field in subtest:
+                    if expand:
+                        test_list = subtest[sort_field].split(expand)
+                        test_list = [s.strip() for s in test_list]
+
+                        for test_elem in test_list:
+                            if test_elem not in subtests:
+                                subtests[test_elem] = []
+                            if order:
+                                subtests[test_elem].append((subtest["Summary"], test_list))
+                            else:
+                                subtests[test_elem].append(subtest["Summary"])
                     else:
-                        if order:
-                            subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
-                        else:
-                            subtests[""].append(subtest["Summary"])
-
+                        if subtest[sort_field] not in subtests:
+                            subtests[subtest[sort_field]] = []
+                            if order:
+                                subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
+                            else:
+                                subtests[subtest[sort_field]].append(subtest["Summary"])
                 else:
                     if order:
                         subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
                     else:
                         subtests[""].append(subtest["Summary"])
 
+            else:
+                if order:
+                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
+                else:
+                    subtests[""].append(subtest["Summary"])
+
         if order:
             for group, tests in subtests.items():
                 prefix_tests = []
-- 
2.40.1
