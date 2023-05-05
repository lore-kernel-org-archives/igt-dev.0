Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976C10E5F2
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 12:46:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.18.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0146B580BB9
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 05:46:47 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1puuph-001Nks-0C
 for igt-dev@lists.freedesktop.org; Fri, 05 May 2023 14:46:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 May 2023 14:46:41 +0200
Message-Id: <20230505124643.327813-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230505124643.327813-1-mauro.chehab@linux.intel.com>
References: <20230505124643.327813-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] testplan/meson.build: add i915 support
 for a testplan document
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

Prepare to support documenting the i915 tests via in-code macros, in a
similar way to how Xe tests are documented.

For now, don't enable checking i915 documentation here, as this
may consume a lot of build time on desktops.

Please notice that we had to exclude documentation for
gem_concurrent_all.c, as there are too many subtests there:

	${build}/tests/gem_concurrent_all --list|wc -l
	428400

Adding documentation for all of them (even with wildcards) would
produce a very big document, seriously affecting build time.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/conf.py            |  2 +-
 docs/testplan/meson.build        | 10 ++--
 tests/i915/i915_test_config.json | 88 ++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 5 deletions(-)
 create mode 100644 tests/i915/i915_test_config.json

diff --git a/docs/testplan/conf.py b/docs/testplan/conf.py
index a73ad99b09b6..a7db5c3a230d 100644
--- a/docs/testplan/conf.py
+++ b/docs/testplan/conf.py
@@ -68,5 +68,5 @@ htmlhelp_basename = 'IGT'
 
 # rst2pdf
 pdf_documents = [
-    ('index', u'xe_tests', u'IGT Xe Tests', u'IGT authors'),
+    ('index', u'tests', u'IGT Xe Tests', u'IGT authors'),
 ]
diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index e36713960ccd..bc022ae50e08 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -7,6 +7,7 @@ rst2pdf = find_program('rst2pdf', required: false)
 stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
+i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.json')
 
 check_testlist = []
 if build_tests
@@ -22,8 +23,9 @@ else
 	doc_dependencies = []
 endif
 
-test_dict = { 'xe_tests':
-		{ 'input': xe_test_config, 'extra_args': check_testlist }
+test_dict = {
+		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
+		'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
 	    }
 
 foreach testplan, fields: test_dict
@@ -68,14 +70,14 @@ if sphinx.found()
 	if rst2pdf.found()
 		sphinx_out_pdf = meson.current_build_dir() + '/pdf'
 
-		custom_target('xe_tests.pdf',
+		custom_target('tests.pdf',
 			      build_by_default : true,
 			      command : [ 'sphinx-build', '-c', meson.current_source_dir(),
 					  '-b', 'pdf',
 					  '-D', 'version=' + meson.project_version(),
 					  meson.current_build_dir(), sphinx_out_pdf],
 			      input : index_rst,
-			      output : 'xe_tests.pdf'
+			      output : 'tests.pdf'
 			     )
 	endif
 endif
diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
new file mode 100644
index 000000000000..812cb73b9f52
--- /dev/null
+++ b/tests/i915/i915_test_config.json
@@ -0,0 +1,88 @@
+{
+    "description": "JSON file to be used to parse i915 documentation",
+    "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
+               "../core_getstats.c", "../core_getversion.c",
+               "../core_hotunplug.c", "../core_setmaster.c",
+               "../core_setmaster_vs_auth.c", "../debugfs_test.c",
+               "../device_reset.c", "../dmabuf.c",
+               "../drm_import_export.c", "../drm_mm.c",
+               "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
+               "../prime_mmap_coherency.c", "../prime_self_import.c",
+               "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
+               "../syncobj_timeline.c", "../syncobj_wait.c",
+               "../vgem_basic.c", "../vgem_slow.c" ],
+    "exclude_files": [ "kms_*", "gem_concurrent_all.c" ],
+    "fields": {
+	"Mega feature": {
+                "_properties_": {
+                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
+                },
+                "Category": {
+                "_properties_": {
+                    "description": "Contains the major group for the tested functionality"
+                },
+
+                "Sub-category": {
+                    "_properties_": {
+                        "description": "Contains the minor group of the functionality"
+                    },
+                    "Functionality": {
+                        "_properties_": {
+                            "description": "Describes the functionality to be tested"
+                        },
+                        "Feature": {
+                            "_properties_": {
+                                "description": "Describes the lowest level feature bucket"
+                            },
+                            "Run type": {
+                                "_properties_": {
+                                    "description": "Defines what category of testlist it belongs"
+                                }
+                            }
+                        }
+                    }
+                }
+            }
+        },
+        "Test category": {
+            "_properties_": {
+                "description": "Defines the test category. Usually used at subtest level."
+            }
+        },
+        "Test requirement": {
+            "_properties_": {
+                "description": "Defines Kernel parameters required for the test to run"
+            }
+        },
+        "Issue": {
+            "_properties_": {
+                "description": "If the test is used to solve an issue, point to the URL containing the issue."
+            }
+        },
+        "GPU excluded platform": {
+            "_properties_": {
+                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+            }
+        },
+        "GPU requirement": {
+            "_properties_": {
+                "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
+            }
+        },
+        "Depends on" : {
+            "_properties_": {
+                "description": "List other subtests that are required to not be skipped before calling this one."
+            }
+        },
+        "TODO": {
+            "_properties_": {
+                "description": "Point to known missing features at the test or subtest."
+            }
+        },
+        "Description" : {
+            "_properties_": {
+                "description": "Provides a description for the test/subtest."
+            }
+        }
+    }
+}
-- 
2.40.1
