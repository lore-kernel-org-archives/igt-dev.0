Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E9510E361
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 09:07:44 +0000 (UTC)
Received: from linux.intel.com (ksebasti-mobl.ger.corp.intel.com
 [10.252.18.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4DFFE580D9C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 02:07:42 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pwJJs-004rJV-0V
 for igt-dev@lists.freedesktop.org; Tue, 09 May 2023 11:07:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 11:07:33 +0200
Message-Id: <20230509090738.1157939-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/6] scripts/test_list.py: expand
 testlist fields
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

We're about to add support for i915 testlists. On those,
it is possible to have functionalities mapped to different
buckets, as the same test could be used to test multiple
parts of the driver/hardware.

So, for instance, the subtest igt@prime_vgem@basic-fence-mmap
actually tests two features:
	- gtt
	- prime

A description of such test will then be mapped as:

	* SUBTEST: basic-fence-mmap
	* Description: Examine GTT access path fencing.
	* Feature: gtt, prime

In order to be able to generate per-feature testlists, we
need to expand the Feature field, using the separator field
(currently a comma) to expand the test lists.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 9a909e3640f6..e68a4cb3df71 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -762,7 +762,7 @@ class TestList:
     # Subtest list methods
     #
 
-    def get_subtests(self, sort_field = None):
+    def get_subtests(self, sort_field = None, expand = None):
 
         """Return an array with all subtests"""
 
@@ -789,10 +789,17 @@ class TestList:
 
                 if sort_field:
                     if sort_field in subtest:
-                        if subtest[sort_field] not in subtests:
-                            subtests[subtest[sort_field]] = []
-
-                        subtests[subtest[sort_field]].append(subtest["Summary"])
+                        if expand:
+                            test_list = subtest[sort_field].split(expand)
+                            for test_elem in test_list:
+                                test_elem = test_elem.strip()
+                                if test_elem not in subtests:
+                                    subtests[test_elem] = []
+                                subtests[test_elem].append(subtest["Summary"])
+                        else:
+                            if subtest[sort_field] not in subtests:
+                                subtests[subtest[sort_field]] = []
+                            subtests[subtest[sort_field]].append(subtest["Summary"])
                     else:
                         subtests[""].append(subtest["Summary"])
 
@@ -1132,7 +1139,8 @@ class TestList:
         test_prefix = os.path.commonprefix(self.get_subtests()[""])
         test_prefix = re.sub(r'^igt@', '', test_prefix)
 
-        test_subtests = self.get_subtests(sort_field)
+        # NOTE: currently, it uses a comma for multi-value delimitter
+        test_subtests = self.get_subtests(sort_field, ",")
 
         if not os.path.exists(directory):
             os.makedirs(directory)
-- 
2.40.1
