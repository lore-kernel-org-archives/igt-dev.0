Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D4D10E246
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 09:13:57 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B2434580AE0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 02:13:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qImxo-002tLK-2S
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 11:13:48 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 11:13:47 +0200
Message-Id: <20230710091347.689384-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/test_list.py: fix
 __filter_subtest() logic
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

The logic there is searching a value at the wrong place, as
"test" variable at the callers are a number inside doc.test
array. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 19ed5e5467f5..4f580fb3de58 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -569,7 +569,7 @@ class TestList:
 
             subtest_array = self.expand_subtest(fname, name, test, subtest_only)
             for subtest in subtest_array:
-                if self.__filter_subtest(test, subtest, True):
+                if self.__filter_subtest(self.doc[test], subtest, True):
                     continue
 
                 summary = subtest["Summary"]
@@ -851,7 +851,7 @@ class TestList:
         subtest_array.sort(key = lambda x : x.get('Summary'))
 
         for subtest in subtest_array:
-            if self.__filter_subtest(test, subtest, True):
+            if self.__filter_subtest(self.doc[test], subtest, True):
                 continue
 
             if sort_field:
-- 
2.40.1
