Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECE26E406
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 20:39:46 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri,  4 Jun 2021 13:39:25 -0700
Message-Id: <20210604203927.494340-5-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] lib/i915/perf: Add ADL-P metrics
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

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Add ADL-P metrics for perf OA tests.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/i915/perf-configs/guids.xml            |    26 +
 lib/i915/perf-configs/mdapi-xml-convert.py |     1 +
 lib/i915/perf-configs/oa-adlp.xml          | 10624 +++++++++++++++++++
 lib/i915/perf-configs/update-guids.py      |     2 +-
 lib/i915/perf.c                            |     3 +
 lib/meson.build                            |     2 +-
 6 files changed, 10656 insertions(+), 2 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-adlp.xml

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 95c9d717..48ef8d92 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -431,4 +431,30 @@
     <guid config_hash="b420d7b956fb1b097a7bb812b6c87dc0" mdapi_config_hash="d81f15a77d18a099782c18acaa3132f7" id="c3ea2a23-f1c7-4a19-9da2-b569226fb6de" chipset="adl" name="EuActivity7" />
     <guid config_hash="5face026dac6a0549f8a28cf226dfbc8" mdapi_config_hash="de7326838bcc8abf024bac9c771e22e4" id="a5e2f79b-cecb-4eff-8f29-cda8e2a58749" chipset="adl" name="EuActivity8" />
     <guid config_hash="1affe7abeb3739d2c845cc6fa9aacf88" mdapi_config_hash="d071f4933574945979595246be61d3f0" id="89173c19-fcfe-48da-ac26-fb64425f141b" chipset="adl" name="TestOa" />
