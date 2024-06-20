Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3EC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F910E14C;
	Thu, 20 Jun 2024 20:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPVBPPvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871FD10E884
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913659; x=1750449659;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ue/ELUADwN5BIPCAjsFJjVr3dHW/wHOAnZq4C8m5fts=;
 b=lPVBPPvBTF53H/wtuPP3jV+4ZCbOGWiJqdYs0ItMa6m4ibSFjZTSI9fQ
 rU6umouEE7BDdVl19vlpd/yjBDs2+XAY7zZ/mbcNDrtxVC04wOzDezCI2
 AlmDbC7XHqD20i9Ua0H/xxgnNFUL4MhThMXFmKpO0azQFMniMLgwsTfu+
 6GYU3HcV3cXCqfc7AdMWktMoJz/F4JRkqUtgttq1Muqa4BsTOSQtTs7V8
 Ox6Sy/4Os5HXiQrtWn0Qwo7b2Wv1UWND7lJosxpxcRMWuW3O1TYjViYYq
 dGNGqgBC6LVCyzdjpwb01QxoY0HDBGwk3zRDLMJg7nF5Sjy0Sc5BhePcx w==;
X-CSE-ConnectionGUID: WkTbrJiPT1KxDoKhJkxMOQ==
X-CSE-MsgGUID: TOU4bu8fTda9p2Ty7jI96Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329321"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
X-CSE-ConnectionGUID: +BpjS+7wSZG4g0Xfkx8nBw==
X-CSE-MsgGUID: H8gzoxJkTgub+te59kpROg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459839"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/28] lib/xe/oa: Generate LNL metrics/registers files
Date: Thu, 20 Jun 2024 13:00:30 -0700
Message-ID: <20240620200054.3550653-6-ashutosh.dixit@intel.com>
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

