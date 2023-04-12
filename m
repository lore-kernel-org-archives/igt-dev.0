Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33E010E7D4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:50:38 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.30.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 949E4580D77
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 05:50:37 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Apr 2023 14:50:33 +0200
Message-Id: <20230412125033.120215-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230412125033.120215-1-mauro.chehab@linux.intel.com>
References: <20230412125033.120215-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] scripts/test_list.py: use a compiled
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
 scripts/test_list.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 287351e717b3..96d8883db122 100755
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
@@ -831,10 +839,8 @@ class TestList:
 
         for run_test in run_subtests:
             found = False
-            for doc_test in doc_subtests:
-                if re.match(r'^' + doc_test + r'$', run_test):
-                    found = True
-                    break
+            if re.match(test_regex, run_test):
+                found = True
             if not found:
                 run_missing.append(run_test)
 
-- 
2.39.2
