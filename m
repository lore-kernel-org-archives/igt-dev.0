Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721A2C25B7E
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746C610E295;
	Fri, 24 May 2024 03:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOppxn8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E010E1AF
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520490; x=1748056490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=h4D5r1AI95EnbjoqWpsb+CNavMlRhwqTGbxckBtR5cQ=;
 b=hOppxn8sFq4kGUDG/K1s+v8XpavCdAYvHSfzNCIxj22ejd/z4OLpb+9L
 cixfczduGcHQjjPZejV3Hi6GjmPjDn0f+f5tuLJc5EFoCYHfCcoh/nnji
 yvPNvxX+oDwM8jRqzpVtrOX4S9cYdB1fAaYuFQWCYE+7wQ8oEzLuBj3pj
 bjK2Ihvg8BTyEJulOM3QuMuTOy2PJMw3qC5cQ5Tz4e5jC1OEvdt4ez6BC
 KxiJf5SRdAV+ZXoj1INc3QAU79cY+8ueCuDPmEd3K83gPqVLv79uxPIXu
 OvNLoAJRXQ/xD7lVl3mjbXS6FsYpsH2TqX8tlx0QrIatCq9UlPDaRTRCm g==;
X-CSE-ConnectionGUID: ja+VwCftRNi1ywOE0oRFUA==
X-CSE-MsgGUID: ZF/cTGouSvCtGAv+5LwVhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384627"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: XYzTqOOkQk6b2EOKKvZNnw==
X-CSE-MsgGUID: Pdsyy1h9REOA0PYJaUC1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413519"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/23] lib/xe/oa: Switch generated files to Xe namespace
Date: Thu, 23 May 2024 20:14:22 -0700
Message-ID: <20240524031439.106332-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The Xe IGT library occupies a different namespace ('intel_xe') from the
i915 IGT library ('intel' or 'i915'). The generated files are also part of
the Xe IGT library. Therefore make sure the functions and data structs in
the generated files conform to Xe namespace.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/codegen.py              |  6 ++--
 lib/xe/oa-configs/oa-equations-codegen.py | 36 +++++++++++------------
 lib/xe/oa-configs/oa-metricset-codegen.py | 26 ++++++++--------
 lib/xe/oa-configs/oa-registers-codegen.py | 10 +++----
 4 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
index 020e76ef4b..9a7d57a33e 100644
--- a/lib/xe/oa-configs/codegen.py
+++ b/lib/xe/oa-configs/codegen.py
@@ -340,13 +340,13 @@ class Gen:
             return set.read_funcs[name] + "(perf, metric_set, accumulator)"
         m = re.search('\$GtSlice([0-9]+)$', name)
         if m:
-            return 'intel_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
+            return 'intel_xe_perf_devinfo_slice_available(&perf->devinfo, {0})'.format(m.group(1))
         m = re.search('\$GtSlice([0-9]+)DualSubslice([0-9]+)$', name)
         if m:
