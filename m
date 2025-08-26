Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B110ECA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 21:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C1A10E3B3;
	Tue, 26 Aug 2025 21:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZNfnlpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537E10E3B3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756242955; x=1787778955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUWFIcpSzVP5E7invhIFGK4k4ecWbd7y7z3MEO8c2Ps=;
 b=GZNfnlpUv5sVn0Q+ssMCf1ypvZrNvrIIjBe7KSwrOfhLrTjke/AZeU5E
 HXoC7NcYL8LuxPXkGzjVRJHFuXRo1yMpDoUBethGEpR1h1F0uEsQLuMep
 YNICvd0s+AK5SOlVok0MaBYhR8C5VAYCH1snueHGcAZJtB5ey6uGyt/bj
 1xiRvRNf6USK6RPsMjd/EuQMWx3EmfLKvUIj0UWb9AyLkdCgKOHVYBHch
 g6lallfu88VCTsqImTir7v+t4rFF+OrWb7KL46OzAih74beOKEYys9LVg
 Gym5Uh2nbWALAVXsbRtZdz0Y2DhvDNz/Fs3OSb6tKlR6GqbKYSYy3+s8Z g==;
X-CSE-ConnectionGUID: +8ZUS6hwQYKC/kFVwBpy0Q==
X-CSE-MsgGUID: 6tnERFY0RVOtJfVk62+fqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62307273"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62307273"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:15:55 -0700
X-CSE-ConnectionGUID: DdCnfqwuRYabbeiqVQlcGw==
X-CSE-MsgGUID: xPiomjC1QUOrWNFPMiNLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170055305"
Received: from dut4399mtlh.fm.intel.com ([10.105.8.92])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:15:54 -0700
From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com, ashutosh.dixit@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 2/2] lib/xe/oa: Update PTL oa-metrics with new compute, memory,
 and stall counters
Date: Tue, 26 Aug 2025 21:15:45 +0000
Message-ID: <20250826211545.17076-2-sushma.venkatesh.reddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826211545.17076-1-sushma.venkatesh.reddy@intel.com>
References: <20250826211545.17076-1-sushma.venkatesh.reddy@intel.com>
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

- Add new metric sets and counters for compute, memory, and device cache
- Update descriptions and equations

Signed-off-by: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
---
 lib/xe/oa-configs/guids.xml            |    4 +
 lib/xe/oa-configs/mdapi-xml-convert.py |   17 +-
 lib/xe/oa-configs/oa-ptl.xml           | 1976 ++++++++++++++++++++++--
 3 files changed, 1846 insertions(+), 151 deletions(-)

diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index a7ca3e00f..10b43d6f1 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2780,4 +2780,8 @@
     <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="765ea760-ca86-475a-a807-7c75f44b39c9" chipset="ptl" name="VectorEngineProfile" />
     <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="64c274c2-3df8-44c7-a779-085e27d474d3" chipset="ptl" name="VectorEngineStalls" />
     <guid config_hash="2c8d8862e0eab0c587f2a2c18d96ad3b" mdapi_config_hash="89ebddf1d2af3b8acb33e7e3488086be" id="cf90eca9-c696-4e2c-8f48-0574b1745a58" chipset="ptl" name="TestOa" />
+    <guid config_hash="fa51b79e41eee554b987318329311a87" mdapi_config_hash="1482e5fb4140673ab53699e280064b30" id="c8770c23-1a3a-4869-89e8-2e22ea9af5cd" chipset="ptl" name="XvePipelineRasterizationProfile" />
+    <guid config_hash="9ba03e5fddcfeaa0491b3a9b4ec1b634" mdapi_config_hash="1ecdf9e15989b70c1ca406e745876727" id="dac47689-630c-4a44-a9e9-e8c94e3a33c4" chipset="ptl" name="XvePipelineRaytracingProfile" />
+    <guid config_hash="daed5f485b35c73cf7376a59c886992e" mdapi_config_hash="98662c6a0439289f06b36a78a73fc4b5" id="2d53df97-44b8-4bf1-aa33-2de98fe6f6ad" chipset="ptl" name="MediaSet1" />
+    <guid config_hash="d32738bc3e05a752254ccd370a891c90" mdapi_config_hash="883c847bdfecb4051eb3fde4009cf4ec" id="36cf7053-8097-4389-bc5d-a652553de240" chipset="ptl" name="MediaSet2" />
 </guids>
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index 9abc7e529..add6aa373 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -182,8 +182,6 @@ mtl_chipset_oa_formats = {
 
 xe2_chipset_oa_formats = {
     '576B_PEC64LL': xe2_chipset_params_pec,
-    # We only care about 576B_PEC64LL metrics in Xe2, entries below is just to
-    # surpress warnings
     '256B_GENERIC_NOA16': xehpsdv_chipset_params,
     '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
 }
@@ -262,11 +260,12 @@ def read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format):
         report_size = chipsets[chipset][oa_format]['oa_report_size']
 
         if offset < a_offset:
