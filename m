Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B0810E9A5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 21:00:16 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 12:59:57 -0800
Message-Id: <20230214210007.2026033-21-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 20/30] lib/perf: Update MTL GT2 metrics for OAM
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

Add OAM metrics configurations and update MTL GT2 metrics.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf-configs/guids.xml     |   13 +-
 lib/i915/perf-configs/oa-mtlgt2.xml | 1014 ++++++++++++++++++++++++---
 2 files changed, 919 insertions(+), 108 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index cc0dc916..0b96aa91 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -2357,7 +2357,7 @@
     <guid config_hash="321ffd18a528dd67798e8a8476f632fe" mdapi_config_hash="7984537ffe8ca547d3583a56edf26bbd" id="fc82db3d-d6a7-413a-8349-b31f02251d2f" chipset="mtlgt2" name="Ext1" />
     <guid config_hash="28f18aeeb865c4bf1d8d82d77f571085" mdapi_config_hash="bba07ef452c6a67f0a8ff04fa9b4d93d" id="3479a81d-9017-4930-af0c-14f7fabadb38" chipset="mtlgt2" name="Ext4" />
     <guid config_hash="0955d0036c6b2b4afe94cb4d8115c577" mdapi_config_hash="38688d5ff152f82f150d9c569caf2351" id="e4701256-cd06-48f7-a005-d4d1f9e895c1" chipset="mtlgt2" name="Ext5" />
-    <guid config_hash="d93bc60082d0b69a8f0d430732d63f94" mdapi_config_hash="dc7a66d4de8f704f44b50c10b9dff1de" id="3e47d0e8-5414-4496-8746-37e36fefc777" chipset="mtlgt2" name="Ext7" />
+    <guid config_hash="dcdb3b48b18515e0a0f7d2179c89bda6" mdapi_config_hash="a4f1512b26ca4c3ed1d8d818cfedcd65" id="3e47d0e8-5414-4496-8746-37e36fefc777" chipset="mtlgt2" name="Ext7" />
     <guid config_hash="3de00cb5cc6f1598d624b9d4c2d072cf" mdapi_config_hash="0237dfeb5d300cab42cc36a64552ebe7" id="5aa36c1f-c6da-45ab-ab21-397d9a4b6a06" chipset="mtlgt2" name="Ext8" />
     <guid config_hash="f66aff20b452fc6746f6f345aa996b63" mdapi_config_hash="14b2a444cc752fd4946c11906f5a7486" id="1df59d79-16d8-471c-b3da-f0f62862f89e" chipset="mtlgt2" name="Ext10" />
     <guid config_hash="f27eef4bd1b25e14f598ff04fe69a511" mdapi_config_hash="1f4b2bf31f456235f289cf7eba5039c2" id="d05d3d84-ba16-41b5-b825-5a3d2aaabbfc" chipset="mtlgt2" name="Ext11" />
@@ -2463,10 +2463,10 @@
     <guid config_hash="a68a66449827d355064d3db9473b4df5" mdapi_config_hash="129fbcf33c8f25a6c15935e5aeaef3b4" id="8e09a7a1-b0e8-464a-a28d-90250f64ec9e" chipset="mtlgt2" name="Ext501" />
     <guid config_hash="b66b6fe10d453212eb1bd501ae6a29bd" mdapi_config_hash="17c05f7a6933e3fcf7669b142bb55705" id="57a19b6a-1b7d-4337-a9c9-710c56c46f84" chipset="mtlgt2" name="Ext502" />
     <guid config_hash="610d0cdc34fe0442b0c8e6277703f21a" mdapi_config_hash="32ce7dfe4ea7f5e79c69cc04d41d3f01" id="394b21ab-311c-47a5-9b10-88159f5ac999" chipset="mtlgt2" name="Ext503" />
-    <guid config_hash="92ba0e22539647cf0eb2bc7f10cd4cf8" mdapi_config_hash="41e11d55b96e18999fad3efe5f8bf16a" id="143440a0-d7e2-4f41-8372-8fdca1ecc2a8" chipset="mtlgt2" name="Ext508" />
-    <guid config_hash="e36ab792e7756ea6ea71e387c873dfdd" mdapi_config_hash="18af689ecd1d15e707c0192ea02f5824" id="7c5d3f41-b690-44b2-8352-00215ac94bae" chipset="mtlgt2" name="Ext509" />
-    <guid config_hash="25febf37102198080c0e680e94beaced" mdapi_config_hash="bb8ff9dfe34ad6197c7540e7ddee356b" id="02f43996-feff-4e13-a8fd-eea9de2f13fc" chipset="mtlgt2" name="Ext510" />
-    <guid config_hash="29bcf55f5b34e961768cd5cbbd828532" mdapi_config_hash="670a9e1fd79cd9610418c85d13df3436" id="2cbd327c-40e2-452b-a9fc-c7787869a352" chipset="mtlgt2" name="Ext511" />
+    <guid config_hash="3c81d715dab552c96a708e5561cddf32" mdapi_config_hash="2ef3813b66f81eda0cb04dbe437234d8" id="143440a0-d7e2-4f41-8372-8fdca1ecc2a8" chipset="mtlgt2" name="Ext508" />
+    <guid config_hash="15984b5fb58b51a666ece004db6ae774" mdapi_config_hash="26232e447ea7dcf0c3a97e4353250a53" id="7c5d3f41-b690-44b2-8352-00215ac94bae" chipset="mtlgt2" name="Ext509" />
+    <guid config_hash="d44c98ea5ef5bff89e9ceb275d0da118" mdapi_config_hash="a8071d6fc9bd3959731ab78598f80294" id="02f43996-feff-4e13-a8fd-eea9de2f13fc" chipset="mtlgt2" name="Ext510" />
+    <guid config_hash="df750e7700406492d3bcd261c4af73e6" mdapi_config_hash="c2e0e09a27bb2ad5f80b0766ab56b37b" id="2cbd327c-40e2-452b-a9fc-c7787869a352" chipset="mtlgt2" name="Ext511" />
     <guid config_hash="6d9b68c2c4b89d9a952160fe503ac6a6" mdapi_config_hash="4508de639c858687559dd85a870d624f" id="3a9dba68-9402-48b0-a8ec-28e4e4a534de" chipset="mtlgt2" name="Ext516" />
     <guid config_hash="039124a8e61c2e323aace525da916ab0" mdapi_config_hash="ac8b6cf6d21ba83fe04789064b2caa97" id="ea503506-9afa-42dc-b85b-1237dce6e8af" chipset="mtlgt2" name="Ext517" />
     <guid config_hash="589d2f86e9b14cf16b9c8c33e473d1e4" mdapi_config_hash="1184ac825d3d0cba18e7ca501e515fc9" id="5056524c-12e3-4ba6-8788-eb934f284753" chipset="mtlgt2" name="Ext518" />
@@ -2740,4 +2740,7 @@
     <guid config_hash="e7efe91c7aeb591043358c1b5e3c019d" mdapi_config_hash="94ecec147a25de742814fbb01fd4e9c3" id="f739508f-51b2-48df-839c-e92c14d14c64" chipset="mtlgt3" name="Ext1006" />
     <guid config_hash="a96fb9e9d0949e6cc372ef445fded872" mdapi_config_hash="7fb3e6405e4b54b8566589aa79cd960e" id="926b1773-807e-4ee5-8561-30c9eb0a6344" chipset="mtlgt3" name="Ext1007" />
     <guid config_hash="310dddcb04d1088a3865f698d758cbc2" mdapi_config_hash="c6a3be7d49b5697074021ca673a39a57" id="82f69b49-772a-4169-bf9a-b1ef08e0823b" chipset="mtlgt3" name="Ext1010" />
+    <guid config_hash="482cebdeeb78bb56e67b42d24644c8db" mdapi_config_hash="11e33e01a371bf15e59b9786f4fe1050" id="de84260e-32ac-4863-ba4f-998a685174a2" chipset="mtlgt2" name="MediaSet1" />
+    <guid config_hash="5bfab887a79b99cf34a606dcca5f4f8a" mdapi_config_hash="1c238e39e5c73eefd870cef2fb7a18af" id="b9d5c6d5-39f2-4069-b343-e7a886353b89" chipset="mtlgt2" name="MediaSet2" />
+    <guid config_hash="44bcb438bea8b46b57779739bebfbd69" mdapi_config_hash="fbbd97d1f3b60c17eae57bbd3c42e7fe" id="a1700053-56bc-4b7e-87b9-e29b07a08f62" chipset="mtlgt2" name="TestOam" />
 </guids>
diff --git a/lib/i915/perf-configs/oa-mtlgt2.xml b/lib/i915/perf-configs/oa-mtlgt2.xml
index 0155145b..33ba70d0 100644
--- a/lib/i915/perf-configs/oa-mtlgt2.xml
+++ b/lib/i915/perf-configs/oa-mtlgt2.xml
@@ -1,10 +1,11 @@
 <?xml version="1.0"?>
-<metrics version="1669276337" merge_md5="">
+<metrics version="1675300099" merge_md5="">
   <set name="Render Metrics Basic"
        chipset="MTLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="232e858b-7116-44e8-a4be-856c59026650"
        >
     <counter name="GPU Time Elapsed"
@@ -565,6 +566,7 @@
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="fea2b2b7-a072-41c5-9092-2d7c48bb56c6"
        >
     <counter name="GPU Time Elapsed"
