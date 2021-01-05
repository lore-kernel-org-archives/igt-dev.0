Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5EE6E0DD
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:04 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:46 +0200
Message-Id: <20210105111749.463432-4-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] lib/i915/perf: update gen10/11
 ComputeBasic programming
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

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml  | 6 +++---
 lib/i915/perf-configs/oa-cnl.xml | 5 +++--
 lib/i915/perf-configs/oa-ehl.xml | 5 +++--
 lib/i915/perf-configs/oa-icl.xml | 6 +++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 75e7bc87d..58dc4aeea 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -254,7 +254,7 @@
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c11af8d1-858b-4f8b-98fb-8d683ba8bda0" chipset="cflgt3" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="4a97c6cf-8e84-4854-a031-6c6e7b42e07c" chipset="cflgt3" name="AsyncCompute" />
     <guid config_hash="428ad0859c9dac4ba85dd73106f5b2de" mdapi_config_hash="7baf473e87d0838b628bd2ed289f4783" id="2d975e19-7130-41d2-b06f-79d74f91e7c8" chipset="cnl" name="RenderBasic" />
-    <guid config_hash="7365cff2873ed22304dcb350ca19d834" mdapi_config_hash="174f9ff2125d06a7886a258304ba4eae" id="eed14f91-5f03-4e3a-8281-ac38030ac573" chipset="cnl" name="ComputeBasic" />
+    <guid config_hash="53907f43dc0faf4be0bbf614302f4fb3" mdapi_config_hash="b5b46b9273e54ffc6e1959b61bbc3a25" id="0b128ae2-ed06-481e-afe3-2404aab91415" chipset="cnl" name="ComputeBasic" />
     <guid config_hash="1878c620a9f0cc5100fba47c83a1457c" mdapi_config_hash="f1baa55e099488db74fd02c9560df40b" id="0666ccac-f5aa-4dc2-aa12-c6e058f383f3" chipset="cnl" name="RenderPipeProfile" />
     <guid config_hash="10d83436d03f71bc19e6b83739072556" mdapi_config_hash="7f0796f55071a69b76c0a0615b2171e6" id="3500dcfd-837b-4ec8-b5cf-fe58b966263f" chipset="cnl" name="MemoryReads" />
     <guid config_hash="e1c4bd09bd777f97d6c6491bf921ec6b" mdapi_config_hash="92754b4c69ef3427efdee08033daf7e2" id="63d18ead-3cfc-4972-a640-5e98b688dfee" chipset="cnl" name="MemoryWrites" />
@@ -269,7 +269,7 @@
     <guid config_hash="e5419b6c232500a6a824c2c58f3b7d32" mdapi_config_hash="b9a01044b9befe9fcf952f26ba4fcc4e" id="aa2d6ab4-99b3-42f8-94d6-4a9aa2baedaf" chipset="cnl" name="TDL_2" />
     <guid config_hash="ebd014335c55b7be47615354eecae7a5" mdapi_config_hash="21595af7d9d76b7f414c744aeaddbe1d" id="99517a69-b9a7-4124-8f59-06645ea13187" chipset="cnl" name="TestOa" />
     <guid config_hash="463b3bb46dec1a41472c2a728142ff56" mdapi_config_hash="f29cb304efd62d8712b594d864c6ab86" id="e3cd52cf-c6b0-4019-b369-3bc9c75a0cbc" chipset="icl" name="RenderBasic" />
-    <guid config_hash="8b7f8030265ee506c24ec10d17ab8f1a" mdapi_config_hash="f22218a44add1267d4fad705b511323c" id="12ca7e9c-55cb-45cd-9f87-4fc821488e6d" chipset="icl" name="ComputeBasic" />
+    <guid config_hash="f954c414bda0c5cd1b012a3e747be6e9" mdapi_config_hash="59d2e72aefb55a9180a7a7cd5b629e41" id="04546170-d541-4804-96f8-007a454a3f2c" chipset="icl" name="ComputeBasic" />
     <guid config_hash="3b6635eb3709f346076901ea88ec1f2b" mdapi_config_hash="402f156b276dfaaaf84eb09ec5347515" id="43eb7fc1-dc5e-45e2-a90a-0053f5397271" chipset="icl" name="ComputeExtended" />
     <guid config_hash="0e47ea7e90aac987097968a231d2dada" mdapi_config_hash="08ff26b1c2405cc1061e71940cf558b5" id="05d5e01f-0800-4975-b36b-7b169cad3fab" chipset="icl" name="ComputeL3Cache" />
     <guid config_hash="34c5bc89788487e6d32ea9894929b1ae" mdapi_config_hash="0b8dc07dcfe3a03bf65771ee8404fa10" id="03c7a167-2abc-4ba6-878a-f1d80082abca" chipset="icl" name="RenderPipeProfile" />
