Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171DF10E7C2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:37:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A72B0580BEE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 05:36:52 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pmZiU-000V96-2L
 for igt-dev@lists.freedesktop.org; Wed, 12 Apr 2023 14:36:50 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:35:45 +0200
Message-Id: <20230412123544.119534-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412123544.119534-1-mauro.chehab@linux.intel.com>
References: <20230412123544.119534-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] scripts/test_list.py: use a compiled
 regex for check
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

Speed up even further the logic for --check-testlist by
pre-compiling the regex that will be used to validate the
results.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 287351e717b3..acdd1cac4c20 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -820,10 +820,18 @@ class TestList:
         run_missing = []
         doc_uneeded = []
 
+        test_regex = r""
+        for doc_test in doc_subtests:
+            if test_regex != r"":
+                test_regex += r"|"
+            test_regex += r'^' + doc_test + r'$'
+
+        test_regex = re.compile(test_regex)
+
         for doc_test in doc_subtests:
             found = False
             for run_test in run_subtests:
-                if re.match(r'^' + doc_test + r'$', run_test):
+                if re.match(test_regex, run_test):
                     found = True
                     break
             if not found:
@@ -832,7 +840,7 @@ class TestList:
         for run_test in run_subtests:
             found = False
             for doc_test in doc_subtests:
-                if re.match(r'^' + doc_test + r'$', run_test):
+                if re.match(test_regex, run_test):
                     found = True
                     break
             if not found:
-- 
2.39.2
