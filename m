Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2610E16A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 11:19:59 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 13:19:54 +0200
Message-Id: <20230329111954.2584660-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
References: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] docs/testplan/conf.py: avoid using
 shutil include
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

This is not available at the builtin python libraries. Avoid
needing it in order to make easier to build with Ubuntu 18.04.

So, use the suggestion for which() from:
	https://stackoverflow.com/questions/377017/test-if-executable-exists-in-python

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/conf.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
index 98cd7a51ff18..a73ad99b09b6 100644
--- a/docs/testplan/conf.py
+++ b/docs/testplan/conf.py
@@ -5,13 +5,28 @@ import os
 import sphinx
 import sys
 
-from shutil import which
-
 # Get Sphinx version
 major, minor, patch = sphinx.version_info[:3]
 
 extensions = []
 
+def which(program):
+    import os
+    def is_exe(fpath):
+        return os.path.isfile(fpath) and os.access(fpath, os.X_OK)
+
+    fpath, fname = os.path.split(program)
+    if fpath:
+        if is_exe(program):
+            return program
+    else:
+        for path in os.environ["PATH"].split(os.pathsep):
+            exe_file = os.path.join(path, program)
+            if is_exe(exe_file):
+                return exe_file
+
+    return None
+
 if which('rst2pdf'):
     extensions.append('rst2pdf.pdfbuilder')
 
@@ -44,8 +59,6 @@ else:
         "sidebarwidth": "400px",
     }
 
-print("Theme: %s" % html_theme)
-
 html_css_files = []
 html_static_path = ['.']
 html_copy_source = False
-- 
2.39.2