+    <guid config_hash="21fbe2cd2b53541e3b761d579516ed12" mdapi_config_hash="66837182711f03f84fe87408ebd0a617" id="05cd2b49-0046-4da4-a0d0-41b4ab16efa3" chipset="adlp" name="RenderBasic" />
+    <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="cf3175c9-618b-4d39-b805-4a4cc07f9709" chipset="adlp" name="ComputeBasic" />
+    <guid config_hash="29513a0b338299ead603390779f6c120" mdapi_config_hash="ee12197058eb520427dc1d425178eb56" id="09c9ff45-0930-4f92-a9e2-9deb921ae752" chipset="adlp" name="RenderPipeProfile" />
+    <guid config_hash="ebc502d01dac0cf9673eb0fef2506f91" mdapi_config_hash="80fef6b5d722083a1fb9e0122d0a51a5" id="4662cab4-fb87-485a-ab08-1107fe998f13" chipset="adlp" name="HDCAndSF" />
+    <guid config_hash="28d420151b16828e8ca210caeb56b9c8" mdapi_config_hash="fbc93cbb50b2798b87a72c2dd0dbf222" id="94719676-7538-4950-bfd4-ed0122e86183" chipset="adlp" name="RasterizerAndPixelBackend" />
+    <guid config_hash="031b10d628ca033ad143ff80933f9278" mdapi_config_hash="b3259d9497ba9d9f5b0be7937383bedb" id="dc2ab75b-e656-44d9-bcbf-093a0259b1c8" chipset="adlp" name="L3_1" />
+    <guid config_hash="340670c90887c04a160735540fd60a05" mdapi_config_hash="beb8afb29ed1a424e319591041423417" id="55bc8001-d9a3-478a-a398-a3715a52630a" chipset="adlp" name="L3_2" />
+    <guid config_hash="a5c8e121989ace5c9e12158a91da582c" mdapi_config_hash="70dbd52b6c70fe3f6c7b7d265ceef298" id="1eba4453-dfaf-400a-bbcf-8bcb8a3e6b29" chipset="adlp" name="L3_3" />
+    <guid config_hash="1ec73fc7528bf2e976133100aefaa4b6" mdapi_config_hash="0716cf82fa0ba9963b363c8641d6e875" id="8f1bebfb-d930-4ee7-ab96-bde6b0ac1812" chipset="adlp" name="L3_4" />
+    <guid config_hash="b5aea697ccc39a129b0c23635a96e001" mdapi_config_hash="969f8b8b34d6216d60c7190661a9b6a9" id="df96f204-e340-4514-a5c7-909f21729d83" chipset="adlp" name="L3_5" />
+    <guid config_hash="43a026d0af29f7a18a945e2d4b350573" mdapi_config_hash="510e8490a07a363379a4c058cb474eda" id="6e8725a7-9d49-4b05-b2c3-341cf9565d33" chipset="adlp" name="L3_6" />
+    <guid config_hash="c809f1aed72d8cf173fcead43781c297" mdapi_config_hash="f9c86d51b0a47f9fcd1e4e1c66653cbc" id="dfe5179f-98d6-46d9-87fd-fc970569874f" chipset="adlp" name="Sampler_1" />
+    <guid config_hash="8c50773e2c85d6408fcc2d514447144f" mdapi_config_hash="030c3f4d0a0cfd8134531b701e7b743b" id="8f56017f-8194-4a2b-94ef-a5a02f5312fe" chipset="adlp" name="Sampler_2" />
+    <guid config_hash="ee9b574cbcc326fa0884278048553a53" mdapi_config_hash="368d6fa333da9141a6247ac4d8448f23" id="62317d73-47a0-497a-984d-28d37ea3ddf0" chipset="adlp" name="TDL_1" />
+    <guid config_hash="f32fb585f3220f879ad39c4972282af2" mdapi_config_hash="44438bc611f14882a23a4bdd67c8e6ec" id="7f826267-d18c-47bd-ad8b-11e175c32c67" chipset="adlp" name="TDL_2" />
+    <guid config_hash="15196ca6dc6aa4241d9de9fc75121111" mdapi_config_hash="b357e4b704d2bb149aa2c5313bf7aff5" id="ddfd2ac0-7b57-48af-82b0-3cf3d811845b" chipset="adlp" name="TDL_3" />
+    <guid config_hash="d033ecd48056664daee05fcf4ee777ef" mdapi_config_hash="f18943412a44e4a69d244a3a78a41e65" id="b3af5334-ed28-4e24-b6de-6f621e150eb5" chipset="adlp" name="GpuBusyness" />
+    <guid config_hash="85e13c721ad46cd039e22a1ac180c98d" mdapi_config_hash="6818187e4856c8b2acc78d588ea87056" id="b65afe50-4e37-42f5-af5c-2d45c5d82c59" chipset="adlp" name="EuActivity1" />
+    <guid config_hash="a2f87cd5035b6b6211922d49641b66a7" mdapi_config_hash="f0bbc48e521ea0ad8a3a745dc3eecdec" id="91fadda5-5d16-4f31-a132-9c7c70afa3c4" chipset="adlp" name="EuActivity2" />
+    <guid config_hash="62d20415870552f44c9de714f245da09" mdapi_config_hash="b94a87d76d2b5fdb4a4aa30b02886e3d" id="86775c09-faa5-4c25-83a0-31d085cc4959" chipset="adlp" name="EuActivity3" />
+    <guid config_hash="3fb95f065719b601ec6878eda687adeb" mdapi_config_hash="59eefdbc87164025ecdac51eb4c604a5" id="73bfba4e-13ce-4c8a-8bec-9b807dd63a97" chipset="adlp" name="EuActivity4" />
+    <guid config_hash="3b75af09f7ac5c393bd7a6aad2fddc11" mdapi_config_hash="8ebe6beda3b86aaf5f3dbf10ca4d430c" id="2f72b499-da58-4506-9098-c2487c98b8d8" chipset="adlp" name="EuActivity5" />
+    <guid config_hash="a9d708fdb3ec73b208b1092a1feeffff" mdapi_config_hash="b473bc4bd92f94c51f39cae220f56ff7" id="ee4d5a29-352b-4819-be54-ef4641803949" chipset="adlp" name="EuActivity6" />
+    <guid config_hash="b420d7b956fb1b097a7bb812b6c87dc0" mdapi_config_hash="d81f15a77d18a099782c18acaa3132f7" id="100bbf2f-a29f-44a9-83e8-3e38c34fea0c" chipset="adlp" name="EuActivity7" />
+    <guid config_hash="5face026dac6a0549f8a28cf226dfbc8" mdapi_config_hash="de7326838bcc8abf024bac9c771e22e4" id="b09ea1d6-8b2a-4c9c-99ac-8f2e9bafe8af" chipset="adlp" name="EuActivity8" />
+    <guid config_hash="1affe7abeb3739d2c845cc6fa9aacf88" mdapi_config_hash="d071f4933574945979595246be61d3f0" id="7d987d1c-efe6-4b8f-9ba9-a036ab09f676" chipset="adlp" name="TestOa" />
 </guids>
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index d26ff623..b634c96c 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -123,6 +123,7 @@ chipsets = {
     'RKL': gen8_11_chipset_params,
     'DG1': gen8_11_chipset_params,
     'ADL': gen8_11_chipset_params,
+    'ADLP': gen8_11_chipset_params,
 }
 
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
diff --git a/lib/i915/perf-configs/oa-adlp.xml b/lib/i915/perf-configs/oa-adlp.xml
new file mode 100644
index 00000000..7a6dc3c1
--- /dev/null
+++ b/lib/i915/perf-configs/oa-adlp.xml
@@ -0,0 +1,10624 @@
+<?xml version="1.0"?>
+<metrics version="1602592456" merge_md5="">
+  <set name="Render Metrics Basic Gen12"
+       chipset="ADLP"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="05cd2b49-0046-4da4-a0d0-41b4ab16efa3"
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
+    <counter name="Sampler00 Busy"
+             symbol_name="Sampler00Busy"
+             underscore_name="sampler00_busy"
+             description="The percentage of time in which Slice0 Sampler0 has been processing EU requests."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Sampler Slice0 Dualsubslice0 is bottleneck"
+             symbol_name="Sampler00Bottleneck"
+             underscore_name="sampler00_bottleneck"
+             description="The percentage of time when sampler slice0 dualsubslice0 is bottleneck"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers have been processing EU requests."
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 5 READ C 4 READ UADD C 3 READ UADD C 2 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 1 READ C 0 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x14150001" />
+        <register type="NOA" address="0x00009888" value="0x16150020" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x0E124000" />
+        <register type="NOA" address="0x00009888" value="0x10124000" />
+        <register type="NOA" address="0x00009888" value="0x12124000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C130E00" />
+        <register type="NOA" address="0x00009888" value="0x00150050" />
+        <register type="NOA" address="0x00009888" value="0x06157000" />
+        <register type="NOA" address="0x00009888" value="0x08157151" />
+        <register type="NOA" address="0x00009888" value="0x10150000" />
+        <register type="NOA" address="0x00009888" value="0x18150000" />
+        <register type="NOA" address="0x00009888" value="0x1C150000" />
+        <register type="NOA" address="0x00009888" value="0x18004000" />
+        <register type="NOA" address="0x00009888" value="0x36000490" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x2405002A" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D47" />
+        <register type="NOA" address="0x00009888" value="0x09151536" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D1402A0" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x1F150137" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x0F168000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x1D350137" />
+        <register type="NOA" address="0x00009888" value="0x03350147" />
+        <register type="NOA" address="0x00009888" value="0x07350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x0F364000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55101210" />
+        <register type="NOA" address="0x00009888" value="0x57100002" />
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B100212" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+  <set name="Compute Metrics Basic"
+       chipset="ADLP"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="cf3175c9-618b-4d39-b805-4a4cc07f9709"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+  <set name="Render Metrics for 3D Pipeline Profile"
+       chipset="ADLP"
+       symbol_name="RenderPipeProfile"
+       underscore_name="render_pipe_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="09c9ff45-0930-4f92-a9e2-9deb921ae752"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+    <counter name="VF Bottleneck"
+             symbol_name="VfBottleneck"
+             underscore_name="vf_bottleneck"
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
+    <counter name="VS Bottleneck"
+             symbol_name="VsBottleneck"
+             underscore_name="vs_bottleneck"
+             description="The percentage of time in which vertex shader pipeline stage was slowing down the 3D pipeline."
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
+    <counter name="HS Bottleneck"
+             symbol_name="HsBottleneck"
+             underscore_name="hs_bottleneck"
+             description="The percentage of time in which hull shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="3"
+             high_watermark="9"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Bottleneck"
+             symbol_name="DsBottleneck"
+             underscore_name="ds_bottleneck"
+             description="The percentage of time in which domain shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Bottleneck"
+             symbol_name="GsBottleneck"
+             underscore_name="gs_bottleneck"
+             description="The percentage of time in which geometry shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Geometry Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO Bottleneck"
+             symbol_name="SoBottleneck"
+             underscore_name="so_bottleneck"
+             description="The percentage of time in which stream output pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Clipper Bottleneck"
+             symbol_name="ClBottleneck"
+             underscore_name="cl_bottleneck"
+             description="The percentage of time in which clipper pipeline stage was slowing down the 3D pipeline."
+             low_watermark="10"
+             high_watermark="30"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Strip-Fans Bottleneck"
+             symbol_name="SfBottleneck"
+             underscore_name="sf_bottleneck"
+             description="The percentage of time in which strip-fans pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="10"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier3 Indicate Draw"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Barycentric Calc"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Stall"
+             symbol_name="HsStall"
+             underscore_name="hs_stall"
+             description="The percentage of time in which hull stall pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Stall"
+             symbol_name="DsStall"
+             underscore_name="ds_stall"
+             description="The percentage of time in which domain shader pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO Stall"
+             symbol_name="SoStall"
+             underscore_name="so_stall"
+             description="The percentage of time in which stream-output pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CL Stall"
+             symbol_name="ClStall"
+             underscore_name="cl_stall"
+             description="The percentage of time in which clipper pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SF Stall"
+             symbol_name="SfStall"
+             underscore_name="sf_stall"
+             description="The percentage of time in which strip-fans pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x00123E00" />
+        <register type="NOA" address="0x00009888" value="0x060B00B3" />
+        <register type="NOA" address="0x00009888" value="0x140B3C00" />
+        <register type="NOA" address="0x00009888" value="0x1C0B0000" />
+        <register type="NOA" address="0x00009888" value="0x120C8320" />
+        <register type="NOA" address="0x00009888" value="0x040DBE00" />
+        <register type="NOA" address="0x00009888" value="0x000D0000" />
+        <register type="NOA" address="0x00009888" value="0x280D0000" />
+        <register type="NOA" address="0x00009888" value="0x2C0E7C00" />
+        <register type="NOA" address="0x00009888" value="0x10087C00" />
+        <register type="NOA" address="0x00009888" value="0x1E120002" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x1E130002" />
+        <register type="NOA" address="0x00009888" value="0x0E0B0031" />
+        <register type="NOA" address="0x00009888" value="0x180B0092" />
+        <register type="NOA" address="0x00009888" value="0x1A0B00B1" />
+        <register type="NOA" address="0x00009888" value="0x020B0093" />
+        <register type="NOA" address="0x00009888" value="0x040B0033" />
+        <register type="NOA" address="0x00009888" value="0x000B0000" />
+        <register type="NOA" address="0x00009888" value="0x0A0C0022" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0030" />
+        <register type="NOA" address="0x00009888" value="0x1C0C8000" />
+        <register type="NOA" address="0x00009888" value="0x140C8000" />
+        <register type="NOA" address="0x00009888" value="0x160C8000" />
+        <register type="NOA" address="0x00009888" value="0x100DC017" />
+        <register type="NOA" address="0x00009888" value="0x160D0013" />
+        <register type="NOA" address="0x00009888" value="0x1C0D0081" />
+        <register type="NOA" address="0x00009888" value="0x080D0082" />
+        <register type="NOA" address="0x00009888" value="0x0A0D8102" />
+        <register type="NOA" address="0x00009888" value="0x140D0000" />
+        <register type="NOA" address="0x00009888" value="0x0C0D0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0D4000" />
+        <register type="NOA" address="0x00009888" value="0x120D0000" />
+        <register type="NOA" address="0x00009888" value="0x060DC000" />
+        <register type="NOA" address="0x00009888" value="0x0C0EC1C5" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x100E4000" />
+        <register type="NOA" address="0x00009888" value="0x120EC000" />
+        <register type="NOA" address="0x00009888" value="0x140EC000" />
+        <register type="NOA" address="0x00009888" value="0x160E4000" />
+        <register type="NOA" address="0x00009888" value="0x080E8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0EC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F5555" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0554" />
+        <register type="NOA" address="0x00009888" value="0x0E104000" />
+        <register type="NOA" address="0x00009888" value="0x10104000" />
+        <register type="NOA" address="0x00009888" value="0x14104000" />
+        <register type="NOA" address="0x00009888" value="0x16104000" />
+        <register type="NOA" address="0x00009888" value="0x18104000" />
+        <register type="NOA" address="0x00009888" value="0x1A104000" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x02104000" />
+        <register type="NOA" address="0x00009888" value="0x04104000" />
+        <register type="NOA" address="0x00009888" value="0x06104000" />
+        <register type="NOA" address="0x00009888" value="0x08104000" />
+        <register type="NOA" address="0x00009888" value="0x0A104000" />
+        <register type="NOA" address="0x00009888" value="0x0C104000" />
+        <register type="NOA" address="0x00009888" value="0x0E024000" />
+        <register type="NOA" address="0x00009888" value="0x10024000" />
+        <register type="NOA" address="0x00009888" value="0x2C024000" />
+        <register type="NOA" address="0x00009888" value="0x2E020055" />
+        <register type="NOA" address="0x00009888" value="0x02024000" />
+        <register type="NOA" address="0x00009888" value="0x04024000" />
+        <register type="NOA" address="0x00009888" value="0x06024000" />
+        <register type="NOA" address="0x00009888" value="0x08024000" />
+        <register type="NOA" address="0x00009888" value="0x0A024000" />
+        <register type="NOA" address="0x00009888" value="0x0C024000" />
+        <register type="NOA" address="0x00009888" value="0x1A032000" />
+        <register type="NOA" address="0x00009888" value="0x1C032000" />
+        <register type="NOA" address="0x00009888" value="0x2A035500" />
+        <register type="NOA" address="0x00009888" value="0x2C030001" />
+        <register type="NOA" address="0x00009888" value="0x02034000" />
+        <register type="NOA" address="0x00009888" value="0x04034000" />
+        <register type="NOA" address="0x00009888" value="0x06034000" />
+        <register type="NOA" address="0x00009888" value="0x08034000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x18032000" />
+        <register type="NOA" address="0x00009888" value="0x360036DB" />
+        <register type="NOA" address="0x00009888" value="0x380026DB" />
+        <register type="NOA" address="0x00009888" value="0x1A006000" />
+        <register type="NOA" address="0x00009888" value="0x1C006000" />
+        <register type="NOA" address="0x00009888" value="0x1E006000" />
+        <register type="NOA" address="0x00009888" value="0x34001B00" />
+        <register type="NOA" address="0x00009888" value="0x26050002" />
+        <register type="NOA" address="0x00009888" value="0x0E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x100A8000" />
+        <register type="NOA" address="0x00009888" value="0x120A4000" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x020A8000" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x08081000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAAA" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x4D100604" />
+        <register type="NOA" address="0x00009888" value="0x4F101400" />
+        <register type="NOA" address="0x00009888" value="0x51100203" />
+        <register type="NOA" address="0x00009888" value="0x53100004" />
+        <register type="NOA" address="0x00009888" value="0x55101400" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100001" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100400" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Metric set HDCAndSF"
+       chipset="ADLP"
+       symbol_name="HDCAndSF"
+       underscore_name="hdc_and_sf"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="4662cab4-fb87-485a-ab08-1107fe998f13"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice4 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader04AccessStalledOnL3"
+             underscore_name="non_sampler_shader04_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice4)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice5 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader05AccessStalledOnL3"
+             underscore_name="non_sampler_shader05_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice5)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Polygon Data Ready"
+             symbol_name="PolyDataReady"
+             underscore_name="poly_data_ready"
+             description="The percentage of time in which geometry pipeline output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe/Strip-Fans"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x14112400" />
+        <register type="NOA" address="0x00009888" value="0x14312400" />
+        <register type="NOA" address="0x00009888" value="0x14512474" />
+        <register type="NOA" address="0x00009888" value="0x14712400" />
+        <register type="NOA" address="0x00009888" value="0x14912400" />
+        <register type="NOA" address="0x00009888" value="0x14B12400" />
+        <register type="NOA" address="0x00009888" value="0x240A0019" />
+        <register type="NOA" address="0x00009888" value="0x1C07C000" />
+        <register type="NOA" address="0x00009888" value="0x24070002" />
+        <register type="NOA" address="0x00009888" value="0x10110074" />
+        <register type="NOA" address="0x00009888" value="0x08110000" />
+        <register type="NOA" address="0x00009888" value="0x10128000" />
+        <register type="NOA" address="0x00009888" value="0x1C130400" />
+        <register type="NOA" address="0x00009888" value="0x12310074" />
+        <register type="NOA" address="0x00009888" value="0x10310000" />
+        <register type="NOA" address="0x00009888" value="0x08310000" />
+        <register type="NOA" address="0x00009888" value="0x12328000" />
+        <register type="NOA" address="0x00009888" value="0x1C330800" />
+        <register type="NOA" address="0x00009888" value="0x10510000" />
+        <register type="NOA" address="0x00009888" value="0x0A510000" />
+        <register type="NOA" address="0x00009888" value="0x14528000" />
+        <register type="NOA" address="0x00009888" value="0x1C531000" />
+        <register type="NOA" address="0x00009888" value="0x16710074" />
+        <register type="NOA" address="0x00009888" value="0x10710000" />
+        <register type="NOA" address="0x00009888" value="0x0A710000" />
+        <register type="NOA" address="0x00009888" value="0x16728000" />
+        <register type="NOA" address="0x00009888" value="0x1C732000" />
+        <register type="NOA" address="0x00009888" value="0x0E910074" />
+        <register type="NOA" address="0x00009888" value="0x10910000" />
+        <register type="NOA" address="0x00009888" value="0x06910000" />
+        <register type="NOA" address="0x00009888" value="0x0E928000" />
+        <register type="NOA" address="0x00009888" value="0x1C930200" />
+        <register type="NOA" address="0x00009888" value="0x00B10074" />
+        <register type="NOA" address="0x00009888" value="0x10B10000" />
+        <register type="NOA" address="0x00009888" value="0x00B28000" />
+        <register type="NOA" address="0x00009888" value="0x10B38000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0020" />
+        <register type="NOA" address="0x00009888" value="0x16104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020001" />
+        <register type="NOA" address="0x00009888" value="0x2A030600" />
+        <register type="NOA" address="0x00009888" value="0x18002000" />
+        <register type="NOA" address="0x00009888" value="0x36003488" />
+        <register type="NOA" address="0x00009888" value="0x3800001B" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x24050038" />
+        <register type="NOA" address="0x00009888" value="0x24060080" />
+        <register type="NOA" address="0x00009888" value="0x180A00F7" />
+        <register type="NOA" address="0x00009888" value="0x200A0000" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x5D100055" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAA0" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100806" />
+        <register type="NOA" address="0x00009888" value="0x51100408" />
+        <register type="NOA" address="0x00009888" value="0x53100310" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x70800000" />
+        <register type="OA" address="0x0000DC40" value="0x007F0000" />
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
+  <set name="Metric set RasterizerAndPixelBackend"
+       chipset="ADLP"
+       symbol_name="RasterizerAndPixelBackend"
+       underscore_name="rasterizer_and_pixel_backend"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="94719676-7538-4950-bfd4-ed0122e86183"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
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
+    <counter name="Slice0 Rasterizer Output Ready"
+             symbol_name="Rasterizer0OutputReady"
+             underscore_name="rasterizer0_output_ready"
+             description="The percentage of time in which slice0 rasterizer output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
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
+    <counter name="Slice0 Pipe0 PS Output Available"
+             symbol_name="PSOutput00Available"
+             underscore_name="ps_output00_available"
+             description="The percentage of time in which slice0 pipe0 PS output is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe1 PS Output Available"
+             symbol_name="PSOutput01Available"
+             underscore_name="ps_output01_available"
+             description="The percentage of time in which slice0 pipe1 PS output is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe2 PS Output Available"
+             symbol_name="PSOutput02Available"
+             underscore_name="ps_output02_available"
+             description="The percentage of time in which slice0 pipe2 PS output is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe0 Pixel Values Ready"
+             symbol_name="PixelValues00Ready"
+             underscore_name="pixel_values00_ready"
+             description="The percentage of time in which slice0 pipe0 pixel values are ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe1 Pixel Values Ready"
+             symbol_name="PixelValues01Ready"
+             underscore_name="pixel_values01_ready"
+             description="The percentage of time in which slice0 pipe1 pixel values are ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe2 Pixel Values Ready"
+             symbol_name="PixelValues02Ready"
+             underscore_name="pixel_values02_ready"
+             description="The percentage of time in which slice0 pipe2 pixel values are ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="SQ00 is full"
+             symbol_name="GTRequestQueue00Full"
+             underscore_name="gt_request_queue00_full"
+             description="The percentage of time when IDI0 SQ0 is filled above a threshold (usually 48 entries)"
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
+    <counter name="SQ01 is full"
+             symbol_name="GTRequestQueue01Full"
+             underscore_name="gt_request_queue01_full"
+             description="The percentage of time when IDI0 SQ1 is filled above a threshold (usually 48 entries)"
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
+    <counter name="SQ10 is full"
+             symbol_name="GTRequestQueue10Full"
+             underscore_name="gt_request_queue10_full"
+             description="The percentage of time when IDI1 SQ0 is filled above a threshold (usually 48 entries)"
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
+    <counter name="SQ11 is full"
+             symbol_name="GTRequestQueue11Full"
+             underscore_name="gt_request_queue11_full"
+             description="The percentage of time when IDI1 SQ1 is filled above a threshold (usually 48 entries)"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x1E075000" />
+        <register type="NOA" address="0x00009888" value="0x1A0700C0" />
+        <register type="NOA" address="0x00009888" value="0x1E055000" />
+        <register type="NOA" address="0x00009888" value="0x1A0500C0" />
+        <register type="NOA" address="0x00009888" value="0x1E065000" />
+        <register type="NOA" address="0x00009888" value="0x1A0600C0" />
+        <register type="NOA" address="0x00009888" value="0x2A0A7300" />
+        <register type="NOA" address="0x00009888" value="0x2C0A0000" />
+        <register type="NOA" address="0x00009888" value="0x120800A0" />
+        <register type="NOA" address="0x00009888" value="0x0A07C000" />
+        <register type="NOA" address="0x00009888" value="0x0E070027" />
+        <register type="NOA" address="0x00009888" value="0x10070000" />
+        <register type="NOA" address="0x00009888" value="0x24070000" />
+        <register type="NOA" address="0x00009888" value="0x2A032000" />
+        <register type="NOA" address="0x00009888" value="0x2C030008" />
+        <register type="NOA" address="0x00009888" value="0x18006000" />
+        <register type="NOA" address="0x00009888" value="0x360036D8" />
+        <register type="NOA" address="0x00009888" value="0x38003299" />
+        <register type="NOA" address="0x00009888" value="0x1A004000" />
+        <register type="NOA" address="0x00009888" value="0x1C006000" />
+        <register type="NOA" address="0x00009888" value="0x2A010400" />
+        <register type="NOA" address="0x00009888" value="0x2C010001" />
+        <register type="NOA" address="0x00009888" value="0x0C05C000" />
+        <register type="NOA" address="0x00009888" value="0x00052700" />
+        <register type="NOA" address="0x00009888" value="0x10050000" />
+        <register type="NOA" address="0x00009888" value="0x24050000" />
+        <register type="NOA" address="0x00009888" value="0x22050000" />
+        <register type="NOA" address="0x00009888" value="0x0C0600C0" />
+        <register type="NOA" address="0x00009888" value="0x0E062700" />
+        <register type="NOA" address="0x00009888" value="0x10060000" />
+        <register type="NOA" address="0x00009888" value="0x24060000" />
+        <register type="NOA" address="0x00009888" value="0x26060000" />
+        <register type="NOA" address="0x00009888" value="0x000A0144" />
+        <register type="NOA" address="0x00009888" value="0x0E0A0145" />
+        <register type="NOA" address="0x00009888" value="0x100A0156" />
+        <register type="NOA" address="0x00009888" value="0x040A014F" />
+        <register type="NOA" address="0x00009888" value="0x200A0000" />
+        <register type="NOA" address="0x00009888" value="0x120A4000" />
+        <register type="NOA" address="0x00009888" value="0x140A4000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x08081980" />
+        <register type="NOA" address="0x00009888" value="0x0A080032" />
+        <register type="NOA" address="0x00009888" value="0x10080000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x31152800" />
+        <register type="NOA" address="0x00009888" value="0x331500A0" />
+        <register type="NOA" address="0x00009888" value="0x31352800" />
+        <register type="NOA" address="0x00009888" value="0x333500A0" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105FA5" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAA0" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B140A00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07150016" />
+        <register type="NOA" address="0x00009888" value="0x09150096" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03168000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x0B350016" />
+        <register type="NOA" address="0x00009888" value="0x0D350096" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x07364000" />
+        <register type="NOA" address="0x00009888" value="0x47100400" />
+        <register type="NOA" address="0x00009888" value="0x4D100010" />
+        <register type="NOA" address="0x00009888" value="0x4F100404" />
+        <register type="NOA" address="0x00009888" value="0x51100202" />
+        <register type="NOA" address="0x00009888" value="0x53100002" />
+        <register type="NOA" address="0x00009888" value="0x55100204" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x49101404" />
+        <register type="NOA" address="0x00009888" value="0x4B101010" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000038" />
+        <register type="OA" address="0x0000D944" value="0x0000FFF8" />
+        <register type="OA" address="0x0000DC00" value="0x00000038" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFF8" />
+        <register type="OA" address="0x0000D948" value="0x000000C0" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC08" value="0x000000C0" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFE7" />
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
+  <set name="Gen12LP L3_1"
+       chipset="ADLP"
+       symbol_name="L3_1"
+       underscore_name="l3_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="dc2ab75b-e656-44d9-bcbf-093a0259b1c8"
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
+    <counter name="Slice0 L3 Bank0 Input Available"
+             symbol_name="L30Bank0InputAvailable"
+             underscore_name="l30_bank0_input_available"
+             description="The percentage of time in which slice0 L3 bank0 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD C 5 READ FADD C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank1 Input Available"
+             symbol_name="L30Bank1InputAvailable"
+             underscore_name="l30_bank1_input_available"
+             description="The percentage of time in which slice0 L3 bank1 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ C 2 READ FADD C 1 READ FADD C 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank4 Input Available"
+             symbol_name="L30Bank4InputAvailable"
+             underscore_name="l30_bank4_input_available"
+             description="The percentage of time in which slice0 L3 bank4 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ B 2 READ FADD B 1 READ FADD B 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank5 Input Available"
+             symbol_name="L30Bank5InputAvailable"
+             underscore_name="l30_bank5_input_available"
+             description="The percentage of time in which slice0 L3 bank5 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ B 6 READ FADD B 5 READ FADD B 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04022000" />
+        <register type="NOA" address="0x00009888" value="0x06022800" />
+        <register type="NOA" address="0x00009888" value="0x04002827" />
+        <register type="NOA" address="0x00009888" value="0x0600202C" />
+        <register type="NOA" address="0x00009888" value="0x00020024" />
+        <register type="NOA" address="0x00009888" value="0x0E020025" />
+        <register type="NOA" address="0x00009888" value="0x10020026" />
+        <register type="NOA" address="0x00009888" value="0x12020027" />
+        <register type="NOA" address="0x00009888" value="0x1402002C" />
+        <register type="NOA" address="0x00009888" value="0x1602002D" />
+        <register type="NOA" address="0x00009888" value="0x1802002E" />
+        <register type="NOA" address="0x00009888" value="0x1A02002F" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x2C020000" />
+        <register type="NOA" address="0x00009888" value="0x00034000" />
+        <register type="NOA" address="0x00009888" value="0x1A032000" />
+        <register type="NOA" address="0x00009888" value="0x1C032000" />
+        <register type="NOA" address="0x00009888" value="0x1E032000" />
+        <register type="NOA" address="0x00009888" value="0x2A035500" />
+        <register type="NOA" address="0x00009888" value="0x1C000024" />
+        <register type="NOA" address="0x00009888" value="0x1E000025" />
+        <register type="NOA" address="0x00009888" value="0x02000026" />
+        <register type="NOA" address="0x00009888" value="0x0800002D" />
+        <register type="NOA" address="0x00009888" value="0x0A00002E" />
+        <register type="NOA" address="0x00009888" value="0x0C00002F" />
+        <register type="NOA" address="0x00009888" value="0x360036D8" />
+        <register type="NOA" address="0x00009888" value="0x18006000" />
+        <register type="NOA" address="0x00009888" value="0x380000DB" />
+        <register type="NOA" address="0x00009888" value="0x1A000000" />
+        <register type="NOA" address="0x00009888" value="0x34000000" />
+        <register type="NOA" address="0x00009888" value="0x000A8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x100A8000" />
+        <register type="NOA" address="0x00009888" value="0x120A8000" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAAA" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100606" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x53100000" />
+        <register type="NOA" address="0x00009888" value="0x55100600" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100006" />
+        <register type="NOA" address="0x00009888" value="0x49100606" />
+        <register type="NOA" address="0x00009888" value="0x4B100606" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Gen12LP L3_2"
+       chipset="ADLP"
+       symbol_name="L3_2"
+       underscore_name="l3_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="55bc8001-d9a3-478a-a398-a3715a52630a"
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
+    <counter name="Slice0 L3 Bank2 Input Available"
+             symbol_name="L30Bank2InputAvailable"
+             underscore_name="l30_bank2_input_available"
+             description="The percentage of time in which slice0 L3 bank2 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ B 2 READ FADD B 1 READ FADD B 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank3 Input Available"
+             symbol_name="L30Bank3InputAvailable"
+             underscore_name="l30_bank3_input_available"
+             description="The percentage of time in which slice0 L3 bank3 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ B 6 READ FADD B 5 READ FADD B 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank6 Input Available"
+             symbol_name="L30Bank6InputAvailable"
+             underscore_name="l30_bank6_input_available"
+             description="The percentage of time in which slice0 L3 bank6 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ C 2 READ FADD C 1 READ FADD C 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank7 Input Available"
+             symbol_name="L30Bank7InputAvailable"
+             underscore_name="l30_bank7_input_available"
+             description="The percentage of time in which slice0 L3 bank7 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD C 5 READ FADD C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04023027" />
+        <register type="NOA" address="0x00009888" value="0x0602382C" />
+        <register type="NOA" address="0x00009888" value="0x04003000" />
+        <register type="NOA" address="0x00009888" value="0x06003800" />
+        <register type="NOA" address="0x00009888" value="0x1C020024" />
+        <register type="NOA" address="0x00009888" value="0x1E020025" />
+        <register type="NOA" address="0x00009888" value="0x02020026" />
+        <register type="NOA" address="0x00009888" value="0x0802002D" />
+        <register type="NOA" address="0x00009888" value="0x0A02002E" />
+        <register type="NOA" address="0x00009888" value="0x0C02002F" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x02034000" />
+        <register type="NOA" address="0x00009888" value="0x04034000" />
+        <register type="NOA" address="0x00009888" value="0x06034000" />
+        <register type="NOA" address="0x00009888" value="0x08034000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x18032000" />
+        <register type="NOA" address="0x00009888" value="0x00000024" />
+        <register type="NOA" address="0x00009888" value="0x0E000025" />
+        <register type="NOA" address="0x00009888" value="0x10000026" />
+        <register type="NOA" address="0x00009888" value="0x12000027" />
+        <register type="NOA" address="0x00009888" value="0x1400002C" />
+        <register type="NOA" address="0x00009888" value="0x1600002D" />
+        <register type="NOA" address="0x00009888" value="0x1800002E" />
+        <register type="NOA" address="0x00009888" value="0x1A00602F" />
+        <register type="NOA" address="0x00009888" value="0x36000003" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C006000" />
+        <register type="NOA" address="0x00009888" value="0x1E006000" />
+        <register type="NOA" address="0x00009888" value="0x34001B00" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x020A8000" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAAA" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100606" />
+        <register type="NOA" address="0x00009888" value="0x51100606" />
+        <register type="NOA" address="0x00009888" value="0x53100606" />
+        <register type="NOA" address="0x00009888" value="0x55100006" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Gen12LP L3_3"
+       chipset="ADLP"
+       symbol_name="L3_3"
+       underscore_name="l3_3"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="1eba4453-dfaf-400a-bbcf-8bcb8a3e6b29"
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
+    <counter name="Slice0 L3 Bank0 Output Ready"
+             symbol_name="L30Bank0OutputReady"
+             underscore_name="l30_bank0_output_ready"
+             description="The percentage of time in which slice0 L3 bank0 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank4 Output Ready"
+             symbol_name="L30Bank4OutputReady"
+             underscore_name="l30_bank4_output_ready"
+             description="The percentage of time in which slice0 L3 bank4 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04020200" />
+        <register type="NOA" address="0x00009888" value="0x06020020" />
+        <register type="NOA" address="0x00009888" value="0x04000200" />
+        <register type="NOA" address="0x00009888" value="0x06000000" />
+        <register type="NOA" address="0x00009888" value="0x08020028" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x06034000" />
+        <register type="NOA" address="0x00009888" value="0x08034000" />
+        <register type="NOA" address="0x00009888" value="0x0A000020" />
+        <register type="NOA" address="0x00009888" value="0x0C000028" />
+        <register type="NOA" address="0x00009888" value="0x36000000" />
+        <register type="NOA" address="0x00009888" value="0x1E006000" />
+        <register type="NOA" address="0x00009888" value="0x34000300" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100550" />
+        <register type="NOA" address="0x00009888" value="0x1B14A000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000A" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100606" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Gen12LP L3_4"
+       chipset="ADLP"
+       symbol_name="L3_4"
+       underscore_name="l3_4"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="8f1bebfb-d930-4ee7-ab96-bde6b0ac1812"
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
+    <counter name="Slice0 L3 Bank1 Output Ready"
+             symbol_name="L30Bank1OutputReady"
+             underscore_name="l30_bank1_output_ready"
+             description="The percentage of time in which slice0 L3 bank1 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank5 Output Ready"
+             symbol_name="L30Bank5OutputReady"
+             underscore_name="l30_bank5_output_ready"
+             description="The percentage of time in which slice0 L3 bank5 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04020A00" />
+        <register type="NOA" address="0x00009888" value="0x06020800" />
+        <register type="NOA" address="0x00009888" value="0x04000A00" />
+        <register type="NOA" address="0x00009888" value="0x06000820" />
+        <register type="NOA" address="0x00009888" value="0x0A020020" />
+        <register type="NOA" address="0x00009888" value="0x0C020028" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x18032000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x36000003" />
+        <register type="NOA" address="0x00009888" value="0x1E000000" />
+        <register type="NOA" address="0x00009888" value="0x34001800" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100550" />
+        <register type="NOA" address="0x00009888" value="0x1B14A000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000A" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100606" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Gen12LP L3_5"
+       chipset="ADLP"
+       symbol_name="L3_5"
+       underscore_name="l3_5"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="df96f204-e340-4514-a5c7-909f21729d83"
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
+    <counter name="Slice0 L3 Bank2 Output Ready"
+             symbol_name="L30Bank2OutputReady"
+             underscore_name="l30_bank2_output_ready"
+             description="The percentage of time in which slice0 L3 bank2 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank6 Output Ready"
+             symbol_name="L30Bank6OutputReady"
+             underscore_name="l30_bank6_output_ready"
+             description="The percentage of time in which slice0 L3 bank6 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04021200" />
+        <register type="NOA" address="0x00009888" value="0x06021000" />
+        <register type="NOA" address="0x00009888" value="0x04001200" />
+        <register type="NOA" address="0x00009888" value="0x06001020" />
+        <register type="NOA" address="0x00009888" value="0x0A020020" />
+        <register type="NOA" address="0x00009888" value="0x0C020028" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x18032000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x36000003" />
+        <register type="NOA" address="0x00009888" value="0x1E000000" />
+        <register type="NOA" address="0x00009888" value="0x34001800" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100550" />
+        <register type="NOA" address="0x00009888" value="0x1B14A000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000A" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100606" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Gen12LP L3_6"
+       chipset="ADLP"
+       symbol_name="L3_6"
+       underscore_name="l3_6"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="6e8725a7-9d49-4b05-b2c3-341cf9565d33"
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
+    <counter name="Slice0 L3 Bank3 Output Ready"
+             symbol_name="L30Bank3OutputReady"
+             underscore_name="l30_bank3_output_ready"
+             description="The percentage of time in which slice0 L3 bank3 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank7 Output Ready"
+             symbol_name="L30Bank7OutputReady"
+             underscore_name="l30_bank7_output_ready"
+             description="The percentage of time in which slice0 L3 bank7 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04021A00" />
+        <register type="NOA" address="0x00009888" value="0x06021800" />
+        <register type="NOA" address="0x00009888" value="0x04001A00" />
+        <register type="NOA" address="0x00009888" value="0x06001820" />
+        <register type="NOA" address="0x00009888" value="0x0A020020" />
+        <register type="NOA" address="0x00009888" value="0x0C020028" />
+        <register type="NOA" address="0x00009888" value="0x2E020000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x18032000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x36000003" />
+        <register type="NOA" address="0x00009888" value="0x1E000000" />
+        <register type="NOA" address="0x00009888" value="0x34001800" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100550" />
+        <register type="NOA" address="0x00009888" value="0x1B14A000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000A" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100606" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+  <set name="Sampler_1"
+       chipset="ADLP"
+       symbol_name="Sampler_1"
+       underscore_name="sampler_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="dfe5179f-98d6-46d9-87fd-fc970569874f"
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
+    <counter name="Slice0 DualSubslice0 Input Available"
+             symbol_name="Sampler00InputAvailable"
+             underscore_name="sampler00_input_available"
+             description="The percentage of time in which slice0 dualsubslice0 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice4 Input Available"
+             symbol_name="Sampler04InputAvailable"
+             underscore_name="sampler04_input_available"
+             description="The percentage of time in which slice0 dualsubslice4 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice5 Input Available"
+             symbol_name="Sampler05InputAvailable"
+             underscore_name="sampler05_input_available"
+             description="The percentage of time in which slice0 dualsubslice5 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x1C121600" />
+        <register type="NOA" address="0x00009888" value="0x18141600" />
+        <register type="NOA" address="0x00009888" value="0x1C325600" />
+        <register type="NOA" address="0x00009888" value="0x18341600" />
+        <register type="NOA" address="0x00009888" value="0x1C521600" />
+        <register type="NOA" address="0x00009888" value="0x185416A6" />
+        <register type="NOA" address="0x00009888" value="0x1C721600" />
+        <register type="NOA" address="0x00009888" value="0x18741600" />
+        <register type="NOA" address="0x00009888" value="0x1C921600" />
+        <register type="NOA" address="0x00009888" value="0x18941600" />
+        <register type="NOA" address="0x00009888" value="0x1CB21600" />
+        <register type="NOA" address="0x00009888" value="0x18B41600" />
+        <register type="NOA" address="0x00009888" value="0x1C07C000" />
+        <register type="NOA" address="0x00009888" value="0x2407002B" />
+        <register type="NOA" address="0x00009888" value="0x04120086" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x02124000" />
+        <register type="NOA" address="0x00009888" value="0x12138000" />
+        <register type="NOA" address="0x00009888" value="0x14138000" />
+        <register type="NOA" address="0x00009888" value="0x021400A6" />
+        <register type="NOA" address="0x00009888" value="0x10140000" />
+        <register type="NOA" address="0x00009888" value="0x00140000" />
+        <register type="NOA" address="0x00009888" value="0x1A150020" />
+        <register type="NOA" address="0x00009888" value="0x1E320086" />
+        <register type="NOA" address="0x00009888" value="0x20320000" />
+        <register type="NOA" address="0x00009888" value="0x1E330003" />
+        <register type="NOA" address="0x00009888" value="0x1C3400A6" />
+        <register type="NOA" address="0x00009888" value="0x10340000" />
+        <register type="NOA" address="0x00009888" value="0x0E340000" />
+        <register type="NOA" address="0x00009888" value="0x1C358000" />
+        <register type="NOA" address="0x00009888" value="0x1A520086" />
+        <register type="NOA" address="0x00009888" value="0x20520000" />
+        <register type="NOA" address="0x00009888" value="0x18524000" />
+        <register type="NOA" address="0x00009888" value="0x1C53C000" />
+        <register type="NOA" address="0x00009888" value="0x10540000" />
+        <register type="NOA" address="0x00009888" value="0x0C540000" />
+        <register type="NOA" address="0x00009888" value="0x1C550800" />
+        <register type="NOA" address="0x00009888" value="0x16720086" />
+        <register type="NOA" address="0x00009888" value="0x20720000" />
+        <register type="NOA" address="0x00009888" value="0x14724000" />
+        <register type="NOA" address="0x00009888" value="0x1C733000" />
+        <register type="NOA" address="0x00009888" value="0x147400A6" />
+        <register type="NOA" address="0x00009888" value="0x10740000" />
+        <register type="NOA" address="0x00009888" value="0x0A740000" />
+        <register type="NOA" address="0x00009888" value="0x1C750080" />
+        <register type="NOA" address="0x00009888" value="0x12920086" />
+        <register type="NOA" address="0x00009888" value="0x20920000" />
+        <register type="NOA" address="0x00009888" value="0x10924000" />
+        <register type="NOA" address="0x00009888" value="0x1C930C00" />
+        <register type="NOA" address="0x00009888" value="0x109400A6" />
+        <register type="NOA" address="0x00009888" value="0x08940000" />
+        <register type="NOA" address="0x00009888" value="0x1C950008" />
+        <register type="NOA" address="0x00009888" value="0x0EB20086" />
+        <register type="NOA" address="0x00009888" value="0x20B20000" />
+        <register type="NOA" address="0x00009888" value="0x00B24000" />
+        <register type="NOA" address="0x00009888" value="0x10B38000" />
+        <register type="NOA" address="0x00009888" value="0x1CB30200" />
+        <register type="NOA" address="0x00009888" value="0x00B400A6" />
+        <register type="NOA" address="0x00009888" value="0x10B40000" />
+        <register type="NOA" address="0x00009888" value="0x18B58000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0028" />
+        <register type="NOA" address="0x00009888" value="0x14104000" />
+        <register type="NOA" address="0x00009888" value="0x16104000" />
+        <register type="NOA" address="0x00009888" value="0x2C024000" />
+        <register type="NOA" address="0x00009888" value="0x2E020001" />
+        <register type="NOA" address="0x00009888" value="0x2A03A500" />
+        <register type="NOA" address="0x00009888" value="0x18002000" />
+        <register type="NOA" address="0x00009888" value="0x36003248" />
+        <register type="NOA" address="0x00009888" value="0x380024DB" />
+        <register type="NOA" address="0x00009888" value="0x1A004000" />
+        <register type="NOA" address="0x00009888" value="0x1C004000" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x1C012000" />
+        <register type="NOA" address="0x00009888" value="0x1E012000" />
+        <register type="NOA" address="0x00009888" value="0x2405C000" />
+        <register type="NOA" address="0x00009888" value="0x26050003" />
+        <register type="NOA" address="0x00009888" value="0x220500A0" />
+        <register type="NOA" address="0x00009888" value="0x24062800" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105005" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAA0" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B140A00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F10060A" />
+        <register type="NOA" address="0x00009888" value="0x5110000A" />
+        <register type="NOA" address="0x00009888" value="0x53100404" />
+        <register type="NOA" address="0x00009888" value="0x55101808" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100001" />
+        <register type="NOA" address="0x00009888" value="0x49100118" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x30800000" />
+        <register type="OA" address="0x0000DC40" value="0x003F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000180" />
+        <register type="OA" address="0x0000D954" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC10" value="0x00000180" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D958" value="0x00000600" />
+        <register type="OA" address="0x0000D95C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000DC18" value="0x00000600" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000D960" value="0x00001800" />
+        <register type="OA" address="0x0000D964" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC20" value="0x00001800" />
+        <register type="OA" address="0x0000DC24" value="0x0000FCFF" />
+        <register type="OA" address="0x0000D968" value="0x00006000" />
+        <register type="OA" address="0x0000D96C" value="0x0000F3FF" />
+        <register type="OA" address="0x0000DC28" value="0x00006000" />
+        <register type="OA" address="0x0000DC2C" value="0x0000F3FF" />
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
+       chipset="ADLP"
+       symbol_name="Sampler_2"
+       underscore_name="sampler_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="8f56017f-8194-4a2b-94ef-a5a02f5312fe"
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
+    <counter name="Slice0 DualSubslice0 Sampler Output Ready"
+             symbol_name="Sampler00OutputReady"
+             underscore_name="sampler00_output_ready"
+             description="The percentage of time in which slice0 dualsubslice0 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice4 Sampler Output Ready"
+             symbol_name="Sampler04OutputReady"
+             underscore_name="sampler04_output_ready"
+             description="The percentage of time in which slice0 dualsubslice4 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice5 Sampler Output Ready"
+             symbol_name="Sampler05OutputReady"
+             underscore_name="sampler05_output_ready"
+             description="The percentage of time in which slice0 dualsubslice5 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0C123E00" />
+        <register type="NOA" address="0x00009888" value="0x04143E00" />
+        <register type="NOA" address="0x00009888" value="0x0C323E00" />
+        <register type="NOA" address="0x00009888" value="0x04343E00" />
+        <register type="NOA" address="0x00009888" value="0x0C523E00" />
+        <register type="NOA" address="0x00009888" value="0x04543E00" />
+        <register type="NOA" address="0x00009888" value="0x0C723E00" />
+        <register type="NOA" address="0x00009888" value="0x04743E00" />
+        <register type="NOA" address="0x00009888" value="0x0C923E00" />
+        <register type="NOA" address="0x00009888" value="0x04943E00" />
+        <register type="NOA" address="0x00009888" value="0x0CB23E00" />
+        <register type="NOA" address="0x00009888" value="0x04B43E00" />
+        <register type="NOA" address="0x00009888" value="0x1C07C000" />
+        <register type="NOA" address="0x00009888" value="0x2407002B" />
+        <register type="NOA" address="0x00009888" value="0x04120033" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x02124000" />
+        <register type="NOA" address="0x00009888" value="0x12138000" />
+        <register type="NOA" address="0x00009888" value="0x14138000" />
+        <register type="NOA" address="0x00009888" value="0x02140013" />
+        <register type="NOA" address="0x00009888" value="0x10140000" />
+        <register type="NOA" address="0x00009888" value="0x00140000" />
+        <register type="NOA" address="0x00009888" value="0x1A150020" />
+        <register type="NOA" address="0x00009888" value="0x1E320033" />
+        <register type="NOA" address="0x00009888" value="0x20320000" />
+        <register type="NOA" address="0x00009888" value="0x1C324000" />
+        <register type="NOA" address="0x00009888" value="0x1E330003" />
+        <register type="NOA" address="0x00009888" value="0x1C340013" />
+        <register type="NOA" address="0x00009888" value="0x10340000" />
+        <register type="NOA" address="0x00009888" value="0x0E340000" />
+        <register type="NOA" address="0x00009888" value="0x1C358000" />
+        <register type="NOA" address="0x00009888" value="0x1A520033" />
+        <register type="NOA" address="0x00009888" value="0x20520000" />
+        <register type="NOA" address="0x00009888" value="0x18524000" />
+        <register type="NOA" address="0x00009888" value="0x1C53C000" />
+        <register type="NOA" address="0x00009888" value="0x18540013" />
+        <register type="NOA" address="0x00009888" value="0x10540000" />
+        <register type="NOA" address="0x00009888" value="0x0C540000" />
+        <register type="NOA" address="0x00009888" value="0x1C550800" />
+        <register type="NOA" address="0x00009888" value="0x16720033" />
+        <register type="NOA" address="0x00009888" value="0x20720000" />
+        <register type="NOA" address="0x00009888" value="0x14724000" />
+        <register type="NOA" address="0x00009888" value="0x1C733000" />
+        <register type="NOA" address="0x00009888" value="0x14740013" />
+        <register type="NOA" address="0x00009888" value="0x10740000" />
+        <register type="NOA" address="0x00009888" value="0x0A740000" />
+        <register type="NOA" address="0x00009888" value="0x1C750080" />
+        <register type="NOA" address="0x00009888" value="0x12920033" />
+        <register type="NOA" address="0x00009888" value="0x20920000" />
+        <register type="NOA" address="0x00009888" value="0x10924000" />
+        <register type="NOA" address="0x00009888" value="0x1C930C00" />
+        <register type="NOA" address="0x00009888" value="0x10940013" />
+        <register type="NOA" address="0x00009888" value="0x08940000" />
+        <register type="NOA" address="0x00009888" value="0x1C950008" />
+        <register type="NOA" address="0x00009888" value="0x0EB20033" />
+        <register type="NOA" address="0x00009888" value="0x20B20000" />
+        <register type="NOA" address="0x00009888" value="0x00B24000" />
+        <register type="NOA" address="0x00009888" value="0x10B38000" />
+        <register type="NOA" address="0x00009888" value="0x1CB30200" />
+        <register type="NOA" address="0x00009888" value="0x00B40013" />
+        <register type="NOA" address="0x00009888" value="0x10B40000" />
+        <register type="NOA" address="0x00009888" value="0x18B58000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0028" />
+        <register type="NOA" address="0x00009888" value="0x14104000" />
+        <register type="NOA" address="0x00009888" value="0x16104000" />
+        <register type="NOA" address="0x00009888" value="0x2C024000" />
+        <register type="NOA" address="0x00009888" value="0x2E020001" />
+        <register type="NOA" address="0x00009888" value="0x2A03A500" />
+        <register type="NOA" address="0x00009888" value="0x18002000" />
+        <register type="NOA" address="0x00009888" value="0x36003248" />
+        <register type="NOA" address="0x00009888" value="0x380024DB" />
+        <register type="NOA" address="0x00009888" value="0x1A004000" />
+        <register type="NOA" address="0x00009888" value="0x1C004000" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x1C012000" />
+        <register type="NOA" address="0x00009888" value="0x1E012000" />
+        <register type="NOA" address="0x00009888" value="0x2405C000" />
+        <register type="NOA" address="0x00009888" value="0x26050003" />
+        <register type="NOA" address="0x00009888" value="0x220500A0" />
+        <register type="NOA" address="0x00009888" value="0x24062800" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105005" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAA0" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B140A00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F10060A" />
+        <register type="NOA" address="0x00009888" value="0x5110000A" />
+        <register type="NOA" address="0x00009888" value="0x53100404" />
+        <register type="NOA" address="0x00009888" value="0x55101808" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100001" />
+        <register type="NOA" address="0x00009888" value="0x49100118" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x30800000" />
+        <register type="OA" address="0x0000DC40" value="0x003F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000180" />
+        <register type="OA" address="0x0000D954" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC10" value="0x00000180" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D958" value="0x00000600" />
+        <register type="OA" address="0x0000D95C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000DC18" value="0x00000600" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000D960" value="0x00001800" />
+        <register type="OA" address="0x0000D964" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC20" value="0x00001800" />
+        <register type="OA" address="0x0000DC24" value="0x0000FCFF" />
+        <register type="OA" address="0x0000D968" value="0x00006000" />
+        <register type="OA" address="0x0000D96C" value="0x0000F3FF" />
+        <register type="OA" address="0x0000DC28" value="0x00006000" />
+        <register type="OA" address="0x0000DC2C" value="0x0000F3FF" />
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
+       chipset="ADLP"
+       symbol_name="TDL_1"
+       underscore_name="tdl_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="62317d73-47a0-497a-984d-28d37ea3ddf0"
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
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="NonPSThread00ReadyForDispatch"
+             underscore_name="non_ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice4 Thread Dispatcher"
+             symbol_name="NonPSThread04ReadyForDispatch"
+             underscore_name="non_ps_thread04_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice4 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice5 Thread Dispatcher"
+             symbol_name="NonPSThread05ReadyForDispatch"
+             underscore_name="non_ps_thread05_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice5 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
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
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
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
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="ThreadHeader00Ready"
+             underscore_name="thread_header00_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x2611001C" />
+        <register type="NOA" address="0x00009888" value="0x2631001C" />
+        <register type="NOA" address="0x00009888" value="0x2651001C" />
+        <register type="NOA" address="0x00009888" value="0x2671001C" />
+        <register type="NOA" address="0x00009888" value="0x2691001C" />
+        <register type="NOA" address="0x00009888" value="0x26B1001C" />
+        <register type="NOA" address="0x00009888" value="0x1C07C000" />
+        <register type="NOA" address="0x00009888" value="0x24070002" />
+        <register type="NOA" address="0x00009888" value="0x16110103" />
+        <register type="NOA" address="0x00009888" value="0x1C110104" />
+        <register type="NOA" address="0x00009888" value="0x1E110105" />
+        <register type="NOA" address="0x00009888" value="0x02110106" />
+        <register type="NOA" address="0x00009888" value="0x04110107" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x0A110000" />
+        <register type="NOA" address="0x00009888" value="0x0E110000" />
+        <register type="NOA" address="0x00009888" value="0x00110000" />
+        <register type="NOA" address="0x00009888" value="0x16128000" />
+        <register type="NOA" address="0x00009888" value="0x1C128000" />
+        <register type="NOA" address="0x00009888" value="0x1E128000" />
+        <register type="NOA" address="0x00009888" value="0x02128000" />
+        <register type="NOA" address="0x00009888" value="0x04128000" />
+        <register type="NOA" address="0x00009888" value="0x1C132000" />
+        <register type="NOA" address="0x00009888" value="0x1E130003" />
+        <register type="NOA" address="0x00009888" value="0x12138000" />
+        <register type="NOA" address="0x00009888" value="0x14138000" />
+        <register type="NOA" address="0x00009888" value="0x14310103" />
+        <register type="NOA" address="0x00009888" value="0x06310104" />
+        <register type="NOA" address="0x00009888" value="0x08310105" />
+        <register type="NOA" address="0x00009888" value="0x0A310106" />
+        <register type="NOA" address="0x00009888" value="0x0C310107" />
+        <register type="NOA" address="0x00009888" value="0x10310000" />
+        <register type="NOA" address="0x00009888" value="0x02310000" />
+        <register type="NOA" address="0x00009888" value="0x04310000" />
+        <register type="NOA" address="0x00009888" value="0x14328000" />
+        <register type="NOA" address="0x00009888" value="0x06328000" />
+        <register type="NOA" address="0x00009888" value="0x08328000" />
+        <register type="NOA" address="0x00009888" value="0x0A328000" />
+        <register type="NOA" address="0x00009888" value="0x0C328000" />
+        <register type="NOA" address="0x00009888" value="0x1C331100" />
+        <register type="NOA" address="0x00009888" value="0x16338000" />
+        <register type="NOA" address="0x00009888" value="0x18338000" />
+        <register type="NOA" address="0x00009888" value="0x1A338000" />
+        <register type="NOA" address="0x00009888" value="0x12510103" />
+        <register type="NOA" address="0x00009888" value="0x10510000" />
+        <register type="NOA" address="0x00009888" value="0x08510000" />
+        <register type="NOA" address="0x00009888" value="0x12528000" />
+        <register type="NOA" address="0x00009888" value="0x1C530800" />
+        <register type="NOA" address="0x00009888" value="0x10710103" />
+        <register type="NOA" address="0x00009888" value="0x08710000" />
+        <register type="NOA" address="0x00009888" value="0x10728000" />
+        <register type="NOA" address="0x00009888" value="0x1C730400" />
+        <register type="NOA" address="0x00009888" value="0x0E910103" />
+        <register type="NOA" address="0x00009888" value="0x10910000" />
+        <register type="NOA" address="0x00009888" value="0x06910000" />
+        <register type="NOA" address="0x00009888" value="0x0E928000" />
+        <register type="NOA" address="0x00009888" value="0x1C930200" />
+        <register type="NOA" address="0x00009888" value="0x00B10103" />
+        <register type="NOA" address="0x00009888" value="0x10B10000" />
+        <register type="NOA" address="0x00009888" value="0x00B28000" />
+        <register type="NOA" address="0x00009888" value="0x10B38000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F8000" />
+        <register type="NOA" address="0x00009888" value="0x10104000" />
+        <register type="NOA" address="0x00009888" value="0x10024000" />
+        <register type="NOA" address="0x00009888" value="0x1C032000" />
+        <register type="NOA" address="0x00009888" value="0x1E034000" />
+        <register type="NOA" address="0x00009888" value="0x18002000" />
+        <register type="NOA" address="0x00009888" value="0x360026CA" />
+        <register type="NOA" address="0x00009888" value="0x38002402" />
+        <register type="NOA" address="0x00009888" value="0x1A004000" />
+        <register type="NOA" address="0x00009888" value="0x1C004000" />
+        <register type="NOA" address="0x00009888" value="0x1E004000" />
+        <register type="NOA" address="0x00009888" value="0x34001200" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x240582C0" />
+        <register type="NOA" address="0x00009888" value="0x26050002" />
+        <register type="NOA" address="0x00009888" value="0x2205FFA0" />
+        <register type="NOA" address="0x00009888" value="0x24060020" />
+        <register type="NOA" address="0x00009888" value="0x100A8000" />
+        <register type="NOA" address="0x00009888" value="0x120A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101415" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D142AAA" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100808" />
+        <register type="NOA" address="0x00009888" value="0x4F100006" />
+        <register type="NOA" address="0x00009888" value="0x51100804" />
+        <register type="NOA" address="0x00009888" value="0x53100008" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55100800" />
+        <register type="NOA" address="0x00009888" value="0x57100008" />
+        <register type="NOA" address="0x00009888" value="0x49100808" />
+        <register type="NOA" address="0x00009888" value="0x4B100808" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+        <register type="OA" address="0x0000D970" value="0x00007800" />
+        <register type="OA" address="0x0000D974" value="0x0000F0FF" />
+        <register type="OA" address="0x0000DC30" value="0x00007800" />
+        <register type="OA" address="0x0000DC34" value="0x0000F0FF" />
+        <register type="OA" address="0x0000D978" value="0x00078000" />
+        <register type="OA" address="0x0000D97C" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC38" value="0x00078000" />
+        <register type="OA" address="0x0000DC3C" value="0x00000FFF" />
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
+       chipset="ADLP"
+       symbol_name="TDL_2"
+       underscore_name="tdl_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="7f826267-d18c-47bd-ad8b-11e175c32c67"
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
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice0 Thread Dispatcher"
+             symbol_name="PSThread00ReadyForDispatch"
+             underscore_name="ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice4 Thread Dispatcher"
+             symbol_name="PSThread04ReadyForDispatch"
+             underscore_name="ps_thread04_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice4 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice5 Thread Dispatcher"
+             symbol_name="PSThread05ReadyForDispatch"
+             underscore_name="ps_thread05_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice5 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice5 Thread Dispatcher"
+             symbol_name="ThreadHeader05Ready"
+             underscore_name="thread_header05_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice5 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice5 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader05ReadyPort0"
+             underscore_name="thread_header05_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice5 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice5 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader05ReadyPort1"
+             underscore_name="thread_header05_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice5 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice5 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader05ReadyPort2"
+             underscore_name="thread_header05_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice5 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice5 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader05ReadyPort3"
+             underscore_name="thread_header05_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice5 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 32 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x24110340" />
+        <register type="NOA" address="0x00009888" value="0x24310340" />
+        <register type="NOA" address="0x00009888" value="0x24510340" />
+        <register type="NOA" address="0x00009888" value="0x24710340" />
+        <register type="NOA" address="0x00009888" value="0x24910340" />
+        <register type="NOA" address="0x00009888" value="0x24B10340" />
+        <register type="NOA" address="0x00009888" value="0x26B1001C" />
+        <register type="NOA" address="0x00009888" value="0x1C07C000" />
+        <register type="NOA" address="0x00009888" value="0x2407002B" />
+        <register type="NOA" address="0x00009888" value="0x2207FF00" />
+        <register type="NOA" address="0x00009888" value="0x021100F3" />
+        <register type="NOA" address="0x00009888" value="0x041100F2" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x00110000" />
+        <register type="NOA" address="0x00009888" value="0x02128000" />
+        <register type="NOA" address="0x00009888" value="0x04128000" />
+        <register type="NOA" address="0x00009888" value="0x12138000" />
+        <register type="NOA" address="0x00009888" value="0x14138000" />
+        <register type="NOA" address="0x00009888" value="0x1C3100F3" />
+        <register type="NOA" address="0x00009888" value="0x1E3100F2" />
+        <register type="NOA" address="0x00009888" value="0x10310000" />
+        <register type="NOA" address="0x00009888" value="0x0E310000" />
+        <register type="NOA" address="0x00009888" value="0x1C328000" />
+        <register type="NOA" address="0x00009888" value="0x1E328000" />
+        <register type="NOA" address="0x00009888" value="0x1E330003" />
+        <register type="NOA" address="0x00009888" value="0x185100F3" />
+        <register type="NOA" address="0x00009888" value="0x1A5100F2" />
+        <register type="NOA" address="0x00009888" value="0x10510000" />
+        <register type="NOA" address="0x00009888" value="0x0C510000" />
+        <register type="NOA" address="0x00009888" value="0x18528000" />
+        <register type="NOA" address="0x00009888" value="0x1A528000" />
+        <register type="NOA" address="0x00009888" value="0x1C53C000" />
+        <register type="NOA" address="0x00009888" value="0x147100F3" />
+        <register type="NOA" address="0x00009888" value="0x167100F2" />
+        <register type="NOA" address="0x00009888" value="0x10710000" />
+        <register type="NOA" address="0x00009888" value="0x0A710000" />
+        <register type="NOA" address="0x00009888" value="0x14728000" />
+        <register type="NOA" address="0x00009888" value="0x16728000" />
+        <register type="NOA" address="0x00009888" value="0x1C733000" />
+        <register type="NOA" address="0x00009888" value="0x109100F3" />
+        <register type="NOA" address="0x00009888" value="0x129100F2" />
+        <register type="NOA" address="0x00009888" value="0x08910000" />
+        <register type="NOA" address="0x00009888" value="0x10928000" />
+        <register type="NOA" address="0x00009888" value="0x12928000" />
+        <register type="NOA" address="0x00009888" value="0x1C930C00" />
+        <register type="NOA" address="0x00009888" value="0x00B100F3" />
+        <register type="NOA" address="0x00009888" value="0x0EB100F2" />
+        <register type="NOA" address="0x00009888" value="0x06B10104" />
+        <register type="NOA" address="0x00009888" value="0x08B10105" />
+        <register type="NOA" address="0x00009888" value="0x0AB10106" />
+        <register type="NOA" address="0x00009888" value="0x0CB10107" />
+        <register type="NOA" address="0x00009888" value="0x10B10000" />
+        <register type="NOA" address="0x00009888" value="0x02B10000" />
+        <register type="NOA" address="0x00009888" value="0x04B10000" />
+        <register type="NOA" address="0x00009888" value="0x00B28000" />
+        <register type="NOA" address="0x00009888" value="0x0EB28000" />
+        <register type="NOA" address="0x00009888" value="0x06B28000" />
+        <register type="NOA" address="0x00009888" value="0x08B28000" />
+        <register type="NOA" address="0x00009888" value="0x0AB28000" />
+        <register type="NOA" address="0x00009888" value="0x0CB28000" />
+        <register type="NOA" address="0x00009888" value="0x10B38000" />
+        <register type="NOA" address="0x00009888" value="0x1CB30300" />
+        <register type="NOA" address="0x00009888" value="0x16B38000" />
+        <register type="NOA" address="0x00009888" value="0x18B38000" />
+        <register type="NOA" address="0x00009888" value="0x1AB38000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0028" />
+        <register type="NOA" address="0x00009888" value="0x14104000" />
+        <register type="NOA" address="0x00009888" value="0x16104000" />
+        <register type="NOA" address="0x00009888" value="0x2C024000" />
+        <register type="NOA" address="0x00009888" value="0x2E020001" />
+        <register type="NOA" address="0x00009888" value="0x2A03A500" />
+        <register type="NOA" address="0x00009888" value="0x18002000" />
+        <register type="NOA" address="0x00009888" value="0x36003249" />
+        <register type="NOA" address="0x00009888" value="0x380024DB" />
+        <register type="NOA" address="0x00009888" value="0x1A004000" />
+        <register type="NOA" address="0x00009888" value="0x1C004000" />
+        <register type="NOA" address="0x00009888" value="0x1E002000" />
+        <register type="NOA" address="0x00009888" value="0x34000900" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x1C012000" />
+        <register type="NOA" address="0x00009888" value="0x1E012000" />
+        <register type="NOA" address="0x00009888" value="0x06014000" />
+        <register type="NOA" address="0x00009888" value="0x08014000" />
+        <register type="NOA" address="0x00009888" value="0x0A014000" />
+        <register type="NOA" address="0x00009888" value="0x18012000" />
+        <register type="NOA" address="0x00009888" value="0x2405C000" />
+        <register type="NOA" address="0x00009888" value="0x26050003" />
+        <register type="NOA" address="0x00009888" value="0x220500A0" />
+        <register type="NOA" address="0x00009888" value="0x24062800" />
+        <register type="NOA" address="0x00009888" value="0x140A8000" />
+        <register type="NOA" address="0x00009888" value="0x160A8000" />
+        <register type="NOA" address="0x00009888" value="0x180A8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x17144000" />
+        <register type="NOA" address="0x00009888" value="0x1D14AAAA" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x01124000" />
+        <register type="NOA" address="0x00009888" value="0x0F124000" />
+        <register type="NOA" address="0x00009888" value="0x11124000" />
+        <register type="NOA" address="0x00009888" value="0x13124000" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x47100600" />
+        <register type="NOA" address="0x00009888" value="0x4D100606" />
+        <register type="NOA" address="0x00009888" value="0x4F100606" />
+        <register type="NOA" address="0x00009888" value="0x51100006" />
+        <register type="NOA" address="0x00009888" value="0x53100400" />
+        <register type="NOA" address="0x00009888" value="0x55100804" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100008" />
+        <register type="NOA" address="0x00009888" value="0x49100808" />
+        <register type="NOA" address="0x00009888" value="0x4B100606" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x70800000" />
+        <register type="OA" address="0x0000DC40" value="0x007F0000" />
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
+        <register type="OA" address="0x0000D970" value="0x00078000" />
+        <register type="OA" address="0x0000D974" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC30" value="0x00078000" />
+        <register type="OA" address="0x0000DC34" value="0x00000FFF" />
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
+       chipset="ADLP"
+       symbol_name="TDL_3"
+       underscore_name="tdl_3"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="ddfd2ac0-7b57-48af-82b0-3cf3d811845b"
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
+    <counter name="Thread Header Ready on Slice0 DualSubslice2 Thread Dispatcher"
+             symbol_name="ThreadHeader02Ready"
+             underscore_name="thread_header02_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice2 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice4 Thread Dispatcher"
+             symbol_name="ThreadHeader04Ready"
+             underscore_name="thread_header04_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice4 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
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
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 4 AND"
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
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 8 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice4 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader04ReadyPort0"
+             underscore_name="thread_header04_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice4 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice4 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader04ReadyPort1"
+             underscore_name="thread_header04_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice4 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice4 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader04ReadyPort2"
+             underscore_name="thread_header04_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice4 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice4 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader04ReadyPort3"
+             underscore_name="thread_header04_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice4 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 16 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x2651001C" />
+        <register type="NOA" address="0x00009888" value="0x2671001C" />
+        <register type="NOA" address="0x00009888" value="0x2691001C" />
+        <register type="NOA" address="0x00009888" value="0x24072A80" />
+        <register type="NOA" address="0x00009888" value="0x06510107" />
+        <register type="NOA" address="0x00009888" value="0x08510106" />
+        <register type="NOA" address="0x00009888" value="0x0A510105" />
+        <register type="NOA" address="0x00009888" value="0x0C510104" />
+        <register type="NOA" address="0x00009888" value="0x10510000" />
+        <register type="NOA" address="0x00009888" value="0x02510000" />
+        <register type="NOA" address="0x00009888" value="0x04510000" />
+        <register type="NOA" address="0x00009888" value="0x06528000" />
+        <register type="NOA" address="0x00009888" value="0x08528000" />
+        <register type="NOA" address="0x00009888" value="0x0A528000" />
+        <register type="NOA" address="0x00009888" value="0x0C528000" />
+        <register type="NOA" address="0x00009888" value="0x16538000" />
+        <register type="NOA" address="0x00009888" value="0x18538000" />
+        <register type="NOA" address="0x00009888" value="0x1A538000" />
+        <register type="NOA" address="0x00009888" value="0x1C530100" />
+        <register type="NOA" address="0x00009888" value="0x1C710107" />
+        <register type="NOA" address="0x00009888" value="0x1E710106" />
+        <register type="NOA" address="0x00009888" value="0x02710105" />
+        <register type="NOA" address="0x00009888" value="0x04710104" />
+        <register type="NOA" address="0x00009888" value="0x10710000" />
+        <register type="NOA" address="0x00009888" value="0x0E710000" />
+        <register type="NOA" address="0x00009888" value="0x00710000" />
+        <register type="NOA" address="0x00009888" value="0x1C728000" />
+        <register type="NOA" address="0x00009888" value="0x1E728000" />
+        <register type="NOA" address="0x00009888" value="0x02728000" />
+        <register type="NOA" address="0x00009888" value="0x04728000" />
+        <register type="NOA" address="0x00009888" value="0x1E730003" />
+        <register type="NOA" address="0x00009888" value="0x12738000" />
+        <register type="NOA" address="0x00009888" value="0x14738000" />
+        <register type="NOA" address="0x00009888" value="0x14910107" />
+        <register type="NOA" address="0x00009888" value="0x16910106" />
+        <register type="NOA" address="0x00009888" value="0x18910105" />
+        <register type="NOA" address="0x00009888" value="0x1A910104" />
+        <register type="NOA" address="0x00009888" value="0x10910000" />
+        <register type="NOA" address="0x00009888" value="0x0A910000" />
+        <register type="NOA" address="0x00009888" value="0x0C910000" />
+        <register type="NOA" address="0x00009888" value="0x14928000" />
+        <register type="NOA" address="0x00009888" value="0x16928000" />
+        <register type="NOA" address="0x00009888" value="0x18928000" />
+        <register type="NOA" address="0x00009888" value="0x1A928000" />
+        <register type="NOA" address="0x00009888" value="0x1C93F000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F2800" />
+        <register type="NOA" address="0x00009888" value="0x1C0F000A" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x02104000" />
+        <register type="NOA" address="0x00009888" value="0x04104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x02024000" />
+        <register type="NOA" address="0x00009888" value="0x04024000" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x02034000" />
+        <register type="NOA" address="0x00009888" value="0x04034000" />
+        <register type="NOA" address="0x00009888" value="0x06038000" />
+        <register type="NOA" address="0x00009888" value="0x08038000" />
+        <register type="NOA" address="0x00009888" value="0x0A038000" />
+        <register type="NOA" address="0x00009888" value="0x18034000" />
+        <register type="NOA" address="0x00009888" value="0x36001003" />
+        <register type="NOA" address="0x00009888" value="0x38003649" />
+        <register type="NOA" address="0x00009888" value="0x1A006000" />
+        <register type="NOA" address="0x00009888" value="0x1C006000" />
+        <register type="NOA" address="0x00009888" value="0x1E006000" />
+        <register type="NOA" address="0x00009888" value="0x34001B00" />
+        <register type="NOA" address="0x00009888" value="0x2A015500" />
+        <register type="NOA" address="0x00009888" value="0x2206AA00" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x020A8000" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5D101554" />
+        <register type="NOA" address="0x00009888" value="0x5B100555" />
+        <register type="NOA" address="0x00009888" value="0x1D14A80A" />
+        <register type="NOA" address="0x00009888" value="0x1F14002A" />
+        <register type="NOA" address="0x00009888" value="0x1B14AA00" />
+        <register type="NOA" address="0x00009888" value="0x15124000" />
+        <register type="NOA" address="0x00009888" value="0x17124000" />
+        <register type="NOA" address="0x00009888" value="0x19124000" />
+        <register type="NOA" address="0x00009888" value="0x1B124000" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x07124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D124000" />
+        <register type="NOA" address="0x00009888" value="0x51100600" />
+        <register type="NOA" address="0x00009888" value="0x53100606" />
+        <register type="NOA" address="0x00009888" value="0x55100006" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100404" />
+        <register type="NOA" address="0x00009888" value="0x4D100404" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x70800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00070000" />
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
+       chipset="ADLP"
+       symbol_name="GpuBusyness"
+       underscore_name="gpu_busyness"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="b3af5334-ed28-4e24-b6de-6f621e150eb5"
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
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
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
+    <counter name="Posh Ring Busy"
+             symbol_name="PoshEngineBusy"
+             underscore_name="posh_engine_busy"
+             description="The percentage of time when posh command streamer was busy."
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
+    <counter name="Blitter Ring Busy"
+             symbol_name="BlitterBusy"
+             underscore_name="blitter_busy"
+             description="The percentage of time when blitter command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vebox Ring Busy"
+             symbol_name="VeboxBusy"
+             underscore_name="vebox_busy"
+             description="The percentage of time when vebox command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox0 Ring Busy"
+             symbol_name="Vdbox0Busy"
+             underscore_name="vdbox0_busy"
+             description="The percentage of time when Vdbox0 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox1 Ring Busy"
+             symbol_name="Vdbox1Busy"
+             underscore_name="vdbox1_busy"
+             description="The percentage of time when Vdbox1 command streamer was busy."
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
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="Any Engine Busy"
+             symbol_name="AnyEngineBusy"
+             underscore_name="any_engine_busy"
+             description="The percentage of time when any command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x0E101200" />
+        <register type="NOA" address="0x00009888" value="0x040E0043" />
+        <register type="NOA" address="0x00009888" value="0x0A0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x0C0E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F0104" />
+        <register type="NOA" address="0x00009888" value="0x08100053" />
+        <register type="NOA" address="0x00009888" value="0x20100000" />
+        <register type="NOA" address="0x00009888" value="0x04104000" />
+        <register type="NOA" address="0x00009888" value="0x0A104000" />
+        <register type="NOA" address="0x00009888" value="0x04024000" />
+        <register type="NOA" address="0x00009888" value="0x08024000" />
+        <register type="NOA" address="0x00009888" value="0x0A024000" />
+        <register type="NOA" address="0x00009888" value="0x04034000" />
+        <register type="NOA" address="0x00009888" value="0x08034000" />
+        <register type="NOA" address="0x00009888" value="0x0A034000" />
+        <register type="NOA" address="0x00009888" value="0x1C006000" />
+        <register type="NOA" address="0x00009888" value="0x34001B00" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x15102400" />
+        <register type="NOA" address="0x00009888" value="0x23010120" />
+        <register type="NOA" address="0x00009888" value="0x15182400" />
+        <register type="NOA" address="0x00009888" value="0x23210120" />
+        <register type="NOA" address="0x00009888" value="0x17100023" />
+        <register type="NOA" address="0x00009888" value="0x11100000" />
+        <register type="NOA" address="0x00009888" value="0x5D101000" />
+        <register type="NOA" address="0x00009888" value="0x5B100545" />
+        <register type="NOA" address="0x00009888" value="0x1B148800" />
+        <register type="NOA" address="0x00009888" value="0x1D140002" />
+        <register type="NOA" address="0x00009888" value="0x61112000" />
+        <register type="NOA" address="0x00009888" value="0x5F110401" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05124000" />
+        <register type="NOA" address="0x00009888" value="0x09124000" />
+        <register type="NOA" address="0x00009888" value="0x0B124000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x01008000" />
+        <register type="NOA" address="0x00009888" value="0x13028000" />
+        <register type="NOA" address="0x00009888" value="0x030100D3" />
+        <register type="NOA" address="0x00009888" value="0x21010000" />
+        <register type="NOA" address="0x00009888" value="0x071800A3" />
+        <register type="NOA" address="0x00009888" value="0x11180000" />
+        <register type="NOA" address="0x00009888" value="0x21180400" />
+        <register type="NOA" address="0x00009888" value="0x23180000" />
+        <register type="NOA" address="0x00009888" value="0x0F208000" />
+        <register type="NOA" address="0x00009888" value="0x21222000" />
+        <register type="NOA" address="0x00009888" value="0x1F2100D3" />
+        <register type="NOA" address="0x00009888" value="0x21210000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49101007" />
+        <register type="NOA" address="0x00009888" value="0x4B10040A" />
+        <register type="NOA" address="0x00009888" value="0x4D100210" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00024002" />
+        <register type="OA" address="0x0000D944" value="0x0000B7FF" />
+        <register type="OA" address="0x0000DC00" value="0x00024002" />
+        <register type="OA" address="0x0000DC04" value="0x0000B7FF" />
+        <register type="OA" address="0x0000D948" value="0x0007F000" />
+        <register type="OA" address="0x0000D94C" value="0x000001FF" />
+        <register type="OA" address="0x0000DC08" value="0x0007F000" />
+        <register type="OA" address="0x0000DC0C" value="0x000001FF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity1"
+       underscore_name="eu_activity1"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="b65afe50-4e37-42f5-af5c-2d45c5d82c59"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a vertex shader instruction."
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
+    <counter name="PS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Send Pipe Active"
+             symbol_name="EuSendActive"
+             underscore_name="eu_send_active"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity2"
+       underscore_name="eu_activity2"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="91fadda5-5d16-4f31-a132-9c7c70afa3c4"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS EM Pipe Active"
+             symbol_name="CsEmActive"
+             underscore_name="cs_em_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU Pipe Active"
+             symbol_name="CsFpuActive"
+             underscore_name="cs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Send Pipeline Active"
+             symbol_name="CsSendActive"
+             underscore_name="cs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00862762" />
+        <register type="FLEX" address="0x0000E558" value="0x00A62962" />
+        <register type="FLEX" address="0x0000E658" value="0x00860760" />
+        <register type="FLEX" address="0x0000E758" value="0x00A60960" />
+        <register type="FLEX" address="0x0000E45C" value="0x00861761" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A61961" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity3"
+       chipset="ADLP"
+       symbol_name="EuActivity3"
+       underscore_name="eu_activity3"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="86775c09-faa5-4c25-83a0-31d085cc4959"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a vertex shader instruction."
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
+    <counter name="PS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS Send Pipeline Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity4"
+       underscore_name="eu_activity4"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="73bfba4e-13ce-4c8a-8bec-9b807dd63a97"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS FPU Pipe Active"
+             symbol_name="HsFpuActive"
+             underscore_name="hs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a hull shader instruction."
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
+             description="The percentage of time in which EU FPU pipeline was actively processing a domain shader instructions."
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity5"
+       underscore_name="eu_activity5"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="2f72b499-da58-4506-9098-c2487c98b8d8"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS EM Pipe Active"
+             symbol_name="HsEmActive"
+             underscore_name="hs_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a hull shader instructions."
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
+             description="The percentage of time in which EU EM pipeline was actively processing a domain shader instructions."
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity6"
+       underscore_name="eu_activity6"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="ee4d5a29-352b-4819-be54-ef4641803949"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS FPU Pipe Active"
+             symbol_name="GsFpuActive"
+             underscore_name="gs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a geometry shader instructions."
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
+             description="The percentage of time in which EU EM pipeline was actively processing a geometry shader instructions."
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity7"
+       underscore_name="eu_activity7"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="100bbf2f-a29f-44a9-83e8-3e38c34fea0c"
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
+             description="The percentage of time in which EU FPU pipeline was actively processing."
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
+             description="The percentage of time in which EU EM pipeline was actively processing."
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
+    <counter name="EU FPU And EM Pipes Active"
+             symbol_name="EuFpuEmActive"
+             underscore_name="eu_fpu_em_active"
+             description="The percentage of time in which EU FPU and EM pipelines were actively processing."
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD  A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD  A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FADD  A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD FSUB FDIV 1 FADD"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
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
+       chipset="ADLP"
+       symbol_name="EuActivity8"
+       underscore_name="eu_activity8"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="b09ea1d6-8b2a-4c9c-99ac-8f2e9bafe8af"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
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
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E1200" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1400" />
+        <register type="NOA" address="0x00009888" value="0x1C104000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020140" />
+        <register type="NOA" address="0x00009888" value="0x2C030005" />
+        <register type="NOA" address="0x00009888" value="0x38003600" />
+        <register type="NOA" address="0x00009888" value="0x1C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1F140028" />
+        <register type="NOA" address="0x00009888" value="0x1D124000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B101616" />
+        <register type="NOA" address="0x00009888" value="0x4D100616" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00832732" />
+        <register type="FLEX" address="0x0000E558" value="0x00A32932" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="ADLP"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="7d987d1c-efe6-4b8f-9ba9-a036ab09f676"
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
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x280E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0E0147" />
+        <register type="NOA" address="0x00009888" value="0x180E0000" />
+        <register type="NOA" address="0x00009888" value="0x160E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F1000" />
+        <register type="NOA" address="0x00009888" value="0x1E104000" />
+        <register type="NOA" address="0x00009888" value="0x2E020100" />
+        <register type="NOA" address="0x00009888" value="0x2C030004" />
+        <register type="NOA" address="0x00009888" value="0x38003000" />
+        <register type="NOA" address="0x00009888" value="0x1E0A8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x49110000" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x1F140020" />
+        <register type="NOA" address="0x00009888" value="0x1D1103B3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61110000" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F124000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100510" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
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
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index d38a7a95..b864374e 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -174,7 +174,7 @@ chipsets = [ 'hsw',
              'bxt', 'glk',
              'cnl',
              'icl', 'ehl',
-             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl' ]
+             'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl', 'adlp', ]
 
 for chipset in chipsets:
     filename = 'oa-' + chipset + '.xml'
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 9d5ab7a5..fd77e376 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -58,6 +58,7 @@
 #include "i915_perf_metrics_rkl.h"
 #include "i915_perf_metrics_dg1.h"
 #include "i915_perf_metrics_adl.h"
+#include "i915_perf_metrics_adlp.h"
 
 static int
 perf_ioctl(int fd, unsigned long request, void *arg)
@@ -279,6 +280,8 @@ intel_perf_for_devinfo(uint32_t device_id,
 		intel_perf_load_metrics_dg1(perf);
 	} else if (devinfo->is_alderlake_s) {
 		intel_perf_load_metrics_adl(perf);
+	} else if (devinfo->is_alderlake_p) {
+		intel_perf_load_metrics_adlp(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
 	}
diff --git a/lib/meson.build b/lib/meson.build
index 078a357b..e78f126d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -227,7 +227,7 @@ i915_perf_hardware = [
   'bxt', 'glk',
   'cnl',
   'icl', 'ehl',
-  'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl',
+  'tglgt1', 'tglgt2', 'rkl', 'dg1', 'adl', 'adlp',
 ]
 
 i915_xml_files = []
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
