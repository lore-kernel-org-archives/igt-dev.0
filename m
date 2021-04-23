Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB856EB4C
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 07:44:51 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 23 Apr 2021 10:44:38 +0300
Message-Id: <20210423074444.175199-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
References: <20210423074444.175199-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/8] lib/i915/perf-configs: rename metric
 descriptions
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

There is an effort to drop the "Gen" prefix from much of our codebase.
This just applies this to the metrics.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/oa-adl.xml    | 18 +++++++++---------
 lib/i915/perf-configs/oa-bdw.xml    | 24 ++++++++++++------------
 lib/i915/perf-configs/oa-bxt.xml    | 24 ++++++++++++------------
 lib/i915/perf-configs/oa-cflgt2.xml | 26 +++++++++++++-------------
 lib/i915/perf-configs/oa-cflgt3.xml | 26 +++++++++++++-------------
 lib/i915/perf-configs/oa-chv.xml    |  8 ++++----
 lib/i915/perf-configs/oa-cnl.xml    | 16 ++++++++--------
 lib/i915/perf-configs/oa-dg1.xml    | 18 +++++++++---------
 lib/i915/perf-configs/oa-ehl.xml    | 20 ++++++++++----------
 lib/i915/perf-configs/oa-glk.xml    | 20 ++++++++++----------
 lib/i915/perf-configs/oa-hsw.xml    | 12 ++++++------
 lib/i915/perf-configs/oa-icl.xml    | 20 ++++++++++----------
 lib/i915/perf-configs/oa-kblgt2.xml | 22 +++++++++++-----------
 lib/i915/perf-configs/oa-kblgt3.xml | 22 +++++++++++-----------
 lib/i915/perf-configs/oa-rkl.xml    | 20 ++++++++++----------
 lib/i915/perf-configs/oa-sklgt2.xml | 22 +++++++++++-----------
 lib/i915/perf-configs/oa-sklgt3.xml | 22 +++++++++++-----------
 lib/i915/perf-configs/oa-sklgt4.xml | 22 +++++++++++-----------
 lib/i915/perf-configs/oa-tglgt1.xml | 20 ++++++++++----------
 lib/i915/perf-configs/oa-tglgt2.xml | 20 ++++++++++----------
 20 files changed, 201 insertions(+), 201 deletions(-)

diff --git a/lib/i915/perf-configs/oa-adl.xml b/lib/i915/perf-configs/oa-adl.xml
index 9fd19c0e5..eccab783f 100644
--- a/lib/i915/perf-configs/oa-adl.xml
+++ b/lib/i915/perf-configs/oa-adl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1613131583" merge_md5="">
-  <set name="Render Metrics Basic Gen12"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="ADL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -1017,7 +1017,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="ADL"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -3081,7 +3081,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_1"
+  <set name="L3_1"
        chipset="ADL"
        symbol_name="L3_1"
        underscore_name="l3_1"
@@ -3422,7 +3422,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_2"
+  <set name="L3_2"
        chipset="ADL"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -3764,7 +3764,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_3"
+  <set name="L3_3"
        chipset="ADL"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -4030,7 +4030,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_4"
+  <set name="L3_4"
        chipset="ADL"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -4296,7 +4296,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_5"
+  <set name="L3_5"
        chipset="ADL"
        symbol_name="L3_5"
        underscore_name="l3_5"
@@ -4562,7 +4562,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_6"
+  <set name="L3_6"
        chipset="ADL"
        symbol_name="L3_6"
        underscore_name="l3_6"
diff --git a/lib/i915/perf-configs/oa-bdw.xml b/lib/i915/perf-configs/oa-bdw.xml
index 8581330cb..247fec4f6 100644
--- a/lib/i915/perf-configs/oa-bdw.xml
+++ b/lib/i915/perf-configs/oa-bdw.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1599482526" merge_md5="">
-  <set name="Render Metrics Basic Gen8"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="BDW"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -969,7 +969,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen8"
+  <set name="Compute Metrics Basic set"
        chipset="BDW"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -2467,7 +2467,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen8"
+  <set name="Memory Reads Distribution metric set"
        chipset="BDW"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -3120,7 +3120,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen8"
+  <set name="Memory Writes Distribution metric set"
        chipset="BDW"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3759,7 +3759,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen8"
+  <set name="Compute Metrics Extended metric set"
        chipset="BDW"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4984,7 +4984,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen8"
+  <set name="Compute Metrics L3 Cache metric set"
        chipset="BDW"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -5916,7 +5916,7 @@
     </register_config>
   </set>
 