-            if offset == 8:
+            if offset in (0, 4, 8):
                 return "GPU_TIME 0 READ"
-            elif offset == 24:
+            elif offset in (12, 24):
                 return "GPU_CLOCK 0 READ"
             else:
+                print_err(f"Unhandled offset in read_token_to_rpn_read_oam: {offset} (token: {token}, chipset: {chipset}, oa_format: {oa_format})")
                 assert 0
         elif offset < b_offset:
             a_cnt_offset = int((offset - a_offset) / den)
@@ -297,6 +296,14 @@ def read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format):
                 return "C " + str(idx - 48) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset, oa_format))
+        else:
+            if idx == 0:
+                return "GPU_TIME 0 READ"
+            elif idx == 1:
+                return "GPU_CLOCK 0 READ"
+            else:
+                print_err(f"Unhandled delta offset in read_token_to_rpn_read_oam: {offset} (token: {token}, chipset: {chipset}, oa_format: {oa_format})")
+                assert 0
 
     assert 0
 
@@ -359,7 +366,7 @@ def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
         report_size = chipsets[chipset][oa_format]['oa_report_size']
 
         if offset < a_offset:
-            if offset == 4:
+            if offset in (0, 4, 8):
                 return "GPU_TIME 0 READ"
             elif offset == 12:
                 assert chipset != "HSW" # Only for Gen8+
diff --git a/lib/xe/oa-configs/oa-ptl.xml b/lib/xe/oa-configs/oa-ptl.xml
index a9fe08a10..1878ccaf2 100644
--- a/lib/xe/oa-configs/oa-ptl.xml
+++ b/lib/xe/oa-configs/oa-ptl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1748880315" merge_md5="">
+<metrics version="1755907958" merge_md5="">
   <set name="RenderBasic"
        chipset="PTL"
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
@@ -1529,6 +1542,19 @@
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
@@ -1633,6 +1659,19 @@
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
@@ -2216,6 +2255,45 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="HiZ Subspan Latency Fifofull"
+             symbol_name="HIZ_SUBSPAN_LATENCY_FIFOFULL"
+             underscore_name="hiz_subspan_latency_fifofull"
+             description="Percentage of time in which for which HiZ latency hiding structure full"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 42 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Depth Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="IZ Output Ready"
+             symbol_name="IZ_OUTPUT_READY"
+             underscore_name="iz_output_ready"
+             description="Percentage of time in which IZ has requests to different clients"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 43 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Depth Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="IZ Subspan Latency Fifofull"
+             symbol_name="IZ_SUBSPAN_LATENCY_FIFOFULL"
+             underscore_name="iz_subspan_latency_fifofull"
+             description="Percentage of time in which for which IZ latency hiding structure full"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 44 READ $DepthPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Depth Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="PostPS Depth Stencil Test Fail"
              symbol_name="POSTPS_DEPTH_STENCIL_TEST_FAIL"
              underscore_name="postps_depth_stencil_test_fail"
