Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32D010E6C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:13:12 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 10 Oct 2022 18:12:55 +0000
Message-Id: <20221010181300.513297-30-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
References: <20221010181300.513297-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 29/34] i915/perf: update import script
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
 lib/i915/perf-configs/mdapi-xml-convert.py | 180 ++++++++++++---------
 lib/i915/perf-configs/oa-bdw.xml           |   2 +-
 lib/i915/perf-configs/oa_guid_registry.py  |  15 +-
 lib/i915/perf-configs/update-guids.py      |  23 +--
 lib/i915/perf.h                            |   1 +
 5 files changed, 131 insertions(+), 90 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 7b5be901..ba053ae3 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -45,6 +45,8 @@ import sys
 import time
 import uuid
 
+import codegen
+
 import xml.etree.ElementTree as et
 import xml.sax.saxutils as saxutils
 
@@ -54,6 +56,55 @@ import oa_guid_registry as oa_registry
 # MDAPI configs include writes to some non-config registers,
 # thus the blacklists...
 
+hsw_chipset_params = {
+    'a_offset': 12,
+    'b_offset': 192,
+    'c_offset': 224,
+    'oa_report_size': 256,
+    'registers': {
+        # TODO extend the symbol table for nicer output...
+        0x2710: { 'name': 'OASTARTTRIG1' },
+        0x2714: { 'name': 'OASTARTTRIG1' },
+        0x2718: { 'name': 'OASTARTTRIG1' },
+        0x271c: { 'name': 'OASTARTTRIG1' },
+        0x2720: { 'name': 'OASTARTTRIG1' },
+        0x2724: { 'name': 'OASTARTTRIG6' },
+        0x2728: { 'name': 'OASTARTTRIG7' },
+        0x272c: { 'name': 'OASTARTTRIG8' },
+        0x2740: { 'name': 'OAREPORTTRIG1' },
+        0x2744: { 'name': 'OAREPORTTRIG2' },
+        0x2748: { 'name': 'OAREPORTTRIG3' },
+        0x274c: { 'name': 'OAREPORTTRIG4' },
+        0x2750: { 'name': 'OAREPORTTRIG5' },
+        0x2754: { 'name': 'OAREPORTTRIG6' },
+        0x2758: { 'name': 'OAREPORTTRIG7' },
+        0x275c: { 'name': 'OAREPORTTRIG8' },
+        0x2770: { 'name': 'OACEC0_0' },
+        0x2774: { 'name': 'OACEC0_1' },
+        0x2778: { 'name': 'OACEC1_0' },
+        0x277c: { 'name': 'OACEC1_1' },
+        0x2780: { 'name': 'OACEC2_0' },
+        0x2784: { 'name': 'OACEC2_1' },
+        0x2788: { 'name': 'OACEC3_0' },
+        0x278c: { 'name': 'OACEC3_1' },
+        0x2790: { 'name': 'OACEC4_0' },
+        0x2794: { 'name': 'OACEC4_1' },
+        0x2798: { 'name': 'OACEC5_0' },
+        0x279c: { 'name': 'OACEC5_1' },
+        0x27a0: { 'name': 'OACEC6_0' },
+        0x27a4: { 'name': 'OACEC6_1' },
+        0x27a8: { 'name': 'OACEC7_0' },
+        0x27ac: { 'name': 'OACEC7_1' },
+    },
+    'config_reg_blacklist': {
+        0x2364, # OASTATUS1 register
+    },
+    'register_offsets': {
+        0x1f0: 'PERFCNT 0',
+        0x1f8: 'PERFCNT 1',
+    },
+}
+
 gen8_11_chipset_params = {
     'a_offset': 16,
     'b_offset': 192,
@@ -83,50 +134,7 @@ xehpsdv_chipset_params = {
 }
 
 chipsets = {
-    'HSW': {
-        'a_offset': 12,
-        'b_offset': 192,
-        'c_offset': 224,
-        'oa_report_size': 256,
-        'registers': {
-            # TODO extend the symbol table for nicer output...
-                0x2710: { 'name': 'OASTARTTRIG1' },
-            0x2714: { 'name': 'OASTARTTRIG1' },
-            0x2718: { 'name': 'OASTARTTRIG1' },
-            0x271c: { 'name': 'OASTARTTRIG1' },
-            0x2720: { 'name': 'OASTARTTRIG1' },
-            0x2724: { 'name': 'OASTARTTRIG6' },
-            0x2728: { 'name': 'OASTARTTRIG7' },
-            0x272c: { 'name': 'OASTARTTRIG8' },
-            0x2740: { 'name': 'OAREPORTTRIG1' },
-            0x2744: { 'name': 'OAREPORTTRIG2' },
-            0x2748: { 'name': 'OAREPORTTRIG3' },
-            0x274c: { 'name': 'OAREPORTTRIG4' },
-            0x2750: { 'name': 'OAREPORTTRIG5' },
-            0x2754: { 'name': 'OAREPORTTRIG6' },
-            0x2758: { 'name': 'OAREPORTTRIG7' },
-            0x275c: { 'name': 'OAREPORTTRIG8' },
-            0x2770: { 'name': 'OACEC0_0' },
-            0x2774: { 'name': 'OACEC0_1' },
-            0x2778: { 'name': 'OACEC1_0' },
-            0x277c: { 'name': 'OACEC1_1' },
-            0x2780: { 'name': 'OACEC2_0' },
-            0x2784: { 'name': 'OACEC2_1' },
-            0x2788: { 'name': 'OACEC3_0' },
-            0x278c: { 'name': 'OACEC3_1' },
-            0x2790: { 'name': 'OACEC4_0' },
-            0x2794: { 'name': 'OACEC4_1' },
-            0x2798: { 'name': 'OACEC5_0' },
-            0x279c: { 'name': 'OACEC5_1' },
-            0x27a0: { 'name': 'OACEC6_0' },
-            0x27a4: { 'name': 'OACEC6_1' },
-            0x27a8: { 'name': 'OACEC7_0' },
-            0x27ac: { 'name': 'OACEC7_1' },
-        },
-        'config_reg_blacklist': {
-            0x2364, # OASTATUS1 register
-        },
-    },
+    'HSW': hsw_chipset_params,
     'BDW': gen8_11_chipset_params,
     'CHV': gen8_11_chipset_params,
     'SKL': gen8_11_chipset_params,
@@ -141,8 +149,11 @@ chipsets = {
     'RKL': gen8_11_chipset_params,
     'DG1': gen8_11_chipset_params,
     'ADL': gen8_11_chipset_params,
+    'ACM': xehpsdv_chipset_params,
 }
 
+xehp_plus = ( 'ACM', )
+
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
 
 default_set_blacklist = { "RenderDX1x", # TODO: rename to something non 'DX'
@@ -158,23 +169,11 @@ counter_blacklist = {
                          # investiguate how to get this value.
 }
 
-sys_vars = { "EuCoresTotalCount",
-             "EuSlicesTotalCount",
-             "SamplersTotalCount",
-             "EuThreadsCount",
-             "GpuMinFrequencyMHz",
-             "GpuMaxFrequencyMHz",
-             "GpuTimestampFrequency",
-             "SliceMask",
-             "SubsliceMask",
-             "EuSubslicesTotalCount",
-             "EuDualSubslicesTotalCount",
-           }
-
 def underscore(name):
     s = re.sub('MHz', 'Mhz', name)
     s = re.sub('\.', '_', s)
     s = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', s)
+    s = re.sub('#', '_', s)
     return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s).lower()
 
 def print_err(*args):
@@ -215,7 +214,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
                 assert 0
         elif offset < b_offset:
             a_cnt_offset = int((offset - a_offset) / 4)
-            if chipset == "XEHPSDV":
+            if chipset in xehp_plus:
                 # Most A counters are in a contiguous array, except
                 # this A37.
                 if a_cnt_offset == 42:
@@ -246,7 +245,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
                 return "C " + str(idx - 54) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset))