-  <set name="Data Port Reads Coalescing Gen8"
+  <set name="Data Port Reads Coalescing metric set"
        chipset="BDW"
        symbol_name="DataPortReadsCoalescing"
        underscore_name="data_port_reads_coalescing"
@@ -6546,7 +6546,7 @@
     </register_config>
   </set>
 
-  <set name="Data Port Writes Coalescing Gen8"
+  <set name="Data Port Writes Coalescing metric set"
        chipset="BDW"
        symbol_name="DataPortWritesCoalescing"
        underscore_name="data_port_writes_coalescing"
@@ -14613,7 +14613,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen8"
+  <set name="Compute Metrics Extra set"
        chipset="BDW"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -14802,7 +14802,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen8"
+  <set name="Media Vme Pipe metric set"
        chipset="BDW"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -15243,7 +15243,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen8"
+  <set name="MDAPI testing set"
        chipset="BDW"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-bxt.xml b/lib/i915/perf-configs/oa-bxt.xml
index 891cbf2bd..bd034e9a0 100644
--- a/lib/i915/perf-configs/oa-bxt.xml
+++ b/lib/i915/perf-configs/oa-bxt.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="BXT"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -825,7 +825,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="BXT"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1450,7 +1450,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="BXT"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2175,7 +2175,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metric set"
        chipset="BXT"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2812,7 +2812,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metric set"
        chipset="BXT"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3450,7 +3450,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended metric set"
        chipset="BXT"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4092,7 +4092,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache metric set"
        chipset="BXT"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -8984,7 +8984,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="BXT"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -9117,7 +9117,7 @@
     </register_config>
   </set>
 
-  <set name="Gpu Rings Busyness"
+  <set name="Gpu Rings Busyness metrics set"
        chipset="BXT"
        symbol_name="GpuBusyness"
        underscore_name="gpu_busyness"
@@ -9277,7 +9277,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="BXT"
        symbol_name="TestOa"
        underscore_name="test_oa"
@@ -9592,7 +9592,7 @@
     </register_config>
   </set>
 
-  <set name="AsyncCompute"
+  <set name="AsyncCompute metrics set"
        chipset="BXT"
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
diff --git a/lib/i915/perf-configs/oa-cflgt2.xml b/lib/i915/perf-configs/oa-cflgt2.xml
index c5b954139..9ef17769b 100644
--- a/lib/i915/perf-configs/oa-cflgt2.xml
+++ b/lib/i915/perf-configs/oa-cflgt2.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="CFLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -812,7 +812,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="CFLGT2"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1443,7 +1443,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="CFLGT2"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2188,7 +2188,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="CFLGT2"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2828,7 +2828,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="CFLGT2"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3469,7 +3469,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="CFLGT2"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4090,7 +4090,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="CFLGT2"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10032,7 +10032,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="CFLGT2"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10160,7 +10160,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="CFLGT2"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10393,7 +10393,7 @@
     </register_config>
   </set>
 
-  <set name="Gpu Rings Busyness"
+  <set name="Gpu Rings Busyness metrics set"
        chipset="CFLGT2"
        symbol_name="GpuBusyness"
        underscore_name="gpu_busyness"
@@ -10557,7 +10557,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9.5"
+  <set name="MDAPI testing set"
        chipset="CFLGT2"
        symbol_name="TestOa"
        underscore_name="test_oa"
@@ -10866,7 +10866,7 @@
     </register_config>
   </set>
 
-  <set name="AsyncCompute"
+  <set name="AsyncCompute metrics set"
        chipset="CFLGT2"
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
diff --git a/lib/i915/perf-configs/oa-cflgt3.xml b/lib/i915/perf-configs/oa-cflgt3.xml
index 71f00b57b..aa1be6a6d 100644
--- a/lib/i915/perf-configs/oa-cflgt3.xml
+++ b/lib/i915/perf-configs/oa-cflgt3.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843831" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="CFLGT3"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -825,7 +825,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="CFLGT3"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1456,7 +1456,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="CFLGT3"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2201,7 +2201,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="CFLGT3"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2841,7 +2841,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="CFLGT3"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3482,7 +3482,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended metrics set"
        chipset="CFLGT3"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4103,7 +4103,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache metrics set"
        chipset="CFLGT3"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10046,7 +10046,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="CFLGT3"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10194,7 +10194,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="CFLGT3"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10438,7 +10438,7 @@
     </register_config>
   </set>
 
