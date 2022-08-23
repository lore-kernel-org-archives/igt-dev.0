Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBD11A1FB
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:46 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:34 +0000
Message-Id: <20220823183036.5270-22-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 21/23] lib/i915/perf: fixup conversion
 script for XEHPSDV
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
 lib/i915/perf-configs/mdapi-xml-convert.py | 56 ++++++++++++++++++----
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index d26ff623..f27d6657 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -62,6 +62,24 @@ gen8_11_chipset_params = {
     'config_reg_blacklist': {
         0x2364, # OACTXID
     },
+    'register_offsets': {
+        0x1f0: 'PERFCNT 0',
+        0x1f8: 'PERFCNT 1',
+    }
+}
+
+xehpsdv_chipset_params = {
+    'a_offset': 16,
+    'b_offset': 192,
+    'c_offset': 224,
+    'oa_report_size': 256,
+    'config_reg_blacklist': {
+        0x2364, # OACTXID
+    },
+    'register_offsets': {
+        0x1b0: 'PERFCNT 0',
+        0x1b8: 'PERFCNT 1',
+    }
 }
 
 chipsets = {
@@ -161,14 +179,9 @@ def underscore(name):
 def print_err(*args):
     sys.stderr.write(' '.join(map(str,args)) + '\n')
 
-read_register_offsets = {
-    0x1f0: 'PERFCNT 0',
-    0x1f8: 'PERFCNT 1',
-}
-
 def read_value(chipset, offset):
-    if offset in read_register_offsets:
-        return read_register_offsets[offset]
+    if offset in chipsets[chipset]['register_offsets']:
+        return chipsets[chipset]['register_offsets'][offset]
     print_err("Unknown offset register at offset {0}".format(offset))
     assert 0
 
@@ -185,6 +198,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
     offset = int(offset_str, 16)
 
     if raw_offsets:
+        # Location in the HW reports
         a_offset = chipsets[chipset]['a_offset']
         b_offset = chipsets[chipset]['b_offset']
         c_offset = chipsets[chipset]['c_offset']
@@ -199,7 +213,15 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             else:
                 assert 0
         elif offset < b_offset:
-            return "A " + str(int((offset - a_offset) / 4)) + " READ"
+            a_cnt_offset = int((offset - a_offset) / 4)
+            if chipset == "XEHPSDV":
+                # Most A counters are in a contiguous array, except
+                # this A37.
+                if a_cnt_offset == 42:
+                    return "A 37 READ"
+                return "A " + str(a_cnt_offset) + " READ"
+            else:
+                return "A " + str(a_cnt_offset) + " READ"
         elif offset < c_offset:
             return "B " + str(int((offset - b_offset) / 4)) + " READ"
         elif offset < report_size:
@@ -207,6 +229,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
         else:
             return "{0} READ".format(read_value(chipset, offset))
     else:
+        # Location in the accumulated deltas
         idx = int(offset / 8)
         if chipset == "HSW":
             # On Haswell accumulated counters are assumed to start
@@ -222,6 +245,23 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
                 return "C " + str(idx - 54) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset))
+        elif chipset == "XEHPSDV":
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
+                return "{0} READ".format(read_value(chipset, offset))
         else:
             # For Gen8+ the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
-- 
2.25.1