@@ -1118,6 +1120,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="011e5c80-c877-46fd-90ff-fd0bb29cb5ec"
        >
     <counter name="GPU Time Elapsed"
@@ -1460,6 +1463,7 @@
        symbol_name="XveActivity"
        underscore_name="xve_activity"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5f430543-ba1e-487c-b217-90570cfb85f9"
        >
     <counter name="GPU Time Elapsed"
@@ -1758,6 +1762,7 @@
        symbol_name="GpuBusyness"
        underscore_name="gpu_busyness"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3cb64fed-0f61-4e41-a754-b9c5b4892f77"
        >
     <counter name="GPU Time Elapsed"
@@ -2017,6 +2022,7 @@
        symbol_name="HDCAndSF"
        underscore_name="hdc_and_sf"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="27d6eda4-aabc-4203-8848-aef69658ae74"
        >
     <counter name="GPU Time Elapsed"
@@ -2298,6 +2304,7 @@
        symbol_name="L3"
        underscore_name="l3"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="50b898ad-44ae-4d02-ba5b-a7d2a024a480"
        >
     <counter name="GPU Time Elapsed"
@@ -2537,6 +2544,7 @@
        symbol_name="RasterizerAndPixelBackend1"
        underscore_name="rasterizer_and_pixel_backend1"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="29adb364-f161-40cb-929d-c14036447c4f"
        >
     <counter name="GPU Time Elapsed"
@@ -2729,6 +2737,7 @@
        symbol_name="RasterizerAndPixelBackend2"
        underscore_name="rasterizer_and_pixel_backend2"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="787c682f-68be-4a64-b998-77d8a30b4ea6"
        >
     <counter name="GPU Time Elapsed"
@@ -2927,6 +2936,7 @@
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="1269ddfd-22a6-47ca-9a1a-dc37b8c38490"
        >
     <counter name="GPU Time Elapsed"
@@ -3321,6 +3331,7 @@
        symbol_name="Sampler"
        underscore_name="sampler"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3c304c3b-9ada-4d92-9b54-34ec4e70aea6"
        >
     <counter name="GPU Time Elapsed"
@@ -3584,6 +3595,7 @@
        symbol_name="TDL1"
        underscore_name="tdl1"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="616fc1b0-53bb-4411-93b0-b34ab2b0bfb8"
        >
     <counter name="GPU Time Elapsed"
@@ -3928,6 +3940,7 @@
        symbol_name="TDL2"
        underscore_name="tdl2"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="952fa513-550e-49bc-a355-22fadbea5455"
        >
     <counter name="GPU Time Elapsed"
@@ -4288,6 +4301,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d0ed8afd-ad64-4774-8788-1a15f4ab7829"
        >
     <counter name="GPU Time Elapsed"
@@ -4512,6 +4526,7 @@
        symbol_name="Ext1"
        underscore_name="ext1"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="fc82db3d-d6a7-413a-8349-b31f02251d2f"
        >
     <counter name="GPU Time Elapsed"
@@ -4820,6 +4835,7 @@
        symbol_name="Ext4"
        underscore_name="ext4"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3479a81d-9017-4930-af0c-14f7fabadb38"
        >
     <counter name="GPU Time Elapsed"
@@ -5041,6 +5057,7 @@
        symbol_name="Ext5"
        underscore_name="ext5"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="e4701256-cd06-48f7-a005-d4d1f9e895c1"
        >
     <counter name="GPU Time Elapsed"
@@ -5330,6 +5347,7 @@
        symbol_name="Ext7"
        underscore_name="ext7"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3e47d0e8-5414-4496-8746-37e36fefc777"
        >
     <counter name="GPU Time Elapsed"
@@ -5379,7 +5397,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 7 READ"
+             equation="B 4 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5393,7 +5411,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 6 READ"
+             equation="B 5 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5407,7 +5425,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 5 READ"
+             equation="B 6 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5421,7 +5439,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 4 READ"
+             equation="B 7 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5435,7 +5453,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 3 READ"
+             equation="C 7 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5449,7 +5467,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 2 READ"
+             equation="C 6 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5463,7 +5481,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 1 READ"
+             equation="C 5 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5477,7 +5495,7 @@
              data_type="uint64"
              units="events"
              semantic_type="event"
-             equation="C 0 READ"
+             equation="C 4 READ"
              availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5492,7 +5510,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore0"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5507,7 +5525,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore1"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5522,7 +5540,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore2"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5537,7 +5555,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore3"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -5548,83 +5566,86 @@
         <register type="NOA" address="0x00000D04" value="0x00000200" />
         <register type="NOA" address="0x00009884" value="0x00000008" />
         <register type="NOA" address="0x00009888" value="0x18030004" />
-        <register type="NOA" address="0x00009888" value="0x00023000" />
-        <register type="NOA" address="0x00009888" value="0x0A030D00" />
+        <register type="NOA" address="0x00009888" value="0x0202000C" />
+        <register type="NOA" address="0x00009888" value="0x0C030034" />
         <register type="NOA" address="0x00009888" value="0x04030000" />
-        <register type="NOA" address="0x00009888" value="0x00030000" />
-        <register type="NOA" address="0x00009888" value="0x00049000" />
-        <register type="NOA" address="0x00009888" value="0x00083000" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x02040006" />
+        <register type="NOA" address="0x00009888" value="0x0208000C" />
         <register type="NOA" address="0x00009884" value="0x00000009" />
         <register type="NOA" address="0x00009888" value="0x18030004" />
-        <register type="NOA" address="0x00009888" value="0x0A030034" />
+        <register type="NOA" address="0x00009888" value="0x0C030D00" />
         <register type="NOA" address="0x00009888" value="0x04030000" />
-        <register type="NOA" address="0x00009888" value="0x00030000" />
-        <register type="NOA" address="0x00009888" value="0x00042000" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x02040008" />
         <register type="NOA" address="0x00009884" value="0x0000000A" />
         <register type="NOA" address="0x00009888" value="0x18030004" />
-        <register type="NOA" address="0x00009888" value="0x00020300" />
-        <register type="NOA" address="0x00009888" value="0x08030D00" />
+        <register type="NOA" address="0x00009888" value="0x020200C0" />
+        <register type="NOA" address="0x00009888" value="0x0E030034" />
         <register type="NOA" address="0x00009888" value="0x04030000" />
-        <register type="NOA" address="0x00009888" value="0x00030000" />
-        <register type="NOA" address="0x00009888" value="0x00040900" />
-        <register type="NOA" address="0x00009888" value="0x00080300" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x02040060" />
+        <register type="NOA" address="0x00009888" value="0x020800C0" />
         <register type="NOA" address="0x00009884" value="0x0000000B" />
         <register type="NOA" address="0x00009888" value="0x18030004" />
-        <register type="NOA" address="0x00009888" value="0x08030034" />
+        <register type="NOA" address="0x00009888" value="0x0E030D00" />
         <register type="NOA" address="0x00009888" value="0x04030000" />
-        <register type="NOA" address="0x00009888" value="0x00030000" />
-        <register type="NOA" address="0x00009888" value="0x00040200" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x02040080" />
         <register type="NOA" address="0x00009884" value="0x00000004" />
         <register type="NOA" address="0x00009888" value="0x04010000" />
         <register type="NOA" address="0x00009888" value="0x0C010000" />
         <register type="NOA" address="0x00009888" value="0x04410000" />
         <register type="NOA" address="0x00009888" value="0x0C410000" />
         <register type="NOA" address="0x00009888" value="0x04810000" />
-        <register type="NOA" address="0x00009888" value="0x0C810040" />
+        <register type="NOA" address="0x00009888" value="0x0C810000" />
         <register type="NOA" address="0x00009888" value="0x04C10000" />
-        <register type="NOA" address="0x00009888" value="0x0CC10001" />
-        <register type="NOA" address="0x00009888" value="0x00010004" />
-        <register type="NOA" address="0x00009888" value="0x0E010040" />
-        <register type="NOA" address="0x00009888" value="0x12010380" />
+        <register type="NOA" address="0x00009888" value="0x0CC10000" />
+        <register type="NOA" address="0x00009888" value="0x00010040" />
+        <register type="NOA" address="0x00009888" value="0x08010006" />
+        <register type="NOA" address="0x00009888" value="0x12010200" />
         <register type="NOA" address="0x00009888" value="0x02010000" />
-        <register type="NOA" address="0x00009888" value="0x00410004" />
-        <register type="NOA" address="0x00009888" value="0x0E410001" />
-        <register type="NOA" address="0x00009888" value="0x1241000E" />
+        <register type="NOA" address="0x00009888" value="0x00410040" />
+        <register type="NOA" address="0x00009888" value="0x08410180" />
+        <register type="NOA" address="0x00009888" value="0x12410008" />
         <register type="NOA" address="0x00009888" value="0x02410000" />
-        <register type="NOA" address="0x00009888" value="0x00810004" />
-        <register type="NOA" address="0x00009888" value="0x10810380" />
+        <register type="NOA" address="0x00009888" value="0x00810040" />
+        <register type="NOA" address="0x00009888" value="0x0A810006" />
+        <register type="NOA" address="0x00009888" value="0x10810200" />
         <register type="NOA" address="0x00009888" value="0x02810000" />