@@ -289,7 +289,7 @@
     <guid config_hash="3abb2f3338c8d2b6aff2a869ee9030d9" mdapi_config_hash="0b64f16be99304796735d1bd7b6e580a" id="e617cfd5-6cc5-4143-8994-cd36cebb921f" chipset="icl" name="TestOa" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="7d863af6-be13-4f00-822d-33f58c8df9e7" chipset="icl" name="AsyncCompute" />
     <guid config_hash="878466bee64e6505fde4118ceadff299" mdapi_config_hash="653d46ab9ef10a2b7f511fe3f067e0ee" id="c693e665-867f-4362-91b6-85337f932010" chipset="ehl" name="RenderBasic" />
-    <guid config_hash="bf521fa74e9f5285bc3e9a7215cdadd2" mdapi_config_hash="bf085a519814344b241b08064f256921" id="54449e8a-196b-4c43-8ecd-540b0504b5c1" chipset="ehl" name="ComputeBasic" />
+    <guid config_hash="ad9a98d85f554b69e9737673594634a9" mdapi_config_hash="f335f856cf2bb4a1d09479fd39aab0ac" id="ae4d01a9-fe55-453c-8c7a-036acd5eacff" chipset="ehl" name="ComputeBasic" />
     <guid config_hash="9b6d58e5047c130f47999e04b92151e8" mdapi_config_hash="7bf6ffff6913e5536d4ad4dc4fa3b03b" id="05700b63-f044-4c79-b8ae-676972114745" chipset="ehl" name="ComputeExtended" />
     <guid config_hash="1819d0fc7e1274aaed4dc79670eb4d33" mdapi_config_hash="6ff2fcd2498448af0ed284e69be555a8" id="89e1f7ae-1100-4b4f-92f3-0caf88e3d833" chipset="ehl" name="ComputeL3Cache" />
     <guid config_hash="93df26813118e45063763661ffce6b77" mdapi_config_hash="d15e72e9d0ba0a4a94ed6985c86690ef" id="7bfa0a68-c327-46e8-a556-cfa7b4651071" chipset="ehl" name="RenderPipeProfile" />
diff --git a/lib/i915/perf-configs/oa-cnl.xml b/lib/i915/perf-configs/oa-cnl.xml
index 43dd32ff8..0bf5fa180 100644
--- a/lib/i915/perf-configs/oa-cnl.xml
+++ b/lib/i915/perf-configs/oa-cnl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843132" merge_md5="">
+<metrics version="1609843423" merge_md5="">
   <set name="Render Metrics Basic Gen10"
        chipset="CNL"
        symbol_name="RenderBasic"
@@ -834,7 +834,7 @@
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="eed14f91-5f03-4e3a-8281-ac38030ac573"
+       hw_config_guid="0b128ae2-ed06-481e-afe3-2404aab91415"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -1507,6 +1507,7 @@
         <register type="FLEX" address="0x0000E558" value="0x00000003" />
         <register type="FLEX" address="0x0000E658" value="0x00002001" />
         <register type="FLEX" address="0x0000E758" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-ehl.xml b/lib/i915/perf-configs/oa-ehl.xml
index b08437f0c..d32e04492 100644
--- a/lib/i915/perf-configs/oa-ehl.xml
+++ b/lib/i915/perf-configs/oa-ehl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843132" merge_md5="">
+<metrics version="1609843424" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="EHL"
        symbol_name="RenderBasic"
@@ -652,7 +652,7 @@
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="54449e8a-196b-4c43-8ecd-540b0504b5c1"
+       hw_config_guid="ae4d01a9-fe55-453c-8c7a-036acd5eacff"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -1320,6 +1320,7 @@
         <register type="FLEX" address="0x0000E558" value="0x00000003" />
         <register type="FLEX" address="0x0000E658" value="0x00002001" />
         <register type="FLEX" address="0x0000E758" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index 2bfccd600..7fd0713d0 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843132" merge_md5="">
+<metrics version="1609843424" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
@@ -653,7 +653,7 @@
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="12ca7e9c-55cb-45cd-9f87-4fc821488e6d"
+       hw_config_guid="04546170-d541-4804-96f8-007a454a3f2c"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -1319,11 +1319,11 @@
         <register type="OA" address="0x00002724" value="0x00800000" />
     </register_config>
     <register_config type="FLEX">
-        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
         <register type="FLEX" address="0x0000E458" value="0x00005004" />
         <register type="FLEX" address="0x0000E558" value="0x00000003" />
         <register type="FLEX" address="0x0000E658" value="0x00002001" />
         <register type="FLEX" address="0x0000E758" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
     </register_config>
   </set>
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
