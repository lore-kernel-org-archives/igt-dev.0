Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58E10E4E4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 17:48:10 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 20:47:59 +0300
Message-Id: <20230403174800.19621-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
References: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/i915/perf: Stop making copies of
 the registers
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

Do these register things even need to be copied around like
this at all? Just make the pointers const and point them at
the static const data?

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../perf-configs/perf-registers-codegen.py    | 19 +------------------
 lib/i915/perf.h                               |  6 +++---
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/lib/i915/perf-configs/perf-registers-codegen.py b/lib/i915/perf-configs/perf-registers-codegen.py
index bde3d14323d3..a2efb8a31440 100644
--- a/lib/i915/perf-configs/perf-registers-codegen.py
+++ b/lib/i915/perf-configs/perf-registers-codegen.py
@@ -44,20 +44,6 @@ def generate_register_configs(set):
     c("{")
     c.indent(4)
 
-    # allocate memory
-    total_n_registers = {}
-    register_configs = set.findall('register_config')
-    for register_config in register_configs:
-        t = register_types[register_config.get('type')]
-        if t not in total_n_registers:
-            total_n_registers[t] = len(register_config.findall('register'))
-        else:
-            total_n_registers[t] += len(register_config.findall('register'))
-
-    for reg in total_n_registers:
-        c("metric_set->{0} = calloc({1}, sizeof(struct intel_perf_register_prog));".format(reg, total_n_registers[reg]))
-    c("\n")
-
     # fill in register/values
     register_configs = set.findall('register_config')
     for register_config in register_configs:
@@ -77,7 +63,7 @@ def generate_register_configs(set):
               (register.get('address'), register.get('value')))
         c.outdent(4)
         c("};")
-        c("memcpy(metric_set->%s, _%s, sizeof(_%s));" % (t, t, t))
+        c("metric_set->%s = _%s;" % (t, t))
         c("metric_set->n_%s = sizeof(_%s) / sizeof(_%s[0]);" % (t, t, t))
         c.outdent(4)
         c("}")
@@ -155,9 +141,6 @@ def main():
 
     c(copyright)
     c("\n")
-    c("#include <stdlib.h>")
-    c("#include <string.h>")
-    c("\n")
     c("#include \"%s\"" % header_file)
     c("#include \"i915/perf.h\"")
 
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index df5b6b96ef1d..6b139f687cca 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -256,13 +256,13 @@ struct intel_perf_metric_set {
 	int c_offset;
 	int perfcnt_offset;
 
-	struct intel_perf_register_prog *b_counter_regs;
+	const struct intel_perf_register_prog *b_counter_regs;
 	uint32_t n_b_counter_regs;
 
-	struct intel_perf_register_prog *mux_regs;
+	const struct intel_perf_register_prog *mux_regs;
 	uint32_t n_mux_regs;
 
-	struct intel_perf_register_prog *flex_regs;
+	const struct intel_perf_register_prog *flex_regs;
 	uint32_t n_flex_regs;
 
 	struct igt_list_head link;
-- 
2.39.2
