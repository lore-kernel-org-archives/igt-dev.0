Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7C410E0BF
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 17:48:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 20:47:58 +0300
Message-Id: <20230403174800.19621-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
References: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/i915/perf: Stop generating silly C
 code
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Seems a bit weird to use use python to generate C code that
generates arrays of registers. Just generate those arrays
straight from python.

$ size -A meson-generated_.._i915_perf_registers_acmgt3.c
-.text                1737442      0
+.text                 257871      0
+.rodata               820776      0

$ du -h build/lib/libi915_perf.so.1.5
- 23M   build/lib/libi915_perf.so.1.5
+ 19M   build/lib/libi915_perf.so.1.5

And the change in build time:
$ touch lib/i915/perf-configs/perf-registers-codegen.py
$ time ninja -C build -j1

ADL:
- real  2m32,251s
+ real  1m8,984s

VLV:
- real	19m14.999s
+ real	8m3.277s

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/i915/perf-configs/perf-registers-codegen.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/i915/perf-configs/perf-registers-codegen.py b/lib/i915/perf-configs/perf-registers-codegen.py
index 19f09d7a897c..bde3d14323d3 100644
--- a/lib/i915/perf-configs/perf-registers-codegen.py
+++ b/lib/i915/perf-configs/perf-registers-codegen.py
@@ -68,9 +68,19 @@ def generate_register_configs(set):
             set.gen.output_availability(set, availability, register_config.get('type') + ' register config')
             c.indent(4)
 
+        c("{")
+        c.indent(4)
+        c("static const struct intel_perf_register_prog _%s[] = {" % t)
+        c.indent(4)
         for register in register_config.findall('register'):
-            c("metric_set->%s[metric_set->n_%s++] = (struct intel_perf_register_prog) { .reg = %s, .val = %s };" %
-              (t, t, register.get('address'), register.get('value')))
+            c("{ .reg = %s, .val = %s }," %
+              (register.get('address'), register.get('value')))
+        c.outdent(4)
+        c("};")
+        c("memcpy(metric_set->%s, _%s, sizeof(_%s));" % (t, t, t))
+        c("metric_set->n_%s = sizeof(_%s) / sizeof(_%s[0]);" % (t, t, t))
+        c.outdent(4)
+        c("}")
 
         if availability:
             c.outdent(4)
@@ -146,6 +156,7 @@ def main():
     c(copyright)
     c("\n")
     c("#include <stdlib.h>")
+    c("#include <string.h>")
     c("\n")
     c("#include \"%s\"" % header_file)
     c("#include \"i915/perf.h\"")
-- 
2.39.2
