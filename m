Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7120CD3435
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01510E5AB;
	Tue,  3 Sep 2024 13:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9bdNitT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F9F10E5A7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725369903; x=1756905903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fp95Fgs9cM4MwTe37b6rlhzk4pmVdsCdFqkReE+WlGM=;
 b=m9bdNitTJ91/ltnsbdQZJNK9ISUNrRlY3WMPfuGYjPnPAqBcZvsyY00a
 EgS01uVOYnW/mdC12uvLfgaIrxomDC6987gPDDJ9MuuaBYbkq/t4V006d
 V6oEJc1EkcUzUEAgUXkLR/c3x/fKXDMwJUTMaIjMsD6bQdukTGZwWBJTr
 0fDGcHqsAsEgmfzihR1uDGtEx+fkUdtAqsejqGhTgdS90lXXBBPGlMwY2
 jxsDWvp/jPStX2SQVFyPV1K8hgurJsi0SWRWpQOWJd+T+KLhq6zpZGCds
 pKN1mJ90upMR69Fvg9+epxTQ6djdonE1POAXW0vQlecFFT7qo+kJuDtIi A==;
X-CSE-ConnectionGUID: zHpk+K3OReynpaU/0nKFUA==
X-CSE-MsgGUID: ZqlMScGnR6GfraVtgMdQ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23842604"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23842604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:25:00 -0700
X-CSE-ConnectionGUID: dOPRTUyxTIKP6nMBTj63Ww==
X-CSE-MsgGUID: 8vQos68iRx26TofJU33Omw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69540743"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:24:53 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t v2 2/4] xe/oa: Update oa-lnl.xml
Date: Tue,  3 Sep 2024 06:24:34 -0700
Message-ID: <20240903132436.8337-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903132436.8337-1-jose.souza@intel.com>
References: <20240903132436.8337-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

File was updated using latest HW definitions.
Most relevant change was the drop of TestOa metric.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/xe/oa-configs/oa-lnl.xml | 290 +++++------------------------------
 1 file changed, 39 insertions(+), 251 deletions(-)

diff --git a/lib/xe/oa-configs/oa-lnl.xml b/lib/xe/oa-configs/oa-lnl.xml
index 8ddee11de2..5a8586f03a 100644
--- a/lib/xe/oa-configs/oa-lnl.xml
+++ b/lib/xe/oa-configs/oa-lnl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1716582996" merge_md5="">
+<metrics version="1725302004" merge_md5="">
   <set name="RenderBasic"
        chipset="LNL"
        symbol_name="RenderBasic"
@@ -519,7 +519,7 @@
     <counter name="XVE Inst Executed ALU1 All"
              symbol_name="XVE_INST_EXECUTED_ALU1_ALL"
              underscore_name="xve_inst_executed_alu1_all"
-             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -584,7 +584,7 @@
     <counter name="XVE Inst Executed ALU1 CS"
              symbol_name="XVE_INST_EXECUTED_ALU1_CS"
              underscore_name="xve_inst_executed_alu1_cs"
-             description="Number of execution slots taken by instructions executed by CS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by CS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -597,7 +597,7 @@
     <counter name="XVE Inst Executed ALU1 PS"
              symbol_name="XVE_INST_EXECUTED_ALU1_PS"
              underscore_name="xve_inst_executed_alu1_ps"
-             description="Number of execution slots taken by instructions executed by PS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by PS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -610,7 +610,7 @@
     <counter name="XVE Inst Executed ALU1 VS"
              symbol_name="XVE_INST_EXECUTED_ALU1_VS"
              underscore_name="xve_inst_executed_alu1_vs"
-             description="Number of execution slots taken by instructions executed by VS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by VS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -636,7 +636,7 @@
     <counter name="RT BVH Cache Miss"
              symbol_name="RT_BVH_CACHE_MISS"
              underscore_name="rt_bvh_cache_miss"
-             description="Number of BVH cache misses for RayQuery only"
+             description="Number of BVH cache misses"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -844,7 +844,7 @@
     <counter name="XVE Inst Executed ALU1 All Utilization"
              symbol_name="XVE_INST_EXECUTED_ALU1_ALL_UTILIZATION"
              underscore_name="xve_inst_executed_alu1_all_utilization"