-  <set name="Gpu Rings Busyness"
+  <set name="Gpu Rings Busyness metrics set"
        chipset="CFLGT3"
        symbol_name="GpuBusyness"
        underscore_name="gpu_busyness"
@@ -10624,7 +10624,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="CFLGT3"
        symbol_name="TestOa"
        underscore_name="test_oa"
@@ -10933,7 +10933,7 @@
     </register_config>
   </set>
 
-  <set name="AsyncCompute"
+  <set name="AsyncCompute metrics set"
        chipset="CFLGT3"
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
diff --git a/lib/i915/perf-configs/oa-chv.xml b/lib/i915/perf-configs/oa-chv.xml
index 5d612773c..ef01dc6c1 100644
--- a/lib/i915/perf-configs/oa-chv.xml
+++ b/lib/i915/perf-configs/oa-chv.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1599482526" merge_md5="">
-  <set name="Render Metrics Basic Gen8LP"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="CHV"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -785,7 +785,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen8LP"
+  <set name="Compute Metrics Basic set"
        chipset="CHV"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -9549,7 +9549,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen8LP"
+  <set name="MDAPI testing set"
        chipset="CHV"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-cnl.xml b/lib/i915/perf-configs/oa-cnl.xml
index cb7eb8c69..d787f4bf4 100644
--- a/lib/i915/perf-configs/oa-cnl.xml
+++ b/lib/i915/perf-configs/oa-cnl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843831" merge_md5="">
-  <set name="Render Metrics Basic Gen10"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="CNL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -829,7 +829,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen10"
+  <set name="Compute Metrics Basic set"
        chipset="CNL"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1511,7 +1511,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen10"
+  <set name="Render Metrics for 3D Pipeline Profile set"
        chipset="CNL"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2259,7 +2259,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen10"
+  <set name="Memory Reads Distribution metrics set"
        chipset="CNL"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2883,7 +2883,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen10"
+  <set name="Memory Writes Distribution metrics set"
        chipset="CNL"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3506,7 +3506,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen10"
+  <set name="Compute Metrics Extended metrics set"
        chipset="CNL"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4135,7 +4135,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen10"
+  <set name="Compute Metrics L3 Cache metrics set"
        chipset="CNL"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
diff --git a/lib/i915/perf-configs/oa-dg1.xml b/lib/i915/perf-configs/oa-dg1.xml
index 9e3732027..0f0d07677 100644
--- a/lib/i915/perf-configs/oa-dg1.xml
+++ b/lib/i915/perf-configs/oa-dg1.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1598358394" merge_md5="">
-  <set name="Render Metrics Basic Gen12"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="DG1"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -566,7 +566,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic"
+  <set name="Compute Metrics Basic set"
        chipset="DG1"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -3118,7 +3118,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_1"
+  <set name="L3_1"
        chipset="DG1"
        symbol_name="L3_1"
        underscore_name="l3_1"
@@ -3469,7 +3469,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_2"
+  <set name="L3_2"
        chipset="DG1"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -3825,7 +3825,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_3"
+  <set name="L3_3"
        chipset="DG1"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -4096,7 +4096,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_4"
+  <set name="L3_4"
        chipset="DG1"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -4368,7 +4368,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_5"
+  <set name="L3_5"
        chipset="DG1"
        symbol_name="L3_5"
        underscore_name="l3_5"
@@ -4640,7 +4640,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_6"
+  <set name="L3_6"
        chipset="DG1"
        symbol_name="L3_6"
        underscore_name="l3_6"
diff --git a/lib/i915/perf-configs/oa-ehl.xml b/lib/i915/perf-configs/oa-ehl.xml
index 4a6af977c..d84c22be3 100644
--- a/lib/i915/perf-configs/oa-ehl.xml
+++ b/lib/i915/perf-configs/oa-ehl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843831" merge_md5="">
-  <set name="Render Metrics Basic Gen11"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="EHL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -647,7 +647,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen11"
+  <set name="Compute Metrics Basic set"
        chipset="EHL"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1324,7 +1324,7 @@
     </register_config>
   </set>
 
-  <set name="ComputeExtended Gen11"
+  <set name="ComputeExtended metrics set"
        chipset="EHL"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -1759,7 +1759,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen11"
+  <set name="Compute Metrics L3 Cache set"
        chipset="EHL"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -2627,7 +2627,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen11"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="EHL"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -5411,7 +5411,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank0 stalled metric set"
+  <set name="L2Bank0 stalled metric set"
        chipset="EHL"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -5864,7 +5864,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank1 stalled metric set"
