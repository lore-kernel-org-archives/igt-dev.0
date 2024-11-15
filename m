Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E5AD6A227
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 02:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835210E131;
	Fri, 15 Nov 2024 02:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEC6LVk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125710E131
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731637237; x=1763173237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TAssWyrnYYNbS90aN7Jvthu+1myuegZiZEXRuR4xMH4=;
 b=ZEC6LVk8MGWDmuDPanTbF4GpJPHbP0mJkusSsUOX5nnINTjxwmiUNOqA
 82KXR77yVuoCvWY4YSaOzU0FpJMU4Xny6e8TxMHP7a6/teoQRJwDuBIz6
 ixIXQ7oW9QUSZMZ6Xkl76DhfYR5MX+JcpqRdhxxyMTwgtzylVIaZcleOS
 7dX+5N1QlyMu34JXBNnh6SquVfuxZ7yaSd7v/DdKn7Tu0Jd+WJLFdGfNG
 lFaK+RqSTMGJlsZHpOJ46tXy3E40GyJ9YOJJHrt2pP7H718TLVSZcAxQS
 DNjehNbJKRSCk8H1dz6sIDf5qS9Ki1eGFgq4o1oXeRn16AM/ZMMQydLx+ Q==;
X-CSE-ConnectionGUID: dA00J+8SRhqx3VxdjJR5dA==
X-CSE-MsgGUID: meL/HDOcTL+EKFPW/sES9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="57025965"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="57025965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 18:20:36 -0800
X-CSE-ConnectionGUID: REfJUsEpSmW2tVKKeSZsNA==
X-CSE-MsgGUID: D65Ze8PmS1GSp7zd31Jh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="125920582"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 18:20:36 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jose Souza <jose.souza@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] lib/xe/oa: Re-instate TestOa metric sets in LNL/BMG
 XML's
Date: Thu, 14 Nov 2024 18:20:31 -0800
Message-ID: <20241115022031.3794406-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

TestOa metrics for LNL set was dropped in 548fd137a9fe ("xe/oa: Update
oa-lnl.xml"). However TestOa metrics can be useful for checking OA data. We
are trying to figure out how to make use of the TestOa metrics for OA
validation but for now reinstate TestOa metrics in LNL/BMG XML's.

Generated via repeated invocations of:
	update-guids.py --guids=guids.xml MetricsXML_LNL.xml > guids.lnl.xml
	# copy new guid's from guids.lnl.xml into guids.xml
	mdapi-xml-convert.py --guids=guids.xml MetricsXML_LNL.xml > oa-lnl.xml

and
	update-guids.py --guids=guids.xml MetricsXML_BMG.xml > guids.bmg.xml
	# copy new guid's from guids.bmg.xml into guids.xml
	mdapi-xml-convert.py --guids=guids.xml MetricsXML_BMG.xml > oa-bmg.xml

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/codegen.py |   3 +
 lib/xe/oa-configs/guids.xml  |   3 +-
 lib/xe/oa-configs/oa-bmg.xml | 664 ++++++++++++++++++++++++++++++++++-
 lib/xe/oa-configs/oa-lnl.xml | 344 +++++++++++++++++-
 4 files changed, 1009 insertions(+), 5 deletions(-)

diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
index 51498f803d..7251f5c7a6 100644
--- a/lib/xe/oa-configs/codegen.py
+++ b/lib/xe/oa-configs/codegen.py
@@ -352,6 +352,9 @@ class Gen:
         m = re.search(r'\$GtSlice([0-9]+)XeCore([0-9]+)$', name)
         if m:
             return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, {1})'.format(m.group(1), m.group(2))
+        m = re.search(r'\$GtXeCore([0-99]+)$', name)
+        if m:
+            return 'intel_xe_perf_devinfo_subslice_available(&perf->devinfo, {0}, 0)'.format(m.group(1))
         return None
 
     def output_rpn_equation_code(self, set, counter, equation):
diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index dd912d00f1..c8831a912e 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2755,11 +2755,11 @@
     <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="d66ce633-4ae5-4de2-8678-9705adfd45bc" chipset="lnl" name="RTProfile" />
     <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="e7338926-568c-4424-bc44-f90318a6b472" chipset="lnl" name="VectorEngineProfile" />
     <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="4ccd6535-fb9a-440f-b0f5-882879dc4cb0" chipset="lnl" name="VectorEngineStalls" />
-    <guid config_hash="9df6fd1c4fd100b5e50cd97e16bd1cb8" mdapi_config_hash="47c19557fd9591c3fc3955e46db4565c" id="24c33f2c-f8d9-40d9-b2db-64e863b4d625" chipset="lnl" name="TestOa" />
     <guid config_hash="9bfa717fd19e8d5b99062ca0101113dd" mdapi_config_hash="f390ce860d404c3f22f9d1a3159ec58e" id="0af24f48-05bc-467b-b561-33dec252e651" chipset="lnl" name="MetricSet1" />
     <guid config_hash="d635631df97322be3d97b9c4e38152e9" mdapi_config_hash="68c19075e48e5128b456a91cd7b95286" id="914ad901-832a-4ccd-a21e-ddc7690ed213" chipset="lnl" name="MetricSet2" />
     <guid config_hash="d63d186f5b83e91f8c0680847bbf4b24" mdapi_config_hash="d31ec4eaa11c8be0d8d72ecece53434f" id="3b3c9f55-e34b-423d-8c05-7b1af03b6685" chipset="lnl" name="MetricSet3" />
     <guid config_hash="76b7587d047c30ecde26e3f6253b4165" mdapi_config_hash="e39d956ed7b8d0cbe7d354cff234af7d" id="e6f21065-a6f5-4ea4-a545-80d6aebaab56" chipset="lnl" name="MetricSet4" />
+    <guid config_hash="af9ab7d30e858c28688fd731a0500cef" mdapi_config_hash="f618549b849a175a4b6fb5f12c5f0c1a" id="24c33f2c-f8d9-40d9-b2db-64e863b4d625" chipset="lnl" name="TestOa" />
     <guid config_hash="cb471dd20a7c853d00899dc7ef33aa0e" mdapi_config_hash="4583b70c638040debcfa88563635b0f5" id="f05e23fc-913d-4ab9-ba9a-43beb059a18c" chipset="bmg" name="RenderBasic" />
     <guid config_hash="230eab6aa4f36b6de10357fe5f951d46" mdapi_config_hash="8eb3576953c1d98c1637128b495f8fa0" id="c7383a12-5c52-47a8-8e42-11b24d64d1f8" chipset="bmg" name="ComputeBasic" />
     <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="a80e9da5-d2c9-4c20-9f7c-c0adf74bbe89" chipset="bmg" name="DepthProfile" />
@@ -2769,4 +2769,5 @@
     <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="da09a8a6-802c-48bc-8f3a-35834c9b8ba2" chipset="bmg" name="RTProfile" />
     <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="dfe5251f-af3e-434c-b627-38490f2213da" chipset="bmg" name="VectorEngineProfile" />
     <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="d008dcae-2a82-4929-a94d-2ba1e9c569d6" chipset="bmg" name="VectorEngineStalls" />
+    <guid config_hash="6723e2305bfd92e1d94c4242e476ee36" mdapi_config_hash="8c21cff2375af4159f5abd0ef05ee97a" id="9ec392a7-4c77-4253-a28a-85240821e82c" chipset="bmg" name="TestOa" />
 </guids>
diff --git a/lib/xe/oa-configs/oa-bmg.xml b/lib/xe/oa-configs/oa-bmg.xml
index 15ca7ed26d..b94e7f9ca1 100644
--- a/lib/xe/oa-configs/oa-bmg.xml
+++ b/lib/xe/oa-configs/oa-bmg.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1725304531" merge_md5="">
+<metrics version="1731618854" merge_md5="">
   <set name="RenderBasic"
        chipset="BMG"
        symbol_name="RenderBasic"
@@ -5148,7 +5148,7 @@
     <counter name="RT Callable Thread Ray Dispatch"
              symbol_name="RT_CALLABLE_THREAD_RAY_DISPATCH"
              underscore_name="rt_callable_thread_ray_dispatch"