-             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -1259,7 +1259,7 @@
     <counter name="XVE Inst Executed ALU1 All"
              symbol_name="XVE_INST_EXECUTED_ALU1_ALL"
              underscore_name="xve_inst_executed_alu1_all"
-             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -1480,7 +1480,7 @@
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
-             description="Number of Device Cache accesses (except atomics) which hits in the Device Cache cache"
+             description="Number of Device Cache accesses which hits in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -1493,7 +1493,7 @@
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
-             description="Number of Device Cache accesses (except atomics) which miss in the Device Cache cache"
+             description="Number of Device Cache accesses which miss in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -1792,7 +1792,7 @@
     <counter name="XVE Inst Executed ALU1 All Utilization"
              symbol_name="XVE_INST_EXECUTED_ALU1_ALL_UTILIZATION"
              underscore_name="xve_inst_executed_alu1_all_utilization"
-             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -2641,7 +2641,7 @@
     <counter name="AMFS L3 Hit"
              symbol_name="AMFS_L3_HIT"
              underscore_name="amfs_l3_hit"
-             description="Number of AMFS hits (except atomics) in Device Cache"
+             description="Number of AMFS hits in Device Cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -2719,7 +2719,7 @@
     <counter name="Load Store Cache L3 Hit"
              symbol_name="LOAD_STORE_CACHE_L3_HIT"
              underscore_name="load_store_cache_l3_hit"
-             description="Number of Load Store Cache requests (except atomics) to Device Cache that are hit"
+             description="Number of Load Store Cache requests to Device Cache that are hit"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -2823,7 +2823,7 @@
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
-             description="Number of Device Cache accesses (except atomics) which hits in the Device Cache cache"
+             description="Number of Device Cache accesses which hits in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -2836,7 +2836,7 @@
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
-             description="Number of Device Cache accesses (except atomics) which miss in the Device Cache cache"
+             description="Number of Device Cache accesses which miss in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3422,7 +3422,7 @@
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
-             description="Number of Device Cache accesses (except atomics) which hits in the Device Cache cache"
+             description="Number of Device Cache accesses which hits in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3435,7 +3435,7 @@
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
-             description="Number of Device Cache accesses (except atomics) which miss in the Device Cache cache"
+             description="Number of Device Cache accesses which miss in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3760,7 +3760,7 @@
     <counter name="Copy Engine Read Request"
              symbol_name="COPY_ENGINE_READ_REQUEST"
              underscore_name="copy_engine_read_request"
-             description="Number of read requests sent by the Main Copy Engine"
+             description="Number of read requests sent by the Copy Engine"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3786,7 +3786,7 @@
     <counter name="Copy Engine Write Request"
              symbol_name="COPY_ENGINE_WRITE_REQUEST"
              underscore_name="copy_engine_write_request"
-             description="Number of write requests sent by the Main Copy Engine"
+             description="Number of write requests sent by the Copy Engine"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -4522,7 +4522,7 @@
     <counter name="Threadgroup Dispatch Queue0 Resource Stall"
              symbol_name="THREADGROUP_DISPATCH_QUEUE0_RESOURCE_STALL"
              underscore_name="threadgroup_dispatch_queue0_resource_stall"
-             description="Percentage of time in which Thread Spawner queue 0 is stalled waiting for resources to be available (SLM, Barrier, BTD stack)"
+             description="Percentage of time in which Thread Spawner queue 0 is stalled waiting for any resource to be available (for example, SLM, Barrier, BTD stack, etc.)"
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -4535,7 +4535,7 @@
     <counter name="Threadgroup Dispatch Queue1 Resource Stall"
              symbol_name="THREADGROUP_DISPATCH_QUEUE1_RESOURCE_STALL"
              underscore_name="threadgroup_dispatch_queue1_resource_stall"
-             description="Percentage of time in which Thread Spawner queue 1 is stalled waiting for resources to be available (SLM, Barrier, BTD stack)"
+             description="Percentage of time in which Thread Spawner queue 1 is stalled waiting for any resource to be available (for example, SLM, Barrier, BTD stack, etc.)"
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -4907,7 +4907,7 @@
     <counter name="RT Any Hit Thread Ray Dispatch"
              symbol_name="RT_ANY_HIT_THREAD_RAY_DISPATCH"
              underscore_name="rt_any_hit_thread_ray_dispatch"
