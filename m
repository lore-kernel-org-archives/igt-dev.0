Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06859C3065C
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1057F10E32D;
	Fri, 28 Jun 2024 22:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8tj04uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616210E31C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719613444; x=1751149444;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1dDVN9DeTODteLAY2Ty6XIeSzcCLT14Q+3IV0KxlQEM=;
 b=W8tj04uj80kXDedoZkfYpJG2bLaKNKqaSfNt1Cigh8cva3quj5OaEJWJ
 aMJ7ovpeeJGLcF961TUOaJq0Oi2T6EXxnq+a5HrVoLrb2ik61eC/Yr6lr
 kjne6nmYuTkGbHu8XEekRdOQKZkLUxuyZFK+gjoq/T4lgc/PUVgsD74Ze
 A+6Gcsn01DrkAt/Mja1TrumCCpaMNMbS9nA8GeGvd3JpEasA/QO7eAqHY
 h6lCwXtSVPeHpdRR05AAckiUNL/wyS4tSCsdhYdnkaE2AOkwD5OMWatAI
 p1HOv5AaiuHJJhd89MctiyzEbl8mlaKRBtzYwjw0NWLbZWL29fVOXKid3 A==;
X-CSE-ConnectionGUID: VZO87WXKQuS7v5MpuNOwoA==
X-CSE-MsgGUID: 2Lzy9S1KT5qPsWjX0M6U+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42232683"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="42232683"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 15:24:03 -0700
X-CSE-ConnectionGUID: 7UDwKJMgRgyfe4SpawMLIQ==
X-CSE-MsgGUID: WCJHVsGsRTCAvrSoicL1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45616192"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 15:24:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/16] lib/xe/oa: Add truncated legacy Xe1 metrics XML's
Date: Fri, 28 Jun 2024 15:23:46 -0700
Message-ID: <20240628222358.2151036-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240628222358.2151036-1-ashutosh.dixit@intel.com>
References: <20240628222358.2151036-1-ashutosh.dixit@intel.com>
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

Legacy metrics XML's allow testing with Xe KMD on legacy Xe1
platforms. However because these XML's are huge and increase compile time,
only RenderBasic and TestOa metrics sets are included in these XML's. If
other metrics sets are needed they can be added by copying from
lib/i915/perf-configs.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/xe/oa-configs/oa-acmgt1.xml | 710 +++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-acmgt2.xml | 828 ++++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-acmgt3.xml | 824 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-adl.xml    | 816 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-dg1.xml    | 823 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-mtlgt2.xml | 789 ++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-mtlgt3.xml | 803 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-rkl.xml    | 824 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-tglgt1.xml | 819 +++++++++++++++++++++++++++++++
 lib/xe/oa-configs/oa-tglgt2.xml | 818 +++++++++++++++++++++++++++++++
 10 files changed, 8054 insertions(+)
 create mode 100644 lib/xe/oa-configs/oa-acmgt1.xml
 create mode 100644 lib/xe/oa-configs/oa-acmgt2.xml
 create mode 100644 lib/xe/oa-configs/oa-acmgt3.xml
 create mode 100644 lib/xe/oa-configs/oa-adl.xml
 create mode 100644 lib/xe/oa-configs/oa-dg1.xml
 create mode 100644 lib/xe/oa-configs/oa-mtlgt2.xml
 create mode 100644 lib/xe/oa-configs/oa-mtlgt3.xml
 create mode 100644 lib/xe/oa-configs/oa-rkl.xml
 create mode 100644 lib/xe/oa-configs/oa-tglgt1.xml
 create mode 100644 lib/xe/oa-configs/oa-tglgt2.xml