-        <register type="NOA" address="0x00009888" value="0x00C10004" />
-        <register type="NOA" address="0x00009888" value="0x10C1000E" />
+        <register type="NOA" address="0x00009888" value="0x00C10040" />
+        <register type="NOA" address="0x00009888" value="0x0AC10180" />
+        <register type="NOA" address="0x00009888" value="0x10C10008" />
         <register type="NOA" address="0x00009888" value="0x02C10000" />
         <register type="NOA" address="0x00009884" value="0x00000000" />
-        <register type="NOA" address="0x00009888" value="0x00124400" />
-        <register type="NOA" address="0x00009888" value="0x00130A00" />
-        <register type="NOA" address="0x00009888" value="0x0213BABA" />
-        <register type="NOA" address="0x00009888" value="0x00140500" />
-        <register type="NOA" address="0x00009888" value="0x02144949" />
-        <register type="NOA" address="0x00009888" value="0x00150500" />
-        <register type="NOA" address="0x00009888" value="0x02158383" />
-        <register type="NOA" address="0x00009888" value="0x00160500" />
-        <register type="NOA" address="0x00009888" value="0x02165555" />
-        <register type="NOA" address="0x00009888" value="0x00170A00" />
-        <register type="NOA" address="0x00009888" value="0x000CFF30" />
-        <register type="NOA" address="0x00009888" value="0x000EFF30" />
-        <register type="NOA" address="0x00009888" value="0x000D0A00" />
-        <register type="NOA" address="0x00009888" value="0x021A2020" />
-        <register type="NOA" address="0x00009888" value="0x001B2200" />
-        <register type="NOA" address="0x00009888" value="0x00060A00" />
-        <register type="NOA" address="0x00009888" value="0x0206AAAA" />
-        <register type="NOA" address="0x00009888" value="0x0001FA00" />
-        <register type="NOA" address="0x00009888" value="0x0201AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00124020" />
+        <register type="NOA" address="0x00009888" value="0x0013AE00" />
+        <register type="NOA" address="0x00009888" value="0x0213BAA0" />
+        <register type="NOA" address="0x00009888" value="0x00146100" />
+        <register type="NOA" address="0x00009888" value="0x02144950" />
+        <register type="NOA" address="0x00009888" value="0x0015C200" />
+        <register type="NOA" address="0x00009888" value="0x02158350" />
+        <register type="NOA" address="0x00009888" value="0x00165500" />
+        <register type="NOA" address="0x00009888" value="0x02165550" />
+        <register type="NOA" address="0x00009888" value="0x021700A0" />
+        <register type="NOA" address="0x00009888" value="0x000CFCF0" />
+        <register type="NOA" address="0x00009888" value="0x000EFCF0" />
+        <register type="NOA" address="0x00009888" value="0x020D00A0" />
+        <register type="NOA" address="0x00009888" value="0x001A0800" />
+        <register type="NOA" address="0x00009888" value="0x021A2000" />
+        <register type="NOA" address="0x00009888" value="0x001B2040" />
+        <register type="NOA" address="0x00009888" value="0x0006AA00" />
+        <register type="NOA" address="0x00009888" value="0x0206AAA0" />
+        <register type="NOA" address="0x00009888" value="0x0001AA00" />
+        <register type="NOA" address="0x00009888" value="0x0201AAAF" />
         <register type="NOA" address="0x00009888" value="0x5A010000" />
-        <register type="NOA" address="0x00009888" value="0x5C010600" />
-        <register type="NOA" address="0x00009888" value="0x5E010290" />
-        <register type="NOA" address="0x00009888" value="0x60010E01" />
+        <register type="NOA" address="0x00009888" value="0x5C010E07" />
+        <register type="NOA" address="0x00009888" value="0x5E010070" />
+        <register type="NOA" address="0x00009888" value="0x60010227" />
         <register type="NOA" address="0x00009888" value="0x06010000" />
-        <register type="NOA" address="0x00009888" value="0x62010070" />
+        <register type="NOA" address="0x00009888" value="0x62010090" />
         <register type="NOA" address="0x00009888" value="0x4E010000" />
-        <register type="NOA" address="0x00009888" value="0x50010E07" />
+        <register type="NOA" address="0x00009888" value="0x50010003" />
         <register type="NOA" address="0x00009888" value="0x52010070" />
         <register type="NOA" address="0x00009888" value="0x54010E07" />
         <register type="NOA" address="0x00009888" value="0x56010070" />
@@ -5648,6 +5669,7 @@
        symbol_name="Ext8"
        underscore_name="ext8"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5aa36c1f-c6da-45ab-ab21-397d9a4b6a06"
        >
     <counter name="GPU Time Elapsed"
@@ -5867,6 +5889,7 @@
        symbol_name="Ext10"
        underscore_name="ext10"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="1df59d79-16d8-471c-b3da-f0f62862f89e"
        >
     <counter name="GPU Time Elapsed"
@@ -6156,6 +6179,7 @@
        symbol_name="Ext11"
        underscore_name="ext11"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d05d3d84-ba16-41b5-b825-5a3d2aaabbfc"
        >
     <counter name="GPU Time Elapsed"
@@ -6375,6 +6399,7 @@
        symbol_name="Ext12"
        underscore_name="ext12"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a49e7038-1e78-4b49-bc55-e7e7d04e4074"
        >
     <counter name="GPU Time Elapsed"
@@ -6600,6 +6625,7 @@
        symbol_name="Ext13"
        underscore_name="ext13"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="10f4cba5-2db8-46a9-a211-391dca810ea0"
        >
     <counter name="GPU Time Elapsed"
@@ -6841,6 +6867,7 @@
        symbol_name="Ext14"
        underscore_name="ext14"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="36c1995a-e670-4c2a-ab94-74b9e7360fb2"
        >
     <counter name="GPU Time Elapsed"
@@ -7090,6 +7117,7 @@
        symbol_name="Ext17"
        underscore_name="ext17"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a04168f6-637e-44af-a1b6-e5f005708df4"
        >
     <counter name="GPU Time Elapsed"
@@ -7200,7 +7228,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 7 READ B 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="B 7 READ B 6 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore0"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -7215,7 +7243,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 5 READ B 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="B 5 READ B 4 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore1"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -7230,7 +7258,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 3 READ B 2 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="B 3 READ B 2 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore2"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -7245,7 +7273,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="B 1 READ B 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="B 1 READ B 0 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$GtSlice0XeCore3"
              mdapi_group="GPU"
              mdapi_usage_flags="Frame Batch Draw"
@@ -7360,6 +7388,7 @@
        symbol_name="Ext21"
        underscore_name="ext21"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="0486a0e0-3522-4689-bdf9-623603f8e3c6"
        >
     <counter name="GPU Time Elapsed"
@@ -7622,6 +7651,7 @@
        symbol_name="Ext23"
        underscore_name="ext23"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="b30ba7fb-fe8f-4e81-b271-3d6f52edc257"
        >
     <counter name="GPU Time Elapsed"
@@ -7821,6 +7851,7 @@
        symbol_name="Ext28"
        underscore_name="ext28"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="053ca218-0961-4bb2-b689-9fe2cb090fdc"
        >
     <counter name="GPU Time Elapsed"
@@ -8083,6 +8114,7 @@
        symbol_name="Ext31"
        underscore_name="ext31"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7a4a45f1-e844-460b-8800-91b62eb47124"
        >
     <counter name="GPU Time Elapsed"
@@ -8282,6 +8314,7 @@
        symbol_name="Ext35"
        underscore_name="ext35"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="fd99f6f4-d418-4d86-800b-52998df4eb00"
        >
     <counter name="GPU Time Elapsed"
@@ -8481,6 +8514,7 @@
        symbol_name="Ext39"
        underscore_name="ext39"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="10f4436b-83c7-4e38-867d-82144311e412"
        >
     <counter name="GPU Time Elapsed"
@@ -8684,6 +8718,7 @@
        symbol_name="Ext43"
        underscore_name="ext43"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ab8c937a-a24c-4b7b-94d2-7cdf4cf3829f"
        >
     <counter name="GPU Time Elapsed"
@@ -8858,6 +8893,7 @@
        symbol_name="Ext45"
        underscore_name="ext45"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="aa3ac820-b824-4681-94ff-3425eee63648"
        >
     <counter name="GPU Time Elapsed"
@@ -9048,6 +9084,7 @@
        symbol_name="Ext51"
        underscore_name="ext51"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3a093546-2929-4b79-87f4-97df02c1fe8e"
        >
     <counter name="GPU Time Elapsed"
@@ -9223,6 +9260,7 @@
        symbol_name="Ext53"
        underscore_name="ext53"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2ccdac56-9683-4eb5-89fd-7d42e77c117f"
        >
     <counter name="GPU Time Elapsed"
@@ -9422,6 +9460,7 @@
        symbol_name="Ext57"
        underscore_name="ext57"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d297b1e3-fc04-45a7-a5c5-f92ab4357eb2"
        >
     <counter name="GPU Time Elapsed"
@@ -9621,6 +9660,7 @@
        symbol_name="Ext61"
        underscore_name="ext61"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="bc372334-fe31-452e-843a-515328c75fd2"
        >
     <counter name="GPU Time Elapsed"
