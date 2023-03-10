Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3A10E97A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:23:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:14 +0100
Message-Id: <20230310082326.12088-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/18] scripts/igt_doc.py: add error handler
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
index 712e22c9d3..c06c6e4eae 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -754,14 +754,15 @@ class TestList:
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
2.34.1