-             description="Number of any hit threads dispatched for RayQuery only"
+             description="Number of any hit threads dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -4920,7 +4920,7 @@
     <counter name="RT Callable Thread Ray Dispatch"
              symbol_name="RT_CALLABLE_THREAD_RAY_DISPATCH"
              underscore_name="rt_callable_thread_ray_dispatch"
-             description="Number of callable threads dispatched for RayQuery only"
+             description="Number of callable threads dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -4933,7 +4933,7 @@
     <counter name="RT Closest Hit Thread Ray Dispatch"
              symbol_name="RT_CLOSEST_HIT_THREAD_RAY_DISPATCH"
              underscore_name="rt_closest_hit_thread_ray_dispatch"
-             description="Number of closest hit threads dispatched for RayQuery only"
+             description="Number of closest hit threads dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -4985,7 +4985,7 @@
     <counter name="RT Intersection Thread Ray Dispatch"
              symbol_name="RT_INTERSECTION_THREAD_RAY_DISPATCH"
              underscore_name="rt_intersection_thread_ray_dispatch"
-             description="Number of intersection threads dispatched for RayQuery only"
+             description="Number of intersection threads dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5011,7 +5011,7 @@
     <counter name="RT Miss Thread Ray Dispatch"
              symbol_name="RT_MISS_THREAD_RAY_DISPATCH"
              underscore_name="rt_miss_thread_ray_dispatch"
-             description="Number of miss threads dispatched for RayQuery only"
+             description="Number of miss threads dispatched"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5180,7 +5180,7 @@
     <counter name="XVE Inst Executed ALU1 RT AHS"
              symbol_name="XVE_INST_EXECUTED_ALU1_RT_AHS"
              underscore_name="xve_inst_executed_alu1_rt_ahs"
-             description="Number of execution slots taken by instructions executed by RT_AHS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by RT_AHS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5193,7 +5193,7 @@
     <counter name="XVE Inst Executed ALU1 RT CHS"
              symbol_name="XVE_INST_EXECUTED_ALU1_RT_CHS"
              underscore_name="xve_inst_executed_alu1_rt_chs"
-             description="Number of execution slots taken by instructions executed by RT_CHS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by RT_CHS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5206,7 +5206,7 @@
     <counter name="XVE Inst Executed ALU1 RT MS"
              symbol_name="XVE_INST_EXECUTED_ALU1_RT_MS"
              underscore_name="xve_inst_executed_alu1_rt_ms"
-             description="Number of execution slots taken by instructions executed by RT_MS threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by RT_MS threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5232,7 +5232,7 @@
     <counter name="RT BVH Cache Miss"
              symbol_name="RT_BVH_CACHE_MISS"
              underscore_name="rt_bvh_cache_miss"
-             description="Number of BVH cache misses for RayQuery only"
+             description="Number of BVH cache misses"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5539,7 +5539,7 @@
     <counter name="XVE Inst Executed ALU1 All"
              symbol_name="XVE_INST_EXECUTED_ALU1_ALL"
              underscore_name="xve_inst_executed_alu1_all"
-             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe"
+             description="Number of execution slots taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5604,7 +5604,7 @@
     <counter name="XVE Inst Executed Fp16"
              symbol_name="XVE_INST_EXECUTED_FP16"
              underscore_name="xve_inst_executed_fp16"
-             description="Number of execution slots taken by FP16 ALU instructions"
+             description="Number of execution slots taken by FP16 ALU instructions. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5617,7 +5617,7 @@
     <counter name="XVE Inst Executed Fp32"
              symbol_name="XVE_INST_EXECUTED_FP32"
              underscore_name="xve_inst_executed_fp32"
-             description="Number of execution slots taken by FP32 ALU instructions"
+             description="Number of execution slots taken by FP32 ALU instructions. Does not include extended math instructions."
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5708,7 +5708,7 @@
     <counter name="XVE Inst Executed Nondivergent"
              symbol_name="XVE_INST_EXECUTED_NONDIVERGENT"
              underscore_name="xve_inst_executed_nondivergent"
-             description="Number of execution slots taken by non-divergent instructions"
+             description="Number of non-divergent instructions (not execution slots) executed"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5721,7 +5721,7 @@
     <counter name="XVE Inst Executed Predication"
              symbol_name="XVE_INST_EXECUTED_PREDICATION"
              underscore_name="xve_inst_executed_predication"
