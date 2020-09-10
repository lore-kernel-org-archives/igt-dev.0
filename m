Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746586E8F2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2020 10:15:41 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 10 Sep 2020 13:15:32 +0300
Message-Id: <20200910101532.167045-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915/perf: rework perf counters
 equations
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

Working with an offset means we can have the PERFCNT snapshots stored
at an offset in the existing accumulator rather than having a specific
accumulator just for them.

This isn't really useful for IGT because it only looks at the OA
buffer where those registers aren't stored, but it is useful for perf
queries in Mesa.

This bumps the version of the i915_perf library to reflect the API
change (see perf.h).

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 configure.ac                                  |  2 +-
 lib/i915/perf-configs/codegen.py              |  8 -----
 lib/i915/perf-configs/mdapi-xml-convert.py    | 10 +++----
 lib/i915/perf-configs/oa-bdw.xml              | 22 +++++++-------
 lib/i915/perf-configs/oa-bxt.xml              | 14 ++++-----
 lib/i915/perf-configs/oa-cflgt2.xml           | 18 +++++------
 lib/i915/perf-configs/oa-cflgt3.xml           | 18 +++++------
 lib/i915/perf-configs/oa-chv.xml              | 22 +++++++-------
 lib/i915/perf-configs/oa-glk.xml              | 14 ++++-----
 lib/i915/perf-configs/oa-hsw.xml              | 30 +++++++++----------
 lib/i915/perf-configs/oa-kblgt2.xml           | 18 +++++------
 lib/i915/perf-configs/oa-kblgt3.xml           | 18 +++++------
 lib/i915/perf-configs/oa-sklgt2.xml           | 18 +++++------
 lib/i915/perf-configs/oa-sklgt3.xml           | 18 +++++------
 lib/i915/perf-configs/oa-sklgt4.xml           | 18 +++++------
 .../perf-configs/perf-metricset-codegen.py    |  2 ++
 lib/i915/perf.h                               |  3 +-
 lib/meson.build                               |  2 +-
 18 files changed, 125 insertions(+), 130 deletions(-)