-        elif chipset == "XEHPSDV":
+        elif chipset in xehp_plus:
             # For XEHPSDV the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
             # then 38 A counters, then 8 B counters and finally
@@ -354,10 +353,38 @@ def strip_dx_apis(text):
 
     return stripped.strip()
 
+def add_gpu_core_clocks_if_missing(metric_set, counters, counter_deps):
+    if len(counters) < 1:
+        return
+
+    for name,element in counters.items():
+        if name == 'GpuCoreClocks':
+            return
+
+    print_err("WARNING: add missing GpuCoreClocks counter for MetricSets=\"{0}\"".format(metric_set.get('ShortName')))
+    counter = et.SubElement(metric_set, 'Metric')
+    counter.set("SymbolName", "GpuCoreClocks")
+    counter.set("SignalName", "oa.fixed")
+    counter.set("ShortName", "GPU Core Clocks")
+    counter.set("LongName", "The total number of GPU core clocks elapsed during the measurement.")
+    counter.set("Group", "GPU")
+    counter.set("UsageFlags", "Tier1 Frame Batch Draw")
+    counter.set("MetricType", "EVENT")
+    counter.set("ResultType", "UINT64")
+    counter.set("MetricUnits", "cycles")
+    counter.set("HWUnitType", "GPU")
+    counter.set("SnapshotReportReadEquation", "dw@0x0c")
+    counter.set("SnapshotReportDeltaFunction", "DELTA 32")
+    counter.set("DeltaReportReadEquation", "qw@0x08")
+    counter.set("NormalizationEquation", "")
+
+    counters["GpuCoreClocks"] = counter
+    counter_deps["GpuCoreClocks"] = []
+
 # For recursively appending counters in order of dependencies...
 def append_deps_and_counter(mdapi_counter, mdapi_counters, deps,
                             sorted_array, sorted_set):