+  <set name="L2Bank1 stalled metric set"
        chipset="EHL"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -6317,7 +6317,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank4 stalled metric set"
+  <set name="L2Bank4 stalled metric set"
        chipset="EHL"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -6799,7 +6799,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank5 stalled metric set"
+  <set name="L2Bank5 stalled metric set"
        chipset="EHL"
        symbol_name="L3_5"
        underscore_name="l3_5"
diff --git a/lib/i915/perf-configs/oa-glk.xml b/lib/i915/perf-configs/oa-glk.xml
index 9eee97cfe..84448e16d 100644
--- a/lib/i915/perf-configs/oa-glk.xml
+++ b/lib/i915/perf-configs/oa-glk.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="GLK"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -822,7 +822,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="GLK"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1447,7 +1447,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="GLK"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2172,7 +2172,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="GLK"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2809,7 +2809,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="GLK"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3447,7 +3447,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="GLK"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4089,7 +4089,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="GLK"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -8895,7 +8895,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="GLK"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -9028,7 +9028,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="GLK"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-hsw.xml b/lib/i915/perf-configs/oa-hsw.xml
index 5dce984b7..64faf9193 100644
--- a/lib/i915/perf-configs/oa-hsw.xml
+++ b/lib/i915/perf-configs/oa-hsw.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1599482684" merge_md5="">
-  <set name="Render Metrics Basic Gen7.5"
+<metrics version="1619078709" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="HSW"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -1041,7 +1041,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen7.5"
+  <set name="Compute Metrics Basic set"
        chipset="HSW"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1811,7 +1811,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen7.5"
+  <set name="Compute Metrics Extended set"
        chipset="HSW"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -2150,7 +2150,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen7.5"
+  <set name="Memory Reads Distribution set"
        chipset="HSW"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2964,7 +2964,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen7.5"
+  <set name="Memory Writes Distribution set"
        chipset="HSW"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index 053507cc8..20bfe3ee3 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843831" merge_md5="">
-  <set name="Render Metrics Basic Gen11"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="ICL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -648,7 +648,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen11"
+  <set name="Compute Metrics Basic set"
        chipset="ICL"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1327,7 +1327,7 @@
     </register_config>
   </set>
 
-  <set name="ComputeExtended Gen11"
+  <set name="Compute Extended metrics set"
        chipset="ICL"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -1763,7 +1763,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen11"
+  <set name="Compute Metrics L3 Cache metrics set"
        chipset="ICL"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -2595,7 +2595,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen11"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="ICL"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -5392,7 +5392,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank0 stalled metric set"
+  <set name="L2Bank0 stalled metric set"
        chipset="ICL"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -5845,7 +5845,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank1 stalled metric set"
+  <set name="L2Bank1 stalled metric set"
        chipset="ICL"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -6298,7 +6298,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank4 stalled metric set"
+  <set name="L2Bank4 stalled metric set"
        chipset="ICL"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -6780,7 +6780,7 @@
     </register_config>
   </set>
 
-  <set name="Gen11 L2Bank5 stalled metric set"
+  <set name="L2Bank5 stalled metric set"
        chipset="ICL"
        symbol_name="L3_5"
        underscore_name="l3_5"
diff --git a/lib/i915/perf-configs/oa-kblgt2.xml b/lib/i915/perf-configs/oa-kblgt2.xml
index 93f1e2c37..a785f70f0 100644
--- a/lib/i915/perf-configs/oa-kblgt2.xml
+++ b/lib/i915/perf-configs/oa-kblgt2.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="KBLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -812,7 +812,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="KBLGT2"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1443,7 +1443,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="KBLGT2"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2188,7 +2188,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="KBLGT2"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2828,7 +2828,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="KBLGT2"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3469,7 +3469,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="KBLGT2"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4090,7 +4090,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="KBLGT2"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10032,7 +10032,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="KBLGT2"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10160,7 +10160,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="KBLGT2"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10557,7 +10557,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9.5"
+  <set name="MDAPI testing set"
        chipset="KBLGT2"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-kblgt3.xml b/lib/i915/perf-configs/oa-kblgt3.xml