@@ -9824,6 +9864,7 @@
        symbol_name="Ext65"
        underscore_name="ext65"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="8a5ca732-17d3-4336-a33c-292a7f625237"
        >
     <counter name="GPU Time Elapsed"
@@ -9966,6 +10007,7 @@
        symbol_name="Ext66"
        underscore_name="ext66"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2e72f570-378b-4672-a615-374c1a3d524c"
        >
     <counter name="GPU Time Elapsed"
@@ -10124,6 +10166,7 @@
        symbol_name="Ext73"
        underscore_name="ext73"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="8f63bf05-fccb-45c2-89c1-cf1226c4fb80"
        >
     <counter name="GPU Time Elapsed"
@@ -10259,6 +10302,7 @@
        symbol_name="Ext74"
        underscore_name="ext74"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2e5b5a64-580f-4cfc-ac3b-e6ccc55a1260"
        >
     <counter name="GPU Time Elapsed"
@@ -10410,6 +10454,7 @@
        symbol_name="Ext77"
        underscore_name="ext77"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="1e7215b8-72b7-460b-99d1-9be3984e9f6c"
        >
     <counter name="GPU Time Elapsed"
@@ -10599,6 +10644,7 @@
        symbol_name="Ext79"
        underscore_name="ext79"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a1a1cc95-7466-461d-a3a4-a04818bb5d74"
        >
     <counter name="GPU Time Elapsed"
@@ -10744,6 +10790,7 @@
        symbol_name="Ext80"
        underscore_name="ext80"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="06d62e44-cf58-4e35-a8cf-c76ee2b4fd7f"
        >
     <counter name="GPU Time Elapsed"
@@ -10905,6 +10952,7 @@
        symbol_name="Ext83"
        underscore_name="ext83"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="428a93d8-3475-4efc-960e-3402b062d8f0"
        >
     <counter name="GPU Time Elapsed"
@@ -11138,6 +11186,7 @@
        symbol_name="Ext85"
        underscore_name="ext85"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="e6db7a16-f214-4cd0-91e9-94d8036c20ee"
        >
     <counter name="GPU Time Elapsed"
@@ -11397,6 +11446,7 @@
        symbol_name="Ext87"
        underscore_name="ext87"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="b96d78d7-c0c8-4941-9f28-e746f36627e4"
        >
     <counter name="GPU Time Elapsed"
@@ -11586,6 +11636,7 @@
        symbol_name="Ext91"
        underscore_name="ext91"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="55e5926a-364e-45f0-bbcd-69375ac61391"
        >
     <counter name="GPU Time Elapsed"
@@ -11775,6 +11826,7 @@
        symbol_name="Ext93"
        underscore_name="ext93"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a06cf71c-ad14-49b8-8a22-b367118514bb"
        >
     <counter name="GPU Time Elapsed"
@@ -11920,6 +11972,7 @@
        symbol_name="Ext94"
        underscore_name="ext94"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a05152f2-80f2-47cc-add7-70f4664b58e8"
        >
     <counter name="GPU Time Elapsed"
@@ -12081,6 +12134,7 @@
        symbol_name="Ext97"
        underscore_name="ext97"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="39f8d4d2-b28d-40a3-b545-a57865d7714e"
        >
     <counter name="GPU Time Elapsed"
@@ -12249,6 +12303,7 @@
        symbol_name="Ext98"
        underscore_name="ext98"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ee9377fe-2623-4588-8ffc-517e34c2eb75"
        >
     <counter name="GPU Time Elapsed"
@@ -12436,6 +12491,7 @@
        symbol_name="Ext100"
        underscore_name="ext100"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="b5533650-f6f1-4f66-ad40-6b4aba600102"
        >
     <counter name="GPU Time Elapsed"
@@ -12708,6 +12764,7 @@
        symbol_name="Ext101"
        underscore_name="ext101"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="136839ab-66a3-42ac-bca4-1cfca1d3088e"
        >
     <counter name="GPU Time Elapsed"
@@ -12947,6 +13004,7 @@
        symbol_name="Ext102"
        underscore_name="ext102"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="bd8e9b37-35b3-4a94-8ff7-bbad7d67642c"
        >
     <counter name="GPU Time Elapsed"
@@ -13174,6 +13232,7 @@
        symbol_name="Ext104"
        underscore_name="ext104"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="576a210f-b921-46dc-9af7-7f34eb1d368e"
        >
     <counter name="GPU Time Elapsed"
@@ -13350,6 +13409,7 @@
        symbol_name="Ext105"
        underscore_name="ext105"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="96b32930-859d-4fa8-8d81-4d26a160f0e8"
        >
     <counter name="GPU Time Elapsed"
@@ -13537,6 +13597,7 @@
        symbol_name="Ext106"
        underscore_name="ext106"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="bbe4bf0d-03a3-482a-869c-1c6e71d52dac"
        >
     <counter name="GPU Time Elapsed"
@@ -13706,6 +13767,7 @@
        symbol_name="Ext107"
        underscore_name="ext107"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="02eafe17-886d-4559-b18d-c661fd6914c0"
        >
     <counter name="GPU Time Elapsed"
@@ -13886,6 +13948,7 @@
        symbol_name="Ext113"
        underscore_name="ext113"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="8cb51ae4-6d00-44d5-9d24-29521022f02b"
        >
     <counter name="GPU Time Elapsed"
@@ -14220,6 +14283,7 @@
        symbol_name="Ext116"
        underscore_name="ext116"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="c50c1328-01a4-44a4-bc10-cea109a86100"
        >
     <counter name="GPU Time Elapsed"
@@ -14411,6 +14475,7 @@
        symbol_name="Ext118"
        underscore_name="ext118"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3ac7b553-9dd8-4588-be88-8a50d4aa8497"
        >
     <counter name="GPU Time Elapsed"
@@ -14656,6 +14721,7 @@
        symbol_name="Ext120"
        underscore_name="ext120"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="39bbba4c-b77d-424a-9156-ede3d325df25"
        >
     <counter name="GPU Time Elapsed"
@@ -14849,6 +14915,7 @@
        symbol_name="Ext122"
        underscore_name="ext122"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="1c2b42f8-2763-4c20-85d9-5a5bd7381eb8"
        >
     <counter name="GPU Time Elapsed"
@@ -15089,6 +15156,7 @@
        symbol_name="Ext123"
        underscore_name="ext123"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="80240cbe-83d5-44dd-a03a-c498a6928be5"
        >
     <counter name="GPU Time Elapsed"
@@ -15274,6 +15342,7 @@
        symbol_name="Ext124"
        underscore_name="ext124"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="f8d36c8e-4129-4962-afce-7917f98e9b2d"
        >
     <counter name="GPU Time Elapsed"
@@ -15515,6 +15584,7 @@
        symbol_name="Ext126"
        underscore_name="ext126"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="08670eec-8015-4c40-b900-d47b9824ec83"
        >
     <counter name="GPU Time Elapsed"
@@ -15734,6 +15804,7 @@
        symbol_name="Ext128"
        underscore_name="ext128"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7d149ad7-90bd-4201-8791-2e8c1c4359e8"
        >
     <counter name="GPU Time Elapsed"
@@ -15882,6 +15953,7 @@
        symbol_name="Ext130"
        underscore_name="ext130"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="52597b67-dea9-411c-845e-c7f7befa744e"
        >
     <counter name="GPU Time Elapsed"
@@ -16003,6 +16075,7 @@
        symbol_name="Ext131"
        underscore_name="ext131"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="56b5eb77-117c-4392-a4ed-6a809598c28f"
        >
     <counter name="GPU Time Elapsed"
@@ -16136,6 +16209,7 @@
        symbol_name="Ext134"
        underscore_name="ext134"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d4f5b1c3-553d-46f6-abb8-8535ee5e4c90"
        >
     <counter name="GPU Time Elapsed"
@@ -16241,6 +16315,7 @@
        symbol_name="Ext135"
        underscore_name="ext135"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2aa7d46b-8b53-4693-9e5b-1245dc85cb90"
        >
     <counter name="GPU Time Elapsed"
@@ -16358,6 +16433,7 @@
        symbol_name="Ext138"
        underscore_name="ext138"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="18d95a38-b79c-42ac-a1c1-f6f3ef5ee213"
        >
     <counter name="GPU Time Elapsed"
@@ -16463,6 +16539,7 @@
        symbol_name="Ext139"
        underscore_name="ext139"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7869d90b-8a61-40c5-b705-91ce55b64cd8"
        >
     <counter name="GPU Time Elapsed"
@@ -16580,6 +16657,7 @@
        symbol_name="Ext142"
        underscore_name="ext142"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="c9f005ff-957d-471f-b6d3-98ebfd423f88"
        >
     <counter name="GPU Time Elapsed"
@@ -16685,6 +16763,7 @@
        symbol_name="Ext143"
        underscore_name="ext143"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="bf8f687e-d93f-439a-904e-14758015b273"
        >
     <counter name="GPU Time Elapsed"
@@ -16802,6 +16881,7 @@
        symbol_name="Ext146"
        underscore_name="ext146"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="38cb3c8a-b6b1-46e9-b18e-331afd4faad6"
        >
     <counter name="GPU Time Elapsed"
@@ -16907,6 +16987,7 @@
        symbol_name="Ext147"
        underscore_name="ext147"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="f0624b43-b429-4be9-9cef-1a9c966b9bf5"
        >
     <counter name="GPU Time Elapsed"