-    symbol_name = mdapi_counter.get('SymbolName')
+    symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName'))
 
     if symbol_name in sorted_set:
         return
@@ -562,6 +589,7 @@ guids = {}
 guids_xml = et.parse(args.guids)
 for guid in guids_xml.findall(".//guid"):
     hashing_key = oa_registry.Registry.chipset_derive_hash(guid.get('chipset'),
+                                                           guid.get('name'),
                                                            guid.get('mdapi_config_hash'))
     guids[hashing_key] = guid.get('id')
 
@@ -569,6 +597,14 @@ for arg in args.xml:
     mdapi = et.parse(arg)
 
     concurrent_group = mdapi.find(".//ConcurrentGroup")
+    chipset = oa_registry.Registry.chipset_name(concurrent_group.get('SupportedHW'))
+
+    chipset_fullname = chipset
+    if concurrent_group.get('SupportedGT') != None:
+        chipset_fullname = chipset_fullname + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT'))
+    if chipset not in chipsets:
+        print_err("WARNING: unsupported chipset {0}, consider updating {1}".format(chipset, __file__))
+        continue
 
     for mdapi_set in mdapi.findall(".//MetricSet"):
 
@@ -576,20 +612,12 @@ for arg in args.xml:
         if "OGL" not in apis and "OCL" not in apis and "MEDIA" not in apis:
             continue
 
-        set_symbol_name = mdapi_set.get('SymbolName')
+        set_symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_set.get('SymbolName'))
 
         if set_symbol_name in sets:
             print_err("WARNING: duplicate set named \"" + set_symbol_name + "\" (SKIPPING)")
             continue
 
-        chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW'))
-        chipset_fullname = chipset
-        if concurrent_group.get('SupportedGT') != None:
-            chipset_fullname = chipset_fullname + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT'))
-        if chipset not in chipsets:
-            print_err("WARNING: unsupported chipset {0}, consider updating {1}".format(chipset, __file__))
-            continue
-
         if args.whitelist:
             set_whitelist = args.whitelist.split()
             if set_symbol_name not in set_whitelist:
@@ -666,6 +694,7 @@ for arg in args.xml:
 
         mdapi_hw_config_hash = oa_registry.Registry.mdapi_hw_config_hash(mdapi_set)
         guid_hash = oa_registry.Registry.chipset_derive_hash(chipset_fullname.lower(),
+                                                             set_symbol_name,
                                                              mdapi_hw_config_hash)
         hw_config_hash = oa_registry.Registry.hw_config_hash(set)
 
@@ -693,7 +722,7 @@ for arg in args.xml:
         mdapi_counter_deps = {}
 
         for mdapi_counter in mdapi_set.findall("Metrics/Metric"):
-            symbol_name = mdapi_counter.get('SymbolName')
+            symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName'))
 
             if symbol_name in counter_blacklist:
                 continue;
