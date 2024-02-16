Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4776C5475B
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388F10ED18;
	Fri, 16 Feb 2024 23:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSlTsN8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538A910ECEE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125433; x=1739661433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RUcsOgVX2JnMZCxWMjdOuHTYUizLblwfvorz8ZdFS/o=;
 b=SSlTsN8AjrLAEZldLvzNuCGQWF+vpr4z3JBFEYsxjBwmFt/NMoidDMUq
 0pGA7gOSG7K+1NvDJT+89UzKyI98BfHV/VbOLHLsCJP1YY0i7vHblEkje
 U3aImMzbur9lvFTlCugoPVHAlpQpVY2rxrd1hP19qvGMaL/2zrnGGJnXe
 UF+cb3IJLfeuJQ0uALFm4u6+TI+Ul3SkcvzZ6Ey6JB68uhVxY7hHkIZWX
 bWvL6Krv2WEkSaIlCDfl4TX4nYOOeC6bBQTcSqkmNTt6Qrz9GKgBNI+5J
 n1URQa9BFxVmafpPrJTWCN3jsitYXW3SJD7UOXWACbvmR7iSuaTtrL90c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724278"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724278"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626862"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 04/18] lib/xe/oa: Generate LNL metrics/registers files
Date: Fri, 16 Feb 2024 15:16:49 -0800
Message-ID: <20240216231703.845644-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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

Add LNL OA formats and generate metrics/registers .c and .h files with the
XE_OA_FORMAT_PEC64u64 format (called 576B_PEC64LL) used in
MetricsXML_P31.xml.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/oa-configs/oa-metricset-codegen.py | 53 +++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index be9483af02f7..3c4e870701d6 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -81,6 +81,40 @@ def generate_metric_sets(args, gen):
 #include <stdbool.h>
 #include <assert.h>
 
+enum xe_oa_format_name {
+	XE_OA_FORMAT_C4_B8 = 1,
+
+	/* Gen8+ */
+	XE_OA_FORMAT_A12,
+	XE_OA_FORMAT_A12_B8_C8,
+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
+
+	/* DG2 */
+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
+
+        /* DG2/MTL OAC */
+        XE_OAC_FORMAT_A24u64_B8_C8,
+        XE_OAC_FORMAT_A22u32_R2u32_B8_C8,
+
+	/* MTL OAM */
+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
+
+	/* Xe2+ */
+	XE_OA_FORMAT_PEC64u64,
+	XE_OA_FORMAT_PEC64u64_B8_C8,
+	XE_OA_FORMAT_PEC64u32,
+	XE_OA_FORMAT_PEC32u64_G1,
+	XE_OA_FORMAT_PEC32u32_G1,
+	XE_OA_FORMAT_PEC32u64_G2,
+	XE_OA_FORMAT_PEC32u32_G2,
+	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
+	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
+
+	XE_OA_FORMAT_MAX,
+};
+
         """))
 
     c("#include \"{0}\"".format(os.path.basename(args.header)))
@@ -116,7 +150,7 @@ def generate_metric_sets(args, gen):
         if gen.chipset.startswith("acm") or gen.chipset.startswith("mtl"):
             if set.oa_format == "128B_MPEC8_NOA16":
                 c(textwrap.dedent("""\
-                    metric_set->perf_oa_format = I915_OAM_FORMAT_MPEC8u32_B8_C8;
+                    metric_set->perf_oa_format = XE_OAM_FORMAT_MPEC8u32_B8_C8;
 
                     metric_set->perf_raw_size = 128;
                     metric_set->gpu_time_offset = 0;
@@ -128,7 +162,7 @@ def generate_metric_sets(args, gen):
                 """))
             else:
                 c(textwrap.dedent("""\
-                    metric_set->perf_oa_format = I915_OA_FORMAT_A24u40_A14u32_B8_C8;
+                    metric_set->perf_oa_format = XE_OA_FORMAT_A24u40_A14u32_B8_C8;
 
                     metric_set->perf_raw_size = 256;
                     metric_set->gpu_time_offset = 0;
@@ -138,9 +172,22 @@ def generate_metric_sets(args, gen):
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