-            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
+            return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
         m = re.search('\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
         if m:
-            return 'intel_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
+            return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
         return None
 
     def output_rpn_equation_code(self, set, counter, equation):
diff --git a/lib/xe/oa-configs/oa-equations-codegen.py b/lib/xe/oa-configs/oa-equations-codegen.py
index a4a00f46d9..de5a3337df 100644
--- a/lib/xe/oa-configs/oa-equations-codegen.py
+++ b/lib/xe/oa-configs/oa-equations-codegen.py
@@ -46,9 +46,9 @@ def output_counter_read(gen, set, counter):
     read_eq = counter.get('equation')
 
     c(ret_ctype)
-    c(counter.read_sym + "(const struct intel_perf *perf,\n")
+    c(counter.read_sym + "(const struct intel_xe_perf *perf,\n")
     c.indent(len(counter.read_sym) + 1)
-    c("const struct intel_perf_metric_set *metric_set,\n")
+    c("const struct intel_xe_perf_metric_set *metric_set,\n")
     c("uint64_t *accumulator)\n")
     c.outdent(len(counter.read_sym) + 1)
 
@@ -75,9 +75,9 @@ def output_counter_read_definition(gen, set, counter):
         read_eq = counter.get('equation')
 
         h(ret_ctype)
-        h(counter.read_sym + "(const struct intel_perf *perf,\n")
+        h(counter.read_sym + "(const struct intel_xe_perf *perf,\n")
         h.indent(len(counter.read_sym) + 1)
-        h("const struct intel_perf_metric_set *metric_set,\n")
+        h("const struct intel_xe_perf_metric_set *metric_set,\n")
         h("uint64_t *accumulator);\n")
         h.outdent(len(counter.read_sym) + 1)
 
@@ -100,9 +100,9 @@ def output_counter_max(gen, set, counter):
     ret_ctype = data_type_to_ctype(ret_type)
 
     c(ret_ctype)
-    c(counter.max_sym + "(const struct intel_perf *perf,\n")
+    c(counter.max_sym + "(const struct intel_xe_perf *perf,\n")
     c.indent(len(counter.max_sym) + 1)
-    c("const struct intel_perf_metric_set *metric_set,\n")
+    c("const struct intel_xe_perf_metric_set *metric_set,\n")
     c("uint64_t *accumulator)\n")
     c.outdent(len(counter.max_sym) + 1)
 
@@ -135,9 +135,9 @@ def output_counter_max_definition(gen, set, counter):
 
         h(ret_ctype)
 
-        h(counter.max_sym + "(const struct intel_perf *perf,")
+        h(counter.max_sym + "(const struct intel_xe_perf *perf,")
         h.indent(len(counter.max_sym) + 1)
-        h("const struct intel_perf_metric_set *metric_set,")
+        h("const struct intel_xe_perf_metric_set *metric_set,")
         h("uint64_t *accumulator);")
         h.outdent(len(counter.max_sym) + 1)
         h("\n")
@@ -163,16 +163,16 @@ def generate_equations(args, gens):
         #define MAX(a, b) (((a) > (b)) ? (a) : (b))
 
         double
-        percentage_max_callback_float(const struct intel_perf *perf,
-                                      const struct intel_perf_metric_set *metric_set,
+        percentage_max_callback_float(const struct intel_xe_perf *perf,
+                                      const struct intel_xe_perf_metric_set *metric_set,
                                       uint64_t *accumulator)
         {
            return 100;
         }
 
         uint64_t
-        percentage_max_callback_uint64(const struct intel_perf *perf,
-                                       const struct intel_perf_metric_set *metric_set,
+        percentage_max_callback_uint64(const struct intel_xe_perf *perf,
+                                       const struct intel_xe_perf_metric_set *metric_set,
                                        uint64_t *accumulator)
         {
            return 100;
@@ -196,16 +196,16 @@ def generate_equations(args, gens):
         #include <stdint.h>
         #include <stdbool.h>
 
-        struct intel_perf;
-        struct intel_perf_metric_set;
+        struct intel_xe_perf;
+        struct intel_xe_perf_metric_set;
 
         double
-        percentage_max_callback_float(const struct intel_perf *perf,
-                                      const struct intel_perf_metric_set *metric_set,
+        percentage_max_callback_float(const struct intel_xe_perf *perf,
+                                      const struct intel_xe_perf_metric_set *metric_set,
                                       uint64_t *accumulator);
         uint64_t
-        percentage_max_callback_uint64(const struct intel_perf *perf,
-                                       const struct intel_perf_metric_set *metric_set,
+        percentage_max_callback_uint64(const struct intel_xe_perf *perf,
+                                       const struct intel_xe_perf_metric_set *metric_set,
                                        uint64_t *accumulator);
 
         """ % (header_define, header_define)))
diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index ea0d13cc97..f4a008d690 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -28,7 +28,7 @@ def availability_func_name(set, counter):
 def output_availability_funcs(set, counter):
     availability = counter.get('availability')
     if availability:
-        c("static bool " + availability_func_name(set, counter) + "(const struct intel_perf *perf) {")
+        c("static bool " + availability_func_name(set, counter) + "(const struct intel_xe_perf *perf) {")
         c.indent(4)
         set.gen.output_availability(set, availability, counter.get('name'))
         c.indent(4)
@@ -60,9 +60,9 @@ def output_counter_report(set, counter):
     c(".name = \"{0}\",\n".format(counter.get('name')))
     c(".symbol_name = \"{0}\",\n".format(counter.get('symbol_name')))
     c(".desc = \"{0}\",\n".format(counter.get('description')))
-    c(".type = INTEL_PERF_LOGICAL_COUNTER_TYPE_{0},\n".format(semantic_type_uc))
-    c(".storage = INTEL_PERF_LOGICAL_COUNTER_STORAGE_{0},\n".format(data_type_uc))
-    c(".unit = INTEL_PERF_LOGICAL_COUNTER_UNIT_{0},\n".format(output_units(counter.get('units'))))
+    c(".type = INTEL_XE_PERF_LOGICAL_COUNTER_TYPE_{0},\n".format(semantic_type_uc))
+    c(".storage = INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_{0},\n".format(data_type_uc))
+    c(".unit = INTEL_XE_PERF_LOGICAL_COUNTER_UNIT_{0},\n".format(output_units(counter.get('units'))))
     c(".read_{0} = {1},\n".format(data_type, set.read_funcs["$" + counter.get('symbol_name')]))
     c(".max_{0} = {1},\n".format(data_type, set.max_funcs["$" + counter.get('symbol_name')]))
     c(".group = \"{0}\",\n".format(counter.get('mdapi_group')))
@@ -98,18 +98,18 @@ def generate_metric_sets(args, gen):
           output_availability_funcs(set, counter)
 
         c("\nstatic void\n")
-        c(gen.chipset + "_add_" + set.underscore_name + "_metric_set(struct intel_perf *perf)")
+        c(gen.chipset + "_add_" + set.underscore_name + "_metric_set(struct intel_xe_perf *perf)")
         c("{\n")
         c.indent(4)
 
-        c("struct intel_perf_metric_set *metric_set;\n")
-        c("struct intel_perf_logical_counter *counter;\n\n")
+        c("struct intel_xe_perf_metric_set *metric_set;\n")
+        c("struct intel_xe_perf_logical_counter *counter;\n\n")
 
         c("metric_set = calloc(1, sizeof(*metric_set));\n")
         c("metric_set->name = \"" + set.name + "\";\n")
         c("metric_set->symbol_name = \"" + set.symbol_name + "\";\n")
         c("metric_set->hw_config_guid = \"" + set.hw_config_guid + "\";\n")
-        c("metric_set->counters = calloc({0}, sizeof(struct intel_perf_logical_counter));\n".format(str(len(counters))))
+        c("metric_set->counters = calloc({0}, sizeof(struct intel_xe_perf_logical_counter));\n".format(str(len(counters))))
         c("metric_set->n_counters = 0;\n")
         c("metric_set->perf_oa_metrics_set = 0; // determined at runtime\n")
 
@@ -167,12 +167,12 @@ def generate_metric_sets(args, gen):
 
         c("%s_%s_add_registers(perf, metric_set);" % (gen.chipset, set.underscore_name))
 
-        c("intel_perf_add_metric_set(perf, metric_set);");
+        c("intel_xe_perf_add_metric_set(perf, metric_set);");
         c("\n")
 
         c("{")
         c.indent(4)
-        c("static const struct intel_perf_logical_counter _counters[] = {")
+        c("static const struct intel_xe_perf_logical_counter _counters[] = {")
         c.indent(4)
 
         for counter in counters:
@@ -190,7 +190,7 @@ def generate_metric_sets(args, gen):
         c("counter = &metric_set->counters[metric_set->n_counters++];")
         c("*counter = _counters[i];")
         c("counter->metric_set = metric_set;")
-        c("intel_perf_add_logical_counter(perf, counter, counter->group);")
+        c("intel_xe_perf_add_logical_counter(perf, counter, counter->group);")
         c.outdent(4)
         c("}")
         c.outdent(4)
@@ -201,7 +201,7 @@ def generate_metric_sets(args, gen):
         c("}\n")
 
     c("\nvoid")
-    c("intel_perf_load_metrics_" + gen.chipset + "(struct intel_perf *perf)")
+    c("intel_xe_perf_load_metrics_" + gen.chipset + "(struct intel_xe_perf *perf)")
     c("{")
     c.indent(4)
 
@@ -256,7 +256,7 @@ def main():
         """ % (header_define, header_define)))
 
     # Print out all set registration functions for each generation.
-    h("void intel_perf_load_metrics_" + gen.chipset + "(struct intel_perf *perf);\n\n")
+    h("void intel_xe_perf_load_metrics_" + gen.chipset + "(struct intel_xe_perf *perf);\n\n")
 
     h(textwrap.dedent("""\
         #endif /* %s */
diff --git a/lib/xe/oa-configs/oa-registers-codegen.py b/lib/xe/oa-configs/oa-registers-codegen.py
index a4aa134097..08fc38a50e 100644
--- a/lib/xe/oa-configs/oa-registers-codegen.py
+++ b/lib/xe/oa-configs/oa-registers-codegen.py
@@ -22,7 +22,7 @@ def generate_register_configs(set):
         'OA': 'b_counter_regs',
     }
 
-    c("void %s_%s_add_registers(struct intel_perf *perf, struct intel_perf_metric_set *metric_set)" %
+    c("void %s_%s_add_registers(struct intel_xe_perf *perf, struct intel_xe_perf_metric_set *metric_set)" %
       (set.gen.chipset, set.underscore_name))
     c("{")
     c.indent(4)
@@ -39,7 +39,7 @@ def generate_register_configs(set):
 
         c("{")
         c.indent(4)
-        c("static const struct intel_perf_register_prog _%s[] = {" % t)
+        c("static const struct intel_xe_perf_register_prog _%s[] = {" % t)
         c.indent(4)
         for register in register_config.findall('register'):
             c("{ .reg = %s, .val = %s }," %
@@ -95,11 +95,11 @@ def main():
     h("#ifndef %s" % header_define)
     h("#define %s" % header_define)
     h("\n")
-    h("struct intel_perf;")
-    h("struct intel_perf_metric_set;")
+    h("struct intel_xe_perf;")
+    h("struct intel_xe_perf_metric_set;")
     h("\n")
     for set in gen.sets:
-        h("void %s_%s_add_registers(struct intel_perf *perf, struct intel_perf_metric_set *metric_set);" %
+        h("void %s_%s_add_registers(struct intel_xe_perf *perf, struct intel_xe_perf_metric_set *metric_set);" %
           (gen.chipset, set.underscore_name))
     h("\n")
     h("#endif /* %s */" % header_define)
-- 
2.41.0

