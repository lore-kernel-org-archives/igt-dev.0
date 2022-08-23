Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACEB11A286
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:46 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:36 +0000
Message-Id: <20220823183036.5270-24-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 23/23] lib/i915/perf: Add DG2 metrics
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

Add DG2 metrics XML files for perf OA tests.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml               |   24 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |    5 +-
 lib/i915/perf-configs/oa-dg2.xml              | 9920 +++++++++++++++++
 .../perf-configs/perf-metricset-codegen.py    |   13 +
 lib/i915/perf-configs/update-guids.py         |    2 +-
 lib/i915/perf.c                               |    3 +
 lib/meson.build                               |    2 +-
 7 files changed, 9965 insertions(+), 4 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-dg2.xml

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 95c9d717..61a11542 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -431,4 +431,28 @@
     <guid config_hash="b420d7b956fb1b097a7bb812b6c87dc0" mdapi_config_hash="d81f15a77d18a099782c18acaa3132f7" id="c3ea2a23-f1c7-4a19-9da2-b569226fb6de" chipset="adl" name="EuActivity7" />
     <guid config_hash="5face026dac6a0549f8a28cf226dfbc8" mdapi_config_hash="de7326838bcc8abf024bac9c771e22e4" id="a5e2f79b-cecb-4eff-8f29-cda8e2a58749" chipset="adl" name="EuActivity8" />
     <guid config_hash="1affe7abeb3739d2c845cc6fa9aacf88" mdapi_config_hash="d071f4933574945979595246be61d3f0" id="89173c19-fcfe-48da-ac26-fb64425f141b" chipset="adl" name="TestOa" />
+    <guid config_hash="9091b7d8f1627a3dda5d6d996eadd033" mdapi_config_hash="4a3cf9efdf4fd581b69308368b986500" id="8b20a2e7-04db-4196-a5ca-26b53cbf9a12" chipset="dg2" name="RenderBasic" />
+    <guid config_hash="a0afa17cc8f442e6eabb3b1782cbca44" mdapi_config_hash="2a23a2f9f1bcf91a9b038b2cc6c9c911" id="f66d7204-54f5-4663-9d68-5213f70165ba" chipset="dg2" name="ComputeBasic" />
+    <guid config_hash="34875baa1a12dda6dcf6d40e33a8d5ef" mdapi_config_hash="31dfc8c6ef9a79789bbe0b991c94112f" id="3b06d2f4-f594-49b5-b399-98550fa2d7b1" chipset="dg2" name="RenderPipeProfile" />
+    <guid config_hash="5f0f4b7c1e4cae4d04ab60a66f1d98a8" mdapi_config_hash="58ec2ac3713bd8e21112f8fddbe28c48" id="1afb0edc-585c-4be9-8c0c-bc72325106b0" chipset="dg2" name="HDCAndSF1" />
+    <guid config_hash="69dbeb5aba00131465b68f20c910421b" mdapi_config_hash="cf8e3757a118ffffb76db95917cae040" id="a3b35902-f293-41fe-97d0-3d895bc5fab3" chipset="dg2" name="HDCAndSF2" />
+    <guid config_hash="e563f102f8b3046e8deaea0eb81b8784" mdapi_config_hash="81d17bd3ab0a18f4491c2d0a11037c7a" id="b04e9460-630f-4682-b0ed-ebb0e74a6c9d" chipset="dg2" name="RasterizerAndPixelBackend1" />
+    <guid config_hash="b574d106f1f71eae1e8a0908cad2c010" mdapi_config_hash="d9c0a07f470d2a9bf7bbf20f79488abf" id="57a0abf4-8d81-4856-ab86-01f15f92c81c" chipset="dg2" name="RasterizerAndPixelBackend2" />
+    <guid config_hash="3316babac928063b799008fc324812b1" mdapi_config_hash="c9cd0a76400e340b0ffdb129fff205c7" id="2314eaa3-164f-4004-9684-3f1d16e875f9" chipset="dg2" name="Sampler_1" />
+    <guid config_hash="31c5ffa0c3508fb166ace213356edbaf" mdapi_config_hash="e2bce131c17fa27ab826a05ed65cad5a" id="c60dea82-db13-4882-8d31-a02bce151ef7" chipset="dg2" name="Sampler_2" />
+    <guid config_hash="b3460c2d0d4e7bcbcc46a3f1c9df7e8f" mdapi_config_hash="ee6821f6954a10562b6314c5ef394b50" id="7f5cb8ec-38bb-48c9-9ad2-60075eba2833" chipset="dg2" name="TDL_1" />
+    <guid config_hash="9ff61984b39a3d19a2abf3a0fd4c2285" mdapi_config_hash="013fa392a5c8b3bb93a776146d31bc95" id="141ce507-de6c-428c-95b2-076194d650db" chipset="dg2" name="TDL_2" />
+    <guid config_hash="11b056437f6c491c2a44e4ca029dd57b" mdapi_config_hash="c4a4c4cec33f45576af76022e6f634ae" id="54a85b07-9ff2-4a12-bfb6-6bcdd9d4019c" chipset="dg2" name="TDL_3" />
+    <guid config_hash="5cf268036a3ae548ddd918fdbd67a64b" mdapi_config_hash="4744760a7ff39c509ecab43f3f715790" id="651c40e5-195c-49da-b232-a9a0f753d899" chipset="dg2" name="TDL_4" />
+    <guid config_hash="f43033715b8153ccb51147452de5bf99" mdapi_config_hash="e77513bc5aa341b061701d6d973b1b4c" id="9a1a14ad-ab92-4204-8a91-c4159a54f712" chipset="dg2" name="L3_1" />
+    <guid config_hash="1c4da3e296779bdbef2262460f3f0fcb" mdapi_config_hash="27c652b5bcd6e800c23a3cacc103c2cb" id="85de4c29-76b8-42a6-b6ef-8a2bed008fcf" chipset="dg2" name="GpuBusyness" />
+    <guid config_hash="a1c8aac6e58018ff3bf78169e5d7cf00" mdapi_config_hash="3d1142aa73a474eccef2bd23027e71b9" id="8dc7142a-df10-41f2-acaa-9faea547ce73" chipset="dg2" name="EuActivity1" />
+    <guid config_hash="880a408e8bc0c0a82df014cbbe0a1a9e" mdapi_config_hash="d998d2f096753140dc92ed9421414ae1" id="d3c05cce-4ae7-4291-82ab-b0bcade6cf7a" chipset="dg2" name="EuActivity2" />
+    <guid config_hash="6687d4c4e45e62d0d28792b04882edae" mdapi_config_hash="c5b1271909b4d72ad1503d5d8a50d30a" id="4fd009c5-6eae-4ecb-a2d1-41edf211cd06" chipset="dg2" name="EuActivity3" />
+    <guid config_hash="f770062c29026a186485a2190b7ce3fb" mdapi_config_hash="7a83985438139dcfdf7d653be1e665b0" id="5226090d-b636-4845-9f76-545cb5db7867" chipset="dg2" name="EuActivity4" />
+    <guid config_hash="4e13b511b35757cc97602aae22b7d2d3" mdapi_config_hash="5405e0eff1e1b0af86f45e832c604fcd" id="c8d33b8f-3152-4c81-99bf-d3cb45d7e1ac" chipset="dg2" name="EuActivity5" />
+    <guid config_hash="243a5047b39033bca9a16db6bf2aca3f" mdapi_config_hash="2bc02385284ccdbbd0d233a428861e59" id="708d01ed-bc9b-420e-8048-9060abcbb1f0" chipset="dg2" name="EuActivity6" />
+    <guid config_hash="d0f2a1c661860e4aa94e25e9f4a6f8eb" mdapi_config_hash="75694dd6a99c38e9446d7bf68f2269a3" id="72262d5b-a9e6-4742-820b-2a7bef9a7e61" chipset="dg2" name="EuActivity7" />
+    <guid config_hash="5e7354b4cbe7b9b03acb504ef00aa8ce" mdapi_config_hash="299c68337c46a2483c1254fdead4cdcc" id="11c685de-1445-41b8-acb5-8e79c75c4fd8" chipset="dg2" name="EuActivity8" />
+    <guid config_hash="24977eb13d34b0da58c0b33f6d7f841a" mdapi_config_hash="48715fb10d2ada8c23f7108303b7c343" id="2db1e1d4-8c48-4bb7-b248-0f40b70433ff" chipset="dg2" name="TestOa" />
 </guids>
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 1d161674..72b52bfd 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -141,6 +141,7 @@ chipsets = {
     'RKL': gen8_11_chipset_params,
     'DG1': gen8_11_chipset_params,
     'ADL': gen8_11_chipset_params,
+    'DG2': xehpsdv_chipset_params,
 }
 
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
@@ -214,7 +215,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
                 assert 0
         elif offset < b_offset:
             a_cnt_offset = int((offset - a_offset) / 4)
-            if chipset == "XEHPSDV":
+            if chipset == "XEHPSDV" or chipset == "DG2":
                 # Most A counters are in a contiguous array, except
                 # this A37.
                 if a_cnt_offset == 42:
@@ -245,7 +246,7 @@ def read_token_to_rpn_read(chipset, token, raw_offsets):
                 return "C " + str(idx - 54) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset))
-        elif chipset == "XEHPSDV":
+        elif chipset == "XEHPSDV" or chipset == "DG2":
             # For XEHPSDV the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
             # then 38 A counters, then 8 B counters and finally
