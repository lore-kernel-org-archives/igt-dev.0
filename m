Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0316B10E514
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 17:48:14 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 20:48:00 +0300
Message-Id: <20230403174800.19621-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
References: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/i915/perf: Convert the metric
 counters to an array as well
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

The metric counter codegen stuff can also be converted
to chunky arrays to make life easier for the C compiler.

This is more tricky that the register stuff though:
- we have a counter->metric_set backpointer
- the availability needs to be checked for each counter
- intel_perf_add_logical_counter() needs to be called for each counter

So I kept the copy for now, but now we copy from the array
elements instead of populating the thing with code. Could
perhaps get rid of the copy by splitting the counter struct
into const and non-const parts and just pointing to the
array elements instead of copying. But that is left as an
excercise for the reader.

The availability thing I converted to a function pointer.
Might not be ideal since it also prevents putting the array
into .rodata and instead it ends up in .data.rel.ro which
means more work for the dynamic linker. Side note: lambda
would sure be nice to have here...

$ size -A meson-generated_.._i915_perf_metrics_acmgt3.c.o
-.text                1228003      0
+.text                 476657      0
+.data.rel.ro          798816      0

And this is the change in build time:
$ touch lib/i915/perf-configs/perf-metricset-codegen.py
$ time ninja -Cbuild -j1

ADL:
- real	0m59,664s
+ real	0m36,788s

