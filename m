Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C40C38150
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFAA10E1C1;
	Thu,  4 Jul 2024 01:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDVpUqoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511810E1C1
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055506; x=1751591506;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dJKCg6kdQkCzyczSjFQoNJ5hagiWH+wC/RXMfuXGtAA=;
 b=QDVpUqozdDIDSQXDhryWcpl7MfntAnevsJjRXLG2Tyy9pwHYSS2SrTYY
 Zao3hcioJJO/ISIYo/VQiWf9sJzxG4lx41c87Zdogd9mLxTLfnLwiZPlp
 WU7G5CtKC7CytzZqcM7Q6Aol+kN0wgoWWmdE/cJgnw4vXGSxVd7TEYlQP
 GhC5e8ce+vJooTRd2kQPwIkNMamo9FmuDcgQuKWoNKUWyQWl33/oVyUgU
 22vVW/3+It2VIWOY58g4hMoNa67pXnc2fkIsNobT1jV8LLW39cWu85gsc
 Ny4cIfyQLjKEWBOBavMd5RdPFCj355a/YRnmJ04+ivo5y4wg3WgDlT69S A==;
X-CSE-ConnectionGUID: 3DUQmyTMTOCghnb5DlNWBg==
X-CSE-MsgGUID: fNDsIGWWR/uY0NztnaPK/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450010"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
X-CSE-ConnectionGUID: cnYV+VWrTW2ZMieyrkcNSQ==
X-CSE-MsgGUID: SAhzNboSQKSmCXdlUicuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320129"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:45 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/15] lib/xe/oa: Add PVC support
Date: Wed,  3 Jul 2024 18:11:29 -0700
Message-ID: <20240704011142.2618968-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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

Add oa-pvc.xml and enable support for PVC.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/meson.build              |    5 +-
 lib/xe/oa-configs/oa-pvc.xml | 1018 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_oa.c               |    4 +
 3 files changed, 1024 insertions(+), 3 deletions(-)
 create mode 100644 lib/xe/oa-configs/oa-pvc.xml

