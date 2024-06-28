Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1FDC3065A
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 20:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097C10E0C8;
	Fri, 28 Jun 2024 20:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoayD6Q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D939F10E0BB
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607435; x=1751143435;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fc5THwZc5kq9PjdfoK8OWHRdLG0vIyVWLWa9nzz83tE=;
 b=OoayD6Q9gd1S1oO8TU1fXXcpgoeBidIssq7CE+2PziSgCrjs2HrqpPBt
 JE6nPIVUlIGRwW8r59doqjTZbgPqwCe02r2wfgcJnMgCtqcOLKnw6ObQO
 krpD7bKhwZk0FqSdVHJkTPoPL0+NOarwkkrIW+VesRSUepEwfIRBc16Bx
 iR23SafQ5XqqC+0Zw5Q9p+6aVX/i70DzyUX6o2Obmt5NkzeeD83m6tlpB
 n43X0rAti+m4hHrPiI5VOwixVBU8pn10XAsjTzD+K084nanuNyf6xqyMC
 y/VdCRdQX/N6DGtVlOJ85ApAvBFbopWEZbXl5A7QNiKyjMzqKswKwWqFU A==;
X-CSE-ConnectionGUID: Z2kLgY/RRe+S40HWlQz7Hw==
X-CSE-MsgGUID: c7im5UGWT5GPeYGYx7IJ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27427485"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27427485"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:54 -0700
X-CSE-ConnectionGUID: 9Tshu2thQjuQncR+KqV/mw==
X-CSE-MsgGUID: wAq1dU+DTue35eIuL+3WNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49465199"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/16] lib/xe/oa: Generate LNL metrics/registers files
Date: Fri, 28 Jun 2024 13:43:37 -0700
Message-ID: <20240628204348.2142940-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
References: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