-             description="Number of callable threads dispatched"
+             description="Number of BTD shader spawn requests dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -6997,4 +6997,664 @@
     </register_config>
   </set>
 
+  <set name="TestOa"
+       chipset="BMG"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="576B_PEC64LL"
+       hw_config_guid="9ec392a7-4c77-4253-a28a-85240821e82c"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="event"
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
+             symbol_name="GPU_BUSY"
+             underscore_name="gpu_busy"
+             description="Percentage of time in which GPU is not idle including all GPU engines"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 32 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Front End"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="IA Vertex"
+             symbol_name="IA_VERTEX"
+             underscore_name="ia_vertex"
+             description="Number of vertices in a draw"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 33 READ"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GpGpu Threadgroup Count"
+             symbol_name="GPGPU_THREADGROUP_COUNT"
+             underscore_name="gpgpu_threadgroup_count"
+             description="Number of GPGPU threadgroups dispatched"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 0 READ"
+             mdapi_group="Thread Dispatcher"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Async GpGpu Threadgroup Count"
+             symbol_name="ASYNC_GPGPU_THREADGROUP_COUNT"
+             underscore_name="async_gpgpu_threadgroup_count"
+             description="Number of Async GPGPU threadgroups dispatched"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 1 READ"
+             mdapi_group="Thread Dispatcher"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterizer Sample Output"
+             symbol_name="RASTERIZER_SAMPLE_OUTPUT"
+             underscore_name="rasterizer_sample_output"
+             description="Number of lit samples emitted by Rasterizer"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 34 READ"
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1"
+             symbol_name="TEST_EVENT1"
+             underscore_name="test_event1"
+             description="Number of GPU (gt) clock cycles at every clock period"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 2 READ $XeCoreTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles"
+             symbol_name="TEST_EVENT1_CYCLES"
+             underscore_name="test_event1_cycles"
+             description="Number of GPU (gt) clock cycles at every clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 2 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore0"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE0"
+             underscore_name="test_event1_cycles_xecore0"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE0)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 3 READ"
+             availability="$GtXeCore0"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore1"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE1"
+             underscore_name="test_event1_cycles_xecore1"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE1)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 4 READ"
+             availability="$GtXeCore1"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore2"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE2"
+             underscore_name="test_event1_cycles_xecore2"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE2)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 5 READ"
+             availability="$GtXeCore2"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore3"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE3"
+             underscore_name="test_event1_cycles_xecore3"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE3)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 6 READ"
+             availability="$GtXeCore3"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore4"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE4"
+             underscore_name="test_event1_cycles_xecore4"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE4)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 21 READ"
+             availability="$GtXeCore4"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore5"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE5"
+             underscore_name="test_event1_cycles_xecore5"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE5)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 22 READ"
+             availability="$GtXeCore5"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore6"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE6"
+             underscore_name="test_event1_cycles_xecore6"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE6)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 23 READ"
+             availability="$GtXeCore6"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore7"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE7"
+             underscore_name="test_event1_cycles_xecore7"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE7)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 24 READ"
+             availability="$GtXeCore7"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore8"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE8"
+             underscore_name="test_event1_cycles_xecore8"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE8)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 25 READ"
+             availability="$GtXeCore8"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore9"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE9"
+             underscore_name="test_event1_cycles_xecore9"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE9)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 26 READ"
+             availability="$GtXeCore9"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore10"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE10"
+             underscore_name="test_event1_cycles_xecore10"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE10)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 27 READ"
+             availability="$GtXeCore10"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore11"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE11"
+             underscore_name="test_event1_cycles_xecore11"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE11)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 28 READ"
+             availability="$GtXeCore11"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore12"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE12"
+             underscore_name="test_event1_cycles_xecore12"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE12)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 29 READ"
+             availability="$GtXeCore12"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore13"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE13"
+             underscore_name="test_event1_cycles_xecore13"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE13)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 30 READ"
+             availability="$GtXeCore13"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore14"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE14"
+             underscore_name="test_event1_cycles_xecore14"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE14)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 31 READ"
+             availability="$GtXeCore14"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore15"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE15"
+             underscore_name="test_event1_cycles_xecore15"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE15)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 7 READ"
+             availability="$GtXeCore15"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore16"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE16"
+             underscore_name="test_event1_cycles_xecore16"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE16)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 8 READ"
+             availability="$GtXeCore16"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore17"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE17"
+             underscore_name="test_event1_cycles_xecore17"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE17)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 9 READ"
+             availability="$GtXeCore17"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore18"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE18"
+             underscore_name="test_event1_cycles_xecore18"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE18)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 10 READ"
+             availability="$GtXeCore18"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore19"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE19"
+             underscore_name="test_event1_cycles_xecore19"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE19)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 11 READ"
+             availability="$GtXeCore19"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore20"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE20"
+             underscore_name="test_event1_cycles_xecore20"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE20)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 12 READ"
+             availability="$GtXeCore20"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore21"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE21"
+             underscore_name="test_event1_cycles_xecore21"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE21)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 13 READ"
+             availability="$GtXeCore21"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore22"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE22"
+             underscore_name="test_event1_cycles_xecore22"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE22)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 14 READ"
+             availability="$GtXeCore22"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore23"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE23"
+             underscore_name="test_event1_cycles_xecore23"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE23)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 15 READ"
+             availability="$GtXeCore23"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore24"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE24"
+             underscore_name="test_event1_cycles_xecore24"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE24)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 16 READ"
+             availability="$GtXeCore24"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore25"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE25"
+             underscore_name="test_event1_cycles_xecore25"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE25)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 17 READ"
+             availability="$GtXeCore25"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore26"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE26"
+             underscore_name="test_event1_cycles_xecore26"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE26)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 18 READ"
+             availability="$GtXeCore26"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore27"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE27"
+             underscore_name="test_event1_cycles_xecore27"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE27)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 19 READ"
+             availability="$GtXeCore27"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Average"
+             symbol_name="TEST_EVENT1_CYCLES_AVERAGE"
+             underscore_name="test_event1_cycles_average"
+             description="Average number of GPU (gt) clock cycles at every clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 2 READ $XeCoreTotalCount UDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event2"
+             symbol_name="TEST_EVENT2"
+             underscore_name="test_event2"
+             description="Number of GPU (gt) clock cycles at every other clock period"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 35 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event2 Cycles"
+             symbol_name="TEST_EVENT2_CYCLES"
+             underscore_name="test_event2_cycles"
+             description="Number of GPU (gt) clock cycles at every other clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 35 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00003E00" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00013E00" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00113E00" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00213E00" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00313E00" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00F13E00" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x01013E00" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x01113E00" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x01213E00" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x01313E00" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x01413E00" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x01513E00" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x01613E00" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x01713E00" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x01813E00" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x01913E00" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x01A13E00" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x01B13E00" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00413E00" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00513E00" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00613E00" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00713E00" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00813E00" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00913E00" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00A13E00" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00B13E00" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00C13E00" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00D13E00" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00E13E00" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00005A00" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00005A00" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00005A00" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00004405" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00004405" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00004405" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00006805" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00006805" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00006805" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00007E00" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00007E00" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00007E00" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/xe/oa-configs/oa-lnl.xml b/lib/xe/oa-configs/oa-lnl.xml
index 5a8586f03a..1ab28e1acc 100644
--- a/lib/xe/oa-configs/oa-lnl.xml
+++ b/lib/xe/oa-configs/oa-lnl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1725302004" merge_md5="">
+<metrics version="1731613844" merge_md5="">
   <set name="RenderBasic"
        chipset="LNL"
        symbol_name="RenderBasic"
