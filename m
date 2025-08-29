Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A986FCA0FFD
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 17:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A57B10E1B2;
	Fri, 29 Aug 2025 17:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBe/h/6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F0C10E09A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487721; x=1788023721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWz3rqSPXXfR9Pq/VnHlXjfK4beow2BB4HyPW6ErkVs=;
 b=PBe/h/6lsYuO36Saosg1jF6wt+Uz9X7FYC53xKOXou2P0MwNEYO03z4W
 TgWp/LQ6hn2AlGBhTl4AL8py7J3hcUcDn6M0s05fMEvD4uJ4DzNaayQKw
 TykZz6BdKhrBLjPpxI8IdBrF4TQNNyPnylAFr+l2yoXJpqxyUbIe1BaLf
 7G/cH97pjWpH0x4AgGEAURhcnOFlI8mztnEEW/Gz+RDjwMzTcOsGhxiFy
 TuIMrRo9+Fe7fU/obZxtbc4dpVNAiGY3cz2Sy4Bbq/xR5qyLanwv/jPVr
 q7vfX62Soh4Cch+kqJHcYg+VBIkQzkSDkimMq+c1CvB9kvgxowmlk0xnz A==;
X-CSE-ConnectionGUID: sGhhHxxnSJqD0uR1eE6c7w==
X-CSE-MsgGUID: 8fhTFn0dQJmPoMhg2LKmgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212405"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:20 -0700
X-CSE-ConnectionGUID: WDMNDxy+SL2sJ+1i1xSXqg==
X-CSE-MsgGUID: lOpbLKVWS3y+OEwUuDdyDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170816740"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:19 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 2/4] lib/xe/oa: Update BMG XML's
Date: Fri, 29 Aug 2025 10:15:04 -0700
Message-ID: <20250829171506.3148434-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
References: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
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

Update BMG XML's after recent updates to mdapi-xml-convert.py. This now
allows importing OA media metric sets.

Generated via repeated invocations of:
        update-guids.py --guids=guids.xml MetricsXML_BMG.xml > guids.bmg.xml
        # copy new guid's from guids.bmg.xml into guids.xml
        mdapi-xml-convert.py --guids=guids.xml MetricsXML_BMG.xml > oa-bmg.xml

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/guids.xml  |    4 +
 lib/xe/oa-configs/oa-bmg.xml | 1755 ++++++++++++++++++++++++++++++++--
 2 files changed, 1699 insertions(+), 60 deletions(-)

diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index d355910de8..23bca5b53c 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2774,6 +2774,10 @@
     <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="dfe5251f-af3e-434c-b627-38490f2213da" chipset="bmg" name="VectorEngineProfile" />
     <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="d008dcae-2a82-4929-a94d-2ba1e9c569d6" chipset="bmg" name="VectorEngineStalls" />
     <guid config_hash="6723e2305bfd92e1d94c4242e476ee36" mdapi_config_hash="8c21cff2375af4159f5abd0ef05ee97a" id="9ec392a7-4c77-4253-a28a-85240821e82c" chipset="bmg" name="TestOa" />
+    <guid config_hash="c7b6f592e1c39533b9a1eeecc2687226" mdapi_config_hash="c0632c53c9183132f0034fce4aed0e10" id="a94b753d-d342-4eef-a865-c71b0d2f1359" chipset="bmg" name="XvePipelineRasterizationProfile" />
+    <guid config_hash="421c414831e0e456e46d819b7de7e797" mdapi_config_hash="1f02792f434e4215a4bd9abf384dc74d" id="961f1fa0-0c8e-4c16-bcaf-cb6704c96eda" chipset="bmg" name="XvePipelineRaytracingProfile" />
+    <guid config_hash="daed5f485b35c73cf7376a59c886992e" mdapi_config_hash="1487e5095d81be198fb4c52d5ff8e946" id="eecad08f-ddb6-40cb-9abb-dbbdafd0c47a" chipset="bmg" name="MediaSet1" />
+    <guid config_hash="74821ef3fc37586d03e7c14362df4474" mdapi_config_hash="883c847bdfecb4051eb3fde4009cf4ec" id="7b0b93c9-d355-4179-af35-6db495ca6388" chipset="bmg" name="MediaSet2" />
     <guid config_hash="208c3c79f1b4db2f86277292566d3f10" mdapi_config_hash="1fbaf5ad061ccf96ff7d4e108cbcf3ae" id="a78beb3a-98d1-48cc-86ee-29bb3cc3b5a7" chipset="ptl" name="RenderBasic" />
     <guid config_hash="39eb89a5a9a33ab05bce6069f77e0cbb" mdapi_config_hash="24837cfd6478062c78968430d5f8a902" id="751a8e91-f8cd-49ba-95ef-28f45fd4ded6" chipset="ptl" name="ComputeBasic" />
     <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="b7f6cc1f-8092-44c2-8889-82ca13aa736a" chipset="ptl" name="DepthProfile" />