@@ -17024,6 +17105,7 @@
        symbol_name="Ext150"
        underscore_name="ext150"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="9be51bc5-540f-4a51-80b9-a6e8f849107c"
        >
     <counter name="GPU Time Elapsed"
@@ -17127,6 +17209,7 @@
        symbol_name="Ext151"
        underscore_name="ext151"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5303f1e7-b41b-4f48-a638-02293743f84d"
        >
     <counter name="GPU Time Elapsed"
@@ -17242,6 +17325,7 @@
        symbol_name="Ext154"
        underscore_name="ext154"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="269bfd75-1e50-4717-959c-f72de6c5e37e"
        >
     <counter name="GPU Time Elapsed"
@@ -17427,6 +17511,7 @@
        symbol_name="Ext155"
        underscore_name="ext155"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="77c2e8f4-297f-46ed-95a9-370e21e131c6"
        >
     <counter name="GPU Time Elapsed"
@@ -17563,6 +17648,7 @@
        symbol_name="Ext156"
        underscore_name="ext156"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="dea81dd8-3792-4245-9ce3-4591a6ff2d31"
        >
     <counter name="GPU Time Elapsed"
@@ -17698,6 +17784,7 @@
        symbol_name="Ext158"
        underscore_name="ext158"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="0f6dfbfe-33f8-4910-996a-8b639c57066f"
        >
     <counter name="GPU Time Elapsed"
@@ -17873,6 +17960,7 @@
        symbol_name="Ext159"
        underscore_name="ext159"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7b4a0c8f-f35d-49e2-b1a7-243740c4d888"
        >
     <counter name="GPU Time Elapsed"
@@ -18076,6 +18164,7 @@
        symbol_name="Ext161"
        underscore_name="ext161"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="bf4c98bf-1930-408b-87ad-2674e6e617c0"
        >
     <counter name="GPU Time Elapsed"
@@ -18279,6 +18368,7 @@
        symbol_name="Ext163"
        underscore_name="ext163"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2826204b-5835-4b64-840f-133d1ca5b03a"
        >
     <counter name="GPU Time Elapsed"
@@ -18482,6 +18572,7 @@
        symbol_name="Ext165"
        underscore_name="ext165"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="b9e7193e-99b9-4e9f-9738-de7144ea3b39"
        >
     <counter name="GPU Time Elapsed"
@@ -18685,6 +18776,7 @@
        symbol_name="Ext167"
        underscore_name="ext167"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="4797cea4-4618-42c1-aa36-0f8210b42a47"
        >
     <counter name="GPU Time Elapsed"
@@ -18888,6 +18980,7 @@
        symbol_name="Ext169"
        underscore_name="ext169"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="daeb4a53-f0ba-4bec-9462-8025cc17ca8b"
        >
     <counter name="GPU Time Elapsed"
@@ -19091,6 +19184,7 @@
        symbol_name="Ext171"
        underscore_name="ext171"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2aeaff8e-ce08-49f1-aacf-c9631dc3c756"
        >
     <counter name="GPU Time Elapsed"
@@ -19474,6 +19568,7 @@
        symbol_name="Ext173"
        underscore_name="ext173"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5005db3a-31a9-498c-8153-bf47147473b1"
        >
     <counter name="GPU Time Elapsed"
@@ -19675,6 +19770,7 @@
        symbol_name="Ext174"
        underscore_name="ext174"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3e2a351c-3f4f-461a-a6cf-64f099b83fc5"
        >
     <counter name="GPU Time Elapsed"
@@ -19883,6 +19979,7 @@
        symbol_name="Ext175"
        underscore_name="ext175"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="14c17f9b-021b-41e5-a4f0-ab8daaad56a4"
        >
     <counter name="GPU Time Elapsed"
@@ -20100,6 +20197,7 @@
        symbol_name="Ext176"
        underscore_name="ext176"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a258d429-a165-4fed-bbcb-c743a09dd68f"
        >
     <counter name="GPU Time Elapsed"
@@ -20324,6 +20422,7 @@
        symbol_name="Ext177"
        underscore_name="ext177"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="986b3512-df42-4300-a3fb-3a0d5835b5dc"
        >
     <counter name="GPU Time Elapsed"
@@ -20546,6 +20645,7 @@
        symbol_name="Ext181"
        underscore_name="ext181"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="29b4890b-203f-44d7-a007-270354d414ed"
        >
     <counter name="GPU Time Elapsed"
@@ -20715,6 +20815,7 @@
        symbol_name="Ext184"
        underscore_name="ext184"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="87ec0ca0-a406-4ddb-9fb9-60beed37e12a"
        >
     <counter name="GPU Time Elapsed"
@@ -20914,6 +21015,7 @@
        symbol_name="Ext188"
        underscore_name="ext188"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="11c77c80-498e-4cad-9e2d-565a52fd3578"
        >
     <counter name="GPU Time Elapsed"
@@ -21113,6 +21215,7 @@
        symbol_name="Ext190"
        underscore_name="ext190"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="123714d3-5d52-49de-91eb-0c909557d221"
        >
     <counter name="GPU Time Elapsed"
@@ -21272,6 +21375,7 @@
        symbol_name="Ext192"
        underscore_name="ext192"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d2741830-1ee3-42ab-b578-2b9c31a69c1c"
        >
     <counter name="GPU Time Elapsed"
@@ -21546,6 +21650,7 @@
        symbol_name="Ext195"
        underscore_name="ext195"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="d41508b5-921c-4033-a2f0-8a88aad4e718"
        >
     <counter name="GPU Time Elapsed"
@@ -21827,6 +21932,7 @@
        symbol_name="Ext200"
        underscore_name="ext200"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="73a53c50-0922-4d77-87d9-13b18d368e4e"
        >
     <counter name="GPU Time Elapsed"
@@ -22022,6 +22128,7 @@
        symbol_name="Ext201"
        underscore_name="ext201"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="32b9a4f4-b1f0-478f-8998-d86e5c5c458f"
        >
     <counter name="GPU Time Elapsed"
@@ -22221,6 +22328,7 @@
        symbol_name="Ext202"
        underscore_name="ext202"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="e1606d82-b67b-4fd8-9b07-a769dd6e6581"
        >
     <counter name="GPU Time Elapsed"
@@ -22322,6 +22430,7 @@
        symbol_name="Ext203"
        underscore_name="ext203"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="16647b5e-c9e4-4201-afc2-cb47a9f3f4d2"
        >
     <counter name="GPU Time Elapsed"
@@ -22423,6 +22532,7 @@
        symbol_name="Ext204"
        underscore_name="ext204"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="639a17e1-f339-49ab-9884-6b9a91a5a0c8"
        >
     <counter name="GPU Time Elapsed"
@@ -22622,6 +22732,7 @@
        symbol_name="Ext205"
        underscore_name="ext205"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7420acf6-1809-41e3-b5d1-49455c60aa66"
        >
     <counter name="GPU Time Elapsed"
@@ -22821,6 +22932,7 @@
        symbol_name="Ext212"
        underscore_name="ext212"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="015d134a-1b6e-4969-b972-b904c1d0cc85"
        >
     <counter name="GPU Time Elapsed"
@@ -22998,6 +23110,7 @@
        symbol_name="Ext214"
        underscore_name="ext214"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="191eb41b-6180-4cf9-b3fb-048bf4da8b94"
        >
     <counter name="GPU Time Elapsed"
@@ -23191,6 +23304,7 @@
        symbol_name="Ext220"
        underscore_name="ext220"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="840ad20c-c8ba-4dd5-bc42-674987d6ec79"
        >
     <counter name="GPU Time Elapsed"
@@ -23366,6 +23480,7 @@
        symbol_name="Ext225"
        underscore_name="ext225"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a8bfddc1-d469-45d6-8790-7d8c649ada41"
        >
     <counter name="GPU Time Elapsed"
@@ -23496,6 +23611,7 @@
        symbol_name="Ext227"
        underscore_name="ext227"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="325e5e9b-a055-4c22-8997-98d546a31afe"
        >
     <counter name="GPU Time Elapsed"
@@ -23626,6 +23742,7 @@
        symbol_name="Ext229"
        underscore_name="ext229"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="94537bb4-60fd-45fe-b172-29ed90c9abac"
        >
     <counter name="GPU Time Elapsed"
@@ -23759,6 +23876,7 @@
        symbol_name="Ext231"
        underscore_name="ext231"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7fceb68b-57e6-480d-81d1-991d8d6f7c4d"
        >
     <counter name="GPU Time Elapsed"
@@ -23908,6 +24026,7 @@
        symbol_name="Ext237"
        underscore_name="ext237"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ad62dc60-987b-415e-9f7d-6976fbe82dac"
        >
     <counter name="GPU Time Elapsed"
@@ -24061,6 +24180,7 @@
        symbol_name="Ext238"
        underscore_name="ext238"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="e630dd77-cf9e-4deb-8f52-57506b306b63"
        >
     <counter name="GPU Time Elapsed"
@@ -24248,6 +24368,7 @@
        symbol_name="Ext239"
        underscore_name="ext239"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="6dfee12d-6bfc-434a-8873-bc076a47d80b"
        >
     <counter name="GPU Time Elapsed"
