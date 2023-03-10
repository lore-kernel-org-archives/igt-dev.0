Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39E10E323
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:18 +0100
Message-Id: <20230310194125.14781-13-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 12/19] testplan/meson.build: add targets
 to build Xe test documentation
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

Produce documentation from igt_doc.py markups inside the Xe driver
at build time.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 docs/testplan/meson.build | 59 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 docs/testplan/meson.build

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
new file mode 100644
index 0000000000..11c0857330
--- /dev/null
+++ b/docs/testplan/meson.build
@@ -0,0 +1,59 @@
+testplan_title = 'IGT test plans'
+
+build_testplan = get_option('testplan')
+build_sphinx = get_option('sphinx')
+
+rst2html = find_program('rst2html-3', 'rst2html', required : build_testplan)
+sphinx = find_program('sphinx-build', required: build_sphinx)
+
+stylesheet = meson.current_source_dir() + '/testplan.css'
+
+test_dict = { 'xe_tests': {
+                 'input': xe_test_config, 'extra_args': []
+              }
+            }
+
+if igt_doc_script.found()
+    foreach testplan, fields: test_dict
+        rst = custom_target(testplan + '.rst',
+                            build_by_default : true,
+                            command : [ igt_doc_script, '--config', '@INPUT@', '--rest', '@OUTPUT@' ] + fields['extra_args'],
+                            depends : test_executables,
+                            input : fields['input'],
+                            output : testplan + '.rst'
+                            )
+
+        if rst2html.found()
+            custom_target(testplan + '.html',
+                          build_by_default : true,
+                          command : [ rst2html, '--stylesheet=' + stylesheet, '--field-name-limit=0', '@INPUT@', '@OUTPUT@' ],
+                          input : rst,
+                          output : testplan + '.html'
+                          )
+        endif
+    endforeach
+endif
+
+if sphinx.found()
+    if gen_rst_index.found()
+        sphinx_out_dir = meson.current_build_dir()+ '/indexed_html'
+
+        index_rst = custom_target('index.rst',
+                                build_by_default : true,
+                                command : [ gen_rst_index, testplan_title, test_dict.keys(), meson.current_build_dir()],
+                                input : rst,
+                                output : 'index.rst'
+                                )
+
+        custom_target('index.html',
+                    build_by_default : true,
+                    command : [ 'sphinx-build', '-c', meson.current_source_dir(), meson.current_build_dir(), sphinx_out_dir],
+                    input : index_rst,
+                    output : 'index.html'
+                    )
+    endif
+endif
+
+build_info += 'Build ReST test documentation: @0@'.format(igt_doc_script.found())
+build_info += 'Build simple html testplan documentation: @0@'.format(rst2html.found())
+build_info += 'Build indexed html testplan documentation: @0@'.format(sphinx.found())
-- 
2.34.1
