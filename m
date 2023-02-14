Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1233E10E99F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:52 -0800
Message-Id: <20230214210007.2026033-16-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 15/30] lib/perf: Make chipsets aware of oa formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make chipsets aware of oa formats to allow addition of different formats
per chipset.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 98 +++++++++++++---------
 1 file changed, 58 insertions(+), 40 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index b20b104d..5c784643 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -133,24 +133,39 @@ xehpsdv_chipset_params = {
     }
 }
 
+# There is no ReportType field in most Metrics XML files, Use 256B_GENERIC_NOA16
+# to denote the generic 256 byte format that is used by most chipsets
+hsw_chipset_oa_formats = {
+    '256B_GENERIC_NOA16': hsw_chipset_params,
+}
+
+gen8_11_chipset_oa_formats = {
+    '256B_GENERIC_NOA16': gen8_11_chipset_params,
+}
+
+xehpsdv_chipset_oa_formats = {
+    '256B_GENERIC_NOA16': xehpsdv_chipset_params,
+}
+
+
 chipsets = {
-    'HSW': hsw_chipset_params,
-    'BDW': gen8_11_chipset_params,
-    'CHV': gen8_11_chipset_params,
-    'SKL': gen8_11_chipset_params,
-    'BXT': gen8_11_chipset_params,
-    'KBL': gen8_11_chipset_params,
-    'GLK': gen8_11_chipset_params,
-    'CFL': gen8_11_chipset_params,
-    'CNL': gen8_11_chipset_params,
-    'ICL': gen8_11_chipset_params,
-    'EHL': gen8_11_chipset_params,
-    'TGL': gen8_11_chipset_params,
-    'RKL': gen8_11_chipset_params,
-    'DG1': gen8_11_chipset_params,
-    'ADL': gen8_11_chipset_params,
-    'ACM': xehpsdv_chipset_params,
-    'MTL': xehpsdv_chipset_params,
+    'HSW': hsw_chipset_oa_formats,
+    'BDW': gen8_11_chipset_oa_formats,
+    'CHV': gen8_11_chipset_oa_formats,
+    'SKL': gen8_11_chipset_oa_formats,
+    'BXT': gen8_11_chipset_oa_formats,
+    'KBL': gen8_11_chipset_oa_formats,
+    'GLK': gen8_11_chipset_oa_formats,
+    'CFL': gen8_11_chipset_oa_formats,
+    'CNL': gen8_11_chipset_oa_formats,
+    'ICL': gen8_11_chipset_oa_formats,
+    'EHL': gen8_11_chipset_oa_formats,
+    'TGL': gen8_11_chipset_oa_formats,
+    'RKL': gen8_11_chipset_oa_formats,
+    'DG1': gen8_11_chipset_oa_formats,
+    'ADL': gen8_11_chipset_oa_formats,
+    'ACM': xehpsdv_chipset_oa_formats,
+    'MTL': xehpsdv_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
@@ -180,14 +195,14 @@ def underscore(name):
 def print_err(*args):
     sys.stderr.write(' '.join(map(str,args)) + '\n')
 
-def read_value(chipset, offset):
-    if offset in chipsets[chipset]['register_offsets']:
-        return chipsets[chipset]['register_offsets'][offset]
+def read_value(chipset, offset, oa_format):
+    if offset in chipsets[chipset][oa_format]['register_offsets']:
+        return chipsets[chipset][oa_format]['register_offsets'][offset]
     print_err("Unknown offset register at offset {0}".format(offset))
     assert 0
 
 
-def read_token_to_rpn_read(chipset, token, raw_offsets):
+def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
     width, offset_str = token.split('@')
 
     # For Broadwell the raw read notation was extended for 40 bit
@@ -200,10 +215,10 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
 
     if raw_offsets:
         # Location in the HW reports
-        a_offset = chipsets[chipset]['a_offset']
-        b_offset = chipsets[chipset]['b_offset']
-        c_offset = chipsets[chipset]['c_offset']
-        report_size = chipsets[chipset]['oa_report_size']
+        a_offset = chipsets[chipset][oa_format]['a_offset']
+        b_offset = chipsets[chipset][oa_format]['b_offset']
+        c_offset = chipsets[chipset][oa_format]['c_offset']
+        report_size = chipsets[chipset][oa_format]['oa_report_size']
 
         if offset < a_offset:
             if offset == 4:
@@ -228,7 +243,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
         elif offset < report_size:
             return "C " + str(int((offset - c_offset) / 4)) + " READ"
         else:
-            return "{0} READ".format(read_value(chipset, offset))
+            return "{0} READ".format(read_value(chipset, offset, oa_format))
     else:
         # Location in the accumulated deltas
         idx = int(offset / 8)
@@ -245,7 +260,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             elif idx < 62:
                 return "C " + str(idx - 54) + " READ"
             else:
-                return "{0} READ".format(read_value(chipset, offset))
+                return "{0} READ".format(read_value(chipset, offset, oa_format))
         elif chipset in xehp_plus:
             # For XEHPSDV the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
@@ -262,7 +277,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             elif idx < 56:
                 return "C " + str(idx - 48) + " READ"
             else:
-                return "{0} READ".format(read_value(chipset, offset))
+                return "{0} READ".format(read_value(chipset, offset, oa_format))
         else:
             # For Gen8+ the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
@@ -279,11 +294,11 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             elif idx < 54:
                 return "C " + str(idx - 46) + " READ"
             else:
-                return "{0} READ".format(read_value(chipset, offset))
+                return "{0} READ".format(read_value(chipset, offset, oa_format))
 
     assert 0
 
-def replace_read_tokens_with_rpn_read_ops(chipset, equation, raw_offsets):
+def replace_read_tokens_with_rpn_read_ops(chipset, oa_format, equation, raw_offsets):
     # MDAPI MetricSet equations use tokens like 'dw@0xff' for reading raw
     # values from snapshots, but this doesn't seem convenient for a few
     # reasons:
@@ -307,7 +322,7 @@ def replace_read_tokens_with_rpn_read_ops(chipset, equation, raw_offsets):
 
     for token in tokens:
         if '@' in token:
-            read_exp = read_token_to_rpn_read(chipset, token, raw_offsets)
+            read_exp = read_token_to_rpn_read(chipset, token, raw_offsets, oa_format)
             equation = equation + " " + read_exp
         else:
             equation = equation + " " + token
@@ -425,14 +440,14 @@ def fixup_equation(equation):
 # double check that there's never any variations between repeated
 # configs
 #
-def filter_single_config_registers_of_type(mdapi_metric_set, type):
+def filter_single_config_registers_of_type(mdapi_metric_set, type, oa_format):
     regs = []
     for mdapi_reg_config in mdapi_metric_set.findall("RegConfigStart"):
         tmp_regs = []
         for mdapi_reg in mdapi_reg_config.findall("Register"):
             reg = (int(mdapi_reg.get('offset'),16), int(mdapi_reg.get('value'),16))
 
-            if reg[0] in chipsets[chipset]['config_reg_blacklist']:
+            if reg[0] in chipsets[chipset][oa_format]['config_reg_blacklist']:
                 continue
 
             if mdapi_reg.get('type') == type:
@@ -472,7 +487,7 @@ def get_mux_id_group(id_groups, id):
 
 
 
-def process_mux_configs(mdapi_set):
+def process_mux_configs(mdapi_set, oa_format):
     allow_missing_id = True
 
     mux_config_id_groups = []
@@ -483,7 +498,7 @@ def process_mux_configs(mdapi_set):
         for mdapi_reg in mdapi_reg_config.findall("Register"):
             address = int(mdapi_reg.get('offset'), 16)
 
-            if address in chipsets[chipset]['config_reg_blacklist']:
+            if address in chipsets[chipset][oa_format]['config_reg_blacklist']:
                 continue
 
             reg_type = mdapi_reg.get('type')
@@ -613,6 +628,7 @@ for arg in args.xml:
         if "OGL" not in apis and "OCL" not in apis and "MEDIA" not in apis:
             continue
 
+        oa_format = '256B_GENERIC_NOA16'
         set_symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_set.get('SymbolName'))
 
         if set_symbol_name in sets:
