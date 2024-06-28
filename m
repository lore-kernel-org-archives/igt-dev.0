Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D65DC30658
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 20:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D308B10ED54;
	Fri, 28 Jun 2024 20:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXKOBUgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF72110E31B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 20:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607436; x=1751143436;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z4qlGafG3JaUWBxW2b+EKGM7UrvRbCNUlMksnXSJRzg=;
 b=jXKOBUgJRTBji5d4QyklMx6PTmNY4cDq1l7wVZ5lIixl2KCAsIHvqCPi
 be/nx++K9vSuAH05XYliJkQhEZmkpQxszb6nWPQL76HSzbk1Jq5JFau9z
 o296MkT2uwXSQSkPWG6TFKavoU5+f1P/mMXbOS0ITQWbrty+tiL9u9p0m
 UYmRoNLm0kNUsFHDrEx4k0o0B5pqr+M4o7AW3Rs0ojnn0wRd8/0pbnOrS
 LvBFHEqyMpndvC9kF3Qay4cTWgbjwqCd+9E95kU45T6eAMvIliD1vf0qe
 gQWBFhAksWP5WGuqlfaSl1qWs6CVnT2gj9qXsljABm5OnJ6NALcgAmWh9 A==;
X-CSE-ConnectionGUID: 2b0qBeidRSOD55dlMcVBMw==
X-CSE-MsgGUID: ku0Tu5YSTM+CNEXDO+YW3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27427495"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27427495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:55 -0700
X-CSE-ConnectionGUID: zzj2XypbQWOuixRWVn3Bfg==
X-CSE-MsgGUID: /bH8imGhRuKkWy+LBbqpbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49465213"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/16] xe/oa/mdapi-xml-convert: Add support for
 576B_PEC64LL format
Date: Fri, 28 Jun 2024 13:43:46 -0700
Message-ID: <20240628204348.2142940-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
References: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
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

From: José Roberto de Souza <jose.souza@intel.com>

Xe2 don't use the 256bytes long format, instead it uses a 576bytes
long with 64 PEC fields that are 64 bits long.
This patch fixes the xe2 definition and add the parser for this format.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/xe/oa-configs/codegen.py           |  5 ++
 lib/xe/oa-configs/mdapi-xml-convert.py | 76 +++++++++++++++++++++-----
 lib/xe/xe_oa.h                         |  1 +
 3 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
index f078ef9498..51498f803d 100644
--- a/lib/xe/oa-configs/codegen.py
+++ b/lib/xe/oa-configs/codegen.py
@@ -128,6 +128,7 @@ class Set:
         return self.xml.find(path)
 
 
+#TODO add SqidiTotalCount, L3BankTotalCount, L3NodeTotalCount
 hw_vars_mapping = {
     "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
     "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
@@ -159,6 +160,10 @@ hw_vars_mapping = {
     "$GpuMaxFrequency": { 'c': "perf->devinfo.gt_max_freq" },
     "$SkuRevisionId": { 'c': "perf->devinfo.revision" },
     "$QueryMode": { 'c': "perf->devinfo.query_mode" },
+
+    "$ComputeEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
+
+    "$CopyEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
 }
 
 def is_hw_var(name):
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index 575b53e955..602a3965af 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -149,12 +149,10 @@ mtl_chipset_oam_samedia_params = {
     }
 }
 
