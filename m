Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777D66EB4F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:55 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:41 +0300
Message-Id: <20210423074444.175199-6-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] lib/i915/perf-config: don't forget to
 resolve single variable
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

In the case where an expression is a single variable like
expression="$EuThreadsCount" we should resolve that last variable to a
codegen expression.

Take the opportunity to uniformize the hash table keys (require "$"
prefix everywhere).

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/codegen.py              | 45 ++++++++++++-------
 .../perf-configs/perf-metricset-codegen.py    |  4 +-
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 7d5cb3af5..c0b22977c 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -94,8 +94,8 @@ class Set:
             counter = Counter(self, xml_counter)
             self.counters.append(counter)
             self.counter_vars["$" + counter.get('symbol_name')] = counter
-            self.max_funcs[counter.get('symbol_name')] = counter.max_sym
-            self.read_funcs[counter.get('symbol_name')] = counter.read_sym
+            self.max_funcs["$" + counter.get('symbol_name')] = counter.max_sym
+            self.read_funcs["$" + counter.get('symbol_name')] = counter.read_sym
 
         for counter in self.counters:
             counter.compute_hashes()
@@ -256,6 +256,13 @@ class Gen:
     def splice_ugte(self, args):
         return self.brkt(args[1]) + " >= " + self.brkt(args[0])
 
+    def resolve_variable(self, name, set):
+        if name in self.hw_vars:
+            return self.hw_vars[name]['c']
+        if name in set.counter_vars:
+            return set.read_funcs[name] + "(perf, metric_set, accumulator)"
+        return None
+
     def output_rpn_equation_code(self, set, counter, equation):
         self.c("/* RPN equation: " + equation + " */")
         tokens = equation.split()
@@ -272,13 +279,10 @@ class Gen:
                 for i in range(0, argc):
                     operand = stack.pop()
                     if operand[0] == "$":
-                        if operand in self.hw_vars:
-                            operand = self.hw_vars[operand]['c']
-                        elif operand in set.counter_vars:
-                            reference = set.counter_vars[operand]
-                            operand = set.read_funcs[operand[1:]] + "(perf, metric_set, accumulator)"
-                        else:
+                        resolved_variable = self.resolve_variable(operand, set)
+                        if resolved_variable == None:
                             raise Exception("Failed to resolve variable " + operand + " in equation " + equation + " for " + set.name + " :: " + counter.get('name'));
+                        operand = resolved_variable
                     args.append(operand)
 
                 tmp_id = callback(tmp_id, args)
@@ -293,10 +297,11 @@ class Gen:
 
         value = stack[-1]
 
-        if value in self.hw_vars:
-            value = self.hw_vars[value]['c']
-        if value in set.counter_vars:
-            value = set.read_funcs[value[1:]] + "(perf, metric_set, accumulator)"
+        if value[0] == "$":
+            resolved_variable = self.resolve_variable(value, set)
+            if resolved_variable == None:
+                raise Exception("Failed to resolve variable " + value + " in expression " + expression + " for " + set.name + " :: " + counter_name)
+            value = resolved_variable
 
         self.c("\nreturn " + value + ";")
 
@@ -313,10 +318,10 @@ class Gen:
                 for i in range(0, argc):
                     operand = stack.pop()
                     if operand[0] == "$":
-                        if operand in self.hw_vars:
-                            operand = self.hw_vars[operand]['c']
-                        else:
+                        resolved_variable = self.resolve_variable(operand, set)
+                        if resolved_variable == None:
                             raise Exception("Failed to resolve variable " + operand + " in expression " + expression + " for " + set.name + " :: " + counter_name)
+                        operand = resolved_variable
                     args.append(operand)
 
                 subexp = callback(args)
@@ -328,7 +333,15 @@ class Gen:
                     counter_name + ".\nThis is probably due to some unhandled RPN operation, in the expression \"" +
                     expression + "\"")
 
-        return stack[-1]
+        value = stack[-1]
+
+        if value[0] == "$":
+            resolved_variable = self.resolve_variable(value, set)
+            if resolved_variable == None:
+                raise Exception("Failed to resolve variable " + value + " in expression " + expression + " for " + set.name + " :: " + counter_name)
+            value = resolved_variable
+
+        return value
 
     def output_availability(self, set, availability, counter_name):
         expression = self.splice_rpn_expression(set, counter_name, availability)
diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 63616c41d..00528c316 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -69,8 +69,8 @@ def output_counter_report(set, counter):
     c("counter->type = INTEL_PERF_LOGICAL_COUNTER_TYPE_{0};\n".format(semantic_type_uc))
     c("counter->storage = INTEL_PERF_LOGICAL_COUNTER_STORAGE_{0};\n".format(data_type_uc))
     c("counter->unit = INTEL_PERF_LOGICAL_COUNTER_UNIT_{0};\n".format(output_units(counter.get('units'))))
-    c("counter->read_{0} = {1};\n".format(data_type, set.read_funcs[counter.get('symbol_name')]))
-    c("counter->max_{0} = {1};\n".format(data_type, set.max_funcs[counter.get('symbol_name')]))
+    c("counter->read_{0} = {1};\n".format(data_type, set.read_funcs["$" + counter.get('symbol_name')]))
+    c("counter->max_{0} = {1};\n".format(data_type, set.max_funcs["$" + counter.get('symbol_name')]))
     c("intel_perf_add_logical_counter(perf, counter, \"{0}\");\n".format(counter.get('mdapi_group')))
 
     if availability:
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
