Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE91C2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214AD10EC09;
	Thu, 20 Jun 2024 20:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2uC5WGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4B410E670
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913659; x=1750449659;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=59v2fPbRjmMNFfApwQVkSYOgIW6Xaee1b8WLsUOmysY=;
 b=O2uC5WGXAWVlWhJ9SF60bPjl9Sql9EZuU6gn/q7xoutvLV4prydKgQ5J
 O4axYE1bfcA3+O0plcBzCGx0DThFCvqdH1WWWuc2SSLqslmVgrd0DxnS/
 3Z5zZA8sxoZ9SAv4DNsCriOMPvRDgxD00I9LZaUYKmjguF9BSMQNt91Ds
 6Nwyv4Q6z9ezAY7UTtzGPW6j4jfWL7at98UNSAJH4AaVp4jRbpxc8x+gz
 gyYTd2BvfItKPHHeHF40vE/iI5ImZ8/G0eo/wSx1RwxRZLIE9v9gyOAQ0
 rAJCcF5Dw2zW+MuT0xfrXalkkSNW4eLhGlc23+jY7rrO6q2OUVnlpLpiG Q==;
X-CSE-ConnectionGUID: abOUaRvtTZ2/FuvAd8J+Jg==
X-CSE-MsgGUID: 94Pb1mdpQHi5T6O1SC8Y8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329319"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:58 -0700
X-CSE-ConnectionGUID: YLkZHP97QGOdV5MQAOvNHw==
X-CSE-MsgGUID: CJr8hhtZQAmIoct2jg6fhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459829"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:58 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/28] lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
Date: Thu, 20 Jun 2024 13:00:28 -0700
Message-ID: <20240620200054.3550653-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
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

$ mdapi-xml-convert.py --guids=guids.xml MetricsXML_P31.xml > oa-lnl.xml

Note: The metrics XML's consist of (a) the registers (in this case NOA or
mux registers) to be programmed (b) the metrics themselves which specify
how the counters in the reports should be combined to construct the
metrics.  The changes in mdapi-xml-convert.py in this patch completely
ignore (b) since they are not relevant for IGT. (a) is needed for IGT LNL
OAG uses "576B_PEC64LL" format which is not available on previous platforms
so we cannot use metrics for a previous platform such as MTL to generate
LNL OAG data.

Note: LNL media guids had issues after running mdapi-convert-xml.py so have
not been added, revisit this.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/mdapi-xml-convert.py |   25 +
 lib/xe/oa-configs/oa-lnl.xml           | 2799 ++++++++++++++++++++++++
 2 files changed, 2824 insertions(+)
 create mode 100644 lib/xe/oa-configs/oa-lnl.xml

diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index 5903ef4d35..ab4747ddd1 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -149,6 +149,21 @@ mtl_chipset_oam_samedia_params = {
     }
 }
 
+# FIXME: everything except oa_report_size is incorrect here
+xe2_chipset_params = {
+    'a_offset': 16,
+    'b_offset': 192,
+    'c_offset': 224,
+    'oa_report_size': 576,
+    'config_reg_blacklist': {
+        0x2364, # OACTXID
+    },
+    'register_offsets': {
+        0x1b0: 'PERFCNT 0',
+        0x1b8: 'PERFCNT 1',
+    }
+}
+
 hsw_chipset_oa_formats = {
     '256B_GENERIC_NOA16': hsw_chipset_params,
 }
@@ -167,6 +182,10 @@ mtl_chipset_oa_formats = {
     '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
 }
 