-# FIXME: everything except oa_report_size is incorrect here
-xe2_chipset_params = {
-    'a_offset': 16,
-    'b_offset': 192,
-    'c_offset': 224,
+xe2_chipset_params_pec = {
+    'pec_offset': 32,
     'oa_report_size': 576,
+    # TODO: Not sure about the configs below
     'config_reg_blacklist': {
         0x2364, # OACTXID
     },
@@ -183,7 +181,11 @@ mtl_chipset_oa_formats = {
 }
 
 xe2_chipset_oa_formats = {
-    '256B_GENERIC_NOA16': xe2_chipset_params,
+    '576B_PEC64LL': xe2_chipset_params_pec,
+    # We only care about 576B_PEC64LL metrics in Xe2, entries below is just to
+    # surpress warnings
+    '256B_GENERIC_NOA16': xehpsdv_chipset_params,
+    '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
 }
 
 chipsets = {
@@ -209,8 +211,6 @@ chipsets = {
 
 xehp_plus = ( 'ACM', 'MTL' )
 
-xe2_plus = ( 'LNL' )
-
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
 
 default_set_blacklist = { "RenderDX1x", # TODO: rename to something non 'DX'
@@ -298,6 +298,46 @@ def read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format):
 
     assert 0
 
+def read_token_to_rpn_read_pec(chipset, token, raw_offsets, oa_format):
+    width, offset_str = token.split('@')
+    offset = int(offset_str, 16)
+
+    if width != 'qw':
+        assert 0
+
+    if raw_offsets:
+        pec_offset = chipsets[chipset][oa_format]['pec_offset']
+
+        if offset < pec_offset:
+            if offset == 8:
+                return "GPU_TIME 0 READ"
+            elif offset == 24:
+                return "GPU_CLOCK 0 READ"
+            else:
+                assert 0
+        else:
+            pec_cnt_offset = int((offset - pec_offset) / 8)
+
+            return "PEC " + str(pec_cnt_offset) + " READ"
+    else:
+        # Location in the accumulated deltas
+        idx = int(offset / 8)
+
+        if idx == 0:
+            return "GPU_TIME 0 READ"
+        elif idx == 1:
+            return "GPU_CLOCK 0 READ"
+        else:
+            idx = idx - 2;
+            pec_cnt_offset = str(idx)
+            pec_high_low_text = "low"
+            if (offset % 8) > 0:
+               pec_high_low_text = "high"
+
+            return "PEC " + pec_cnt_offset + " READ"
+
+    assert 0
+
 def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
     width, offset_str = token.split('@')
 
@@ -374,9 +414,6 @@ def read_token_to_rpn_read_oag(chipset, token, raw_offsets, oa_format):
                 return "C " + str(idx - 48) + " READ"
             else:
                 return "{0} READ".format(read_value(chipset, offset, oa_format))
-        elif chipset in xe2_plus:
-            # FIXME: skip all metrics to retain just the registers
-                return "GPU_TIME 0 READ"
         else:
             # For Gen8+ the array of accumulated counters is
             # assumed to start with a GPU_TIME then GPU_CLOCK,
@@ -405,6 +442,9 @@ def read_token_to_rpn_read(chipset, token, raw_offsets, oa_format):
     if oa_format in ['192B_MPEC8LL_NOA16', '128B_MPEC8_NOA16']:
         return read_token_to_rpn_read_oam(chipset, token, raw_offsets, oa_format)
 
+    if oa_format in ['576B_PEC64LL']:
+        return read_token_to_rpn_read_pec(chipset, token, raw_offsets, oa_format)
+
     assert 0
 
 def replace_read_tokens_with_rpn_read_ops(chipset, oa_format, equation, raw_offsets):
@@ -905,6 +945,8 @@ for arg in args.xml:
                 mdapi_counter.set('NormalizationEquation', '$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV')
                 #mdapi_counter.set('DeltaReportReadEquation', '$GpuCoreClocks $GpuTime UDIV')
 
+            if mdapi_counter.get('SymbolName') == "ResultUncertainty":
+                continue
 
             symbol_name = oa_registry.Registry.sanitize_symbol_name(mdapi_counter.get('SymbolName'))
 
@@ -992,11 +1034,15 @@ for arg in args.xml:
             # XXX: As a special case, we override the raw and delta report
             # equations for the GpuTime counters, which seem inconsistent
             if mdapi_counter.get('SymbolName') == "GpuTime":
-                mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
-                if chipset == 'MTL' and oa_format != '256B_GENERIC_NOA16':
-                    mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                if oa_format == '576B_PEC64LL':
+                   mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                   mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
                 else:
-                    mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                   mdapi_counter.set('DeltaReportReadEquation', "qw@0x0 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                   if chipset == 'MTL' and oa_format != '256B_GENERIC_NOA16':
+                      mdapi_counter.set('SnapshotReportReadEquation', "qw@0x08 1000000000 UMUL $GpuTimestampFrequency UDIV")
+                   else:
+                      mdapi_counter.set('SnapshotReportReadEquation', "dw@0x04 1000000000 UMUL $GpuTimestampFrequency UDIV")
 
             availability = fixup_equation(mdapi_counter.get('AvailabilityEquation'))
             if availability == "":
diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
index c16177ec8e..f6f2768b00 100644
--- a/lib/xe/xe_oa.h
+++ b/lib/xe/xe_oa.h
@@ -275,6 +275,7 @@ struct intel_xe_perf_metric_set {
 	int b_offset;
 	int c_offset;
 	int perfcnt_offset;
+	int pec_offset;
 
 	const struct intel_xe_perf_register_prog *b_counter_regs;
 	uint32_t n_b_counter_regs;
-- 
2.41.0