VLV:
- real	8m3.277s
+ real	4m1.494s

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../perf-configs/perf-metricset-codegen.py    | 81 ++++++++++++++-----
 lib/i915/perf.h                               |  2 +
 2 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 8b2c5d7b2e65..57d777bcb13a 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -39,6 +39,22 @@ semantic_type_map = {
 def output_units(unit):
     return unit.replace(' ', '_').upper()
 
+def availability_func_name(set, counter):
+    return set.gen.chipset + "_" + set.underscore_name + "_" + counter.get('symbol_name') + "_availability"
+
+def output_availability_funcs(set, counter):
+    availability = counter.get('availability')
+    if availability:
+        c("static bool " + availability_func_name(set, counter) + "(const struct intel_perf *perf) {")
+        c.indent(4)
+        set.gen.output_availability(set, availability, counter.get('name'))
+        c.indent(4)
+        c("return true;")
+        c.outdent(4)
+        c("}")
+        c("return false;")
+        c.outdent(4)
+        c("}")
 
 def output_counter_report(set, counter):
     data_type = counter.get('data_type')
@@ -56,26 +72,22 @@ def output_counter_report(set, counter):
 
     c("\n")
 
+    c("{")
+    c.indent(4)
+    c(".name = \"{0}\",\n".format(counter.get('name')))
+    c(".symbol_name = \"{0}\",\n".format(counter.get('symbol_name')))
+    c(".desc = \"{0}\",\n".format(counter.get('description')))
+    c(".type = INTEL_PERF_LOGICAL_COUNTER_TYPE_{0},\n".format(semantic_type_uc))
+    c(".storage = INTEL_PERF_LOGICAL_COUNTER_STORAGE_{0},\n".format(data_type_uc))
+    c(".unit = INTEL_PERF_LOGICAL_COUNTER_UNIT_{0},\n".format(output_units(counter.get('units'))))
+    c(".read_{0} = {1},\n".format(data_type, set.read_funcs["$" + counter.get('symbol_name')]))
+    c(".max_{0} = {1},\n".format(data_type, set.max_funcs["$" + counter.get('symbol_name')]))
+    c(".group = \"{0}\",\n".format(counter.get('mdapi_group')))
     availability = counter.get('availability')
     if availability:
-        set.gen.output_availability(set, availability, counter.get('name'))
-        c.indent(4)
-
-    c("counter = &metric_set->counters[metric_set->n_counters++];\n")
-    c("counter->metric_set = metric_set;\n")
-    c("counter->name = \"{0}\";\n".format(counter.get('name')))
-    c("counter->symbol_name = \"{0}\";\n".format(counter.get('symbol_name')));
-    c("counter->desc = \"{0}\";\n".format(counter.get('description')))
-    c("counter->type = INTEL_PERF_LOGICAL_COUNTER_TYPE_{0};\n".format(semantic_type_uc))
-    c("counter->storage = INTEL_PERF_LOGICAL_COUNTER_STORAGE_{0};\n".format(data_type_uc))
-    c("counter->unit = INTEL_PERF_LOGICAL_COUNTER_UNIT_{0};\n".format(output_units(counter.get('units'))))
-    c("counter->read_{0} = {1};\n".format(data_type, set.read_funcs["$" + counter.get('symbol_name')]))
-    c("counter->max_{0} = {1};\n".format(data_type, set.max_funcs["$" + counter.get('symbol_name')]))
-    c("intel_perf_add_logical_counter(perf, counter, \"{0}\");\n".format(counter.get('mdapi_group')))
-
-    if availability:
-        c.outdent(4)
-        c("}\n")
+        c(".availability = {0},\n".format(availability_func_name(set, counter)))
+    c.outdent(4)
+    c("},")
 
 
 def generate_metric_sets(args, gen):
@@ -97,6 +109,13 @@ def generate_metric_sets(args, gen):
     # Print out all set registration functions for each set in each
     # generation.
     for set in gen.sets:
+        counters = sorted(set.counters, key=lambda k: k.get('symbol_name'))
+
+        c("\n")
+
+        for counter in counters:
+          output_availability_funcs(set, counter)
+
         c("\nstatic void\n")
         c(gen.chipset + "_add_" + set.underscore_name + "_metric_set(struct intel_perf *perf)")
         c("{\n")
@@ -105,8 +124,6 @@ def generate_metric_sets(args, gen):
         c("struct intel_perf_metric_set *metric_set;\n")
         c("struct intel_perf_logical_counter *counter;\n\n")
 
-        counters = sorted(set.counters, key=lambda k: k.get('symbol_name'))
-
         c("metric_set = calloc(1, sizeof(*metric_set));\n")
         c("metric_set->name = \"" + set.name + "\";\n")
         c("metric_set->symbol_name = \"" + set.symbol_name + "\";\n")
@@ -171,9 +188,31 @@ def generate_metric_sets(args, gen):
         c("intel_perf_add_metric_set(perf, metric_set);");
         c("\n")
 
+        c("{")
+        c.indent(4)
+        c("static const struct intel_perf_logical_counter _counters[] = {")
+        c.indent(4)
+
         for counter in counters:
             output_counter_report(set, counter)
+        c.outdent(4)
+        c("};")
+        c("int i;")
 
+        c("for (i = 0; i < sizeof(_counters) / sizeof(_counters[0]); i++) {")
+        c.indent(4)
+        c("if (_counters[i].availability && !_counters[i].availability(perf))")
+        c.indent(4)
+        c("continue;")
+        c.outdent(4)
+        c("counter = &metric_set->counters[metric_set->n_counters++];")
+        c("*counter = _counters[i];")
+        c("counter->metric_set = metric_set;")
+        c("intel_perf_add_logical_counter(perf, counter, counter->group);")
+        c.outdent(4)
+        c("}")
+        c.outdent(4)
+        c("}")
         c("\nassert(metric_set->n_counters <= {0});\n".format(len(counters)));
 
         c.outdent(4)
@@ -246,6 +285,8 @@ def main():
         #ifndef %s
         #define %s
 
+        #include <string.h>
+
         #include "i915/perf.h"
 
         """ % (header_define, header_define)))
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 6b139f687cca..8a71ac635e78 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -207,6 +207,8 @@ struct intel_perf_logical_counter {
 	const char *name;
 	const char *symbol_name;
 	const char *desc;
+	const char *group;
+	bool (*availability)(const struct intel_perf *perf);
 	intel_perf_logical_counter_storage_t storage;
 	intel_perf_logical_counter_type_t type;
 	intel_perf_logical_counter_unit_t unit;
-- 
2.39.2