diff --git a/configure.ac b/configure.ac
index d5908cd0..6cdfcb3d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -26,7 +26,7 @@ AC_INIT([igt-gpu-tools],
 	[https://bugs.freedesktop.org/enter_bug.cgi?product=DRI&component=IGT],
 	[igt-gpu-tools])
 
-AC_SUBST([i915_perf_version], [1.0.0], [libi915_perf.so version])
+AC_SUBST([i915_perf_version], [1.2.0], [libi915_perf.so version])
 
 AC_CONFIG_SRCDIR([Makefile.am])
 AC_CONFIG_HEADERS([config.h])
diff --git a/lib/i915/perf-configs/codegen.py b/lib/i915/perf-configs/codegen.py
index 5f028c22..7d5cb3af 100644
--- a/lib/i915/perf-configs/codegen.py
+++ b/lib/i915/perf-configs/codegen.py
@@ -142,7 +142,6 @@ class Gen:
         self.ops["FMUL"]     = (2, self.emit_fmul)
         self.ops["FSUB"]     = (2, self.emit_fsub)
         self.ops["READ"]     = (2, self.emit_read)
-        self.ops["READ_REG"] = (1, self.emit_read_reg)
         self.ops["UADD"]     = (2, self.emit_uadd)
         self.ops["UDIV"]     = (2, self.emit_udiv)
         self.ops["UMUL"]     = (2, self.emit_umul)
@@ -204,13 +203,6 @@ class Gen:
         self.c("uint64_t tmp{0} = accumulator[metric_set->{1}_offset + {2}];".format(tmp_id, type, args[0]))
         return tmp_id + 1
 
-    # Disabled here as the generated code is not capturing registers. This
-    # will only be useful for query mode where the driver captures
-    # additional registers.
-    def emit_read_reg(self, tmp_id, args):
-        self.c("uint64_t tmp{0} = 0;".format(tmp_id))
-        return tmp_id + 1
-
     def emit_uadd(self, tmp_id, args):
         self.c("uint64_t tmp{0} = {1} + {2};".format(tmp_id, args[1], args[0]))
         return tmp_id + 1
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index b29e27c9..d20dd953 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -166,8 +166,8 @@ def print_err(*args):
     sys.stderr.write(' '.join(map(str,args)) + '\n')
 
 read_register_offsets = {
-    0x1f0: 'PERFCNT1',
-    0x1f8: 'PERFCNT2',
+    0x1f0: 'PERFCNT 0',
+    0x1f8: 'PERFCNT 1',
 }
 
 def read_value(chipset, offset):
@@ -209,7 +209,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
         elif offset < report_size:
             return "C " + str(int((offset - c_offset) / 4)) + " READ"
         else:
-            return "{0} READ_REG".format(read_value(chipset, offset))
+            return "{0} READ".format(read_value(chipset, offset))
     else:
         idx = int(offset / 8)
         if chipset == "HSW":
@@ -225,7 +225,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             elif idx < 62:
                 return "C " + str(idx - 54) + " READ"
             else:
-                return "{0} READ_REG".format(read_value(chipset, offset))
+                return "{0} READ".format(read_value(chipset, offset))
         else:
             # For Gen8+ the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
@@ -242,7 +242,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
             elif idx < 54:
                 return "C " + str(idx - 46) + " READ"
             else:
-                return "{0} READ_REG".format(read_value(chipset, offset))
+                return "{0} READ".format(read_value(chipset, offset))
 
     assert 0
 
diff --git a/lib/i915/perf-configs/oa-bdw.xml b/lib/i915/perf-configs/oa-bdw.xml
index 85bbc67f..8581330c 100644
--- a/lib/i915/perf-configs/oa-bdw.xml
+++ b/lib/i915/perf-configs/oa-bdw.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1599482526" merge_md5="">
   <set name="Render Metrics Basic Gen8"
        chipset="BDW"
        symbol_name="RenderBasic"
@@ -7800,7 +7800,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8474,7 +8474,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9155,7 +9155,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9823,7 +9823,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -10507,7 +10507,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -11280,7 +11280,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -12010,7 +12010,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -12746,7 +12746,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -13560,7 +13560,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -14417,7 +14417,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-bxt.xml b/lib/i915/perf-configs/oa-bxt.xml
index 7bf8f098..891cbf2b 100644
--- a/lib/i915/perf-configs/oa-bxt.xml
+++ b/lib/i915/perf-configs/oa-bxt.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="BXT"
        symbol_name="RenderBasic"
@@ -5457,7 +5457,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6075,7 +6075,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6843,7 +6843,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7492,7 +7492,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8195,7 +8195,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8897,7 +8897,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-cflgt2.xml b/lib/i915/perf-configs/oa-cflgt2.xml
index 1c021cde..d568b91d 100644
--- a/lib/i915/perf-configs/oa-cflgt2.xml
+++ b/lib/i915/perf-configs/oa-cflgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT2"
        symbol_name="RenderBasic"
@@ -5462,7 +5462,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6092,7 +6092,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6723,7 +6723,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7319,7 +7319,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7959,7 +7959,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8598,7 +8598,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9277,7 +9277,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9961,7 +9961,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-cflgt3.xml b/lib/i915/perf-configs/oa-cflgt3.xml
index 94396984..9ac9156a 100644
--- a/lib/i915/perf-configs/oa-cflgt3.xml
+++ b/lib/i915/perf-configs/oa-cflgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT3"
        symbol_name="RenderBasic"
@@ -5475,7 +5475,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6106,7 +6106,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6737,7 +6737,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7333,7 +7333,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7973,7 +7973,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8612,7 +8612,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9291,7 +9291,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9975,7 +9975,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-chv.xml b/lib/i915/perf-configs/oa-chv.xml
index 2f13447e..5d612773 100644
--- a/lib/i915/perf-configs/oa-chv.xml
+++ b/lib/i915/perf-configs/oa-chv.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1599482526" merge_md5="">
   <set name="Render Metrics Basic Gen8LP"
        chipset="CHV"
        symbol_name="RenderBasic"
@@ -2736,7 +2736,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -3410,7 +3410,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -4091,7 +4091,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -4759,7 +4759,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -5443,7 +5443,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6216,7 +6216,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6946,7 +6946,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7682,7 +7682,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8496,7 +8496,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9353,7 +9353,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-glk.xml b/lib/i915/perf-configs/oa-glk.xml
index 38d9a172..9eee97cf 100644
--- a/lib/i915/perf-configs/oa-glk.xml
+++ b/lib/i915/perf-configs/oa-glk.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="GLK"
        symbol_name="RenderBasic"
@@ -5454,7 +5454,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6072,7 +6072,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6754,7 +6754,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7403,7 +7403,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8106,7 +8106,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8808,7 +8808,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-hsw.xml b/lib/i915/perf-configs/oa-hsw.xml
index b3ba90bb..5dce984b 100644
--- a/lib/i915/perf-configs/oa-hsw.xml
+++ b/lib/i915/perf-configs/oa-hsw.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1599482684" merge_md5="">
   <set name="Render Metrics Basic Gen7.5"
        chipset="HSW"
        symbol_name="RenderBasic"
@@ -825,7 +825,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -839,7 +839,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -854,7 +854,7 @@
              max_equation="$GpuCoreClocks 64 UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="PERFCNT1 READ_REG C 7 READ USUB 64 UMUL"
+             equation="PERFCNT 0 READ C 7 READ USUB 64 UMUL"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -1733,7 +1733,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -1747,7 +1747,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -2085,7 +2085,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -2099,7 +2099,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -2888,7 +2888,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -2902,7 +2902,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -3689,7 +3689,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -3703,7 +3703,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -3718,7 +3718,7 @@
              max_equation="$GpuCoreClocks 64 UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="PERFCNT1 READ_REG $LlcWrAccesses USUB 64 UMUL $LlcWrAccesses 32 UMUL UADD"
+             equation="PERFCNT 0 READ $LlcWrAccesses USUB 64 UMUL $LlcWrAccesses 32 UMUL UADD"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -4536,7 +4536,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT1 READ_REG"
+             equation="PERFCNT 0 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
@@ -4550,7 +4550,7 @@
              data_type="uint64"
              units="messages"
              semantic_type="event"
-             equation="PERFCNT2 READ_REG"
+             equation="PERFCNT 1 READ"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="LLC"
              mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-kblgt2.xml b/lib/i915/perf-configs/oa-kblgt2.xml
index f7b80f9f..6137be6c 100644
--- a/lib/i915/perf-configs/oa-kblgt2.xml
+++ b/lib/i915/perf-configs/oa-kblgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT2"
        symbol_name="RenderBasic"
@@ -5462,7 +5462,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6092,7 +6092,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6723,7 +6723,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7319,7 +7319,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7959,7 +7959,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8598,7 +8598,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9277,7 +9277,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9961,7 +9961,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-kblgt3.xml b/lib/i915/perf-configs/oa-kblgt3.xml
index 2ff35b51..117a2889 100644
--- a/lib/i915/perf-configs/oa-kblgt3.xml
+++ b/lib/i915/perf-configs/oa-kblgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT3"
        symbol_name="RenderBasic"
@@ -5475,7 +5475,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6106,7 +6106,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6737,7 +6737,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7333,7 +7333,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7973,7 +7973,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8612,7 +8612,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9291,7 +9291,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9975,7 +9975,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-sklgt2.xml b/lib/i915/perf-configs/oa-sklgt2.xml
index 78aefae2..f1125bd2 100644
--- a/lib/i915/perf-configs/oa-sklgt2.xml
+++ b/lib/i915/perf-configs/oa-sklgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356967" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT2"
        symbol_name="RenderBasic"
@@ -5986,7 +5986,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6617,7 +6617,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7249,7 +7249,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7846,7 +7846,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8487,7 +8487,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9127,7 +9127,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9807,7 +9807,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -10492,7 +10492,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-sklgt3.xml b/lib/i915/perf-configs/oa-sklgt3.xml
index 1d1d4d6f..0870791f 100644
--- a/lib/i915/perf-configs/oa-sklgt3.xml
+++ b/lib/i915/perf-configs/oa-sklgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356967" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT3"
        symbol_name="RenderBasic"
@@ -5475,7 +5475,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6105,7 +6105,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6736,7 +6736,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7332,7 +7332,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7972,7 +7972,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8611,7 +8611,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9290,7 +9290,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9974,7 +9974,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/oa-sklgt4.xml b/lib/i915/perf-configs/oa-sklgt4.xml
index eac1984c..4e223a86 100644
--- a/lib/i915/perf-configs/oa-sklgt4.xml
+++ b/lib/i915/perf-configs/oa-sklgt4.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356968" merge_md5="">
+<metrics version="1599482527" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT4"
        symbol_name="RenderBasic"
@@ -5469,7 +5469,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6099,7 +6099,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -6730,7 +6730,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7326,7 +7326,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -7966,7 +7966,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -8605,7 +8605,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9284,7 +9284,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
@@ -9968,7 +9968,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="PERFCNT1 READ_REG 100 UMUL $GpuCoreClocks FDIV"
+             equation="PERFCNT 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="true $QueryMode &amp;&amp;"
              mdapi_group="GTI"
              mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index d11546b8..63616c41 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -124,6 +124,7 @@ def generate_metric_sets(args, gen):
                 metric_set->a_offset = 1;
                 metric_set->b_offset = metric_set->a_offset + 45;
                 metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->c_offset + 8;
 
             """))
         else:
@@ -136,6 +137,7 @@ def generate_metric_sets(args, gen):
                 metric_set->a_offset = 2;
                 metric_set->b_offset = metric_set->a_offset + 36;
                 metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->c_offset + 8;
 
             """))
 
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 00ac2f6f..99de12e5 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -116,7 +116,7 @@ typedef enum {
 
 /* Hold deltas of raw performance counters. */
 struct intel_perf_accumulator {
-#define INTEL_PERF_MAX_RAW_OA_COUNTERS 62
+#define INTEL_PERF_MAX_RAW_OA_COUNTERS 64
 	uint64_t deltas[INTEL_PERF_MAX_RAW_OA_COUNTERS];
 };
 
@@ -174,6 +174,7 @@ struct intel_perf_metric_set {
 	int a_offset;
 	int b_offset;
 	int c_offset;
+	int perfcnt_offset;
 
 	struct intel_perf_register_prog *b_counter_regs;
 	uint32_t n_b_counter_regs;
diff --git a/lib/meson.build b/lib/meson.build
index cdde0f63..3f927756 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -281,7 +281,7 @@ pkgconf.set('prefix', get_option('prefix'))
 pkgconf.set('exec_prefix', '${prefix}')
 pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
 pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
-pkgconf.set('i915_perf_version', '1.0.0')
+pkgconf.set('i915_perf_version', '1.2.0')
 
 configure_file(
   input : 'i915-perf.pc.in',
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