diff --git a/lib/i915/perf-configs/oa-dg2.xml b/lib/i915/perf-configs/oa-dg2.xml
new file mode 100644
index 00000000..9d3e2541
--- /dev/null
+++ b/lib/i915/perf-configs/oa-dg2.xml
@@ -0,0 +1,9920 @@
+<?xml version="1.0"?>
+<metrics version="1602592998" merge_md5="">
+  <set name="Render Basic Metrics"
+       chipset="DG2"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="8b20a2e7-04db-4196-a5ca-26b53cbf9a12"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 512 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="128  A 36 READ UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 512 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="C 5 READ C 4 READ UADD C 3 READ UADD C 2 READ UADD C 1 READ UADD C 0 READ UADD B 7 READ UADD B 6 READ UADD 128 UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Slice0 Dualsubslice0 is busy"
+             symbol_name="Sampler00Busy"
+             underscore_name="sampler00_busy"
+             description="The percentage of time when sampler slice0 dualsubslice0 is busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers or L1 cache are not idle."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler00Busy"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Sampler00 Bottleneck"
+             symbol_name="Sampler00Bottleneck"
+             underscore_name="sampler00_bottleneck"
+             description="The percentage of time in which Slice0 Sampler0 has been slowing down the pipe when processing EU requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing EU requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler00Bottleneck"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1C840000" />
+        <register type="NOA" address="0x00009888" value="0x1E842800" />
+        <register type="NOA" address="0x00009888" value="0x02844000" />
+        <register type="NOA" address="0x00009888" value="0x04840010" />
+        <register type="NOA" address="0x00009888" value="0x12840800" />
+        <register type="NOA" address="0x00009888" value="0x14840037" />
+        <register type="NOA" address="0x00009888" value="0x00840000" />
+        <register type="NOA" address="0x00009888" value="0x02865000" />
+        <register type="NOA" address="0x00009888" value="0x0208A000" />
+        <register type="NOA" address="0x00009888" value="0x020A5000" />
+        <register type="NOA" address="0x00009884" value="0x00000001" />
+        <register type="NOA" address="0x00009888" value="0x18013800" />
+        <register type="NOA" address="0x00009888" value="0x18213800" />
+        <register type="NOA" address="0x00009888" value="0x18413800" />
+        <register type="NOA" address="0x00009888" value="0x18613800" />
+        <register type="NOA" address="0x00009888" value="0x18813800" />
+        <register type="NOA" address="0x00009888" value="0x18A13800" />
+        <register type="NOA" address="0x00009888" value="0x18C13800" />
+        <register type="NOA" address="0x00009888" value="0x18E13800" />
+        <register type="NOA" address="0x00009888" value="0x02010006" />
+        <register type="NOA" address="0x00009888" value="0x14010004" />
+        <register type="NOA" address="0x00009888" value="0x00010000" />
+        <register type="NOA" address="0x00009888" value="0x02210006" />
+        <register type="NOA" address="0x00009888" value="0x12210100" />
+        <register type="NOA" address="0x00009888" value="0x00210000" />
+        <register type="NOA" address="0x00009888" value="0x02410006" />
+        <register type="NOA" address="0x00009888" value="0x12410004" />
+        <register type="NOA" address="0x00009888" value="0x00410000" />
+        <register type="NOA" address="0x00009888" value="0x02610006" />
+        <register type="NOA" address="0x00009888" value="0x10610100" />
+        <register type="NOA" address="0x00009888" value="0x00610000" />
+        <register type="NOA" address="0x00009888" value="0x02810006" />
+        <register type="NOA" address="0x00009888" value="0x10810004" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x02A10006" />
+        <register type="NOA" address="0x00009888" value="0x0EA10100" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x02C10006" />
+        <register type="NOA" address="0x00009888" value="0x0EC10004" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x02E10006" />
+        <register type="NOA" address="0x00009888" value="0x0CE10100" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0208A000" />
+        <register type="NOA" address="0x00009888" value="0x02034920" />
+        <register type="NOA" address="0x00009888" value="0x04032924" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x020914E0" />
+        <register type="NOA" address="0x00009888" value="0x020A1248" />
+        <register type="NOA" address="0x00009888" value="0x040A0492" />
+        <register type="NOA" address="0x00009888" value="0x040B029C" />
+        <register type="NOA" address="0x00009888" value="0x46030860" />
+        <register type="NOA" address="0x00009888" value="0x48030643" />
+        <register type="NOA" address="0x00009888" value="0x4A030664" />
+        <register type="NOA" address="0x00009888" value="0x16033000" />
+        <register type="NOA" address="0x00009888" value="0x3E030840" />
+        <register type="NOA" address="0x00009888" value="0x18033000" />
+        <register type="NOA" address="0x00009888" value="0x1A033000" />
+        <register type="NOA" address="0x00009888" value="0x40030042" />
+        <register type="NOA" address="0x00009888" value="0x1C033000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009888" value="0x42030000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001C000" />
+        <register type="NOA" address="0x00009888" value="0x02025000" />
+        <register type="NOA" address="0x00009888" value="0x02045000" />
+        <register type="NOA" address="0x00009888" value="0x02055000" />
+        <register type="NOA" address="0x00009888" value="0x0208A000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Compute Metrics Basic"
+       chipset="DG2"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="f66d7204-54f5-4663-9d68-5213f70165ba"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 512 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="128  A 36 READ UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 512 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD C 3 READ UADD C 2 READ UADD C 1 READ UADD C 0 READ UADD 128 UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000001" />
+        <register type="NOA" address="0x00009888" value="0x18013800" />
+        <register type="NOA" address="0x00009888" value="0x18213800" />
+        <register type="NOA" address="0x00009888" value="0x18413800" />
+        <register type="NOA" address="0x00009888" value="0x18613800" />
+        <register type="NOA" address="0x00009888" value="0x18813800" />
+        <register type="NOA" address="0x00009888" value="0x18A13800" />
+        <register type="NOA" address="0x00009888" value="0x18C13800" />
+        <register type="NOA" address="0x00009888" value="0x18E13800" />
+        <register type="NOA" address="0x00009888" value="0x02010006" />
+        <register type="NOA" address="0x00009888" value="0x16010004" />
+        <register type="NOA" address="0x00009888" value="0x00010000" />
+        <register type="NOA" address="0x00009888" value="0x02210006" />
+        <register type="NOA" address="0x00009888" value="0x14210100" />
+        <register type="NOA" address="0x00009888" value="0x00210000" />
+        <register type="NOA" address="0x00009888" value="0x02410006" />
+        <register type="NOA" address="0x00009888" value="0x14410004" />
+        <register type="NOA" address="0x00009888" value="0x00410000" />
+        <register type="NOA" address="0x00009888" value="0x02610006" />
+        <register type="NOA" address="0x00009888" value="0x12610100" />
+        <register type="NOA" address="0x00009888" value="0x00610000" />
+        <register type="NOA" address="0x00009888" value="0x02810006" />
+        <register type="NOA" address="0x00009888" value="0x12810004" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x02A10006" />
+        <register type="NOA" address="0x00009888" value="0x10A10100" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x02C10006" />
+        <register type="NOA" address="0x00009888" value="0x10C10004" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x02E10006" />
+        <register type="NOA" address="0x00009888" value="0x0EE10100" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x02034800" />
+        <register type="NOA" address="0x00009888" value="0x04034924" />
+        <register type="NOA" address="0x00009888" value="0x06030004" />
+        <register type="NOA" address="0x00009888" value="0x02093800" />
+        <register type="NOA" address="0x00009888" value="0x0409000A" />
+        <register type="NOA" address="0x00009888" value="0x020A1200" />
+        <register type="NOA" address="0x00009888" value="0x040A2489" />
+        <register type="NOA" address="0x00009888" value="0x060A0002" />
+        <register type="NOA" address="0x00009888" value="0x040B2700" />
+        <register type="NOA" address="0x00009888" value="0x060B0001" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009888" value="0x4A030402" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030440" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x40030000" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009888" value="0x42030000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Render Metrics for 3D Pipeline Profile"
+       chipset="DG2"
+       symbol_name="RenderPipeProfile"
+       underscore_name="render_pipe_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="3b06d2f4-f594-49b5-b399-98550fa2d7b1"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VF0 Bottleneck"
+             symbol_name="Vf0Bottleneck"
+             underscore_name="vf0_bottleneck"
+             description="The percentage of time in which vertex fetch pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Input Assembler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS0 Bottleneck"
+             symbol_name="Vs0Bottleneck"
+             underscore_name="vs0_bottleneck"
+             description="The percentage of time in which VS0 pipeline stage was slowing down the 3D pipeline."
+             low_watermark="10"
+             high_watermark="30"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Vertex Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Clipper0 Bottleneck"
+             symbol_name="Cl0Bottleneck"
+             underscore_name="cl0_bottleneck"
+             description="The percentage of time in which clipper pipeline stage was slowing down the 3D pipeline."
+             low_watermark="10"
+             high_watermark="30"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS0 Bottleneck"
+             symbol_name="Hs0Bottleneck"
+             underscore_name="hs0_bottleneck"
+             description="The percentage of time in which hull shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="3"
+             high_watermark="9"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS0 Bottleneck"
+             symbol_name="Ds0Bottleneck"
+             underscore_name="ds0_bottleneck"
+             description="The percentage of time in which domain shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS0 Bottleneck"
+             symbol_name="Gs0Bottleneck"
+             underscore_name="gs0_bottleneck"
+             description="The percentage of time in which geometry shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Geometry Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SF0 Bottleneck"
+             symbol_name="Sf0Bottleneck"
+             underscore_name="sf0_bottleneck"
+             description="The percentage of time in which strip-fans pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="10"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO0 Bottleneck"
+             symbol_name="So0Bottleneck"
+             underscore_name="so0_bottleneck"
+             description="The percentage of time in which stream output pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CL0 Stall"
+             symbol_name="Cl0Stall"
+             underscore_name="cl0_stall"
+             description="The percentage of time in which clipper pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS0 Stall"
+             symbol_name="Hs0Stall"
+             underscore_name="hs0_stall"
+             description="The percentage of time in which hull stall pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS0 Stall"
+             symbol_name="Ds0Stall"
+             underscore_name="ds0_stall"
+             description="The percentage of time in which domain shader pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SF0 Stall"
+             symbol_name="Sf0Stall"
+             underscore_name="sf0_stall"
+             description="The percentage of time in which strip-fans pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO0 Stall"
+             symbol_name="So0Stall"
+             underscore_name="so0_stall"
+             description="The percentage of time in which stream-output pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Hi-Depth Bottleneck"
+             symbol_name="HiDepthBottleneck"
+             underscore_name="hi_depth_bottleneck"
+             description="The percentage of time in which early hierarchical depth test pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="BC Bottleneck"
+             symbol_name="BcBottleneck"
+             underscore_name="bc_bottleneck"
+             description="The percentage of time in which barycentric coordinates calculation pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Barycentric Calc"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x168607C0" />
+        <register type="NOA" address="0x00009888" value="0x1603001F" />
+        <register type="NOA" address="0x00009888" value="0x0C030000" />
+        <register type="NOA" address="0x00009888" value="0x12040640" />
+        <register type="NOA" address="0x00009888" value="0x02040000" />
+        <register type="NOA" address="0x00009888" value="0x1C070000" />
+        <register type="NOA" address="0x00009888" value="0x16090000" />
+        <register type="NOA" address="0x00009888" value="0x1C0903C0" />
+        <register type="NOA" address="0x00009888" value="0x160A01F0" />
+        <register type="NOA" address="0x00009888" value="0x160B7C00" />
+        <register type="NOA" address="0x00009888" value="0x04860000" />
+        <register type="NOA" address="0x00009888" value="0x06860400" />
+        <register type="NOA" address="0x00009888" value="0x00860000" />
+        <register type="NOA" address="0x00009888" value="0x02030002" />
+        <register type="NOA" address="0x00009888" value="0x04030010" />
+        <register type="NOA" address="0x00009888" value="0x0A0301C0" />
+        <register type="NOA" address="0x00009888" value="0x100300C0" />
+        <register type="NOA" address="0x00009888" value="0x12030C80" />
+        <register type="NOA" address="0x00009888" value="0x00030000" />
+        <register type="NOA" address="0x00009888" value="0x00044000" />
+        <register type="NOA" address="0x00009888" value="0x08040021" />
+        <register type="NOA" address="0x00009888" value="0x0C040080" />
+        <register type="NOA" address="0x00009888" value="0x0E040022" />
+        <register type="NOA" address="0x00009888" value="0x04074000" />
+        <register type="NOA" address="0x00009888" value="0x0A070021" />
+        <register type="NOA" address="0x00009888" value="0x0E0708C0" />
+        <register type="NOA" address="0x00009888" value="0x00070800" />
+        <register type="NOA" address="0x00009888" value="0x020700A0" />
+        <register type="NOA" address="0x00009888" value="0x00083032" />
+        <register type="NOA" address="0x00009888" value="0x02083300" />
+        <register type="NOA" address="0x00009888" value="0x02094003" />
+        <register type="NOA" address="0x00009888" value="0x08090880" />
+        <register type="NOA" address="0x00009888" value="0x0C090001" />
+        <register type="NOA" address="0x00009888" value="0x0E090023" />
+        <register type="NOA" address="0x00009888" value="0x12090003" />
+        <register type="NOA" address="0x00009888" value="0x00090D28" />
+        <register type="NOA" address="0x00009888" value="0x040A0200" />
+        <register type="NOA" address="0x00009888" value="0x140A0940" />
+        <register type="NOA" address="0x00009888" value="0x000A9A91" />
+        <register type="NOA" address="0x00009888" value="0x020A19AA" />
+        <register type="NOA" address="0x00009888" value="0x00015044" />
+        <register type="NOA" address="0x00009888" value="0x040B0004" />
+        <register type="NOA" address="0x00009888" value="0x080B0000" />
+        <register type="NOA" address="0x00009888" value="0x000B2000" />
+        <register type="NOA" address="0x00009888" value="0x020B2200" />
+        <register type="NOA" address="0x00009888" value="0x00020C20" />
+        <register type="NOA" address="0x00009888" value="0x000C0800" />
+        <register type="NOA" address="0x00009888" value="0x020C00A0" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAA2" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032482" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030007" />
+        <register type="NOA" address="0x00009888" value="0x2C030000" />
+        <register type="NOA" address="0x00009888" value="0x4203180A" />
+        <register type="NOA" address="0x00009888" value="0x32031000" />
+        <register type="NOA" address="0x00009888" value="0x440300C2" />
+        <register type="NOA" address="0x00009888" value="0x38031000" />
+        <register type="NOA" address="0x00009888" value="0x46030200" />
+        <register type="NOA" address="0x00009888" value="0x48030261" />
+        <register type="NOA" address="0x00009888" value="0x4A030C22" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x400304C1" />
+        <register type="NOA" address="0x00009888" value="0x1C031000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20031000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFD" />
+        <register type="NOA" address="0x00009888" value="0x00025551" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x00045551" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x00055551" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAA2" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set HDCAndSF1"
+       chipset="DG2"
+       symbol_name="HDCAndSF1"
+       underscore_name="hdc_and_sf1"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="1afb0edc-585c-4be9-8c0c-bc72325106b0"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 Dualsubslice0 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader00AccessStalledOnL3"
+             underscore_name="non_sampler_shader00_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice0)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice1 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader01AccessStalledOnL3"
+             underscore_name="non_sampler_shader01_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice1)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice2 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader02AccessStalledOnL3"
+             underscore_name="non_sampler_shader02_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice2)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice3 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader03AccessStalledOnL3"
+             underscore_name="non_sampler_shader03_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice3)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 Dualsubslice0 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader10AccessStalledOnL3"
+             underscore_name="non_sampler_shader10_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice1 Dualsubslice0)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 Dualsubslice1 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader11AccessStalledOnL3"
+             underscore_name="non_sampler_shader11_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice1 Dualsubslice1)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 Dualsubslice2 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader12AccessStalledOnL3"
+             underscore_name="non_sampler_shader12_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice1 Dualsubslice2)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 Dualsubslice3 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader13AccessStalledOnL3"
+             underscore_name="non_sampler_shader13_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice1 Dualsubslice3)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="SQ00 is full"
+             symbol_name="GTRequestQueue00Full"
+             underscore_name="gt_request_queue00_full"
+             description="The percentage of time when IDI0 SQ00 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ10 is full"
+             symbol_name="GTRequestQueue10Full"
+             underscore_name="gt_request_queue10_full"
+             description="The percentage of time when IDI0 SQ10 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ20 is full"
+             symbol_name="GTRequestQueue20Full"
+             underscore_name="gt_request_queue20_full"
+             description="The percentage of time when IDI0 SQ20 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ30 is full"
+             symbol_name="GTRequestQueue30Full"
+             underscore_name="gt_request_queue30_full"
+             description="The percentage of time when IDI0 SQ30 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ40 is full"
+             symbol_name="GTRequestQueue40Full"
+             underscore_name="gt_request_queue40_full"
+             description="The percentage of time when IDI0 SQ40 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ50 is full"
+             symbol_name="GTRequestQueue50Full"
+             underscore_name="gt_request_queue50_full"
+             description="The percentage of time when IDI0 SQ50 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ60 is full"
+             symbol_name="GTRequestQueue60Full"
+             underscore_name="gt_request_queue60_full"
+             description="The percentage of time when IDI0 SQ60 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ70 is full"
+             symbol_name="GTRequestQueue70Full"
+             underscore_name="gt_request_queue70_full"
+             description="The percentage of time when IDI0 SQ70 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1E810200" />
+        <register type="NOA" address="0x00009888" value="0x1EA10200" />
+        <register type="NOA" address="0x00009888" value="0x1EC10200" />
+        <register type="NOA" address="0x00009888" value="0x1EE10200" />
+        <register type="NOA" address="0x00009888" value="0x1F810200" />
+        <register type="NOA" address="0x00009888" value="0x1FA10200" />
+        <register type="NOA" address="0x00009888" value="0x1FC10200" />
+        <register type="NOA" address="0x00009888" value="0x1FE10200" />
+        <register type="NOA" address="0x00009888" value="0x04810400" />
+        <register type="NOA" address="0x00009888" value="0x08810015" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x00830002" />
+        <register type="NOA" address="0x00009888" value="0x00840001" />
+        <register type="NOA" address="0x00009888" value="0x00860001" />
+        <register type="NOA" address="0x00009888" value="0x00870001" />
+        <register type="NOA" address="0x00009888" value="0x04A10400" />
+        <register type="NOA" address="0x00009888" value="0x08A10540" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x00A30008" />
+        <register type="NOA" address="0x00009888" value="0x00A40002" />
+        <register type="NOA" address="0x00009888" value="0x00A60004" />
+        <register type="NOA" address="0x00009888" value="0x00A70004" />
+        <register type="NOA" address="0x00009888" value="0x04C10400" />
+        <register type="NOA" address="0x00009888" value="0x0AC10015" />
+        <register type="NOA" address="0x00009888" value="0x08C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C30020" />
+        <register type="NOA" address="0x00009888" value="0x00C40004" />
+        <register type="NOA" address="0x00009888" value="0x00C60010" />
+        <register type="NOA" address="0x00009888" value="0x00C70010" />
+        <register type="NOA" address="0x00009888" value="0x04E10400" />
+        <register type="NOA" address="0x00009888" value="0x0AE10540" />
+        <register type="NOA" address="0x00009888" value="0x08E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E30080" />
+        <register type="NOA" address="0x00009888" value="0x00E40008" />
+        <register type="NOA" address="0x00009888" value="0x00E60040" />
+        <register type="NOA" address="0x00009888" value="0x00E70040" />
+        <register type="NOA" address="0x00009888" value="0x05810400" />
+        <register type="NOA" address="0x00009888" value="0x0D810015" />
+        <register type="NOA" address="0x00009888" value="0x09810000" />
+        <register type="NOA" address="0x00009888" value="0x01810000" />
+        <register type="NOA" address="0x00009888" value="0x01830200" />
+        <register type="NOA" address="0x00009888" value="0x01840010" />
+        <register type="NOA" address="0x00009888" value="0x01860100" />
+        <register type="NOA" address="0x00009888" value="0x01870100" />
+        <register type="NOA" address="0x00009888" value="0x05A10400" />
+        <register type="NOA" address="0x00009888" value="0x0DA10540" />
+        <register type="NOA" address="0x00009888" value="0x09A10000" />
+        <register type="NOA" address="0x00009888" value="0x01A10000" />
+        <register type="NOA" address="0x00009888" value="0x01A30800" />
+        <register type="NOA" address="0x00009888" value="0x01A40020" />
+        <register type="NOA" address="0x00009888" value="0x01A60400" />
+        <register type="NOA" address="0x00009888" value="0x01A70400" />
+        <register type="NOA" address="0x00009888" value="0x05C10400" />
+        <register type="NOA" address="0x00009888" value="0x0FC10015" />
+        <register type="NOA" address="0x00009888" value="0x09C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C32000" />
+        <register type="NOA" address="0x00009888" value="0x01C40040" />
+        <register type="NOA" address="0x00009888" value="0x01C61000" />
+        <register type="NOA" address="0x00009888" value="0x01C71000" />
+        <register type="NOA" address="0x00009888" value="0x05E10400" />
+        <register type="NOA" address="0x00009888" value="0x0FE10540" />
+        <register type="NOA" address="0x00009888" value="0x09E10000" />
+        <register type="NOA" address="0x00009888" value="0x01E10000" />
+        <register type="NOA" address="0x00009888" value="0x01E38000" />
+        <register type="NOA" address="0x00009888" value="0x01E40080" />
+        <register type="NOA" address="0x00009888" value="0x01E64000" />
+        <register type="NOA" address="0x00009888" value="0x01E74000" />
+        <register type="NOA" address="0x00009888" value="0x000300F0" />
+        <register type="NOA" address="0x00009888" value="0x00070060" />
+        <register type="NOA" address="0x00009888" value="0x0008FF0E" />
+        <register type="NOA" address="0x00009888" value="0x0009000C" />
+        <register type="NOA" address="0x00009888" value="0x000A55A5" />
+        <register type="NOA" address="0x00009888" value="0x000100F2" />
+        <register type="NOA" address="0x00009888" value="0x000BAA04" />
+        <register type="NOA" address="0x00009888" value="0x00020004" />
+        <register type="NOA" address="0x00009888" value="0x000C0010" />
+        <register type="NOA" address="0x00009888" value="0x01076000" />
+        <register type="NOA" address="0x00009888" value="0x01080E00" />
+        <register type="NOA" address="0x00009888" value="0x010900C0" />
+        <register type="NOA" address="0x00009888" value="0x010AA500" />
+        <register type="NOA" address="0x00009888" value="0x01010020" />
+        <register type="NOA" address="0x00009888" value="0x010B0400" />
+        <register type="NOA" address="0x00009888" value="0x01020040" />
+        <register type="NOA" address="0x00009888" value="0x010C1000" />
+        <register type="NOA" address="0x00009884" value="0x00000001" />
+        <register type="NOA" address="0x00009888" value="0x0C017000" />
+        <register type="NOA" address="0x00009888" value="0x0C217000" />
+        <register type="NOA" address="0x00009888" value="0x0C417000" />
+        <register type="NOA" address="0x00009888" value="0x0C617000" />
+        <register type="NOA" address="0x00009888" value="0x0C817000" />
+        <register type="NOA" address="0x00009888" value="0x0CA17000" />
+        <register type="NOA" address="0x00009888" value="0x0CC17000" />
+        <register type="NOA" address="0x00009888" value="0x0CE17000" />
+        <register type="NOA" address="0x00009888" value="0x02010010" />
+        <register type="NOA" address="0x00009888" value="0x16010006" />
+        <register type="NOA" address="0x00009888" value="0x00010000" />
+        <register type="NOA" address="0x00009888" value="0x02210010" />
+        <register type="NOA" address="0x00009888" value="0x14210180" />
+        <register type="NOA" address="0x00009888" value="0x00210000" />
+        <register type="NOA" address="0x00009888" value="0x02410010" />
+        <register type="NOA" address="0x00009888" value="0x14410006" />
+        <register type="NOA" address="0x00009888" value="0x00410000" />
+        <register type="NOA" address="0x00009888" value="0x02610010" />
+        <register type="NOA" address="0x00009888" value="0x12610180" />
+        <register type="NOA" address="0x00009888" value="0x00610000" />
+        <register type="NOA" address="0x00009888" value="0x02810010" />
+        <register type="NOA" address="0x00009888" value="0x12810006" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x02A10010" />
+        <register type="NOA" address="0x00009888" value="0x10A10180" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x02C10010" />
+        <register type="NOA" address="0x00009888" value="0x10C10006" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x02E10010" />
+        <register type="NOA" address="0x00009888" value="0x0EE10180" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02034892" />
+        <register type="NOA" address="0x00009888" value="0x04034924" />
+        <register type="NOA" address="0x00009888" value="0x06030004" />
+        <register type="NOA" address="0x00009888" value="0x02093800" />
+        <register type="NOA" address="0x00009888" value="0x0409000A" />
+        <register type="NOA" address="0x00009888" value="0x020A1200" />
+        <register type="NOA" address="0x00009888" value="0x040A2489" />
+        <register type="NOA" address="0x00009888" value="0x060A0002" />
+        <register type="NOA" address="0x00009888" value="0x040B2700" />
+        <register type="NOA" address="0x00009888" value="0x060B0001" />
+        <register type="NOA" address="0x00009888" value="0x14037000" />
+        <register type="NOA" address="0x00009888" value="0x3E0314CA" />
+        <register type="NOA" address="0x00009888" value="0x26037000" />
+        <register type="NOA" address="0x00009888" value="0x42032004" />
+        <register type="NOA" address="0x00009888" value="0x2C033000" />
+        <register type="NOA" address="0x00009888" value="0x32037000" />
+        <register type="NOA" address="0x00009888" value="0x44030047" />
+        <register type="NOA" address="0x00009888" value="0x38031000" />
+        <register type="NOA" address="0x00009888" value="0x46030003" />
+        <register type="NOA" address="0x00009888" value="0x48031EA0" />
+        <register type="NOA" address="0x00009888" value="0x4A030DE6" />
+        <register type="NOA" address="0x00009888" value="0x1603F000" />
+        <register type="NOA" address="0x00009888" value="0x1803F000" />
+        <register type="NOA" address="0x00009888" value="0x1A03F000" />
+        <register type="NOA" address="0x00009888" value="0x40031084" />
+        <register type="NOA" address="0x00009888" value="0x1C03F000" />
+        <register type="NOA" address="0x00009888" value="0x1E03F000" />
+        <register type="NOA" address="0x00009888" value="0x2003F000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x000100FF" />
+        <register type="NOA" address="0x00009888" value="0x00025555" />
+        <register type="NOA" address="0x00009888" value="0x00045555" />
+        <register type="NOA" address="0x00009888" value="0x00055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000DC40" value="0x00FF0000" />
+        <register type="OA" address="0x0000D940" value="0x00000002" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFE" />
+        <register type="OA" address="0x0000DC00" value="0x00000002" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFE" />
+        <register type="OA" address="0x0000D948" value="0x00000002" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000DC08" value="0x00000002" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000D950" value="0x00000002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFB" />
+        <register type="OA" address="0x0000DC10" value="0x00000002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFB" />
+        <register type="OA" address="0x0000D958" value="0x00000002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000DC18" value="0x00000002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00000002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC20" value="0x00000002" />
+        <register type="OA" address="0x0000DC24" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D968" value="0x00000002" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000DC28" value="0x00000002" />
+        <register type="OA" address="0x0000DC2C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000D970" value="0x00000002" />
+        <register type="OA" address="0x0000D974" value="0x0000FFBF" />
+        <register type="OA" address="0x0000DC30" value="0x00000002" />
+        <register type="OA" address="0x0000DC34" value="0x0000FFBF" />
+        <register type="OA" address="0x0000D978" value="0x00000002" />
+        <register type="OA" address="0x0000D97C" value="0x0000FF7F" />
+        <register type="OA" address="0x0000DC38" value="0x00000002" />
+        <register type="OA" address="0x0000DC3C" value="0x0000FF7F" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set HDCAndSF2"
+       chipset="DG2"
+       symbol_name="HDCAndSF2"
+       underscore_name="hdc_and_sf2"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="a3b35902-f293-41fe-97d0-3d895bc5fab3"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Polygon (Slice0) Data Ready"
+             symbol_name="Poly0DataReady"
+             underscore_name="poly0_data_ready"
+             description="The percentage of time in which geometry pipeline output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe/Strip-Fans"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Polygon (Slice1) Data Ready"
+             symbol_name="Poly1DataReady"
+             underscore_name="poly1_data_ready"
+             description="The percentage of time in which geometry pipeline output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe/Strip-Fans"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x12056400" />
+        <register type="NOA" address="0x00009888" value="0x13056400" />
+        <register type="NOA" address="0x00009888" value="0x00030001" />
+        <register type="NOA" address="0x00009888" value="0x00050002" />
+        <register type="NOA" address="0x00009888" value="0x02050700" />
+        <register type="NOA" address="0x00009888" value="0x00060002" />
+        <register type="NOA" address="0x00009888" value="0x00080007" />
+        <register type="NOA" address="0x00009888" value="0x000A0005" />
+        <register type="NOA" address="0x00009888" value="0x00010001" />
+        <register type="NOA" address="0x00009888" value="0x000B0002" />
+        <register type="NOA" address="0x00009888" value="0x01050002" />
+        <register type="NOA" address="0x00009888" value="0x0305001C" />
+        <register type="NOA" address="0x00009888" value="0x01060001" />
+        <register type="NOA" address="0x00009888" value="0x01080001" />
+        <register type="NOA" address="0x00009888" value="0x010A0001" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008000A" />
+        <register type="NOA" address="0x00009888" value="0x00030012" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030000" />
+        <register type="NOA" address="0x00009888" value="0x26033000" />
+        <register type="NOA" address="0x00009888" value="0x42030100" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x00010003" />
+        <register type="NOA" address="0x00009888" value="0x00020005" />
+        <register type="NOA" address="0x00009888" value="0x00040005" />
+        <register type="NOA" address="0x00009888" value="0x00050005" />
+        <register type="NOA" address="0x00009888" value="0x0008000A" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000002" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFE" />
+        <register type="OA" address="0x0000DC00" value="0x00000002" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFE" />
+        <register type="OA" address="0x0000D948" value="0x00000002" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000DC08" value="0x00000002" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFD" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set RasterizerAndPixelBackend1"
+       chipset="DG2"
+       symbol_name="RasterizerAndPixelBackend1"
+       underscore_name="rasterizer_and_pixel_backend1"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="b04e9460-630f-4682-b0ed-ebb0e74a6c9d"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 Rasterizer Input Available"
+             symbol_name="Rasterizer0InputAvailable"
+             underscore_name="rasterizer0_input_available"
+             description="The percentage of time in which slice0 rasterizer input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice1 Rasterizer Output Ready"
+             symbol_name="Rasterizer1OutputReady"
+             underscore_name="rasterizer1_output_ready"
+             description="The percentage of time in which slice1 rasterizer output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 2 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe0 Post-EarlyZ Pixel Data Ready"
+             symbol_name="PixelData00Ready"
+             underscore_name="pixel_data00_ready"
+             description="The percentage of time in which slice0  pipe0 post-EarlyZ pixel data is ready (after early Z tests have been applied)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe1 Post-EarlyZ Pixel Data Ready"
+             symbol_name="PixelData01Ready"
+             underscore_name="pixel_data01_ready"
+             description="The percentage of time in which slice0  pipe1 post-EarlyZ pixel data is ready (after early Z tests have been applied)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1A056000" />
+        <register type="NOA" address="0x00009888" value="0x1C050000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B7000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B6000" />
+        <register type="NOA" address="0x00009888" value="0x0C0C701F" />
+        <register type="NOA" address="0x00009888" value="0x0E0C6000" />
+        <register type="NOA" address="0x00009888" value="0x1B057000" />
+        <register type="NOA" address="0x00009888" value="0x00038000" />
+        <register type="NOA" address="0x00009888" value="0x00050000" />
+        <register type="NOA" address="0x00009888" value="0x020535D2" />
+        <register type="NOA" address="0x00009888" value="0x0405003E" />
+        <register type="NOA" address="0x00009888" value="0x00060007" />
+        <register type="NOA" address="0x00009888" value="0x00072800" />
+        <register type="NOA" address="0x00009888" value="0x000803D5" />
+        <register type="NOA" address="0x00009888" value="0x0208C000" />
+        <register type="NOA" address="0x00009888" value="0x00090060" />
+        <register type="NOA" address="0x00009888" value="0x000A2955" />
+        <register type="NOA" address="0x00009888" value="0x020A4000" />
+        <register type="NOA" address="0x00009888" value="0x00018018" />
+        <register type="NOA" address="0x00009888" value="0x040B0200" />
+        <register type="NOA" address="0x00009888" value="0x080B0400" />
+        <register type="NOA" address="0x00009888" value="0x0A0B001F" />
+        <register type="NOA" address="0x00009888" value="0x000B0000" />
+        <register type="NOA" address="0x00009888" value="0x020B8000" />
+        <register type="NOA" address="0x00009888" value="0x00020060" />
+        <register type="NOA" address="0x00009888" value="0x040C0200" />
+        <register type="NOA" address="0x00009888" value="0x0A0C0400" />
+        <register type="NOA" address="0x00009888" value="0x080C0000" />
+        <register type="NOA" address="0x00009888" value="0x000C0000" />
+        <register type="NOA" address="0x00009888" value="0x01050000" />
+        <register type="NOA" address="0x00009888" value="0x11050DC0" />
+        <register type="NOA" address="0x00009888" value="0x03050000" />
+        <register type="NOA" address="0x00009888" value="0x01068000" />
+        <register type="NOA" address="0x00009888" value="0x03084000" />
+        <register type="NOA" address="0x00009888" value="0x030A4000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x00082AAA" />
+        <register type="NOA" address="0x00009888" value="0x02088000" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02030012" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14033000" />
+        <register type="NOA" address="0x00009888" value="0x3E030008" />
+        <register type="NOA" address="0x00009888" value="0x26033000" />
+        <register type="NOA" address="0x00009888" value="0x42032100" />
+        <register type="NOA" address="0x00009888" value="0x2C033000" />
+        <register type="NOA" address="0x00009888" value="0x32033000" />
+        <register type="NOA" address="0x00009888" value="0x44030CA5" />
+        <register type="NOA" address="0x00009888" value="0x38033000" />
+        <register type="NOA" address="0x00009888" value="0x46030462" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001807F" />
+        <register type="NOA" address="0x00009888" value="0x00021555" />
+        <register type="NOA" address="0x00009888" value="0x02024000" />
+        <register type="NOA" address="0x00009888" value="0x00041555" />
+        <register type="NOA" address="0x00009888" value="0x02044000" />
+        <register type="NOA" address="0x00009888" value="0x00051555" />
+        <register type="NOA" address="0x00009888" value="0x02054000" />
+        <register type="NOA" address="0x00009888" value="0x00082AAA" />
+        <register type="NOA" address="0x00009888" value="0x02088000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x70800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00070000" />
+        <register type="OA" address="0x0000D940" value="0x00000038" />
+        <register type="OA" address="0x0000D944" value="0x0000FFF8" />
+        <register type="OA" address="0x0000DC00" value="0x00000038" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFF8" />
+        <register type="OA" address="0x0000D948" value="0x000000C0" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC08" value="0x000000C0" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D950" value="0x00000300" />
+        <register type="OA" address="0x0000D954" value="0x0000FF9F" />
+        <register type="OA" address="0x0000DC10" value="0x00000300" />
+        <register type="OA" address="0x0000DC14" value="0x0000FF9F" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set RasterizerAndPixelBackend2"
+       chipset="DG2"
+       symbol_name="RasterizerAndPixelBackend2"
+       underscore_name="rasterizer_and_pixel_backend2"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="57a0abf4-8d81-4856-ab86-01f15f92c81c"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice1 Rasterizer Input Available"
+             symbol_name="Rasterizer1InputAvailable"
+             underscore_name="rasterizer1_input_available"
+             description="The percentage of time in which slice1 rasterizer input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 2 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Rasterizer Output Ready"
+             symbol_name="Rasterizer0OutputReady"
+             underscore_name="rasterizer0_output_ready"
+             description="The percentage of time in which slice0 rasterizer output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice1 Pipe0 Post-EarlyZ Pixel Data Ready"
+             symbol_name="PixelData10Ready"
+             underscore_name="pixel_data10_ready"
+             description="The percentage of time in which slice1  pipe0 post-EarlyZ pixel data is ready (after early Z tests have been applied)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice1 Pipe1 Post-EarlyZ Pixel Data Ready"
+             symbol_name="PixelData11Ready"
+             underscore_name="pixel_data11_ready"
+             description="The percentage of time in which slice1  pipe1 post-EarlyZ pixel data is ready (after early Z tests have been applied)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1A057000" />
+        <register type="NOA" address="0x00009888" value="0x1B056000" />
+        <register type="NOA" address="0x00009888" value="0x1D050000" />
+        <register type="NOA" address="0x00009888" value="0x0D0B701F" />
+        <register type="NOA" address="0x00009888" value="0x0F0B6000" />
+        <register type="NOA" address="0x00009888" value="0x0D0C7000" />
+        <register type="NOA" address="0x00009888" value="0x0F0C6000" />
+        <register type="NOA" address="0x00009888" value="0x0003007F" />
+        <register type="NOA" address="0x00009888" value="0x00050000" />
+        <register type="NOA" address="0x00009888" value="0x10050DC0" />
+        <register type="NOA" address="0x00009888" value="0x02050000" />
+        <register type="NOA" address="0x00009888" value="0x00068000" />
+        <register type="NOA" address="0x00009888" value="0x00083FFF" />
+        <register type="NOA" address="0x00009888" value="0x02084000" />
+        <register type="NOA" address="0x00009888" value="0x000A1555" />
+        <register type="NOA" address="0x00009888" value="0x020A4000" />
+        <register type="NOA" address="0x00009888" value="0x0001007F" />
+        <register type="NOA" address="0x00009888" value="0x000B2AAA" />
+        <register type="NOA" address="0x00009888" value="0x01050000" />
+        <register type="NOA" address="0x00009888" value="0x030535D2" />
+        <register type="NOA" address="0x00009888" value="0x0505003E" />
+        <register type="NOA" address="0x00009888" value="0x01060007" />
+        <register type="NOA" address="0x00009888" value="0x01070280" />
+        <register type="NOA" address="0x00009888" value="0x01083C15" />
+        <register type="NOA" address="0x00009888" value="0x01090018" />
+        <register type="NOA" address="0x00009888" value="0x010A1695" />
+        <register type="NOA" address="0x00009888" value="0x01010060" />
+        <register type="NOA" address="0x00009888" value="0x050B0200" />
+        <register type="NOA" address="0x00009888" value="0x0B0B0400" />
+        <register type="NOA" address="0x00009888" value="0x090B0000" />
+        <register type="NOA" address="0x00009888" value="0x010B0000" />
+        <register type="NOA" address="0x00009888" value="0x01020018" />
+        <register type="NOA" address="0x00009888" value="0x050C0200" />
+        <register type="NOA" address="0x00009888" value="0x090C0400" />
+        <register type="NOA" address="0x00009888" value="0x0B0C001F" />
+        <register type="NOA" address="0x00009888" value="0x010C0000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x00082AAA" />
+        <register type="NOA" address="0x00009888" value="0x02088000" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02030012" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030006" />
+        <register type="NOA" address="0x00009888" value="0x26030000" />
+        <register type="NOA" address="0x00009888" value="0x420318C3" />
+        <register type="NOA" address="0x00009888" value="0x2C030000" />
+        <register type="NOA" address="0x00009888" value="0x32030000" />
+        <register type="NOA" address="0x00009888" value="0x44030000" />
+        <register type="NOA" address="0x00009888" value="0x38030000" />
+        <register type="NOA" address="0x00009888" value="0x46030603" />
+        <register type="NOA" address="0x00009888" value="0x20037000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001807F" />
+        <register type="NOA" address="0x00009888" value="0x00021555" />
+        <register type="NOA" address="0x00009888" value="0x02024000" />
+        <register type="NOA" address="0x00009888" value="0x00041555" />
+        <register type="NOA" address="0x00009888" value="0x02044000" />
+        <register type="NOA" address="0x00009888" value="0x00051555" />
+        <register type="NOA" address="0x00009888" value="0x02054000" />
+        <register type="NOA" address="0x00009888" value="0x00082AAA" />
+        <register type="NOA" address="0x00009888" value="0x02088000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x70800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00070000" />
+        <register type="OA" address="0x0000D940" value="0x00000038" />
+        <register type="OA" address="0x0000D944" value="0x0000FFF8" />
+        <register type="OA" address="0x0000DC00" value="0x00000038" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFF8" />
+        <register type="OA" address="0x0000D948" value="0x000000C0" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC08" value="0x000000C0" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D950" value="0x00000300" />
+        <register type="OA" address="0x0000D954" value="0x0000FF9F" />
+        <register type="OA" address="0x0000DC10" value="0x00000300" />
+        <register type="OA" address="0x0000DC14" value="0x0000FF9F" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Sampler_1"
+       chipset="DG2"
+       symbol_name="Sampler_1"
+       underscore_name="sampler_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="2314eaa3-164f-4004-9684-3f1d16e875f9"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 DualSubslice0 Input Available"
+             symbol_name="Sampler00InputAvailable"
+             underscore_name="sampler00_input_available"
+             description="The percentage of time in which slice0 dualsubslice0 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice1 Input Available"
+             symbol_name="Sampler01InputAvailable"
+             underscore_name="sampler01_input_available"
+             description="The percentage of time in which slice0 dualsubslice1 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice2 Input Available"
+             symbol_name="Sampler02InputAvailable"
+             underscore_name="sampler02_input_available"
+             description="The percentage of time in which slice0 dualsubslice2 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice3 Input Available"
+             symbol_name="Sampler03InputAvailable"
+             underscore_name="sampler03_input_available"
+             description="The percentage of time in which slice0 dualsubslice3 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice0 Sampler Output Ready"
+             symbol_name="Sampler00OutputReady"
+             underscore_name="sampler00_output_ready"
+             description="The percentage of time in which slice0 dualsubslice0 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice1 Sampler Output Ready"
+             symbol_name="Sampler01OutputReady"
+             underscore_name="sampler01_output_ready"
+             description="The percentage of time in which slice0 dualsubslice1 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice2 Sampler Output Ready"
+             symbol_name="Sampler02OutputReady"
+             underscore_name="sampler02_output_ready"
+             description="The percentage of time in which slice0 dualsubslice2 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice3 Sampler Output Ready"
+             symbol_name="Sampler03OutputReady"
+             underscore_name="sampler03_output_ready"
+             description="The percentage of time in which slice0 dualsubslice3 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1C824800" />
+        <register type="NOA" address="0x00009888" value="0x14832C00" />
+        <register type="NOA" address="0x00009888" value="0x1CA24800" />
+        <register type="NOA" address="0x00009888" value="0x14A32C00" />
+        <register type="NOA" address="0x00009888" value="0x1CC24800" />
+        <register type="NOA" address="0x00009888" value="0x14C32C00" />
+        <register type="NOA" address="0x00009888" value="0x1CE24800" />
+        <register type="NOA" address="0x00009888" value="0x14E32C00" />
+        <register type="NOA" address="0x00009888" value="0x04824000" />
+        <register type="NOA" address="0x00009888" value="0x16820027" />
+        <register type="NOA" address="0x00009888" value="0x02820000" />
+        <register type="NOA" address="0x00009888" value="0x0E830580" />
+        <register type="NOA" address="0x00009888" value="0x04830000" />
+        <register type="NOA" address="0x00009888" value="0x02834000" />
+        <register type="NOA" address="0x00009888" value="0x00848800" />
+        <register type="NOA" address="0x00009888" value="0x02864040" />
+        <register type="NOA" address="0x00009888" value="0x04A24000" />
+        <register type="NOA" address="0x00009888" value="0x14A209C0" />
+        <register type="NOA" address="0x00009888" value="0x02A20000" />
+        <register type="NOA" address="0x00009888" value="0x0EA30016" />
+        <register type="NOA" address="0x00009888" value="0x04A30000" />
+        <register type="NOA" address="0x00009888" value="0x02A31000" />
+        <register type="NOA" address="0x00009888" value="0x00A44400" />
+        <register type="NOA" address="0x00009888" value="0x02A61010" />
+        <register type="NOA" address="0x00009888" value="0x04C24000" />
+        <register type="NOA" address="0x00009888" value="0x14C20027" />
+        <register type="NOA" address="0x00009888" value="0x02C20000" />
+        <register type="NOA" address="0x00009888" value="0x0CC30580" />
+        <register type="NOA" address="0x00009888" value="0x04C30000" />
+        <register type="NOA" address="0x00009888" value="0x02C30400" />
+        <register type="NOA" address="0x00009888" value="0x00C42200" />
+        <register type="NOA" address="0x00009888" value="0x02C60404" />
+        <register type="NOA" address="0x00009888" value="0x04E24000" />
+        <register type="NOA" address="0x00009888" value="0x12E209C0" />
+        <register type="NOA" address="0x00009888" value="0x02E20000" />
+        <register type="NOA" address="0x00009888" value="0x0CE30016" />
+        <register type="NOA" address="0x00009888" value="0x04E30000" />
+        <register type="NOA" address="0x00009888" value="0x02E30100" />
+        <register type="NOA" address="0x00009888" value="0x00E41100" />
+        <register type="NOA" address="0x00009888" value="0x02E60101" />
+        <register type="NOA" address="0x00009888" value="0x02070909" />
+        <register type="NOA" address="0x00009888" value="0x0208B0B0" />
+        <register type="NOA" address="0x00009888" value="0x00093300" />
+        <register type="NOA" address="0x00009888" value="0x020A5A5A" />
+        <register type="NOA" address="0x00009888" value="0x00014400" />
+        <register type="NOA" address="0x00009888" value="0x020B1010" />
+        <register type="NOA" address="0x00009888" value="0x00022200" />
+        <register type="NOA" address="0x00009888" value="0x020C0404" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x02032400" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x48030200" />
+        <register type="NOA" address="0x00009888" value="0x4A030803" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x3E0318E0" />
+        <register type="NOA" address="0x00009888" value="0x18031000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x40030C0A" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20031000" />
+        <register type="NOA" address="0x00009888" value="0x42030002" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FF00" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Sampler_2"
+       chipset="DG2"
+       symbol_name="Sampler_2"
+       underscore_name="sampler_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="c60dea82-db13-4882-8d31-a02bce151ef7"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice1 DualSubslice0 Input Available"
+             symbol_name="Sampler10InputAvailable"
+             underscore_name="sampler10_input_available"
+             description="The percentage of time in which slice1 dualsubslice0 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice1 DualSubslice1 Input Available"
+             symbol_name="Sampler11InputAvailable"
+             underscore_name="sampler11_input_available"
+             description="The percentage of time in which slice1 dualsubslice1 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice1 DualSubslice2 Input Available"
+             symbol_name="Sampler12InputAvailable"
+             underscore_name="sampler12_input_available"
+             description="The percentage of time in which slice1 dualsubslice2 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice1 DualSubslice3 Input Available"
+             symbol_name="Sampler13InputAvailable"
+             underscore_name="sampler13_input_available"
+             description="The percentage of time in which slice1 dualsubslice3 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice1 DualSubslice0 Sampler Output Ready"
+             symbol_name="Sampler10OutputReady"
+             underscore_name="sampler10_output_ready"
+             description="The percentage of time in which slice1 dualsubslice0 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 DualSubslice1 Sampler Output Ready"
+             symbol_name="Sampler11OutputReady"
+             underscore_name="sampler11_output_ready"
+             description="The percentage of time in which slice1 dualsubslice1 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 DualSubslice2 Sampler Output Ready"
+             symbol_name="Sampler12OutputReady"
+             underscore_name="sampler12_output_ready"
+             description="The percentage of time in which slice1 dualsubslice2 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice1 DualSubslice3 Sampler Output Ready"
+             symbol_name="Sampler13OutputReady"
+             underscore_name="sampler13_output_ready"
+             description="The percentage of time in which slice1 dualsubslice3 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1D824800" />
+        <register type="NOA" address="0x00009888" value="0x15832C00" />
+        <register type="NOA" address="0x00009888" value="0x1DA24800" />
+        <register type="NOA" address="0x00009888" value="0x15A32C00" />
+        <register type="NOA" address="0x00009888" value="0x1DC24800" />
+        <register type="NOA" address="0x00009888" value="0x15C32C00" />
+        <register type="NOA" address="0x00009888" value="0x1DE24800" />
+        <register type="NOA" address="0x00009888" value="0x15E32C00" />
+        <register type="NOA" address="0x00009888" value="0x05824000" />
+        <register type="NOA" address="0x00009888" value="0x17820027" />
+        <register type="NOA" address="0x00009888" value="0x03820000" />
+        <register type="NOA" address="0x00009888" value="0x0F830580" />
+        <register type="NOA" address="0x00009888" value="0x05830000" />
+        <register type="NOA" address="0x00009888" value="0x03834000" />
+        <register type="NOA" address="0x00009888" value="0x01848800" />
+        <register type="NOA" address="0x00009888" value="0x03864040" />
+        <register type="NOA" address="0x00009888" value="0x05A24000" />
+        <register type="NOA" address="0x00009888" value="0x15A209C0" />
+        <register type="NOA" address="0x00009888" value="0x03A20000" />
+        <register type="NOA" address="0x00009888" value="0x0FA30016" />
+        <register type="NOA" address="0x00009888" value="0x05A30000" />
+        <register type="NOA" address="0x00009888" value="0x03A31000" />
+        <register type="NOA" address="0x00009888" value="0x01A44400" />
+        <register type="NOA" address="0x00009888" value="0x03A61010" />
+        <register type="NOA" address="0x00009888" value="0x05C24000" />
+        <register type="NOA" address="0x00009888" value="0x15C20027" />
+        <register type="NOA" address="0x00009888" value="0x03C20000" />
+        <register type="NOA" address="0x00009888" value="0x0DC30580" />
+        <register type="NOA" address="0x00009888" value="0x05C30000" />
+        <register type="NOA" address="0x00009888" value="0x03C30400" />
+        <register type="NOA" address="0x00009888" value="0x01C42200" />
+        <register type="NOA" address="0x00009888" value="0x03C60404" />
+        <register type="NOA" address="0x00009888" value="0x05E24000" />
+        <register type="NOA" address="0x00009888" value="0x13E209C0" />
+        <register type="NOA" address="0x00009888" value="0x03E20000" />
+        <register type="NOA" address="0x00009888" value="0x0DE30016" />
+        <register type="NOA" address="0x00009888" value="0x05E30000" />
+        <register type="NOA" address="0x00009888" value="0x03E30100" />
+        <register type="NOA" address="0x00009888" value="0x01E41100" />
+        <register type="NOA" address="0x00009888" value="0x03E60101" />
+        <register type="NOA" address="0x00009888" value="0x0003FF00" />
+        <register type="NOA" address="0x00009888" value="0x0208FFFF" />
+        <register type="NOA" address="0x00009888" value="0x020A5555" />
+        <register type="NOA" address="0x00009888" value="0x0001FF00" />
+        <register type="NOA" address="0x00009888" value="0x020BAAAA" />
+        <register type="NOA" address="0x00009888" value="0x03070909" />
+        <register type="NOA" address="0x00009888" value="0x0308B0B0" />
+        <register type="NOA" address="0x00009888" value="0x01093300" />
+        <register type="NOA" address="0x00009888" value="0x030A5A5A" />
+        <register type="NOA" address="0x00009888" value="0x01014400" />
+        <register type="NOA" address="0x00009888" value="0x030B1010" />
+        <register type="NOA" address="0x00009888" value="0x01022200" />
+        <register type="NOA" address="0x00009888" value="0x030C0404" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x02032400" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x48030200" />
+        <register type="NOA" address="0x00009888" value="0x4A030803" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x3E0318E0" />
+        <register type="NOA" address="0x00009888" value="0x18031000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x40030C0A" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20031000" />
+        <register type="NOA" address="0x00009888" value="0x42030002" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FF00" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="TDL_1"
+       chipset="DG2"
+       symbol_name="TDL_1"
+       underscore_name="tdl_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="7f5cb8ec-38bb-48c9-9ad2-60075eba2833"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="NonPSThread00ReadyForDispatch"
+             underscore_name="non_ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice1 Thread Dispatcher"
+             symbol_name="NonPSThread01ReadyForDispatch"
+             underscore_name="non_ps_thread01_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice2 Thread Dispatcher"
+             symbol_name="NonPSThread02ReadyForDispatch"
+             underscore_name="non_ps_thread02_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice3 Thread Dispatcher"
+             symbol_name="NonPSThread03ReadyForDispatch"
+             underscore_name="non_ps_thread03_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice1 DualSubslice0 Thread Dispatcher"
+             symbol_name="NonPSThread10ReadyForDispatch"
+             underscore_name="non_ps_thread10_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice1 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice1 DualSubslice1 Thread Dispatcher"
+             symbol_name="NonPSThread11ReadyForDispatch"
+             underscore_name="non_ps_thread11_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice1 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice1 DualSubslice2 Thread Dispatcher"
+             symbol_name="NonPSThread12ReadyForDispatch"
+             underscore_name="non_ps_thread12_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice1 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice1 DualSubslice3 Thread Dispatcher"
+             symbol_name="NonPSThread13ReadyForDispatch"
+             underscore_name="non_ps_thread13_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice1 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice3 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader03ReadyPort0"
+             underscore_name="thread_header03_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice3 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice3 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader03ReadyPort1"
+             underscore_name="thread_header03_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice3 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice3 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader03ReadyPort2"
+             underscore_name="thread_header03_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice3 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice3 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader03ReadyPort3"
+             underscore_name="thread_header03_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice3 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice3 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader13ReadyPort0"
+             underscore_name="thread_header13_ready_port0"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice3 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice3 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader13ReadyPort1"
+             underscore_name="thread_header13_ready_port1"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice3 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice3 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader13ReadyPort2"
+             underscore_name="thread_header13_ready_port2"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice3 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice3 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader13ReadyPort3"
+             underscore_name="thread_header13_ready_port3"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice3 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x2A81001C" />
+        <register type="NOA" address="0x00009888" value="0x2AA1001C" />
+        <register type="NOA" address="0x00009888" value="0x2AC1001C" />
+        <register type="NOA" address="0x00009888" value="0x2AE1001C" />
+        <register type="NOA" address="0x00009888" value="0x2B81001C" />
+        <register type="NOA" address="0x00009888" value="0x2BA1001C" />
+        <register type="NOA" address="0x00009888" value="0x2BC1001C" />
+        <register type="NOA" address="0x00009888" value="0x2BE1001C" />
+        <register type="NOA" address="0x00009888" value="0x06810300" />
+        <register type="NOA" address="0x00009888" value="0x08810030" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x00830002" />
+        <register type="NOA" address="0x00009888" value="0x00840001" />
+        <register type="NOA" address="0x00009888" value="0x00860001" />
+        <register type="NOA" address="0x00009888" value="0x00870001" />
+        <register type="NOA" address="0x00009888" value="0x06A10300" />
+        <register type="NOA" address="0x00009888" value="0x08A10C00" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x00A30008" />
+        <register type="NOA" address="0x00009888" value="0x00A40002" />
+        <register type="NOA" address="0x00009888" value="0x00A60004" />
+        <register type="NOA" address="0x00009888" value="0x00A70004" />
+        <register type="NOA" address="0x00009888" value="0x06C10300" />
+        <register type="NOA" address="0x00009888" value="0x0AC10030" />
+        <register type="NOA" address="0x00009888" value="0x08C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C30020" />
+        <register type="NOA" address="0x00009888" value="0x00C40004" />
+        <register type="NOA" address="0x00009888" value="0x00C60010" />
+        <register type="NOA" address="0x00009888" value="0x00C70010" />
+        <register type="NOA" address="0x00009888" value="0x06E10300" />
+        <register type="NOA" address="0x00009888" value="0x0AE10C00" />
+        <register type="NOA" address="0x00009888" value="0x14E10CF4" />
+        <register type="NOA" address="0x00009888" value="0x16E10C72" />
+        <register type="NOA" address="0x00009888" value="0x08E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009888" value="0x02E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E30080" />
+        <register type="NOA" address="0x00009888" value="0x02E3AA00" />
+        <register type="NOA" address="0x00009888" value="0x00E4F008" />
+        <register type="NOA" address="0x00009888" value="0x00E60040" />
+        <register type="NOA" address="0x00009888" value="0x02E65500" />
+        <register type="NOA" address="0x00009888" value="0x00E70040" />
+        <register type="NOA" address="0x00009888" value="0x02E75500" />
+        <register type="NOA" address="0x00009888" value="0x07810300" />
+        <register type="NOA" address="0x00009888" value="0x0D810030" />
+        <register type="NOA" address="0x00009888" value="0x09810000" />
+        <register type="NOA" address="0x00009888" value="0x01810000" />
+        <register type="NOA" address="0x00009888" value="0x01830200" />
+        <register type="NOA" address="0x00009888" value="0x01840010" />
+        <register type="NOA" address="0x00009888" value="0x01860100" />
+        <register type="NOA" address="0x00009888" value="0x01870100" />
+        <register type="NOA" address="0x00009888" value="0x07A10300" />
+        <register type="NOA" address="0x00009888" value="0x0DA10C00" />
+        <register type="NOA" address="0x00009888" value="0x09A10000" />
+        <register type="NOA" address="0x00009888" value="0x01A10000" />
+        <register type="NOA" address="0x00009888" value="0x01A30800" />
+        <register type="NOA" address="0x00009888" value="0x01A40020" />
+        <register type="NOA" address="0x00009888" value="0x01A60400" />
+        <register type="NOA" address="0x00009888" value="0x01A70400" />
+        <register type="NOA" address="0x00009888" value="0x07C10300" />
+        <register type="NOA" address="0x00009888" value="0x0FC10030" />
+        <register type="NOA" address="0x00009888" value="0x09C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C32000" />
+        <register type="NOA" address="0x00009888" value="0x01C40040" />
+        <register type="NOA" address="0x00009888" value="0x01C61000" />
+        <register type="NOA" address="0x00009888" value="0x01C71000" />
+        <register type="NOA" address="0x00009888" value="0x07E10300" />
+        <register type="NOA" address="0x00009888" value="0x0FE10C00" />
+        <register type="NOA" address="0x00009888" value="0x11E10CF4" />
+        <register type="NOA" address="0x00009888" value="0x13E10C72" />
+        <register type="NOA" address="0x00009888" value="0x09E10000" />
+        <register type="NOA" address="0x00009888" value="0x01E10000" />
+        <register type="NOA" address="0x00009888" value="0x03E10000" />
+        <register type="NOA" address="0x00009888" value="0x01E38000" />
+        <register type="NOA" address="0x00009888" value="0x03E300AA" />
+        <register type="NOA" address="0x00009888" value="0x01E40F80" />
+        <register type="NOA" address="0x00009888" value="0x01E64000" />
+        <register type="NOA" address="0x00009888" value="0x03E60055" />
+        <register type="NOA" address="0x00009888" value="0x01E74000" />
+        <register type="NOA" address="0x00009888" value="0x03E70055" />
+        <register type="NOA" address="0x00009888" value="0x00030FF0" />
+        <register type="NOA" address="0x00009888" value="0x00070060" />
+        <register type="NOA" address="0x00009888" value="0x02075500" />
+        <register type="NOA" address="0x00009888" value="0x0008FF0E" />
+        <register type="NOA" address="0x00009888" value="0x020800FF" />
+        <register type="NOA" address="0x00009888" value="0x0009F00C" />
+        <register type="NOA" address="0x00009888" value="0x000A55A5" />
+        <register type="NOA" address="0x00009888" value="0x020AAA55" />
+        <register type="NOA" address="0x00009888" value="0x00010FF2" />
+        <register type="NOA" address="0x00009888" value="0x000BAA04" />
+        <register type="NOA" address="0x00009888" value="0x020B00AA" />
+        <register type="NOA" address="0x00009888" value="0x00020004" />
+        <register type="NOA" address="0x00009888" value="0x000C0010" />
+        <register type="NOA" address="0x00009888" value="0x01076000" />
+        <register type="NOA" address="0x00009888" value="0x03070055" />
+        <register type="NOA" address="0x00009888" value="0x01080E00" />
+        <register type="NOA" address="0x00009888" value="0x01090FC0" />
+        <register type="NOA" address="0x00009888" value="0x010AA500" />
+        <register type="NOA" address="0x00009888" value="0x030A00AA" />
+        <register type="NOA" address="0x00009888" value="0x01010020" />
+        <register type="NOA" address="0x00009888" value="0x010B0400" />
+        <register type="NOA" address="0x00009888" value="0x01020040" />
+        <register type="NOA" address="0x00009888" value="0x010C1000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14037000" />
+        <register type="NOA" address="0x00009888" value="0x3E03294A" />
+        <register type="NOA" address="0x00009888" value="0x26037000" />
+        <register type="NOA" address="0x00009888" value="0x42032007" />
+        <register type="NOA" address="0x00009888" value="0x2C033000" />
+        <register type="NOA" address="0x00009888" value="0x32037000" />
+        <register type="NOA" address="0x00009888" value="0x44030047" />
+        <register type="NOA" address="0x00009888" value="0x38031000" />
+        <register type="NOA" address="0x00009888" value="0x46030003" />
+        <register type="NOA" address="0x00009888" value="0x480300A0" />
+        <register type="NOA" address="0x00009888" value="0x4A03140A" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A037000" />
+        <register type="NOA" address="0x00009888" value="0x40031CE7" />
+        <register type="NOA" address="0x00009888" value="0x1C037000" />
+        <register type="NOA" address="0x00009888" value="0x1E037000" />
+        <register type="NOA" address="0x00009888" value="0x20037000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFF" />
+        <register type="NOA" address="0x00009888" value="0x00025555" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x00045555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x00055555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000DC40" value="0x00FF0000" />
+        <register type="OA" address="0x0000D940" value="0x00000002" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFE" />
+        <register type="OA" address="0x0000DC00" value="0x00000002" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFE" />
+        <register type="OA" address="0x0000D948" value="0x00000002" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000DC08" value="0x00000002" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000D950" value="0x00000002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFB" />
+        <register type="OA" address="0x0000DC10" value="0x00000002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFB" />
+        <register type="OA" address="0x0000D958" value="0x00000002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000DC18" value="0x00000002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00000002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC20" value="0x00000002" />
+        <register type="OA" address="0x0000DC24" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D968" value="0x00000002" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000DC28" value="0x00000002" />
+        <register type="OA" address="0x0000DC2C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000D970" value="0x00000002" />
+        <register type="OA" address="0x0000D974" value="0x0000FFBF" />
+        <register type="OA" address="0x0000DC30" value="0x00000002" />
+        <register type="OA" address="0x0000DC34" value="0x0000FFBF" />
+        <register type="OA" address="0x0000D978" value="0x00000002" />
+        <register type="OA" address="0x0000D97C" value="0x0000FF7F" />
+        <register type="OA" address="0x0000DC38" value="0x00000002" />
+        <register type="OA" address="0x0000DC3C" value="0x0000FF7F" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="TDL_2"
+       chipset="DG2"
+       symbol_name="TDL_2"
+       underscore_name="tdl_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="141ce507-de6c-428c-95b2-076194d650db"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice0 Thread Dispatcher"
+             symbol_name="PSThread00ReadyForDispatch"
+             underscore_name="ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice1 Thread Dispatcher"
+             symbol_name="PSThread01ReadyForDispatch"
+             underscore_name="ps_thread01_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice2 Thread Dispatcher"
+             symbol_name="PSThread02ReadyForDispatch"
+             underscore_name="ps_thread02_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice3 Thread Dispatcher"
+             symbol_name="PSThread03ReadyForDispatch"
+             underscore_name="ps_thread03_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice1 Dualsubslice0 Thread Dispatcher"
+             symbol_name="PSThread10ReadyForDispatch"
+             underscore_name="ps_thread10_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice1 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice1 Dualsubslice1 Thread Dispatcher"
+             symbol_name="PSThread11ReadyForDispatch"
+             underscore_name="ps_thread11_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice1 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice1 Dualsubslice2 Thread Dispatcher"
+             symbol_name="PSThread12ReadyForDispatch"
+             underscore_name="ps_thread12_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice1 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice1 Dualsubslice3 Thread Dispatcher"
+             symbol_name="PSThread13ReadyForDispatch"
+             underscore_name="ps_thread13_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice1 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x28810340" />
+        <register type="NOA" address="0x00009888" value="0x28A10340" />
+        <register type="NOA" address="0x00009888" value="0x28C10340" />
+        <register type="NOA" address="0x00009888" value="0x28E10340" />
+        <register type="NOA" address="0x00009888" value="0x29810340" />
+        <register type="NOA" address="0x00009888" value="0x29A10340" />
+        <register type="NOA" address="0x00009888" value="0x29C10340" />
+        <register type="NOA" address="0x00009888" value="0x29E10340" />
+        <register type="NOA" address="0x00009888" value="0x06810100" />
+        <register type="NOA" address="0x00009888" value="0x08810C31" />
+        <register type="NOA" address="0x00009888" value="0x00810000" />
+        <register type="NOA" address="0x00009888" value="0x0083000A" />
+        <register type="NOA" address="0x00009888" value="0x00840003" />
+        <register type="NOA" address="0x00009888" value="0x00860005" />
+        <register type="NOA" address="0x00009888" value="0x00870005" />
+        <register type="NOA" address="0x00009888" value="0x06A10100" />
+        <register type="NOA" address="0x00009888" value="0x0AA10C31" />
+        <register type="NOA" address="0x00009888" value="0x08A10000" />
+        <register type="NOA" address="0x00009888" value="0x00A10000" />
+        <register type="NOA" address="0x00009888" value="0x00A300A0" />
+        <register type="NOA" address="0x00009888" value="0x00A4000C" />
+        <register type="NOA" address="0x00009888" value="0x00A60050" />
+        <register type="NOA" address="0x00009888" value="0x00A70050" />
+        <register type="NOA" address="0x00009888" value="0x06C10100" />
+        <register type="NOA" address="0x00009888" value="0x0CC10C31" />
+        <register type="NOA" address="0x00009888" value="0x08C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C30A00" />
+        <register type="NOA" address="0x00009888" value="0x00C40030" />
+        <register type="NOA" address="0x00009888" value="0x00C60500" />
+        <register type="NOA" address="0x00009888" value="0x00C70500" />
+        <register type="NOA" address="0x00009888" value="0x06E10100" />
+        <register type="NOA" address="0x00009888" value="0x0EE10C31" />
+        <register type="NOA" address="0x00009888" value="0x08E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E3A000" />
+        <register type="NOA" address="0x00009888" value="0x00E400C0" />
+        <register type="NOA" address="0x00009888" value="0x00E65000" />
+        <register type="NOA" address="0x00009888" value="0x00E75000" />
+        <register type="NOA" address="0x00009888" value="0x07810100" />
+        <register type="NOA" address="0x00009888" value="0x11810C31" />
+        <register type="NOA" address="0x00009888" value="0x09810000" />
+        <register type="NOA" address="0x00009888" value="0x03810000" />
+        <register type="NOA" address="0x00009888" value="0x0383000A" />
+        <register type="NOA" address="0x00009888" value="0x01840300" />
+        <register type="NOA" address="0x00009888" value="0x03860005" />
+        <register type="NOA" address="0x00009888" value="0x03870005" />
+        <register type="NOA" address="0x00009888" value="0x07A10100" />
+        <register type="NOA" address="0x00009888" value="0x13A10C31" />
+        <register type="NOA" address="0x00009888" value="0x09A10000" />
+        <register type="NOA" address="0x00009888" value="0x03A10000" />
+        <register type="NOA" address="0x00009888" value="0x03A300A0" />
+        <register type="NOA" address="0x00009888" value="0x01A40C00" />
+        <register type="NOA" address="0x00009888" value="0x03A60050" />
+        <register type="NOA" address="0x00009888" value="0x03A70050" />
+        <register type="NOA" address="0x00009888" value="0x07C10100" />
+        <register type="NOA" address="0x00009888" value="0x15C10C31" />
+        <register type="NOA" address="0x00009888" value="0x09C10000" />
+        <register type="NOA" address="0x00009888" value="0x03C10000" />
+        <register type="NOA" address="0x00009888" value="0x03C30A00" />
+        <register type="NOA" address="0x00009888" value="0x01C43000" />
+        <register type="NOA" address="0x00009888" value="0x03C60500" />
+        <register type="NOA" address="0x00009888" value="0x03C70500" />
+        <register type="NOA" address="0x00009888" value="0x07E10100" />
+        <register type="NOA" address="0x00009888" value="0x17E10C31" />
+        <register type="NOA" address="0x00009888" value="0x09E10000" />
+        <register type="NOA" address="0x00009888" value="0x03E10000" />
+        <register type="NOA" address="0x00009888" value="0x03E3A000" />
+        <register type="NOA" address="0x00009888" value="0x01E4C000" />
+        <register type="NOA" address="0x00009888" value="0x03E65000" />
+        <register type="NOA" address="0x00009888" value="0x03E75000" />
+        <register type="NOA" address="0x00009888" value="0x0003FF00" />
+        <register type="NOA" address="0x00009888" value="0x00075A00" />
+        <register type="NOA" address="0x00009888" value="0x000800FA" />
+        <register type="NOA" address="0x00009888" value="0x0208FFFF" />
+        <register type="NOA" address="0x00009888" value="0x000900F0" />
+        <register type="NOA" address="0x00009888" value="0x000AAA55" />
+        <register type="NOA" address="0x00009888" value="0x020A5555" />
+        <register type="NOA" address="0x00009888" value="0x0001FF0C" />
+        <register type="NOA" address="0x00009888" value="0x000B0050" />
+        <register type="NOA" address="0x00009888" value="0x020BAAAA" />
+        <register type="NOA" address="0x00009888" value="0x00020030" />
+        <register type="NOA" address="0x00009888" value="0x000C0500" />
+        <register type="NOA" address="0x00009888" value="0x03075A00" />
+        <register type="NOA" address="0x00009888" value="0x030800FA" />
+        <register type="NOA" address="0x00009888" value="0x0109F000" />
+        <register type="NOA" address="0x00009888" value="0x030AAA55" />
+        <register type="NOA" address="0x00009888" value="0x01010C00" />
+        <register type="NOA" address="0x00009888" value="0x030B0050" />
+        <register type="NOA" address="0x00009888" value="0x01023000" />
+        <register type="NOA" address="0x00009888" value="0x030C0500" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14037000" />
+        <register type="NOA" address="0x00009888" value="0x3E030C6A" />
+        <register type="NOA" address="0x00009888" value="0x26037000" />
+        <register type="NOA" address="0x00009888" value="0x4203014A" />
+        <register type="NOA" address="0x00009888" value="0x2C037000" />
+        <register type="NOA" address="0x00009888" value="0x32037000" />
+        <register type="NOA" address="0x00009888" value="0x44030D00" />
+        <register type="NOA" address="0x00009888" value="0x38033000" />
+        <register type="NOA" address="0x00009888" value="0x46030EE8" />
+        <register type="NOA" address="0x00009888" value="0x48030277" />
+        <register type="NOA" address="0x00009888" value="0x4A030422" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x40032800" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFF" />
+        <register type="NOA" address="0x00009888" value="0x00025555" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x00045555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x00055555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000DC40" value="0x00FF0000" />
+        <register type="OA" address="0x0000D940" value="0x00000000" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000000" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000000" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000000" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000000" />
+        <register type="OA" address="0x0000D954" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC10" value="0x00000000" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D958" value="0x00000000" />
+        <register type="OA" address="0x0000D95C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000DC18" value="0x00000000" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000D960" value="0x00000000" />
+        <register type="OA" address="0x0000D964" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC20" value="0x00000000" />
+        <register type="OA" address="0x0000DC24" value="0x0000FCFF" />
+        <register type="OA" address="0x0000D968" value="0x00000000" />
+        <register type="OA" address="0x0000D96C" value="0x0000F3FF" />
+        <register type="OA" address="0x0000DC28" value="0x00000000" />
+        <register type="OA" address="0x0000DC2C" value="0x0000F3FF" />
+        <register type="OA" address="0x0000D970" value="0x00000000" />
+        <register type="OA" address="0x0000D974" value="0x0000CFFF" />
+        <register type="OA" address="0x0000DC30" value="0x00000000" />
+        <register type="OA" address="0x0000DC34" value="0x0000CFFF" />
+        <register type="OA" address="0x0000D978" value="0x00000000" />
+        <register type="OA" address="0x0000D97C" value="0x00003FFF" />
+        <register type="OA" address="0x0000DC38" value="0x00000000" />
+        <register type="OA" address="0x0000DC3C" value="0x00003FFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="TDL_3"
+       chipset="DG2"
+       symbol_name="TDL_3"
+       underscore_name="tdl_3"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="54a85b07-9ff2-4a12-bfb6-6bcdd9d4019c"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="ThreadHeader00Ready"
+             underscore_name="thread_header00_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader00ReadyPort0"
+             underscore_name="thread_header00_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader00ReadyPort1"
+             underscore_name="thread_header00_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader00ReadyPort2"
+             underscore_name="thread_header00_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader00ReadyPort3"
+             underscore_name="thread_header00_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher"
+             symbol_name="ThreadHeader01Ready"
+             underscore_name="thread_header01_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader01ReadyPort0"
+             underscore_name="thread_header01_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader01ReadyPort1"
+             underscore_name="thread_header01_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader01ReadyPort2"
+             underscore_name="thread_header01_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader01ReadyPort3"
+             underscore_name="thread_header01_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher"
+             symbol_name="ThreadHeader02Ready"
+             underscore_name="thread_header02_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader02ReadyPort0"
+             underscore_name="thread_header02_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader02ReadyPort1"
+             underscore_name="thread_header02_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader02ReadyPort2"
+             underscore_name="thread_header02_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader02ReadyPort3"
+             underscore_name="thread_header02_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice3 Thread Dispatcher"
+             symbol_name="ThreadHeader03Ready"
+             underscore_name="thread_header03_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x2A81001C" />
+        <register type="NOA" address="0x00009888" value="0x2AA1001C" />
+        <register type="NOA" address="0x00009888" value="0x2AC1001C" />
+        <register type="NOA" address="0x00009888" value="0x2AE1001C" />
+        <register type="NOA" address="0x00009888" value="0x06810300" />
+        <register type="NOA" address="0x00009888" value="0x14810CF4" />
+        <register type="NOA" address="0x00009888" value="0x16810C72" />
+        <register type="NOA" address="0x00009888" value="0x08810000" />
+        <register type="NOA" address="0x00009888" value="0x02810000" />
+        <register type="NOA" address="0x00009888" value="0x0283AA00" />
+        <register type="NOA" address="0x00009888" value="0x0084F000" />
+        <register type="NOA" address="0x00009888" value="0x02865500" />
+        <register type="NOA" address="0x00009888" value="0x02875500" />
+        <register type="NOA" address="0x00009888" value="0x06A10300" />
+        <register type="NOA" address="0x00009888" value="0x10A10CF4" />
+        <register type="NOA" address="0x00009888" value="0x12A10C72" />
+        <register type="NOA" address="0x00009888" value="0x08A10000" />
+        <register type="NOA" address="0x00009888" value="0x02A10000" />
+        <register type="NOA" address="0x00009888" value="0x02A300AA" />
+        <register type="NOA" address="0x00009888" value="0x00A40F00" />
+        <register type="NOA" address="0x00009888" value="0x02A60055" />
+        <register type="NOA" address="0x00009888" value="0x02A70055" />
+        <register type="NOA" address="0x00009888" value="0x06C10300" />
+        <register type="NOA" address="0x00009888" value="0x0CC10CF4" />
+        <register type="NOA" address="0x00009888" value="0x0EC10C72" />
+        <register type="NOA" address="0x00009888" value="0x08C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C10000" />
+        <register type="NOA" address="0x00009888" value="0x00C3AA00" />
+        <register type="NOA" address="0x00009888" value="0x00C400F0" />
+        <register type="NOA" address="0x00009888" value="0x00C65500" />
+        <register type="NOA" address="0x00009888" value="0x00C75500" />
+        <register type="NOA" address="0x00009888" value="0x06E10300" />
+        <register type="NOA" address="0x00009888" value="0x08E10CB1" />
+        <register type="NOA" address="0x00009888" value="0x0AE10D33" />
+        <register type="NOA" address="0x00009888" value="0x00E10000" />
+        <register type="NOA" address="0x00009888" value="0x00E300AA" />
+        <register type="NOA" address="0x00009888" value="0x00E4000F" />
+        <register type="NOA" address="0x00009888" value="0x00E60055" />
+        <register type="NOA" address="0x00009888" value="0x00E70055" />
+        <register type="NOA" address="0x00009888" value="0x0007AA55" />
+        <register type="NOA" address="0x00009888" value="0x0208AAFF" />
+        <register type="NOA" address="0x00009888" value="0x000900FF" />
+        <register type="NOA" address="0x00009888" value="0x000AAAAA" />
+        <register type="NOA" address="0x00009888" value="0x020A5555" />
+        <register type="NOA" address="0x00009888" value="0x00010F00" />
+        <register type="NOA" address="0x00009888" value="0x020B0055" />
+        <register type="NOA" address="0x00009888" value="0x000200F0" />
+        <register type="NOA" address="0x00009888" value="0x000C5500" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030C6A" />
+        <register type="NOA" address="0x00009888" value="0x26030000" />
+        <register type="NOA" address="0x00009888" value="0x42032942" />
+        <register type="NOA" address="0x00009888" value="0x2C030000" />
+        <register type="NOA" address="0x00009888" value="0x32030000" />
+        <register type="NOA" address="0x00009888" value="0x4403000A" />
+        <register type="NOA" address="0x00009888" value="0x38030000" />
+        <register type="NOA" address="0x00009888" value="0x46030000" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009888" value="0x4A030603" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A031000" />
+        <register type="NOA" address="0x00009888" value="0x40030842" />
+        <register type="NOA" address="0x00009888" value="0x1C031000" />
+        <register type="NOA" address="0x00009888" value="0x1E031000" />
+        <register type="NOA" address="0x00009888" value="0x20031000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFF" />
+        <register type="NOA" address="0x00009888" value="0x00025555" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x00045555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x00055555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x000F0000" />
+        <register type="OA" address="0x0000D940" value="0x00078000" />
+        <register type="OA" address="0x0000D944" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC00" value="0x00078000" />
+        <register type="OA" address="0x0000DC04" value="0x00000FFF" />
+        <register type="OA" address="0x0000D948" value="0x00007800" />
+        <register type="OA" address="0x0000D94C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000DC08" value="0x00007800" />
+        <register type="OA" address="0x0000DC0C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000D950" value="0x00000780" />
+        <register type="OA" address="0x0000D954" value="0x0000FF0F" />
+        <register type="OA" address="0x0000DC10" value="0x00000780" />
+        <register type="OA" address="0x0000DC14" value="0x0000FF0F" />
+        <register type="OA" address="0x0000D958" value="0x00000078" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF0" />
+        <register type="OA" address="0x0000DC18" value="0x00000078" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF0" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="TDL_4"
+       chipset="DG2"
+       symbol_name="TDL_4"
+       underscore_name="tdl_4"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="651c40e5-195c-49da-b232-a9a0f753d899"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice0 Thread Dispatcher"
+             symbol_name="ThreadHeader10Ready"
+             underscore_name="thread_header10_ready"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice0 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader10ReadyPort0"
+             underscore_name="thread_header10_ready_port0"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice0 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice0 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader10ReadyPort1"
+             underscore_name="thread_header10_ready_port1"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice0 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice0 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader10ReadyPort2"
+             underscore_name="thread_header10_ready_port2"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice0 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice0 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader10ReadyPort3"
+             underscore_name="thread_header10_ready_port3"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice0 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 64 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice1 Thread Dispatcher"
+             symbol_name="ThreadHeader11Ready"
+             underscore_name="thread_header11_ready"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice1 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader11ReadyPort0"
+             underscore_name="thread_header11_ready_port0"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice1 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice1 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader11ReadyPort1"
+             underscore_name="thread_header11_ready_port1"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice1 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice1 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader11ReadyPort2"
+             underscore_name="thread_header11_ready_port2"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice1 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice1 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader11ReadyPort3"
+             underscore_name="thread_header11_ready_port3"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice1 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 128 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice2 Thread Dispatcher"
+             symbol_name="ThreadHeader12Ready"
+             underscore_name="thread_header12_ready"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice2 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader12ReadyPort0"
+             underscore_name="thread_header12_ready_port0"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice2 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice2 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader12ReadyPort1"
+             underscore_name="thread_header12_ready_port1"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice2 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice2 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader12ReadyPort2"
+             underscore_name="thread_header12_ready_port2"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice2 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice2 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader12ReadyPort3"
+             underscore_name="thread_header12_ready_port3"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice2 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 256 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice1 DualSubslice3 Thread Dispatcher"
+             symbol_name="ThreadHeader13Ready"
+             underscore_name="thread_header13_ready"
+             description="The percentage of time in which thread header is ready on slice1 dualsubslice3 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 512 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x2B81001C" />
+        <register type="NOA" address="0x00009888" value="0x2BA1001C" />
+        <register type="NOA" address="0x00009888" value="0x2BC1001C" />
+        <register type="NOA" address="0x00009888" value="0x2BE1001C" />
+        <register type="NOA" address="0x00009888" value="0x07810300" />
+        <register type="NOA" address="0x00009888" value="0x15810CF4" />
+        <register type="NOA" address="0x00009888" value="0x17810C72" />
+        <register type="NOA" address="0x00009888" value="0x09810000" />
+        <register type="NOA" address="0x00009888" value="0x03810000" />
+        <register type="NOA" address="0x00009888" value="0x0383AA00" />
+        <register type="NOA" address="0x00009888" value="0x0184F000" />
+        <register type="NOA" address="0x00009888" value="0x03865500" />
+        <register type="NOA" address="0x00009888" value="0x03875500" />
+        <register type="NOA" address="0x00009888" value="0x07A10300" />
+        <register type="NOA" address="0x00009888" value="0x11A10CF4" />
+        <register type="NOA" address="0x00009888" value="0x13A10C72" />
+        <register type="NOA" address="0x00009888" value="0x09A10000" />
+        <register type="NOA" address="0x00009888" value="0x03A10000" />
+        <register type="NOA" address="0x00009888" value="0x03A300AA" />
+        <register type="NOA" address="0x00009888" value="0x01A40F00" />
+        <register type="NOA" address="0x00009888" value="0x03A60055" />
+        <register type="NOA" address="0x00009888" value="0x03A70055" />
+        <register type="NOA" address="0x00009888" value="0x07C10300" />
+        <register type="NOA" address="0x00009888" value="0x0DC10CF4" />
+        <register type="NOA" address="0x00009888" value="0x0FC10C72" />
+        <register type="NOA" address="0x00009888" value="0x09C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C10000" />
+        <register type="NOA" address="0x00009888" value="0x01C3AA00" />
+        <register type="NOA" address="0x00009888" value="0x01C400F0" />
+        <register type="NOA" address="0x00009888" value="0x01C65500" />
+        <register type="NOA" address="0x00009888" value="0x01C75500" />
+        <register type="NOA" address="0x00009888" value="0x07E10300" />
+        <register type="NOA" address="0x00009888" value="0x09E10CB1" />
+        <register type="NOA" address="0x00009888" value="0x0BE10D33" />
+        <register type="NOA" address="0x00009888" value="0x01E10000" />
+        <register type="NOA" address="0x00009888" value="0x01E300AA" />
+        <register type="NOA" address="0x00009888" value="0x01E4000F" />
+        <register type="NOA" address="0x00009888" value="0x01E60055" />
+        <register type="NOA" address="0x00009888" value="0x01E70055" />
+        <register type="NOA" address="0x00009888" value="0x0003FFFF" />
+        <register type="NOA" address="0x00009888" value="0x0008FFFF" />
+        <register type="NOA" address="0x00009888" value="0x0208FFFF" />
+        <register type="NOA" address="0x00009888" value="0x000A5555" />
+        <register type="NOA" address="0x00009888" value="0x020A5555" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFF" />
+        <register type="NOA" address="0x00009888" value="0x000BAAAA" />
+        <register type="NOA" address="0x00009888" value="0x020BAAAA" />
+        <register type="NOA" address="0x00009888" value="0x0107AA55" />
+        <register type="NOA" address="0x00009888" value="0x0308AAFF" />
+        <register type="NOA" address="0x00009888" value="0x010900FF" />
+        <register type="NOA" address="0x00009888" value="0x010AAAAA" />
+        <register type="NOA" address="0x00009888" value="0x030A5555" />
+        <register type="NOA" address="0x00009888" value="0x01010F00" />
+        <register type="NOA" address="0x00009888" value="0x030B0055" />
+        <register type="NOA" address="0x00009888" value="0x010200F0" />
+        <register type="NOA" address="0x00009888" value="0x010C5500" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030C6A" />
+        <register type="NOA" address="0x00009888" value="0x26030000" />
+        <register type="NOA" address="0x00009888" value="0x42032942" />
+        <register type="NOA" address="0x00009888" value="0x2C030000" />
+        <register type="NOA" address="0x00009888" value="0x32030000" />
+        <register type="NOA" address="0x00009888" value="0x4403000A" />
+        <register type="NOA" address="0x00009888" value="0x38030000" />
+        <register type="NOA" address="0x00009888" value="0x46030000" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009888" value="0x4A030603" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A031000" />
+        <register type="NOA" address="0x00009888" value="0x40030842" />
+        <register type="NOA" address="0x00009888" value="0x1C031000" />
+        <register type="NOA" address="0x00009888" value="0x1E031000" />
+        <register type="NOA" address="0x00009888" value="0x20031000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0001FFFF" />
+        <register type="NOA" address="0x00009888" value="0x00025555" />
+        <register type="NOA" address="0x00009888" value="0x02025555" />
+        <register type="NOA" address="0x00009888" value="0x00045555" />
+        <register type="NOA" address="0x00009888" value="0x02045555" />
+        <register type="NOA" address="0x00009888" value="0x00055555" />
+        <register type="NOA" address="0x00009888" value="0x02055555" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x000F0000" />
+        <register type="OA" address="0x0000D940" value="0x00078000" />
+        <register type="OA" address="0x0000D944" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC00" value="0x00078000" />
+        <register type="OA" address="0x0000DC04" value="0x00000FFF" />
+        <register type="OA" address="0x0000D948" value="0x00007800" />
+        <register type="OA" address="0x0000D94C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000DC08" value="0x00007800" />
+        <register type="OA" address="0x0000DC0C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000D950" value="0x00000780" />
+        <register type="OA" address="0x0000D954" value="0x0000FF0F" />
+        <register type="OA" address="0x0000DC10" value="0x00000780" />
+        <register type="OA" address="0x0000DC14" value="0x0000FF0F" />
+        <register type="OA" address="0x0000D958" value="0x00000078" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF0" />
+        <register type="OA" address="0x0000DC18" value="0x00000078" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF0" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="L3_1"
+       chipset="DG2"
+       symbol_name="L3_1"
+       underscore_name="l3_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="9a1a14ad-ab92-4204-8a91-c4159a54f712"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Quad0 L3 Bank0 Input Available"
+             symbol_name="L30Bank0InputAvailable"
+             underscore_name="l30_bank0_input_available"
+             description="The percentage of time in which Quad0 L3 bank0 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank1 Input Available"
+             symbol_name="L30Bank1InputAvailable"
+             underscore_name="l30_bank1_input_available"
+             description="The percentage of time in which Quad0 L3 bank1 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank2 Input Available"
+             symbol_name="L30Bank2InputAvailable"
+             underscore_name="l30_bank2_input_available"
+             description="The percentage of time in which Quad0 L3 bank2 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank3 Input Available"
+             symbol_name="L30Bank3InputAvailable"
+             underscore_name="l30_bank3_input_available"
+             description="The percentage of time in which Quad0 L3 bank3 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank4 Input Available"
+             symbol_name="L30Bank4InputAvailable"
+             underscore_name="l30_bank4_input_available"
+             description="The percentage of time in which Quad0 L3 bank4 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank5 Input Available"
+             symbol_name="L30Bank5InputAvailable"
+             underscore_name="l30_bank5_input_available"
+             description="The percentage of time in which Quad0 L3 bank5 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank6 Input Available"
+             symbol_name="L30Bank6InputAvailable"
+             underscore_name="l30_bank6_input_available"
+             description="The percentage of time in which Quad0 L3 bank6 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank7 Input Available"
+             symbol_name="L30Bank7InputAvailable"
+             underscore_name="l30_bank7_input_available"
+             description="The percentage of time in which Quad0 L3 bank7 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank0 Output Ready"
+             symbol_name="L30Bank0OutputReady"
+             underscore_name="l30_bank0_output_ready"
+             description="The percentage of time in which quad0 L3 bank0 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank1 Output Ready"
+             symbol_name="L30Bank1OutputReady"
+             underscore_name="l30_bank1_output_ready"
+             description="The percentage of time in which quad0 L3 bank1 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank2 Output Ready"
+             symbol_name="L30Bank2OutputReady"
+             underscore_name="l30_bank2_output_ready"
+             description="The percentage of time in which quad0 L3 bank2 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank3 Output Ready"
+             symbol_name="L30Bank3OutputReady"
+             underscore_name="l30_bank3_output_ready"
+             description="The percentage of time in which quad0 L3 bank3 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank4 Output Ready"
+             symbol_name="L30Bank4OutputReady"
+             underscore_name="l30_bank4_output_ready"
+             description="The percentage of time in which quad0 L3 bank4 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank5 Output Ready"
+             symbol_name="L30Bank5OutputReady"
+             underscore_name="l30_bank5_output_ready"
+             description="The percentage of time in which quad0 L3 bank5 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank6 Output Ready"
+             symbol_name="L30Bank6OutputReady"
+             underscore_name="l30_bank6_output_ready"
+             description="The percentage of time in which quad0 L3 bank6 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Quad0 L3 Bank7 Output Ready"
+             symbol_name="L30Bank7OutputReady"
+             underscore_name="l30_bank7_output_ready"
+             description="The percentage of time in which quad0 L3 bank7 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x090B1000" />
+        <register type="NOA" address="0x00009888" value="0x092B1006" />
+        <register type="NOA" address="0x00009888" value="0x094B1000" />
+        <register type="NOA" address="0x00009888" value="0x096B1000" />
+        <register type="NOA" address="0x00009888" value="0x090C1000" />
+        <register type="NOA" address="0x00009888" value="0x092C1180" />
+        <register type="NOA" address="0x00009888" value="0x094C1000" />
+        <register type="NOA" address="0x00009888" value="0x096C1000" />
+        <register type="NOA" address="0x00009888" value="0x010B0002" />
+        <register type="NOA" address="0x00009888" value="0x0B0B0006" />
+        <register type="NOA" address="0x00009888" value="0x130B0007" />
+        <register type="NOA" address="0x00009888" value="0x030B0000" />
+        <register type="NOA" address="0x00009888" value="0x012B0002" />
+        <register type="NOA" address="0x00009888" value="0x112B0007" />
+        <register type="NOA" address="0x00009888" value="0x032B0000" />
+        <register type="NOA" address="0x00009888" value="0x014B0002" />
+        <register type="NOA" address="0x00009888" value="0x074B0006" />
+        <register type="NOA" address="0x00009888" value="0x0F4B0007" />
+        <register type="NOA" address="0x00009888" value="0x034B0000" />
+        <register type="NOA" address="0x00009888" value="0x016B0002" />
+        <register type="NOA" address="0x00009888" value="0x056B0006" />
+        <register type="NOA" address="0x00009888" value="0x0D6B0007" />
+        <register type="NOA" address="0x00009888" value="0x036B0000" />
+        <register type="NOA" address="0x00009888" value="0x010C0002" />
+        <register type="NOA" address="0x00009888" value="0x0B0C0180" />
+        <register type="NOA" address="0x00009888" value="0x130C01C0" />
+        <register type="NOA" address="0x00009888" value="0x030C0000" />
+        <register type="NOA" address="0x00009888" value="0x012C0002" />
+        <register type="NOA" address="0x00009888" value="0x112C01C0" />
+        <register type="NOA" address="0x00009888" value="0x032C0000" />
+        <register type="NOA" address="0x00009888" value="0x014C0002" />
+        <register type="NOA" address="0x00009888" value="0x074C0180" />
+        <register type="NOA" address="0x00009888" value="0x0F4C01C0" />
+        <register type="NOA" address="0x00009888" value="0x034C0000" />
+        <register type="NOA" address="0x00009888" value="0x016C0002" />
+        <register type="NOA" address="0x00009888" value="0x056C0180" />
+        <register type="NOA" address="0x00009888" value="0x0D6C01C0" />
+        <register type="NOA" address="0x00009888" value="0x036C0000" />
+        <register type="NOA" address="0x00009888" value="0x00020030" />
+        <register type="NOA" address="0x00009888" value="0x02020030" />
+        <register type="NOA" address="0x00009888" value="0x00030048" />
+        <register type="NOA" address="0x00009888" value="0x02030048" />
+        <register type="NOA" address="0x00009888" value="0x0004009B" />
+        <register type="NOA" address="0x00009888" value="0x0204009B" />
+        <register type="NOA" address="0x00009888" value="0x00052055" />
+        <register type="NOA" address="0x00009888" value="0x02052055" />
+        <register type="NOA" address="0x00009888" value="0x00064800" />
+        <register type="NOA" address="0x00009888" value="0x02064800" />
+        <register type="NOA" address="0x00009888" value="0x0007A0A0" />
+        <register type="NOA" address="0x00009888" value="0x000867AA" />
+        <register type="NOA" address="0x00009888" value="0x020867AA" />
+        <register type="NOA" address="0x00009888" value="0x0009A0A0" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008AAAA" />
+        <register type="NOA" address="0x00009888" value="0x0208AAAA" />
+        <register type="NOA" address="0x00009888" value="0x00032492" />
+        <register type="NOA" address="0x00009888" value="0x02032492" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x14030000" />
+        <register type="NOA" address="0x00009888" value="0x3E030024" />
+        <register type="NOA" address="0x00009888" value="0x26030000" />
+        <register type="NOA" address="0x00009888" value="0x42030401" />
+        <register type="NOA" address="0x00009888" value="0x2C030000" />
+        <register type="NOA" address="0x00009888" value="0x32030000" />
+        <register type="NOA" address="0x00009888" value="0x44030140" />
+        <register type="NOA" address="0x00009888" value="0x38030000" />
+        <register type="NOA" address="0x00009888" value="0x46030E01" />
+        <register type="NOA" address="0x00009888" value="0x48030010" />
+        <register type="NOA" address="0x00009888" value="0x4A030004" />
+        <register type="NOA" address="0x00009888" value="0x16030000" />
+        <register type="NOA" address="0x00009888" value="0x18030000" />
+        <register type="NOA" address="0x00009888" value="0x1A030000" />
+        <register type="NOA" address="0x00009888" value="0x40031C2A" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="GpuBusyness"
+       chipset="DG2"
+       symbol_name="GpuBusyness"
+       underscore_name="gpu_busyness"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="85de4c29-76b8-42a6-b6ef-8a2bed008fcf"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="ComputeEngine0 Ring Busy"
+             symbol_name="ComputeEngine0Busy"
+             underscore_name="compute_engine0_busy"
+             description="The percentage of time when compute command streamer 0 was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="ComputeEngine1 Ring Busy"
+             symbol_name="ComputeEngine1Busy"
+             underscore_name="compute_engine1_busy"
+             description="The percentage of time when compute command streamer 1 was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="ComputeEngine2 Ring Busy"
+             symbol_name="ComputeEngine2Busy"
+             underscore_name="compute_engine2_busy"
+             description="The percentage of time when compute command streamer 2 was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="ComputeEngine3 Ring Busy"
+             symbol_name="ComputeEngine3Busy"
+             underscore_name="compute_engine3_busy"
+             description="The percentage of time when compute command streamer 3 was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Posh Ring Busy"
+             symbol_name="PoshEngineBusy"
+             underscore_name="posh_engine_busy"
+             description="The percentage of time when posh command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Blitter Ring Busy"
+             symbol_name="BlitterBusy"
+             underscore_name="blitter_busy"
+             description="The percentage of time when blitter command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox00 Ring Busy"
+             symbol_name="Vdbox00Busy"
+             underscore_name="vdbox00_busy"
+             description="The percentage of time when vdbox00 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vebox0 Ring Busy"
+             symbol_name="Vebox0Busy"
+             underscore_name="vebox0_busy"
+             description="The percentage of time when vebox0 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox10 Ring Busy"
+             symbol_name="Vdbox10Busy"
+             underscore_name="vdbox10_busy"
+             description="The percentage of time when vdbox10 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vebox1 Ring Busy"
+             symbol_name="Vebox1Busy"
+             underscore_name="vebox1_busy"
+             description="The percentage of time when vebox1 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Any compute engine busy"
+             symbol_name="AnyComputeEngineBusy"
+             underscore_name="any_compute_engine_busy"
+             description="The percentage of time when any compute engine is busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and any compute engines are simultaneously busy"
+             symbol_name="RenderAndAnyComputeEngineBusy"
+             underscore_name="render_and_any_compute_engine_busy"
+             description="The percentage of time when render and any compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000004" />
+        <register type="NOA" address="0x00009888" value="0x420A2400" />
+        <register type="NOA" address="0x00009888" value="0x1A131200" />
+        <register type="NOA" address="0x00009888" value="0x040A0022" />
+        <register type="NOA" address="0x00009888" value="0x120A0014" />
+        <register type="NOA" address="0x00009888" value="0x020A0000" />
+        <register type="NOA" address="0x00009888" value="0x000A0000" />
+        <register type="NOA" address="0x00009888" value="0x00104000" />
+        <register type="NOA" address="0x00009888" value="0x02100002" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x00134000" />
+        <register type="NOA" address="0x00009888" value="0x0A130024" />
+        <register type="NOA" address="0x00009884" value="0x00000005" />
+        <register type="NOA" address="0x00009888" value="0x420A2400" />
+        <register type="NOA" address="0x00009888" value="0x1A131200" />
+        <register type="NOA" address="0x00009888" value="0x040A0022" />
+        <register type="NOA" address="0x00009888" value="0x100A0014" />
+        <register type="NOA" address="0x00009888" value="0x020A0000" />
+        <register type="NOA" address="0x00009888" value="0x000A0000" />
+        <register type="NOA" address="0x00009888" value="0x00102400" />
+        <register type="NOA" address="0x00009888" value="0x00120400" />
+        <register type="NOA" address="0x00009888" value="0x00134000" />
+        <register type="NOA" address="0x00009888" value="0x08130024" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x18012400" />
+        <register type="NOA" address="0x00009888" value="0x18042400" />
+        <register type="NOA" address="0x00009888" value="0x20042400" />
+        <register type="NOA" address="0x00009888" value="0x28042400" />
+        <register type="NOA" address="0x00009888" value="0x32040009" />
+        <register type="NOA" address="0x00009888" value="0x3C041200" />
+        <register type="NOA" address="0x00009888" value="0x4C041200" />
+        <register type="NOA" address="0x00009888" value="0x02010006" />
+        <register type="NOA" address="0x00009888" value="0x10010004" />
+        <register type="NOA" address="0x00009888" value="0x0001FC00" />
+        <register type="NOA" address="0x00009888" value="0x00042EE9" />
+        <register type="NOA" address="0x00009888" value="0x02040239" />
+        <register type="NOA" address="0x00009888" value="0x0404000F" />
+        <register type="NOA" address="0x00009888" value="0x0E040D00" />
+        <register type="NOA" address="0x00009888" value="0x10040304" />
+        <register type="NOA" address="0x00009888" value="0x12040714" />
+        <register type="NOA" address="0x00009888" value="0x14040024" />
+        <register type="NOA" address="0x00009888" value="0x02085554" />
+        <register type="NOA" address="0x00009888" value="0x00056800" />
+        <register type="NOA" address="0x00009888" value="0x02050001" />
+        <register type="NOA" address="0x00009888" value="0x02032B6D" />
+        <register type="NOA" address="0x00009888" value="0x04032492" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x44030000" />
+        <register type="NOA" address="0x00009888" value="0x46030400" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009888" value="0x4A030C62" />
+        <register type="NOA" address="0x00009888" value="0x16033000" />
+        <register type="NOA" address="0x00009888" value="0x3E031080" />
+        <register type="NOA" address="0x00009888" value="0x18033000" />
+        <register type="NOA" address="0x00009888" value="0x1A033000" />
+        <register type="NOA" address="0x00009888" value="0x40031084" />
+        <register type="NOA" address="0x00009888" value="0x1C033000" />
+        <register type="NOA" address="0x00009888" value="0x1E033000" />
+        <register type="NOA" address="0x00009888" value="0x20033000" />
+        <register type="NOA" address="0x00009888" value="0x42030004" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000000" />
+        <register type="OA" address="0x0000D944" value="0x000087FF" />
+        <register type="OA" address="0x0000DC00" value="0x00000000" />
+        <register type="OA" address="0x0000DC04" value="0x000087FF" />
+        <register type="OA" address="0x0000D948" value="0x00040001" />
+        <register type="OA" address="0x0000D94C" value="0x000007FF" />
+        <register type="OA" address="0x0000DC08" value="0x00040001" />
+        <register type="OA" address="0x0000DC0C" value="0x000007FF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity1"
+       chipset="DG2"
+       symbol_name="EuActivity1"
+       underscore_name="eu_activity1"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="8dc7142a-df10-41f2-acaa-9faea547ce73"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Send Pipe Active"
+             symbol_name="SendActive"
+             underscore_name="send_active"
+             description="The percentage of time in which EU send pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00810710" />
+        <register type="FLEX" address="0x0000E558" value="0x00A10910" />
+        <register type="FLEX" address="0x0000E658" value="0x00850750" />
+        <register type="FLEX" address="0x0000E758" value="0x00A50950" />
+        <register type="FLEX" address="0x0000E45C" value="0x00802702" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A02902" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity2"
+       chipset="DG2"
+       symbol_name="EuActivity2"
+       underscore_name="eu_activity2"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="d3c05cce-4ae7-4291-82ab-b0bcade6cf7a"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS EM Pipe Active"
+             symbol_name="CsEmActive"
+             underscore_name="cs_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU Pipe Active"
+             symbol_name="CsFpuActive"
+             underscore_name="cs_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Send Pipe Active"
+             symbol_name="CsSendActive"
+             underscore_name="cs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00861761" />
+        <register type="FLEX" address="0x0000E558" value="0x00A61961" />
+        <register type="FLEX" address="0x0000E658" value="0x00860760" />
+        <register type="FLEX" address="0x0000E758" value="0x00A60960" />
+        <register type="FLEX" address="0x0000E45C" value="0x00862762" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A62962" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity3"
+       chipset="DG2"
+       symbol_name="EuActivity3"
+       underscore_name="eu_activity3"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="4fd009c5-6eae-4ecb-a2d1-41edf211cd06"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00811711" />
+        <register type="FLEX" address="0x0000E558" value="0x00A11911" />
+        <register type="FLEX" address="0x0000E658" value="0x00851751" />
+        <register type="FLEX" address="0x0000E758" value="0x00A51951" />
+        <register type="FLEX" address="0x0000E45C" value="0x00852752" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A52952" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity4"
+       chipset="DG2"
+       symbol_name="EuActivity4"
+       underscore_name="eu_activity4"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="5226090d-b636-4845-9f76-545cb5db7867"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS FPU Pipe Active"
+             symbol_name="HsFpuActive"
+             underscore_name="hs_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a hull shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS FPU Pipe Active"
+             symbol_name="DsFpuActive"
+             underscore_name="ds_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a domain shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00820720" />
+        <register type="FLEX" address="0x0000E558" value="0x00A20920" />
+        <register type="FLEX" address="0x0000E658" value="0x00830730" />
+        <register type="FLEX" address="0x0000E758" value="0x00A30930" />
+        <register type="FLEX" address="0x0000E45C" value="0x00812712" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A12912" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity5"
+       chipset="DG2"
+       symbol_name="EuActivity5"
+       underscore_name="eu_activity5"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="c8d33b8f-3152-4c81-99bf-d3cb45d7e1ac"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS EM Pipe Active"
+             symbol_name="HsEmActive"
+             underscore_name="hs_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a hull shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS EM Pipe Active"
+             symbol_name="DsEmActive"
+             underscore_name="ds_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a domain shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Send Pipe Active"
+             symbol_name="HsSendActive"
+             underscore_name="hs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a hull shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00821721" />
+        <register type="FLEX" address="0x0000E558" value="0x00A21921" />
+        <register type="FLEX" address="0x0000E658" value="0x00831731" />
+        <register type="FLEX" address="0x0000E758" value="0x00A31931" />
+        <register type="FLEX" address="0x0000E45C" value="0x00822722" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A22922" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity6"
+       chipset="DG2"
+       symbol_name="EuActivity6"
+       underscore_name="eu_activity6"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="708d01ed-bc9b-420e-8048-9060abcbb1f0"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS FPU Pipe Active"
+             symbol_name="GsFpuActive"
+             underscore_name="gs_fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing a geometry shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS EM Pipe Active"
+             symbol_name="GsEmActive"
+             underscore_name="gs_em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing a geometry shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Send Pipe Active"
+             symbol_name="GsSendActive"
+             underscore_name="gs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a geometry shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00840740" />
+        <register type="FLEX" address="0x0000E558" value="0x00A40940" />
+        <register type="FLEX" address="0x0000E658" value="0x00841741" />
+        <register type="FLEX" address="0x0000E758" value="0x00A41941" />
+        <register type="FLEX" address="0x0000E45C" value="0x00842742" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A42942" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity7"
+       chipset="DG2"
+       symbol_name="EuActivity7"
+       underscore_name="eu_activity7"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="72262d5b-a9e6-4742-820b-2a7bef9a7e61"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU Pipe Active"
+             symbol_name="FpuActive"
+             underscore_name="fpu_active"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM Pipe Active"
+             symbol_name="EmActive"
+             underscore_name="em_active"
+             description="The percentage of time in which EU EM INT pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="EmFpuActive"
+             underscore_name="em_fpu_active"
+             description="The percentage of time in which EU EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU AVG IPC Rate"
+             symbol_name="EuAvgIpcRate"
+             underscore_name="eu_avg_ipc_rate"
+             description="The average rate of IPC calculated for 2 FPU pipelines."
+             data_type="float"
+             max_equation="2"
+             units="number"
+             semantic_type="ratio"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD  A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD  A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FADD  A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FSUB FDIV 1 FADD"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00803703" />
+        <register type="FLEX" address="0x0000E558" value="0x00A03903" />
+        <register type="FLEX" address="0x0000E658" value="0x00800700" />
+        <register type="FLEX" address="0x0000E758" value="0x00A00900" />
+        <register type="FLEX" address="0x0000E45C" value="0x00801701" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A01901" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity8"
+       chipset="DG2"
+       symbol_name="EuActivity8"
+       underscore_name="eu_activity8"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="11c685de-1445-41b8-acb5-8e79c75c4fd8"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Send Pipe Active"
+             symbol_name="DsSendActive"
+             underscore_name="ds_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a domain shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SYS And FPU Pipes Active"
+             symbol_name="SysFpuActive"
+             underscore_name="sys_fpu_active"
+             description="The percentage of time in which EU Systolic and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SYS Pipe Active"
+             symbol_name="SysActive"
+             underscore_name="sys_active"
+             description="The percentage of time in which EU SYS pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00832732" />
+        <register type="FLEX" address="0x0000E558" value="0x00A32932" />
+        <register type="FLEX" address="0x0000E658" value="0x00809709" />
+        <register type="FLEX" address="0x0000E758" value="0x00A09909" />
+        <register type="FLEX" address="0x0000E45C" value="0x0080A70A" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A0A90A" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="DG2"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="2db1e1d4-8c48-4bb7-b248-0f40b70433ff"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
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
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter7"
+             symbol_name="Counter7"
+             underscore_name="counter7"
+             description="HW test counter 7. Factor: 0.6666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter8"
+             symbol_name="Counter8"
+             underscore_name="counter8"
+             description="HW test counter 8. Should be equal to 1 in IOStream or in OAG query mode"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter9 - OAR enable"
+             symbol_name="Counter9"
+             underscore_name="counter9"
+             description="HW test counter 9. Should be equal to 1 in query."
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x2E080000" />
+        <register type="NOA" address="0x00009888" value="0x34080000" />
+        <register type="NOA" address="0x00009888" value="0x06088000" />
+        <register type="NOA" address="0x00009888" value="0x10080FF3" />
+        <register type="NOA" address="0x00009888" value="0x08080000" />
+        <register type="NOA" address="0x00009888" value="0x02080000" />
+        <register type="NOA" address="0x00009888" value="0x02032400" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009888" value="0x4A030000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000DC40" value="0x00FF0000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC00" value="0x00000004" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC08" value="0x00000003" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC10" value="0x00000007" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000DC18" value="0x00100002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC20" value="0x00100002" />
+        <register type="OA" address="0x0000DC24" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC28" value="0x00100082" />
+        <register type="OA" address="0x0000DC2C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC30" value="0x001000C2" />
+        <register type="OA" address="0x0000DC34" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC38" value="0x00100001" />
+        <register type="OA" address="0x0000DC3C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/i915/perf-configs/perf-metricset-codegen.py b/lib/i915/perf-configs/perf-metricset-codegen.py
index 00528c31..58237c27 100644
--- a/lib/i915/perf-configs/perf-metricset-codegen.py
+++ b/lib/i915/perf-configs/perf-metricset-codegen.py
@@ -126,6 +126,19 @@ def generate_metric_sets(args, gen):
                 metric_set->c_offset = metric_set->b_offset + 8;
                 metric_set->perfcnt_offset = metric_set->c_offset + 8;
 
