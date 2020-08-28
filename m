Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2D16E4C5
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2020 11:17:17 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 28 Aug 2020 14:16:33 +0300
Message-Id: <20200828111634.147354-8-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200828111634.147354-1-lionel.g.landwerlin@intel.com>
References: <20200828111634.147354-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/8] lib/i915/perf: Add Rocketlake metrics
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
 lib/Makefile.am                            |    6 +-
 lib/i915/perf-configs/guids.xml            |   23 +
 lib/i915/perf-configs/mdapi-xml-convert.py |    1 +
 lib/i915/perf-configs/oa-rkl.xml           | 8520 ++++++++++++++++++++
 lib/i915/perf-configs/update-guids.py      |    2 +-
 lib/i915/perf.c                            |    3 +
 lib/meson.build                            |    2 +-
 7 files changed, 8554 insertions(+), 3 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-rkl.xml

diff --git a/lib/Makefile.am b/lib/Makefile.am
index 066ae6f5..d65c1a86 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -10,7 +10,7 @@ i915_perf_hardware =		\
 	bxt glk			\
 	cnl			\
 	icl ehl			\
-	tglgt1 tglgt2
+	tglgt1 tglgt2 rkl
 
 i915_perf_xml_files = $(i915_perf_hardware:%=i915/perf-configs/oa-%.xml)
 
@@ -99,6 +99,10 @@ i915_perf_generated_files = \
 	$(builddir)/i915/i915_perf_metrics_tglgt2.h \
 	$(builddir)/i915/i915_perf_registers_tglgt2.c \
 	$(builddir)/i915/i915_perf_registers_tglgt2.h \
+	$(builddir)/i915/i915_perf_metrics_rkl.c \
+	$(builddir)/i915/i915_perf_metrics_rkl.h \
+	$(builddir)/i915/i915_perf_registers_rkl.c \
+	$(builddir)/i915/i915_perf_registers_rkl.h \
 	$(builddir)/i915/i915_perf_equations.c \
 	$(builddir)/i915/i915_perf_equations.h
 
diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 169c7885..f3779dd9 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -356,4 +356,27 @@
     <guid config_hash="4e334e8ccb537e3a714cb772937895e6" mdapi_config_hash="f0417a67928b18d50e5c4a390ed6b58d" id="c0d2cd0a-e2be-4b12-916d-2f3aba0ebf9e" chipset="tglgt2" name="EuActivity7" />
     <guid config_hash="d1d8327895c6292ea720571bf6aec48d" mdapi_config_hash="13b16625e9e7842ec07dfe7f607be03e" id="1fbbd218-693c-4035-b4c0-ce4dd139d828" chipset="tglgt2" name="EuActivity8" />
     <guid config_hash="185673d9c229adff444a595e6c217439" mdapi_config_hash="51644bc87975e69064d0575227a663f9" id="6607f034-d053-40d1-8215-67c07f3041bb" chipset="tglgt2" name="TestOa" />
