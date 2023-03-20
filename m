Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A0710E291
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 08:45:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6C5F4580C1F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 01:45:07 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1peB8b-0062jE-1h
 for igt-dev@lists.freedesktop.org; Mon, 20 Mar 2023 09:45:05 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Mar 2023 09:44:59 +0100
Message-Id: <20230320084500.1434535-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
References: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] meson: build Xe test documentation
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

Add the remaining changes at meson for it to build Xe documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/meson.build           |  1 +
 docs/testplan/conf.py      | 41 ++++++++++++++++++++++++++++++++++++
 docs/testplan/testplan.css |  7 +++++++
 meson_options.txt          |  8 +++++++
 scripts/gen_rst_index      | 43 ++++++++++++++++++++++++++++++++++++++
 scripts/meson.build        |  3 +++
 6 files changed, 103 insertions(+)
 create mode 100644 docs/testplan/conf.py
 create mode 100644 docs/testplan/testplan.css
 create mode 100755 scripts/gen_rst_index

diff --git a/docs/meson.build b/docs/meson.build
index ead14c4015d9..01edf64f04a8 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1 +1,2 @@
 subdir('reference')
+subdir('testplan')
diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
new file mode 100644
index 000000000000..26243ff8bd88
--- /dev/null
+++ b/docs/testplan/conf.py
@@ -0,0 +1,41 @@
+# -*- coding: utf-8 -*-
+
+import sys
+import os
+from shutil import which
+
+extensions = []
+
+if which('rst2pdf'):
+    extensions.append('rst2pdf.pdfbuilder')
+
+source_suffix = '.rst'
+master_doc = 'index'
+
+project = 'IGT Test Tools'
+copyright = 'Intel'
+author = 'IGT developers'
+language = 'en'
+
+exclude_patterns = []
+todo_include_todos = False
+
+html_theme = "nature"
+
+html_css_files = []
+html_static_path = ['.']
+html_copy_source = False
+
+html_use_smartypants = False
+html_sidebars = { '**': ['searchbox.html', 'localtoc.html']}
+htmlhelp_basename = 'IGT'
+
+html_theme_options = {
+    "body_max_width": "1520px",
+    "sidebarwidth": "400px",
+}
+
+# rst2pdf
+pdf_documents = [
+    ('index', u'xe_tests', u'IGT Xe Tests', u'IGT authors'),
+]
diff --git a/docs/testplan/testplan.css b/docs/testplan/testplan.css
new file mode 100644
index 000000000000..8aa7b7105c19
--- /dev/null
+++ b/docs/testplan/testplan.css
@@ -0,0 +1,7 @@
+@import url(html4css1.css);
+
+.literal {
+	background: lightgrey;
+        color: darkblue;
+        font-size: 14px;
+}
diff --git a/meson_options.txt b/meson_options.txt
index d978813b4feb..d4e373d6cfc4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -20,6 +20,14 @@ option('man',
        type : 'feature',
        description : 'Build man pages')
 
+option('testplan',
+       type : 'feature',
+       description : 'Build testplan documentation pages in ReST and html')
+
+option('sphinx',
+       type : 'feature',
+       description : 'Build testplan documentation using Sphinx')
+
 option('docs',
        type : 'feature',
        description : 'Build documentation')
diff --git a/scripts/gen_rst_index b/scripts/gen_rst_index
new file mode 100755
index 000000000000..34955a35a443
--- /dev/null
+++ b/scripts/gen_rst_index
@@ -0,0 +1,43 @@
+#!/bin/bash -e
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+## Copyright (C) 2023    Intel Corporation                 ##
+## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
+##                                                         ##
+## Small script to produce a ReST index file               ##
+
+if [ $# -lt 3 ]; then
+	echo 'Usage: $0: <title> <files> <dest_dir>' >&2
+	exit 1
+fi
+
+title=$1
+shift
+
+args=( "$@" )
+
+dest_dir=${args[${#args[@]}-1]}
+unset args[${#args[@]}-1]
+
+if [ ! -d $dest_dir ]; then
+	echo "Error: $dest_dir directory doesn't exist" >&2
+	exit 1
+fi
+
+dest_file="$dest_dir/index.rst"
+
+echo $title > "$dest_file"
+len=${#title}
+for i in $(seq 1 $len); do
+	echo -n "=" >> "$dest_file"
+done
+echo >> "$dest_file"
+echo >> "$dest_file"
+
+echo ".. toctree::" >> "$dest_file"
+echo "   :maxdepth: 1" >> "$dest_file"
+echo >> "$dest_file"
+
+for i in "${!args[@]}"; do
+	echo "   ${args[$i]}" >> "$dest_file"
+done
diff --git a/scripts/meson.build b/scripts/meson.build
index 342972e66078..ce12aa02e946 100644
--- a/scripts/meson.build
+++ b/scripts/meson.build
@@ -11,3 +11,6 @@ if build_tests
 		install_data(prog, install_dir : bindir, install_mode : 'r-xr-xr-x')
 	endforeach
 endif
+
+igt_doc_script = find_program('igt_doc.py')
+gen_rst_index = find_program('gen_rst_index')
-- 
2.39.2