@@ -668,7 +684,7 @@ for arg in args.xml:
         # to deal with. (At least we got the handling of the Broadwell
         # ComputeExtended example wrong and it took several email exchanges and
         # a conference call to confirm how to interpret this case)
-        mux_configs = process_mux_configs(mdapi_set)
+        mux_configs = process_mux_configs(mdapi_set, oa_format)
 
         # Unlike for MUX registers, we only expect one set of FLEX/OA
         # registers per metric set (even though they are sometimes duplicated
@@ -680,8 +696,8 @@ for arg in args.xml:
         # need some adapting to support multiple OA/FLEX configs with different
         # availability expressions)
         #
-        flex_regs = filter_single_config_registers_of_type(mdapi_set, "FLEX")
-        oa_regs = filter_single_config_registers_of_type(mdapi_set, "OA")
+        flex_regs = filter_single_config_registers_of_type(mdapi_set, "FLEX", oa_format)
+        oa_regs = filter_single_config_registers_of_type(mdapi_set, "OA", oa_format)
 
 
         # Note: we ignore Perfmon registers
@@ -877,6 +893,7 @@ for arg in args.xml:
                     raw_read_eq = None
                 else:
                     raw_read_eq = replace_read_tokens_with_rpn_read_ops(chipset,
+                                                                        oa_format,
                                                                         raw_read_eq,
                                                                         True) #raw offsets
 
@@ -886,6 +903,7 @@ for arg in args.xml:
                     delta_read_eq = None
                 else:
                     delta_read_eq = replace_read_tokens_with_rpn_read_ops(chipset,
+                                                                          oa_format,
                                                                           delta_read_eq,
                                                                           False) #delta offsets
 
@@ -1070,8 +1088,8 @@ for set in metrics.findall(".//set"):
         for reg in config.findall("register"):
             addr = int(reg.get('address'), 16)
 
-            if 'registers' in chipsets[chipset] and addr in chipsets[chipset]['registers']:
-                reg_info = chipsets[chipset]['registers'][addr]
+            if 'registers' in chipsets[chipset][oa_format] and addr in chipsets[chipset][oa_format]['registers']:
+                reg_info = chipsets[chipset][oa_format]['registers'][addr]
                 comment = ' <!--' + reg_info['name'] + ' -->'
             else:
                 comment = ''
-- 
2.36.1
