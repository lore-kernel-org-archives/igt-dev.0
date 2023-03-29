Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293E810E16A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 11:19:59 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 13:19:53 +0200
Message-Id: <20230329111954.2584660-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
References: <20230329111954.2584660-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] conf.py: add some
 backward-compatibility bits
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

Currently, Sphinx 1.6 fails to build the documentation and produces
an ugly warning.

Add compatibility bits to avoid it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/conf.py | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
index cfb866cc7a15..98cd7a51ff18 100644
--- a/docs/testplan/conf.py
+++ b/docs/testplan/conf.py
@@ -1,10 +1,15 @@
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
-import sys
 import os
+import sphinx
+import sys
+
 from shutil import which
 
+# Get Sphinx version
+major, minor, patch = sphinx.version_info[:3]
+
 extensions = []
 
 if which('rst2pdf'):
@@ -21,21 +26,33 @@ language = 'en'
 exclude_patterns = []
 todo_include_todos = False
 
+if major < 2 and minor < 6:
+    html_use_smartypants = False
+else:
+    smartquotes = False
+
 html_theme = "nature"
 
+# body_max_width causes build error with nature theme on version < 1.7
+if major < 2 and minor < 7:
+    html_theme_options = {
+        "sidebarwidth": "400px",
+    }
+else:
+    html_theme_options = {
+        "body_max_width": "1520px",
+        "sidebarwidth": "400px",
+    }
+
+print("Theme: %s" % html_theme)
+
 html_css_files = []
 html_static_path = ['.']
 html_copy_source = False
 
-html_use_smartypants = False
 html_sidebars = { '**': ['searchbox.html', 'localtoc.html']}
 htmlhelp_basename = 'IGT'
 
-html_theme_options = {
-    "body_max_width": "1520px",
-    "sidebarwidth": "400px",
-}
-
 # rst2pdf
 pdf_documents = [
     ('index', u'xe_tests', u'IGT Xe Tests', u'IGT authors'),
-- 
2.39.2
