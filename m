Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502910E430
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 10:29:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 15:54:51 +0530
Message-Id: <20230504102451.3047783-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
References: <20230504102451.3047783-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/3] scripts/test_list: Ignore non-XE tests for
 missing documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

To add the test file to tests_config.json, documentation is
mandatory for all the subtests, else we'll end up with the
compilation failure.

It's completely make sense to consider the documentation as
mandatory for newly created test files like xe_*.c. But for
existing files, it is very painful to add the documentation
for all the subtests in that file.

Example: tests/kms_flip.c
It has N number of subtests, but we are using 2-3 subtests
for BAT. Will slowly add the documentation for remaining
subtests.

So, for non-XE subtests, don't fail the compilation for
missing documentation. Once the documentation is done for
all the subtests we can revert this patch.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 scripts/test_list.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 1c5e195eb..3c959d6b9 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -876,11 +876,16 @@ class TestList:
             if not found:
                 doc_uneeded.append(doc_test)
 
+        xe_regex = r"^(igt@xe_.*@.*$)"
         for run_test in run_subtests:
             found = False
             if re.match(test_regex, run_test):
                 found = True
-            if not found:
+            #
+            # FIXME: Drop this XE specific check once documentation is done
+            # for all subtests.
+            #
+            if not found and re.match(xe_regex, run_test):
                 run_missing.append(run_test)
 
         if doc_uneeded:
-- 
2.40.0