index c1017a470..c50de3f39 100644
--- a/lib/i915/perf-configs/oa-kblgt3.xml
+++ b/lib/i915/perf-configs/oa-kblgt3.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="KBLGT3"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -825,7 +825,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="KBLGT3"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1456,7 +1456,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="KBLGT3"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2201,7 +2201,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="KBLGT3"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2841,7 +2841,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="KBLGT3"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3482,7 +3482,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="KBLGT3"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4103,7 +4103,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="KBLGT3"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10046,7 +10046,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="KBLGT3"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10194,7 +10194,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="KBLGT3"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10624,7 +10624,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="KBLGT3"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-rkl.xml b/lib/i915/perf-configs/oa-rkl.xml
index 0604289a0..8b5345384 100644
--- a/lib/i915/perf-configs/oa-rkl.xml
+++ b/lib/i915/perf-configs/oa-rkl.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1598357673" merge_md5="">
-  <set name="Render Metrics Basic Gen12"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="RKL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -572,7 +572,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic"
+  <set name="Compute Metrics Basic set"
        chipset="RKL"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1030,7 +1030,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="RKL"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2856,7 +2856,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_1"
+  <set name="L3_1"
        chipset="RKL"
        symbol_name="L3_1"
        underscore_name="l3_1"
@@ -3144,7 +3144,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_2"
+  <set name="L3_2"
        chipset="RKL"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -3433,7 +3433,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_3"
+  <set name="L3_3"
        chipset="RKL"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -3676,7 +3676,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_4"
+  <set name="L3_4"
        chipset="RKL"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -3918,7 +3918,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_5"
+  <set name="L3_5"
        chipset="RKL"
        symbol_name="L3_5"
        underscore_name="l3_5"
@@ -4160,7 +4160,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_6"
+  <set name="L3_6"
        chipset="RKL"
        symbol_name="L3_6"
        underscore_name="l3_6"
diff --git a/lib/i915/perf-configs/oa-sklgt2.xml b/lib/i915/perf-configs/oa-sklgt2.xml
index fbd49ba65..433c1d153 100644
--- a/lib/i915/perf-configs/oa-sklgt2.xml
+++ b/lib/i915/perf-configs/oa-sklgt2.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="SKLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -815,7 +815,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="SKLGT2"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1531,7 +1531,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="SKLGT2"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2400,7 +2400,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="SKLGT2"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -3173,7 +3173,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="SKLGT2"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3988,7 +3988,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended metrics set"
        chipset="SKLGT2"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4613,7 +4613,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache metrics set"
        chipset="SKLGT2"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10564,7 +10564,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="SKLGT2"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10692,7 +10692,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="SKLGT2"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -11587,7 +11587,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="SKLGT2"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-sklgt3.xml b/lib/i915/perf-configs/oa-sklgt3.xml
index 98c3374bd..c5f646e62 100644
--- a/lib/i915/perf-configs/oa-sklgt3.xml
+++ b/lib/i915/perf-configs/oa-sklgt3.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="SKLGT3"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -825,7 +825,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="SKLGT3"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1456,7 +1456,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="SKLGT3"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2201,7 +2201,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="SKLGT3"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2841,7 +2841,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="SKLGT3"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3482,7 +3482,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="SKLGT3"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4103,7 +4103,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="SKLGT3"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10045,7 +10045,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="SKLGT3"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10193,7 +10193,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="SKLGT3"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10624,7 +10624,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="SKLGT3"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-sklgt4.xml b/lib/i915/perf-configs/oa-sklgt4.xml
index 77415661e..faa15afc4 100644
--- a/lib/i915/perf-configs/oa-sklgt4.xml
+++ b/lib/i915/perf-configs/oa-sklgt4.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1609843830" merge_md5="">
-  <set name="Render Metrics Basic Gen9"
+<metrics version="1619078710" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="SKLGT4"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -819,7 +819,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic Gen9"
+  <set name="Compute Metrics Basic set"
        chipset="SKLGT4"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1450,7 +1450,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile Gen9"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="SKLGT4"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2195,7 +2195,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Reads Distribution Gen9"
+  <set name="Memory Reads Distribution metrics set"
        chipset="SKLGT4"
        symbol_name="MemoryReads"
        underscore_name="memory_reads"
@@ -2835,7 +2835,7 @@
     </register_config>
   </set>
 
-  <set name="Memory Writes Distribution Gen9"
+  <set name="Memory Writes Distribution metrics set"
        chipset="SKLGT4"
        symbol_name="MemoryWrites"
        underscore_name="memory_writes"
@@ -3476,7 +3476,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extended Gen9"
+  <set name="Compute Metrics Extended set"
        chipset="SKLGT4"
        symbol_name="ComputeExtended"
        underscore_name="compute_extended"