@@ -24361,6 +24482,7 @@
        symbol_name="Ext240"
        underscore_name="ext240"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5edd0480-7a46-49f7-8709-7f737d0cc42a"
        >
     <counter name="GPU Time Elapsed"
@@ -24474,6 +24596,7 @@
        symbol_name="Ext500"
        underscore_name="ext500"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a7cd6b7e-e8ee-4853-b2d3-269bf3ed73c7"
        >
     <counter name="GPU Time Elapsed"
@@ -24724,6 +24847,7 @@
        symbol_name="Ext501"
        underscore_name="ext501"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="8e09a7a1-b0e8-464a-a28d-90250f64ec9e"
        >
     <counter name="GPU Time Elapsed"
@@ -24974,6 +25098,7 @@
        symbol_name="Ext502"
        underscore_name="ext502"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="57a19b6a-1b7d-4337-a9c9-710c56c46f84"
        >
     <counter name="GPU Time Elapsed"
@@ -25224,6 +25349,7 @@
        symbol_name="Ext503"
        underscore_name="ext503"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="394b21ab-311c-47a5-9b10-88159f5ac999"
        >
     <counter name="GPU Time Elapsed"
@@ -25474,6 +25600,7 @@
        symbol_name="Ext508"
        underscore_name="ext508"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="143440a0-d7e2-4f41-8372-8fdca1ecc2a8"
        >
     <counter name="GPU Time Elapsed"
@@ -25553,10 +25680,10 @@
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02045555" />
         <register type="NOA" address="0x00009888" value="0x04080010" />
-        <register type="NOA" address="0x00009888" value="0x10080180" />
-        <register type="NOA" address="0x00009888" value="0x12080105" />
-        <register type="NOA" address="0x00009888" value="0x14080083" />
-        <register type="NOA" address="0x00009888" value="0x160803C1" />
+        <register type="NOA" address="0x00009888" value="0x10080140" />
+        <register type="NOA" address="0x00009888" value="0x120800C4" />
+        <register type="NOA" address="0x00009888" value="0x14080042" />
+        <register type="NOA" address="0x00009888" value="0x160803C0" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x0008FFF0" />
         <register type="NOA" address="0x00009888" value="0x02080003" />
@@ -25567,9 +25694,9 @@
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02040001" />
         <register type="NOA" address="0x00009888" value="0x04080010" />
-        <register type="NOA" address="0x00009888" value="0x0A080146" />
-        <register type="NOA" address="0x00009888" value="0x0C0800C4" />
-        <register type="NOA" address="0x00009888" value="0x0E080042" />
+        <register type="NOA" address="0x00009888" value="0x0A080105" />
+        <register type="NOA" address="0x00009888" value="0x0C080083" />
+        <register type="NOA" address="0x00009888" value="0x0E080001" />
         <register type="NOA" address="0x00009888" value="0x1008000F" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x00080000" />
@@ -25609,6 +25736,7 @@
        symbol_name="Ext509"
        underscore_name="ext509"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="7c5d3f41-b690-44b2-8352-00215ac94bae"
        >
     <counter name="GPU Time Elapsed"
@@ -25683,29 +25811,31 @@
         <register type="NOA" address="0x00000D04" value="0x00000200" />
         <register type="NOA" address="0x00009884" value="0x00000008" />
         <register type="NOA" address="0x00009888" value="0x1C085400" />
+        <register type="NOA" address="0x00009888" value="0x1E080014" />
         <register type="NOA" address="0x00009888" value="0x0002FFF0" />
         <register type="NOA" address="0x00009888" value="0x0202FFFF" />
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02045555" />
-        <register type="NOA" address="0x00009888" value="0x04080008" />
-        <register type="NOA" address="0x00009888" value="0x10080180" />
-        <register type="NOA" address="0x00009888" value="0x12080105" />
-        <register type="NOA" address="0x00009888" value="0x14080083" />
-        <register type="NOA" address="0x00009888" value="0x16080001" />
+        <register type="NOA" address="0x00009888" value="0x04080098" />
+        <register type="NOA" address="0x00009888" value="0x10080140" />
+        <register type="NOA" address="0x00009888" value="0x120800C4" />
+        <register type="NOA" address="0x00009888" value="0x14080042" />
+        <register type="NOA" address="0x00009888" value="0x160803C0" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x0008FFF0" />
         <register type="NOA" address="0x00009888" value="0x02080003" />
         <register type="NOA" address="0x00009884" value="0x00000009" />
         <register type="NOA" address="0x00009888" value="0x1C085400" />
+        <register type="NOA" address="0x00009888" value="0x1E080014" />
         <register type="NOA" address="0x00009888" value="0x0002FFF0" />
         <register type="NOA" address="0x00009888" value="0x02020003" />
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02040001" />
-        <register type="NOA" address="0x00009888" value="0x04080008" />
-        <register type="NOA" address="0x00009888" value="0x0A080146" />
-        <register type="NOA" address="0x00009888" value="0x0C0800C4" />
-        <register type="NOA" address="0x00009888" value="0x0E080042" />
-        <register type="NOA" address="0x00009888" value="0x10080000" />
+        <register type="NOA" address="0x00009888" value="0x04080098" />
+        <register type="NOA" address="0x00009888" value="0x0A080105" />
+        <register type="NOA" address="0x00009888" value="0x0C080083" />
+        <register type="NOA" address="0x00009888" value="0x0E080001" />
+        <register type="NOA" address="0x00009888" value="0x1008000F" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x00080000" />
         <register type="NOA" address="0x00009888" value="0x02080000" />
@@ -25744,6 +25874,7 @@
        symbol_name="Ext510"
        underscore_name="ext510"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="02f43996-feff-4e13-a8fd-eea9de2f13fc"
        >
     <counter name="GPU Time Elapsed"
@@ -25823,10 +25954,10 @@
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02045555" />
         <register type="NOA" address="0x00009888" value="0x04080010" />
-        <register type="NOA" address="0x00009888" value="0x10080180" />
-        <register type="NOA" address="0x00009888" value="0x12080105" />
-        <register type="NOA" address="0x00009888" value="0x14080083" />
-        <register type="NOA" address="0x00009888" value="0x160803C1" />
+        <register type="NOA" address="0x00009888" value="0x10080140" />
+        <register type="NOA" address="0x00009888" value="0x120800C4" />
+        <register type="NOA" address="0x00009888" value="0x14080042" />
+        <register type="NOA" address="0x00009888" value="0x160803C0" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x0008FFF0" />
         <register type="NOA" address="0x00009888" value="0x02080003" />
@@ -25837,9 +25968,9 @@
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02040001" />
         <register type="NOA" address="0x00009888" value="0x04080010" />
-        <register type="NOA" address="0x00009888" value="0x0A080146" />
-        <register type="NOA" address="0x00009888" value="0x0C0800C4" />
-        <register type="NOA" address="0x00009888" value="0x0E080042" />
+        <register type="NOA" address="0x00009888" value="0x0A080105" />
+        <register type="NOA" address="0x00009888" value="0x0C080083" />
+        <register type="NOA" address="0x00009888" value="0x0E080001" />
         <register type="NOA" address="0x00009888" value="0x1008000F" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x00080000" />
@@ -25895,6 +26026,7 @@
        symbol_name="Ext511"
        underscore_name="ext511"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2cbd327c-40e2-452b-a9fc-c7787869a352"
        >
     <counter name="GPU Time Elapsed"
@@ -25969,29 +26101,31 @@
         <register type="NOA" address="0x00000D04" value="0x00000200" />
         <register type="NOA" address="0x00009884" value="0x0000000A" />
         <register type="NOA" address="0x00009888" value="0x1C085400" />
+        <register type="NOA" address="0x00009888" value="0x1E080014" />
         <register type="NOA" address="0x00009888" value="0x0002FFF0" />
         <register type="NOA" address="0x00009888" value="0x0202FFFF" />
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02045555" />
-        <register type="NOA" address="0x00009888" value="0x04080008" />
-        <register type="NOA" address="0x00009888" value="0x10080180" />
-        <register type="NOA" address="0x00009888" value="0x12080105" />
-        <register type="NOA" address="0x00009888" value="0x14080083" />
-        <register type="NOA" address="0x00009888" value="0x16080001" />
+        <register type="NOA" address="0x00009888" value="0x04080098" />
+        <register type="NOA" address="0x00009888" value="0x10080140" />
+        <register type="NOA" address="0x00009888" value="0x120800C4" />
+        <register type="NOA" address="0x00009888" value="0x14080042" />
+        <register type="NOA" address="0x00009888" value="0x160803C0" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x0008FFF0" />
         <register type="NOA" address="0x00009888" value="0x02080003" />
         <register type="NOA" address="0x00009884" value="0x0000000B" />
         <register type="NOA" address="0x00009888" value="0x1C085400" />
+        <register type="NOA" address="0x00009888" value="0x1E080014" />
         <register type="NOA" address="0x00009888" value="0x0002FFF0" />
         <register type="NOA" address="0x00009888" value="0x02020003" />
         <register type="NOA" address="0x00009888" value="0x00045550" />
         <register type="NOA" address="0x00009888" value="0x02040001" />