diff --git a/lib/xe/oa-configs/oa-bmg.xml b/lib/xe/oa-configs/oa-bmg.xml
index b94e7f9ca1..4d9a9a66ba 100644
--- a/lib/xe/oa-configs/oa-bmg.xml
+++ b/lib/xe/oa-configs/oa-bmg.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1731618854" merge_md5="">
+<metrics version="1756424812" merge_md5="">
   <set name="RenderBasic"
        chipset="BMG"
        symbol_name="RenderBasic"
@@ -142,7 +142,7 @@
     <counter name="PostPS Alpha Test Fail"
              symbol_name="POSTPS_ALPHA_TEST_FAIL"
              underscore_name="postps_alpha_test_fail"
-             description="Number of 2x2 that were lit from Rasterizer but failed the alpha test"
+             description="Number of 2x2 that were lit from Rasterizer but failed the Alpha Test or Alpha-to-Coverage"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -155,7 +155,7 @@
     <counter name="Shader Pix Kill"
              symbol_name="SHADER_PIX_KILL"
              underscore_name="shader_pix_kill"
-             description="Number of pixels that were lit from Rasterizer but killed by the Pixel Shader"
+             description="Number of pixels that were lit from Rasterizer but killed by the Pixel Shader or OOB Check"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -324,7 +324,7 @@
     <counter name="Stripsfan Object Cull"
              symbol_name="STRIPSFAN_OBJECT_CULL"
              underscore_name="stripsfan_object_cull"
-             description="Number of simple culled objects in Stripsfan stage"
+             description="Number of simple and complex culled objects in Stripsfan stage"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -399,6 +399,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="GPU Memory Request Queue Full"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL"
+             underscore_name="gpu_memory_request_queue_full"
+             description="Percentage of time in which SQ is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 54 READ $SqidiTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="Sampler 2x2 Read"
              symbol_name="SAMPLER_2X2_READ"
              underscore_name="sampler_2_x2_read"
@@ -1605,6 +1618,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Stall"
+             symbol_name="L3_STALL"
+             underscore_name="l3_stall"
+             description="Percentage of time in which Device Cache bank stalled"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 40 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="Compressor Input"
              symbol_name="COMPRESSOR_INPUT"
              underscore_name="compressor_input"
@@ -1709,6 +1735,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="GPU Memory Request Queue Full"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL"
+             underscore_name="gpu_memory_request_queue_full"
+             description="Percentage of time in which SQ is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 47 READ $SqidiTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="TLB Miss"
              symbol_name="TLB_MISS"
              underscore_name="tlb_miss"
@@ -2375,7 +2414,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 42 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 42 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Depth Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -2388,7 +2427,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 43 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 43 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Depth Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -2401,7 +2440,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 44 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 44 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Depth Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -2511,6 +2550,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="GPU Memory Active"
+             symbol_name="GPU_MEMORY_ACTIVE"
+             underscore_name="gpu_memory_active"
+             description="Percentage of time in which device local memory (HBM, GDDR, LPDDR, etc.) is active"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 53 READ $SqidiTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <register_config type="OA">
         <register type="OA" address="0x00013000" value="0x00001801" />
         <register type="OA" address="0x00013004" value="0x00000000" />
