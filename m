Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ED110E0EB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:03:37 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1C257580DBE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 03:03:36 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qpn6s-001eFj-0F
 for igt-dev@lists.freedesktop.org; Mon, 09 Oct 2023 12:03:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 12:01:38 +0200
Message-ID: <20231009100332.392968-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] scripts/test_list.py: fix and simplify
 missing doc check
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

Instead of using regexes, we can simply use sets to check what's
missing. I means an easier check and less error-prone.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index daca290a02bd..c0462188ba8a 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1105,39 +1105,13 @@ class TestList:
 
             doc_subtests.add(subtest)
 
-        doc_subtests = list(sorted(doc_subtests))
-
         # Get a list of tests from
-        run_subtests = self.get_testlist()
+        run_subtests = set(self.get_testlist())
 
-        # Compare arrays
+        # Compare sets
 
-        run_missing = []
-        doc_uneeded = []
-
-        test_regex = r""
-        for doc_test in doc_subtests:
-            if test_regex != r"":
-                test_regex += r"|"
-            test_regex += doc_test
-
-        test_regex = re.compile(r'^(' + test_regex + r')$')
-
-        for doc_test in doc_subtests:
-            found = False
-            for run_test in run_subtests:
-                if test_regex.match(run_test):
-                    found = True
-                    break
-            if not found:
-                doc_uneeded.append(doc_test)
-
-        for run_test in run_subtests:
-            found = False
-            if test_regex.match(run_test):
-                found = True
-            if not found:
-                run_missing.append(run_test)
+        run_missing = list(sorted(run_subtests - doc_subtests))
+        doc_uneeded = list(sorted(doc_subtests - run_subtests))
 
         if doc_uneeded:
             for test_name in doc_uneeded:
-- 
2.41.0
