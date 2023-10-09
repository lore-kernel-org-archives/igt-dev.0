Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA8B10E149
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 18:01:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c186ea81c7so61260741fa.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Oct 2023 11:01:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 21:01:18 +0300
Message-Id: <20231009180118.386877-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Revert "scripts/test_list.py: fix and
 simplify missing doc check"
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

This fixes the build without chamelium

This reverts commit 334a1178a36a1327dc7fbba43ab16d1f3a7d887b.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 scripts/test_list.py | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index c0462188b..daca290a0 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1105,13 +1105,39 @@ class TestList:
 
             doc_subtests.add(subtest)
 
+        doc_subtests = list(sorted(doc_subtests))
+
         # Get a list of tests from
-        run_subtests = set(self.get_testlist())
+        run_subtests = self.get_testlist()
+
+        # Compare arrays
+
+        run_missing = []
+        doc_uneeded = []
 
-        # Compare sets
+        test_regex = r""
+        for doc_test in doc_subtests:
+            if test_regex != r"":
+                test_regex += r"|"
+            test_regex += doc_test
 
-        run_missing = list(sorted(run_subtests - doc_subtests))
-        doc_uneeded = list(sorted(doc_subtests - run_subtests))
+        test_regex = re.compile(r'^(' + test_regex + r')$')
+
+        for doc_test in doc_subtests:
+            found = False
+            for run_test in run_subtests:
+                if test_regex.match(run_test):
+                    found = True
+                    break
+            if not found:
+                doc_uneeded.append(doc_test)
+
+        for run_test in run_subtests:
+            found = False
+            if test_regex.match(run_test):
+                found = True
+            if not found:
+                run_missing.append(run_test)
 
         if doc_uneeded:
             for test_name in doc_uneeded:
-- 
2.34.1