@@ -2320,6 +2398,19 @@
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
@@ -2768,6 +2859,58 @@
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
@@ -2820,6 +2963,19 @@
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
@@ -3227,7 +3383,7 @@
     <counter name="GPU Memory 32b Transaction Read"
              symbol_name="GPU_MEMORY_32B_TRANSACTION_READ"
              underscore_name="gpu_memory_32_b_transaction_read"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) reads (32B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent reads (32B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3240,7 +3396,7 @@
     <counter name="GPU Memory 32b Transaction Write"
              symbol_name="GPU_MEMORY_32B_TRANSACTION_WRITE"
              underscore_name="gpu_memory_32_b_transaction_write"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) writes (32B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent writes (32B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3253,7 +3409,7 @@
     <counter name="GPU Memory 64b Transaction Read"
              symbol_name="GPU_MEMORY_64B_TRANSACTION_READ"
              underscore_name="gpu_memory_64_b_transaction_read"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) reads (64B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent reads (64B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3266,7 +3422,7 @@
     <counter name="GPU Memory 64b Transaction Write"
              symbol_name="GPU_MEMORY_64B_TRANSACTION_WRITE"
              underscore_name="gpu_memory_64_b_transaction_write"
-             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) writes (64B)"
+             description="Number of device local memory (HBM, GDDR, LPDDR, etc.) non coherent writes (64B)"
              data_type="uint64"
              units="events"
              semantic_type="event"
@@ -3354,6 +3510,19 @@
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
@@ -3380,6 +3549,19 @@
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
@@ -3393,6 +3575,19 @@
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
@@ -3406,6 +3601,19 @@
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
@@ -3419,6 +3627,32 @@
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
@@ -4120,6 +4354,32 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Clipper Input Available"
+             symbol_name="CLIPPER_INPUT_AVAILABLE"
+             underscore_name="clipper_input_available"
+             description="Percentage of time in which Clipper has input available (from Vertex Shader or SOL)"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 35 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Clipper Output Ready"
+             symbol_name="CLIPPER_OUTPUT_READY"
+             underscore_name="clipper_output_ready"
+             description="Percentage of time in which Clipper output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 36 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="Clipper Transaction Output"
              symbol_name="CLIPPER_TRANSACTION_OUTPUT"
              underscore_name="clipper_transaction_output"
@@ -4146,6 +4406,71 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Stripsfan Output Ready"
+             symbol_name="STRIPSFAN_OUTPUT_READY"
+             underscore_name="stripsfan_output_ready"
+             description="Percentage of time in which in which geometry pipeline output is ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 39 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vertex Fetch Input Available"
+             symbol_name="VERTEX_FETCH_INPUT_AVAILABLE"
+             underscore_name="vertex_fetch_input_available"
+             description="Percentage of time in which Vertex Fetch input is available"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 40 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vertex Fetch Output Ready"
+             symbol_name="VERTEX_FETCH_OUTPUT_READY"
+             underscore_name="vertex_fetch_output_ready"
+             description="Percentage of time in which Vertex Fetch output is ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 41 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Output Ready"
+             symbol_name="VS_OUTPUT_READY"
+             underscore_name="vs_output_ready"
+             description="Percentage of time in which Vertex Shader output is ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 42 READ $GeometryPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Geometry"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Color Pipe Cache Latency1 Stall"
+             symbol_name="COLOR_PIPE_CACHE_LATENCY1_STALL"
+             underscore_name="color_pipe_cache_latency1_stall"
+             description="Percentage of time in which Color Pipeline stalled due to MultiSampling Cache latency hiding structure full"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 43 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Color Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="Color Pipe Cache Latency2 Stall"
              symbol_name="COLOR_PIPE_CACHE_LATENCY2_STALL"
              underscore_name="color_pipe_cache_latency2_stall"
@@ -4159,6 +4484,32 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Pixel Post Process Input Available"
+             symbol_name="PIXEL_POST_PROCESS_INPUT_AVAILABLE"
+             underscore_name="pixel_post_process_input_available"
+             description="Percentage of time in which Color Pipeline input ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 45 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Color Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixel Post Process Output Ready"
+             symbol_name="PIXEL_POST_PROCESS_OUTPUT_READY"
+             underscore_name="pixel_post_process_output_ready"
+             description="Percentage of time in which Color Pipeline pixel output ready"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 46 READ $ColorPipeTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Color Pipe"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
     <counter name="PS Output Available"
              symbol_name="PS_OUTPUT_AVAILABLE"
              underscore_name="ps_output_available"
@@ -4172,6 +4523,32 @@
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
@@ -5776,6 +6153,19 @@
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
@@ -5789,6 +6179,19 @@
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
@@ -5802,6 +6205,19 @@
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
@@ -5815,6 +6231,32 @@
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
@@ -5971,6 +6413,19 @@
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
@@ -6658,13 +7113,13 @@
     </register_config>
   </set>
 
-  <set name="TestOa"
+  <set name="XvePipelineRasterizationProfile"
        chipset="PTL"
-       symbol_name="TestOa"
-       underscore_name="test_oa"
+       symbol_name="XvePipelineRasterizationProfile"
+       underscore_name="xve_pipeline_rasterization_profile"
        mdapi_supported_apis="VK OGL OCL IO"
        oa_format="576B_PEC64LL"
-       hw_config_guid="cf90eca9-c696-4e2c-8f48-0574b1745a58"
+       hw_config_guid="c8770c23-1a3a-4869-89e8-2e22ea9af5cd"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -6706,203 +7161,1223 @@
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
-             description="Number of lit samples emitted by Rasterizer"
-             data_type="uint64"
-             units="events"
-             semantic_type="event"
-             equation="PEC 34 READ"
-             mdapi_group="Rasterizer"
+    <counter name="XVE Inst Executed ALU2 All Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU2_ALL_UTILIZATION"
+             underscore_name="xve_inst_executed_alu2_all_utilization"
+             description="Percentage of time taken by instructions executed in ALU2 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 4 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1"
-             symbol_name="TEST_EVENT1"
-             underscore_name="test_event1"
-             description="Number of GPU (gt) clock cycles at every clock period"
+    <counter name="XVE Pipe ALU0 And ALU1 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU1_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu1_active"
+             description="Percentage of time in which ALU0 and ALU1 pipes are both actively executing a Gen ISA instruction"
              data_type="float"
              units="percent"
              semantic_type="duration"
-             equation="PEC 2 READ $XeCoreTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
-             mdapi_group="Test"
+             equation="PEC 5 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles"
-             symbol_name="TEST_EVENT1_CYCLES"
-             underscore_name="test_event1_cycles"
-             description="Number of GPU (gt) clock cycles at every clock period"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 2 READ"
-             mdapi_group="Test"
+    <counter name="XVE Pipe ALU0 And ALU2 Active"
+             symbol_name="XVE_PIPE_ALU0_AND_ALU2_ACTIVE"
+             underscore_name="xve_pipe_alu0_and_alu2_active"
+             description="Percentage of time in which ALU0 and ALU2 pipes are both actively executing a Gen ISA instruction"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 6 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore0"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE0"
-             underscore_name="test_event1_cycles_xecore0"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE0)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 3 READ"
-             availability="$GtXeCore0"
-             mdapi_group="Test"
+    <counter name="XVE Multiple Pipe Active"
+             symbol_name="XVE_MULTIPLE_PIPE_ACTIVE"
+             underscore_name="xve_multiple_pipe_active"
+             description="Percentage of time in which at least two pipes are actively executing a Gen ISA instruction among ALU0, ALU1 and ALU2 pipes"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 21 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore1"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE1"
-             underscore_name="test_event1_cycles_xecore1"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE1)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 4 READ"
-             availability="$GtXeCore1"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 VS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_VS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_vs_utilization"
+             description="Percentage of time taken by instructions executed by VS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore2"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE2"
-             underscore_name="test_event1_cycles_xecore2"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE2)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 5 READ"
-             availability="$GtXeCore2"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 MS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_MS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ms_utilization"
+             description="Percentage of time taken by instructions executed by MS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore3"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE3"
-             underscore_name="test_event1_cycles_xecore3"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE3)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 6 READ"
-             availability="$GtXeCore3"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 TS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_TS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ts_utilization"
+             description="Percentage of time taken by instructions executed by TS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore4"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE4"
-             underscore_name="test_event1_cycles_xecore4"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE4)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 21 READ"
-             availability="$GtXeCore4"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 PS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_PS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_ps_utilization"
+             description="Percentage of time taken by instructions executed by PS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore5"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE5"
-             underscore_name="test_event1_cycles_xecore5"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE5)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 22 READ"
-             availability="$GtXeCore5"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 Async CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_ASYNC_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_async_cs_utilization"
+             description="Percentage of time taken by instructions executed by ASYNC_CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore6"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE6"
-             underscore_name="test_event1_cycles_xecore6"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE6)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 23 READ"
-             availability="$GtXeCore6"
-             mdapi_group="Test"
+    <counter name="XVE Inst Executed ALU0 CS Utilization"
+             symbol_name="XVE_INST_EXECUTED_ALU0_CS_UTILIZATION"
+             underscore_name="xve_inst_executed_alu0_cs_utilization"
+             description="Percentage of time taken by instructions executed by CS threads on ALU0 pipe"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="PEC 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Vector Engine"
              mdapi_usage_flags="Frame Batch Draw"
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
-    <counter name="Test Event1 Cycles Xecore7"
-             symbol_name="TEST_EVENT1_CYCLES_XECORE7"
-             underscore_name="test_event1_cycles_xecore7"
-             description="Number of GPU (gt) clock cycles at every clock period (XECORE7)"
-             data_type="uint64"
-             units="cycles"
-             semantic_type="event"
-             equation="PEC 24 READ"
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
+             equation="PEC 22 READ $VectorEngineThreadsCount $VectorEngineTotalCount UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 23 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 24 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 25 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 26 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 27 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 28 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 29 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 30 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 31 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+        <register type="OA" address="0x000130A8" value="0x00000624" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000604" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000061D" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x0000061B" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000620" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x0000061A" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000621" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x0000061F" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000628" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x0000061C" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x0000061E" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x000B0010" />
+        <register type="FLEX" address="0x0000E558" value="0x000500A0" />
+        <register type="FLEX" address="0x0000E658" value="0x00060090" />
+        <register type="FLEX" address="0x0000E758" value="0x000B0010" />
+        <register type="FLEX" address="0x0000E45C" value="0x000500A0" />
+        <register type="FLEX" address="0x0000E55C" value="0x00060090" />
+    </register_config>
+  </set>
+
+  <set name="XvePipelineRaytracingProfile"
+       chipset="PTL"
+       symbol_name="XvePipelineRaytracingProfile"
+       underscore_name="xve_pipeline_raytracing_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="576B_PEC64LL"
+       hw_config_guid="dac47689-630c-4a44-a9e9-e8c94e3a33c4"
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
+             equation="PEC 22 READ $VectorEngineThreadsCount $VectorEngineTotalCount UMUL UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 23 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 24 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 25 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 26 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 27 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 28 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 29 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 30 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="PEC 31 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+        <register type="OA" address="0x000130A8" value="0x00000624" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000604" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000061D" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x0000061B" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000620" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x0000061A" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000621" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x0000061F" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000628" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x0000061C" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x0000061E" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x000D00C0" />
+        <register type="FLEX" address="0x0000E558" value="0x000500E0" />
+        <register type="FLEX" address="0x0000E658" value="0x00060090" />
+        <register type="FLEX" address="0x0000E758" value="0x000D00C0" />
+        <register type="FLEX" address="0x0000E45C" value="0x000500E0" />
+        <register type="FLEX" address="0x0000E55C" value="0x00060090" />
+    </register_config>
+  </set>
+
+  <set name="TestOa"
+       chipset="PTL"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="576B_PEC64LL"
+       hw_config_guid="cf90eca9-c696-4e2c-8f48-0574b1745a58"
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
              availability="$GtXeCore7"
              mdapi_group="Test"
              mdapi_usage_flags="Frame Batch Draw"
@@ -7062,4 +8537,213 @@
     </register_config>
   </set>
 
+  <set name="MediaSet2"
+       chipset="PTL"
+       symbol_name="MediaSet2"
+       underscore_name="media_set2"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="36cf7053-8097-4389-bc5d-a652553de240"
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
+       chipset="PTL"
+       symbol_name="MediaSet1"
+       underscore_name="media_set1"
+       mdapi_supported_apis="IO"
+       oa_format="128B_MPEC8_NOA16"
+       hw_config_guid="2d53df97-44b8-4bf1-aa33-2de98fe6f6ad"
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
+    <counter name="Command Parser Graphics Security Controller Busy"
+             symbol_name="COMMAND_PARSER_GRAPHICS_SECURITY_CONTROLLER_BUSY"
+             underscore_name="command_parser_graphics_security_controller_busy"
+             description="Number of GSCCS activities"
+             data_type="float"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="Media"
+             mdapi_usage_flags="Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00393200" value="0x00000003" />
+        <register type="OA" address="0x00393204" value="0x00000000" />
+    </register_config>
+  </set>
+
 </metrics>
-- 
2.43.0

