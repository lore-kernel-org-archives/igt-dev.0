Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4338C25B7D
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37AA10E0F6;
	Fri, 24 May 2024 03:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcBbgQVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F36810E15B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520490; x=1748056490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ue/ELUADwN5BIPCAjsFJjVr3dHW/wHOAnZq4C8m5fts=;
 b=FcBbgQVwDpePcSGYH9pW8OgbNfod29Z/W7Xw5FdpsS9XBe6ze+nLPclH
 KbdVPZJpgQOeavPnrQRGqF3OtY65/5jpkTmwAD/EUCU8VfjGqC/Vrrt0n
 YAOR/48D73mCe0rVaxlq3caA0H7VABC1C79AcHlZBSp76OCAtYHx4i/yr
 HZg69lIicUh9LeQ6rod0+1U17mghBtP4Znu9p2t6zjkSVX8zq44nDmrkS
 2Gl2ZMtXyb4g9VlSYzbDjK+f24/vJQesh9PBdl0lMhu983CL/fcP58RmY
 GOhrszS22w8WQKRKCZGpAud8/pCo95FVxj98NdGoQU2rlrsN0lPBjj3+M g==;
X-CSE-ConnectionGUID: sLMtBtWJQh6Mr7giPyl3YQ==
X-CSE-MsgGUID: OAiQbc8vSAyi4ezgzBp0tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384626"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: /yNF/4C0RVi3hOOn+9eZWA==
X-CSE-MsgGUID: nq1VdK6gR/+T1oZIs5Cm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413518"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/23] lib/xe/oa: Generate LNL metrics/registers files
Date: Thu, 23 May 2024 20:14:21 -0700
Message-ID: <20240524031439.106332-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
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

Generate metrics/registers .c and .h files with the XE_OA_FORMAT_PEC64u64
format (called 576B_PEC64LL) used in MetricsXML_P31.xml.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index be9483af02..ea0d13cc97 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -116,7 +116,7 @@ def generate_metric_sets(args, gen):
         if gen.chipset.startswith("acm") or gen.chipset.startswith("mtl"):
             if set.oa_format == "128B_MPEC8_NOA16":
                 c(textwrap.dedent("""\
-                    metric_set->perf_oa_format = I915_OAM_FORMAT_MPEC8u32_B8_C8;
+                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
 
                     metric_set->perf_raw_size = 128;
                     metric_set->gpu_time_offset = 0;
@@ -128,7 +128,7 @@ def generate_metric_sets(args, gen):
                 """))
             else:
                 c(textwrap.dedent("""\
-                    metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+                    metric_set->perf_oa_format = XE_OA_FORMAT_A24u40_A14u32_B8_C8;
 
                     metric_set->perf_raw_size = 256;
                     metric_set->gpu_time_offset = 0;
@@ -138,9 +138,22 @@ def generate_metric_sets(args, gen):
                     metric_set->c_offset = metric_set->b_offset + 8;
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
+        elif gen.chipset == "lnl":
+            c(textwrap.dedent("""\
+                metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
+
+                metric_set->perf_raw_size = 576;
+                metric_set->gpu_time_offset = 0;
+                metric_set->gpu_clock_offset = 1;
+                metric_set->a_offset = 2;
+                // metric_set->b_offset = metric_set->a_offset + 38;
+                // metric_set->c_offset = metric_set->b_offset + 8;
+                metric_set->perfcnt_offset = metric_set->a_offset + 64;
+
+            """))
         else:
             c(textwrap.dedent("""\
-                metric_set->perf_oa_format = I915_OA_FORMAT_A32u40_A4u32_B8_C8;
+                metric_set->perf_oa_format = XE_OA_FORMAT_A32u40_A4u32_B8_C8;
 
                 metric_set->perf_raw_size = 256;
                 metric_set->gpu_time_offset = 0;
-- 
2.41.0