-        <register type="NOA" address="0x00009888" value="0x04080008" />
-        <register type="NOA" address="0x00009888" value="0x0A080146" />
-        <register type="NOA" address="0x00009888" value="0x0C0800C4" />
-        <register type="NOA" address="0x00009888" value="0x0E080042" />
-        <register type="NOA" address="0x00009888" value="0x10080000" />
+        <register type="NOA" address="0x00009888" value="0x04080098" />
+        <register type="NOA" address="0x00009888" value="0x0A080105" />
+        <register type="NOA" address="0x00009888" value="0x0C080083" />
+        <register type="NOA" address="0x00009888" value="0x0E080001" />
+        <register type="NOA" address="0x00009888" value="0x1008000F" />
         <register type="NOA" address="0x00009888" value="0x08080000" />
         <register type="NOA" address="0x00009888" value="0x00080000" />
         <register type="NOA" address="0x00009888" value="0x02080000" />
@@ -26046,6 +26180,7 @@
        symbol_name="Ext516"
        underscore_name="ext516"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="3a9dba68-9402-48b0-a8ec-28e4e4a534de"
        >
     <counter name="GPU Time Elapsed"
@@ -26171,6 +26306,7 @@
        symbol_name="Ext517"
        underscore_name="ext517"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ea503506-9afa-42dc-b85b-1237dce6e8af"
        >
     <counter name="GPU Time Elapsed"
@@ -26296,6 +26432,7 @@
        symbol_name="Ext518"
        underscore_name="ext518"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="5056524c-12e3-4ba6-8788-eb934f284753"
        >
     <counter name="GPU Time Elapsed"
@@ -26428,6 +26565,7 @@
        symbol_name="Ext519"
        underscore_name="ext519"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="13f8665d-c5aa-47b4-ae3e-af80dd134e1b"
        >
     <counter name="GPU Time Elapsed"
@@ -26560,6 +26698,7 @@
        symbol_name="Ext520"
        underscore_name="ext520"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="4d5b4699-5a6a-4a85-81e1-3ad75d735476"
        >
     <counter name="GPU Time Elapsed"
@@ -26701,6 +26840,7 @@
        symbol_name="Ext521"
        underscore_name="ext521"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="f9cc9e2c-c517-49a1-b27c-f81b08b411fc"
        >
     <counter name="GPU Time Elapsed"
@@ -26842,6 +26982,7 @@
        symbol_name="Ext522"
        underscore_name="ext522"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="f5fe71de-58e0-4fba-a75a-111906d8fb5b"
        >
     <counter name="GPU Time Elapsed"
@@ -26990,6 +27131,7 @@
        symbol_name="Ext523"
        underscore_name="ext523"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="46d82207-1235-45ea-a0e6-f71fa55a3380"
        >
     <counter name="GPU Time Elapsed"
@@ -27138,6 +27280,7 @@
        symbol_name="Ext540"
        underscore_name="ext540"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="0ea54a28-5052-4c2a-a18a-8cc17383a072"
        >
     <counter name="GPU Time Elapsed"
@@ -27263,6 +27406,7 @@
        symbol_name="Ext541"
        underscore_name="ext541"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="9cd9ba1c-3c59-483d-9ce3-136c8898f09d"
        >
     <counter name="GPU Time Elapsed"
@@ -27395,6 +27539,7 @@
        symbol_name="Ext542"
        underscore_name="ext542"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ab29d0d9-3388-4316-af23-932aeef1ed23"
        >
     <counter name="GPU Time Elapsed"
@@ -27536,6 +27681,7 @@
        symbol_name="Ext543"
        underscore_name="ext543"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="16bf4ba3-2204-4d52-8f5e-d49ef8f571bb"
        >
     <counter name="GPU Time Elapsed"
@@ -27684,6 +27830,7 @@
        symbol_name="Ext604"
        underscore_name="ext604"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="66331aff-0aaf-41e7-ad18-fa61060d3af6"
        >
     <counter name="GPU Time Elapsed"
@@ -27923,6 +28070,7 @@
        symbol_name="Ext1000"
        underscore_name="ext1000"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="2d24479d-6766-4632-8d2b-f440c9bf53c7"
        >
     <counter name="GPU Time Elapsed"
@@ -28269,6 +28417,7 @@
        symbol_name="Ext1001"
        underscore_name="ext1001"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="15aa1ce0-6750-4566-8b2b-6d71a6ac4039"
        >
     <counter name="GPU Time Elapsed"
@@ -28672,6 +28821,7 @@
        symbol_name="Ext1002"
        underscore_name="ext1002"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="23131267-15c5-47bc-bcb3-4c05fc452e0e"
        >
     <counter name="GPU Time Elapsed"
@@ -28990,6 +29140,7 @@
        symbol_name="Ext1003"
        underscore_name="ext1003"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="605d1ee1-c160-46ee-9e31-6daf3885401c"
        >
     <counter name="GPU Time Elapsed"
@@ -29337,6 +29488,7 @@
        symbol_name="Ext1004"
        underscore_name="ext1004"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="40f4dcae-3ed1-4f3e-bddf-dbb87bc4279b"
        >
     <counter name="GPU Time Elapsed"
@@ -29684,6 +29836,7 @@
        symbol_name="Ext1005"
        underscore_name="ext1005"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="099da490-3594-4baa-98af-cea30d4d6c15"
        >
     <counter name="GPU Time Elapsed"
@@ -30087,6 +30240,7 @@
        symbol_name="Ext1006"
        underscore_name="ext1006"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="ab298da4-5917-4592-bbe0-1c21dedf000b"
        >
     <counter name="GPU Time Elapsed"
@@ -30433,6 +30587,7 @@
        symbol_name="Ext1007"
        underscore_name="ext1007"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="1b429688-49f8-48f2-8a06-18ba5c6a2b52"
        >
     <counter name="GPU Time Elapsed"
@@ -30722,6 +30877,7 @@
        symbol_name="Ext1010"
        underscore_name="ext1010"
        mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
        hw_config_guid="a4717f34-1c8b-40d8-a022-abbcf03cc6e5"
        >
     <counter name="GPU Time Elapsed"
@@ -30841,4 +30997,656 @@
     </register_config>
   </set>
 