+xe2_chipset_oa_formats = {
+    '256B_GENERIC_NOA16': xe2_chipset_params,
+}
+
 chipsets = {
     'HSW': hsw_chipset_oa_formats,
     'BDW': gen8_11_chipset_oa_formats,
@@ -185,10 +204,13 @@ chipsets = {
     'ADL': gen8_11_chipset_oa_formats,
     'ACM': xehpsdv_chipset_oa_formats,
     'MTL': mtl_chipset_oa_formats,
+    'LNL': xe2_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
 
+xe2_plus = ( 'LNL' )
+
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
 
 default_set_blacklist = { "RenderDX1x", # TODO: rename to something non 'DX'
@@ -352,6 +374,9 @@ def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
                 return "C " + str(idx - 48) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset, oa_format))
+        elif chipset in xe2_plus:
+            # FIXME: skip all metrics to retain just the registers
+                return "GPU_TIME 0 READ"
         else:
             # For Gen8+ the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
diff --git a/lib/xe/oa-configs/oa-lnl.xml b/lib/xe/oa-configs/oa-lnl.xml
new file mode 100644
index 0000000000..3576ca2827
--- /dev/null
+++ b/lib/xe/oa-configs/oa-lnl.xml
@@ -0,0 +1,2799 @@
+<?xml version="1.0"?>
+<metrics version="1697079501" merge_md5="">
+  <set name="RenderBasic"
+       chipset="LNL"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="12f20772-0044-44ff-bcc0-d2bc252d140e"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000402" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000400" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000A0D" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000002" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000006" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000601" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x0000060F" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x0000060F" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x0000060F" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000603" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000603" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000603" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000604" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x0000060B" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000A13" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000A14" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000A15" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000A16" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A0" value="0x00000606" />
+        <register type="OA" address="0x000130A4" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000005" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000622" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000623" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000605" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x0000060F" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000603" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000600" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000C10" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000C18" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000A0A" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000A0B" />
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
+        <register type="OA" address="0x00013318" value="0x00004001" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00004001" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00004001" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00004000" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00004000" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00004000" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x0000600F" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x0000600F" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x0000600F" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00006010" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00006010" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00006010" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00005009" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00005009" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00005009" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00005013" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00005013" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00005013" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00005000" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00005000" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00005000" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00006603" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00006603" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00006603" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00006601" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00006601" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00006601" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00006606" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00006606" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00006606" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00006605" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00006605" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00006605" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00004404" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00004404" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00004404" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00004402" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00004402" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00004402" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00006611" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00006611" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00006611" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00006612" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00006612" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00006612" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00004400" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00004400" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00004400" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00004600" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00004600" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00004600" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00004601" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00004601" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00004601" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00005C00" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00005C00" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00005C00" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00005E04" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00005E04" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00005E04" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00004A00" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00004A00" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00004A00" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00004A01" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00004A01" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00004A01" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00005E0A" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00005E0A" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00005E0A" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00005E0B" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00005E0B" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00005E0B" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00060000" />
+        <register type="FLEX" address="0x0000E558" value="0x00010050" />
+        <register type="FLEX" address="0x0000E658" value="0x00050060" />
+        <register type="FLEX" address="0x0000E758" value="0x00000010" />
+        <register type="FLEX" address="0x0000E65C" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="ComputeBasic"
+       chipset="LNL"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="72539be3-67d9-4101-b067-766b7811d2bb"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000622" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000623" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000605" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x0000060F" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000603" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000601" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000604" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000A0B" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000A0A" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00001804" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00001600" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000625" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000626" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x0000060B" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000600" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000606" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000614" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000624" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000A0E" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000A0D" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000A15" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000A16" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000A13" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000A14" />
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
+        <register type="OA" address="0x00013318" value="0x00006002" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006002" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006002" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00006012" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00006012" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00006012" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00006011" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00006011" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00006011" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x0000600F" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x0000600F" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x0000600F" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00006010" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00006010" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00006010" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00006015" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00006015" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00006015" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00004600" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00004600" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00004600" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00004601" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00004601" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00004601" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00005E0A" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00005E0A" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00005E0A" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00005E0B" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00005E0B" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00005E0B" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00005E00" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00005E00" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00005E00" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00005E01" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00005E01" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00005E01" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00005E04" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00005E04" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00005E04" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00005C00" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00005C00" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00005C00" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00005009" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00005009" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00005009" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00005008" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00005008" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00005008" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00005000" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00005000" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00005000" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00005010" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00005010" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00005010" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00005013" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00005013" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00005013" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00005012" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00005012" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00005012" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="DepthProfile"
+       chipset="LNL"
+       symbol_name="DepthProfile"
+       underscore_name="depth_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="cae0b2ca-c52a-4111-b8bf-5af070677d57"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
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
+        <register type="OA" address="0x00013318" value="0x00004C23" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00004C23" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00004C23" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00004C22" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00004C22" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00004C22" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00004C04" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00004C04" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00004C04" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00004C02" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00004C02" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00004C02" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00004C05" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00004C05" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00004C05" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00004C03" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00004C03" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00004C03" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00004C01" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00004C01" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00004C01" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00004C00" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00004C00" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00004C00" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00004C24" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00004C24" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00004C24" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00004C20" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00004C20" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00004C20" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00004C21" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00004C21" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00004C21" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00004003" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00004003" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00004003" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00004004" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00004004" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00004004" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00004005" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00004005" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00004005" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00004006" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00004006" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00004006" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00004A02" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00004A02" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00004A02" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00006801" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00006801" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00006801" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00006802" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00006802" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00006802" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00005E05" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00005E05" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00005E05" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="DeviceCacheProfile"
+       chipset="LNL"
+       symbol_name="DeviceCacheProfile"
+       underscore_name="device_cache_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="70cc56cf-3a37-4f6c-8911-4455fe441b2a"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
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
+        <register type="OA" address="0x00013318" value="0x00006017" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006017" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006017" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00006019" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00006019" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00006019" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00006016" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00006016" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00006016" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00006018" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00006018" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00006018" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x0000600B" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x0000600B" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x0000600B" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x0000600C" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x0000600C" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x0000600C" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00006008" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00006008" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00006008" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00006007" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00006007" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00006007" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x0000601C" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x0000601C" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x0000601C" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x0000601A" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x0000601A" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x0000601A" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x0000601B" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x0000601B" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x0000601B" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x0000600A" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x0000600A" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x0000600A" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00006009" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00006009" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00006009" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x0000600D" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x0000600D" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x0000600D" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x0000600E" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x0000600E" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x0000600E" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00006014" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00006014" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00006014" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00006000" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00006000" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00006000" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00006001" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00006001" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00006001" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00006013" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00006013" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00006013" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00006002" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00006002" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00006002" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00006012" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00006012" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00006012" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00006011" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00006011" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00006011" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x0000600F" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x0000600F" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x0000600F" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00006015" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00006015" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00006015" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+        <register type="OA" address="0x000133D8" value="0x00006010" />
+        <register type="OA" address="0x000133DC" value="0x00000000" />
+        <register type="OA" address="0x000135D8" value="0x00006010" />
+        <register type="OA" address="0x000135DC" value="0x00000000" />
+        <register type="OA" address="0x000137D8" value="0x00006010" />
+        <register type="OA" address="0x000137DC" value="0x00000000" />
+        <register type="OA" address="0x000133E0" value="0x00005E00" />
+        <register type="OA" address="0x000133E4" value="0x00000000" />
+        <register type="OA" address="0x000135E0" value="0x00005E00" />
+        <register type="OA" address="0x000135E4" value="0x00000000" />
+        <register type="OA" address="0x000137E0" value="0x00005E00" />
+        <register type="OA" address="0x000137E4" value="0x00000000" />
+        <register type="OA" address="0x000133E8" value="0x00005E01" />
+        <register type="OA" address="0x000133EC" value="0x00000000" />
+        <register type="OA" address="0x000135E8" value="0x00005E01" />
+        <register type="OA" address="0x000135EC" value="0x00000000" />
+        <register type="OA" address="0x000137E8" value="0x00005E01" />
+        <register type="OA" address="0x000137EC" value="0x00000000" />
+        <register type="OA" address="0x000133F0" value="0x00005E02" />
+        <register type="OA" address="0x000133F4" value="0x00000000" />
+        <register type="OA" address="0x000135F0" value="0x00005E02" />
+        <register type="OA" address="0x000135F4" value="0x00000000" />
+        <register type="OA" address="0x000137F0" value="0x00005E02" />
+        <register type="OA" address="0x000137F4" value="0x00000000" />
+        <register type="OA" address="0x000133F8" value="0x00005E03" />
+        <register type="OA" address="0x000133FC" value="0x00000000" />
+        <register type="OA" address="0x000135F8" value="0x00005E03" />
+        <register type="OA" address="0x000135FC" value="0x00000000" />
+        <register type="OA" address="0x000137F8" value="0x00005E03" />
+        <register type="OA" address="0x000137FC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MemoryProfile"
+       chipset="LNL"
+       symbol_name="MemoryProfile"
+       underscore_name="memory_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="01ffd51d-a6d6-4ff4-93d0-619f04c3a547"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000A0B" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000A13" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000A14" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000A0A" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000A11" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000A10" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000A01" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000A06" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000A07" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000A04" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000A05" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000A0C" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000A12" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000A0E" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000A17" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000A0D" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000A15" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000A16" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000A02" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000A03" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000A00" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000A0F" />
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
+        <register type="OA" address="0x00013318" value="0x00004600" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00004600" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00004600" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00004601" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00004601" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00004601" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00005E08" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00005E08" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00005E08" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00005E09" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00005E09" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00005E09" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00005E06" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00005E06" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00005E06" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00005E07" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00005E07" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00005E07" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00005E0A" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00005E0A" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00005E0A" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00005E0B" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00005E0B" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00005E0B" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00005E00" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00005E00" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00005E00" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00005E01" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00005E01" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00005E01" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00005E04" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00005E04" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00005E04" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00005C00" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00005C00" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00005C00" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00006002" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00006002" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00006002" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00006014" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00006014" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00006014" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00006012" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00006012" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00006012" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00006000" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00006000" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00006000" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00006011" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00006011" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00006011" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00006001" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00006001" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00006001" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x0000600F" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x0000600F" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x0000600F" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00006015" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00006015" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00006015" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00006013" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00006013" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00006013" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00006010" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00006010" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00006010" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00006E00" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00006E00" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00006E00" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00006E02" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00006E02" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00006E02" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+        <register type="OA" address="0x000133D8" value="0x00006E01" />
+        <register type="OA" address="0x000133DC" value="0x00000000" />
+        <register type="OA" address="0x000135D8" value="0x00006E01" />
+        <register type="OA" address="0x000135DC" value="0x00000000" />
+        <register type="OA" address="0x000137D8" value="0x00006E01" />
+        <register type="OA" address="0x000137DC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="RenderPipeProfile"
+       chipset="LNL"
+       symbol_name="RenderPipeProfile"
+       underscore_name="render_pipe_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="6791470f-f1e6-4f77-9013-bcb0c4be6f57"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000401" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000007" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000003" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000001" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000004" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00001803" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00001800" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00001605" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00001603" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00001601" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00001604" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00001602" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00001606" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00001807" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00001808" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
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
+        <register type="OA" address="0x00013318" value="0x00006600" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006600" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006600" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00006604" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00006604" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00006604" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00006602" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00006602" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00006602" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00004401" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00004401" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00004401" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00006610" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00006610" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00006610" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00004407" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00004407" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00004407" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00004406" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00004406" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00004406" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00004403" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00004403" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00004403" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00004201" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00004201" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00004201" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00004002" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00004002" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00004002" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00004202" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00004202" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00004202" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00004200" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00004200" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00004200" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00004007" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00004007" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00004007" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00004008" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00004008" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00004008" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00004E04" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00004E04" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00004E04" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00004E03" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00004E03" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00004E03" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00006800" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00006800" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00006800" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00006803" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00006803" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00006803" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00006804" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00006804" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00006804" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00005011" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00005011" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00005011" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00004E00" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00004E00" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00004E00" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00004E01" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00004E01" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00004E01" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00004E02" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00004E02" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00004E02" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="RTProfile"
+       chipset="LNL"
+       symbol_name="RTProfile"
+       underscore_name="rt_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="d66ce633-4ae5-4de2-8678-9705adfd45bc"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000C03" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000C04" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000C00" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000C1A" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000C2F" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000C1D" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000C2A" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x0000060F" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x0000060F" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x0000060F" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000603" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000603" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000603" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000604" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000C10" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000C18" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000A08" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000A09" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000C2D" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000C02" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000C19" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000C01" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000C2E" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000C30" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000C2B" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000C20" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000C2C" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000C28" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000C29" />
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
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E558" value="0x000D00C0" />
+        <register type="FLEX" address="0x0000E658" value="0x000C00E0" />
+        <register type="FLEX" address="0x0000E758" value="0x000E00D0" />
+        <register type="FLEX" address="0x0000E45C" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="VectorEngineProfile"
+       chipset="LNL"
+       symbol_name="VectorEngineProfile"
+       underscore_name="vector_engine_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="e7338926-568c-4424-bc44-f90318a6b472"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000622" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000623" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000605" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x0000060F" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000603" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x0000060E" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x0000060A" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000609" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000601" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000616" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000615" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000619" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000618" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000617" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x0000060B" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000624" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000625" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000626" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A0" value="0x00000604" />
+        <register type="OA" address="0x000130A4" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000614" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000608" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000607" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000602" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000611" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000610" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000612" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000629" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x0000060C" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x0000060D" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000613" />
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
+        <register type="OA" address="0x00013318" value="0x00006002" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006002" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006002" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00006014" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00006014" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00006014" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00006012" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00006012" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00006012" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00006000" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00006000" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00006000" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00006011" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00006011" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00006011" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00006001" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00006001" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00006001" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x0000600F" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x0000600F" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x0000600F" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00006015" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00006015" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00006015" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00006013" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00006013" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00006013" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00006010" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00006010" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00006010" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00005009" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00005009" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00005009" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00005008" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00005008" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00005008" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00005013" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00005013" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00005013" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00005012" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00005012" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00005012" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00004600" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00004600" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00004600" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00004601" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00004601" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00004601" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00005E0A" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00005E0A" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00005E0A" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00005E0B" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00005E0B" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00005E0B" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00005C00" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00005C00" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00005C00" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00005E04" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00005E04" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00005E04" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00000000" />
+        <register type="FLEX" address="0x0000E558" value="0x00000000" />
+        <register type="FLEX" address="0x0000E658" value="0x00000000" />
+        <register type="FLEX" address="0x0000E758" value="0x00000000" />
+        <register type="FLEX" address="0x0000E45C" value="0x00000000" />
+        <register type="FLEX" address="0x0000E65C" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="VectorEngineStalls"
+       chipset="LNL"
+       symbol_name="VectorEngineStalls"
+       underscore_name="vector_engine_stalls"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="4ccd6535-fb9a-440f-b0f5-882879dc4cb0"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x0000061D" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x0000061B" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000620" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x0000061A" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000621" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000600" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000606" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000604" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000624" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000625" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000626" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x0000061F" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000628" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000061C" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x0000061E" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00001601" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00001604" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00001602" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00001606" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00001807" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00001808" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000605" />
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
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00000000" />
+        <register type="FLEX" address="0x0000E558" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="TestOa"
+       chipset="LNL"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001801" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001802" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00003E00" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
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
+  <set name="MetricSet1"
+       chipset="LNL"
+       symbol_name="MetricSet1"
+       underscore_name="metric_set1"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="0af24f48-05bc-467b-b561-33dec252e651"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00000001" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00000002" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000003" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000004" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000005" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000006" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000007" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000400" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000401" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000402" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000600" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000601" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000602" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000603" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000604" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000605" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000606" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000607" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000608" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000609" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A0" value="0x0000060A" />
+        <register type="OA" address="0x000130A4" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x0000060B" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x0000060C" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x0000060D" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x0000060E" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x0000060F" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000610" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000611" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000612" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000613" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000614" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000615" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00004000" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00004000" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00004000" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00004001" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00004001" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00004001" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00004002" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00004002" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00004002" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00004003" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00004003" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00004003" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00004004" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00004004" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00004004" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00004005" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00004005" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00004005" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00004006" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00004006" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00004006" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00004007" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00004007" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00004007" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00004008" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00004008" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00004008" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00004200" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00004200" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00004200" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00004201" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00004201" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00004201" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00004202" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00004202" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00004202" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00004400" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00004400" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00004400" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00004401" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00004401" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00004401" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00004402" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00004402" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00004402" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00004403" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00004403" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00004403" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00004404" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00004404" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00004404" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00004405" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00004405" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00004405" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00004406" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00004406" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00004406" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00004407" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00004407" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00004407" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00004600" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00004600" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00004600" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00004601" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00004601" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00004601" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00004A00" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00004A00" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00004A00" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00004A01" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00004A01" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00004A01" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00004A02" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00004A02" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00004A02" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00004C00" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00004C00" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00004C00" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00004C01" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00004C01" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00004C01" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+        <register type="OA" address="0x000133D8" value="0x00004C02" />
+        <register type="OA" address="0x000133DC" value="0x00000000" />
+        <register type="OA" address="0x000135D8" value="0x00004C02" />
+        <register type="OA" address="0x000135DC" value="0x00000000" />
+        <register type="OA" address="0x000137D8" value="0x00004C02" />
+        <register type="OA" address="0x000137DC" value="0x00000000" />
+        <register type="OA" address="0x000133E0" value="0x00004C03" />
+        <register type="OA" address="0x000133E4" value="0x00000000" />
+        <register type="OA" address="0x000135E0" value="0x00004C03" />
+        <register type="OA" address="0x000135E4" value="0x00000000" />
+        <register type="OA" address="0x000137E0" value="0x00004C03" />
+        <register type="OA" address="0x000137E4" value="0x00000000" />
+        <register type="OA" address="0x000133E8" value="0x00004C04" />
+        <register type="OA" address="0x000133EC" value="0x00000000" />
+        <register type="OA" address="0x000135E8" value="0x00004C04" />
+        <register type="OA" address="0x000135EC" value="0x00000000" />
+        <register type="OA" address="0x000137E8" value="0x00004C04" />
+        <register type="OA" address="0x000137EC" value="0x00000000" />
+        <register type="OA" address="0x000133F0" value="0x00004C05" />
+        <register type="OA" address="0x000133F4" value="0x00000000" />
+        <register type="OA" address="0x000135F0" value="0x00004C05" />
+        <register type="OA" address="0x000135F4" value="0x00000000" />
+        <register type="OA" address="0x000137F0" value="0x00004C05" />
+        <register type="OA" address="0x000137F4" value="0x00000000" />
+        <register type="OA" address="0x000133F8" value="0x00004C20" />
+        <register type="OA" address="0x000133FC" value="0x00000000" />
+        <register type="OA" address="0x000135F8" value="0x00004C20" />
+        <register type="OA" address="0x000135FC" value="0x00000000" />
+        <register type="OA" address="0x000137F8" value="0x00004C20" />
+        <register type="OA" address="0x000137FC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MetricSet2"
+       chipset="LNL"
+       symbol_name="MetricSet2"
+       underscore_name="metric_set2"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="914ad901-832a-4ccd-a21e-ddc7690ed213"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00000616" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00000617" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000618" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000619" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x0000061A" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x0000061B" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x0000061C" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x0000061D" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x0000061E" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x0000061F" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000620" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000621" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000622" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000623" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000624" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000625" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000626" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000628" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000629" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000A00" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A0" value="0x00000A01" />
+        <register type="OA" address="0x000130A4" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000A02" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000A03" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000A04" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000A05" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000A06" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000A07" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000A08" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000A09" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000A0A" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000A0B" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00000A0C" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00004C21" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00004C21" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00004C21" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00004C22" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00004C22" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00004C22" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00004C23" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00004C23" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00004C23" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00004C24" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00004C24" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00004C24" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00004E00" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00004E00" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00004E00" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00004E01" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00004E01" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00004E01" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00004E02" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00004E02" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00004E02" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00004E03" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00004E03" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00004E03" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00004E04" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00004E04" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00004E04" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00005000" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00005000" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00005000" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00005008" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00005008" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00005008" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00005009" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00005009" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00005009" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00005010" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00005010" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00005010" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00005011" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00005011" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00005011" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00005012" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00005012" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00005012" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00005013" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00005013" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00005013" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00005A00" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00005A00" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00005A00" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00005C00" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00005C00" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00005C00" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00005E00" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00005E00" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00005E00" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00005E01" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00005E01" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00005E01" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x00005E02" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x00005E02" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x00005E02" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x00005E03" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x00005E03" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x00005E03" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x00005E04" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x00005E04" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x00005E04" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00005E05" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00005E05" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00005E05" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00005E06" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00005E06" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00005E06" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00005E07" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00005E07" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00005E07" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00005E08" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00005E08" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00005E08" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+        <register type="OA" address="0x000133D8" value="0x00005E09" />
+        <register type="OA" address="0x000133DC" value="0x00000000" />
+        <register type="OA" address="0x000135D8" value="0x00005E09" />
+        <register type="OA" address="0x000135DC" value="0x00000000" />
+        <register type="OA" address="0x000137D8" value="0x00005E09" />
+        <register type="OA" address="0x000137DC" value="0x00000000" />
+        <register type="OA" address="0x000133E0" value="0x00005E0A" />
+        <register type="OA" address="0x000133E4" value="0x00000000" />
+        <register type="OA" address="0x000135E0" value="0x00005E0A" />
+        <register type="OA" address="0x000135E4" value="0x00000000" />
+        <register type="OA" address="0x000137E0" value="0x00005E0A" />
+        <register type="OA" address="0x000137E4" value="0x00000000" />
+        <register type="OA" address="0x000133E8" value="0x00005E0B" />
+        <register type="OA" address="0x000133EC" value="0x00000000" />
+        <register type="OA" address="0x000135E8" value="0x00005E0B" />
+        <register type="OA" address="0x000135EC" value="0x00000000" />
+        <register type="OA" address="0x000137E8" value="0x00005E0B" />
+        <register type="OA" address="0x000137EC" value="0x00000000" />
+        <register type="OA" address="0x000133F0" value="0x00006000" />
+        <register type="OA" address="0x000133F4" value="0x00000000" />
+        <register type="OA" address="0x000135F0" value="0x00006000" />
+        <register type="OA" address="0x000135F4" value="0x00000000" />
+        <register type="OA" address="0x000137F0" value="0x00006000" />
+        <register type="OA" address="0x000137F4" value="0x00000000" />
+        <register type="OA" address="0x000133F8" value="0x00006001" />
+        <register type="OA" address="0x000133FC" value="0x00000000" />
+        <register type="OA" address="0x000135F8" value="0x00006001" />
+        <register type="OA" address="0x000135FC" value="0x00000000" />
+        <register type="OA" address="0x000137F8" value="0x00006001" />
+        <register type="OA" address="0x000137FC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MetricSet3"
+       chipset="LNL"
+       symbol_name="MetricSet3"
+       underscore_name="metric_set3"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="3b3c9f55-e34b-423d-8c05-7b1af03b6685"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00000A0D" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00000A0E" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00000A0F" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00000A10" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00000A11" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00000A12" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00000A13" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00000A14" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00000A15" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00000A16" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00000A17" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00000C00" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00000C01" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00000C02" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013070" value="0x00000C03" />
+        <register type="OA" address="0x00013074" value="0x00000000" />
+        <register type="OA" address="0x00013078" value="0x00000C04" />
+        <register type="OA" address="0x0001307C" value="0x00000000" />
+        <register type="OA" address="0x00013080" value="0x00000C10" />
+        <register type="OA" address="0x00013084" value="0x00000000" />
+        <register type="OA" address="0x00013088" value="0x00000C18" />
+        <register type="OA" address="0x0001308C" value="0x00000000" />
+        <register type="OA" address="0x00013090" value="0x00000C19" />
+        <register type="OA" address="0x00013094" value="0x00000000" />
+        <register type="OA" address="0x00013098" value="0x00000C1A" />
+        <register type="OA" address="0x0001309C" value="0x00000000" />
+        <register type="OA" address="0x000130A0" value="0x00000C1D" />
+        <register type="OA" address="0x000130A4" value="0x00000000" />
+        <register type="OA" address="0x000130A8" value="0x00000C20" />
+        <register type="OA" address="0x000130AC" value="0x00000000" />
+        <register type="OA" address="0x000130B0" value="0x00000C28" />
+        <register type="OA" address="0x000130B4" value="0x00000000" />
+        <register type="OA" address="0x000130B8" value="0x00000C29" />
+        <register type="OA" address="0x000130BC" value="0x00000000" />
+        <register type="OA" address="0x000130C0" value="0x00000C2A" />
+        <register type="OA" address="0x000130C4" value="0x00000000" />
+        <register type="OA" address="0x000130C8" value="0x00000C2B" />
+        <register type="OA" address="0x000130CC" value="0x00000000" />
+        <register type="OA" address="0x000130D0" value="0x00000C2C" />
+        <register type="OA" address="0x000130D4" value="0x00000000" />
+        <register type="OA" address="0x000130D8" value="0x00000C2D" />
+        <register type="OA" address="0x000130DC" value="0x00000000" />
+        <register type="OA" address="0x000130E0" value="0x00000C2E" />
+        <register type="OA" address="0x000130E4" value="0x00000000" />
+        <register type="OA" address="0x000130E8" value="0x00000C2F" />
+        <register type="OA" address="0x000130EC" value="0x00000000" />
+        <register type="OA" address="0x000130F0" value="0x00000C30" />
+        <register type="OA" address="0x000130F4" value="0x00000000" />
+        <register type="OA" address="0x000130F8" value="0x00001600" />
+        <register type="OA" address="0x000130FC" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00006002" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00006002" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00006002" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00006007" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00006007" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00006007" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00006008" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00006008" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00006008" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00006009" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006009" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006009" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x0000600A" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x0000600A" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x0000600A" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x0000600B" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x0000600B" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x0000600B" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x0000600C" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x0000600C" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x0000600C" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x0000600D" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x0000600D" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x0000600D" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x0000600E" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x0000600E" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x0000600E" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x0000600F" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x0000600F" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x0000600F" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00006010" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00006010" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00006010" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00006011" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00006011" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00006011" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00006012" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00006012" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00006012" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00006013" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00006013" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00006013" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00006014" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00006014" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00006014" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+        <register type="OA" address="0x00013378" value="0x00006015" />
+        <register type="OA" address="0x0001337C" value="0x00000000" />
+        <register type="OA" address="0x00013578" value="0x00006015" />
+        <register type="OA" address="0x0001357C" value="0x00000000" />
+        <register type="OA" address="0x00013778" value="0x00006015" />
+        <register type="OA" address="0x0001377C" value="0x00000000" />
+        <register type="OA" address="0x00013380" value="0x00006016" />
+        <register type="OA" address="0x00013384" value="0x00000000" />
+        <register type="OA" address="0x00013580" value="0x00006016" />
+        <register type="OA" address="0x00013584" value="0x00000000" />
+        <register type="OA" address="0x00013780" value="0x00006016" />
+        <register type="OA" address="0x00013784" value="0x00000000" />
+        <register type="OA" address="0x00013388" value="0x00006017" />
+        <register type="OA" address="0x0001338C" value="0x00000000" />
+        <register type="OA" address="0x00013588" value="0x00006017" />
+        <register type="OA" address="0x0001358C" value="0x00000000" />
+        <register type="OA" address="0x00013788" value="0x00006017" />
+        <register type="OA" address="0x0001378C" value="0x00000000" />
+        <register type="OA" address="0x00013390" value="0x00006018" />
+        <register type="OA" address="0x00013394" value="0x00000000" />
+        <register type="OA" address="0x00013590" value="0x00006018" />
+        <register type="OA" address="0x00013594" value="0x00000000" />
+        <register type="OA" address="0x00013790" value="0x00006018" />
+        <register type="OA" address="0x00013794" value="0x00000000" />
+        <register type="OA" address="0x00013398" value="0x00006019" />
+        <register type="OA" address="0x0001339C" value="0x00000000" />
+        <register type="OA" address="0x00013598" value="0x00006019" />
+        <register type="OA" address="0x0001359C" value="0x00000000" />
+        <register type="OA" address="0x00013798" value="0x00006019" />
+        <register type="OA" address="0x0001379C" value="0x00000000" />
+        <register type="OA" address="0x000133A0" value="0x0000601A" />
+        <register type="OA" address="0x000133A4" value="0x00000000" />
+        <register type="OA" address="0x000135A0" value="0x0000601A" />
+        <register type="OA" address="0x000135A4" value="0x00000000" />
+        <register type="OA" address="0x000137A0" value="0x0000601A" />
+        <register type="OA" address="0x000137A4" value="0x00000000" />
+        <register type="OA" address="0x000133A8" value="0x0000601B" />
+        <register type="OA" address="0x000133AC" value="0x00000000" />
+        <register type="OA" address="0x000135A8" value="0x0000601B" />
+        <register type="OA" address="0x000135AC" value="0x00000000" />
+        <register type="OA" address="0x000137A8" value="0x0000601B" />
+        <register type="OA" address="0x000137AC" value="0x00000000" />
+        <register type="OA" address="0x000133B0" value="0x0000601C" />
+        <register type="OA" address="0x000133B4" value="0x00000000" />
+        <register type="OA" address="0x000135B0" value="0x0000601C" />
+        <register type="OA" address="0x000135B4" value="0x00000000" />
+        <register type="OA" address="0x000137B0" value="0x0000601C" />
+        <register type="OA" address="0x000137B4" value="0x00000000" />
+        <register type="OA" address="0x000133B8" value="0x00006400" />
+        <register type="OA" address="0x000133BC" value="0x00000000" />
+        <register type="OA" address="0x000135B8" value="0x00006400" />
+        <register type="OA" address="0x000135BC" value="0x00000000" />
+        <register type="OA" address="0x000137B8" value="0x00006400" />
+        <register type="OA" address="0x000137BC" value="0x00000000" />
+        <register type="OA" address="0x000133C0" value="0x00006401" />
+        <register type="OA" address="0x000133C4" value="0x00000000" />
+        <register type="OA" address="0x000135C0" value="0x00006401" />
+        <register type="OA" address="0x000135C4" value="0x00000000" />
+        <register type="OA" address="0x000137C0" value="0x00006401" />
+        <register type="OA" address="0x000137C4" value="0x00000000" />
+        <register type="OA" address="0x000133C8" value="0x00006402" />
+        <register type="OA" address="0x000133CC" value="0x00000000" />
+        <register type="OA" address="0x000135C8" value="0x00006402" />
+        <register type="OA" address="0x000135CC" value="0x00000000" />
+        <register type="OA" address="0x000137C8" value="0x00006402" />
+        <register type="OA" address="0x000137CC" value="0x00000000" />
+        <register type="OA" address="0x000133D0" value="0x00006403" />
+        <register type="OA" address="0x000133D4" value="0x00000000" />
+        <register type="OA" address="0x000135D0" value="0x00006403" />
+        <register type="OA" address="0x000135D4" value="0x00000000" />
+        <register type="OA" address="0x000137D0" value="0x00006403" />
+        <register type="OA" address="0x000137D4" value="0x00000000" />
+        <register type="OA" address="0x000133D8" value="0x00006600" />
+        <register type="OA" address="0x000133DC" value="0x00000000" />
+        <register type="OA" address="0x000135D8" value="0x00006600" />
+        <register type="OA" address="0x000135DC" value="0x00000000" />
+        <register type="OA" address="0x000137D8" value="0x00006600" />
+        <register type="OA" address="0x000137DC" value="0x00000000" />
+        <register type="OA" address="0x000133E0" value="0x00006601" />
+        <register type="OA" address="0x000133E4" value="0x00000000" />
+        <register type="OA" address="0x000135E0" value="0x00006601" />
+        <register type="OA" address="0x000135E4" value="0x00000000" />
+        <register type="OA" address="0x000137E0" value="0x00006601" />
+        <register type="OA" address="0x000137E4" value="0x00000000" />
+        <register type="OA" address="0x000133E8" value="0x00006602" />
+        <register type="OA" address="0x000133EC" value="0x00000000" />
+        <register type="OA" address="0x000135E8" value="0x00006602" />
+        <register type="OA" address="0x000135EC" value="0x00000000" />
+        <register type="OA" address="0x000137E8" value="0x00006602" />
+        <register type="OA" address="0x000137EC" value="0x00000000" />
+        <register type="OA" address="0x000133F0" value="0x00006603" />
+        <register type="OA" address="0x000133F4" value="0x00000000" />
+        <register type="OA" address="0x000135F0" value="0x00006603" />
+        <register type="OA" address="0x000135F4" value="0x00000000" />
+        <register type="OA" address="0x000137F0" value="0x00006603" />
+        <register type="OA" address="0x000137F4" value="0x00000000" />
+        <register type="OA" address="0x000133F8" value="0x00006604" />
+        <register type="OA" address="0x000133FC" value="0x00000000" />
+        <register type="OA" address="0x000135F8" value="0x00006604" />
+        <register type="OA" address="0x000135FC" value="0x00000000" />
+        <register type="OA" address="0x000137F8" value="0x00006604" />
+        <register type="OA" address="0x000137FC" value="0x00000000" />
+    </register_config>
+  </set>
+
+  <set name="MetricSet4"
+       chipset="LNL"
+       symbol_name="MetricSet4"
+       underscore_name="metric_set4"
+       mdapi_supported_apis="VK OGL OCL IO"
+       oa_format="256B_GENERIC_NOA16"
+       hw_config_guid="e6f21065-a6f5-4ea4-a545-80d6aebaab56"
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
+    <register_config type="OA">
+        <register type="OA" address="0x00013000" value="0x00001601" />
+        <register type="OA" address="0x00013004" value="0x00000000" />
+        <register type="OA" address="0x00013008" value="0x00001602" />
+        <register type="OA" address="0x0001300C" value="0x00000000" />
+        <register type="OA" address="0x00013010" value="0x00001603" />
+        <register type="OA" address="0x00013014" value="0x00000000" />
+        <register type="OA" address="0x00013018" value="0x00001604" />
+        <register type="OA" address="0x0001301C" value="0x00000000" />
+        <register type="OA" address="0x00013020" value="0x00001605" />
+        <register type="OA" address="0x00013024" value="0x00000000" />
+        <register type="OA" address="0x00013028" value="0x00001606" />
+        <register type="OA" address="0x0001302C" value="0x00000000" />
+        <register type="OA" address="0x00013030" value="0x00001800" />
+        <register type="OA" address="0x00013034" value="0x00000000" />
+        <register type="OA" address="0x00013038" value="0x00001801" />
+        <register type="OA" address="0x0001303C" value="0x00000000" />
+        <register type="OA" address="0x00013040" value="0x00001802" />
+        <register type="OA" address="0x00013044" value="0x00000000" />
+        <register type="OA" address="0x00013048" value="0x00001803" />
+        <register type="OA" address="0x0001304C" value="0x00000000" />
+        <register type="OA" address="0x00013050" value="0x00001804" />
+        <register type="OA" address="0x00013054" value="0x00000000" />
+        <register type="OA" address="0x00013058" value="0x00001807" />
+        <register type="OA" address="0x0001305C" value="0x00000000" />
+        <register type="OA" address="0x00013060" value="0x00001808" />
+        <register type="OA" address="0x00013064" value="0x00000000" />
+        <register type="OA" address="0x00013068" value="0x00003E00" />
+        <register type="OA" address="0x0001306C" value="0x00000000" />
+        <register type="OA" address="0x00013300" value="0x00006605" />
+        <register type="OA" address="0x00013304" value="0x00000000" />
+        <register type="OA" address="0x00013500" value="0x00006605" />
+        <register type="OA" address="0x00013504" value="0x00000000" />
+        <register type="OA" address="0x00013700" value="0x00006605" />
+        <register type="OA" address="0x00013704" value="0x00000000" />
+        <register type="OA" address="0x00013308" value="0x00006606" />
+        <register type="OA" address="0x0001330C" value="0x00000000" />
+        <register type="OA" address="0x00013508" value="0x00006606" />
+        <register type="OA" address="0x0001350C" value="0x00000000" />
+        <register type="OA" address="0x00013708" value="0x00006606" />
+        <register type="OA" address="0x0001370C" value="0x00000000" />
+        <register type="OA" address="0x00013310" value="0x00006610" />
+        <register type="OA" address="0x00013314" value="0x00000000" />
+        <register type="OA" address="0x00013510" value="0x00006610" />
+        <register type="OA" address="0x00013514" value="0x00000000" />
+        <register type="OA" address="0x00013710" value="0x00006610" />
+        <register type="OA" address="0x00013714" value="0x00000000" />
+        <register type="OA" address="0x00013318" value="0x00006611" />
+        <register type="OA" address="0x0001331C" value="0x00000000" />
+        <register type="OA" address="0x00013518" value="0x00006611" />
+        <register type="OA" address="0x0001351C" value="0x00000000" />
+        <register type="OA" address="0x00013718" value="0x00006611" />
+        <register type="OA" address="0x0001371C" value="0x00000000" />
+        <register type="OA" address="0x00013320" value="0x00006612" />
+        <register type="OA" address="0x00013324" value="0x00000000" />
+        <register type="OA" address="0x00013520" value="0x00006612" />
+        <register type="OA" address="0x00013524" value="0x00000000" />
+        <register type="OA" address="0x00013720" value="0x00006612" />
+        <register type="OA" address="0x00013724" value="0x00000000" />
+        <register type="OA" address="0x00013328" value="0x00006800" />
+        <register type="OA" address="0x0001332C" value="0x00000000" />
+        <register type="OA" address="0x00013528" value="0x00006800" />
+        <register type="OA" address="0x0001352C" value="0x00000000" />
+        <register type="OA" address="0x00013728" value="0x00006800" />
+        <register type="OA" address="0x0001372C" value="0x00000000" />
+        <register type="OA" address="0x00013330" value="0x00006801" />
+        <register type="OA" address="0x00013334" value="0x00000000" />
+        <register type="OA" address="0x00013530" value="0x00006801" />
+        <register type="OA" address="0x00013534" value="0x00000000" />
+        <register type="OA" address="0x00013730" value="0x00006801" />
+        <register type="OA" address="0x00013734" value="0x00000000" />
+        <register type="OA" address="0x00013338" value="0x00006802" />
+        <register type="OA" address="0x0001333C" value="0x00000000" />
+        <register type="OA" address="0x00013538" value="0x00006802" />
+        <register type="OA" address="0x0001353C" value="0x00000000" />
+        <register type="OA" address="0x00013738" value="0x00006802" />
+        <register type="OA" address="0x0001373C" value="0x00000000" />
+        <register type="OA" address="0x00013340" value="0x00006803" />
+        <register type="OA" address="0x00013344" value="0x00000000" />
+        <register type="OA" address="0x00013540" value="0x00006803" />
+        <register type="OA" address="0x00013544" value="0x00000000" />
+        <register type="OA" address="0x00013740" value="0x00006803" />
+        <register type="OA" address="0x00013744" value="0x00000000" />
+        <register type="OA" address="0x00013348" value="0x00006804" />
+        <register type="OA" address="0x0001334C" value="0x00000000" />
+        <register type="OA" address="0x00013548" value="0x00006804" />
+        <register type="OA" address="0x0001354C" value="0x00000000" />
+        <register type="OA" address="0x00013748" value="0x00006804" />
+        <register type="OA" address="0x0001374C" value="0x00000000" />
+        <register type="OA" address="0x00013350" value="0x00006805" />
+        <register type="OA" address="0x00013354" value="0x00000000" />
+        <register type="OA" address="0x00013550" value="0x00006805" />
+        <register type="OA" address="0x00013554" value="0x00000000" />
+        <register type="OA" address="0x00013750" value="0x00006805" />
+        <register type="OA" address="0x00013754" value="0x00000000" />
+        <register type="OA" address="0x00013358" value="0x00006E00" />
+        <register type="OA" address="0x0001335C" value="0x00000000" />
+        <register type="OA" address="0x00013558" value="0x00006E00" />
+        <register type="OA" address="0x0001355C" value="0x00000000" />
+        <register type="OA" address="0x00013758" value="0x00006E00" />
+        <register type="OA" address="0x0001375C" value="0x00000000" />
+        <register type="OA" address="0x00013360" value="0x00006E01" />
+        <register type="OA" address="0x00013364" value="0x00000000" />
+        <register type="OA" address="0x00013560" value="0x00006E01" />
+        <register type="OA" address="0x00013564" value="0x00000000" />
+        <register type="OA" address="0x00013760" value="0x00006E01" />
+        <register type="OA" address="0x00013764" value="0x00000000" />
+        <register type="OA" address="0x00013368" value="0x00006E02" />
+        <register type="OA" address="0x0001336C" value="0x00000000" />
+        <register type="OA" address="0x00013568" value="0x00006E02" />
+        <register type="OA" address="0x0001356C" value="0x00000000" />
+        <register type="OA" address="0x00013768" value="0x00006E02" />
+        <register type="OA" address="0x0001376C" value="0x00000000" />
+        <register type="OA" address="0x00013370" value="0x00007E00" />
+        <register type="OA" address="0x00013374" value="0x00000000" />
+        <register type="OA" address="0x00013570" value="0x00007E00" />
+        <register type="OA" address="0x00013574" value="0x00000000" />
+        <register type="OA" address="0x00013770" value="0x00007E00" />
+        <register type="OA" address="0x00013774" value="0x00000000" />
+    </register_config>
+  </set>
+
+</metrics>
-- 
2.41.0

