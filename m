Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154910E5CF
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:32:13 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1138B580D7D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:32:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgmx4-00ABnR-0N
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:31:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:31:51 +0200
Message-Id: <20230327133155.2428454-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/11] scripts/test_list.py: better handle
 documentation validation issues
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

Produce warnings and exit with an error when test plan is out of sync.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 73c1794caec5..7d35deda3329 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -803,16 +803,14 @@ class TestList:
                 run_missing.append(run_test)
 
         if doc_uneeded:
-            print("Unused documentation")
             for test_name in doc_uneeded:
-                print(test_name)
+                print(f"Warning: Documented {test_name} doesn't exist on source files")
 
         if run_missing:
-            if doc_uneeded:
-                print()
-            print("Missing documentation")
             for test_name in run_missing:
-                print(test_name)
+                print(f'Warning: Missing documentation for {test_name}')
+        if doc_uneeded or run_missing:
+            sys.exit(1)
 
     #
     # File handling methods
-- 
2.39.2
