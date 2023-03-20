Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7B810E283
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 08:45:08 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6F981580D2C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 01:45:07 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1peB8b-0062jH-1m
 for igt-dev@lists.freedesktop.org; Mon, 20 Mar 2023 09:45:05 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Mar 2023 09:45:00 +0100
Message-Id: <20230320084500.1434535-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
References: <20230320084500.1434535-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] testplan: build also a PDF file with
 the testplan
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

PDF files are easier to share, and it costs almost nothing to
produce them with Sphinx using rst2pdf. So, add support for it,
if rst2pdf is installed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 11c08573307e..65bb6c31cd65 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -4,6 +4,7 @@ build_testplan = get_option('testplan')
 build_sphinx = get_option('sphinx')
 
 rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
+rst2pdf = find_program('rst2pdf')
 sphinx = find_program('sphinx-build', required: build_sphinx)
 
 stylesheet = meson.current_source_dir() + '/testplan.css'
@@ -46,14 +47,30 @@ if sphinx.found()
                                 )
 
         custom_target('index.html',
-                    build_by_default : true,
-                    command : [ 'sphinx-build', '-c', meson.current_source_dir(), meson.current_build_dir(), sphinx_out_dir],
-                    input : index_rst,
-                    output : 'index.html'
-                    )
+                      build_by_default : true,
+                      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
+                      meson.current_build_dir(), sphinx_out_dir],
+                      input : index_rst,
+                      output : 'index.html'
+                      )
+    endif
+
+    if rst2pdf.found()
+        sphinx_out_pdf = meson.current_build_dir() + '/pdf'
+
+        custom_target('xe_tests.pdf',
+                      build_by_default : true,
+                      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
+                      '-b', 'pdf',
+                      '-D', 'version=' + meson.project_version(),
+                      meson.current_build_dir(), sphinx_out_pdf],
+                      input : index_rst,
+                      output : 'xe_tests.pdf'
+                      )
     endif
 endif
 
 build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
 build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
 build_info += 'Build indexed html testplan documentation: @0@'.format(sphinx.found())
+build_info += 'Build pdf testplan documentation: @0@'.format(sphinx.found() and rst2pdf.found())
-- 
2.39.2