+    <guid config_hash="43974fb5727effcbe7778fd46549e772" mdapi_config_hash="fed843ee8147cb46213808401f33fb28" id="5b492c36-73f7-4827-83b3-c6863697ec51" chipset="rkl" name="RenderBasic" />
+    <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="09740672-ccc3-48da-a5bc-64994fe3a0a7" chipset="rkl" name="ComputeBasic" />
+    <guid config_hash="5995be9c351cc5e77549039adea73bee" mdapi_config_hash="54b1e569c3d867ae2ae1766d8fa7697c" id="833bb0f2-9483-498e-b3bf-ebf026a6301a" chipset="rkl" name="RenderPipeProfile" />
+    <guid config_hash="3755a62bd397702e10e938cace2a4057" mdapi_config_hash="e0f4181b0d3d62757992dacc4e320554" id="40ef13ef-25d9-4ac6-8582-ce97c47fc900" chipset="rkl" name="HDCAndSF" />
+    <guid config_hash="62d2b538c48884776e36a37640e3bfca" mdapi_config_hash="570d42139b6b0a5d2b706744eed05d55" id="bf60f7bd-9029-4edf-8311-f6e86599395e" chipset="rkl" name="RasterizerAndPixelBackend" />
+    <guid config_hash="5e5a0c2a907a663447e013fbf2942f28" mdapi_config_hash="04dd89759bb683e778c85633cf13bd37" id="a5f6ac3d-853f-42a4-a038-c4a09e8075be" chipset="rkl" name="L3_1" />
+    <guid config_hash="8d6ecccbe72202d243b499a226ee90f6" mdapi_config_hash="9a0750b2a700efa43693d980a91a0e56" id="bb080384-a01f-442f-8be2-3eae2c7394cd" chipset="rkl" name="L3_2" />
+    <guid config_hash="19b7a9b31c58cdcb0e2da74c0abbbf31" mdapi_config_hash="5ea0cfa8f861e9e8d60622a43a92056b" id="9f39ce80-0463-484e-b797-3135b7e0ab0a" chipset="rkl" name="L3_3" />
+    <guid config_hash="7f62b391293f3adc7e0c5310c1a15236" mdapi_config_hash="803b22a6409af4299c0173d75015b5e9" id="11e091e1-bbd3-4bd6-9ce8-8982d2d3a3b2" chipset="rkl" name="L3_4" />
+    <guid config_hash="65ef549987fa20f7e456753f65c96321" mdapi_config_hash="6f95252764fcb6f19a42056def00e8e5" id="0f2e1818-c190-494a-a828-2ed4422d71f3" chipset="rkl" name="L3_5" />
+    <guid config_hash="5381ff70169a742d68b883cafa9cea3a" mdapi_config_hash="72f8562f53ed845c9dd8c75ce6642614" id="ebd91ba3-4d01-4bdf-8752-384cd0a4e139" chipset="rkl" name="L3_6" />
+    <guid config_hash="d015fe311cb9c1e12da4b2138d9cdea0" mdapi_config_hash="acae891c97b089b79b8916cb9c92a88d" id="5102fa66-b5f3-45f2-a16d-0a13a4cbb6c9" chipset="rkl" name="Sampler_1" />
+    <guid config_hash="f0132b7b0e308361b88e5c74862d358a" mdapi_config_hash="8bddce2012f8f10a3412daf93ef64790" id="8706c725-7753-427d-ae2d-ba25c1168f2a" chipset="rkl" name="TDL_1" />
+    <guid config_hash="c3a06bbb1f4a892dc7f53f85ce47af86" mdapi_config_hash="e07187e4bd2744e8bf3e90e6fc40349a" id="3eab195e-e4d8-482e-9981-811935722b21" chipset="rkl" name="GpuBusyness" />
+    <guid config_hash="5432b2e81f0ee59fe0ce8fb0ed6467d5" mdapi_config_hash="772c61be685fcf2e6694eefdf6bb2496" id="100ae8ce-31c6-457f-97a2-dfd44812bce6" chipset="rkl" name="EuActivity1" />
+    <guid config_hash="58a0c1820e0cabd0f8243b582d748281" mdapi_config_hash="fbd4560cf3066e1ffa0bdab8d6c39b08" id="7e926c0a-471b-40b3-a641-75f3d73339ec" chipset="rkl" name="EuActivity2" />
+    <guid config_hash="6febae51d8bf17ec0338b6c1e0a1c464" mdapi_config_hash="565ccbe6a2d7fb7952cc4d109846ddc5" id="aca9005f-fafe-4d02-a9de-b2584ff76f04" chipset="rkl" name="EuActivity3" />
+    <guid config_hash="f8e7d2e615ec055ccce7f17c060510b3" mdapi_config_hash="55af344496e411184a53f184e551e846" id="ad96806d-7c0d-49f0-b844-c5010ade30af" chipset="rkl" name="EuActivity4" />
+    <guid config_hash="ae29f57cc010e1df3e54b2a4b26260da" mdapi_config_hash="b5e52e8b9a38f5283acad910759f4bf4" id="1669e79f-976e-47ba-a553-0a716ebd3c71" chipset="rkl" name="EuActivity5" />
+    <guid config_hash="b71717fe750ef661bd9fa449c8d31eed" mdapi_config_hash="3e6c988410dd5f72aec62e382876df70" id="d100e474-1e6c-4100-812b-71ec9cfe3523" chipset="rkl" name="EuActivity6" />
+    <guid config_hash="e22892f60cde8659f1232e841465d9a7" mdapi_config_hash="2b0bd788a4dd148293490faa4e4462cc" id="b22d38f6-a056-496a-8d7d-dede47051806" chipset="rkl" name="EuActivity7" />
+    <guid config_hash="adb6647fc3b2f89aaf0db2d7982aba41" mdapi_config_hash="b8374fb02e01d05ec140148aa6542d71" id="c68abf37-fe6e-45f6-9dcb-549b3fbef699" chipset="rkl" name="EuActivity8" />
+    <guid config_hash="6a817294a8e34c900d6aadd3ca02bec8" mdapi_config_hash="9c1e8e315564af8e3c6d3fcf8f2a2cac" id="74dbc739-d871-41b5-be7b-fb547ac5bec9" chipset="rkl" name="TestOa" />
 </guids>
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 1d36000e..2214c2de 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -125,6 +125,7 @@ chipsets = {
     'EHL': gen8_11_chipset_params,
     'TGLGT1': gen8_11_chipset_params,
     'TGLGT2': gen8_11_chipset_params,
+    'RKL': gen8_11_chipset_params,
 }
 
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
diff --git a/lib/i915/perf-configs/oa-rkl.xml b/lib/i915/perf-configs/oa-rkl.xml
new file mode 100644
index 00000000..0604289a
--- /dev/null
+++ b/lib/i915/perf-configs/oa-rkl.xml
@@ -0,0 +1,8520 @@
+<?xml version="1.0"?>
+<metrics version="1598357673" merge_md5="">
+  <set name="Render Metrics Basic Gen12"
+       chipset="RKL"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="5b492c36-73f7-4827-83b3-c6863697ec51"
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
+        <register type="NOA" address="0x00009888" value="0x000B4000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x100B4000" />
+        <register type="NOA" address="0x00009888" value="0x120B4000" />
+        <register type="NOA" address="0x00009888" value="0x100C8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C000E" />
+        <register type="NOA" address="0x00009888" value="0x040D4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0D8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0DC000" />
+        <register type="NOA" address="0x00009888" value="0x000E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x100E8000" />
+        <register type="NOA" address="0x00009888" value="0x120E8000" />
+        <register type="NOA" address="0x00009888" value="0x000F4000" />
+        <register type="NOA" address="0x00009888" value="0x060F8000" />
+        <register type="NOA" address="0x00009888" value="0x080FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D47" />
+        <register type="NOA" address="0x00009888" value="0x09151536" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110001" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
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
+        <register type="NOA" address="0x00009888" value="0x55101810" />
+        <register type="NOA" address="0x00009888" value="0x57100008" />
+        <register type="NOA" address="0x00009888" value="0x49101818" />
+        <register type="NOA" address="0x00009888" value="0x4B100818" />
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
+       chipset="RKL"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="09740672-ccc3-48da-a5bc-64994fe3a0a7"
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
+       chipset="RKL"
+       symbol_name="RenderPipeProfile"
+       underscore_name="render_pipe_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="833bb0f2-9483-498e-b3bf-ebf026a6301a"
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
+        <register type="NOA" address="0x00009888" value="0x140B7C00" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x120C0320" />
+        <register type="NOA" address="0x00009888" value="0x040D3E00" />
+        <register type="NOA" address="0x00009888" value="0x000D0000" />
+        <register type="NOA" address="0x00009888" value="0x280D0000" />
+        <register type="NOA" address="0x00009888" value="0x2A0E03E0" />
+        <register type="NOA" address="0x00009888" value="0x10087C00" />
+        <register type="NOA" address="0x00009888" value="0x1E120002" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x1E130002" />
+        <register type="NOA" address="0x00009888" value="0x0E0B0031" />
+        <register type="NOA" address="0x00009888" value="0x180B0092" />
+        <register type="NOA" address="0x00009888" value="0x1A0B00B1" />
+        <register type="NOA" address="0x00009888" value="0x020B0093" />
+        <register type="NOA" address="0x00009888" value="0x040B0033" />
+        <register type="NOA" address="0x00009888" value="0x200B0000" />
+        <register type="NOA" address="0x00009888" value="0x100B4000" />
+        <register type="NOA" address="0x00009888" value="0x120B8000" />
+        <register type="NOA" address="0x00009888" value="0x160B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x080B4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0C0022" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0325" />
+        <register type="NOA" address="0x00009888" value="0x180C8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0C8000" />
+        <register type="NOA" address="0x00009888" value="0x100D0017" />
+        <register type="NOA" address="0x00009888" value="0x160D0013" />
+        <register type="NOA" address="0x00009888" value="0x1C0D0081" />
+        <register type="NOA" address="0x00009888" value="0x080D0082" />
+        <register type="NOA" address="0x00009888" value="0x0A0D4102" />
+        <register type="NOA" address="0x00009888" value="0x140D0000" />
+        <register type="NOA" address="0x00009888" value="0x0C0D0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0D0000" />
+        <register type="NOA" address="0x00009888" value="0x120D8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0E0215" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0F8000" />
+        <register type="NOA" address="0x00009888" value="0x060F4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x08081000" />
+        <register type="NOA" address="0x00009888" value="0x16080000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x5F115555" />
+        <register type="NOA" address="0x00009888" value="0x61111555" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x4D101408" />
+        <register type="NOA" address="0x00009888" value="0x4F100801" />
+        <register type="NOA" address="0x00009888" value="0x51100A08" />
+        <register type="NOA" address="0x00009888" value="0x53101118" />
+        <register type="NOA" address="0x00009888" value="0x55100801" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101111" />
+        <register type="NOA" address="0x00009888" value="0x4B100801" />
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
+       chipset="RKL"
+       symbol_name="HDCAndSF"
+       underscore_name="hdc_and_sf"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="40ef13ef-25d9-4ac6-8582-ce97c47fc900"
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
+    <counter name="Polygon Data Ready"
+             symbol_name="PolyDataReady"
+             underscore_name="poly_data_ready"
+             description="The percentage of time in which geometry pipeline output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
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
+        <register type="NOA" address="0x00009888" value="0x240A0019" />
+        <register type="NOA" address="0x00009888" value="0x00110074" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x00128000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x0E310074" />
+        <register type="NOA" address="0x00009888" value="0x10310000" />
+        <register type="NOA" address="0x00009888" value="0x06310000" />
+        <register type="NOA" address="0x00009888" value="0x0E328000" />
+        <register type="NOA" address="0x00009888" value="0x1C330200" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x000B4000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B8000" />
+        <register type="NOA" address="0x00009888" value="0x100B8000" />
+        <register type="NOA" address="0x00009888" value="0x100C8000" />
+        <register type="NOA" address="0x00009888" value="0x040D4000" />
+        <register type="NOA" address="0x00009888" value="0x000E8000" />
+        <register type="NOA" address="0x00009888" value="0x000F4000" />
+        <register type="NOA" address="0x00009888" value="0x100A00F7" />
+        <register type="NOA" address="0x00009888" value="0x140A0000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A0000" />
+        <register type="NOA" address="0x00009888" value="0x0E084000" />
+        <register type="NOA" address="0x00009888" value="0x14092000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100110" />
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
+        <register type="OA" address="0x0000D904" value="0x70800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00070000" />
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
+       chipset="RKL"
+       symbol_name="RasterizerAndPixelBackend"
+       underscore_name="rasterizer_and_pixel_backend"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="bf60f7bd-9029-4edf-8311-f6e86599395e"
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
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x1E055000" />
+        <register type="NOA" address="0x00009888" value="0x1A0500C0" />
+        <register type="NOA" address="0x00009888" value="0x2A0A7300" />
+        <register type="NOA" address="0x00009888" value="0x2C0A0000" />
+        <register type="NOA" address="0x00009888" value="0x120800A0" />
+        <register type="NOA" address="0x00009888" value="0x04052700" />
+        <register type="NOA" address="0x00009888" value="0x060500C0" />
+        <register type="NOA" address="0x00009888" value="0x22050000" />
+        <register type="NOA" address="0x00009888" value="0x1C050000" />
+        <register type="NOA" address="0x00009888" value="0x000B8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B8000" />
+        <register type="NOA" address="0x00009888" value="0x100B8000" />
+        <register type="NOA" address="0x00009888" value="0x120B8000" />
+        <register type="NOA" address="0x00009888" value="0x140B8000" />
+        <register type="NOA" address="0x00009888" value="0x080B8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B8000" />
+        <register type="NOA" address="0x00009888" value="0x000A0144" />
+        <register type="NOA" address="0x00009888" value="0x0E0A4145" />
+        <register type="NOA" address="0x00009888" value="0x100A0156" />
+        <register type="NOA" address="0x00009888" value="0x080A814F" />
+        <register type="NOA" address="0x00009888" value="0x140A0000" />
+        <register type="NOA" address="0x00009888" value="0x040A0000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A8000" />
+        <register type="NOA" address="0x00009888" value="0x08081980" />
+        <register type="NOA" address="0x00009888" value="0x0A084032" />
+        <register type="NOA" address="0x00009888" value="0x10080000" />
+        <register type="NOA" address="0x00009888" value="0x16080000" />
+        <register type="NOA" address="0x00009888" value="0x0C084000" />
+        <register type="NOA" address="0x00009888" value="0x14091800" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x31152800" />
+        <register type="NOA" address="0x00009888" value="0x331500A0" />
+        <register type="NOA" address="0x00009888" value="0x31352800" />
+        <register type="NOA" address="0x00009888" value="0x333500A0" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B10556B" />
+        <register type="NOA" address="0x00009888" value="0x5D103005" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115540" />
+        <register type="NOA" address="0x00009888" value="0x61110005" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x05150096" />
+        <register type="NOA" address="0x00009888" value="0x07150016" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x0316C000" />
+        <register type="NOA" address="0x00009888" value="0x1F350096" />
+        <register type="NOA" address="0x00009888" value="0x03350016" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x0F368000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x47101600" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100606" />
+        <register type="NOA" address="0x00009888" value="0x51100404" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55101000" />
+        <register type="NOA" address="0x00009888" value="0x57100002" />
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B100602" />
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
+       chipset="RKL"
+       symbol_name="L3_1"
+       underscore_name="l3_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="a5f6ac3d-853f-42a4-a038-c4a09e8075be"
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
+             equation="C 0 READ C 1 READ FADD C 2 READ FADD C 3 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="C 4 READ C 5 READ FADD C 6 READ FADD C 7 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
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
+        <register type="NOA" address="0x00009888" value="0x04002024" />
+        <register type="NOA" address="0x00009888" value="0x0600282F" />
+        <register type="NOA" address="0x00009888" value="0x1C0B8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B8000" />
+        <register type="NOA" address="0x00009888" value="0x020B8000" />
+        <register type="NOA" address="0x00009888" value="0x040B8000" />
+        <register type="NOA" address="0x00009888" value="0x060B8000" />
+        <register type="NOA" address="0x00009888" value="0x080B8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B8000" />
+        <register type="NOA" address="0x00009888" value="0x120AC000" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x060AC000" />
+        <register type="NOA" address="0x00009888" value="0x080AC000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A4000" />
+        <register type="NOA" address="0x00009888" value="0x1608A000" />
+        <register type="NOA" address="0x00009888" value="0x02088000" />
+        <register type="NOA" address="0x00009888" value="0x04088000" />
+        <register type="NOA" address="0x00009888" value="0x06088000" />
+        <register type="NOA" address="0x00009888" value="0x08088000" />
+        <register type="NOA" address="0x00009888" value="0x0A088000" />
+        <register type="NOA" address="0x00009888" value="0x0C088000" />
+        <register type="NOA" address="0x00009888" value="0x1C000027" />
+        <register type="NOA" address="0x00009888" value="0x1E000026" />
+        <register type="NOA" address="0x00009888" value="0x02000025" />
+        <register type="NOA" address="0x00009888" value="0x0800002E" />
+        <register type="NOA" address="0x00009888" value="0x0A00002D" />
+        <register type="NOA" address="0x00009888" value="0x0C00002C" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100555" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x5F110555" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
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
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_2"
+       chipset="RKL"
+       symbol_name="L3_2"
+       underscore_name="l3_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="bb080384-a01f-442f-8be2-3eae2c7394cd"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04003000" />
+        <register type="NOA" address="0x00009888" value="0x06003800" />
+        <register type="NOA" address="0x00009888" value="0x000B8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B8000" />
+        <register type="NOA" address="0x00009888" value="0x100B8000" />
+        <register type="NOA" address="0x00009888" value="0x120B8000" />
+        <register type="NOA" address="0x00009888" value="0x140B8000" />
+        <register type="NOA" address="0x00009888" value="0x160B8000" />
+        <register type="NOA" address="0x00009888" value="0x180B8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0B8000" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0AC000" />
+        <register type="NOA" address="0x00009888" value="0x0E0AC000" />
+        <register type="NOA" address="0x00009888" value="0x100AC000" />
+        <register type="NOA" address="0x00009888" value="0x00088000" />
+        <register type="NOA" address="0x00009888" value="0x0E088000" />
+        <register type="NOA" address="0x00009888" value="0x16080AAA" />
+        <register type="NOA" address="0x00009888" value="0x00000024" />
+        <register type="NOA" address="0x00009888" value="0x0E000025" />
+        <register type="NOA" address="0x00009888" value="0x10000026" />
+        <register type="NOA" address="0x00009888" value="0x12000027" />
+        <register type="NOA" address="0x00009888" value="0x1400002C" />
+        <register type="NOA" address="0x00009888" value="0x1600002D" />
+        <register type="NOA" address="0x00009888" value="0x1800002E" />
+        <register type="NOA" address="0x00009888" value="0x1A00002F" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009888" value="0x2C000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x5D100155" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110155" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x53100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
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
+       chipset="RKL"
+       symbol_name="L3_3"
+       underscore_name="l3_3"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="9f39ce80-0463-484e-b797-3135b7e0ab0a"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04000200" />
+        <register type="NOA" address="0x00009888" value="0x06000000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B8000" />
+        <register type="NOA" address="0x00009888" value="0x080A8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A088000" />
+        <register type="NOA" address="0x00009888" value="0x0C088000" />
+        <register type="NOA" address="0x00009888" value="0x0A000020" />
+        <register type="NOA" address="0x00009888" value="0x0C000028" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100500" />
+        <register type="NOA" address="0x00009888" value="0x5F110500" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
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
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_4"
+       chipset="RKL"
+       symbol_name="L3_4"
+       underscore_name="l3_4"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="11e091e1-bbd3-4bd6-9ce8-8982d2d3a3b2"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04000A00" />
+        <register type="NOA" address="0x00009888" value="0x06000820" />
+        <register type="NOA" address="0x00009888" value="0x060B8000" />
+        <register type="NOA" address="0x00009888" value="0x080B8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A4000" />
+        <register type="NOA" address="0x00009888" value="0x06088000" />
+        <register type="NOA" address="0x00009888" value="0x08088000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
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
+       chipset="RKL"
+       symbol_name="L3_5"
+       underscore_name="l3_5"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="0f2e1818-c190-494a-a828-2ed4422d71f3"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04001200" />
+        <register type="NOA" address="0x00009888" value="0x06001020" />
+        <register type="NOA" address="0x00009888" value="0x060B8000" />
+        <register type="NOA" address="0x00009888" value="0x080B8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A4000" />
+        <register type="NOA" address="0x00009888" value="0x06088000" />
+        <register type="NOA" address="0x00009888" value="0x08088000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
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
+       chipset="RKL"
+       symbol_name="L3_6"
+       underscore_name="l3_6"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="ebd91ba3-4d01-4bdf-8752-384cd0a4e139"
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
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04001A00" />
+        <register type="NOA" address="0x00009888" value="0x06001820" />
+        <register type="NOA" address="0x00009888" value="0x060B8000" />
+        <register type="NOA" address="0x00009888" value="0x080B8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080A4000" />
+        <register type="NOA" address="0x00009888" value="0x06088000" />
+        <register type="NOA" address="0x00009888" value="0x08088000" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x2E000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
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
+       chipset="RKL"
+       symbol_name="Sampler_1"
+       underscore_name="sampler_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="5102fa66-b5f3-45f2-a16d-0a13a4cbb6c9"
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
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
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
+        <register type="NOA" address="0x00009888" value="0x1C121600" />
+        <register type="NOA" address="0x00009888" value="0x04143E00" />
+        <register type="NOA" address="0x00009888" value="0x18141613" />
+        <register type="NOA" address="0x00009888" value="0x0C323E00" />
+        <register type="NOA" address="0x00009888" value="0x1C321600" />
+        <register type="NOA" address="0x00009888" value="0x04343E00" />
+        <register type="NOA" address="0x00009888" value="0x18341600" />
+        <register type="NOA" address="0x00009888" value="0x0E120086" />
+        <register type="NOA" address="0x00009888" value="0x1A120033" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x18124000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C13C200" />
+        <register type="NOA" address="0x00009888" value="0x001400A6" />
+        <register type="NOA" address="0x00009888" value="0x10140000" />
+        <register type="NOA" address="0x00009888" value="0x0C140000" />
+        <register type="NOA" address="0x00009888" value="0x18158000" />
+        <register type="NOA" address="0x00009888" value="0x1C150800" />
+        <register type="NOA" address="0x00009888" value="0x12320086" />
+        <register type="NOA" address="0x00009888" value="0x16320033" />
+        <register type="NOA" address="0x00009888" value="0x20320000" />
+        <register type="NOA" address="0x00009888" value="0x10324000" />
+        <register type="NOA" address="0x00009888" value="0x14324000" />
+        <register type="NOA" address="0x00009888" value="0x1C333C00" />
+        <register type="NOA" address="0x00009888" value="0x103400A6" />
+        <register type="NOA" address="0x00009888" value="0x14340013" />
+        <register type="NOA" address="0x00009888" value="0x08340000" />
+        <register type="NOA" address="0x00009888" value="0x0A340000" />
+        <register type="NOA" address="0x00009888" value="0x1C350088" />
+        <register type="NOA" address="0x00009888" value="0x220500F0" />
+        <register type="NOA" address="0x00009888" value="0x000B4000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x100B8000" />
+        <register type="NOA" address="0x00009888" value="0x120B8000" />
+        <register type="NOA" address="0x00009888" value="0x140B8000" />
+        <register type="NOA" address="0x00009888" value="0x160B8000" />
+        <register type="NOA" address="0x00009888" value="0x180B4000" />
+        <register type="NOA" address="0x00009888" value="0x1A0B4000" />
+        <register type="NOA" address="0x00009888" value="0x100C8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C00C2" />
+        <register type="NOA" address="0x00009888" value="0x040D4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0D8000" />
+        <register type="NOA" address="0x00009888" value="0x100DC000" />
+        <register type="NOA" address="0x00009888" value="0x000E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x180E8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0E8000" />
+        <register type="NOA" address="0x00009888" value="0x000F4000" />
+        <register type="NOA" address="0x00009888" value="0x060F8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0FC000" />
+        <register type="NOA" address="0x00009888" value="0x0C0AC000" />
+        <register type="NOA" address="0x00009888" value="0x0E0AC000" />
+        <register type="NOA" address="0x00009888" value="0x16080055" />
+        <register type="NOA" address="0x00009888" value="0x1409C000" />
+        <register type="NOA" address="0x00009888" value="0x16090003" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x5D100155" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110155" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100004" />
+        <register type="NOA" address="0x00009888" value="0x51100004" />
+        <register type="NOA" address="0x00009888" value="0x53100004" />
+        <register type="NOA" address="0x00009888" value="0x55100004" />
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
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x000F0000" />
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
+       chipset="RKL"
+       symbol_name="TDL_1"
+       underscore_name="tdl_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="8706c725-7753-427d-ae2d-ba25c1168f2a"
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
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
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
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="ThreadHeader00Ready"
+             underscore_name="thread_header00_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
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
+        <register type="NOA" address="0x00009888" value="0x24110340" />
+        <register type="NOA" address="0x00009888" value="0x2611001C" />
+        <register type="NOA" address="0x00009888" value="0x24310340" />
+        <register type="NOA" address="0x00009888" value="0x2631001C" />
+        <register type="NOA" address="0x00009888" value="0x001100F3" />
+        <register type="NOA" address="0x00009888" value="0x0E1100F2" />
+        <register type="NOA" address="0x00009888" value="0x16110103" />
+        <register type="NOA" address="0x00009888" value="0x06110107" />
+        <register type="NOA" address="0x00009888" value="0x08110106" />
+        <register type="NOA" address="0x00009888" value="0x0A110105" />
+        <register type="NOA" address="0x00009888" value="0x0C110104" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x02110000" />
+        <register type="NOA" address="0x00009888" value="0x04110000" />
+        <register type="NOA" address="0x00009888" value="0x00128000" />
+        <register type="NOA" address="0x00009888" value="0x0E128000" />
+        <register type="NOA" address="0x00009888" value="0x16128000" />
+        <register type="NOA" address="0x00009888" value="0x06128000" />
+        <register type="NOA" address="0x00009888" value="0x08128000" />
+        <register type="NOA" address="0x00009888" value="0x0A128000" />
+        <register type="NOA" address="0x00009888" value="0x0C128000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C132300" />
+        <register type="NOA" address="0x00009888" value="0x16138000" />
+        <register type="NOA" address="0x00009888" value="0x18138000" />
+        <register type="NOA" address="0x00009888" value="0x1A138000" />
+        <register type="NOA" address="0x00009888" value="0x103100F3" />
+        <register type="NOA" address="0x00009888" value="0x123100F2" />
+        <register type="NOA" address="0x00009888" value="0x14310103" />
+        <register type="NOA" address="0x00009888" value="0x1C310107" />
+        <register type="NOA" address="0x00009888" value="0x1E310106" />
+        <register type="NOA" address="0x00009888" value="0x02310105" />
+        <register type="NOA" address="0x00009888" value="0x04310104" />
+        <register type="NOA" address="0x00009888" value="0x08310000" />
+        <register type="NOA" address="0x00009888" value="0x0A310000" />
+        <register type="NOA" address="0x00009888" value="0x0E310000" />
+        <register type="NOA" address="0x00009888" value="0x00310000" />
+        <register type="NOA" address="0x00009888" value="0x10328000" />
+        <register type="NOA" address="0x00009888" value="0x12328000" />
+        <register type="NOA" address="0x00009888" value="0x14328000" />
+        <register type="NOA" address="0x00009888" value="0x1C328000" />
+        <register type="NOA" address="0x00009888" value="0x1E328000" />
+        <register type="NOA" address="0x00009888" value="0x02328000" />
+        <register type="NOA" address="0x00009888" value="0x04328000" />
+        <register type="NOA" address="0x00009888" value="0x1C331C00" />
+        <register type="NOA" address="0x00009888" value="0x1E330003" />
+        <register type="NOA" address="0x00009888" value="0x12338000" />
+        <register type="NOA" address="0x00009888" value="0x14338000" />
+        <register type="NOA" address="0x00009888" value="0x22050C70" />
+        <register type="NOA" address="0x00009888" value="0x12058000" />
+        <register type="NOA" address="0x00009888" value="0x14058000" />
+        <register type="NOA" address="0x00009888" value="0x000B4000" />
+        <register type="NOA" address="0x00009888" value="0x0E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x100B8000" />
+        <register type="NOA" address="0x00009888" value="0x120B8000" />
+        <register type="NOA" address="0x00009888" value="0x140B8000" />
+        <register type="NOA" address="0x00009888" value="0x160B4000" />
+        <register type="NOA" address="0x00009888" value="0x1C0B8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B8000" />
+        <register type="NOA" address="0x00009888" value="0x020B8000" />
+        <register type="NOA" address="0x00009888" value="0x040B8000" />
+        <register type="NOA" address="0x00009888" value="0x060B4000" />
+        <register type="NOA" address="0x00009888" value="0x080B4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x100C8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0023" />
+        <register type="NOA" address="0x00009888" value="0x160C8000" />
+        <register type="NOA" address="0x00009888" value="0x180C8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0C8000" />
+        <register type="NOA" address="0x00009888" value="0x040D4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0DC000" />
+        <register type="NOA" address="0x00009888" value="0x0E0D8000" />
+        <register type="NOA" address="0x00009888" value="0x060D8000" />
+        <register type="NOA" address="0x00009888" value="0x080DC000" />
+        <register type="NOA" address="0x00009888" value="0x000E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x160E8000" />
+        <register type="NOA" address="0x00009888" value="0x060E8000" />
+        <register type="NOA" address="0x00009888" value="0x080E8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0E8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0E8000" />
+        <register type="NOA" address="0x00009888" value="0x000F4000" />
+        <register type="NOA" address="0x00009888" value="0x060FC000" />
+        <register type="NOA" address="0x00009888" value="0x0A0F8000" />
+        <register type="NOA" address="0x00009888" value="0x020F8000" />
+        <register type="NOA" address="0x00009888" value="0x040FC000" />
+        <register type="NOA" address="0x00009888" value="0x0C0AC000" />
+        <register type="NOA" address="0x00009888" value="0x0E0A4000" />
+        <register type="NOA" address="0x00009888" value="0x120AC000" />
+        <register type="NOA" address="0x00009888" value="0x040A8000" />
+        <register type="NOA" address="0x00009888" value="0x060A4000" />
+        <register type="NOA" address="0x00009888" value="0x16085015" />
+        <register type="NOA" address="0x00009888" value="0x02084000" />
+        <register type="NOA" address="0x00009888" value="0x04084000" />
+        <register type="NOA" address="0x00009888" value="0x1409C180" />
+        <register type="NOA" address="0x00009888" value="0x16090031" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101415" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115555" />
+        <register type="NOA" address="0x00009888" value="0x61111415" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x53100000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
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
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x30800000" />
+        <register type="OA" address="0x0000DC40" value="0x003F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000000" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000000" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000000" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000000" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC10" value="0x00000002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D958" value="0x00000002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000DC18" value="0x00000002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000D960" value="0x00078000" />
+        <register type="OA" address="0x0000D964" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC20" value="0x00078000" />
+        <register type="OA" address="0x0000DC24" value="0x00000FFF" />
+        <register type="OA" address="0x0000D968" value="0x00007800" />
+        <register type="OA" address="0x0000D96C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000DC28" value="0x00007800" />
+        <register type="OA" address="0x0000DC2C" value="0x0000F0FF" />
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
+       chipset="RKL"
+       symbol_name="GpuBusyness"
+       underscore_name="gpu_busyness"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="3eab195e-e4d8-482e-9981-811935722b21"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x220F0009" />
+        <register type="NOA" address="0x00009888" value="0x040B4000" />
+        <register type="NOA" address="0x00009888" value="0x080B4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0B4000" />
+        <register type="NOA" address="0x00009888" value="0x140C8000" />
+        <register type="NOA" address="0x00009888" value="0x180C8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0C8000" />
+        <register type="NOA" address="0x00009888" value="0x060D4000" />
+        <register type="NOA" address="0x00009888" value="0x080DC000" />
+        <register type="NOA" address="0x00009888" value="0x040E0043" />
+        <register type="NOA" address="0x00009888" value="0x0A0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x080F00A3" />
+        <register type="NOA" address="0x00009888" value="0x100F0000" />
+        <register type="NOA" address="0x00009888" value="0x020F4000" />
+        <register type="NOA" address="0x00009888" value="0x040F8000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x15102400" />
+        <register type="NOA" address="0x00009888" value="0x230B0120" />
+        <register type="NOA" address="0x00009888" value="0x15182400" />
+        <register type="NOA" address="0x00009888" value="0x17100023" />
+        <register type="NOA" address="0x00009888" value="0x11100000" />
+        <register type="NOA" address="0x00009888" value="0x5D101000" />
+        <register type="NOA" address="0x00009888" value="0x5B100544" />
+        <register type="NOA" address="0x00009888" value="0x61112000" />
+        <register type="NOA" address="0x00009888" value="0x5F110944" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x1B0D0040" />
+        <register type="NOA" address="0x00009888" value="0x0D0DC000" />
+        <register type="NOA" address="0x00009888" value="0x1F0B00D3" />
+        <register type="NOA" address="0x00009888" value="0x190B0000" />
+        <register type="NOA" address="0x00009888" value="0x170B0000" />
+        <register type="NOA" address="0x00009888" value="0x07174000" />
+        <register type="NOA" address="0x00009888" value="0x071800A3" />
+        <register type="NOA" address="0x00009888" value="0x11180000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x5710000A" />
+        <register type="NOA" address="0x00009888" value="0x49101000" />
+        <register type="NOA" address="0x00009888" value="0x4B100206" />
+        <register type="NOA" address="0x00009888" value="0x4D100800" />
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
+        <register type="OA" address="0x0000D948" value="0x0007D000" />
+        <register type="OA" address="0x0000D94C" value="0x000005FF" />
+        <register type="OA" address="0x0000DC08" value="0x0007D000" />
+        <register type="OA" address="0x0000DC0C" value="0x000005FF" />
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
+       chipset="RKL"
+       symbol_name="EuActivity1"
+       underscore_name="eu_activity1"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="100ae8ce-31c6-457f-97a2-dfd44812bce6"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity2"
+       underscore_name="eu_activity2"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="7e926c0a-471b-40b3-a641-75f3d73339ec"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity3"
+       underscore_name="eu_activity3"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="aca9005f-fafe-4d02-a9de-b2584ff76f04"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity4"
+       underscore_name="eu_activity4"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="ad96806d-7c0d-49f0-b844-c5010ade30af"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity5"
+       underscore_name="eu_activity5"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="1669e79f-976e-47ba-a553-0a716ebd3c71"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity6"
+       underscore_name="eu_activity6"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="d100e474-1e6c-4100-812b-71ec9cfe3523"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity7"
+       underscore_name="eu_activity7"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="b22d38f6-a056-496a-8d7d-dede47051806"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="EuActivity8"
+       underscore_name="eu_activity8"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="c68abf37-fe6e-45f6-9dcb-549b3fbef699"
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
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0300" />
+        <register type="NOA" address="0x00009888" value="0x120DC000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0FC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
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
+        <register type="NOA" address="0x00009888" value="0x49101212" />
+        <register type="NOA" address="0x00009888" value="0x4B101212" />
+        <register type="NOA" address="0x00009888" value="0x4D100212" />
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
+       chipset="RKL"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="74dbc739-d871-41b5-be7b-fb547ac5bec9"
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
+        <register type="NOA" address="0x00009888" value="0x040F0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0C0200" />
+        <register type="NOA" address="0x00009888" value="0x120D8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0017" />
+        <register type="NOA" address="0x00009888" value="0x100F0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0F0000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x49110000" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x1D1103A3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61111000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100110" />
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
index 31f6e3e7..909a7ac4 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -174,7 +174,7 @@ chipsets = [ 'hsw',
              'bxt', 'glk',
              'cnl',
              'icl', 'ehl',
-             'tglgt1', 'tglgt2' ]
+             'tglgt1', 'tglgt2', 'rkl' ]
 
 for chipset in chipsets:
     filename = 'oa-' + chipset + '.xml'
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ea4a527b..1f97603e 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -55,6 +55,7 @@
 #include "i915_perf_metrics_ehl.h"
 #include "i915_perf_metrics_tglgt1.h"
 #include "i915_perf_metrics_tglgt2.h"
+#include "i915_perf_metrics_rkl.h"
 
 static int
 perf_ioctl(int fd, unsigned long request, void *arg)
@@ -264,6 +265,8 @@ intel_perf_for_devinfo(uint32_t device_id,
 		default:
 			unsupported_i915_perf_platform(perf);
 		}
+	} else if (devinfo->is_rocketlake) {
+		intel_perf_load_metrics_rkl(perf);
 	} else {
 		return unsupported_i915_perf_platform(perf);
 	}
diff --git a/lib/meson.build b/lib/meson.build
index 34184d53..3a9a1aeb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -205,7 +205,7 @@ i915_perf_hardware = [
   'bxt', 'glk',
   'cnl',
   'icl', 'ehl',
-  'tglgt1', 'tglgt2',
+  'tglgt1', 'tglgt2', 'rkl',
 ]
 
 i915_xml_files = []
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