+            """))
+        elif gen.chipset == "dg2":
+            c(textwrap.dedent("""\
+                metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+
+                metric_set->perf_raw_size = 256;
+                metric_set->gpu_time_offset = 0;
+                metric_set->gpu_clock_offset = 1;
+                metric_set->a_offset = 2;
+                metric_set->b_offset = metric_set->a_offset + 38;
+                metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->c_offset + 8;
+
             """))
         else:
             c(textwrap.dedent("""\
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index d38a7a95..3cd06f13 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -174,7 +174,7 @@ chipsets = [ 'hsw',
              'bxt', 'glk',
              'cnl',
              'icl', 'ehl',
-             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl' ]
+             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl', 'dg2', ]
 
 for chipset in chipsets:
     filename = 'oa-' + chipset + '.xml'
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d004313f..39179546 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -58,6 +58,7 @@
 #include "i915_perf_metrics_rkl.h"
 #include "i915_perf_metrics_dg1.h"
 #include "i915_perf_metrics_adl.h"
+#include "i915_perf_metrics_dg2.h"
 
 static int
 perf_ioctl(int fd, unsigned long request, void *arg)
@@ -280,6 +281,8 @@ intel_perf_for_devinfo(uint32_t device_id,
 	} else if (devinfo->is_alderlake_s || devinfo->is_alderlake_p ||
 		   devinfo->is_raptorlake_s || devinfo->is_alderlake_n) {
 		intel_perf_load_metrics_adl(perf);
+	} else if (devinfo->is_dg2) {
+		intel_perf_load_metrics_dg2(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
 	}
diff --git a/lib/meson.build b/lib/meson.build
index 98c2803b..8dabd64d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -254,7 +254,7 @@ i915_perf_hardware = [
   'bxt', 'glk',
   'cnl',
   'icl', 'ehl',
-  'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl',
+  'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl', 'dg2',
 ]
 
 i915_xml_files = []
-- 
2.25.1