diff --git a/lib/xe/oa-configs/oa-acmgt1.xml b/lib/xe/oa-configs/oa-acmgt1.xml
new file mode 100644
index 0000000000..c08b537123
--- /dev/null
+++ b/lib/xe/oa-configs/oa-acmgt1.xml
@@ -0,0 +1,710 @@
+<?xml version="1.0"?>
+<metrics version="1664349503" merge_md5="">
+  <set name="Render Metrics Basic - aggregation approximation"
+       chipset="ACMGT1"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="f5b8f05e-c84c-4f1c-bb05-68fbea73879b"
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
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="ThreadDispatcher"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
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
+             mdapi_group="FrontEnd"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Active"
+             symbol_name="XveActive"
+             underscore_name="xve_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XveStall"
+             underscore_name="xve_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Thread Occupancy"
+             symbol_name="XveThreadOccupancy"
+             underscore_name="xve_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied XVEs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 9 READ FMUL $VectorEngineThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="XveFpuEmActive"
+             underscore_name="xve_fpu_em_active"
+             description="The percentage of time in which XVE EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Sampler"
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
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 30 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Writes"
+             symbol_name="SlmWrites"
+             underscore_name="slm_writes"
+             description="The total number of writes into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
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
+             mdapi_group="Memory"
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
+             equation="C 6 READ C 7 READ UADD 128 UMUL"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Slice2 Xe Core0 is busy"
+             symbol_name="Sampler20Busy"
+             underscore_name="sampler20_busy"
+             description="The percentage of time when sampler slice2 Xe core0 is busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers or L1 cache are not idle."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler20Busy"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Sampler20 Bottleneck"
+             symbol_name="Sampler20Bottleneck"
+             underscore_name="sampler20_bottleneck"
+             description="The percentage of time in which Slice2 Sampler0 has been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler20Bottleneck"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000D" />
+        <register type="NOA" address="0x00009888" value="0x1C840000" />
+        <register type="NOA" address="0x00009888" value="0x1E842800" />
+        <register type="NOA" address="0x00009888" value="0x02844000" />
+        <register type="NOA" address="0x00009888" value="0x04840010" />
+        <register type="NOA" address="0x00009888" value="0x10840800" />
+        <register type="NOA" address="0x00009888" value="0x12840037" />
+        <register type="NOA" address="0x00009888" value="0x00840000" />
+        <register type="NOA" address="0x00009888" value="0x02860500" />
+        <register type="NOA" address="0x00009888" value="0x02080A00" />
+        <register type="NOA" address="0x00009888" value="0x020A0500" />
+        <register type="NOA" address="0x00009884" value="0x00000001" />
+        <register type="NOA" address="0x00009888" value="0x18413800" />
+        <register type="NOA" address="0x00009888" value="0x18613800" />
+        <register type="NOA" address="0x00009888" value="0x02410006" />
+        <register type="NOA" address="0x00009888" value="0x14410100" />
+        <register type="NOA" address="0x00009888" value="0x00410000" />
+        <register type="NOA" address="0x00009888" value="0x02610006" />
+        <register type="NOA" address="0x00009888" value="0x16610004" />
+        <register type="NOA" address="0x00009888" value="0x00610000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x00043000" />
+        <register type="NOA" address="0x00009888" value="0x02020A00" />
+        <register type="NOA" address="0x00009888" value="0x0203F500" />
+        <register type="NOA" address="0x00009888" value="0x0209E000" />
+        <register type="NOA" address="0x00009888" value="0x04030000" />
+        <register type="NOA" address="0x00009888" value="0x20030000" />
+        <register type="NOA" address="0x00009888" value="0x44030000" />
+        <register type="NOA" address="0x00009888" value="0x22030000" />
+        <register type="NOA" address="0x00009888" value="0x46030C60" />
+        <register type="NOA" address="0x00009888" value="0x2403F000" />
+        <register type="NOA" address="0x00009888" value="0x2803F000" />
+        <register type="NOA" address="0x00009884" value="0x00000009" />
+        <register type="NOA" address="0x00009888" value="0x00013000" />
+        <register type="NOA" address="0x00009888" value="0x02020500" />
+        <register type="NOA" address="0x00009888" value="0x02040500" />
+        <register type="NOA" address="0x00009888" value="0x02050500" />
+        <register type="NOA" address="0x00009888" value="0x02080A00" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x64030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00003008" />
+        <register type="FLEX" address="0x0000E658" value="0x00011010" />
+        <register type="FLEX" address="0x0000E758" value="0x00050012" />
+        <register type="FLEX" address="0x0000E45C" value="0x00052051" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="ACMGT1"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="57f210de-b537-464a-af7b-7dfe2f3780c1"
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
+    <counter name="TestCounter7"
+             symbol_name="Counter7"
+             underscore_name="counter7"
+             description="HW test counter 7. Factor: 0.6666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="Test"
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
+             mdapi_group="Test"
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
+             mdapi_group="Test"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x3C030000" />
+        <register type="NOA" address="0x00009888" value="0x42030000" />
+        <register type="NOA" address="0x00009888" value="0x06034000" />
+        <register type="NOA" address="0x00009888" value="0x0803000C" />
+        <register type="NOA" address="0x00009888" value="0x10030FF3" />
+        <register type="NOA" address="0x00009888" value="0x04030000" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x50030000" />
+        <register type="NOA" address="0x00009888" value="0x52030000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x64030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/oa-configs/oa-acmgt2.xml b/lib/xe/oa-configs/oa-acmgt2.xml
new file mode 100644
index 0000000000..0e205af656
--- /dev/null
+++ b/lib/xe/oa-configs/oa-acmgt2.xml
@@ -0,0 +1,828 @@
+<?xml version="1.0"?>
+<metrics version="1664349628" merge_md5="">
+  <set name="Render Metrics Basic - aggregation approximation"
+       chipset="ACMGT2"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="0692a728-614d-4d12-8c03-7b3ffe961ef8"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
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
+             mdapi_group="FrontEnd"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Active"
+             symbol_name="XveActive"
+             underscore_name="xve_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XveStall"
+             underscore_name="xve_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Thread Occupancy"
+             symbol_name="XveThreadOccupancy"
+             underscore_name="xve_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied XVEs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 9 READ FMUL $VectorEngineThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="XveFpuEmActive"
+             underscore_name="xve_fpu_em_active"
+             description="The percentage of time in which XVE EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="DepthPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="DepthPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="ColorPipe"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="ColorPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Sampler"
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
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 30 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Writes"
+             symbol_name="SlmWrites"
+             underscore_name="slm_writes"
+             description="The total number of writes into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
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
+             mdapi_group="Memory"
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
+             equation="128  A 37 READ UMUL"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Slice2 Xe Core0 is busy"
+             symbol_name="Sampler20Busy"
+             underscore_name="sampler20_busy"
+             description="The percentage of time when sampler slice2 Xe core0 is busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers or L1 cache are not idle."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler20Busy"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Sampler20 Bottleneck"
+             symbol_name="Sampler20Bottleneck"
+             underscore_name="sampler20_bottleneck"
+             description="The percentage of time in which Slice2 Sampler0 has been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler20Bottleneck"
+             availability="$GtSlice2XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000D" />
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
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0208A000" />
+        <register type="NOA" address="0x00009888" value="0x04032000" />
+        <register type="NOA" address="0x00009888" value="0x06030002" />
+        <register type="NOA" address="0x00009888" value="0x02030000" />
+        <register type="NOA" address="0x00009888" value="0x1C030000" />
+        <register type="NOA" address="0x00009888" value="0x34030000" />
+        <register type="NOA" address="0x00009888" value="0x1E030000" />
+        <register type="NOA" address="0x00009888" value="0x36030000" />
+        <register type="NOA" address="0x00009884" value="0x00000009" />
+        <register type="NOA" address="0x00009888" value="0x0001C000" />
+        <register type="NOA" address="0x00009888" value="0x02025000" />
+        <register type="NOA" address="0x00009888" value="0x02045000" />
+        <register type="NOA" address="0x00009888" value="0x02055000" />
+        <register type="NOA" address="0x00009888" value="0x0208A000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x52030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00003008" />
+        <register type="FLEX" address="0x0000E658" value="0x00011010" />
+        <register type="FLEX" address="0x0000E758" value="0x00050012" />
+        <register type="FLEX" address="0x0000E45C" value="0x00052051" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="ACMGT2"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="cfac9130-4f6a-4a2a-aafc-9e88751ce983"
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
+    <counter name="TestCounter7"
+             symbol_name="Counter7"
+             underscore_name="counter7"
+             description="HW test counter 7. Factor: 0.6666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="Test"
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
+             mdapi_group="Test"
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
+             mdapi_group="Test"
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
+        <register type="NOA" address="0x00009888" value="0x3E030000" />
+        <register type="NOA" address="0x00009888" value="0x40030000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x52030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/oa-configs/oa-acmgt3.xml b/lib/xe/oa-configs/oa-acmgt3.xml
new file mode 100644
index 0000000000..2e873428fd
--- /dev/null
+++ b/lib/xe/oa-configs/oa-acmgt3.xml
@@ -0,0 +1,824 @@
+<?xml version="1.0"?>
+<metrics version="1664349727" merge_md5="">
+  <set name="Render Metrics Basic"
+       chipset="ACMGT3"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="47b237c5-ed48-465b-b869-0d7ef59a6982"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
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
+             mdapi_group="ThreadDispatcher"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
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
+             mdapi_group="FrontEnd"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Active"
+             symbol_name="XveActive"
+             underscore_name="xve_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XveStall"
+             underscore_name="xve_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Thread Occupancy"
+             symbol_name="XveThreadOccupancy"
+             underscore_name="xve_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied XVEs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 9 READ FMUL $VectorEngineThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="XveFpuEmActive"
+             underscore_name="xve_fpu_em_active"
+             description="The percentage of time in which XVE EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="DepthPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="DepthPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="ColorPipe"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="ColorPipe"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="Sampler"
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
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 30 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Writes"
+             symbol_name="SlmWrites"
+             underscore_name="slm_writes"
+             description="The total number of writes into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L1Cache"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_group="VectorEngine"
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
+             mdapi_group="Memory"
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
+             equation="128  A 37 READ UMUL"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Slice0 Xe Core0 is busy"
+             symbol_name="Sampler00Busy"
+             underscore_name="sampler00_busy"
+             description="The percentage of time when sampler slice0 Xe core0 is busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice0XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
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
+             availability="$XeCoreMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Sampler00 Bottleneck"
+             symbol_name="Sampler00Bottleneck"
+             underscore_name="sampler00_bottleneck"
+             description="The percentage of time in which Slice0 Sampler0 has been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$GtSlice0XeCore0"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler00Bottleneck"
+             availability="$XeCoreMask 1 AND"
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
+        <register type="NOA" address="0x00009888" value="0x0A840800" />
+        <register type="NOA" address="0x00009888" value="0x0C840037" />
+        <register type="NOA" address="0x00009888" value="0x00840000" />
+        <register type="NOA" address="0x00009888" value="0x00865000" />
+        <register type="NOA" address="0x00009888" value="0x0008A000" />
+        <register type="NOA" address="0x00009888" value="0x000A5000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0008A000" />
+        <register type="NOA" address="0x00009888" value="0x02030090" />
+        <register type="NOA" address="0x00009888" value="0x46030000" />
+        <register type="NOA" address="0x00009888" value="0x48030000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x000100C0" />
+        <register type="NOA" address="0x00009888" value="0x00025000" />
+        <register type="NOA" address="0x00009888" value="0x00045000" />
+        <register type="NOA" address="0x00009888" value="0x00055000" />
+        <register type="NOA" address="0x00009888" value="0x0008A000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00003008" />
+        <register type="FLEX" address="0x0000E658" value="0x00011010" />
+        <register type="FLEX" address="0x0000E758" value="0x00050012" />
+        <register type="FLEX" address="0x0000E45C" value="0x00052051" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="ACMGT3"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="7389b9c9-de73-468d-83a8-b27776215e6b"
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
+    <counter name="TestCounter7"
+             symbol_name="Counter7"
+             underscore_name="counter7"
+             description="HW test counter 7. Factor: 0.6666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="Test"
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
+             mdapi_group="Test"
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
+             mdapi_group="Test"
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
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/oa-configs/oa-adl.xml b/lib/xe/oa-configs/oa-adl.xml
new file mode 100644
index 0000000000..f8091ad1b7
--- /dev/null
+++ b/lib/xe/oa-configs/oa-adl.xml
@@ -0,0 +1,816 @@
+<?xml version="1.0"?>
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
+       chipset="ADL"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="4b886bf3-61ff-4381-9994-ac9b91202fc7"
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
+  <set name="Metric set TestOa"
+       chipset="ADL"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="89173c19-fcfe-48da-ac26-fb64425f141b"
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
diff --git a/lib/xe/oa-configs/oa-dg1.xml b/lib/xe/oa-configs/oa-dg1.xml
new file mode 100644
index 0000000000..52fedfa4d2
--- /dev/null
+++ b/lib/xe/oa-configs/oa-dg1.xml
@@ -0,0 +1,823 @@
+<?xml version="1.0"?>
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
+       chipset="DG1"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="1caf6b6d-a1ef-40d3-9033-311e482b826e"
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
+             max_equation="$GpuCoreClocks 128 UMUL"
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
+             max_equation="$GpuCoreClocks 128 UMUL"
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
+        <register type="NOA" address="0x00009888" value="0x00004000" />
+        <register type="NOA" address="0x00009888" value="0x0E004000" />
+        <register type="NOA" address="0x00009888" value="0x10004000" />
+        <register type="NOA" address="0x00009888" value="0x12004000" />
+        <register type="NOA" address="0x00009888" value="0x00014000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x1C012000" />
+        <register type="NOA" address="0x00009888" value="0x1E012000" />
+        <register type="NOA" address="0x00009888" value="0x1C054000" />
+        <register type="NOA" address="0x00009888" value="0x24050015" />
+        <register type="NOA" address="0x00009888" value="0x10088000" />
+        <register type="NOA" address="0x00009888" value="0x1C08000E" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D47" />
+        <register type="NOA" address="0x00009888" value="0x09151536" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
+        <register type="NOA" address="0x00009888" value="0x4B114000" />
+        <register type="NOA" address="0x00009888" value="0x5F11A000" />
+        <register type="NOA" address="0x00009888" value="0x61110002" />
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
+        <register type="NOA" address="0x00009888" value="0x55101610" />
+        <register type="NOA" address="0x00009888" value="0x57100006" />
+        <register type="NOA" address="0x00009888" value="0x49101616" />
+        <register type="NOA" address="0x00009888" value="0x4B100616" />
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
+  <set name="Metric set TestOa"
+       chipset="DG1"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="23f51139-6973-4b45-a211-778834ce2c9a"
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
+             mdapi_supported_apis="OGL OCL MEDIA VK"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04100000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x2C010004" />
+        <register type="NOA" address="0x00009888" value="0x26050003" />
+        <register type="NOA" address="0x00009888" value="0x26060040" />
+        <register type="NOA" address="0x00009888" value="0x1C090200" />
+        <register type="NOA" address="0x00009888" value="0x0E0C8000" />
+        <register type="NOA" address="0x00009888" value="0x200D8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F8000" />
+        <register type="NOA" address="0x00009888" value="0x1E100017" />
+        <register type="NOA" address="0x00009888" value="0x00100000" />
+        <register type="NOA" address="0x00009888" value="0x1E0B4000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x49110000" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x1D140020" />
+        <register type="NOA" address="0x00009888" value="0x1D1103A3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61112000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100230" />
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
diff --git a/lib/xe/oa-configs/oa-mtlgt2.xml b/lib/xe/oa-configs/oa-mtlgt2.xml
new file mode 100644
index 0000000000..38ebc54274
--- /dev/null
+++ b/lib/xe/oa-configs/oa-mtlgt2.xml
@@ -0,0 +1,789 @@
+<?xml version="1.0"?>
+<metrics version="1675300099" merge_md5="">
+  <set name="Render Metrics Basic"
+       chipset="MTLGT2"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="232e858b-7116-44e8-a4be-856c59026650"
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
+    <counter name="XVE Active"
+             symbol_name="XveActive"
+             underscore_name="xve_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XveStall"
+             underscore_name="xve_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Thread Occupancy"
+             symbol_name="XveThreadOccupancy"
+             underscore_name="xve_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied XVEs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 9 READ FMUL $VectorEngineThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="XveFpuEmActive"
+             underscore_name="xve_fpu_em_active"
+             description="The percentage of time in which XVE EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 30 READ"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Writes"
+             symbol_name="SlmWrites"
+             underscore_name="slm_writes"
+             description="The total number of writes into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             equation="32  A 36 READ UMUL"
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
+             equation="32  A 37 READ UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers or L1 cache are not idle."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$XeCoreMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$XeCoreMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x1E040000" />
+        <register type="NOA" address="0x00009888" value="0x20042800" />
+        <register type="NOA" address="0x00009888" value="0x04042000" />
+        <register type="NOA" address="0x00009888" value="0x06040000" />
+        <register type="NOA" address="0x00009888" value="0x14040800" />
+        <register type="NOA" address="0x00009888" value="0x16040037" />
+        <register type="NOA" address="0x00009888" value="0x02040000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0201F000" />
+        <register type="NOA" address="0x00009888" value="0x06010000" />
+        <register type="NOA" address="0x00009888" value="0x54010000" />
+        <register type="NOA" address="0x00009888" value="0x56010000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x74010002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00003008" />
+        <register type="FLEX" address="0x0000E658" value="0x00011010" />
+        <register type="FLEX" address="0x0000E758" value="0x00050012" />
+        <register type="FLEX" address="0x0000E45C" value="0x00052051" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="MTLGT2"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="d0ed8afd-ad64-4774-8788-1a15f4ab7829"
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
+             equation="C 7 READ"
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
+             equation="C 6 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x46020000" />
+        <register type="NOA" address="0x00009888" value="0x46010000" />
+        <register type="NOA" address="0x00009888" value="0x0802000E" />
+        <register type="NOA" address="0x00009888" value="0x18020033" />
+        <register type="NOA" address="0x00009888" value="0x04020000" />
+        <register type="NOA" address="0x00009888" value="0x02020000" />
+        <register type="NOA" address="0x00009888" value="0x0801000C" />
+        <register type="NOA" address="0x00009888" value="0x16010DC0" />
+        <register type="NOA" address="0x00009888" value="0x04010000" />
+        <register type="NOA" address="0x00009888" value="0x02014000" />
+        <register type="NOA" address="0x00009888" value="0x06010000" />
+        <register type="NOA" address="0x00009888" value="0x54010200" />
+        <register type="NOA" address="0x00009888" value="0x56010000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x74010002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/oa-configs/oa-mtlgt3.xml b/lib/xe/oa-configs/oa-mtlgt3.xml
new file mode 100644
index 0000000000..f5f99eaee5
--- /dev/null
+++ b/lib/xe/oa-configs/oa-mtlgt3.xml
@@ -0,0 +1,803 @@
+<?xml version="1.0"?>
+<metrics version="1675300133" merge_md5="">
+  <set name="Render Metrics Basic"
+       chipset="MTLGT3"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="1124d1b6-6182-4b5a-950b-27b38ef7c996"
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
+    <counter name="XVE Active"
+             symbol_name="XveActive"
+             underscore_name="xve_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XveStall"
+             underscore_name="xve_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Thread Occupancy"
+             symbol_name="XveThreadOccupancy"
+             underscore_name="xve_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied XVEs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 9 READ FMUL $VectorEngineThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="XveFpuEmActive"
+             underscore_name="xve_fpu_em_active"
+             description="The percentage of time in which XVE EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which XVE FPU INT64 pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which XVE EM INT pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Send Pipe Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which XVE send pipeline was actively processing a fragment shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 30 READ"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Writes"
+             symbol_name="SlmWrites"
+             underscore_name="slm_writes"
+             description="The total number of writes into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $XeCoreTotalCount UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
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
+             mdapi_supported_apis=""
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
+             equation="32  A 36 READ UMUL"
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
+             equation="32  A 37 READ UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers or L1 cache are not idle."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$XeCoreMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing XVE requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$XeCoreMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x1E040000" />
+        <register type="NOA" address="0x00009888" value="0x20042800" />
+        <register type="NOA" address="0x00009888" value="0x02015000" />
+        <register type="NOA" address="0x00009888" value="0x02025000" />
+        <register type="NOA" address="0x00009888" value="0x02035000" />
+        <register type="NOA" address="0x00009888" value="0x04042000" />
+        <register type="NOA" address="0x00009888" value="0x06040000" />
+        <register type="NOA" address="0x00009888" value="0x14040800" />
+        <register type="NOA" address="0x00009888" value="0x16040037" />
+        <register type="NOA" address="0x00009888" value="0x02040000" />
+        <register type="NOA" address="0x00009888" value="0x02085000" />
+        <register type="NOA" address="0x00009884" value="0x00000004" />
+        <register type="NOA" address="0x00009888" value="0x02015000" />
+        <register type="NOA" address="0x00009888" value="0x02045000" />
+        <register type="NOA" address="0x00009888" value="0x000BC000" />
+        <register type="NOA" address="0x00009888" value="0x0209A000" />
+        <register type="NOA" address="0x00009888" value="0x020AA000" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x0202A000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0002C000" />
+        <register type="NOA" address="0x00009888" value="0x02015000" />
+        <register type="NOA" address="0x00009888" value="0x0203A000" />
+        <register type="NOA" address="0x00009888" value="0x06010000" />
+        <register type="NOA" address="0x00009888" value="0x52010000" />
+        <register type="NOA" address="0x00009888" value="0x54010000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x72010002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00003008" />
+        <register type="FLEX" address="0x0000E658" value="0x00011010" />
+        <register type="FLEX" address="0x0000E758" value="0x00050012" />
+        <register type="FLEX" address="0x0000E45C" value="0x00052051" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="MTLGT3"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="7272a7b8-6df2-4180-a95f-2ef7ad4412cc"
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
+        <register type="NOA" address="0x00009888" value="0x42020000" />
+        <register type="NOA" address="0x00009888" value="0x46010000" />
+        <register type="NOA" address="0x00009888" value="0x0602000E" />
+        <register type="NOA" address="0x00009888" value="0x0E020CC0" />
+        <register type="NOA" address="0x00009888" value="0x02020000" />
+        <register type="NOA" address="0x00009888" value="0x00020000" />
+        <register type="NOA" address="0x00009888" value="0x0801000C" />
+        <register type="NOA" address="0x00009888" value="0x12010037" />
+        <register type="NOA" address="0x00009888" value="0x04010000" />
+        <register type="NOA" address="0x00009888" value="0x02010001" />
+        <register type="NOA" address="0x00009888" value="0x06010000" />
+        <register type="NOA" address="0x00009888" value="0x5E010000" />
+        <register type="NOA" address="0x00009888" value="0x60010200" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x72010002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DD40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/oa-configs/oa-rkl.xml b/lib/xe/oa-configs/oa-rkl.xml
new file mode 100644
index 0000000000..9cb56903f6
--- /dev/null
+++ b/lib/xe/oa-configs/oa-rkl.xml
@@ -0,0 +1,824 @@
+<?xml version="1.0"?>
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
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
diff --git a/lib/xe/oa-configs/oa-tglgt1.xml b/lib/xe/oa-configs/oa-tglgt1.xml
new file mode 100644
index 0000000000..8c28ba3329
--- /dev/null
+++ b/lib/xe/oa-configs/oa-tglgt1.xml
@@ -0,0 +1,819 @@
+<?xml version="1.0"?>
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
+       chipset="TGLGT1"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="c17af13d-3953-432b-9bd1-81346b4c2092"
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
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E00C000" />
+        <register type="NOA" address="0x00009888" value="0x1000C000" />
+        <register type="NOA" address="0x00009888" value="0x1200C000" />
+        <register type="NOA" address="0x00009888" value="0x10058000" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x22050030" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0AC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D47" />
+        <register type="NOA" address="0x00009888" value="0x09151536" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
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
+        <register type="NOA" address="0x00009888" value="0x55101710" />
+        <register type="NOA" address="0x00009888" value="0x57100007" />
+        <register type="NOA" address="0x00009888" value="0x49101717" />
+        <register type="NOA" address="0x00009888" value="0x4B100717" />
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
+  <set name="Metric set TestOa"
+       chipset="TGLGT1"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="6f27aaed-4f08-4e0f-95a9-231d9b4fa111"
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
+        <register type="NOA" address="0x00009888" value="0x1E0F0017" />
+        <register type="NOA" address="0x00009888" value="0x200F0000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x49110000" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x1D140020" />
+        <register type="NOA" address="0x00009888" value="0x1D1103A3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61111000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100210" />
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
diff --git a/lib/xe/oa-configs/oa-tglgt2.xml b/lib/xe/oa-configs/oa-tglgt2.xml
new file mode 100644
index 0000000000..7387dc2e39
--- /dev/null
+++ b/lib/xe/oa-configs/oa-tglgt2.xml
@@ -0,0 +1,818 @@
+<?xml version="1.0"?>
+<metrics version="1619078711" merge_md5="">
+  <set name="Render Metrics Basic set"
+       chipset="TGLGT2"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="0fc397c0-4833-492c-9ccd-4929d574d5b8"
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
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
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
+        <register type="NOA" address="0x00009888" value="0x47103000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55103130" />
+        <register type="NOA" address="0x00009888" value="0x57100001" />
+        <register type="NOA" address="0x00009888" value="0x49103131" />
+        <register type="NOA" address="0x00009888" value="0x4B100131" />
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
+  <set name="Metric set TestOa"
+       chipset="TGLGT2"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="6607f034-d053-40d1-8215-67c07f3041bb"
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
+        <register type="NOA" address="0x00009888" value="0x1D140020" />
+        <register type="NOA" address="0x00009888" value="0x1D1103A3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61111000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100630" />
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
-- 
2.41.0