diff --git a/lib/meson.build b/lib/meson.build
index 8c032cbb66..7577bee9d3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -403,10 +403,9 @@ xe_oa_files = [
 
 xe_oa_hardware = [
   'tglgt1', 'tglgt2',
-  'dg1',
-  'rkl',
-  'adl',
+  'dg1', 'rkl', 'adl',
   'acmgt1', 'acmgt2', 'acmgt3',
+  'pvc',
   'mtlgt2', 'mtlgt3',
   'lnl',
 ]
diff --git a/lib/xe/oa-configs/oa-pvc.xml b/lib/xe/oa-configs/oa-pvc.xml
new file mode 100644
index 0000000000..9d212e65ad
--- /dev/null
+++ b/lib/xe/oa-configs/oa-pvc.xml
@@ -0,0 +1,1018 @@
+<?xml version="1.0"?>
+<metrics version="1619079818" merge_md5="">
+  <set name="Compute Metrics Basic"
+       chipset="PVC"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="8d637649-e8f5-4f80-83a4-6575b05d52d8"
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
+    <counter name="SLM Reads"
+             symbol_name="SlmReads"
+             underscore_name="slm_reads"
+             description="The total number of reads from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $EuSubslicesTotalCount UMUL"
+             units="events"
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
+             description="The total number of writes to shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $EuSubslicesTotalCount UMUL"
+             units="events"
+             semantic_type="event"
+             equation="A 31 READ"
+             mdapi_group="L3/Data Port/SLM"
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
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="128  A 37 READ UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EU_ACTIVE_CYCLES"
+             underscore_name="eu_active_cycles"
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
+    <counter name="EU Stall"
+             symbol_name="EU_STALL_CYCLES"
+             underscore_name="eu_stall_cycles"
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
+    <counter name="EU FPU Pipe Active"
+             symbol_name="EU_INST_EXECUTED_ALU0_ALL"
+             underscore_name="eu_inst_executed_alu0_all"
+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM Pipe Active"
+             symbol_name="EU_INST_EXECUTED_ALU1_ALL"
+             underscore_name="eu_inst_executed_alu1_all"
+             description="The percentage of time in which EU EM INT pipeline was actively processing."
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
+    <counter name="SYS Pipe Active"
+             symbol_name="EU_INST_EXECUTED_SYSTOLIC_ALL"
+             underscore_name="eu_inst_executed_systolic_all"
+             description="The percentage of time in which EU SYS pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Send Pipe Active"
+             symbol_name="EU_INST_EXECUTED_SEND_ALL"
+             underscore_name="eu_inst_executed_send_all"
+             description="The percentage of time in which EU send pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM JEU Instruction"
+             symbol_name="EU_INST_EXECUTED_CONTROL_ALL"
+             underscore_name="eu_inst_executed_control_all"
+             description="The percentage of time in which JEU instruction were processed actively on EM INT pipeline."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM And FPU Pipes Active"
+             symbol_name="EU_PIPE_ALU0_AND_ALU1_ACTIVE_CYCLES"
+             underscore_name="eu_pipe_alu0_and_alu1_active_cycles"
+             description="The percentage of time in which EU EM INT and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SYS And FPU Pipes Active"
+             symbol_name="EU_PIPE_ALU0_AND_SYSTOLIC_ACTIVE_CYCLES"
+             underscore_name="eu_pipe_alu0_and_systolic_active_cycles"
+             description="The percentage of time in which EU Systolic and FPU INT64 pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EU_THREADS_OCCUPANCY_ALL"
+             underscore_name="eu_threads_occupancy_all"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 16 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SYSMEM_TRANSACTION_READ"
+             symbol_name="SYSMEM_TRANSACTION_READ"
+             underscore_name="sysmem_transaction_read"
+             description="The number of system memory reads (upstream)"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 7 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SYSMEM_TRANSACTION_WRITE"
+             symbol_name="SYSMEM_TRANSACTION_WRITE"
+             underscore_name="sysmem_transaction_write"
+             description="The number of system memory writes  (upstream)"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 6 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HOST_TO_GPUMEM_TRANSACTION_READ"
+             symbol_name="HOST_TO_GPUMEM_TRANSACTION_READ"
+             underscore_name="host_to_gpumem_transaction_read"
+             description="Host reads to GPU local (HBM) memory (downstream)"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 5 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HOST_TO_GPUMEM_TRANSACTION_WRITE"
+             symbol_name="HOST_TO_GPUMEM_TRANSACTION_WRITE"
+             underscore_name="host_to_gpumem_transaction_write"
+             description="Host writes to GPU local (HBM) memory (downstream)"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 4 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI0"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI0"
+             underscore_name="gpu_memory_request_queue_full_sqidi0"
+             description="The The percentage of time in which SQ 0 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI1"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI1"
+             underscore_name="gpu_memory_request_queue_full_sqidi1"
+             description="The The percentage of time in which SQ 1 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI2"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI2"
+             underscore_name="gpu_memory_request_queue_full_sqidi2"
+             description="The The percentage of time in which SQ 2 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI3"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI3"
+             underscore_name="gpu_memory_request_queue_full_sqidi3"
+             description="The The percentage of time in which SQ 3 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI4"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI4"
+             underscore_name="gpu_memory_request_queue_full_sqidi4"
+             description="The The percentage of time in which SQ 4 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI8"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI8"
+             underscore_name="gpu_memory_request_queue_full_sqidi8"
+             description="The The percentage of time in which SQ 8 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI12"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI12"
+             underscore_name="gpu_memory_request_queue_full_sqidi12"
+             description="The The percentage of time in which SQ 12 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x14307FC0" />
+        <register type="NOA" address="0x00009888" value="0x04306000" />
+        <register type="NOA" address="0x00009888" value="0x14003400" />
+        <register type="NOA" address="0x00009888" value="0x14013400" />
+        <register type="NOA" address="0x00009888" value="0x14023400" />
+        <register type="NOA" address="0x00009888" value="0x14033400" />
+        <register type="NOA" address="0x00009888" value="0x14083400" />
+        <register type="NOA" address="0x00009888" value="0x140C3400" />
+        <register type="NOA" address="0x00009888" value="0x14043400" />
+        <register type="NOA" address="0x00009888" value="0x1A100090" />
+        <register type="NOA" address="0x00009888" value="0x1A110009" />
+        <register type="NOA" address="0x00009888" value="0x00142000" />
+        <register type="NOA" address="0x00009888" value="0x0050FFE0" />
+        <register type="NOA" address="0x00009888" value="0x00300240" />
+        <register type="NOA" address="0x00009888" value="0x0E300695" />
+        <register type="NOA" address="0x00009888" value="0x10300824" />
+        <register type="NOA" address="0x00009888" value="0x02300000" />
+        <register type="NOA" address="0x00009888" value="0x00000002" />
+        <register type="NOA" address="0x00009888" value="0x0E000080" />
+        <register type="NOA" address="0x00009888" value="0x04000000" />
+        <register type="NOA" address="0x00009888" value="0x00010002" />
+        <register type="NOA" address="0x00009888" value="0x0E010002" />
+        <register type="NOA" address="0x00009888" value="0x04010000" />
+        <register type="NOA" address="0x00009888" value="0x00020002" />
+        <register type="NOA" address="0x00009888" value="0x0C020080" />
+        <register type="NOA" address="0x00009888" value="0x04020000" />
+        <register type="NOA" address="0x00009888" value="0x00030002" />
+        <register type="NOA" address="0x00009888" value="0x0C030002" />
+        <register type="NOA" address="0x00009888" value="0x04030000" />
+        <register type="NOA" address="0x00009888" value="0x00080002" />
+        <register type="NOA" address="0x00009888" value="0x0A080002" />
+        <register type="NOA" address="0x00009888" value="0x04080000" />
+        <register type="NOA" address="0x00009888" value="0x00128000" />
+        <register type="NOA" address="0x00009888" value="0x00160800" />
+        <register type="NOA" address="0x00009888" value="0x000C0002" />
+        <register type="NOA" address="0x00009888" value="0x080C0080" />
+        <register type="NOA" address="0x00009888" value="0x040C0000" />
+        <register type="NOA" address="0x00009888" value="0x00040002" />
+        <register type="NOA" address="0x00009888" value="0x0A040080" />
+        <register type="NOA" address="0x00009888" value="0x04040000" />
+        <register type="NOA" address="0x00009888" value="0x2C500000" />
+        <register type="NOA" address="0x00009888" value="0x2E500400" />
+        <register type="NOA" address="0x00009888" value="0x30500000" />
+        <register type="NOA" address="0x00009888" value="0x18500000" />
+        <register type="NOA" address="0x00009888" value="0x32500A05" />
+        <register type="NOA" address="0x00009888" value="0x20500030" />
+        <register type="NOA" address="0x00009888" value="0x22500603" />
+        <register type="NOA" address="0x00009888" value="0x24500030" />
+        <register type="NOA" address="0x00009888" value="0x26500603" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x01404400" />
+        <register type="NOA" address="0x00009888" value="0x01414400" />
+        <register type="NOA" address="0x00009888" value="0x030755A0" />
+        <register type="NOA" address="0x00009888" value="0x0308AA00" />
+        <register type="NOA" address="0x00009888" value="0x01000040" />
+        <register type="NOA" address="0x00009888" value="0x01010040" />
+        <register type="NOA" address="0x00009888" value="0x01021000" />
+        <register type="NOA" address="0x00009888" value="0x01036400" />
+        <register type="NOA" address="0x00009888" value="0x0104A800" />
+        <register type="NOA" address="0x00009888" value="0x03045555" />
+        <register type="NOA" address="0x00009888" value="0x0305555A" />
+        <register type="NOA" address="0x00009888" value="0x0106FC00" />
+        <register type="NOA" address="0x00009888" value="0x01190400" />
+        <register type="NOA" address="0x00009888" value="0x011B0400" />
+        <register type="NOA" address="0x00009888" value="0x011C4800" />
+        <register type="NOA" address="0x00009888" value="0x011E4000" />
+        <register type="NOA" address="0x00009888" value="0x01108000" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00001002" />
+        <register type="FLEX" address="0x0000E758" value="0x0000A009" />
+        <register type="FLEX" address="0x0000E45C" value="0x00008003" />
+    </register_config>
+  </set>
+
+  <set name="TestOa"
+       chipset="PVC"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="339a376a-4696-4e0d-812a-5fd13b0e1aa8"
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
+    <counter name="TestCounter3"
+             symbol_name="Counter3"
+             underscore_name="counter3"
+             description="HW test counter 3. Factor: 0.5"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 2 READ"
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
+             equation="B 3 READ"
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
+             equation="B 4 READ"
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
+    <counter name="L3_BANK_INPUT_AVAILABLE _L3BANK0"
+             symbol_name="L3_BANK_INPUT_AVAILABLE_L3BANK0"
+             underscore_name="l3_bank_input_available_l3_bank0"
+             description="The percentage of time in which l3 bank 0 input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="1"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice_bank"
+             />
+    <counter name="L3_OUTPUT_READY _L3BANK0"
+             symbol_name="L3_OUTPUT_READY_L3BANK0"
+             underscore_name="l3_output_ready_l3_bank0"
+             description="The percentage of time in which l3 bank 0 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="1"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice_bank"
+             />
+    <counter name="L3_READ _L3BANK0"
+             symbol_name="L3_READ_L3BANK0"
+             underscore_name="l3_read_l3_bank0"
+             description="The number of L3 bank 0 read requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 5 READ"
+             availability="1"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice_bank"
+             />
+    <counter name="L3_WRITE _L3BANK0"
+             symbol_name="L3_WRITE_L3BANK0"
+             underscore_name="l3_write_l3_bank0"
+             description="The number of L3 Bank 0 write requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 4 READ"
+             availability="1"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice_bank"
+             />
+    <counter name="THREADGROUP_DISPATCH_QUEUE0_ACTIVE_CYCLES _DUALSUBSLICE0"
+             symbol_name="THREADGROUP_DISPATCH_QUEUE0_ACTIVE_CYCLES_DUALSUBSLICE0"
+             underscore_name="threadgroup_dispatch_queue0_active_cycles_dualsubslice0"
+             description="The percentage of time in which non-PS thread is ready for dispatch in thread dispatcher 0 queue 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="THREADGROUP_DISPATCH_QUEUE1_ACTIVE_CYCLES _DUALSUBSLICE0"
+             symbol_name="THREADGROUP_DISPATCH_QUEUE1_ACTIVE_CYCLES_DUALSUBSLICE0"
+             underscore_name="threadgroup_dispatch_queue1_active_cycles_dualsubslice0"
+             description="The percentage of time in which non-PS thread is ready for dispatch in thread dispatcher 0 queue 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
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
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
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
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 10 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
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
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
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
+    <counter name="Gti Read Transactions"
+             symbol_name="GtiReadTransactions"
+             underscore_name="gti_read_transactions"
+             description="The total number of read transactions sent to GTI interfaces"
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $EuSlicesTotalCount 4 UGT 8 UMUL $EuSlicesTotalCount 4 ULTE $EuSlicesTotalCount 1 UADD 0x6 AND UMUL UADD UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 36 READ"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Transactions"
+             symbol_name="GtiWriteTransactions"
+             underscore_name="gti_write_transactions"
+             description="The total number of write transactions sent to GTI interfaces"
+             data_type="uint64"
+             max_equation="$GpuCoreClocks $EuSlicesTotalCount 4 UGT 8 UMUL $EuSlicesTotalCount 4 ULTE $EuSlicesTotalCount 1 UADD 0x6 AND UMUL UADD UMUL"
+             units="messages"
+             semantic_type="event"
+             equation="A 37 READ"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009884" value="0x00000008" />
+        <register type="NOA" address="0x00009888" value="0x3B410000" />
+        <register type="NOA" address="0x00009888" value="0x0140000A" />
+        <register type="NOA" address="0x00009888" value="0x33406A80" />
+        <register type="NOA" address="0x00009888" value="0x07410006" />
+        <register type="NOA" address="0x00009888" value="0x17410033" />
+        <register type="NOA" address="0x00009888" value="0x03410000" />
+        <register type="NOA" address="0x00009888" value="0x4F410000" />
+        <register type="NOA" address="0x00009888" value="0x01030005" />
+        <register type="NOA" address="0x00009888" value="0x03035540" />
+        <register type="NOA" address="0x00009888" value="0x0104000A" />
+        <register type="NOA" address="0x00009888" value="0x0304AA80" />
+        <register type="NOA" address="0x00009888" value="0x1D500003" />
+        <register type="NOA" address="0x00009888" value="0x02E71540" />
+        <register type="NOA" address="0x00009888" value="0x02EA2A80" />
+        <register type="NOA" address="0x00009888" value="0x02E82A80" />
+        <register type="NOA" address="0x00009888" value="0x00F07803" />
+        <register type="NOA" address="0x00009888" value="0x00F10005" />
+        <register type="NOA" address="0x00009888" value="0x02F12A80" />
+        <register type="NOA" address="0x00009888" value="0x00F20003" />
+        <register type="NOA" address="0x00009888" value="0x22F30012" />
+        <register type="NOA" address="0x00009888" value="0x26F32490" />
+        <register type="NOA" address="0x00009888" value="0x00F4000A" />
+        <register type="NOA" address="0x00009888" value="0x22D3003F" />
+        <register type="NOA" address="0x00009884" value="0x00000004" />
+        <register type="NOA" address="0x00009888" value="0x044C2000" />
+        <register type="NOA" address="0x00009888" value="0x064C6000" />
+        <register type="NOA" address="0x00009888" value="0x004C0010" />
+        <register type="NOA" address="0x00009888" value="0x0E4C0180" />
+        <register type="NOA" address="0x00009888" value="0x104C0305" />
+        <register type="NOA" address="0x00009888" value="0x124C0007" />
+        <register type="NOA" address="0x00009884" value="0x0000000C" />
+        <register type="NOA" address="0x00009888" value="0x0050F803" />
+        <register type="NOA" address="0x00009888" value="0x1C500000" />
+        <register type="NOA" address="0x00009888" value="0x1E500000" />
+        <register type="NOA" address="0x00009888" value="0x28500000" />
+        <register type="NOA" address="0x00009888" value="0x18500000" />
+        <register type="NOA" address="0x00009888" value="0x20500000" />
+        <register type="NOA" address="0x00009888" value="0x22500C06" />
+        <register type="NOA" address="0x00009888" value="0x24500060" />
+        <register type="NOA" address="0x00009888" value="0x26501606" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x28036400" />
+        <register type="NOA" address="0x00009888" value="0x2A030080" />
+        <register type="NOA" address="0x00009888" value="0x06031300" />
+        <register type="NOA" address="0x00009888" value="0x08030FB0" />
+        <register type="NOA" address="0x00009888" value="0x00030000" />
+        <register type="NOA" address="0x00009888" value="0x00C00005" />
+        <register type="NOA" address="0x00009888" value="0x00C1000F" />
+        <register type="NOA" address="0x00009888" value="0x00C2000F" />
+        <register type="NOA" address="0x00009888" value="0x00C3001B" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x5C030002" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x70800000" />
+        <register type="OA" address="0x0000DC40" value="0x007F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC00" value="0x00000004" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC08" value="0x00000003" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00100002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFB" />
+        <register type="OA" address="0x0000DC10" value="0x00100002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFB" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC18" value="0x00100002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D960" value="0x00100042" />
+        <register type="OA" address="0x0000D964" value="0x0000FFF7" />
+        <register type="OA" address="0x0000DC20" value="0x00100042" />
+        <register type="OA" address="0x0000DC24" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D968" value="0x00000002" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFFE" />
+        <register type="OA" address="0x0000DC28" value="0x00000002" />
+        <register type="OA" address="0x0000DC2C" value="0x0000FFFE" />
+        <register type="OA" address="0x0000D970" value="0x00000002" />
+        <register type="OA" address="0x0000D974" value="0x0000FFFD" />
+        <register type="OA" address="0x0000DC30" value="0x00000002" />
+        <register type="OA" address="0x0000DC34" value="0x0000FFFD" />
+        <register type="OA" address="0x00002B2C" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00008003" />
+        <register type="FLEX" address="0x0000E658" value="0x00001000" />
+        <register type="FLEX" address="0x0000E758" value="0x0000A009" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 98c53620d3..7974584392 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -36,6 +36,7 @@
 #include "xe_oa_metrics_acmgt3.h"
 #include "xe_oa_metrics_mtlgt2.h"
 #include "xe_oa_metrics_mtlgt3.h"
+#include "xe_oa_metrics_pvc.h"
 #include "xe_oa_metrics_lnl.h"
 
 static struct intel_xe_perf_logical_counter_group *
@@ -296,6 +297,9 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
 			intel_xe_perf_load_metrics_acmgt3(perf);
 		else
 			return unsupported_xe_oa_platform(perf);
+	} else if (devinfo->is_pontevecchio) {
+		perf->devinfo.eu_threads_count = 8;
+		intel_xe_perf_load_metrics_pvc(perf);
 	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else {
-- 
2.41.0

