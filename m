Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08310E700
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:13 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:59 +0000
Message-Id: <20221010181300.513297-34-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 33/34] lib/i915: prepare codegen for new
 ACM/DG2 variables
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/codegen.py              | 84 +++++++++++++++----
 .../perf-configs/perf-metricset-codegen.py    | 13 +++
 2 files changed, 81 insertions(+), 16 deletions(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 93a2df4a..755142cc 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -1,3 +1,4 @@
+import re
 import xml.etree.ElementTree as et
 
 class Codegen:
@@ -123,6 +124,51 @@ class Set:
         return self.xml.find(path)
 
 
+hw_vars_mapping = {
+    "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
+    "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
+    "$EuSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
+    "$EuDualSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
+    "$EuDualSubslicesSlice0123Count": { 'c': "perf->devinfo.n_eu_sub_slices_half_slices" },
+    "$EuThreadsCount": { 'c': "perf->devinfo.eu_threads_count" },
+
+    "$VectorEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
+    "$VectorEnginePerXeCoreCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
+    "$VectorEngineThreadsCount": { 'c': "perf->devinfo.eu_threads_count" },
+
+    "$SliceMask": { 'c': "perf->devinfo.slice_mask" },
+    "$SliceTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
+
+    "$SubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
+    "$DualSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
+
+    "$GtSliceMask": { 'c': "perf->devinfo.slice_mask" },
+    "$GtSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
+    "$GtDualSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
+
+    "$GtXeCoreMask": { 'c': "perf->devinfo.slice_mask" },
+    "$XeCoreMask": { 'c': "perf->devinfo.slice_mask" },
+    "$XeCoreTotalCount": { 'c': 'perf->devinfo.n_eu_sub_slices' },
+
+    "$GpuTimestampFrequency": { 'c': "perf->devinfo.timestamp_frequency" },
+    "$GpuMinFrequency": { 'c': "perf->devinfo.gt_min_freq" },
+    "$GpuMaxFrequency": { 'c': "perf->devinfo.gt_max_freq" },
+    "$SkuRevisionId": { 'c': "perf->devinfo.revision" },
+    "$QueryMode": { 'c': "perf->devinfo.query_mode" },
+}
+
+def is_hw_var(name):
+    m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
+    if m:
+        return True
+    m = re.search('\$GtSlice([0-9]+)$', name)
+    if m:
+        return True
+    m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
+    if m:
+        return True
+    return name in hw_vars_mapping
+
 class Gen:
     def __init__(self, filename, c):
         self.filename = filename
@@ -163,23 +209,11 @@ class Gen:
         self.exp_ops["ULTE"] = (2, self.splice_ulte)
         self.exp_ops["ULT"]  = (2, self.splice_ult)
         self.exp_ops["&&"]   = (2, self.splice_logical_and)
+        self.exp_ops["<<"]   = (2, self.splice_lshft)
+        self.exp_ops[">>"]   = (2, self.splice_rshft)
+        self.exp_ops["UMUL"] = (2, self.splice_uml)
 
-        self.hw_vars = {
-            "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
-            "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
-            "$EuSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
-            "$EuDualSubslicesTotalCount": { 'c': "perf->devinfo.n_eu_sub_slices" },
-            "$EuDualSubslicesSlice0123Count": { 'c': "perf->devinfo.n_eu_sub_slices_half_slices" },
-            "$EuThreadsCount": { 'c': "perf->devinfo.eu_threads_count" },
-            "$SliceMask": { 'c': "perf->devinfo.slice_mask" },
-            "$DualSubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
-            "$SubsliceMask": { 'c': "perf->devinfo.subslice_mask" },
-            "$GpuTimestampFrequency": { 'c': "perf->devinfo.timestamp_frequency" },
-            "$GpuMinFrequency": { 'c': "perf->devinfo.gt_min_freq" },
-            "$GpuMaxFrequency": { 'c': "perf->devinfo.gt_max_freq" },
-            "$SkuRevisionId": { 'c': "perf->devinfo.revision" },
-            "$QueryMode": { 'c': "perf->devinfo.query_mode" },
-        }
+        self.hw_vars = hw_vars_mapping
 
     def emit_fadd(self, tmp_id, args):
         self.c("double tmp{0} = {1} + {2};".format(tmp_id, args[1], args[0]))
@@ -286,11 +320,29 @@ class Gen:
     def splice_ugt(self, args):
         return self.brkt(args[1]) + " > " + self.brkt(args[0])
 
+    def splice_lshft(self, args):
+        return '(' + self.brkt(args[1]) + " << " + self.brkt(args[0]) + ')'
+
+    def splice_rshft(self, args):
+        return '(' + self.brkt(args[1]) + " >> " + self.brkt(args[0]) + ')'
+
+    def splice_uml(self, args):
+        return self.brkt(args[1]) + " * " + self.brkt(args[0])
+
     def resolve_variable(self, name, set):
         if name in self.hw_vars:
             return self.hw_vars[name]['c']
         if name in set.counter_vars:
             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
+        m = re.search('\$GtSlice([0-9]+)$', name)
+        if m:
+            return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
+        m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
+        if m:
+            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
+        m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
+        if m:
+            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
         return None
 
     def output_rpn_equation_code(self, set, counter, equation):
diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 00528c31..80b01be5 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -126,6 +126,19 @@ def generate_metric_sets(args, gen):
                 metric_set->c_offset = metric_set->b_offset + 8;
                 metric_set->perfcnt_offset = metric_set->c_offset + 8;
 
+            """))
+        elif gen.chipset.startswith("acm"):
+            c(textwrap.dedent("""\
+                metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+
+                metric_set->perf_raw_size = 256;
+                metric_set->gpu_time_offset = 0;
+                metric_set->gpu_clock_offset = 1;
+                metric_set->a_offset = 2;
+                metric_set->b_offset = metric_set->a_offset + 38;
+                metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->c_offset + 8;
+
             """))
         else:
             c(textwrap.dedent("""\
-- 
2.25.1
