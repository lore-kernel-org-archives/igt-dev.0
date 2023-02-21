Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1710E301
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 08:36:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.8.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A5FE7580DAF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 00:35:46 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pUO7k-004Wws-2X
 for igt-dev@lists.freedesktop.org; Tue, 21 Feb 2023 09:35:44 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 09:35:41 +0100
Message-Id: <20230221083541.1079643-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
References: <20230221083541.1079643-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] scripts/igt_doc.py: add error handler
 for subprocess
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

Handle exceptions when trying to excecute IGT runner.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 9280be743524..c6b0ed30fcbc 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -697,14 +697,15 @@ class TestList:
             doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
 
         # Get a list of tests from
-        result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",  # pylint: disable=W1510
-                                "-L", "-t",  self.min_test_prefix,
-                                f"{IGT_BUILD_PATH}/tests"],
-                                capture_output = True, text = True)
-        if result.returncode:
-            print( result.stdout)
-            print("Error:", result.stderr)
-            sys.exit(result.returncode)
+        try:
+            result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
+                                    "-L", "-t",  self.min_test_prefix,
+                                    f"{IGT_BUILD_PATH}/tests"], check = True,
+                                    capture_output = True, text = True)
+        except subprocess.CalledProcessError as sub_err:
+            print(sub_err.stderr)
+            print("Error:", sub_err)
+            sys.exit(1)
 
         run_subtests = sorted(result.stdout.splitlines())
 
-- 
2.39.2
