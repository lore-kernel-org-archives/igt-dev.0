Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2692D6E0DA
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:03 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:45 +0200
Message-Id: <20210105111749.463432-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] lib/i915/perf: update Gen11 RenderBasic
 programming
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

Simple order change.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml  | 4 ++--
 lib/i915/perf-configs/oa-ehl.xml | 6 +++---
 lib/i915/perf-configs/oa-icl.xml | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index e30f19bbf..75e7bc87d 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -268,7 +268,7 @@
     <guid config_hash="4bfffb81b9376af931bad919fc66ef3f" mdapi_config_hash="33d7ba5d98519f3038ed07f273fe5f91" id="c46c7bb5-f26d-4634-b491-902394af85b1" chipset="cnl" name="TDL_1" />
     <guid config_hash="e5419b6c232500a6a824c2c58f3b7d32" mdapi_config_hash="b9a01044b9befe9fcf952f26ba4fcc4e" id="aa2d6ab4-99b3-42f8-94d6-4a9aa2baedaf" chipset="cnl" name="TDL_2" />
     <guid config_hash="ebd014335c55b7be47615354eecae7a5" mdapi_config_hash="21595af7d9d76b7f414c744aeaddbe1d" id="99517a69-b9a7-4124-8f59-06645ea13187" chipset="cnl" name="TestOa" />
-    <guid config_hash="eaaf4df3ac5e9b4fd52d980f0be72dbf" mdapi_config_hash="8ef6088f425f2a97b01bed560ad6e2b3" id="193093b2-da24-49bf-b407-442c213b71b4" chipset="icl" name="RenderBasic" />
+    <guid config_hash="463b3bb46dec1a41472c2a728142ff56" mdapi_config_hash="f29cb304efd62d8712b594d864c6ab86" id="e3cd52cf-c6b0-4019-b369-3bc9c75a0cbc" chipset="icl" name="RenderBasic" />
     <guid config_hash="8b7f8030265ee506c24ec10d17ab8f1a" mdapi_config_hash="f22218a44add1267d4fad705b511323c" id="12ca7e9c-55cb-45cd-9f87-4fc821488e6d" chipset="icl" name="ComputeBasic" />
     <guid config_hash="3b6635eb3709f346076901ea88ec1f2b" mdapi_config_hash="402f156b276dfaaaf84eb09ec5347515" id="43eb7fc1-dc5e-45e2-a90a-0053f5397271" chipset="icl" name="ComputeExtended" />
     <guid config_hash="0e47ea7e90aac987097968a231d2dada" mdapi_config_hash="08ff26b1c2405cc1061e71940cf558b5" id="05d5e01f-0800-4975-b36b-7b169cad3fab" chipset="icl" name="ComputeL3Cache" />
@@ -288,7 +288,7 @@
     <guid config_hash="b421b29d8557dbbf0fe3068c82b3d8dd" mdapi_config_hash="cc850ab4463c23e6017f069d67785c31" id="40dc79f2-88c8-47c6-8f86-f509e39fbe5d" chipset="icl" name="GpuBusyness" />
     <guid config_hash="3abb2f3338c8d2b6aff2a869ee9030d9" mdapi_config_hash="0b64f16be99304796735d1bd7b6e580a" id="e617cfd5-6cc5-4143-8994-cd36cebb921f" chipset="icl" name="TestOa" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="7d863af6-be13-4f00-822d-33f58c8df9e7" chipset="icl" name="AsyncCompute" />
-    <guid config_hash="25380f09a9ab454374c78f1b5d1c4ddf" mdapi_config_hash="4d28665f4702ddf38239e5c47384dc15" id="a95112cc-804a-4c80-b57b-2870e56cc240" chipset="ehl" name="RenderBasic" />
+    <guid config_hash="878466bee64e6505fde4118ceadff299" mdapi_config_hash="653d46ab9ef10a2b7f511fe3f067e0ee" id="c693e665-867f-4362-91b6-85337f932010" chipset="ehl" name="RenderBasic" />
     <guid config_hash="bf521fa74e9f5285bc3e9a7215cdadd2" mdapi_config_hash="bf085a519814344b241b08064f256921" id="54449e8a-196b-4c43-8ecd-540b0504b5c1" chipset="ehl" name="ComputeBasic" />
     <guid config_hash="9b6d58e5047c130f47999e04b92151e8" mdapi_config_hash="7bf6ffff6913e5536d4ad4dc4fa3b03b" id="05700b63-f044-4c79-b8ae-676972114745" chipset="ehl" name="ComputeExtended" />
     <guid config_hash="1819d0fc7e1274aaed4dc79670eb4d33" mdapi_config_hash="6ff2fcd2498448af0ed284e69be555a8" id="89e1f7ae-1100-4b4f-92f3-0caf88e3d833" chipset="ehl" name="ComputeL3Cache" />
diff --git a/lib/i915/perf-configs/oa-ehl.xml b/lib/i915/perf-configs/oa-ehl.xml
index a4ddcd0dd..b08437f0c 100644
--- a/lib/i915/perf-configs/oa-ehl.xml
+++ b/lib/i915/perf-configs/oa-ehl.xml
@@ -1,11 +1,11 @@
 <?xml version="1.0"?>
-<metrics version="1609842445" merge_md5="">
+<metrics version="1609843132" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="EHL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="a95112cc-804a-4c80-b57b-2870e56cc240"
+       hw_config_guid="c693e665-867f-4362-91b6-85337f932010"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -638,12 +638,12 @@
         <register type="OA" address="0x00002724" value="0x00800000" />
     </register_config>
     <register_config type="FLEX">
-        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
         <register type="FLEX" address="0x0000E458" value="0x00005004" />
         <register type="FLEX" address="0x0000E558" value="0x00010003" />
         <register type="FLEX" address="0x0000E658" value="0x00012011" />
         <register type="FLEX" address="0x0000E758" value="0x00051050" />
         <register type="FLEX" address="0x0000E45C" value="0x00000052" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index bc299de49..2bfccd600 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,11 +1,11 @@
 <?xml version="1.0"?>
-<metrics version="1609842547" merge_md5="">
+<metrics version="1609843132" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="193093b2-da24-49bf-b407-442c213b71b4"
+       hw_config_guid="e3cd52cf-c6b0-4019-b369-3bc9c75a0cbc"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -639,12 +639,12 @@
         <register type="OA" address="0x00002724" value="0x00800000" />
     </register_config>
     <register_config type="FLEX">
-        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
         <register type="FLEX" address="0x0000E458" value="0x00005004" />
         <register type="FLEX" address="0x0000E558" value="0x00010003" />
         <register type="FLEX" address="0x0000E658" value="0x00012011" />
         <register type="FLEX" address="0x0000E758" value="0x00051050" />
         <register type="FLEX" address="0x0000E45C" value="0x00000052" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
     </register_config>
   </set>
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
