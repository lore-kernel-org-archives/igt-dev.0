Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A0C10E1AD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:18:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.154.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2A98C580D2D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 00:18:39 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r6ROX-0008nY-02
 for igt-dev@lists.freedesktop.org; Fri, 24 Nov 2023 09:18:37 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:16:05 +0100
Message-ID: <20231124081834.33714-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
References: <20231124081834.33714-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] scripts/test_list.py: better expand
 subtests
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

Use a better regex when splitting subtests, as used when reading
testlists.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 13f788783483..5ff2b18c2dd8 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1010,6 +1010,9 @@ class TestList:
 
         order = None
 
+        if expand:
+            expand = re.compile(expand)
+
         if sort_field:
             if sort_field.lower() not in self.field_list:
                 sys.exit(f"Field '{sort_field}' is not defined")
@@ -1039,8 +1042,7 @@ class TestList:
             if sort_field:
                 if sort_field in subtest:
                     if expand:
-                        test_list = subtest[sort_field].split(expand)
-                        test_list = [s.strip() for s in test_list]
+                        test_list = expand.split(subtest[sort_field])
 
                         for test_elem in test_list:
                             if test_elem not in subtests:
@@ -1407,7 +1409,7 @@ class TestList:
 
 
         # NOTE: currently, it uses a comma for multi-value delimitter
-        test_subtests = self.get_subtests(sort_field, ",", with_order = True)
+        test_subtests = self.get_subtests(sort_field, ",\s*", with_order = True)
 
         if not os.path.exists(directory):
             os.makedirs(directory)
-- 
2.42.0
