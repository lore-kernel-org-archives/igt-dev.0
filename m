Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1372E10EB82
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 22:55:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 15:55:21 -0700
Message-Id: <20230323225534.3739835-18-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
References: <20230323225534.3739835-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 17/30] lib/i915/perf: Choose OAM format
 for media metrics
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

If the metric set has OAM format defined, update the generated metrics
accordingly.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/perf-configs/codegen.py              |  4 +++
 lib/i915/perf-configs/mdapi-xml-convert.py    |  1 +
 .../perf-configs/perf-metricset-codegen.py    | 36 ++++++++++++-------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 755142cc..020e76ef 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -117,6 +117,10 @@ class Set:
     def underscore_name(self):
         return self.xml.get('underscore_name')
 
+    @property
+    def oa_format(self):
+        return self.xml.get('oa_format')
+
     def findall(self, path):
         return self.xml.findall(path)
 
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 5c784643..3b7d0663 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -659,6 +659,7 @@ for arg in args.xml:
         set.set('symbol_name', set_symbol_name)
         set.set('underscore_name', underscore(mdapi_set.get('SymbolName')))
         set.set('mdapi_supported_apis', strip_dx_apis(mdapi_set.get('SupportedAPI')))
+        set.set('oa_format', oa_format)
 
 
         # Look at the hardware register config before looking at the counters.
diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 08351309..8b2c5d7b 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -128,18 +128,30 @@ def generate_metric_sets(args, gen):
 
             """))
         elif gen.chipset.startswith("acm") or gen.chipset.startswith("mtl"):
-            c(textwrap.dedent("""\
-                metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
-
-                metric_set->perf_raw_size = 256;
-                metric_set->gpu_time_offset = 0;
-                metric_set->gpu_clock_offset = 1;
-                metric_set->a_offset = 2;
-                metric_set->b_offset = metric_set->a_offset + 38;
-                metric_set->c_offset = metric_set->b_offset + 8;
-                metric_set->perfcnt_offset = metric_set->c_offset + 8;
-
-            """))
+            if set.oa_format == "128B_MPEC8_NOA16":
+                c(textwrap.dedent("""\
+                    metric_set->perf_oa_format = I915_OAM_FORMAT_MPEC8u32_B8_C8;
+
+                    metric_set->perf_raw_size = 128;
+                    metric_set->gpu_time_offset = 0;
+                    metric_set->gpu_clock_offset = 1;
+                    metric_set->a_offset = 2;
+                    metric_set->b_offset = metric_set->a_offset + 8;
+                    metric_set->c_offset = metric_set->b_offset + 8;
+                    metric_set->perfcnt_offset = metric_set->c_offset + 8;
+                """))
+            else:
+                c(textwrap.dedent("""\
+                    metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+
+                    metric_set->perf_raw_size = 256;
+                    metric_set->gpu_time_offset = 0;
+                    metric_set->gpu_clock_offset = 1;
+                    metric_set->a_offset = 2;
+                    metric_set->b_offset = metric_set->a_offset + 38;
+                    metric_set->c_offset = metric_set->b_offset + 8;
+                    metric_set->perfcnt_offset = metric_set->c_offset + 8;
+                """))
         else:
             c(textwrap.dedent("""\
                 metric_set->perf_oa_format = I915_OA_FORMAT_A32u40_A4u32_B8_C8;
-- 
2.36.1