+  <set name="MediaSet1"
+       chipset="MTLGT2"
+       symbol_name="MediaSet1"
+       underscore_name="media_set1"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="de84260e-32ac-4863-ba4f-998a685174a2"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="GPU Time Elapsed"
+             data_type="uint64"
+             units="ns"
+             semantic_type="event"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST"
+             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST"
+             underscore_name="video_decode_box0_read_request"
+             description="Number of VDBOX0 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST"
+             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST"
+             underscore_name="video_decode_box0_write_request"
+             description="Number of VDBOX0 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX1_READ_REQUEST"
+             symbol_name="VIDEO_DECODE_BOX1_READ_REQUEST"
+             underscore_name="video_decode_box1_read_request"
+             description="Number of VDBOX1 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX1_WRITE_REQUEST"
+             symbol_name="VIDEO_DECODE_BOX1_WRITE_REQUEST"
+             underscore_name="video_decode_box1_write_request"
+             description="Number of VDBOX1 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_ENHANCEMENT_BOX0_READ_REQUEST"
+             symbol_name="VIDEO_ENHANCEMENT_BOX0_READ_REQUEST"
+             underscore_name="video_enhancement_box0_read_request"
+             description="Number of VEBOX0 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_ENHANCEMENT_BOX0_WRITE_REQUEST"
+             symbol_name="VIDEO_ENHANCEMENT_BOX0_WRITE_REQUEST"
+             underscore_name="video_enhancement_box0_write_request"
+             description="Number of VEBOX0 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_ENHANCEMENT_BOX1_READ_REQUEST"
+             symbol_name="VIDEO_ENHANCEMENT_BOX1_READ_REQUEST"
+             underscore_name="video_enhancement_box1_read_request"
+             description="Number of VEBOX1 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_ENHANCEMENT_BOX1_WRITE_REQUEST"
+             symbol_name="VIDEO_ENHANCEMENT_BOX1_WRITE_REQUEST"
+             underscore_name="video_enhancement_box1_write_request"
+             description="Number of VEBOX1 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 7 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00393200" value="0x00000201" />
+        <register type="OA" address="0x00393204" value="0x00000000" />
+        <register type="OA" address="0x00393208" value="0x00000202" />
+        <register type="OA" address="0x0039320C" value="0x00000000" />
+        <register type="OA" address="0x00393210" value="0x00000401" />
+        <register type="OA" address="0x00393214" value="0x00000000" />
+        <register type="OA" address="0x00393218" value="0x00000402" />
+        <register type="OA" address="0x0039321C" value="0x00000000" />
+        <register type="OA" address="0x00393220" value="0x00002201" />
+        <register type="OA" address="0x00393224" value="0x00000000" />
+        <register type="OA" address="0x00393228" value="0x00002202" />
+        <register type="OA" address="0x0039322C" value="0x00000000" />
+        <register type="OA" address="0x00393230" value="0x00002401" />
+        <register type="OA" address="0x00393234" value="0x00000000" />
+        <register type="OA" address="0x00393238" value="0x00002402" />
+        <register type="OA" address="0x0039323C" value="0x00000000" />
+        <register type="OA" address="0x00393034" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MediaSet2"
+       chipset="MTLGT2"
+       symbol_name="MediaSet2"
+       underscore_name="media_set2"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="b9d5c6d5-39f2-4069-b343-e7a886353b89"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="GPU Time Elapsed"
+             data_type="uint64"
+             units="ns"
+             semantic_type="event"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="MEDIA_READ_REQUEST"
+             symbol_name="MEDIA_READ_REQUEST"
+             underscore_name="media_read_request"
+             description="Number of read requests from stand alone media "
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="MEDIA_WRITE_REQUEST"
+             symbol_name="MEDIA_WRITE_REQUEST"
+             underscore_name="media_write_request"
+             description="Number of write requests from stand alone media "
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="COMMAND PARSER VIDEO DECODE_ENGINE0 BUSY"
+             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE0_BUSY"
+             underscore_name="command_parser_video_decode_engine0_busy"
+             description="Percentage of time in which there is a context loaded and active on the media VDBOX0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="COMMAND_PARSER_VIDEO_DECODE_ENGINE1_BUSY"
+             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE1_BUSY"
+             underscore_name="command_parser_video_decode_engine1_busy"
+             description="Percentage of time in which there is a context loaded and active on the media VDBOX1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE0_BUSY"
+             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE0_BUSY"
+             underscore_name="command_parser_video_enhancement_engine0_busy"
+             description="Percentage of time in which there is a context loaded and active on the media VEBOX0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE1_BUSY"
+             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE1_BUSY"
+             underscore_name="command_parser_video_enhancement_engine1_busy"
+             description="Percentage of time in which there is a context loaded and active on the media VEBOX0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="COMMAND_PARSER_GRAPHICS_SECURITY_CONTROLLER_BUSY"
+             symbol_name="COMMAND_PARSER_GRAPHICS_SECURITY_CONTROLLER_BUSY"
+             underscore_name="command_parser_graphics_security_controller_busy"
+             description="Percentage of time in which Graphics Security Controller is active."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00393200" value="0x00000001" />
+        <register type="OA" address="0x00393204" value="0x00000000" />
+        <register type="OA" address="0x00393208" value="0x00000002" />
+        <register type="OA" address="0x0039320C" value="0x00000000" />
+        <register type="OA" address="0x00393210" value="0x00000200" />
+        <register type="OA" address="0x00393214" value="0x00000000" />
+        <register type="OA" address="0x00393218" value="0x00000400" />
+        <register type="OA" address="0x0039321C" value="0x00000000" />
+        <register type="OA" address="0x00393220" value="0x00002200" />
+        <register type="OA" address="0x00393224" value="0x00000000" />
+        <register type="OA" address="0x00393228" value="0x00002400" />
+        <register type="OA" address="0x0039322C" value="0x00000000" />
+        <register type="OA" address="0x00393230" value="0x00000003" />
+        <register type="OA" address="0x00393234" value="0x00000000" />
+        <register type="OA" address="0x00393034" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="TestOam"
+       chipset="MTLGT2"
+       symbol_name="TestOam"
+       underscore_name="test_oam"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="a1700053-56bc-4b7e-87b9-e29b07a08f62"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="GPU Time Elapsed"
+             data_type="uint64"
+             units="ns"
+             semantic_type="event"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter0"
+             symbol_name="Counter0"
+             underscore_name="counter0"
+             description="HW test counter 0. Factor: 0.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 0 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter1"
+             symbol_name="Counter1"
+             underscore_name="counter1"
+             description="HW test counter 1. Factor: 1.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 1 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter2"
+             symbol_name="Counter2"
+             underscore_name="counter2"
+             description="HW test counter 2. Factor: 1.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 2 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter3"
+             symbol_name="Counter3"
+             underscore_name="counter3"
+             description="HW test counter 3. Factor: 0.5"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 3 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter4"
+             symbol_name="Counter4"
+             underscore_name="counter4"
+             description="HW test counter 4. Factor: 0.3333"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 4 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter5"
+             symbol_name="Counter5"
+             underscore_name="counter5"
+             description="HW test counter 5. Factor: 0.3333"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 5 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter6"
+             symbol_name="Counter6"
+             underscore_name="counter6"
+             description="HW test counter 6. Factor: 0.16666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 6 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter8"
+             symbol_name="Counter8"
+             underscore_name="counter8"
+             description="TestCounter8"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST_VISA"
+             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST_VISA"
+             underscore_name="video_decode_box0_write_request_visa"
+             description="Number of VDBOX0 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="C 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST_VISA"
+             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST_VISA"
+             underscore_name="video_decode_box0_read_request_visa"
+             description="Number of VDBOX0 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST_MPEC"
+             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST_MPEC"
+             underscore_name="video_decode_box0_read_request_mpec"
+             description="Number of VDBOX0 read requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST_MPEC"
+             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST_MPEC"
+             underscore_name="video_decode_box0_write_request_mpec"
+             description="Number of VDBOX0 write requests"
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x0038D114" value="0x00000003" />
+        <register type="NOA" address="0x0038D100" value="0x00000DE0" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000DE2" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000001C0" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000001C1" />
+        <register type="NOA" address="0x0038D104" value="0x00000809" />
+        <register type="NOA" address="0x0038D100" value="0x000001C3" />
+        <register type="NOA" address="0x0038D104" value="0x00800400" />
+        <register type="NOA" address="0x0038D100" value="0x000001C4" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x000001C5" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000360" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000361" />
+        <register type="NOA" address="0x0038D104" value="0x00001819" />
+        <register type="NOA" address="0x0038D100" value="0x00000362" />
+        <register type="NOA" address="0x0038D104" value="0x00001C1D" />
+        <register type="NOA" address="0x0038D100" value="0x00000363" />
+        <register type="NOA" address="0x0038D104" value="0x02402006" />
+        <register type="NOA" address="0x0038D100" value="0x00000364" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000365" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x000003A0" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000003A1" />
+        <register type="NOA" address="0x0038D104" value="0x00001011" />
+        <register type="NOA" address="0x0038D100" value="0x000003BB" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000003BC" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000004E0" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x000004E1" />
+        <register type="NOA" address="0x0038D104" value="0x00001819" />
+        <register type="NOA" address="0x0038D100" value="0x000004E3" />
+        <register type="NOA" address="0x0038D104" value="0x00000400" />
+        <register type="NOA" address="0x0038D100" value="0x000004E4" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x000004E5" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000420" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000421" />
+        <register type="NOA" address="0x0038D104" value="0x00001A1B" />
+        <register type="NOA" address="0x0038D100" value="0x00000423" />
+        <register type="NOA" address="0x0038D104" value="0x00000400" />
+        <register type="NOA" address="0x0038D100" value="0x00000424" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000425" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000540" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000541" />
+        <register type="NOA" address="0x0038D104" value="0x00001415" />
+        <register type="NOA" address="0x0038D100" value="0x00000543" />
+        <register type="NOA" address="0x0038D104" value="0x00000400" />
+        <register type="NOA" address="0x0038D100" value="0x00000544" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000545" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000660" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000661" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x00000663" />
+        <register type="NOA" address="0x0038D104" value="0x00000C02" />
+        <register type="NOA" address="0x0038D100" value="0x00000664" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000665" />
+        <register type="NOA" address="0x0038D104" value="0x00000000" />
+        <register type="NOA" address="0x0038D100" value="0x00000669" />
+        <register type="NOA" address="0x0038D104" value="0x00000001" />
+        <register type="NOA" address="0x0038D100" value="0x0000066A" />
+        <register type="NOA" address="0x0038D104" value="0x00000015" />
+        <register type="NOA" address="0x0038D114" value="0x0000000B" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x00393200" value="0x00000201" />
+        <register type="OA" address="0x00393204" value="0x00000000" />
+        <register type="OA" address="0x00393208" value="0x00000202" />
+        <register type="OA" address="0x0039320C" value="0x00000000" />
+        <register type="OA" address="0x00393000" value="0x00000000" />
+        <register type="OA" address="0x00393004" value="0xF0800000" />
+        <register type="OA" address="0x00393010" value="0x00000000" />
+        <register type="OA" address="0x00393014" value="0xF0800000" />
+        <register type="OA" address="0x00393020" value="0x00000000" />
+        <register type="OA" address="0x00393040" value="0x00000004" />
+        <register type="OA" address="0x00393044" value="0x0000FFFF" />
+        <register type="OA" address="0x00393048" value="0x00000003" />
+        <register type="OA" address="0x0039304C" value="0x0000FFFF" />
+        <register type="OA" address="0x00393050" value="0x00000007" />
+        <register type="OA" address="0x00393054" value="0x0000FFFF" />
+        <register type="OA" address="0x00393058" value="0x00100002" />
+        <register type="OA" address="0x0039305C" value="0x0000FFF7" />
+        <register type="OA" address="0x00393060" value="0x00100002" />
+        <register type="OA" address="0x00393064" value="0x0000FFCF" />
+        <register type="OA" address="0x00393068" value="0x00100082" />
+        <register type="OA" address="0x0039306C" value="0x0000FFEF" />
+        <register type="OA" address="0x00393070" value="0x001000C2" />
+        <register type="OA" address="0x00393074" value="0x0000FFE7" />
+        <register type="OA" address="0x00393078" value="0x00002002" />
+        <register type="OA" address="0x0039307C" value="0x0000F9FF" />
+        <register type="OA" address="0x00393034" value="0x00000000" />
+    </register_config>
+  </set>
+
 </metrics>
-- 
2.36.1
