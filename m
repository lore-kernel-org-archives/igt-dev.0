Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE0C10E075
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 05:42:29 +0000 (UTC)
Received: from linux.intel.com (mwrzeszc-mobl1.ger.corp.intel.com
 [10.252.27.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0A8ED580D96
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:42:27 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phl3I-00B50w-2p
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 07:42:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 07:42:16 +0200
Message-Id: <20230330054221.2640814-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
References: <20230330054221.2640814-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 07/12] scripts/test_list.py: better
 handle documentation validation issues
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
