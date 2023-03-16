Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6A10EE24
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:29 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:33:12 -0700
Message-Id: <20230316233323.2638668-21-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 20/31] lib/i915/perf: Add support for OAM
 format in codegen
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

Include OAM SAMedia (Standalone Media) format for MTL.

v2: Improve commit message (Kamil)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/perf-configs/mdapi-xml-convert.py | 118 +++++++++++++++++++--
 1 file changed, 112 insertions(+), 6 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index eee12ad5..ba0b7ba4 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -135,6 +135,36 @@ xehpsdv_chipset_params = {
 
 # There is no ReportType field in most Metrics XML files, Use 256B_GENERIC_NOA16
 # to denote the generic 256 byte format that is used by most chipsets
+# Just treat the MPEC counter names as A counters here. If a format has both A
+# and MPEC counters, then we need to change this.
+mtl_chipset_oam_samedia_ll_params = {
+    'a_offset': 32,
+    'b_offset': 96,
+    'c_offset': 128,
+    'oa_report_size': 192,
+    'config_reg_blacklist': {
+        0x2364, # OACTXID
+    },
+    'register_offsets': {
+        0x1b0: 'PERFCNT 0',
+        0x1b8: 'PERFCNT 1',
+    }
+}
+
+mtl_chipset_oam_samedia_params = {
+    'a_offset': 32,
+    'b_offset': 64,
+    'c_offset': 96,
+    'oa_report_size': 128,
+    'config_reg_blacklist': {
+        0x2364, # OACTXID
+    },
+    'register_offsets': {
+        0x1b0: 'PERFCNT 0',
+        0x1b8: 'PERFCNT 1',
+    }
+}
+
 hsw_chipset_oa_formats = {
     '256B_GENERIC_NOA16': hsw_chipset_params,
 }
@@ -147,6 +177,11 @@ xehpsdv_chipset_oa_formats = {
     '256B_GENERIC_NOA16': xehpsdv_chipset_params,
 }
 
+mtl_chipset_oa_formats = {
+    '256B_GENERIC_NOA16': xehpsdv_chipset_params,
+    '192B_MPEC8LL_NOA16': mtl_chipset_oam_samedia_ll_params,
+    '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
+}
 
 chipsets = {
     'HSW': hsw_chipset_oa_formats,
@@ -165,7 +200,7 @@ chipsets = {
     'DG1': gen8_11_chipset_oa_formats,
     'ADL': gen8_11_chipset_oa_formats,
     'ACM': xehpsdv_chipset_oa_formats,
-    'MTL': xehpsdv_chipset_oa_formats,
+    'MTL': mtl_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
@@ -202,7 +237,62 @@ def read_value(chipset, offset, oa_format):
     assert 0
 
 
-def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
+def read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format):
+    width, offset_str = token.split('@')
+    offset = int(offset_str, 16)
+
+    if width == 'qw':
+        den = 8
+    else:
+        den = 4
+
+    if raw_offsets:
+        # Location in the HW reports
+        a_offset = chipsets[chipset][oa_format]['a_offset']
+        b_offset = chipsets[chipset][oa_format]['b_offset']
+        c_offset = chipsets[chipset][oa_format]['c_offset']
+        report_size = chipsets[chipset][oa_format]['oa_report_size']
+
+        if offset < a_offset:
+            if offset == 8:
+                return "GPU_TIME 0 READ"
+            elif offset == 24:
+                return "GPU_CLOCK 0 READ"
+            else:
+                assert 0
+        elif offset < b_offset:
+            a_cnt_offset = int((offset - a_offset) / den)
+            return "A " + str(a_cnt_offset) + " READ"
+        elif offset < c_offset:
+            return "B " + str(int((offset - b_offset) / den)) + " READ"
+        elif offset < report_size:
+            return "C " + str(int((offset - c_offset) / den)) + " READ"
+        else:
+            return "{0} READ".format(read_value(chipset, offset, oa_format))
+    else:
+        # Location in the accumulated deltas
+        idx = int(offset / 8)
+        if chipset in xehp_plus:
+            # For XEHPSDV the array of accumulated counters is
+            # assumed to start with a GPU_TIME then GPU_CLOCK,
+            # then 38 A counters, then 8 B counters and finally
+            # 8 C counters.
+            if idx == 0:
+                return "GPU_TIME 0 READ"
+            elif idx == 1:
+                return "GPU_CLOCK 0 READ"
+            elif idx < 40:
+                return "A " + str(idx - 2) + " READ"
+            elif idx < 48:
+                return "B " + str(idx - 40) + " READ"
+            elif idx < 56:
+                return "C " + str(idx - 48) + " READ"
+            else:
+                return "{0} READ".format(read_value(chipset, offset, oa_format))
+
+    assert 0
+
+def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
     width, offset_str = token.split('@')
 
     # For Broadwell the raw read notation was extended for 40 bit
@@ -298,6 +388,16 @@ def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
 
     assert 0
 
+
+def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
+    if oa_format == '256B_GENERIC_NOA16':
+        return read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format)
+
+    if oa_format in ['192B_MPEC8LL_NOA16', '128B_MPEC8_NOA16']:
+        return read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format)
+
+    assert 0
+
 def replace_read_tokens_with_rpn_read_ops(chipset, oa_format, equation, raw_offsets):
     # MDAPI MetricSet equations use tokens like 'dw@0xff' for reading raw
     # values from snapshots, but this doesn't seem convenient for a few
@@ -625,10 +725,13 @@ for arg in args.xml:
     for mdapi_set in mdapi.findall(".//MetricSet"):
 
         apis = mdapi_set.get('SupportedAPI')
-        if "OGL" not in apis and "OCL" not in apis and "MEDIA" not in apis:
+        if "OGL" not in apis and "OCL" not in apis and "MEDIA" not in apis and "IO" not in apis:
             continue
 
         oa_format = '256B_GENERIC_NOA16'
+        if mdapi_set.get('ReportType') in chipsets[chipset]:
+            oa_format = mdapi_set.get('ReportType')
+
         set_symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_set.get('SymbolName'))
 
         if set_symbol_name in sets:
@@ -647,7 +750,7 @@ for arg in args.xml:
         if set_symbol_name in set_blacklist:
             continue
 
-        if mdapi_set.get('SnapshotReportSize') != '256':
+        if mdapi_set.get('SnapshotReportSize') != str(chipsets[chipset][oa_format]['oa_report_size']):
             print_err("WARNING: skipping metric set '{0}', report size {1} invalid".format(set_symbol_name, mdapi_set.get('SnapshotReportSize')))
             continue
 
@@ -880,8 +983,11 @@ for arg in args.xml:
             # XXX: As a special case, we override the raw and delta report
             # equations for the GpuTime counters, which seem inconsistent
             if mdapi_counter.get('SymbolName') == "GpuTime":
-                mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
                 mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                if chipset == 'MTL' and oa_format != '256B_GENERIC_NOA16':
+                    mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                else:
+                    mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
 
             availability = fixup_equation(mdapi_counter.get('AvailabilityEquation'))
             if availability == "":
@@ -919,7 +1025,7 @@ for arg in args.xml:
                           "(" + mdapi_counter.get('ShortName') + ")" + "\"")
                 # Media metric counters currently have no delta equation even
                 # though they have normalization equations that reference $Self
-                if "MEDIA" in apis:
+                if "MEDIA" in apis or "IO" in apis:
                     print_err("WARNING: -> Treating inconsistent media metric's 'raw' equation as a 'delta report' equation, but results should be double checked!")
                     delta_read_eq = raw_read_eq
                 else:
-- 
2.36.1