@@ -2959,6 +3011,58 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Busy"
+             symbol_name="L3_BUSY"
+             underscore_name="l3_busy"
+             description="Percentage of time in which Device Cache request queue has one or more requests pending"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 50 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Input Available"
+             symbol_name="L3_INPUT_AVAILABLE"
+             underscore_name="l3_input_available"
+             description="Percentage of time in which Device Cache bank has input requests"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 51 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Output Ready"
+             symbol_name="L3_OUTPUT_READY"
+             underscore_name="l3_output_ready"
+             description="Percentage of time in which Device Cache bank has output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 52 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Superq Full"
+             symbol_name="L3_SUPERQ_FULL"
+             underscore_name="l3_superq_full"
+             description="Percentage of time in which all slots in Device Cache request queue are waiting for data return / response"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 53 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Atomic Access"
              symbol_name="L3_ATOMIC_ACCESS"
              underscore_name="l3_atomic_access"
@@ -3011,6 +3115,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Stall"
+             symbol_name="L3_STALL"
+             underscore_name="l3_stall"
+             description="Percentage of time in which Device Cache bank stalled"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 58 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Write"
              symbol_name="L3_WRITE"
              underscore_name="l3_write"
@@ -3418,7 +3535,7 @@
     <counter name="GPU Memory 32b Transaction Read"
              symbol_name="GPU_MEMORY_32B_TRANSACTION_READ"
              underscore_name="gpu_memory_32_b_transaction_read"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) reads (32B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent reads (32B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3431,7 +3548,7 @@
     <counter name="GPU Memory 32b Transaction Write"
              symbol_name="GPU_MEMORY_32B_TRANSACTION_WRITE"
              underscore_name="gpu_memory_32_b_transaction_write"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) writes (32B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent writes (32B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3444,7 +3561,7 @@
     <counter name="GPU Memory 64b Transaction Read"
              symbol_name="GPU_MEMORY_64B_TRANSACTION_READ"
              underscore_name="gpu_memory_64_b_transaction_read"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) reads (64B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent reads (64B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3457,7 +3574,7 @@
     <counter name="GPU Memory 64b Transaction Write"
              symbol_name="GPU_MEMORY_64B_TRANSACTION_WRITE"
              underscore_name="gpu_memory_64_b_transaction_write"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) writes (64B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent writes (64B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3545,6 +3662,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="GPU Memory Request Queue Full"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL"
+             underscore_name="gpu_memory_request_queue_full"
+             description="Percentage of time in which SQ is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 45 READ $SqidiTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="TLB Miss"
              symbol_name="TLB_MISS"
              underscore_name="tlb_miss"
@@ -3571,6 +3701,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Busy"
+             symbol_name="L3_BUSY"
+             underscore_name="l3_busy"
+             description="Percentage of time in which Device Cache request queue has one or more requests pending"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 48 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
@@ -3584,6 +3727,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Input Available"
+             symbol_name="L3_INPUT_AVAILABLE"
+             underscore_name="l3_input_available"
+             description="Percentage of time in which Device Cache bank has input requests"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 50 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
@@ -3597,6 +3753,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Output Ready"
+             symbol_name="L3_OUTPUT_READY"
+             underscore_name="l3_output_ready"
+             description="Percentage of time in which Device Cache bank has output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 52 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Read"
              symbol_name="L3_READ"
              underscore_name="l3_read"
@@ -3610,6 +3779,32 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Stall"
+             symbol_name="L3_STALL"
+             underscore_name="l3_stall"
+             description="Percentage of time in which Device Cache bank stalled"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 54 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Superq Full"
+             symbol_name="L3_SUPERQ_FULL"
+             underscore_name="l3_superq_full"
+             description="Percentage of time in which all slots in Device Cache request queue are waiting for data return / response"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 55 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Write"
              symbol_name="L3_WRITE"
              underscore_name="l3_write"
@@ -4364,7 +4559,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 35 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 35 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4377,7 +4572,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 36 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 36 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4416,7 +4611,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 39 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 39 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4429,7 +4624,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 40 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 40 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4442,7 +4637,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 41 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 41 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4455,7 +4650,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 42 READ $SliceTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 42 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Geometry"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4468,7 +4663,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 43 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 43 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Color Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4494,7 +4689,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 45 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 45 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Color Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4507,7 +4702,7 @@
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 46 READ $SliceTotalCount 2 UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             equation="PEC 46 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
              mdapi_group="Color Pipe"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
@@ -4526,6 +4721,32 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Render Cache Input Available"
+             symbol_name="RENDER_CACHE_INPUT_AVAILABLE"
+             underscore_name="render_cache_input_available"
+             description="Percentage of time in which Render Cache input available"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 47 READ 2 UDIV $L3NodeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Color Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render Cache Output Ready"
+             symbol_name="RENDER_CACHE_OUTPUT_READY"
+             underscore_name="render_cache_output_ready"
+             description="Percentage of time in which Render Cache output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 48 READ 2 UDIV $L3NodeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Color Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="AMFS Stall All Input"
              symbol_name="AMFS_STALL_ALL_INPUT"
              underscore_name="amfs_stall_all_input"
@@ -6115,6 +6336,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Busy"
+             symbol_name="L3_BUSY"
+             underscore_name="l3_busy"
+             description="Percentage of time in which Device Cache request queue has one or more requests pending"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 36 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Hit"
              symbol_name="L3_HIT"
              underscore_name="l3_hit"
@@ -6128,6 +6362,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Input Available"
+             symbol_name="L3_INPUT_AVAILABLE"
+             underscore_name="l3_input_available"
+             description="Percentage of time in which Device Cache bank has input requests"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 38 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Miss"
              symbol_name="L3_MISS"
              underscore_name="l3_miss"
@@ -6141,6 +6388,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Output Ready"
+             symbol_name="L3_OUTPUT_READY"
+             underscore_name="l3_output_ready"
+             description="Percentage of time in which Device Cache bank has output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 40 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Read"
              symbol_name="L3_READ"
              underscore_name="l3_read"
@@ -6154,6 +6414,32 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="L3 Stall"
+             symbol_name="L3_STALL"
+             underscore_name="l3_stall"
+             description="Percentage of time in which Device Cache bank stalled"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 42 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Superq Full"
+             symbol_name="L3_SUPERQ_FULL"
+             underscore_name="l3_superq_full"
+             description="Percentage of time in which all slots in Device Cache request queue are waiting for data return / response"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 43 READ $L3BankTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Device Cache"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="L3 Write"
              symbol_name="L3_WRITE"
              underscore_name="l3_write"
@@ -6310,6 +6596,19 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="GPU Memory Request Queue Full"
+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL"
+             underscore_name="gpu_memory_request_queue_full"
+             description="Percentage of time in which SQ is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 54 READ $SqidiTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Memory"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <register_config type="OA">
         <register type="OA" address="0x00013000" value="0x00001801" />
         <register type="OA" address="0x00013004" value="0x00000000" />
@@ -6997,13 +7296,13 @@
     </register_config>
   </set>
 
-  <set name="TestOa"
+  <set name="XvePipelineRasterizationProfile"
        chipset="BMG"
-       symbol_name="TestOa"
-       underscore_name="test_oa"
+       symbol_name="XvePipelineRasterizationProfile"
+       underscore_name="xve_pipeline_rasterization_profile"
        mdapi_supported_apis="VK OGL OCL IO"
        oa_format="576B_PEC64LL"
-       hw_config_guid="9ec392a7-4c77-4253-a28a-85240821e82c"
+       hw_config_guid="a94b753d-d342-4eef-a865-c71b0d2f1359"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -7045,61 +7344,1083 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="GPU Busy"
-             symbol_name="GPU_BUSY"
-             underscore_name="gpu_busy"
-             description="Percentage of time in which GPU is not idle including all GPU engines"
+    <counter name="XVE Active"
+             symbol_name="XVE_ACTIVE"
+             underscore_name="xve_active"
+             description="Percentage of time in which at least one pipe is active in XVE"
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 32 READ 100 UMUL $GpuCoreClocks FDIV"
-             mdapi_group="Front End"
+             equation="PEC 0 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="IA Vertex"
-             symbol_name="IA_VERTEX"
-             underscore_name="ia_vertex"
-             description="Number of vertices in a draw"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 33 READ"
-             mdapi_group="Geometry"
+    <counter name="XVE Stall"
+             symbol_name="XVE_STALL"
+             underscore_name="xve_stall"
+             description="Percentage of time in which any thread loaded but not even a single pipe is active in XVE"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 1 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="GpGpu Threadgroup Count"
-             symbol_name="GPGPU_THREADGROUP_COUNT"
-             underscore_name="gpgpu_threadgroup_count"
-             description="Number of GPGPU threadgroups dispatched"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 0 READ"
-             mdapi_group="Thread Dispatcher"
+    <counter name="XVE Inst Executed ALU0 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_all_utilization"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 2 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Async GpGpu Threadgroup Count"
-             symbol_name="ASYNC_GPGPU_THREADGROUP_COUNT"
-             underscore_name="async_gpgpu_threadgroup_count"
-             description="Number of Async GPGPU threadgroups dispatched"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 1 READ"
-             mdapi_group="Thread Dispatcher"
+    <counter name="XVE Inst Executed ALU1 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_all_utilization"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 3 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Rasterizer Sample Output"
-             symbol_name="RASTERIZER_SAMPLE_OUTPUT"
-             underscore_name="rasterizer_sample_output"
+    <counter name="XVE Inst Executed ALU2 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU2_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu2_all_utilization"
+             description="Percentage of time taken by instructions executed in ALU2 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 4 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Pipe ALU0 And ALU1 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU1_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu1_active"
+             description="Percentage of time in which ALU0 and ALU1 pipes are both actively executing a Gen ISA instruction"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 5 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Pipe ALU0 And ALU2 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU2_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu2_active"
+             description="Percentage of time in which ALU0 and ALU2 pipes are both actively executing a Gen ISA instruction"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 6 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Multiple Pipe Active"
+             symbol_name="XVE_MULTIPLE_PIPE_ACTIVE"
+             underscore_name="xve_multiple_pipe_active"
+             description="Percentage of time in which at least two pipes are actively executing a Gen ISA instruction among ALU0, ALU1 and ALU2 pipes"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 21 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 VS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_VS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_vs_utilization"
+             description="Percentage of time taken by instructions executed by VS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 MS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_MS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ms_utilization"
+             description="Percentage of time taken by instructions executed by MS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 TS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_TS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ts_utilization"
+             description="Percentage of time taken by instructions executed by TS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 PS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_PS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ps_utilization"
+             description="Percentage of time taken by instructions executed by PS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 Async CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_ASYNC_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_async_cs_utilization"
+             description="Percentage of time taken by instructions executed by ASYNC_CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_cs_utilization"
+             description="Percentage of time taken by instructions executed by CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 VS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_VS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_vs_utilization"
+             description="Percentage of time taken by instructions executed by VS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 MS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_MS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_ms_utilization"
+             description="Percentage of time taken by instructions executed by MS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 TS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_TS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_ts_utilization"
+             description="Percentage of time taken by instructions executed by TS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 PS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_PS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_ps_utilization"
+             description="Percentage of time taken by instructions executed by PS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 Async CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_ASYNC_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_async_cs_utilization"
+             description="Percentage of time taken by instructions executed by ASYNC_CS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 17 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_cs_utilization"
+             description="Percentage of time taken by instructions executed by CS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 18 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Threads Occupancy All"
+             symbol_name="XVE_THREADS_OCCUPANCY_ALL"
+             underscore_name="xve_threads_occupancy_all"
+             description="Percentage of thread slots occupied by ALL threads"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 19 READ 8 UMUL $VectorEngineThreadsCount $VectorEngineTotalCount UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Aluwr"
+             symbol_name="XVE_STALL_ALUWR"
+             underscore_name="xve_stall_aluwr"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for ALU to write GRF/ACC register. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 22 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Barrier"
+             symbol_name="XVE_STALL_BARRIER"
+             underscore_name="xve_stall_barrier"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Gateway to write Notify register. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 23 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Control"
+             symbol_name="XVE_STALL_CONTROL"
+             underscore_name="xve_stall_control"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for JEU to complete branch instruction. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 24 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Instfetch"
+             symbol_name="XVE_STALL_INSTFETCH"
+             underscore_name="xve_stall_instfetch"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Instruction Fetch. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 25 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Other"
+             symbol_name="XVE_STALL_OTHER"
+             underscore_name="xve_stall_other"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting on any other dependency (Flag/EoT etc). Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 26 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Pipestall"
+             symbol_name="XVE_STALL_PIPESTALL"
+             underscore_name="xve_stall_pipestall"
+             description="Percentage of time in which XVE stalled, with at least one thread ready to be scheduled (Grf conf/send holds etc). Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 27 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall PS Dependency"
+             symbol_name="XVE_STALL_PS_DEPENDENCY"
+             underscore_name="xve_stall_ps_dependency"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting on Pixel Shader dependency"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 28 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Sbid"
+             symbol_name="XVE_STALL_SBID"
+             underscore_name="xve_stall_sbid"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Scoreboard token to be available. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 29 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Sendwr"
+             symbol_name="XVE_STALL_SENDWR"
+             underscore_name="xve_stall_sendwr"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for SEND message to be dispatched from XVE. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 30 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00000605" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00000606" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x0000060F" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000603" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000614" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000625" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000626" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x0000060F" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x0000060F" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x0000060F" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x0000060F" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x0000060F" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x0000060F" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000603" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000603" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000603" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000603" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000603" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000603" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000604" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000624" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x0000061D" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000061B" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000620" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x0000061A" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000621" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x0000061F" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000628" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x0000061C" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x0000061E" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x000B0010" />
+        <register type="FLEX" address="0x0000E558" value="0x000500A0" />
+        <register type="FLEX" address="0x0000E658" value="0x00060090" />
+        <register type="FLEX" address="0x0000E758" value="0x000B0010" />
+        <register type="FLEX" address="0x0000E45C" value="0x000500A0" />
+        <register type="FLEX" address="0x0000E55C" value="0x00060090" />
+        <register type="FLEX" address="0x0000E65C" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="XvePipelineRaytracingProfile"
+       chipset="BMG"
+       symbol_name="XvePipelineRaytracingProfile"
+       underscore_name="xve_pipeline_raytracing_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="576B_PEC64LL"
+       hw_config_guid="961f1fa0-0c8e-4c16-bcaf-cb6704c96eda"
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
+    <counter name="XVE Active"
+             symbol_name="XVE_ACTIVE"
+             underscore_name="xve_active"
+             description="Percentage of time in which at least one pipe is active in XVE"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 0 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall"
+             symbol_name="XVE_STALL"
+             underscore_name="xve_stall"
+             description="Percentage of time in which any thread loaded but not even a single pipe is active in XVE"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 1 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_all_utilization"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 2 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_all_utilization"
+             description="Percentage of time taken by instructions executed by ALL threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 3 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU2 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU2_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu2_all_utilization"
+             description="Percentage of time taken by instructions executed in ALU2 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 4 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Pipe ALU0 And ALU1 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU1_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu1_active"
+             description="Percentage of time in which ALU0 and ALU1 pipes are both actively executing a Gen ISA instruction"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 5 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Pipe ALU0 And ALU2 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU2_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu2_active"
+             description="Percentage of time in which ALU0 and ALU2 pipes are both actively executing a Gen ISA instruction"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 6 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Multiple Pipe Active"
+             symbol_name="XVE_MULTIPLE_PIPE_ACTIVE"
+             underscore_name="xve_multiple_pipe_active"
+             description="Percentage of time in which at least two pipes are actively executing a Gen ISA instruction among ALU0, ALU1 and ALU2 pipes"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 21 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 RT AHS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_RT_AHS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_rt_ahs_utilization"
+             description="Percentage of time taken by instructions executed by RT_AHS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 RT CHS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_RT_CHS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_rt_chs_utilization"
+             description="Percentage of time taken by instructions executed by RT_CHS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 RT MS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_RT_MS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_rt_ms_utilization"
+             description="Percentage of time taken by instructions executed by RT_MS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 PS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_PS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ps_utilization"
+             description="Percentage of time taken by instructions executed by PS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 Async CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_ASYNC_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_async_cs_utilization"
+             description="Percentage of time taken by instructions executed by ASYNC_CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU0 CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_cs_utilization"
+             description="Percentage of time taken by instructions executed by CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 RT AHS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_RT_AHS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_rt_ahs_utilization"
+             description="Percentage of time taken by instructions executed by RT_AHS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 RT CHS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_RT_CHS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_rt_chs_utilization"
+             description="Percentage of time taken by instructions executed by RT_CHS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 RT MS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_RT_MS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_rt_ms_utilization"
+             description="Percentage of time taken by instructions executed by RT_MS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 PS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_PS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_ps_utilization"
+             description="Percentage of time taken by instructions executed by PS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 Async CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_ASYNC_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_async_cs_utilization"
+             description="Percentage of time taken by instructions executed by ASYNC_CS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 17 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Inst Executed ALU1 CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU1_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu1_cs_utilization"
+             description="Percentage of time taken by instructions executed by CS threads on ALU1 pipe. Does not include extended math instructions."
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 18 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Threads Occupancy All"
+             symbol_name="XVE_THREADS_OCCUPANCY_ALL"
+             underscore_name="xve_threads_occupancy_all"
+             description="Percentage of thread slots occupied by ALL threads"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 19 READ 8 UMUL $VectorEngineThreadsCount $VectorEngineTotalCount UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Aluwr"
+             symbol_name="XVE_STALL_ALUWR"
+             underscore_name="xve_stall_aluwr"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for ALU to write GRF/ACC register. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 22 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Barrier"
+             symbol_name="XVE_STALL_BARRIER"
+             underscore_name="xve_stall_barrier"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Gateway to write Notify register. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 23 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Control"
+             symbol_name="XVE_STALL_CONTROL"
+             underscore_name="xve_stall_control"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for JEU to complete branch instruction. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 24 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Instfetch"
+             symbol_name="XVE_STALL_INSTFETCH"
+             underscore_name="xve_stall_instfetch"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Instruction Fetch. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 25 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Other"
+             symbol_name="XVE_STALL_OTHER"
+             underscore_name="xve_stall_other"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting on any other dependency (Flag/EoT etc). Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 26 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Pipestall"
+             symbol_name="XVE_STALL_PIPESTALL"
+             underscore_name="xve_stall_pipestall"
+             description="Percentage of time in which XVE stalled, with at least one thread ready to be scheduled (Grf conf/send holds etc). Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 27 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall PS Dependency"
+             symbol_name="XVE_STALL_PS_DEPENDENCY"
+             underscore_name="xve_stall_ps_dependency"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting on Pixel Shader dependency"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 28 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Sbid"
+             symbol_name="XVE_STALL_SBID"
+             underscore_name="xve_stall_sbid"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for Scoreboard token to be available. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 29 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="XVE Stall Sendwr"
+             symbol_name="XVE_STALL_SENDWR"
+             underscore_name="xve_stall_sendwr"
+             description="Percentage of time in which XVE stalled, with at least one thread waiting for SEND message to be dispatched from XVE. Multiple stall reasons can qualify during the same cycle"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 30 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00000605" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00000606" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x0000060F" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000603" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000614" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000625" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000626" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x0000060F" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x0000060F" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x0000060F" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x0000060F" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x0000060F" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x0000060F" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000603" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000603" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000603" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000603" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000603" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000603" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000604" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000624" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x0000061D" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000061B" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000620" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x0000061A" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000621" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x0000061F" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000628" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x0000061C" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x0000061E" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x000D00C0" />
+        <register type="FLEX" address="0x0000E558" value="0x000500E0" />
+        <register type="FLEX" address="0x0000E658" value="0x00060090" />
+        <register type="FLEX" address="0x0000E758" value="0x000D00C0" />
+        <register type="FLEX" address="0x0000E45C" value="0x000500E0" />
+        <register type="FLEX" address="0x0000E55C" value="0x00060090" />
+        <register type="FLEX" address="0x0000E65C" value="0x00000000" />
+    </register_config>
+  </set>
+
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
              description="Number of lit samples emitted by Rasterizer"
              data_type="uint64"
              units="events"
@@ -7657,4 +8978,318 @@
     </register_config>
   </set>
 
+  <set name="MediaSet2"
+       chipset="BMG"
+       symbol_name="MediaSet2"
+       underscore_name="media_set2"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="7b0b93c9-d355-4179-af35-6db495ca6388"
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
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Media Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of media slice clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Media Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Media Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Command Parser Video Enhancement Engine0 Busy"
+             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE0_BUSY"
+             underscore_name="command_parser_video_enhancement_engine0_busy"
+             description="Number of VECS0 (VEBOX0) activities"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Enhancement Box0 Read Request"
+             symbol_name="VIDEO_ENHANCEMENT_BOX0_READ_REQUEST"
+             underscore_name="video_enhancement_box0_read_request"
+             description="Number of VEBOX0 read requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Enhancement Box0 Write Request"
+             symbol_name="VIDEO_ENHANCEMENT_BOX0_WRITE_REQUEST"
+             underscore_name="video_enhancement_box0_write_request"
+             description="Number of VEBOX0 write requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Command Parser Video Enhancement Engine1 Busy"
+             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE1_BUSY"
+             underscore_name="command_parser_video_enhancement_engine1_busy"
+             description="Number of VECS1 (VEBOX1) activities"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="A 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Enhancement Box1 Read Request"
+             symbol_name="VIDEO_ENHANCEMENT_BOX1_READ_REQUEST"
+             underscore_name="video_enhancement_box1_read_request"
+             description="Number of VEBOX1 read requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Enhancement Box1 Write Request"
+             symbol_name="VIDEO_ENHANCEMENT_BOX1_WRITE_REQUEST"
+             underscore_name="video_enhancement_box1_write_request"
+             description="Number of VEBOX1 write requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00394200" value="0x00002200" />
+        <register type="OA" address="0x00394204" value="0x00000000" />
+        <register type="OA" address="0x00394208" value="0x00002201" />
+        <register type="OA" address="0x0039420C" value="0x00000000" />
+        <register type="OA" address="0x00394210" value="0x00002202" />
+        <register type="OA" address="0x00394214" value="0x00000000" />
+        <register type="OA" address="0x00394218" value="0x00002400" />
+        <register type="OA" address="0x0039421C" value="0x00000000" />
+        <register type="OA" address="0x00394220" value="0x00002401" />
+        <register type="OA" address="0x00394224" value="0x00000000" />
+        <register type="OA" address="0x00394228" value="0x00002402" />
+        <register type="OA" address="0x0039422C" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MediaSet1"
+       chipset="BMG"
+       symbol_name="MediaSet1"
+       underscore_name="media_set1"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="eecad08f-ddb6-40cb-9abb-dbbdafd0c47a"
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
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Media Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of media slice clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Media Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Media Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Media Read Request"
+             symbol_name="MEDIA_READ_REQUEST"
+             underscore_name="media_read_request"
+             description="Number of read requests from stand alone media"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 0 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Media Write Request"
+             symbol_name="MEDIA_WRITE_REQUEST"
+             underscore_name="media_write_request"
+             description="Number of write requests from stand alone media"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Command Parser Video Decode Engine0 Busy"
+             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE0_BUSY"
+             underscore_name="command_parser_video_decode_engine0_busy"
+             description="Number of VCS0 (VDBOX0) activities"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="A 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Decode Box0 Read Request"
+             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST"
+             underscore_name="video_decode_box0_read_request"
+             description="Number of VDBOX0 read requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Decode Box0 Write Request"
+             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST"
+             underscore_name="video_decode_box0_write_request"
+             description="Number of VDBOX0 write requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Command Parser Video Decode Engine1 Busy"
+             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE1_BUSY"
+             underscore_name="command_parser_video_decode_engine1_busy"
+             description="Number of VCS1 (VDBOX1) activities"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="A 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Decode Box1 Read Request"
+             symbol_name="VIDEO_DECODE_BOX1_READ_REQUEST"
+             underscore_name="video_decode_box1_read_request"
+             description="Number of VDBOX1 read requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Video Decode Box1 Write Request"
+             symbol_name="VIDEO_DECODE_BOX1_WRITE_REQUEST"
+             underscore_name="video_decode_box1_write_request"
+             description="Number of VDBOX1 write requests"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="A 7 READ"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00394A00" value="0x00000001" />
+        <register type="OA" address="0x00394A04" value="0x00000000" />
+        <register type="OA" address="0x00394A08" value="0x00000002" />
+        <register type="OA" address="0x00394A0C" value="0x00000000" />
+        <register type="OA" address="0x00394A10" value="0x00000200" />
+        <register type="OA" address="0x00394A14" value="0x00000000" />
+        <register type="OA" address="0x00394A18" value="0x00000201" />
+        <register type="OA" address="0x00394A1C" value="0x00000000" />
+        <register type="OA" address="0x00394A20" value="0x00000202" />
+        <register type="OA" address="0x00394A24" value="0x00000000" />
+        <register type="OA" address="0x00394A28" value="0x00000400" />
+        <register type="OA" address="0x00394A2C" value="0x00000000" />
+        <register type="OA" address="0x00394A30" value="0x00000401" />
+        <register type="OA" address="0x00394A34" value="0x00000000" />
+        <register type="OA" address="0x00394A38" value="0x00000402" />
+        <register type="OA" address="0x00394A3C" value="0x00000000" />
+    </register_config>
+  </set>
+
 </metrics>
-- 
2.48.1