@@ -4097,7 +4097,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics L3 Cache Gen9"
+  <set name="Compute Metrics L3 Cache set"
        chipset="SKLGT4"
        symbol_name="ComputeL3Cache"
        underscore_name="compute_l3_cache"
@@ -10039,7 +10039,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Extra Gen9"
+  <set name="Compute Metrics Extra set"
        chipset="SKLGT4"
        symbol_name="ComputeExtra"
        underscore_name="compute_extra"
@@ -10216,7 +10216,7 @@
     </register_config>
   </set>
 
-  <set name="Media Vme Pipe Gen9"
+  <set name="Media Vme Pipe metrics set"
        chipset="SKLGT4"
        symbol_name="VMEPipe"
        underscore_name="vme_pipe"
@@ -10647,7 +10647,7 @@
     </register_config>
   </set>
 
-  <set name="MDAPI testing set Gen9"
+  <set name="MDAPI testing set"
        chipset="SKLGT4"
        symbol_name="TestOa"
        underscore_name="test_oa"
diff --git a/lib/i915/perf-configs/oa-tglgt1.xml b/lib/i915/perf-configs/oa-tglgt1.xml
index 84cb2802b..9ef67b2f5 100644
--- a/lib/i915/perf-configs/oa-tglgt1.xml
+++ b/lib/i915/perf-configs/oa-tglgt1.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1598354173" merge_md5="">
-  <set name="Render Metrics Basic Gen12"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="TGLGT1"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -568,7 +568,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic"
+  <set name="Compute Metrics Basic set"
        chipset="TGLGT1"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1026,7 +1026,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="TGLGT1"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -2894,7 +2894,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_1"
+  <set name="L3_1"
        chipset="TGLGT1"
        symbol_name="L3_1"
        underscore_name="l3_1"
@@ -3169,7 +3169,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_2"
+  <set name="L3_2"
        chipset="TGLGT1"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -3445,7 +3445,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_3"
+  <set name="L3_3"
        chipset="TGLGT1"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -3683,7 +3683,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_4"
+  <set name="L3_4"
        chipset="TGLGT1"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -3921,7 +3921,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_5"
+  <set name="L3_5"
        chipset="TGLGT1"
        symbol_name="L3_5"
        underscore_name="l3_5"
@@ -4159,7 +4159,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_6"
+  <set name="L3_6"
        chipset="TGLGT1"
        symbol_name="L3_6"
        underscore_name="l3_6"
diff --git a/lib/i915/perf-configs/oa-tglgt2.xml b/lib/i915/perf-configs/oa-tglgt2.xml
index 2108e8100..c39edc8c8 100644
--- a/lib/i915/perf-configs/oa-tglgt2.xml
+++ b/lib/i915/perf-configs/oa-tglgt2.xml
@@ -1,6 +1,6 @@
 <?xml version="1.0"?>
-<metrics version="1598354174" merge_md5="">
-  <set name="Render Metrics Basic Gen12"
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
        chipset="TGLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
@@ -562,7 +562,7 @@
     </register_config>
   </set>
 
-  <set name="Compute Metrics Basic"
+  <set name="Compute Metrics Basic set"
        chipset="TGLGT2"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
@@ -1020,7 +1020,7 @@
     </register_config>
   </set>
 
-  <set name="Render Metrics for 3D Pipeline Profile"
+  <set name="Render Metrics set for 3D Pipeline Profile"
        chipset="TGLGT2"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
@@ -3096,7 +3096,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_1"
+  <set name="L3_1"
        chipset="TGLGT2"
        symbol_name="L3_1"
        underscore_name="l3_1"
@@ -3442,7 +3442,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_2"
+  <set name="L3_2"
        chipset="TGLGT2"
        symbol_name="L3_2"
        underscore_name="l3_2"
@@ -3789,7 +3789,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_3"
+  <set name="L3_3"
        chipset="TGLGT2"
        symbol_name="L3_3"
        underscore_name="l3_3"
@@ -4056,7 +4056,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_4"
+  <set name="L3_4"
        chipset="TGLGT2"
        symbol_name="L3_4"
        underscore_name="l3_4"
@@ -4323,7 +4323,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_5"
+  <set name="L3_5"
        chipset="TGLGT2"
        symbol_name="L3_5"
        underscore_name="l3_5"
@@ -4590,7 +4590,7 @@
     </register_config>
   </set>
 
-  <set name="Gen12LP L3_6"
+  <set name="L3_6"
        chipset="TGLGT2"
        symbol_name="L3_6"
        underscore_name="l3_6"
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