@@ -4920,7 +4920,7 @@
     <counter name="RT Callable Thread Ray Dispatch"
              symbol_name="RT_CALLABLE_THREAD_RAY_DISPATCH"
              underscore_name="rt_callable_thread_ray_dispatch"
-             description="Number of callable threads dispatched"
+             description="Number of BTD shader spawn requests dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -6769,4 +6769,344 @@
     </register_config>
   </set>
 
+  <set name="TestOa"
+       chipset="LNL"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="576B_PEC64LL"
+       hw_config_guid="24c33f2c-f8d9-40d9-b2db-64e863b4d625"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="event"
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
+             symbol_name="GPU_BUSY"
+             underscore_name="gpu_busy"
+             description="Percentage of time in which GPU is not idle including all GPU engines"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 32 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Front End"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="IA Vertex"
+             symbol_name="IA_VERTEX"
+             underscore_name="ia_vertex"
+             description="Number of vertices in a draw"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 33 READ"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GpGpu Threadgroup Count"
+             symbol_name="GPGPU_THREADGROUP_COUNT"
+             underscore_name="gpgpu_threadgroup_count"
+             description="Number of GPGPU threadgroups dispatched"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 0 READ"
+             mdapi_group="Thread Dispatcher"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Async GpGpu Threadgroup Count"
+             symbol_name="ASYNC_GPGPU_THREADGROUP_COUNT"
+             underscore_name="async_gpgpu_threadgroup_count"
+             description="Number of Async GPGPU threadgroups dispatched"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 1 READ"
+             mdapi_group="Thread Dispatcher"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterizer Sample Output"
+             symbol_name="RASTERIZER_SAMPLE_OUTPUT"
+             underscore_name="rasterizer_sample_output"
+             description="Number of lit samples emitted by Rasterizer"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="PEC 34 READ"
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1"
+             symbol_name="TEST_EVENT1"
+             underscore_name="test_event1"
+             description="Number of GPU (gt) clock cycles at every clock period"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 2 READ $XeCoreTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles"
+             symbol_name="TEST_EVENT1_CYCLES"
+             underscore_name="test_event1_cycles"
+             description="Number of GPU (gt) clock cycles at every clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 2 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore0"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE0"
+             underscore_name="test_event1_cycles_xecore0"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE0)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 3 READ"
+             availability="$GtXeCore0"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore1"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE1"
+             underscore_name="test_event1_cycles_xecore1"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE1)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 4 READ"
+             availability="$GtXeCore1"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore2"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE2"
+             underscore_name="test_event1_cycles_xecore2"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE2)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 5 READ"
+             availability="$GtXeCore2"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore3"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE3"
+             underscore_name="test_event1_cycles_xecore3"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE3)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 6 READ"
+             availability="$GtXeCore3"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore4"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE4"
+             underscore_name="test_event1_cycles_xecore4"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE4)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 21 READ"
+             availability="$GtXeCore4"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore5"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE5"
+             underscore_name="test_event1_cycles_xecore5"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE5)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 22 READ"
+             availability="$GtXeCore5"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore6"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE6"
+             underscore_name="test_event1_cycles_xecore6"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE6)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 23 READ"
+             availability="$GtXeCore6"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Xecore7"
+             symbol_name="TEST_EVENT1_CYCLES_XECORE7"
+             underscore_name="test_event1_cycles_xecore7"
+             description="Number of GPU (gt) clock cycles at every clock period (XECORE7)"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 24 READ"
+             availability="$GtXeCore7"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event1 Cycles Average"
+             symbol_name="TEST_EVENT1_CYCLES_AVERAGE"
+             underscore_name="test_event1_cycles_average"
+             description="Average number of GPU (gt) clock cycles at every clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 2 READ $XeCoreTotalCount UDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event2"
+             symbol_name="TEST_EVENT2"
+             underscore_name="test_event2"
+             description="Number of GPU (gt) clock cycles at every other clock period"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 35 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Test Event2 Cycles"
+             symbol_name="TEST_EVENT2_CYCLES"
+             underscore_name="test_event2_cycles"
+             description="Number of GPU (gt) clock cycles at every other clock period"
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="PEC 35 READ"
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00003E00" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00013E00" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00113E00" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00213E00" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00313E00" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00413E00" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00513E00" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00613E00" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00713E00" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00005A00" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00005A00" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00005A00" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00004405" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00004405" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00004405" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00006805" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00006805" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00006805" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00007E00" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00007E00" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00007E00" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+    </register_config>
+  </set>
+
 </metrics>
-- 
2.41.0

