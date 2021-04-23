Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33116EB50
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:57 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:43 +0300
Message-Id: <20210423074444.175199-8-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/i915/perf: have python scripts a
 custom_target input
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

That way when changing the scripts, the generated files are
regenerated.

This change makes python3 an explicit hard dependency, but that was
already the case for lib/i915/perf.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/meson.build | 25 ++++++++++++-------------
 meson.build     |  4 ++--
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 9929520e7..d5a1c9707 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -231,47 +231,46 @@ i915_perf_hardware = [
 
 i915_xml_files = []
 foreach hw : i915_perf_hardware
-  i915_xml_files += 'i915/perf-configs/oa-@0@.xml'.format(hw)
+  i915_xml_files += files('i915/perf-configs/oa-@0@.xml'.format(hw))
 endforeach
 
 i915_perf_files += custom_target(
   'i915-perf-equations',
-  input : i915_xml_files,
+  input : [ 'i915/perf-configs/perf-equations-codegen.py' ] + i915_xml_files,
   output : [ 'i915_perf_equations.c', 'i915_perf_equations.h' ],
   command : [
-    find_program('i915/perf-configs/perf-equations-codegen.py'),
+    python3, '@INPUT0@',
     '--code', '@OUTPUT0@',
     '--header', '@OUTPUT1@',
-    '@INPUT@',
+    i915_xml_files,
   ])
 
-i915_perf_register_codegen = find_program('i915/perf-configs/perf-registers-codegen.py')
-i915_perf_metrics_codegen = find_program('i915/perf-configs/perf-metricset-codegen.py')
-
 foreach hw : i915_perf_hardware
   i915_perf_files += custom_target(
     'i915-perf-registers-@0@'.format(hw),
-    input : 'i915/perf-configs/oa-@0@.xml'.format(hw),
+    input : [ 'i915/perf-configs/perf-registers-codegen.py',
+              'i915/perf-configs/oa-@0@.xml'.format(hw) ],
     output : [ 'i915_perf_registers_@0@.c'.format(hw),
                'i915_perf_registers_@0@.h'.format(hw), ],
     command : [
-      i915_perf_register_codegen,
+      python3, '@INPUT0@',
       '--code', '@OUTPUT0@',
       '--header', '@OUTPUT1@',
-      '--xml-file', '@INPUT@'
+      '--xml-file', '@INPUT1@'
     ])
   i915_perf_files += custom_target(
     'i915-perf-metrics-@0@'.format(hw),
-    input : 'i915/perf-configs/oa-@0@.xml'.format(hw),
+    input : [ 'i915/perf-configs/perf-metricset-codegen.py',
+              'i915/perf-configs/oa-@0@.xml'.format(hw) ],
     output : [ 'i915_perf_metrics_@0@.c'.format(hw),
                'i915_perf_metrics_@0@.h'.format(hw), ],
     command : [
-      i915_perf_metrics_codegen,
+      python3, '@INPUT0@',
       '--code', '@OUTPUT0@',
       '--header', '@OUTPUT1@',
       '--equations-include', 'i915_perf_equations.h',
       '--registers-include', 'i915_perf_registers_@0@.h'.format(hw),
-      '--xml-file', '@INPUT@',
+      '--xml-file', '@INPUT1@',
     ])
 endforeach
 
diff --git a/meson.build b/meson.build
index 376fe80a6..10fff5879 100644
--- a/meson.build
+++ b/meson.build
@@ -262,6 +262,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
+python3 = find_program('python3', required : true)
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -316,8 +317,7 @@ subdir('overlay')
 subdir('man')
 
 gtk_doc = dependency('gtk-doc', required : build_docs)
-python3 = find_program('python3', required : build_docs)
-if build_tests and gtk_doc.found() and python3.found()
+if build_tests and gtk_doc.found()
 	subdir('docs')
 elif build_docs.enabled()
 	error('Documentation requires building tests')
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