@@ -712,12 +741,13 @@ for arg in args.xml:
             equations = expand_macros(equations)
             equations = equations.replace('$$', "$")
             for token in equations.split():
-                if token[0] == '$' and token[1:] not in sys_vars and token[1:] != "Self":
+                if token[0] == '$' and not codegen.is_hw_var(token) and token[1:] != "Self":
                     deps.append(token[1:])
 
             mdapi_counters[symbol_name] = mdapi_counter
             mdapi_counter_deps[symbol_name] = deps
 
+        add_gpu_core_clocks_if_missing(mdapi_set, mdapi_counters, mdapi_counter_deps)
         sorted_mdapi_counters = sort_counters(mdapi_counters, mdapi_counter_deps)
 
         for mdapi_counter in sorted_mdapi_counters:
@@ -746,11 +776,11 @@ for arg in args.xml:
                 #mdapi_counter.set('DeltaReportReadEquation', '$GpuCoreClocks $GpuTime UDIV')
 
 
-            symbol_name = mdapi_counter.get('SymbolName')
+            symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName'))
 
             counter = et.SubElement(set, 'counter')
             counter.set('name', apply_aliases(mdapi_counter.get('ShortName'), aliases))
-            counter.set('symbol_name', mdapi_counter.get('SymbolName'))
+            counter.set('symbol_name', oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName')))
             counter.set('underscore_name', underscore(mdapi_counter.get('SymbolName')))
             counter.set('description', apply_aliases(mdapi_counter.get('LongName'), aliases))
             counter.set('mdapi_group', apply_aliases(to_text(mdapi_counter.get('Group')), aliases))
@@ -943,7 +973,7 @@ for arg in args.xml:
                         #   print_err("WARNING: Counter equation (\"" + equation + "\") references un-kept raw equation of another counter : MetricSet=\"" + \
                         #             mdapi_set.get('ShortName') + "\" Metric=\"" + mdapi_counter.get('ShortName') + "\"")
 
-                    elif token[1:] not in raw_equations and token[1:] not in sys_vars:
+                    elif token[1:] not in raw_equations and not codegen.is_hw_var(token):
                         print_err("Unknown variable name: \"" + token + "\" in equation \"" + equation + "\"")
 
             symbol_name = counter.get('symbol_name')
@@ -952,7 +982,7 @@ for arg in args.xml:
             equation = equation.replace('$$', "$")
             for token in equation.split():
                 if token[0] == '$':
-                    if token[1:] not in counters and token[1:] not in sys_vars:
+                    if token[1:] not in counters and not codegen.is_hw_var(token):
                         print_err("WARNING: Counter equation (\"" + equation + "\") with unknown variable " + \
                                   token + " (maybe skipped counter): MetricSet=\"" + mdapi_set.get('ShortName') + \
                                   "\" Metric=\"" + mdapi_counter.get('SymbolName') + "(" + mdapi_counter.get('ShortName') + \
diff --git a/lib/i915/perf-configs/oa-bdw.xml b/lib/i915/perf-configs/oa-bdw.xml
index 247fec4f..4fd5dccb 100644
--- a/lib/i915/perf-configs/oa-bdw.xml
+++ b/lib/i915/perf-configs/oa-bdw.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1619078710" merge_md5="">
+<metrics version="1650881753" merge_md5="">
   <set name="Render Metrics Basic set"
        chipset="BDW"
        symbol_name="RenderBasic"
diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
index 1e082ddf..50076e95 100644
--- a/lib/i915/perf-configs/oa_guid_registry.py
+++ b/lib/i915/perf-configs/oa_guid_registry.py
@@ -72,16 +72,15 @@ class Registry:
 
         return hashlib.md5(registers_str).hexdigest()
 
-
     @staticmethod
-    def chipset_derive_hash(chipset, hash):
-        """Derive a HW config hash for a given chipset.
+    def chipset_derive_hash(chipset, set_name, hash):
+        """Derive a HW config hash for a given chipset & set name.
 
         This helps us avoiding collisions with identical config across
         different Gen or GT.
         """
 
-        return "%s-%s" % (chipset, hash)
+        return "%s-%s-%s" % (chipset, set_name, hash)
 
 
     @staticmethod
@@ -99,7 +98,9 @@ class Registry:
                            'EHL',
                            'TGL',
                            'RKL',
-                           'DG1' )
+                           'DG1',
+                           'ACM',
+                           'PVC' )
         if name in known_chipsets:
             return name
 
@@ -110,3 +111,7 @@ class Registry:
     @staticmethod
     def gt_name(name):
         return re.sub(' ', '', name)
+
+    @staticmethod
+    def sanitize_symbol_name(text):
+        return text.replace('#', "_")
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index d38a7a95..de66b2f3 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -60,8 +60,10 @@ def print_err(*args):
     sys.stderr.write(' '.join(map(str,args)) + '\n')
 
 def guid_hashing_key(guid_obj):
-    return oa_registry.Registry.chipset_derive_hash(guid_obj['chipset'],
-                                                    guid_obj['mdapi_config_hash'])
+    ret = oa_registry.Registry.chipset_derive_hash(guid_obj['chipset'],
+                                                   guid_obj['name'],
+                                                   guid_obj['mdapi_config_hash'])
+    return ret
 
 parser = argparse.ArgumentParser()
 parser.add_argument("xml", nargs="+", help="XML description of metrics")
@@ -101,6 +103,7 @@ for guid in guids_xml.findall(".//guid"):
 
     if 'mdapi_config_hash' in guid_obj:
         hashing_key = oa_registry.Registry.chipset_derive_hash(guid_obj['chipset'],
+                                                               guid_obj['name'],
                                                                guid_obj['mdapi_config_hash'])
         mdapi_config_hash_guid_table[hashing_key] = guid_obj
 
@@ -121,20 +124,20 @@ for arg in args.xml:
     internal = et.parse(arg)
 
     concurrent_group = internal.find(".//ConcurrentGroup")
+    chipset = oa_registry.Registry.chipset_name(concurrent_group.get('SupportedHW')).lower()
+    if concurrent_group.get('SupportedGT') != None:
+        chipset = chipset + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT')).lower()
+
 
     for mdapi_set in internal.findall(".//MetricSet"):
 
         mdapi_config_hash = oa_registry.Registry.mdapi_hw_config_hash(mdapi_set)
 
-        chipset = oa_registry.Registry.chipset_name(mdapi_set.get('SupportedHW')).lower()
-        if concurrent_group.get('SupportedGT') != None:
-            chipset = chipset + oa_registry.Registry.gt_name(concurrent_group.get('SupportedGT')).lower()
-
-        set_name = mdapi_set.get('SymbolName')
+        set_name = oa_registry.Registry.sanitize_symbol_name(mdapi_set.get('SymbolName'))
 
         name = chipset + "_" + set_name;
 
-        hashing_key = oa_registry.Registry.chipset_derive_hash(chipset, mdapi_config_hash)
+        hashing_key = oa_registry.Registry.chipset_derive_hash(chipset, set_name, mdapi_config_hash)
         if hashing_key in mdapi_config_hash_guid_table:
             guid_obj = mdapi_config_hash_guid_table[hashing_key]
 
@@ -174,7 +177,9 @@ chipsets = [ 'hsw',
              'bxt', 'glk',
              'cnl',
              'icl', 'ehl',
-             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl' ]
+             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl',
+             'acmgt1', 'acmgt2', 'acmgt3',
+]
 
 for chipset in chipsets:
     filename = 'oa-' + chipset + '.xml'
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 1493da47..ef2a3029 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -189,6 +189,7 @@ typedef enum {
 	INTEL_PERF_LOGICAL_COUNTER_UNIT_EU_ATOMIC_REQUESTS_TO_L3_CACHE_LINES,
 	INTEL_PERF_LOGICAL_COUNTER_UNIT_EU_REQUESTS_TO_L3_CACHE_LINES,
 	INTEL_PERF_LOGICAL_COUNTER_UNIT_EU_BYTES_PER_L3_CACHE_LINE,
+	INTEL_PERF_LOGICAL_COUNTER_UNIT_GBPS,
 
 	INTEL_PERF_LOGICAL_COUNTER_UNIT_MAX
 } intel_perf_logical_counter_unit_t;
-- 
2.25.1