-             description="Number of execution slots taken by instructions with predication mask enabled"
+             description="Number of instructions (not execution slots) executed with predication mask enabled"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5890,7 +5890,7 @@
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
-             description="Number of Device Cache accesses (except atomics) which hits in the Device Cache cache"
+             description="Number of Device Cache accesses which hits in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -5903,7 +5903,7 @@
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
-             description="Number of Device Cache accesses (except atomics) which miss in the Device Cache cache"
+             description="Number of Device Cache accesses which miss in the Device Cache cache"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -6581,7 +6581,7 @@
     <counter name="Threadgroup Dispatch Queue0 Resource Stall"
              symbol_name="THREADGROUP_DISPATCH_QUEUE0_RESOURCE_STALL"
              underscore_name="threadgroup_dispatch_queue0_resource_stall"
-             description="Percentage of time in which Thread Spawner queue 0 is stalled waiting for resources to be available (SLM, Barrier, BTD stack)"
+             description="Percentage of time in which Thread Spawner queue 0 is stalled waiting for any resource to be available (for example, SLM, Barrier, BTD stack, etc.)"
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -6594,7 +6594,7 @@
     <counter name="Threadgroup Dispatch Queue1 Resource Stall"
              symbol_name="THREADGROUP_DISPATCH_QUEUE1_RESOURCE_STALL"
              underscore_name="threadgroup_dispatch_queue1_resource_stall"
-             description="Percentage of time in which Thread Spawner queue 1 is stalled waiting for resources to be available (SLM, Barrier, BTD stack)"
+             description="Percentage of time in which Thread Spawner queue 1 is stalled waiting for any resource to be available (for example, SLM, Barrier, BTD stack, etc.)"
              data_type="float"
              units="percent"
              semantic_type="duration"
@@ -6769,216 +6769,4 @@
     </register_config>
   </set>
 
