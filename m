Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7489510E28B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 08:07:35 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.7.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BC306580DA3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 01:07:33 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qBWOh-00Ghs7-0E
 for igt-dev@lists.freedesktop.org; Tue, 20 Jun 2023 10:07:31 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:07:27 +0200
Message-Id: <20230620080729.3981834-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230620080729.3981834-1-mauro.chehab@linux.intel.com>
References: <20230620080729.3981834-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] scripts/test_list.py: add support for
 ordering testlists
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

Testlists usually require an special order, like:
- an initial test which loads the driver;
- normal tests;
- dangerous tests (like KUnit ones).

Add support to handle order, by adding an "order" property at
the config file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 55 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index f676024c9571..76fdcf3dbb4f 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -819,18 +819,25 @@ class TestList:
     # Subtest list methods
     #
 
-    def get_subtests(self, sort_field = None, expand = None):
+    def get_subtests(self, sort_field = None, expand = None, with_order = False):
 
         """Return an array with all subtests"""
 
         subtests = {}
         subtests[""] = []
 
+        order = None
+
         if sort_field:
             if sort_field.lower() not in self.field_list:
                 sys.exit(f"Field '{sort_field}' is not defined")
             sort_field = self.field_list[sort_field.lower()]
 
+            if with_order:
+                if "_properties_" in self.props[sort_field]:
+                    if "order" in self.props[sort_field]["_properties_"]:
+                        order = self.props[sort_field]["_properties_"]["order"]
+
         for test in sorted(self.doc.keys()):
             fname = self.doc[test]["File"]
 
@@ -848,20 +855,54 @@ class TestList:
                     if sort_field in subtest:
                         if expand:
                             test_list = subtest[sort_field].split(expand)
+                            test_list = [s.strip() for s in test_list]
+
                             for test_elem in test_list:
-                                test_elem = test_elem.strip()
                                 if test_elem not in subtests:
                                     subtests[test_elem] = []
-                                subtests[test_elem].append(subtest["Summary"])
+                                if order:
+                                    subtests[test_elem].append((subtest["Summary"], test_list))
+                                else:
+                                    subtests[test_elem].append(subtest["Summary"])
                         else:
                             if subtest[sort_field] not in subtests:
                                 subtests[subtest[sort_field]] = []
-                            subtests[subtest[sort_field]].append(subtest["Summary"])
+                                if order:
+                                    subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
+                                else:
+                                    subtests[subtest[sort_field]].append(subtest["Summary"])
+                    else:
+                        if order:
+                            subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
+                        else:
+                            subtests[""].append(subtest["Summary"])
+
+                else:
+                    if order:
+                        subtests[test_elem].append((subtest["Summary"], [subtest[sort_field]]))
                     else:
                         subtests[""].append(subtest["Summary"])
 
-                else:
-                    subtests[""].append(subtest["Summary"])
+        if order:
+            for group, tests in subtests.items():
+                prefix_tests = []
+                suffix_tests = []
+                middle_tests = []
+                is_prefix = True
+                for k in order:
+                    if k == "__all__":
+                        is_prefix = False
+                        continue
+                    for test in tests:
+                        if k in test[1]:
+                            if is_prefix:
+                                prefix_tests.append(test[0])
+                            else:
+                                suffix_tests.append(test[0])
+                for test in tests:
+                    if test[0] not in prefix_tests and test[0] not in suffix_tests:
+                        middle_tests.append(test[0])
+                subtests[group] = prefix_tests + middle_tests + suffix_tests
 
         return subtests
 
@@ -1203,7 +1244,7 @@ class TestList:
         test_prefix = re.sub(r'^igt@', '', test_prefix)
 
         # NOTE: currently, it uses a comma for multi-value delimitter
-        test_subtests = self.get_subtests(sort_field, ",")
+        test_subtests = self.get_subtests(sort_field, ",", with_order = True)
 
         if not os.path.exists(directory):
             os.makedirs(directory)
-- 
2.40.1
