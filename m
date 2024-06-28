Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF28C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CE010ED5B;
	Fri, 28 Jun 2024 22:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgfqLoHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D110E322
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719613445; x=1751149445;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fc5THwZc5kq9PjdfoK8OWHRdLG0vIyVWLWa9nzz83tE=;
 b=mgfqLoHCrK8G9hgVjl94R+e9+NHmQ2Cw7aw1HapAty+TPaEIsmEFsqAU
 TjMbPRPgeqREVgAOED1VPNerJti65Qy86JXr2zDz5SMzpHvr8hsx4WNSx
 1makgrjpkdbU+rbzlIKfk/sxATIjD2H1hdtdHwZLwAGwqXACZg4ZsUUh5
 B2EvwV32U7IDQJKzsgraFm8siGIqGc91F8p7JZY7EEI4w4q0cSHVO3XQm
 oSEMXixpJQscy1RC+34Mtc4sd1l+lN0dNkQk7zkBuHZg9h4z+bqtC6bII
 1A4+tG7bnG5SOQJiABTFcBNAcGG/OPW1EcTgFc5QpD+afIC5p2Qnv4pty Q==;
X-CSE-ConnectionGUID: 92E5Q33vR3aqlaDlNGvp1Q==
X-CSE-MsgGUID: D/V2cqOgS3+B+zoO6JU+Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42232684"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="42232684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 15:24:03 -0700
X-CSE-ConnectionGUID: HL1m/FBHQXOdusyfguovpQ==
X-CSE-MsgGUID: D+rAbvNwSDysVo5f6581iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45616198"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 15:24:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/16] lib/xe/oa: Generate LNL metrics/registers files
Date: Fri, 28 Jun 2024 15:23:47 -0700
Message-ID: <20240628222358.2151036-6-ashutosh.dixit@intel.com>
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