-  <set name="TestOa"
-       chipset="LNL"
-       symbol_name="TestOa"
-       underscore_name="test_oa"
-       mdapi_supported_apis="VK OGL OCL IO"
-       oa_format="576B_PEC64LL"
-       hw_config_guid="24c33f2c-f8d9-40d9-b2db-64e863b4d625"
-       >
-    <counter name="GPU Time Elapsed"
-             symbol_name="GpuTime"
-             underscore_name="gpu_time"
-             description="Time elapsed on the GPU during the measurement."
-             data_type="uint64"
-             units="ns"
-             semantic_type="event"
-             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
-             mdapi_group="GPU"
-             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="GPU Core Clocks"
-             symbol_name="GpuCoreClocks"
-             underscore_name="gpu_core_clocks"
-             description="The total number of GPU core clocks elapsed during the measurement."
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="GPU_CLOCK 0 READ"
-             mdapi_group="GPU"
-             mdapi_usage_flags="Tier1 Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="AVG GPU Core Frequency"
-             symbol_name="AvgGpuCoreFrequency"
-             underscore_name="avg_gpu_core_frequency"
-             description="Average GPU Core Frequency in the measurement."
-             data_type="uint64"
-             max_equation="$GpuMaxFrequency"
-             units="hz"
-             semantic_type="event"
-             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
-             mdapi_group="GPU"
-             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="GPU Busy"
-             symbol_name="GPU_BUSY"
-             underscore_name="gpu_busy"
-             description="Percentage of time in which GPU is not idle including all GPU engines"
-             data_type="float"
-             units="percent"
-             semantic_type="duration"
-             equation="PEC 32 READ 100 UMUL $GpuCoreClocks FDIV"
-             mdapi_group="Front End"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="IA Vertex"
-             symbol_name="IA_VERTEX"
-             underscore_name="ia_vertex"
-             description="Number of vertices in a draw"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 33 READ"
-             mdapi_group="Geometry"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="GpGpu Threadgroup Count"
-             symbol_name="GPGPU_THREADGROUP_COUNT"
-             underscore_name="gpgpu_threadgroup_count"
-             description="Number of GPGPU threadgroups dispatched"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 0 READ"
-             mdapi_group="Thread Dispatcher"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Async GpGpu Threadgroup Count"
-             symbol_name="ASYNC_GPGPU_THREADGROUP_COUNT"
-             underscore_name="async_gpgpu_threadgroup_count"
-             description="Number of Async GPGPU threadgroups dispatched"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 1 READ"
-             mdapi_group="Thread Dispatcher"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Rasterizer Sample Output"
-             symbol_name="RASTERIZER_SAMPLE_OUTPUT"
-             underscore_name="rasterizer_sample_output"
-             description="Number of lit samples emitted by Rasterizer"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 34 READ"
-             mdapi_group="Rasterizer"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Test Event1"
-             symbol_name="TEST_EVENT1"
-             underscore_name="test_event1"
-             description="Number of GPU (gt) clock cycles at every clock period"
-             data_type="float"
-             units="percent"
-             semantic_type="duration"
-             equation="PEC 2 READ $XeCoreTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
-             mdapi_group="Test"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Test Event1 Cycles"
-             symbol_name="TEST_EVENT1_CYCLES"
-             underscore_name="test_event1_cycles"
-             description="Number of GPU (gt) clock cycles at every clock period"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 2 READ"
-             mdapi_group="Test"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Test Event1 Cycles Average"
-             symbol_name="TEST_EVENT1_CYCLES_AVERAGE"
-             underscore_name="test_event1_cycles_average"
-             description="Average number of GPU (gt) clock cycles at every clock period"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 2 READ $XeCoreTotalCount UDIV"
-             mdapi_group="Test"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Test Event2"
-             symbol_name="TEST_EVENT2"
-             underscore_name="test_event2"
-             description="Number of GPU (gt) clock cycles at every other clock period"
-             data_type="float"
-             units="percent"
-             semantic_type="duration"
-             equation="PEC 35 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
-             mdapi_group="Test"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <counter name="Test Event2 Cycles"
-             symbol_name="TEST_EVENT2_CYCLES"
-             underscore_name="test_event2_cycles"
-             description="Number of GPU (gt) clock cycles at every other clock period"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 35 READ"
-             mdapi_group="Test"
-             mdapi_usage_flags="Frame Batch Draw"
-             mdapi_supported_apis=""
-             mdapi_hw_unit_type="gpu"
-             />
-    <register_config type="OA">
-        <register type="OA" address="0x00013000" value="0x00001801" />
-        <register type="OA" address="0x00013004" value="0x00000000" />
-        <register type="OA" address="0x00013008" value="0x00001802" />
-        <register type="OA" address="0x0001300C" value="0x00000000" />
-        <register type="OA" address="0x00013010" value="0x00003E00" />
-        <register type="OA" address="0x00013014" value="0x00000000" />
-        <register type="OA" address="0x00013300" value="0x00005A00" />
-        <register type="OA" address="0x00013304" value="0x00000000" />
-        <register type="OA" address="0x00013500" value="0x00005A00" />
-        <register type="OA" address="0x00013504" value="0x00000000" />
-        <register type="OA" address="0x00013700" value="0x00005A00" />
-        <register type="OA" address="0x00013704" value="0x00000000" />
-        <register type="OA" address="0x00013308" value="0x00004405" />
-        <register type="OA" address="0x0001330C" value="0x00000000" />
-        <register type="OA" address="0x00013508" value="0x00004405" />
-        <register type="OA" address="0x0001350C" value="0x00000000" />
-        <register type="OA" address="0x00013708" value="0x00004405" />
-        <register type="OA" address="0x0001370C" value="0x00000000" />
-        <register type="OA" address="0x00013310" value="0x00006805" />
-        <register type="OA" address="0x00013314" value="0x00000000" />
-        <register type="OA" address="0x00013510" value="0x00006805" />
-        <register type="OA" address="0x00013514" value="0x00000000" />
-        <register type="OA" address="0x00013710" value="0x00006805" />
-        <register type="OA" address="0x00013714" value="0x00000000" />
-        <register type="OA" address="0x00013318" value="0x00007E00" />
-        <register type="OA" address="0x0001331C" value="0x00000000" />
-        <register type="OA" address="0x00013518" value="0x00007E00" />
-        <register type="OA" address="0x0001351C" value="0x00000000" />
-        <register type="OA" address="0x00013718" value="0x00007E00" />
-        <register type="OA" address="0x0001371C" value="0x00000000" />
-    </register_config>
-  </set>
-
 </metrics>
-- 
2.46.0

